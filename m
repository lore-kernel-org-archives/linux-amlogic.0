From: ldevulder@suse.de (Loic Devulder)
Date: Mon,  9 Jul 2018 16:45:53 +0200
Subject: [PATCH 2/2] configs: Update Meson GX configs
In-Reply-To: <20180709144553.26161-1-ldevulder@suse.de>
References: <20180709144553.26161-1-ldevulder@suse.de>
Message-ID: <20180709144553.26161-3-ldevulder@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Enable ADC support on the Khadas VIM board.

Signed-off-by: Loic Devulder <ldevulder@suse.de>
---
 configs/khadas-vim_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/configs/khadas-vim_defconfig b/configs/khadas-vim_defconfig
index 1eb13df4b4..116acb5507 100644
--- a/configs/khadas-vim_defconfig
+++ b/configs/khadas-vim_defconfig
@@ -13,18 +13,23 @@ CONFIG_OF_BOARD_SETUP=y
 # CONFIG_DISPLAY_BOARDINFO is not set
 # CONFIG_CMD_BDI is not set
 # CONFIG_CMD_IMI is not set
+CONFIG_CMD_ADC=y
 CONFIG_CMD_GPIO=y
 # CONFIG_CMD_LOADS is not set
 CONFIG_CMD_MMC=y
 CONFIG_CMD_USB=y
 # CONFIG_CMD_SETEXPR is not set
 CONFIG_CMD_REGULATOR=y
+CONFIG_ADC=y
+CONFIG_SARADC_MESON=y
 CONFIG_OF_CONTROL=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM_GPIO=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_DM_RESET=y
+CONFIG_ADC=y
++CONFIG_SARADC_MESON=y
 CONFIG_DM_MMC=y
 CONFIG_MMC_MESON_GX=y
 CONFIG_PHY_ADDR_ENABLE=y
-- 
2.13.7
