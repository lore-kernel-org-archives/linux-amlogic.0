From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 29 Mar 2018 14:55:25 +0200
Subject: [PATCH u-boot] reset: Add Amlogic Meson Reset Controller
Message-ID: <1522328125-13670-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Amlogic Meson SoCs embeds up to 256 reset lines, add the corresponding
driver.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/reset/Kconfig       |  8 ++++
 drivers/reset/Makefile      |  1 +
 drivers/reset/reset-meson.c | 90 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 99 insertions(+)
 create mode 100644 drivers/reset/reset-meson.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 3964b9e..fffa41e 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -83,4 +83,12 @@ config RESET_ROCKCHIP
 	  though is that some reset signals, like I2C or MISC reset multiple
 	  devices.
 
+config RESET_MESON
+	bool "Reset controller driver for Amlogic Meson SoCs"
+	depends on DM_RESET && ARCH_MESON
+	imply REGMAP
+	default y
+	help
+	  Support for reset controller on Amlogic Meson SoC.
+
 endmenu
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 7d7e080..d1d5146 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -13,3 +13,4 @@ obj-$(CONFIG_RESET_BCM6345) += reset-bcm6345.o
 obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
 obj-$(CONFIG_AST2500_RESET) += ast2500-reset.o
 obj-$(CONFIG_RESET_ROCKCHIP) += reset-rockchip.o
+obj-$(CONFIG_RESET_MESON) += reset-meson.o
diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
new file mode 100644
index 0000000..5324f86
--- /dev/null
+++ b/drivers/reset/reset-meson.c
@@ -0,0 +1,90 @@
+/*
+ * Amlogic Meson Reset Controller driver
+ *
+ * Copyright (c) 2018 BayLibre, SAS.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ */
+
+#include <common.h>
+#include <dm.h>
+#include <reset-uclass.h>
+#include <regmap.h>
+
+#define REG_COUNT	8
+#define BITS_PER_REG	32
+#define LEVEL_OFFSET	0x7c
+
+struct meson_reset_priv {
+	struct regmap *regmap;
+};
+
+static int meson_reset_request(struct reset_ctl *reset_ctl)
+{
+	if (reset_ctl->id > (REG_COUNT * BITS_PER_REG))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int meson_reset_free(struct reset_ctl *reset_ctl)
+{
+	return 0;
+}
+
+static int meson_reset_level(struct reset_ctl *reset_ctl, bool assert)
+{
+	struct meson_reset_priv *priv = dev_get_priv(reset_ctl->dev);
+	uint bank = reset_ctl->id / BITS_PER_REG;
+	uint offset = reset_ctl->id % BITS_PER_REG;
+	uint reg_offset = LEVEL_OFFSET + (bank << 2);
+	uint val;
+
+	regmap_read(priv->regmap, reg_offset, &val);
+	if (assert)
+		val &= ~BIT(offset);
+	else
+		val |= BIT(offset);
+	regmap_write(priv->regmap, reg_offset, val);
+
+	return 0;
+}
+
+static int meson_reset_assert(struct reset_ctl *reset_ctl)
+{
+	return meson_reset_level(reset_ctl, true);
+}
+
+static int meson_reset_deassert(struct reset_ctl *reset_ctl)
+{
+	return meson_reset_level(reset_ctl, false);
+}
+
+struct reset_ops meson_reset_ops = {
+	.request = meson_reset_request,
+	.free = meson_reset_free,
+	.rst_assert = meson_reset_assert,
+	.rst_deassert = meson_reset_deassert,
+};
+
+static const struct udevice_id meson_reset_ids[] = {                          
+	{ .compatible = "amlogic,meson-gxbb-reset" },                                  
+	{ }                                                                     
+};  
+
+static int meson_reset_probe(struct udevice *dev)
+{
+	struct meson_reset_priv *priv = dev_get_priv(dev);
+	
+	return regmap_init_mem(dev, &priv->regmap);
+}
+
+U_BOOT_DRIVER(meson_reset) = {
+	.name = "meson_reset",
+	.id = UCLASS_RESET,
+	.of_match = meson_reset_ids,
+	.probe = meson_reset_probe,
+	.ops = &meson_reset_ops,
+	.priv_auto_alloc_size = sizeof(struct meson_reset_priv),
+};
-- 
2.7.4
