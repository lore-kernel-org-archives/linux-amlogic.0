From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 12 Oct 2017 15:50:32 +0200
Subject: [PATCH u-boot 3/3] arm: add initial support for Amlogic P212 based on
 Meson GXL family
In-Reply-To: <1507816232-8227-1-git-send-email-narmstrong@baylibre.com>
References: <1507816232-8227-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1507816232-8227-4-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This adds platform code for the Amlogic P212 reference board based on a
Meson GXL (S905X) SoC with the Meson GXL configuration.

This initial submission only supports UART and MMC/SDCard, support for the
internal Ethernet PHY in Work In Progress.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/mach-meson/Kconfig    | 22 ++++++++++
 board/amlogic/p212/Kconfig     | 12 ++++++
 board/amlogic/p212/MAINTAINERS |  6 +++
 board/amlogic/p212/Makefile    |  8 ++++
 board/amlogic/p212/README      | 96 ++++++++++++++++++++++++++++++++++++++++++
 board/amlogic/p212/p212.c      | 21 +++++++++
 configs/p212_defconfig         | 31 ++++++++++++++
 include/configs/p212.h         | 22 ++++++++++
 8 files changed, 218 insertions(+)
 create mode 100644 board/amlogic/p212/Kconfig
 create mode 100644 board/amlogic/p212/MAINTAINERS
 create mode 100644 board/amlogic/p212/Makefile
 create mode 100644 board/amlogic/p212/README
 create mode 100644 board/amlogic/p212/p212.c
 create mode 100644 configs/p212_defconfig
 create mode 100644 include/configs/p212.h

diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index af3be59..d4bd230 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -9,6 +9,15 @@ config MESON_GXBB
 	  The Amlogic Meson GXBaby (S905) is an ARM SoC with a
 	  quad-core Cortex-A53 CPU and a Mali-450 GPU.
 
+config MESON_GXL
+	bool "Support Meson GXL"
+	select ARM64
+	select DM
+	select DM_SERIAL
+	help
+	  The Amlogic Meson GXL (S905X and S905X) is an ARM SoC with a
+	  quad-core Cortex-A53 CPU and a Mali-450 GPU.
+
 if MESON_GXBB
 
 config TARGET_ODROID_C2
@@ -20,6 +29,17 @@ config TARGET_ODROID_C2
 
 endif
 
+if MESON_GXL
+
+config TARGET_P212
+	bool "P212"
+	help
+	  P212 is a reference dessign board based on Meson GXL S905X SoC
+	  with 2 GiB of RAM, Ethernet, HDMI, 2 USB, micro-SD slot,
+	  eMMC, IR receiver, CVBS+Audio jack and a SDIO WiFi module.
+
+endif
+
 config SYS_SOC
 	default "meson"
 
@@ -28,4 +48,6 @@ config SYS_MALLOC_F_LEN
 
 source "board/amlogic/odroid-c2/Kconfig"
 
+source "board/amlogic/p212/Kconfig"
+
 endif
diff --git a/board/amlogic/p212/Kconfig b/board/amlogic/p212/Kconfig
new file mode 100644
index 0000000..720c92b
--- /dev/null
+++ b/board/amlogic/p212/Kconfig
@@ -0,0 +1,12 @@
+if TARGET_P212
+
+config SYS_BOARD
+	default "p212"
+
+config SYS_VENDOR
+	default "amlogic"
+
+config SYS_CONFIG_NAME
+	default "p212"
+
+endif
diff --git a/board/amlogic/p212/MAINTAINERS b/board/amlogic/p212/MAINTAINERS
new file mode 100644
index 0000000..6575f17
--- /dev/null
+++ b/board/amlogic/p212/MAINTAINERS
@@ -0,0 +1,6 @@
+P212
+M:	Neil Armstrong <narmstrong@baylibre.com>
+S:	Maintained
+F:	board/amlogic/p212/
+F:	include/configs/p212.h
+F:	configs/p212_defconfig
diff --git a/board/amlogic/p212/Makefile b/board/amlogic/p212/Makefile
new file mode 100644
index 0000000..960a661
--- /dev/null
+++ b/board/amlogic/p212/Makefile
@@ -0,0 +1,8 @@
+#
+# (C) Copyright 2016 BayLibre, SAS
+# Author: Neil Armstrong <narmstrong@baylibre.com>
+#
+# SPDX-License-Identifier:	GPL-2.0+
+#
+
+obj-y	:= p212.o
diff --git a/board/amlogic/p212/README b/board/amlogic/p212/README
new file mode 100644
index 0000000..979502d
--- /dev/null
+++ b/board/amlogic/p212/README
@@ -0,0 +1,96 @@
+U-Boot for Amlogic P212
+=======================
+
+P212 is a reference board manufactured by Amlogic with the following
+specifications:
+
+ - Amlogic S905X ARM Cortex-A53 quad-core SoC @ 1.5GHz
+ - ARM Mali 450 GPU
+ - 2GB DDR3 SDRAM
+ - 10/100 Ethernet
+ - HDMI 2.0 4K/60Hz display
+ - 2 x USB 2.0 Host
+ - eMMC, microSD
+ - Infrared receiver
+ - SDIO WiFi Module
+ - CVBS+Stereo Audio Jack
+
+Schematics are available from Amlogic on demand.
+
+Currently the u-boot port supports the following devices:
+ - serial
+ - eMMC, microSD
+
+u-boot compilation
+==================
+
+ > export ARCH=arm
+ > export CROSS_COMPILE=aarch64-none-elf-
+ > make p212_defconfig
+ > make
+
+Image creation
+==============
+
+Amlogic doesn't provide sources for the firmware and for tools needed
+to create the bootloader image, so it is necessary to obtain them from
+the git tree published by the board vendor:
+
+ > wget https://releases.linaro.org/archive/13.11/components/toolchain/binaries/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux.tar.xz
+ > wget https://releases.linaro.org/archive/13.11/components/toolchain/binaries/gcc-linaro-arm-none-eabi-4.8-2013.11_linux.tar.xz
+ > tar xvfJ gcc-linaro-aarch64-none-elf-4.8-2013.11_linux.tar.xz
+ > tar xvfJ gcc-linaro-arm-none-eabi-4.8-2013.11_linux.tar.xz
+ > export PATH=$PWD/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux/bin:$PWD/gcc-linaro-arm-none-eabi-4.8-2013.11_linux/bin:$PATH
+ > git clone https://github.com/BayLibre/u-boot.git -b n-amlogic-openlinux-20170606 amlogic-u-boot
+ > cd amlogic-u-boot
+ > make gxl_p212_v1_defconfig
+ > make
+ > export FIPDIR=$PWD/fip
+
+Go back to mainline U-boot source tree then :
+ > mkdir fip
+
+ > cp $FIPDIR/gxl/bl2.bin fip/
+ > cp $FIPDIR/gxl/acs.bin fip/
+ > cp $FIPDIR/gxl/bl21.bin fip/
+ > cp $FIPDIR/gxl/bl30.bin fip/
+ > cp $FIPDIR/gxl/bl301.bin fip/
+ > cp $FIPDIR/gxl/bl31.img fip/
+ > cp u-boot.bin fip/bl33.bin
+
+ > $FIPDIR/blx_fix.sh \
+	fip/bl30.bin \
+	fip/zero_tmp \
+	fip/bl30_zero.bin \
+	fip/bl301.bin \
+	fip/bl301_zero.bin \
+	fip/bl30_new.bin \
+	bl30
+
+ > $FIPDIR/acs_tool.pyc fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0
+
+ > $FIPDIR/blx_fix.sh \
+	fip/bl2_acs.bin \
+	fip/zero_tmp \
+	fip/bl2_zero.bin \
+	fip/bl21.bin \
+	fip/bl21_zero.bin \
+	fip/bl2_new.bin \
+	bl2
+
+ > $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl30_new.bin
+ > $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl31.img
+ > $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl33.bin
+ > $FIPDIR/gxl/aml_encrypt_gxl --bl2sig --input fip/bl2_new.bin --output fip/bl2.n.bin.sig
+ > $FIPDIR/gxl/aml_encrypt_gxl --bootmk \
+		--output fip/u-boot.bin \
+		--bl2 fip/bl2.n.bin.sig \
+		--bl30 fip/bl30_new.bin.enc \
+		--bl31 fip/bl31.img.enc \
+		--bl33 fip/bl33.bin.enc
+
+and then write the image to SD with:
+
+ > DEV=/dev/your_sd_device
+ > dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
+ > dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=444
diff --git a/board/amlogic/p212/p212.c b/board/amlogic/p212/p212.c
new file mode 100644
index 0000000..1eeb7f2
--- /dev/null
+++ b/board/amlogic/p212/p212.c
@@ -0,0 +1,21 @@
+/*
+ * Copyright (C) 2016 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#include <common.h>
+#include <dm.h>
+#include <asm/io.h>
+#include <asm/arch/gxbb.h>
+
+int board_init(void)
+{
+	return 0;
+}
+
+int misc_init_r(void)
+{
+       return 0;
+}
diff --git a/configs/p212_defconfig b/configs/p212_defconfig
new file mode 100644
index 0000000..3c57621
--- /dev/null
+++ b/configs/p212_defconfig
@@ -0,0 +1,31 @@
+CONFIG_ARM=y
+CONFIG_ARCH_MESON=y
+CONFIG_MESON_GXL=y
+CONFIG_TARGET_P212=y
+CONFIG_IDENT_STRING=" p212"
+CONFIG_DEFAULT_DEVICE_TREE="meson-gxl-s905x-p212"
+CONFIG_DEBUG_UART=y
+CONFIG_ENV_IS_NOWHERE=y
+# CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_DISPLAY_BOARDINFO is not set
+# CONFIG_CMD_BDI is not set
+# CONFIG_CMD_IMI is not set
+# CONFIG_CMD_IMLS is not set
+# CONFIG_CMD_LOADS is not set
+CONFIG_CMD_MMC=y
+# CONFIG_CMD_FPGA is not set
+CONFIG_CMD_GPIO=y
+# CONFIG_CMD_SETEXPR is not set
+CONFIG_OF_CONTROL=y
+CONFIG_DM_GPIO=y
+CONFIG_DM_MMC=y
+CONFIG_MMC_MESON_GX=y
+CONFIG_PINCTRL=y
+CONFIG_PINCTRL_MESON_GXL=y
+CONFIG_DEBUG_UART_MESON=y
+CONFIG_DEBUG_UART_BASE=0xc81004c0
+CONFIG_DEBUG_UART_CLOCK=24000000
+CONFIG_DEBUG_UART_ANNOUNCE=y
+CONFIG_DEBUG_UART_SKIP_INIT=y
+CONFIG_MESON_SERIAL=y
+CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/include/configs/p212.h b/include/configs/p212.h
new file mode 100644
index 0000000..0477384
--- /dev/null
+++ b/include/configs/p212.h
@@ -0,0 +1,22 @@
+/*
+ * Configuration for Amlogic P212
+ *
+ * Copyright (C) 2017 Baylibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#ifndef __CONFIG_H
+#define __CONFIG_H
+
+#define CONFIG_MISC_INIT_R
+
+/* Serial setup */
+#define CONFIG_CONS_INDEX		0
+
+#define MESON_FDTFILE_SETTING "fdtfile=amlogic/meson-gxl-s905x-p212.dtb\0"
+
+#include <configs/meson-gxbb-common.h>
+
+#endif /* __CONFIG_H */
-- 
2.7.4
