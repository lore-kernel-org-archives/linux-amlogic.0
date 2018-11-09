From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri,  9 Nov 2018 16:26:41 +0100
Subject: [PATCH u-boot 02/19] configs: meson: remove unnecessary
 MESON_FDTFILE_SETTING
In-Reply-To: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
References: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1541777218-472-3-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

MESON_FDTFILE_SETTING is used to define the default name of the fdt
file in u-boot environment. We can easily derive it from
CONFIG_DEFAULT_DEVICE_TREE instead. This will help factorize the code
a bit

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/configs/khadas-vim.h      | 2 --
 include/configs/libretech-cc.h    | 2 --
 include/configs/meson-gx-common.h | 2 +-
 include/configs/nanopi-k2.h       | 4 ----
 include/configs/odroid-c2.h       | 4 ----
 include/configs/p212.h            | 4 ----
 6 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/include/configs/khadas-vim.h b/include/configs/khadas-vim.h
index 6615f77..ff87c02 100644
--- a/include/configs/khadas-vim.h
+++ b/include/configs/khadas-vim.h
@@ -9,8 +9,6 @@
 #ifndef __CONFIG_H
 #define __CONFIG_H
 
-#define MESON_FDTFILE_SETTING "fdtfile=amlogic/meson-gxl-s905x-khadas-vim.dtb\0"
-
 #include <configs/meson-gx-common.h>
 
 #endif /* __CONFIG_H */
diff --git a/include/configs/libretech-cc.h b/include/configs/libretech-cc.h
index a0856f9..95e0f34 100644
--- a/include/configs/libretech-cc.h
+++ b/include/configs/libretech-cc.h
@@ -9,8 +9,6 @@
 #ifndef __CONFIG_H
 #define __CONFIG_H
 
-#define MESON_FDTFILE_SETTING "fdtfile=amlogic/meson-gxl-s905x-libretech-cc.dtb\0"
-
 #include <configs/meson-gx-common.h>
 
 #endif /* __CONFIG_H */
diff --git a/include/configs/meson-gx-common.h b/include/configs/meson-gx-common.h
index c46522e..c436976 100644
--- a/include/configs/meson-gx-common.h
+++ b/include/configs/meson-gx-common.h
@@ -44,7 +44,7 @@
 	"kernel_addr_r=0x01080000\0" \
 	"pxefile_addr_r=0x01080000\0" \
 	"ramdisk_addr_r=0x13000000\0" \
-	MESON_FDTFILE_SETTING \
+	"fdtfile=amlogic/" CONFIG_DEFAULT_DEVICE_TREE ".dtb\0" \
 	BOOTENV
 
 #define CONFIG_SYS_BOOTM_LEN    (64 << 20)      /* 64 MiB */
diff --git a/include/configs/nanopi-k2.h b/include/configs/nanopi-k2.h
index ef53f20..3fd6e8f 100644
--- a/include/configs/nanopi-k2.h
+++ b/include/configs/nanopi-k2.h
@@ -7,10 +7,6 @@
 #ifndef __CONFIG_H
 #define __CONFIG_H
 
-/* Serial setup */
-
-#define MESON_FDTFILE_SETTING "fdtfile=amlogic/meson-gxbb-nanopi-k2.dtb\0"
-
 #include <configs/meson-gx-common.h>
 
 #endif /* __CONFIG_H */
diff --git a/include/configs/odroid-c2.h b/include/configs/odroid-c2.h
index d117b18..87e3ddb 100644
--- a/include/configs/odroid-c2.h
+++ b/include/configs/odroid-c2.h
@@ -7,10 +7,6 @@
 #ifndef __CONFIG_H
 #define __CONFIG_H
 
-/* Serial setup */
-
-#define MESON_FDTFILE_SETTING "fdtfile=amlogic/meson-gxbb-odroidc2.dtb\0"
-
 #include <configs/meson-gx-common.h>
 
 #endif /* __CONFIG_H */
diff --git a/include/configs/p212.h b/include/configs/p212.h
index 2aa9f5d..4414293 100644
--- a/include/configs/p212.h
+++ b/include/configs/p212.h
@@ -9,10 +9,6 @@
 #ifndef __CONFIG_H
 #define __CONFIG_H
 
-/* Serial setup */
-
-#define MESON_FDTFILE_SETTING "fdtfile=amlogic/meson-gxl-s905x-p212.dtb\0"
-
 #include <configs/meson-gx-common.h>
 
 #endif /* __CONFIG_H */
-- 
2.7.4
