From: ldevulder@suse.de (Loic Devulder)
Date: Wed, 21 Nov 2018 00:50:19 +0100
Subject: [PATCH v2 2/3] ARM: meson: Enable syscon on all supported boards
In-Reply-To: <20181120235020.14812-1-ldevulder@suse.de>
References: <20181120235020.14812-1-ldevulder@suse.de>
Message-ID: <20181120235020.14812-3-ldevulder@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch enable CONFIG_SYSCON option on all supported meson boards, as
this is need for the new clock driver to work.

Signed-off-by: Loic Devulder <ldevulder@suse.de>
---
 configs/khadas-vim2_defconfig  | 1 +
 configs/khadas-vim_defconfig   | 1 +
 configs/libretech-cc_defconfig | 1 +
 configs/nanopi-k2_defconfig    | 1 +
 configs/odroid-c2_defconfig    | 1 +
 configs/p212_defconfig         | 1 +
 6 files changed, 6 insertions(+)

diff --git a/configs/khadas-vim2_defconfig b/configs/khadas-vim2_defconfig
index f21e3a8ddf..c5f2b3f111 100644
--- a/configs/khadas-vim2_defconfig
+++ b/configs/khadas-vim2_defconfig
@@ -49,3 +49,4 @@ CONFIG_USB_STORAGE=y
 CONFIG_USB_DWC3=y
 CONFIG_USB_STORAGE=y
 CONFIG_OF_LIBFDT_OVERLAY=y
+CONFIG_SYSCON=y
diff --git a/configs/khadas-vim_defconfig b/configs/khadas-vim_defconfig
index 0c89d9a22c..6815c7bebf 100644
--- a/configs/khadas-vim_defconfig
+++ b/configs/khadas-vim_defconfig
@@ -51,3 +51,4 @@ CONFIG_USB_XHCI_DWC3_OF_SIMPLE=y
 CONFIG_USB_DWC3=y
 CONFIG_USB_STORAGE=y
 CONFIG_OF_LIBFDT_OVERLAY=y
+CONFIG_SYSCON=y
diff --git a/configs/libretech-cc_defconfig b/configs/libretech-cc_defconfig
index 36d117c4ab..4267d75931 100644
--- a/configs/libretech-cc_defconfig
+++ b/configs/libretech-cc_defconfig
@@ -51,3 +51,4 @@ CONFIG_USB_XHCI_DWC3_OF_SIMPLE=y
 CONFIG_USB_DWC3=y
 CONFIG_USB_STORAGE=y
 CONFIG_OF_LIBFDT_OVERLAY=y
+CONFIG_SYSCON=y
diff --git a/configs/nanopi-k2_defconfig b/configs/nanopi-k2_defconfig
index 5c8c747bf3..7222419e84 100644
--- a/configs/nanopi-k2_defconfig
+++ b/configs/nanopi-k2_defconfig
@@ -40,3 +40,4 @@ CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
 CONFIG_OF_LIBFDT_OVERLAY=y
+CONFIG_SYSCON=y
diff --git a/configs/odroid-c2_defconfig b/configs/odroid-c2_defconfig
index 19196b3585..3ad4f73a85 100644
--- a/configs/odroid-c2_defconfig
+++ b/configs/odroid-c2_defconfig
@@ -40,3 +40,4 @@ CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
 CONFIG_OF_LIBFDT_OVERLAY=y
+CONFIG_SYSCON=y
diff --git a/configs/p212_defconfig b/configs/p212_defconfig
index 9e3b1d6bfb..9bbe67ac61 100644
--- a/configs/p212_defconfig
+++ b/configs/p212_defconfig
@@ -50,3 +50,4 @@ CONFIG_USB_XHCI_DWC3_OF_SIMPLE=y
 CONFIG_USB_DWC3=y
 CONFIG_USB_STORAGE=y
 CONFIG_OF_LIBFDT_OVERLAY=y
+CONFIG_SYSCON=y
-- 
2.16.4
