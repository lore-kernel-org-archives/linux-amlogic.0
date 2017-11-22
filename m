From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 22 Nov 2017 14:25:49 +0100
Subject: [PATCH v2 3/5] board: p212: use common ethernet init function
In-Reply-To: <1511357151-3771-1-git-send-email-narmstrong@baylibre.com>
References: <1511357151-3771-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1511357151-3771-4-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Switch P212 Ethernet init to the common Ethernet init function.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 board/amlogic/p212/p212.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/board/amlogic/p212/p212.c b/board/amlogic/p212/p212.c
index ece8096..a120ab0 100644
--- a/board/amlogic/p212/p212.c
+++ b/board/amlogic/p212/p212.c
@@ -10,7 +10,7 @@
 #include <asm/io.h>
 #include <asm/arch/gxbb.h>
 #include <asm/arch/sm.h>
-#include <phy.h>
+#include <asm/arch/eth.h>
 
 #define EFUSE_SN_OFFSET		20
 #define EFUSE_SN_SIZE		16
@@ -28,17 +28,7 @@ int misc_init_r(void)
 	char serial[EFUSE_SN_SIZE];
 	ssize_t len;
 
-	/* Set RMII mode */
-	out_le32(GXBB_ETH_REG_0, GXBB_ETH_REG_0_INVERT_RMII_CLK |
-				 GXBB_ETH_REG_0_CLK_EN);
-
-	/* Use Internal PHY */
-	out_le32(GXBB_ETH_REG_2, 0x10110181);
-	out_le32(GXBB_ETH_REG_3, 0xe40908ff);
-
-	/* Enable power and clock gate */
-	setbits_le32(GXBB_GCLK_MPEG_1, GXBB_GCLK_MPEG_1_ETH);
-	clrbits_le32(GXBB_MEM_PD_REG_0, GXBB_MEM_PD_REG_0_ETH_MASK);
+	meson_gx_eth_init(PHY_INTERFACE_MODE_RMII, true);
 
 	if (!eth_env_get_enetaddr("ethaddr", mac_addr)) {
 		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
-- 
2.7.4
