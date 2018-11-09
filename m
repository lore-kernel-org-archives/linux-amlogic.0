From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri,  9 Nov 2018 16:26:45 +0100
Subject: [PATCH u-boot 06/19] ARM: rework amlogic configuration
In-Reply-To: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
References: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1541777218-472-7-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

Rework the board SYS_BOARD, SYS_VENDOR and SYS_CONFIG_NAME setup by moving
the board Kconfig into the mach-meson Kconfig to make it easier to add
new boards for a SoC architecture and add a custom config header or custom
board handler for a platform.

This drops the board CONFIGs and the duplicate boards configs headers in
favor of a single meson64.h config header.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/mach-meson/Kconfig       | 75 +++++++++++++++++++--------------------
 board/amlogic/odroid-c2/Kconfig   | 12 -------
 board/amlogic/p212/Kconfig        | 12 -------
 board/amlogic/q200/Kconfig        | 12 -------
 configs/khadas-vim2_defconfig     |  1 -
 configs/khadas-vim_defconfig      |  1 -
 configs/libretech-cc_defconfig    |  1 -
 configs/nanopi-k2_defconfig       |  2 --
 configs/odroid-c2_defconfig       |  1 -
 configs/p212_defconfig            |  1 -
 include/configs/khadas-vim.h      | 14 --------
 include/configs/libretech-cc.h    | 14 --------
 include/configs/meson-gx-common.h | 52 ---------------------------
 include/configs/meson64.h         | 55 ++++++++++++++++++++++++++++
 include/configs/nanopi-k2.h       | 12 -------
 include/configs/odroid-c2.h       | 12 -------
 include/configs/p212.h            | 14 --------
 include/configs/q200.h            | 18 ----------
 18 files changed, 92 insertions(+), 217 deletions(-)
 delete mode 100644 board/amlogic/odroid-c2/Kconfig
 delete mode 100644 board/amlogic/p212/Kconfig
 delete mode 100644 board/amlogic/q200/Kconfig
 delete mode 100644 include/configs/khadas-vim.h
 delete mode 100644 include/configs/libretech-cc.h
 delete mode 100644 include/configs/meson-gx-common.h
 create mode 100644 include/configs/meson64.h
 delete mode 100644 include/configs/nanopi-k2.h
 delete mode 100644 include/configs/odroid-c2.h
 delete mode 100644 include/configs/p212.h
 delete mode 100644 include/configs/q200.h

diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index d86b1be..6f60167 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -8,49 +8,27 @@ config MESON64_COMMON
 	select DM_SERIAL
 	imply CMD_DM
 
-config MESON_GXBB
-	bool
-	select MESON64_COMMON
-
-config MESON_GXL
-	bool
-	select MESON64_COMMON
-
-config MESON_GXM
-	bool
-	select MESON64_COMMON
-
 choice
 	prompt "Platform select"
-	default TARGET_ODROID_C2
+	default MESON_GXBB
 
-config TARGET_ODROID_C2
-	bool "ODROID-C2"
-	select MESON_GXBB
+config MESON_GXBB
+	bool "GXBB"
+	select MESON64_COMMON
 	help
-	  ODROID-C2 is a single board computer based on Meson GXBaby
-	  with 2 GiB of RAM, Gigabit Ethernet, HDMI, 4 USB, micro-SD
-	  slot, eMMC, IR receiver and a 40-pin GPIO header.
-	  You should also select this TARGET if you have an nanopi-k2
+	  Select this if your SoC is an S905
 
-config TARGET_P212
-	bool "P212"
-	select MESON_GXL
+config MESON_GXL
+	bool "GXL"
+	select MESON64_COMMON
 	help
-	  P212 is a reference dessign board based on Meson GXL S905X SoC
-	  with 2 GiB of RAM, Ethernet, HDMI, 2 USB, micro-SD slot,
-	  eMMC, IR receiver, CVBS+Audio jack and a SDIO WiFi module.
-	  You should also select this TARGET if you have Khadas Vim or
-	  a libretech aml-s905x-cc
+	  Select this if your SoC is an S905X/D or S805X
 
-config TARGET_Q200
-	bool "KHADAS-VIM2"
-	select MESON_GXM
+config MESON_GXM
+	bool "GXM"
+	select MESON64_COMMON
 	help
-	  Q200 is a reference dessign board based on Meson GXM
-	  with 2/3 GiB of RAM, Ethernet, HDMI, 4 USB, micro-SD slot,
-	  eMMC, IR receiver.
-	  You should also select this TARGET if you have Khadas Vim2.
+	  Select this if your SoC is an S912
 
 endchoice
 
@@ -60,10 +38,31 @@ config SYS_SOC
 config SYS_MALLOC_F_LEN
 	default 0x1000
 
-source "board/amlogic/odroid-c2/Kconfig"
+config SYS_VENDOR
+	string "Vendor name"
+	default "amlogic"
+	help
+	  This option contains information about board name.
+	  Based on this option board/<CONFIG_SYS_VENDOR>/<CONFIG_SYS_BOARD> will
+	  be used.
 
-source "board/amlogic/p212/Kconfig"
+config SYS_BOARD
+	string "Board name"
+	default "odroid-c2" if MESON_GXBB
+	default "p212" if MESON_GXL
+	default "q200" if MESON_GXM
+	default ""
+	help
+	  This option contains information about board name.
+	  Based on this option board/<CONFIG_SYS_VENDOR>/<CONFIG_SYS_BOARD> will
+	  be used.
 
-source "board/amlogic/q200/Kconfig"
+config SYS_CONFIG_NAME
+	string "Board configuration name"
+	default "meson64"
+	help
+	  This option contains information about board configuration name.
+	  Based on this option include/configs/<CONFIG_SYS_CONFIG_NAME>.h header
+	  will be used for board configuration.
 
 endif
diff --git a/board/amlogic/odroid-c2/Kconfig b/board/amlogic/odroid-c2/Kconfig
deleted file mode 100644
index 2b16889..0000000
--- a/board/amlogic/odroid-c2/Kconfig
+++ /dev/null
@@ -1,12 +0,0 @@
-if TARGET_ODROID_C2
-
-config SYS_BOARD
-	default "odroid-c2"
-
-config SYS_VENDOR
-	default "amlogic"
-
-config SYS_CONFIG_NAME
-	default "odroid-c2"
-
-endif
diff --git a/board/amlogic/p212/Kconfig b/board/amlogic/p212/Kconfig
deleted file mode 100644
index 720c92b..0000000
--- a/board/amlogic/p212/Kconfig
+++ /dev/null
@@ -1,12 +0,0 @@
-if TARGET_P212
-
-config SYS_BOARD
-	default "p212"
-
-config SYS_VENDOR
-	default "amlogic"
-
-config SYS_CONFIG_NAME
-	default "p212"
-
-endif
diff --git a/board/amlogic/q200/Kconfig b/board/amlogic/q200/Kconfig
deleted file mode 100644
index cfaf379..0000000
--- a/board/amlogic/q200/Kconfig
+++ /dev/null
@@ -1,12 +0,0 @@
-if TARGET_Q200
-
-config SYS_BOARD
-	default "q200"
-
-config SYS_VENDOR
-	default "amlogic"
-
-config SYS_CONFIG_NAME
-	default "q200"
-
-endif
diff --git a/configs/khadas-vim2_defconfig b/configs/khadas-vim2_defconfig
index 387d7da..40e7cac 100644
--- a/configs/khadas-vim2_defconfig
+++ b/configs/khadas-vim2_defconfig
@@ -2,7 +2,6 @@ CONFIG_ARM=y
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_MESON_GXM=y
-CONFIG_TARGET_Q200=y
 CONFIG_DEBUG_UART_BASE=0xc81004c0
 CONFIG_DEBUG_UART_CLOCK=24000000
 CONFIG_IDENT_STRING=" khadas-vim2"
diff --git a/configs/khadas-vim_defconfig b/configs/khadas-vim_defconfig
index af30113..6e855dd 100644
--- a/configs/khadas-vim_defconfig
+++ b/configs/khadas-vim_defconfig
@@ -2,7 +2,6 @@ CONFIG_ARM=y
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_MESON_GXL=y
-CONFIG_TARGET_P212=y
 CONFIG_DEBUG_UART_BASE=0xc81004c0
 CONFIG_DEBUG_UART_CLOCK=24000000
 CONFIG_IDENT_STRING=" khadas-vim"
diff --git a/configs/libretech-cc_defconfig b/configs/libretech-cc_defconfig
index 7526516..c2f985f 100644
--- a/configs/libretech-cc_defconfig
+++ b/configs/libretech-cc_defconfig
@@ -2,7 +2,6 @@ CONFIG_ARM=y
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_MESON_GXL=y
-CONFIG_TARGET_P212=y
 CONFIG_DEBUG_UART_BASE=0xc81004c0
 CONFIG_DEBUG_UART_CLOCK=24000000
 CONFIG_IDENT_STRING=" libretech-cc"
diff --git a/configs/nanopi-k2_defconfig b/configs/nanopi-k2_defconfig
index 01196d6..8bbf48f 100644
--- a/configs/nanopi-k2_defconfig
+++ b/configs/nanopi-k2_defconfig
@@ -1,8 +1,6 @@
 CONFIG_ARM=y
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
-CONFIG_MESON_GXBB=y
-CONFIG_TARGET_ODROID_C2=y
 CONFIG_DEBUG_UART_BASE=0xc81004c0
 CONFIG_DEBUG_UART_CLOCK=24000000
 CONFIG_IDENT_STRING=" nanopi-k2"
diff --git a/configs/odroid-c2_defconfig b/configs/odroid-c2_defconfig
index 19196b3..68554ba 100644
--- a/configs/odroid-c2_defconfig
+++ b/configs/odroid-c2_defconfig
@@ -2,7 +2,6 @@ CONFIG_ARM=y
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_MESON_GXBB=y
-CONFIG_TARGET_ODROID_C2=y
 CONFIG_DEBUG_UART_BASE=0xc81004c0
 CONFIG_DEBUG_UART_CLOCK=24000000
 CONFIG_IDENT_STRING=" odroid-c2"
diff --git a/configs/p212_defconfig b/configs/p212_defconfig
index 9e3b1d6..a15064d 100644
--- a/configs/p212_defconfig
+++ b/configs/p212_defconfig
@@ -2,7 +2,6 @@ CONFIG_ARM=y
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_MESON_GXL=y
-CONFIG_TARGET_P212=y
 CONFIG_DEBUG_UART_BASE=0xc81004c0
 CONFIG_DEBUG_UART_CLOCK=24000000
 CONFIG_IDENT_STRING=" p212"
diff --git a/include/configs/khadas-vim.h b/include/configs/khadas-vim.h
deleted file mode 100644
index ff87c02..0000000
--- a/include/configs/khadas-vim.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * Configuration for Khadas VIM
- *
- * Copyright (C) 2017 Baylibre, SAS
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#ifndef __CONFIG_H
-#define __CONFIG_H
-
-#include <configs/meson-gx-common.h>
-
-#endif /* __CONFIG_H */
diff --git a/include/configs/libretech-cc.h b/include/configs/libretech-cc.h
deleted file mode 100644
index 95e0f34..0000000
--- a/include/configs/libretech-cc.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * Configuration for LibreTech CC
- *
- * Copyright (C) 2017 Baylibre, SAS
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#ifndef __CONFIG_H
-#define __CONFIG_H
-
-#include <configs/meson-gx-common.h>
-
-#endif /* __CONFIG_H */
diff --git a/include/configs/meson-gx-common.h b/include/configs/meson-gx-common.h
deleted file mode 100644
index c436976..0000000
--- a/include/configs/meson-gx-common.h
+++ /dev/null
@@ -1,52 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * Configuration for Amlogic Meson GX SoCs
- * (C) Copyright 2016 Beniamino Galvani <b.galvani@gmail.com>
- */
-
-#ifndef __MESON_GX_COMMON_CONFIG_H
-#define __MESON_GX_COMMON_CONFIG_H
-
-#define CONFIG_CPU_ARMV8
-#define CONFIG_REMAKE_ELF
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_SYS_MAXARGS		32
-#define CONFIG_SYS_MALLOC_LEN		(32 << 20)
-#define CONFIG_SYS_CBSIZE		1024
-
-#define CONFIG_SYS_SDRAM_BASE		0
-#define CONFIG_SYS_INIT_SP_ADDR		0x20000000
-#define CONFIG_SYS_LOAD_ADDR		CONFIG_SYS_TEXT_BASE
-
-/* Generic Interrupt Controller Definitions */
-#define GICD_BASE			0xc4301000
-#define GICC_BASE			0xc4302000
-
-#ifdef CONFIG_CMD_USB
-#define BOOT_TARGET_DEVICES_USB(func) func(USB, usb, 0)
-#else
-#define BOOT_TARGET_DEVICES_USB(func)
-#endif
-
-#define BOOT_TARGET_DEVICES(func) \
-	func(MMC, mmc, 0) \
-	func(MMC, mmc, 1) \
-	func(MMC, mmc, 2) \
-	BOOT_TARGET_DEVICES_USB(func) \
-	func(PXE, pxe, na) \
-	func(DHCP, dhcp, na)
-
-#include <config_distro_bootcmd.h>
-
-#define CONFIG_EXTRA_ENV_SETTINGS \
-	"fdt_addr_r=0x01000000\0" \
-	"scriptaddr=0x1f000000\0" \
-	"kernel_addr_r=0x01080000\0" \
-	"pxefile_addr_r=0x01080000\0" \
-	"ramdisk_addr_r=0x13000000\0" \
-	"fdtfile=amlogic/" CONFIG_DEFAULT_DEVICE_TREE ".dtb\0" \
-	BOOTENV
-
-#define CONFIG_SYS_BOOTM_LEN    (64 << 20)      /* 64 MiB */
-
-#endif /* __MESON_GX_COMMON_CONFIG_H */
diff --git a/include/configs/meson64.h b/include/configs/meson64.h
new file mode 100644
index 0000000..1929a3e
--- /dev/null
+++ b/include/configs/meson64.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Configuration for Amlogic Meson 64bits SoCs
+ * (C) Copyright 2016 Beniamino Galvani <b.galvani@gmail.com>
+ */
+
+#ifndef __MESON64_CONFIG_H
+#define __MESON64_CONFIG_H
+
+/* Generic Interrupt Controller Definitions */
+#define GICD_BASE			0xc4301000
+#define GICC_BASE			0xc4302000
+
+#define CONFIG_CPU_ARMV8
+#define CONFIG_REMAKE_ELF
+#define CONFIG_ENV_SIZE			0x2000
+#define CONFIG_SYS_MAXARGS		32
+#define CONFIG_SYS_MALLOC_LEN		(32 << 20)
+#define CONFIG_SYS_CBSIZE		1024
+
+#define CONFIG_SYS_SDRAM_BASE		0
+#define CONFIG_SYS_INIT_SP_ADDR		0x20000000
+#define CONFIG_SYS_LOAD_ADDR		CONFIG_SYS_TEXT_BASE
+#define CONFIG_SYS_BOOTM_LEN		(64 << 20) /* 64 MiB */
+
+#ifdef CONFIG_CMD_USB
+#define BOOT_TARGET_DEVICES_USB(func) func(USB, usb, 0)
+#else
+#define BOOT_TARGET_DEVICES_USB(func)
+#endif
+
+#ifndef BOOT_TARGET_DEVICES
+#define BOOT_TARGET_DEVICES(func) \
+	func(MMC, mmc, 0) \
+	func(MMC, mmc, 1) \
+	func(MMC, mmc, 2) \
+	BOOT_TARGET_DEVICES_USB(func) \
+	func(PXE, pxe, na) \
+	func(DHCP, dhcp, na)
+#endif
+
+#ifndef CONFIG_EXTRA_ENV_SETTINGS
+#define CONFIG_EXTRA_ENV_SETTINGS \
+	"fdt_addr_r=0x01000000\0" \
+	"scriptaddr=0x1f000000\0" \
+	"kernel_addr_r=0x01080000\0" \
+	"pxefile_addr_r=0x01080000\0" \
+	"ramdisk_addr_r=0x13000000\0" \
+	"fdtfile=amlogic/" CONFIG_DEFAULT_DEVICE_TREE ".dtb\0" \
+	BOOTENV
+#endif
+
+#include <config_distro_bootcmd.h>
+
+#endif /* __MESON64_CONFIG_H */
diff --git a/include/configs/nanopi-k2.h b/include/configs/nanopi-k2.h
deleted file mode 100644
index 3fd6e8f..0000000
--- a/include/configs/nanopi-k2.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * Configuration for NANOPI-K2
- * (C) Copyright 2018 Thomas McKahan
- */
-
-#ifndef __CONFIG_H
-#define __CONFIG_H
-
-#include <configs/meson-gx-common.h>
-
-#endif /* __CONFIG_H */
diff --git a/include/configs/odroid-c2.h b/include/configs/odroid-c2.h
deleted file mode 100644
index 87e3ddb..0000000
--- a/include/configs/odroid-c2.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * Configuration for ODROID-C2
- * (C) Copyright 2016 Beniamino Galvani <b.galvani@gmail.com>
- */
-
-#ifndef __CONFIG_H
-#define __CONFIG_H
-
-#include <configs/meson-gx-common.h>
-
-#endif /* __CONFIG_H */
diff --git a/include/configs/p212.h b/include/configs/p212.h
deleted file mode 100644
index 4414293..0000000
--- a/include/configs/p212.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * Configuration for Amlogic P212
- *
- * Copyright (C) 2017 Baylibre, SAS
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#ifndef __CONFIG_H
-#define __CONFIG_H
-
-#include <configs/meson-gx-common.h>
-
-#endif /* __CONFIG_H */
diff --git a/include/configs/q200.h b/include/configs/q200.h
deleted file mode 100644
index 7ef8f42..0000000
--- a/include/configs/q200.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * Configuration for Khadas VIM2
- *
- * Copyright (C) 2017 Baylibre, SAS
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#ifndef __CONFIG_H
-#define __CONFIG_H
-
-#define CONFIG_MISC_INIT_R
-
-#define MESON_FDTFILE_SETTING "fdtfile=amlogic/meson-gxm-khadas-vim2.dtb\0"
-
-#include <configs/meson-gx-common.h>
-
-#endif /* __CONFIG_H */
-- 
2.7.4
