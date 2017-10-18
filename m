From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 18 Oct 2017 10:02:12 +0200
Subject: [PATCH u-boot 3/3] arm: amlogic: p212: Add support for Ethernet with
 Internal PHY
In-Reply-To: <1508313732-19282-1-git-send-email-narmstrong@baylibre.com>
References: <1508313732-19282-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1508313732-19282-4-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch adds support for the Internal RMII Ethernet PHY on the
Amlogic P212 Reference Board.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 board/amlogic/p212/p212.c | 39 ++++++++++++++++++++++++++++++++++++++-
 configs/p212_defconfig    |  4 ++++
 include/configs/p212.h    |  2 ++
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/board/amlogic/p212/p212.c b/board/amlogic/p212/p212.c
index 1eeb7f2..ece8096 100644
--- a/board/amlogic/p212/p212.c
+++ b/board/amlogic/p212/p212.c
@@ -9,6 +9,13 @@
 #include <dm.h>
 #include <asm/io.h>
 #include <asm/arch/gxbb.h>
+#include <asm/arch/sm.h>
+#include <phy.h>
+
+#define EFUSE_SN_OFFSET		20
+#define EFUSE_SN_SIZE		16
+#define EFUSE_MAC_OFFSET	52
+#define EFUSE_MAC_SIZE		6
 
 int board_init(void)
 {
@@ -17,5 +24,35 @@ int board_init(void)
 
 int misc_init_r(void)
 {
-       return 0;
+	u8 mac_addr[EFUSE_MAC_SIZE];
+	char serial[EFUSE_SN_SIZE];
+	ssize_t len;
+
+	/* Set RMII mode */
+	out_le32(GXBB_ETH_REG_0, GXBB_ETH_REG_0_INVERT_RMII_CLK |
+				 GXBB_ETH_REG_0_CLK_EN);
+
+	/* Use Internal PHY */
+	out_le32(GXBB_ETH_REG_2, 0x10110181);
+	out_le32(GXBB_ETH_REG_3, 0xe40908ff);
+
+	/* Enable power and clock gate */
+	setbits_le32(GXBB_GCLK_MPEG_1, GXBB_GCLK_MPEG_1_ETH);
+	clrbits_le32(GXBB_MEM_PD_REG_0, GXBB_MEM_PD_REG_0_ETH_MASK);
+
+	if (!eth_env_get_enetaddr("ethaddr", mac_addr)) {
+		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
+					  mac_addr, EFUSE_MAC_SIZE);
+		if (len == EFUSE_MAC_SIZE && is_valid_ethaddr(mac_addr))
+			eth_env_set_enetaddr("ethaddr", mac_addr);
+	}
+
+	if (!env_get("serial#")) {
+		len = meson_sm_read_efuse(EFUSE_SN_OFFSET, serial,
+			EFUSE_SN_SIZE);
+		if (len == EFUSE_SN_SIZE)
+			env_set("serial#", serial);
+	}
+
+	return 0;
 }
diff --git a/configs/p212_defconfig b/configs/p212_defconfig
index 3c57621..d4b5349 100644
--- a/configs/p212_defconfig
+++ b/configs/p212_defconfig
@@ -20,6 +20,10 @@ CONFIG_OF_CONTROL=y
 CONFIG_DM_GPIO=y
 CONFIG_DM_MMC=y
 CONFIG_MMC_MESON_GX=y
+CONFIG_DM_ETH=y
+CONFIG_ETH_DESIGNWARE=y
+CONFIG_PHY_MESON_GXL=y
+CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_PINCTRL=y
 CONFIG_PINCTRL_MESON_GXL=y
 CONFIG_DEBUG_UART_MESON=y
diff --git a/include/configs/p212.h b/include/configs/p212.h
index 0477384..793b556 100644
--- a/include/configs/p212.h
+++ b/include/configs/p212.h
@@ -12,6 +12,8 @@
 
 #define CONFIG_MISC_INIT_R
 
+#define CONFIG_PHY_ADDR 		8
+
 /* Serial setup */
 #define CONFIG_CONS_INDEX		0
 
-- 
2.7.4
