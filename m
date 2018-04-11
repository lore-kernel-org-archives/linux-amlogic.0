From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 11 Apr 2018 16:29:07 +0200
Subject: [PATCH v2 u-boot 3/3] phy: Add Amlogic Meson USB2 & USB3 Generic PHY
 drivers
In-Reply-To: <1523456947-4242-1-git-send-email-narmstrong@baylibre.com>
References: <1523456947-4242-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1523456947-4242-4-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Amlogic Meson GXL and GXM (simple variant) embeds up to 3 USB2 PHYs
and an USB3 PHY. This patch adds drivers for these for the standard generic
PHY interface and supports the power-on/off calls and set the Host mode by
default.
They are based on the excellent work from Martin Blumenstingl merged in linux.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/phy/Kconfig          |   8 ++
 drivers/phy/Makefile         |   1 +
 drivers/phy/meson-gxl-usb2.c | 238 +++++++++++++++++++++++++++++++++++++++++++
 drivers/phy/meson-gxl-usb3.c | 201 ++++++++++++++++++++++++++++++++++++
 4 files changed, 448 insertions(+)
 create mode 100644 drivers/phy/meson-gxl-usb2.c
 create mode 100644 drivers/phy/meson-gxl-usb3.c

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 3b9a09c..99a6d95 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -85,4 +85,12 @@ config STI_USB_PHY
 	  used by USB2 and USB3 Host controllers available on
 	  STiH407 SoC families.
 
+config MESON_GXL_USB_PHY
+	bool "Amlogic Meson GXL USB PHYs"
+	depends on PHY && ARCH_MESON && MESON_GXL
+	imply REGMAP
+	help
+	  This is the generic phy driver for the Amlogic Meson GXL
+	  USB2 and USB3 PHYS.
+
 endmenu
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index 668040b..6c1610e 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_$(SPL_)NOP_PHY) += nop-phy.o
 obj-$(CONFIG_PHY_SANDBOX) += sandbox-phy.o
 obj-$(CONFIG_$(SPL_)PIPE3_PHY) += ti-pipe3-phy.o
 obj-$(CONFIG_STI_USB_PHY) += sti_usb_phy.o
+obj-$(CONFIG_MESON_GXL_USB_PHY) += meson-gxl-usb2.o meson-gxl-usb3.o
diff --git a/drivers/phy/meson-gxl-usb2.c b/drivers/phy/meson-gxl-usb2.c
new file mode 100644
index 0000000..15c9c89
--- /dev/null
+++ b/drivers/phy/meson-gxl-usb2.c
@@ -0,0 +1,238 @@
+/*
+ * Meson GXL and GXM USB2 PHY driver
+ *
+ * Copyright (C) 2017 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+ * Copyright (C) 2018 BayLibre, SAS
+ * Author: Neil Armstrong <narmstron@baylibre.com>
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#include <common.h>
+#include <asm/io.h>
+#include <bitfield.h>
+#include <dm.h>
+#include <errno.h>
+#include <generic-phy.h>
+#include <regmap.h>
+#include <power/regulator.h>
+#include <clk.h>
+
+#include <linux/bitops.h>
+#include <linux/compat.h>
+
+DECLARE_GLOBAL_DATA_PTR;
+
+/* bits [31:27] are read-only */
+#define U2P_R0							0x0
+	#define U2P_R0_BYPASS_SEL				BIT(0)
+	#define U2P_R0_BYPASS_DM_EN				BIT(1)
+	#define U2P_R0_BYPASS_DP_EN				BIT(2)
+	#define U2P_R0_TXBITSTUFF_ENH				BIT(3)
+	#define U2P_R0_TXBITSTUFF_EN				BIT(4)
+	#define U2P_R0_DM_PULLDOWN				BIT(5)
+	#define U2P_R0_DP_PULLDOWN				BIT(6)
+	#define U2P_R0_DP_VBUS_VLD_EXT_SEL			BIT(7)
+	#define U2P_R0_DP_VBUS_VLD_EXT				BIT(8)
+	#define U2P_R0_ADP_PRB_EN				BIT(9)
+	#define U2P_R0_ADP_DISCHARGE				BIT(10)
+	#define U2P_R0_ADP_CHARGE				BIT(11)
+	#define U2P_R0_DRV_VBUS					BIT(12)
+	#define U2P_R0_ID_PULLUP				BIT(13)
+	#define U2P_R0_LOOPBACK_EN_B				BIT(14)
+	#define U2P_R0_OTG_DISABLE				BIT(15)
+	#define U2P_R0_COMMON_ONN				BIT(16)
+	#define U2P_R0_FSEL_MASK				GENMASK(19, 17)
+	#define U2P_R0_REF_CLK_SEL_MASK				GENMASK(21, 20)
+	#define U2P_R0_POWER_ON_RESET				BIT(22)
+	#define U2P_R0_V_ATE_TEST_EN_B_MASK			GENMASK(24, 23)
+	#define U2P_R0_ID_SET_ID_DQ				BIT(25)
+	#define U2P_R0_ATE_RESET				BIT(26)
+	#define U2P_R0_FSV_MINUS				BIT(27)
+	#define U2P_R0_FSV_PLUS					BIT(28)
+	#define U2P_R0_BYPASS_DM_DATA				BIT(29)
+	#define U2P_R0_BYPASS_DP_DATA				BIT(30)
+
+#define U2P_R1							0x4
+	#define U2P_R1_BURN_IN_TEST				BIT(0)
+	#define U2P_R1_ACA_ENABLE				BIT(1)
+	#define U2P_R1_DCD_ENABLE				BIT(2)
+	#define U2P_R1_VDAT_SRC_EN_B				BIT(3)
+	#define U2P_R1_VDAT_DET_EN_B				BIT(4)
+	#define U2P_R1_CHARGES_SEL				BIT(5)
+	#define U2P_R1_TX_PREEMP_PULSE_TUNE			BIT(6)
+	#define U2P_R1_TX_PREEMP_AMP_TUNE_MASK			GENMASK(8, 7)
+	#define U2P_R1_TX_RES_TUNE_MASK				GENMASK(10, 9)
+	#define U2P_R1_TX_RISE_TUNE_MASK			GENMASK(12, 11)
+	#define U2P_R1_TX_VREF_TUNE_MASK			GENMASK(16, 13)
+	#define U2P_R1_TX_FSLS_TUNE_MASK			GENMASK(20, 17)
+	#define U2P_R1_TX_HSXV_TUNE_MASK			GENMASK(22, 21)
+	#define U2P_R1_OTG_TUNE_MASK				GENMASK(25, 23)
+	#define U2P_R1_SQRX_TUNE_MASK				GENMASK(28, 26)
+	#define U2P_R1_COMP_DIS_TUNE_MASK			GENMASK(31, 29)
+
+/* bits [31:14] are read-only */
+#define U2P_R2							0x8
+	#define U2P_R2_TESTDATA_IN_MASK				GENMASK(7, 0)
+	#define U2P_R2_TESTADDR_MASK				GENMASK(11, 8)
+	#define U2P_R2_TESTDATA_OUT_SEL				BIT(12)
+	#define U2P_R2_TESTCLK					BIT(13)
+	#define U2P_R2_TESTDATA_OUT_MASK			GENMASK(17, 14)
+	#define U2P_R2_ACA_PIN_RANGE_C				BIT(18)
+	#define U2P_R2_ACA_PIN_RANGE_B				BIT(19)
+	#define U2P_R2_ACA_PIN_RANGE_A				BIT(20)
+	#define U2P_R2_ACA_PIN_GND				BIT(21)
+	#define U2P_R2_ACA_PIN_FLOAT				BIT(22)
+	#define U2P_R2_CHARGE_DETECT				BIT(23)
+	#define U2P_R2_DEVICE_SESSION_VALID			BIT(24)
+	#define U2P_R2_ADP_PROBE				BIT(25)
+	#define U2P_R2_ADP_SENSE				BIT(26)
+	#define U2P_R2_SESSION_END				BIT(27)
+	#define U2P_R2_VBUS_VALID				BIT(28)
+	#define U2P_R2_B_VALID					BIT(29)
+	#define U2P_R2_A_VALID					BIT(30)
+	#define U2P_R2_ID_DIG					BIT(31)
+
+#define U2P_R3							0xc
+
+#define RESET_COMPLETE_TIME				500
+
+struct phy_meson_gxl_usb2_priv {
+	struct regmap		*regmap;
+#if CONFIG_IS_ENABLED(DM_REGULATOR)
+	struct udevice		*phy_supply;
+#endif
+#if CONFIG_IS_ENABLED(CLK)
+	struct clk		clk;
+#endif
+};
+
+static void phy_meson_gxl_usb2_reset(struct phy_meson_gxl_usb2_priv *priv)
+{
+	uint val;
+
+	regmap_read(priv->regmap, U2P_R0, &val);
+
+	/* reset the PHY and wait until settings are stabilized */
+	val |= U2P_R0_POWER_ON_RESET;
+	regmap_write(priv->regmap, U2P_R0, val);
+	udelay(RESET_COMPLETE_TIME);
+
+	val &= ~U2P_R0_POWER_ON_RESET;
+	regmap_write(priv->regmap, U2P_R0, val);
+	udelay(RESET_COMPLETE_TIME);
+}
+
+static void
+phy_meson_gxl_usb2_set_host_mode(struct phy_meson_gxl_usb2_priv *priv)
+{
+	uint val;
+
+	regmap_read(priv->regmap, U2P_R0, &val);
+	val |= U2P_R0_DM_PULLDOWN;
+	val |= U2P_R0_DP_PULLDOWN;
+	val &= ~U2P_R0_ID_PULLUP;
+	regmap_write(priv->regmap, U2P_R0, val);
+
+	phy_meson_gxl_usb2_reset(priv);
+}
+
+static int phy_meson_gxl_usb2_power_on(struct phy *phy)
+{
+	struct udevice *dev = phy->dev;
+	struct phy_meson_gxl_usb2_priv *priv = dev_get_priv(dev);
+	uint val;
+
+	regmap_read(priv->regmap, U2P_R0, &val);
+	/* power on the PHY by taking it out of reset mode */
+	val &= ~U2P_R0_POWER_ON_RESET;
+	regmap_write(priv->regmap, U2P_R0, val);
+
+	phy_meson_gxl_usb2_set_host_mode(priv);
+
+#if CONFIG_IS_ENABLED(DM_REGULATOR)
+	if (priv->phy_supply) {
+		int ret = regulator_set_enable(priv->phy_supply, true);
+		if (ret)
+			return ret;
+	}
+#endif
+
+	return 0;
+}
+
+static int phy_meson_gxl_usb2_power_off(struct phy *phy)
+{
+	struct udevice *dev = phy->dev;
+	struct phy_meson_gxl_usb2_priv *priv = dev_get_priv(dev);
+	uint val;
+
+	regmap_read(priv->regmap, U2P_R0, &val);
+	/* power off the PHY by putting it into reset mode */
+	val |= U2P_R0_POWER_ON_RESET;
+	regmap_write(priv->regmap, U2P_R0, val);
+
+#if CONFIG_IS_ENABLED(DM_REGULATOR)
+	if (priv->phy_supply) {
+		int ret = regulator_set_enable(priv->phy_supply, false);
+		if (ret) {
+			pr_err("Error disabling PHY supply\n");
+			return ret;
+		}
+	}
+#endif
+
+	return 0;
+}
+
+struct phy_ops meson_gxl_usb2_phy_ops = {
+	.power_on = phy_meson_gxl_usb2_power_on,
+	.power_off = phy_meson_gxl_usb2_power_off,
+};
+
+int meson_gxl_usb2_phy_probe(struct udevice *dev)
+{
+	struct phy_meson_gxl_usb2_priv *priv = dev_get_priv(dev);
+	int ret;
+
+	ret = regmap_init_mem(dev, &priv->regmap);
+	if (ret)
+		return ret;
+
+#if CONFIG_IS_ENABLED(CLK)
+	ret = clk_get_by_index(dev, 0, &priv->clk);
+	if (ret < 0)
+		return ret;
+
+	ret = clk_enable(&priv->clk);
+	if (ret && ret != -ENOSYS && ret != -ENOTSUPP) {
+		pr_err("failed to enable PHY clock\n");
+		clk_free(&priv->clk);
+		return ret;
+	}
+#endif
+
+#if CONFIG_IS_ENABLED(DM_REGULATOR)
+	ret = device_get_supply_regulator(dev, "phy-supply", &priv->phy_supply);
+	if (ret && ret != -ENOENT) {
+		pr_err("Failed to get PHY regulator\n");
+		return ret;
+	}
+#endif
+
+	return 0;
+}
+
+static const struct udevice_id meson_gxl_usb2_phy_ids[] = {
+	{ .compatible = "amlogic,meson-gxl-usb2-phy" },
+	{ }
+};
+
+U_BOOT_DRIVER(meson_gxl_usb2_phy) = {
+	.name = "meson_gxl_usb2_phy",
+	.id = UCLASS_PHY,
+	.of_match = meson_gxl_usb2_phy_ids,
+	.probe = meson_gxl_usb2_phy_probe,
+	.ops = &meson_gxl_usb2_phy_ops,
+	.priv_auto_alloc_size = sizeof(struct phy_meson_gxl_usb2_priv),
+};
diff --git a/drivers/phy/meson-gxl-usb3.c b/drivers/phy/meson-gxl-usb3.c
new file mode 100644
index 0000000..a385fbd
--- /dev/null
+++ b/drivers/phy/meson-gxl-usb3.c
@@ -0,0 +1,201 @@
+/*
+ * Meson GXL USB3 PHY driver
+ *
+ * Copyright (C) 2018 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+ * Copyright (C) 2018 BayLibre, SAS
+ * Author: Neil Armstrong <narmstron@baylibre.com>
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#include <common.h>
+#include <asm/io.h>
+#include <bitfield.h>
+#include <dm.h>
+#include <errno.h>
+#include <generic-phy.h>
+#include <regmap.h>
+#include <clk.h>
+
+#include <linux/bitops.h>
+#include <linux/compat.h>
+#include <linux/bitfield.h>
+
+DECLARE_GLOBAL_DATA_PTR;
+
+#define USB_R0							0x00
+	#define USB_R0_P30_FSEL_MASK				GENMASK(5, 0)
+	#define USB_R0_P30_PHY_RESET				BIT(6)
+	#define USB_R0_P30_TEST_POWERDOWN_HSP			BIT(7)
+	#define USB_R0_P30_TEST_POWERDOWN_SSP			BIT(8)
+	#define USB_R0_P30_ACJT_LEVEL_MASK			GENMASK(13, 9)
+	#define USB_R0_P30_TX_BOOST_LEVEL_MASK			GENMASK(16, 14)
+	#define USB_R0_P30_LANE0_TX2RX_LOOPBACK			BIT(17)
+	#define USB_R0_P30_LANE0_EXT_PCLK_REQ			BIT(18)
+	#define USB_R0_P30_PCS_RX_LOS_MASK_VAL_MASK		GENMASK(28, 19)
+	#define USB_R0_U2D_SS_SCALEDOWN_MODE_MASK		GENMASK(30, 29)
+	#define USB_R0_U2D_ACT					BIT(31)
+
+#define USB_R1							0x04
+	#define USB_R1_U3H_BIGENDIAN_GS				BIT(0)
+	#define USB_R1_U3H_PME_ENABLE				BIT(1)
+	#define USB_R1_U3H_HUB_PORT_OVERCURRENT_MASK		GENMASK(6, 2)
+	#define USB_R1_U3H_HUB_PORT_PERM_ATTACH_MASK		GENMASK(11, 7)
+	#define USB_R1_U3H_HOST_U2_PORT_DISABLE_MASK		GENMASK(15, 12)
+	#define USB_R1_U3H_HOST_U3_PORT_DISABLE			BIT(16)
+	#define USB_R1_U3H_HOST_PORT_POWER_CONTROL_PRESENT	BIT(17)
+	#define USB_R1_U3H_HOST_MSI_ENABLE			BIT(18)
+	#define USB_R1_U3H_FLADJ_30MHZ_REG_MASK			GENMASK(24, 19)
+	#define USB_R1_P30_PCS_TX_SWING_FULL_MASK		GENMASK(31, 25)
+
+#define USB_R2							0x08
+	#define USB_R2_P30_CR_DATA_IN_MASK			GENMASK(15, 0)
+	#define USB_R2_P30_CR_READ				BIT(16)
+	#define USB_R2_P30_CR_WRITE				BIT(17)
+	#define USB_R2_P30_CR_CAP_ADDR				BIT(18)
+	#define USB_R2_P30_CR_CAP_DATA				BIT(19)
+	#define USB_R2_P30_PCS_TX_DEEMPH_3P5DB_MASK		GENMASK(25, 20)
+	#define USB_R2_P30_PCS_TX_DEEMPH_6DB_MASK		GENMASK(31, 26)
+
+#define USB_R3							0x0c
+	#define USB_R3_P30_SSC_ENABLE				BIT(0)
+	#define USB_R3_P30_SSC_RANGE_MASK			GENMASK(3, 1)
+	#define USB_R3_P30_SSC_REF_CLK_SEL_MASK			GENMASK(12, 4)
+	#define USB_R3_P30_REF_SSP_EN				BIT(13)
+	#define USB_R3_P30_LOS_BIAS_MASK			GENMASK(18, 16)
+	#define USB_R3_P30_LOS_LEVEL_MASK			GENMASK(23, 19)
+	#define USB_R3_P30_MPLL_MULTIPLIER_MASK			GENMASK(30, 24)
+
+#define USB_R4							0x10
+	#define USB_R4_P21_PORT_RESET_0				BIT(0)
+	#define USB_R4_P21_SLEEP_M0				BIT(1)
+	#define USB_R4_MEM_PD_MASK				GENMASK(3, 2)
+	#define USB_R4_P21_ONLY					BIT(4)
+
+#define USB_R5							0x14
+	#define USB_R5_ID_DIG_SYNC				BIT(0)
+	#define USB_R5_ID_DIG_REG				BIT(1)
+	#define USB_R5_ID_DIG_CFG_MASK				GENMASK(3, 2)
+	#define USB_R5_ID_DIG_EN_0				BIT(4)
+	#define USB_R5_ID_DIG_EN_1				BIT(5)
+	#define USB_R5_ID_DIG_CURR				BIT(6)
+	#define USB_R5_ID_DIG_IRQ				BIT(7)
+	#define USB_R5_ID_DIG_TH_MASK				GENMASK(15, 8)
+	#define USB_R5_ID_DIG_CNT_MASK				GENMASK(23, 16)
+
+/* read-only register */
+#define USB_R6							0x18
+	#define USB_R6_P30_CR_DATA_OUT_MASK			GENMASK(15, 0)
+	#define USB_R6_P30_CR_ACK				BIT(16)
+
+struct phy_meson_gxl_usb3_priv {
+	struct regmap		*regmap;
+#if CONFIG_IS_ENABLED(CLK)
+	struct clk		clk;
+#endif
+};
+
+static int
+phy_meson_gxl_usb3_set_host_mode(struct phy_meson_gxl_usb3_priv *priv)
+{
+	uint val;
+
+	regmap_read(priv->regmap, USB_R0, &val);
+	val &= ~USB_R0_U2D_ACT;
+	regmap_write(priv->regmap, USB_R0, val);
+
+	regmap_read(priv->regmap, USB_R4, &val);
+	val &= ~USB_R4_P21_SLEEP_M0;
+	regmap_write(priv->regmap, USB_R4, val);
+
+	return 0;
+}
+
+static int phy_meson_gxl_usb3_power_on(struct phy *phy)
+{
+	struct udevice *dev = phy->dev;
+	struct phy_meson_gxl_usb3_priv *priv = dev_get_priv(dev);
+	uint val;
+
+	regmap_read(priv->regmap, USB_R5, &val);
+	val |= USB_R5_ID_DIG_EN_0;
+	val |= USB_R5_ID_DIG_EN_1;
+	val &= ~USB_R5_ID_DIG_TH_MASK;
+	val |= FIELD_PREP(USB_R5_ID_DIG_TH_MASK, 0xff);
+	regmap_write(priv->regmap, USB_R5, val);
+
+	return phy_meson_gxl_usb3_set_host_mode(priv);
+}
+
+static int phy_meson_gxl_usb3_power_off(struct phy *phy)
+{
+	struct udevice *dev = phy->dev;
+	struct phy_meson_gxl_usb3_priv *priv = dev_get_priv(dev);
+	uint val;
+
+	regmap_read(priv->regmap, USB_R5, &val);
+	val &= ~USB_R5_ID_DIG_EN_0;
+	val &= ~USB_R5_ID_DIG_EN_1;
+	regmap_write(priv->regmap, USB_R5, val);
+
+	return 0;
+}
+
+static int phy_meson_gxl_usb3_init(struct phy *phy)
+{
+	struct udevice *dev = phy->dev;
+	struct phy_meson_gxl_usb3_priv *priv = dev_get_priv(dev);
+	uint val;
+
+	regmap_read(priv->regmap, USB_R1, &val);
+	val &= ~USB_R1_U3H_FLADJ_30MHZ_REG_MASK;
+	val |= FIELD_PREP(USB_R1_U3H_FLADJ_30MHZ_REG_MASK, 0x20);
+	regmap_write(priv->regmap, USB_R1, val);
+
+	return 0;
+}
+
+struct phy_ops meson_gxl_usb3_phy_ops = {
+	.init = phy_meson_gxl_usb3_init,
+	.power_on = phy_meson_gxl_usb3_power_on,
+	.power_off = phy_meson_gxl_usb3_power_off,
+};
+
+int meson_gxl_usb3_phy_probe(struct udevice *dev)
+{
+	struct phy_meson_gxl_usb3_priv *priv = dev_get_priv(dev);
+	int ret;
+
+	ret = regmap_init_mem(dev, &priv->regmap);
+	if (ret)
+		return ret;
+	
+#if CONFIG_IS_ENABLED(CLK)
+	ret = clk_get_by_index(dev, 0, &priv->clk);
+	if (ret < 0)
+		return ret;
+
+	ret = clk_enable(&priv->clk);
+	if (ret && ret != -ENOSYS && ret != -ENOTSUPP) {
+		pr_err("failed to enable PHY clock\n");
+		clk_free(&priv->clk);
+		return ret;
+	}
+#endif
+
+	return 0;
+}
+
+static const struct udevice_id meson_gxl_usb3_phy_ids[] = {
+	{ .compatible = "amlogic,meson-gxl-usb3-phy" },
+	{ }
+};
+
+U_BOOT_DRIVER(meson_gxl_usb3_phy) = {
+	.name = "meson_gxl_usb3_phy",
+	.id = UCLASS_PHY,
+	.of_match = meson_gxl_usb3_phy_ids,
+	.probe = meson_gxl_usb3_phy_probe,
+	.ops = &meson_gxl_usb3_phy_ops,
+	.priv_auto_alloc_size = sizeof(struct phy_meson_gxl_usb3_priv),
+};
-- 
2.7.4
