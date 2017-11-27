From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 27 Nov 2017 10:16:16 +0100
Subject: [PATCH u-boot v3 1/5] ARM: arch-meson: add ethernet common init
 function
In-Reply-To: <1511774180-22672-1-git-send-email-narmstrong@baylibre.com>
References: <1511774180-22672-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1511774180-22672-2-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Introduce a generic common Ethernet Hardware init function
common to all Amlogic GX SoCs with support for the
Internal PHY enable for GXL SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/include/asm/arch-meson/eth.h | 23 +++++++++++++++
 arch/arm/mach-meson/Makefile          |  2 +-
 arch/arm/mach-meson/eth.c             | 55 +++++++++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/include/asm/arch-meson/eth.h
 create mode 100644 arch/arm/mach-meson/eth.c

diff --git a/arch/arm/include/asm/arch-meson/eth.h b/arch/arm/include/asm/arch-meson/eth.h
new file mode 100644
index 0000000..3089f13
--- /dev/null
+++ b/arch/arm/include/asm/arch-meson/eth.h
@@ -0,0 +1,23 @@
+/*
+ * Copyright (C) 2016 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#ifndef __MESON_ETH_H__
+#define __MESON_ETH_H__
+
+#include <phy.h>
+
+enum {
+	/* Use GXL Internal RMII PHY */
+	MESON_GXL_USE_INTERNAL_RMII_PHY = 1,
+};
+
+/* Configure the Ethernet MAC with the requested interface mode
+ * with some optional flags.
+ */
+void meson_gx_eth_init(phy_interface_t mode, unsigned int flags);
+
+#endif /* __MESON_ETH_H__ */
diff --git a/arch/arm/mach-meson/Makefile b/arch/arm/mach-meson/Makefile
index bf49b8b..b4e8dde 100644
--- a/arch/arm/mach-meson/Makefile
+++ b/arch/arm/mach-meson/Makefile
@@ -4,4 +4,4 @@
 # SPDX-License-Identifier:	GPL-2.0+
 #
 
-obj-y += board.o sm.o
+obj-y += board.o sm.o eth.o
diff --git a/arch/arm/mach-meson/eth.c b/arch/arm/mach-meson/eth.c
new file mode 100644
index 0000000..2debe93
--- /dev/null
+++ b/arch/arm/mach-meson/eth.c
@@ -0,0 +1,55 @@
+/*
+ * Copyright (C) 2016 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#include <common.h>
+#include <dm.h>
+#include <asm/io.h>
+#include <asm/arch/gxbb.h>
+#include <asm/arch/eth.h>
+#include <phy.h>
+
+/* Configure the Ethernet MAC with the requested interface mode
+ * with some optional flags.
+ */
+void meson_gx_eth_init(phy_interface_t mode, unsigned int flags)
+{
+	switch (mode) {
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		/* Set RGMII mode */
+		setbits_le32(GXBB_ETH_REG_0, GXBB_ETH_REG_0_PHY_INTF |
+			     GXBB_ETH_REG_0_TX_PHASE(1) |
+			     GXBB_ETH_REG_0_TX_RATIO(4) |
+			     GXBB_ETH_REG_0_PHY_CLK_EN |
+			     GXBB_ETH_REG_0_CLK_EN);
+		break;
+
+	case PHY_INTERFACE_MODE_RMII:
+		/* Set RMII mode */
+		out_le32(GXBB_ETH_REG_0, GXBB_ETH_REG_0_INVERT_RMII_CLK |
+					 GXBB_ETH_REG_0_CLK_EN);
+
+		/* Use GXL RMII Internal PHY */
+		if (IS_ENABLED(CONFIG_MESON_GXL) &&
+		    (flags & MESON_GXL_USE_INTERNAL_RMII_PHY)) {
+			writel(GXBB_ETH_REG_2, 0x10110181);
+			writel(GXBB_ETH_REG_3, 0xe40908ff);
+		}
+
+		break;
+
+	default:
+		printf("Invalid Ethernet interface mode\n");
+		return;
+	}
+
+	/* Enable power and clock gate */
+	setbits_le32(GXBB_GCLK_MPEG_1, GXBB_GCLK_MPEG_1_ETH);
+	clrbits_le32(GXBB_MEM_PD_REG_0, GXBB_MEM_PD_REG_0_ETH_MASK);
+}
-- 
2.7.4
