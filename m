From: afaerber@suse.de (=?UTF-8?q?Andreas=20F=C3=A4rber?=)
Date: Tue,  1 Nov 2016 22:11:54 +0100
Subject: [PATCH] odroid-c2: Enable distro boot
Message-ID: <1478034714-8743-1-git-send-email-afaerber@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Use the generic "distro" boot framework to enable automatic DHCP boot.

Signed-off-by: Andreas F?rber <afaerber@suse.de>
---
 Kconfig                             |  2 +-
 configs/odroid-c2_defconfig         |  1 -
 include/configs/meson-gxbb-common.h | 13 +++++++++++++
 include/configs/odroid-c2.h         |  2 ++
 4 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/Kconfig b/Kconfig
index 1263d0b..3c085cf 100644
--- a/Kconfig
+++ b/Kconfig
@@ -55,7 +55,7 @@ config CC_OPTIMIZE_FOR_SIZE
 
 config DISTRO_DEFAULTS
 	bool "Select defaults suitable for booting general purpose Linux distributions"
-	default y if ARCH_SUNXI
+	default y if ARCH_MESON || ARCH_SUNXI
 	default n
 	select CMD_BOOTZ if ARM && !ARM64
 	select CMD_BOOTI if ARM64
diff --git a/configs/odroid-c2_defconfig b/configs/odroid-c2_defconfig
index 9db718c..dfc19d9 100644
--- a/configs/odroid-c2_defconfig
+++ b/configs/odroid-c2_defconfig
@@ -12,7 +12,6 @@ CONFIG_HUSH_PARSER=y
 # CONFIG_CMD_IMLS is not set
 # CONFIG_CMD_LOADS is not set
 # CONFIG_CMD_FPGA is not set
-# CONFIG_CMD_SOURCE is not set
 # CONFIG_CMD_SETEXPR is not set
 CONFIG_OF_CONTROL=y
 CONFIG_NET_RANDOM_ETHADDR=y
diff --git a/include/configs/meson-gxbb-common.h b/include/configs/meson-gxbb-common.h
index 3bba2e6..0c467fe 100644
--- a/include/configs/meson-gxbb-common.h
+++ b/include/configs/meson-gxbb-common.h
@@ -40,4 +40,17 @@
 
 #include <config_distro_defaults.h>
 
+#define BOOT_TARGET_DEVICES(func) \
+	func(DHCP, dhcp, na)
+#include <config_distro_bootcmd.h>
+
+#define CONFIG_EXTRA_ENV_SETTINGS \
+	"fdt_addr_r=0x01000000\0" \
+	"scriptaddr=0x1f000000\0" \
+	"kernel_addr_r=0x20000000\0" \
+	"pxefile_addr_r=0x20000000\0" \
+	"ramdisk_addr_r=0x28000000\0" \
+	MESON_FDTFILE_SETTING \
+	BOOTENV
+
 #endif /* __MESON_GXBB_COMMON_CONFIG_H */
diff --git a/include/configs/odroid-c2.h b/include/configs/odroid-c2.h
index 1d5b3d5..bf7e1af 100644
--- a/include/configs/odroid-c2.h
+++ b/include/configs/odroid-c2.h
@@ -12,6 +12,8 @@
 #define CONFIG_CONS_INDEX		0
 #define CONFIG_BAUDRATE			115200
 
+#define MESON_FDTFILE_SETTING "fdtfile=amlogic/meson-gxbb-odroidc2.dtb\0"
+
 #include <configs/meson-gxbb-common.h>
 
 #endif /* __CONFIG_H */
-- 
2.6.6
