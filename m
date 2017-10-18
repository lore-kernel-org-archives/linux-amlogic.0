From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 18 Oct 2017 10:02:10 +0200
Subject: [PATCH u-boot 1/3] net: phy: Add Amlogic Meson GXL Internal PHY
 support
In-Reply-To: <1508313732-19282-1-git-send-email-narmstrong@baylibre.com>
References: <1508313732-19282-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1508313732-19282-2-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Amlogic Meson GXL/GXM families embeds an internal RMII Ethernet PHY.

The PHY acts as a generic PHY but needs a slight configuration right
before it's configuration.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/net/phy/Kconfig     |  3 +++
 drivers/net/phy/Makefile    |  1 +
 drivers/net/phy/meson-gxl.c | 57 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/net/phy/phy.c       |  3 +++
 include/phy.h               |  1 +
 5 files changed, 65 insertions(+)
 create mode 100644 drivers/net/phy/meson-gxl.c

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index 4d02d8b..e32f1eb 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -55,6 +55,9 @@ config PHY_LXT
 config PHY_MARVELL
 	bool "Marvell Ethernet PHYs support"
 
+config PHY_MESON_GXL
+	bool "Amlogic Meson GXL Internal PHY support"
+
 config PHY_MICREL
 	bool "Micrel Ethernet PHYs support"
 	help
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index 54f32f6..1e264b2 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_PHY_LXT) += lxt.o
 obj-$(CONFIG_PHY_MARVELL) += marvell.o
 obj-$(CONFIG_PHY_MICREL_KSZ8XXX) += micrel_ksz8xxx.o
 obj-$(CONFIG_PHY_MICREL_KSZ90X1) += micrel_ksz90x1.o
+obj-$(CONFIG_PHY_MESON_GXL) += meson-gxl.o
 obj-$(CONFIG_PHY_NATSEMI) += natsemi.o
 obj-$(CONFIG_PHY_REALTEK) += realtek.o
 obj-$(CONFIG_PHY_SMSC) += smsc.o
diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
new file mode 100644
index 0000000..ccf70c9
--- /dev/null
+++ b/drivers/net/phy/meson-gxl.c
@@ -0,0 +1,57 @@
+/*
+ * Meson GXL Internal PHY Driver
+ *
+ * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
+ * Copyright (C) 2016 BayLibre, SAS. All rights reserved.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+#include <config.h>
+#include <common.h>
+#include <linux/bitops.h>
+#include <phy.h>
+
+static int meson_gxl_phy_config(struct phy_device *phydev)
+{
+	/* Enable Analog and DSP register Bank access by */
+	phy_write(phydev, MDIO_DEVAD_NONE, 0x14, 0x0000);
+	phy_write(phydev, MDIO_DEVAD_NONE, 0x14, 0x0400);
+	phy_write(phydev, MDIO_DEVAD_NONE, 0x14, 0x0000);
+	phy_write(phydev, MDIO_DEVAD_NONE, 0x14, 0x0400);
+
+	/* Write Analog register 23 */
+	phy_write(phydev, MDIO_DEVAD_NONE, 0x17, 0x8E0D);
+	phy_write(phydev, MDIO_DEVAD_NONE, 0x14, 0x4417);
+
+	/* Enable fractional PLL */
+	phy_write(phydev, MDIO_DEVAD_NONE, 0x17, 0x0005);
+	phy_write(phydev, MDIO_DEVAD_NONE, 0x14, 0x5C1B);
+
+	/* Program fraction FR_PLL_DIV1 */
+	phy_write(phydev, MDIO_DEVAD_NONE, 0x17, 0x029A);
+	phy_write(phydev, MDIO_DEVAD_NONE, 0x14, 0x5C1D);
+
+	/* Program fraction FR_PLL_DIV1 */
+	phy_write(phydev, MDIO_DEVAD_NONE, 0x17, 0xAAAA);
+	phy_write(phydev, MDIO_DEVAD_NONE, 0x14, 0x5C1C);
+
+	return genphy_config(phydev);
+}
+
+static struct phy_driver meson_gxl_phy_driver = {
+	.name = "Meson GXL Internal PHY",
+	.uid = 0x01814400,
+	.mask = 0xfffffff0,
+	.features = PHY_BASIC_FEATURES,
+	.config = &meson_gxl_phy_config,
+	.startup = &genphy_startup,
+	.shutdown = &genphy_shutdown,
+};
+
+int phy_meson_gxl_init(void)
+{
+	phy_register(&meson_gxl_phy_driver);
+
+	return 0;
+}
diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index 5be51d7..fd3dd55 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -494,6 +494,9 @@ int phy_init(void)
 #ifdef CONFIG_PHY_MICREL_KSZ90X1
 	phy_micrel_ksz90x1_init();
 #endif
+#ifdef CONFIG_PHY_MESON_GXL
+	phy_meson_gxl_init();
+#endif
 #ifdef CONFIG_PHY_NATSEMI
 	phy_natsemi_init();
 #endif
diff --git a/include/phy.h b/include/phy.h
index a0b1f12..50f1e12 100644
--- a/include/phy.h
+++ b/include/phy.h
@@ -268,6 +268,7 @@ int phy_lxt_init(void);
 int phy_marvell_init(void);
 int phy_micrel_ksz8xxx_init(void);
 int phy_micrel_ksz90x1_init(void);
+int phy_meson_gxl_init(void);
 int phy_natsemi_init(void);
 int phy_realtek_init(void);
 int phy_smsc_init(void);
-- 
2.7.4
