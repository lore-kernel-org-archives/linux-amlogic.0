From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 14 Jun 2018 13:43:38 +0200
Subject: [PATCH u-boot 2/5] config: meson-gx-common: Enable USB boot
In-Reply-To: <1528976621-8397-1-git-send-email-narmstrong@baylibre.com>
References: <1528976621-8397-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1528976621-8397-3-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add USB as boot target depending on the configuration.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/configs/meson-gx-common.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/configs/meson-gx-common.h b/include/configs/meson-gx-common.h
index 6e61b70..7435f34 100644
--- a/include/configs/meson-gx-common.h
+++ b/include/configs/meson-gx-common.h
@@ -23,10 +23,17 @@
 #define GICD_BASE			0xc4301000
 #define GICC_BASE			0xc4302000
 
+#ifdef CONFIG_CMD_USB
+#define BOOT_TARGET_DEVICES_USB(func) func(USB, usb, 0)
+#else
+#define BOOT_TARGET_DEVICES_USB(func)
+#endif
+
 #define BOOT_TARGET_DEVICES(func) \
 	func(MMC, mmc, 0) \
 	func(MMC, mmc, 1) \
 	func(MMC, mmc, 2) \
+	BOOT_TARGET_DEVICES_USB(func) \
 	func(PXE, pxe, na) \
 	func(DHCP, dhcp, na)
 
-- 
2.7.4
