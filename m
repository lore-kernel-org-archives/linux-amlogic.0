From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 22 Nov 2017 14:25:47 +0100
Subject: [PATCH v2 1/5] ARM: arch-meson: add ethernet common init function
In-Reply-To: <1511357151-3771-1-git-send-email-narmstrong@baylibre.com>
References: <1511357151-3771-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1511357151-3771-2-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Introduce a generic common Ethernet Hardware init function
common to all Amlogic GX SoCs with support for the
Internal PHY enable for GXL SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/include/asm/arch-meson/eth.h | 15 ++++++++++
 arch/arm/mach-meson/Makefile          |  2 +-
 arch/arm/mach-meson/eth.c             | 53 +++++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/include/asm/arch-meson/eth.h
 create mode 100644 arch/arm/mach-meson/eth.c

diff --git a/arch/arm/include/asm/arch-meson/eth.h b/arch/arm/include/asm/arch-meson/eth.h
new file mode 100644
index 0000000..8ea8e10
--- /dev/null
+++ b/arch/arm/include/asm/arch-meson/eth.h
@@ -0,0 +1,15 @@
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
+void meson_gx_eth_init(phy_interface_t mode, bool use_internal_phy);
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
index 0000000..46ecb5e
--- /dev/null
+++ b/arch/arm/mach-meson/eth.c
@@ -0,0 +1,53 @@
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
+void meson_gx_eth_init(phy_interface_t mode, bool use_internal_phy)
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
+#ifdef CONFIG_MESON_GXL
+		if (use_internal_phy) {
+			/* Use Internal PHY */
+			out_le32(GXBB_ETH_REG_2, 0x10110181);
+			out_le32(GXBB_ETH_REG_3, 0xe40908ff);
+		}
+#endif
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
