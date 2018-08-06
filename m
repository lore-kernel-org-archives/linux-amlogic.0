From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon,  6 Aug 2018 14:49:19 +0200
Subject: [PATCH v2 u-boot 1/2] power: domain: Add the VPU Power Domain driver
In-Reply-To: <1533559760-32136-1-git-send-email-narmstrong@baylibre.com>
References: <1533559760-32136-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1533559760-32136-2-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Amlogic Meson SoCs embeds a specific Power Domain dedicated to the
Video Processing Unit.
This patch implements support for this power domain in preparation of the
future support for the Video display support in U-Boot.

This driver will depend on changes in the clock driver to handle the setup
of the VPU and VAPB clocks configured from DT using assigned-clocks entries.

Reviewed-by: Simon Glass <sjg@chromium.org>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/power/domain/Kconfig             |   7 ++
 drivers/power/domain/Makefile            |   1 +
 drivers/power/domain/meson-gx-pwrc-vpu.c | 198 +++++++++++++++++++++++++++++++
 3 files changed, 206 insertions(+)
 create mode 100644 drivers/power/domain/meson-gx-pwrc-vpu.c

diff --git a/drivers/power/domain/Kconfig b/drivers/power/domain/Kconfig
index 7cfa761..4618847 100644
--- a/drivers/power/domain/Kconfig
+++ b/drivers/power/domain/Kconfig
@@ -16,6 +16,13 @@ config BCM6328_POWER_DOMAIN
 	  Enable support for manipulating BCM6345 power domains via MMIO
 	  mapped registers.
 
+config MESON_GX_VPU_POWER_DOMAIN
+	bool "Enable Amlogic Meson GX VPU power domain driver"
+	depends on ARCH_MESON
+	help
+	  Enable support for manipulating Amlogic Meson GX Video Processing
+	  Unit power domain.
+
 config SANDBOX_POWER_DOMAIN
 	bool "Enable the sandbox power domain test driver"
 	depends on POWER_DOMAIN && SANDBOX
diff --git a/drivers/power/domain/Makefile b/drivers/power/domain/Makefile
index c7d7644..4a3282b 100644
--- a/drivers/power/domain/Makefile
+++ b/drivers/power/domain/Makefile
@@ -4,6 +4,7 @@
 
 obj-$(CONFIG_POWER_DOMAIN) += power-domain-uclass.o
 obj-$(CONFIG_BCM6328_POWER_DOMAIN) += bcm6328-power-domain.o
+obj-$(CONFIG_MESON_GX_VPU_POWER_DOMAIN) += meson-gx-pwrc-vpu.o
 obj-$(CONFIG_SANDBOX_POWER_DOMAIN) += sandbox-power-domain.o
 obj-$(CONFIG_SANDBOX_POWER_DOMAIN) += sandbox-power-domain-test.o
 obj-$(CONFIG_TEGRA186_POWER_DOMAIN) += tegra186-power-domain.o
diff --git a/drivers/power/domain/meson-gx-pwrc-vpu.c b/drivers/power/domain/meson-gx-pwrc-vpu.c
new file mode 100644
index 0000000..d631d3e
--- /dev/null
+++ b/drivers/power/domain/meson-gx-pwrc-vpu.c
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Amlogic Meson VPU Power Domain Controller driver
+ *
+ * Copyright (c) 2018 BayLibre, SAS.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include <common.h>
+#include <dm.h>
+#include <power-domain-uclass.h>
+#include <regmap.h>
+#include <syscon.h>
+#include <reset.h>
+#include <clk.h>
+
+/* AO Offsets */
+
+#define AO_RTI_GEN_PWR_SLEEP0		(0x3a << 2)
+
+#define GEN_PWR_VPU_HDMI		BIT(8)
+#define GEN_PWR_VPU_HDMI_ISO		BIT(9)
+
+/* HHI Offsets */
+
+#define HHI_MEM_PD_REG0			(0x40 << 2)
+#define HHI_VPU_MEM_PD_REG0		(0x41 << 2)
+#define HHI_VPU_MEM_PD_REG1		(0x42 << 2)
+
+struct meson_gx_pwrc_vpu_priv {
+	struct regmap *regmap_ao;
+	struct regmap *regmap_hhi;
+	struct reset_ctl_bulk resets;
+	struct clk_bulk clks;
+};
+
+static int meson_gx_pwrc_vpu_request(struct power_domain *power_domain)
+{
+	return 0;
+}
+
+static int meson_gx_pwrc_vpu_free(struct power_domain *power_domain)
+{
+	return 0;
+}
+
+static int meson_gx_pwrc_vpu_on(struct power_domain *power_domain)
+{
+	struct meson_gx_pwrc_vpu_priv *priv = dev_get_priv(power_domain->dev);
+	int i, ret;
+
+	regmap_update_bits(priv->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
+			   GEN_PWR_VPU_HDMI, 0);
+	udelay(20);
+
+	/* Power Up Memories */
+	for (i = 0; i < 32; i += 2) {
+		regmap_update_bits(priv->regmap_hhi, HHI_VPU_MEM_PD_REG0,
+				   0x3 << i, 0);
+		udelay(5);
+	}
+
+	for (i = 0; i < 32; i += 2) {
+		regmap_update_bits(priv->regmap_hhi, HHI_VPU_MEM_PD_REG1,
+				   0x3 << i, 0);
+		udelay(5);
+	}
+
+	for (i = 8; i < 16; i++) {
+		regmap_update_bits(priv->regmap_hhi, HHI_MEM_PD_REG0,
+				   BIT(i), 0);
+		udelay(5);
+	}
+	udelay(20);
+
+	ret = reset_assert_bulk(&priv->resets);
+	if (ret)
+		return ret;
+
+	regmap_update_bits(priv->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
+			   GEN_PWR_VPU_HDMI_ISO, 0);
+
+	ret = reset_deassert_bulk(&priv->resets);
+	if (ret)
+		return ret;
+
+	ret = clk_enable_bulk(&priv->clks);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int meson_gx_pwrc_vpu_off(struct power_domain *power_domain)
+{
+	struct meson_gx_pwrc_vpu_priv *priv = dev_get_priv(power_domain->dev);
+	int i;
+
+	regmap_update_bits(priv->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
+			   GEN_PWR_VPU_HDMI_ISO, GEN_PWR_VPU_HDMI_ISO);
+	udelay(20);
+
+	/* Power Down Memories */
+	for (i = 0; i < 32; i += 2) {
+		regmap_update_bits(priv->regmap_hhi, HHI_VPU_MEM_PD_REG0,
+				   0x3 << i, 0x3 << i);
+		udelay(5);
+	}
+	for (i = 0; i < 32; i += 2) {
+		regmap_update_bits(priv->regmap_hhi, HHI_VPU_MEM_PD_REG1,
+				   0x3 << i, 0x3 << i);
+		udelay(5);
+	}
+	for (i = 8; i < 16; i++) {
+		regmap_update_bits(priv->regmap_hhi, HHI_MEM_PD_REG0,
+				   BIT(i), BIT(i));
+		udelay(5);
+	}
+	udelay(20);
+
+	regmap_update_bits(priv->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
+			   GEN_PWR_VPU_HDMI, GEN_PWR_VPU_HDMI);
+	mdelay(20);
+
+	clk_disable_bulk(&priv->clks);
+
+	return 0;
+}
+
+static int meson_gx_pwrc_vpu_of_xlate(struct power_domain *power_domain,
+				      struct ofnode_phandle_args *args)
+{
+	/* #power-domain-cells is 0 */
+
+	if (args->args_count != 0) {
+		debug("Invalid args_count: %d\n", args->args_count);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+struct power_domain_ops meson_gx_pwrc_vpu_ops = {
+	.free = meson_gx_pwrc_vpu_free,
+	.off = meson_gx_pwrc_vpu_off,
+	.on = meson_gx_pwrc_vpu_on,
+	.request = meson_gx_pwrc_vpu_request,
+	.of_xlate = meson_gx_pwrc_vpu_of_xlate,
+};
+
+static const struct udevice_id meson_gx_pwrc_vpu_ids[] = {
+	{ .compatible = "amlogic,meson-gx-pwrc-vpu" },
+	{ }
+};
+
+static int meson_gx_pwrc_vpu_probe(struct udevice *dev)
+{
+	struct meson_gx_pwrc_vpu_priv *priv = dev_get_priv(dev);
+	u32 hhi_phandle;
+	ofnode hhi_node;
+	int ret;
+
+	priv->regmap_ao = syscon_node_to_regmap(dev_get_parent(dev)->node);
+	if (IS_ERR(priv->regmap_ao))
+		return PTR_ERR(priv->regmap_ao);
+
+	ret = ofnode_read_u32(dev->node, "amlogic,hhi-sysctrl",
+			      &hhi_phandle);
+	if (ret)
+		return ret;
+
+	hhi_node = ofnode_get_by_phandle(hhi_phandle);
+	if (!ofnode_valid(hhi_node))
+		return -EINVAL;
+
+	priv->regmap_hhi = syscon_node_to_regmap(hhi_node);
+	if (IS_ERR(priv->regmap_hhi))
+		return PTR_ERR(priv->regmap_hhi);
+
+	ret = reset_get_bulk(dev, &priv->resets);
+	if (ret)
+		return ret;
+
+	ret = clk_get_bulk(dev, &priv->clks);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+U_BOOT_DRIVER(meson_gx_pwrc_vpu) = {
+	.name = "meson_gx_pwrc_vpu",
+	.id = UCLASS_POWER_DOMAIN,
+	.of_match = meson_gx_pwrc_vpu_ids,
+	.probe = meson_gx_pwrc_vpu_probe,
+	.ops = &meson_gx_pwrc_vpu_ops,
+	.priv_auto_alloc_size = sizeof(struct meson_gx_pwrc_vpu_priv),
+};
-- 
2.7.4
