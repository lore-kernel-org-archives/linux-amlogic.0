From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 18 Oct 2017 10:02:11 +0200
Subject: [PATCH u-boot 2/3] arm: meson: Add supplementary ethernet registers
 definitions
In-Reply-To: <1508313732-19282-1-git-send-email-narmstrong@baylibre.com>
References: <1508313732-19282-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1508313732-19282-3-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Amlogic Meson GXL/GXM, supplementary ethernet configuration registers
were added to configure the internal RMII PHY interface.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/include/asm/arch-meson/gxbb.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/include/asm/arch-meson/gxbb.h b/arch/arm/include/asm/arch-meson/gxbb.h
index ce41349..74d5290 100644
--- a/arch/arm/include/asm/arch-meson/gxbb.h
+++ b/arch/arm/include/asm/arch-meson/gxbb.h
@@ -22,11 +22,14 @@
 
 #define GXBB_ETH_REG_0		GXBB_PERIPHS_ADDR(0x50)
 #define GXBB_ETH_REG_1		GXBB_PERIPHS_ADDR(0x51)
+#define GXBB_ETH_REG_2		GXBB_PERIPHS_ADDR(0x56)
+#define GXBB_ETH_REG_3		GXBB_PERIPHS_ADDR(0x57)
 
 #define GXBB_ETH_REG_0_PHY_INTF		BIT(0)
 #define GXBB_ETH_REG_0_TX_PHASE(x)	(((x) & 3) << 5)
 #define GXBB_ETH_REG_0_TX_RATIO(x)	(((x) & 7) << 7)
 #define GXBB_ETH_REG_0_PHY_CLK_EN	BIT(10)
+#define GXBB_ETH_REG_0_INVERT_RMII_CLK	BIT(11)
 #define GXBB_ETH_REG_0_CLK_EN		BIT(12)
 
 /* HIU registers */
-- 
2.7.4
