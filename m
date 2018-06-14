From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 14 Jun 2018 13:43:41 +0200
Subject: [PATCH u-boot 5/5] configs: Update Meson GX configs
In-Reply-To: <1528976621-8397-1-git-send-email-narmstrong@baylibre.com>
References: <1528976621-8397-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1528976621-8397-6-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Enable USB on all Amlogic Meson GXL based board.
Enable Regulator support on all boards.
Enable ADC support on the LibreTech-CC board.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 configs/khadas-vim_defconfig   | 14 ++++++++++++++
 configs/libretech-cc_defconfig | 17 +++++++++++++++++
 configs/odroid-c2_defconfig    |  4 ++++
 configs/p212_defconfig         | 14 ++++++++++++++
 4 files changed, 49 insertions(+)

diff --git a/configs/khadas-vim_defconfig b/configs/khadas-vim_defconfig
index 49a653f..1eb13df 100644
--- a/configs/khadas-vim_defconfig
+++ b/configs/khadas-vim_defconfig
@@ -16,10 +16,15 @@ CONFIG_OF_BOARD_SETUP=y
 CONFIG_CMD_GPIO=y
 # CONFIG_CMD_LOADS is not set
 CONFIG_CMD_MMC=y
+CONFIG_CMD_USB=y
 # CONFIG_CMD_SETEXPR is not set
+CONFIG_CMD_REGULATOR=y
 CONFIG_OF_CONTROL=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM_GPIO=y
+CONFIG_DM_REGULATOR=y
+CONFIG_DM_REGULATOR_FIXED=y
+CONFIG_DM_RESET=y
 CONFIG_DM_MMC=y
 CONFIG_MMC_MESON_GX=y
 CONFIG_PHY_ADDR_ENABLE=y
@@ -34,3 +39,12 @@ CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
 CONFIG_OF_LIBFDT_OVERLAY=y
+CONFIG_USB=y
+CONFIG_DM_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_XHCI_DWC3=y
+CONFIG_USB_XHCI_DWC3_OF_SIMPLE=y
+CONFIG_USB_DWC3=y
+CONFIG_USB_STORAGE=y
+CONFIG_PHY=y
+CONFIG_MESON_GXL_USB_PHY=y
diff --git a/configs/libretech-cc_defconfig b/configs/libretech-cc_defconfig
index 7ba2fa1..d4f2f58 100644
--- a/configs/libretech-cc_defconfig
+++ b/configs/libretech-cc_defconfig
@@ -13,13 +13,21 @@ CONFIG_OF_BOARD_SETUP=y
 # CONFIG_DISPLAY_BOARDINFO is not set
 # CONFIG_CMD_BDI is not set
 # CONFIG_CMD_IMI is not set
+CONFIG_CMD_ADC=y
 CONFIG_CMD_GPIO=y
 # CONFIG_CMD_LOADS is not set
 CONFIG_CMD_MMC=y
+CONFIG_CMD_USB=y
 # CONFIG_CMD_SETEXPR is not set
+CONFIG_CMD_REGULATOR=y
+CONFIG_ADC=y
+CONFIG_SARADC_MESON=y
 CONFIG_OF_CONTROL=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM_GPIO=y
+CONFIG_DM_REGULATOR=y
+CONFIG_DM_REGULATOR_FIXED=y
+CONFIG_DM_RESET=y
 CONFIG_DM_MMC=y
 CONFIG_MMC_MESON_GX=y
 CONFIG_PHY_ADDR_ENABLE=y
@@ -34,3 +42,12 @@ CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
 CONFIG_OF_LIBFDT_OVERLAY=y
+CONFIG_USB=y
+CONFIG_DM_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_XHCI_DWC3=y
+CONFIG_USB_XHCI_DWC3_OF_SIMPLE=y
+CONFIG_USB_DWC3=y
+CONFIG_USB_STORAGE=y
+CONFIG_PHY=y
+CONFIG_MESON_GXL_USB_PHY=y
diff --git a/configs/odroid-c2_defconfig b/configs/odroid-c2_defconfig
index ecc8d03..9be69ad 100644
--- a/configs/odroid-c2_defconfig
+++ b/configs/odroid-c2_defconfig
@@ -18,11 +18,15 @@ CONFIG_CMD_I2C=y
 # CONFIG_CMD_LOADS is not set
 CONFIG_CMD_MMC=y
 # CONFIG_CMD_SETEXPR is not set
+CONFIG_CMD_REGULATOR=y
 CONFIG_OF_CONTROL=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM_GPIO=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_MESON=y
+CONFIG_DM_REGULATOR=y
+CONFIG_DM_REGULATOR_FIXED=y
+CONFIG_DM_RESET=y
 CONFIG_DM_MMC=y
 CONFIG_MMC_MESON_GX=y
 CONFIG_DM_ETH=y
diff --git a/configs/p212_defconfig b/configs/p212_defconfig
index 344c04a..f9b282e 100644
--- a/configs/p212_defconfig
+++ b/configs/p212_defconfig
@@ -16,10 +16,15 @@ CONFIG_OF_BOARD_SETUP=y
 CONFIG_CMD_GPIO=y
 # CONFIG_CMD_LOADS is not set
 CONFIG_CMD_MMC=y
+CONFIG_CMD_USB=y
 # CONFIG_CMD_SETEXPR is not set
+CONFIG_CMD_REGULATOR=y
 CONFIG_OF_CONTROL=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM_GPIO=y
+CONFIG_DM_REGULATOR=y
+CONFIG_DM_REGULATOR_FIXED=y
+CONFIG_DM_RESET=y
 CONFIG_DM_MMC=y
 CONFIG_MMC_MESON_GX=y
 CONFIG_PHY_ADDR_ENABLE=y
@@ -34,3 +39,12 @@ CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
 CONFIG_OF_LIBFDT_OVERLAY=y
+CONFIG_USB=y
+CONFIG_DM_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_XHCI_DWC3=y
+CONFIG_USB_XHCI_DWC3_OF_SIMPLE=y
+CONFIG_USB_DWC3=y
+CONFIG_USB_STORAGE=y
+CONFIG_PHY=y
+CONFIG_MESON_GXL_USB_PHY=y
-- 
2.7.4
