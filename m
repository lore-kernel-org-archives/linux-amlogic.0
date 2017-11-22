From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 22 Nov 2017 14:25:48 +0100
Subject: [PATCH v2 2/5] board: odroid-c2: use common ethernet init function
In-Reply-To: <1511357151-3771-1-git-send-email-narmstrong@baylibre.com>
References: <1511357151-3771-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1511357151-3771-3-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Switch Odroid-C2 Ethernet init to the common Ethernet init function.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 board/amlogic/odroid-c2/odroid-c2.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/board/amlogic/odroid-c2/odroid-c2.c b/board/amlogic/odroid-c2/odroid-c2.c
index a5ea8dc..62a2180 100644
--- a/board/amlogic/odroid-c2/odroid-c2.c
+++ b/board/amlogic/odroid-c2/odroid-c2.c
@@ -9,7 +9,7 @@
 #include <asm/io.h>
 #include <asm/arch/gxbb.h>
 #include <asm/arch/sm.h>
-#include <phy.h>
+#include <asm/arch/eth.h>
 
 #define EFUSE_SN_OFFSET		20
 #define EFUSE_SN_SIZE		16
@@ -27,17 +27,10 @@ int misc_init_r(void)
 	char serial[EFUSE_SN_SIZE];
 	ssize_t len;
 
-	/* Set RGMII mode */
-	setbits_le32(GXBB_ETH_REG_0, GXBB_ETH_REG_0_PHY_INTF |
-				     GXBB_ETH_REG_0_TX_PHASE(1) |
-				     GXBB_ETH_REG_0_TX_RATIO(4) |
-				     GXBB_ETH_REG_0_PHY_CLK_EN |
-				     GXBB_ETH_REG_0_CLK_EN);
+	meson_gx_eth_init(PHY_INTERFACE_MODE_RGMII, false);
 
 	/* Enable power and clock gate */
 	setbits_le32(GXBB_GCLK_MPEG_0, GXBB_GCLK_MPEG_0_I2C);
-	setbits_le32(GXBB_GCLK_MPEG_1, GXBB_GCLK_MPEG_1_ETH);
-	clrbits_le32(GXBB_MEM_PD_REG_0, GXBB_MEM_PD_REG_0_ETH_MASK);
 
 	/* Reset PHY on GPIOZ_14 */
 	clrbits_le32(GXBB_GPIO_EN(3), BIT(14));
-- 
2.7.4
