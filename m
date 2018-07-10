From: ldevulder@suse.de (Loic Devulder)
Date: Tue, 10 Jul 2018 09:54:45 +0200
Subject: [[PATCH v3] 2/2] configs: Update Meson GX configs
In-Reply-To: <20180710075445.9274-1-ldevulder@suse.de>
References: <20180710075445.9274-1-ldevulder@suse.de>
Message-ID: <20180710075445.9274-3-ldevulder@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Enable ADC support on the Khadas VIM board.

Signed-off-by: Loic Devulder <ldevulder@suse.de>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
---
 configs/khadas-vim_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/khadas-vim_defconfig b/configs/khadas-vim_defconfig
index 1eb13df4b4..fd1ec8157b 100644
--- a/configs/khadas-vim_defconfig
+++ b/configs/khadas-vim_defconfig
@@ -13,12 +13,15 @@ CONFIG_OF_BOARD_SETUP=y
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
-- 
2.13.7
