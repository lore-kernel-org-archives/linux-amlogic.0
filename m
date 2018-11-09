From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri,  9 Nov 2018 16:26:44 +0100
Subject: [PATCH u-boot 05/19] board: amlogic: factorise gxbb boards
In-Reply-To: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
References: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1541777218-472-6-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

The nanopi-k2 and the odroid-c2 are similar enough to be supported
by the same u-boot board. This change use odroid-c2 u-boot board
for the nanopi-k2 as well. Dedicated defconfig are kept to customize
the names and device tree.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/mach-meson/Kconfig              | 11 +---
 board/amlogic/nanopi-k2/Kconfig          | 12 ----
 board/amlogic/nanopi-k2/MAINTAINERS      |  6 --
 board/amlogic/nanopi-k2/Makefile         |  7 ---
 board/amlogic/nanopi-k2/README           | 99 --------------------------------
 board/amlogic/nanopi-k2/nanopi-k2.c      | 55 ------------------
 board/amlogic/odroid-c2/MAINTAINERS      |  1 +
 board/amlogic/odroid-c2/README           | 66 ---------------------
 board/amlogic/odroid-c2/README.nanopi-k2 | 99 ++++++++++++++++++++++++++++++++
 board/amlogic/odroid-c2/README.odroid-c2 | 66 +++++++++++++++++++++
 configs/nanopi-k2_defconfig              |  2 +-
 11 files changed, 168 insertions(+), 256 deletions(-)
 delete mode 100644 board/amlogic/nanopi-k2/Kconfig
 delete mode 100644 board/amlogic/nanopi-k2/MAINTAINERS
 delete mode 100644 board/amlogic/nanopi-k2/Makefile
 delete mode 100644 board/amlogic/nanopi-k2/README
 delete mode 100644 board/amlogic/nanopi-k2/nanopi-k2.c
 delete mode 100644 board/amlogic/odroid-c2/README
 create mode 100644 board/amlogic/odroid-c2/README.nanopi-k2
 create mode 100644 board/amlogic/odroid-c2/README.odroid-c2

diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index 98303db..d86b1be 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -31,14 +31,7 @@ config TARGET_ODROID_C2
 	  ODROID-C2 is a single board computer based on Meson GXBaby
 	  with 2 GiB of RAM, Gigabit Ethernet, HDMI, 4 USB, micro-SD
 	  slot, eMMC, IR receiver and a 40-pin GPIO header.
-
-config TARGET_NANOPI_K2
-	bool "NANOPI_K2"
-	select MESON_GXBB
-	help
-	  NANOPI_K2 is a single board computer based on Meson GXBaby
-	  with 2 GiB of RAM, Gigabit Ethernet,AP6212 Wifi, HDMI, 4 USB,
-	  micro-SD slot, eMMC, IR receiver and a 40-pin GPIO header.
+	  You should also select this TARGET if you have an nanopi-k2
 
 config TARGET_P212
 	bool "P212"
@@ -69,8 +62,6 @@ config SYS_MALLOC_F_LEN
 
 source "board/amlogic/odroid-c2/Kconfig"
 
-source "board/amlogic/nanopi-k2/Kconfig"
-
 source "board/amlogic/p212/Kconfig"
 
 source "board/amlogic/q200/Kconfig"
diff --git a/board/amlogic/nanopi-k2/Kconfig b/board/amlogic/nanopi-k2/Kconfig
deleted file mode 100644
index 374bda2..0000000
--- a/board/amlogic/nanopi-k2/Kconfig
+++ /dev/null
@@ -1,12 +0,0 @@
-if TARGET_NANOPI_K2
-
-config SYS_BOARD
-	default "nanopi-k2"
-
-config SYS_VENDOR
-	default "amlogic"
-
-config SYS_CONFIG_NAME
-	default "nanopi-k2"
-
-endif
diff --git a/board/amlogic/nanopi-k2/MAINTAINERS b/board/amlogic/nanopi-k2/MAINTAINERS
deleted file mode 100644
index 0452bd1..0000000
--- a/board/amlogic/nanopi-k2/MAINTAINERS
+++ /dev/null
@@ -1,6 +0,0 @@
-NANOPI-K2
-M:	Neil Armstrong <narmstrong@baylibre.com>
-S:	Maintained
-F:	board/amlogic/nanopi-k2/
-F:	include/configs/nanopi-k2.h
-F:	configs/nanopi-k2_defconfig
diff --git a/board/amlogic/nanopi-k2/Makefile b/board/amlogic/nanopi-k2/Makefile
deleted file mode 100644
index 7d9b666..0000000
--- a/board/amlogic/nanopi-k2/Makefile
+++ /dev/null
@@ -1,7 +0,0 @@
-#
-# (C) Copyright 2018 Thomas McKahan
-#
-# SPDX-License-Identifier:	GPL-2.0+
-#
-
-obj-y	:= nanopi-k2.o
diff --git a/board/amlogic/nanopi-k2/README b/board/amlogic/nanopi-k2/README
deleted file mode 100644
index d450d3c..0000000
--- a/board/amlogic/nanopi-k2/README
+++ /dev/null
@@ -1,99 +0,0 @@
-U-Boot for NanoPi-K2
-====================
-
-NanoPi-K2 is a single board computer manufactured by FriendlyElec
-with the following specifications:
-
- - Amlogic S905 ARM Cortex-A53 quad-core SoC @ 1.5GHz
- - ARM Mali 450 GPU
- - 2GB DDR3 SDRAM
- - Gigabit Ethernet
- - HDMI 2.0 4K/60Hz display
- - 40-pin GPIO header
- - 4 x USB 2.0 Host, 1 x USB OTG
- - eMMC, microSD
- - Infrared receiver
-
-Schematics are available on the manufacturer website.
-
-Currently the u-boot port supports the following devices:
- - serial
- - eMMC, microSD
- - Ethernet
-
-u-boot compilation
-==================
-
- > export ARCH=arm
- > export CROSS_COMPILE=aarch64-none-elf-
- > make nanopi-k2_defconfig
- > make
-
-Image creation
-==============
-
-Amlogic doesn't provide sources for the firmware and for tools needed
-to create the bootloader image, so it is necessary to obtain them from
-the git tree published by the board vendor:
-
- > wget https://releases.linaro.org/archive/13.11/components/toolchain/binaries/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux.tar.xz
- > wget https://releases.linaro.org/archive/13.11/components/toolchain/binaries/gcc-linaro-arm-none-eabi-4.8-2013.11_linux.tar.xz
- > tar xvfJ gcc-linaro-aarch64-none-elf-4.8-2013.11_linux.tar.xz
- > tar xvfJ gcc-linaro-arm-none-eabi-4.8-2013.11_linux.tar.xz
- > export PATH=$PWD/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux/bin:$PWD/gcc-linaro-arm-none-eabi-4.8-2013.11_linux/bin:$PATH
- > git clone https://github.com/BayLibre/u-boot.git -b libretech-cc amlogic-u-boot
- > git clone https://github.com/friendlyarm/u-boot.git -b nanopi-k2-v2015.01 amlogic-u-boot
- > cd amlogic-u-boot
- > sed -i 's/aarch64-linux-gnu-/aarch64-none-elf-/' Makefile
- > sed -i 's/arm-linux-/arm-none-eabi-/' arch/arm/cpu/armv8/gxb/firmware/scp_task/Makefile
- > make nanopi-k2_defconfig
- > make
- > export FIPDIR=$PWD/fip
-
-Go back to mainline U-Boot source tree then :
- > mkdir fip
-
- > cp $FIPDIR/gxb/bl2.bin fip/
- > cp $FIPDIR/gxb/acs.bin fip/
- > cp $FIPDIR/gxb/bl21.bin fip/
- > cp $FIPDIR/gxb/bl30.bin fip/
- > cp $FIPDIR/gxb/bl301.bin fip/
- > cp $FIPDIR/gxb/bl31.img fip/
- > cp u-boot.bin fip/bl33.bin
-
- > $FIPDIR/blx_fix.sh \
-	fip/bl30.bin \
-	fip/zero_tmp \
-	fip/bl30_zero.bin \
-	fip/bl301.bin \
-	fip/bl301_zero.bin \
-	fip/bl30_new.bin \
-	bl30
-
- > $FIPDIR/fip_create \
-	 --bl30 fip/bl30_new.bin \
-	 --bl31 fip/bl31.img \
-	 --bl33 fip/bl33.bin \
-	 fip/fip.bin
-
- > python $FIPDIR/acs_tool.pyc fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0
-
- > $FIPDIR/blx_fix.sh \
-	fip/bl2_acs.bin \
-	fip/zero_tmp \
-	fip/bl2_zero.bin \
-	fip/bl21.bin \
-	fip/bl21_zero.bin \
-	fip/bl2_new.bin \
-	bl2
-
- > cat fip/bl2_new.bin fip/fip.bin > fip/boot_new.bin
-
- > $FIPDIR/gxb/aml_encrypt_gxb --bootsig \
-		--input fip/boot_new.bin
-		--output fip/u-boot.bin
-
-and then write the image to SD with:
-
- > DEV=/dev/your_sd_device
- > dd if=fip/u-boot.bin of=$DEV conv=fsync,notrunc bs=512 seek=1
diff --git a/board/amlogic/nanopi-k2/nanopi-k2.c b/board/amlogic/nanopi-k2/nanopi-k2.c
deleted file mode 100644
index ae29dd6..0000000
--- a/board/amlogic/nanopi-k2/nanopi-k2.c
+++ /dev/null
@@ -1,55 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * (C) Copyright 2018 Thomas McKahan
- */
-
-#include <common.h>
-#include <dm.h>
-#include <environment.h>
-#include <asm/io.h>
-#include <asm/arch/gx.h>
-#include <asm/arch/sm.h>
-#include <asm/arch/eth.h>
-#include <asm/arch/mem.h>
-
-#define EFUSE_SN_OFFSET		20
-#define EFUSE_SN_SIZE		16
-#define EFUSE_MAC_OFFSET	52
-#define EFUSE_MAC_SIZE		6
-
-int board_init(void)
-{
-	return 0;
-}
-
-int misc_init_r(void)
-{
-	u8 mac_addr[EFUSE_MAC_SIZE];
-	char serial[EFUSE_SN_SIZE];
-	ssize_t len;
-
-	meson_gx_eth_init(PHY_INTERFACE_MODE_RGMII, 0);
-
-	if (!eth_env_get_enetaddr("ethaddr", mac_addr)) {
-		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
-					  mac_addr, EFUSE_MAC_SIZE);
-		if (len == EFUSE_MAC_SIZE && is_valid_ethaddr(mac_addr))
-			eth_env_set_enetaddr("ethaddr", mac_addr);
-	}
-
-	if (!env_get("serial#")) {
-		len = meson_sm_read_efuse(EFUSE_SN_OFFSET, serial,
-			EFUSE_SN_SIZE);
-		if (len == EFUSE_SN_SIZE)
-			env_set("serial#", serial);
-	}
-
-	return 0;
-}
-
-int ft_board_setup(void *blob, bd_t *bd)
-{
-	meson_gx_init_reserved_memory(blob);
-
-	return 0;
-}
diff --git a/board/amlogic/odroid-c2/MAINTAINERS b/board/amlogic/odroid-c2/MAINTAINERS
index 699850f..fd74d53 100644
--- a/board/amlogic/odroid-c2/MAINTAINERS
+++ b/board/amlogic/odroid-c2/MAINTAINERS
@@ -1,5 +1,6 @@
 ODROID-C2
 M:	Beniamino Galvani <b.galvani@gmail.com>
+M:	Neil Armstrong <narmstrong@baylibre.com>
 S:	Maintained
 F:	board/amlogic/odroid-c2/
 F:	include/configs/odroid-c2.h
diff --git a/board/amlogic/odroid-c2/README b/board/amlogic/odroid-c2/README
deleted file mode 100644
index bed48c5..0000000
--- a/board/amlogic/odroid-c2/README
+++ /dev/null
@@ -1,66 +0,0 @@
-U-Boot for ODROID-C2
-====================
-
-ODROID-C2 is a single board computer manufactured by Hardkernel
-Co. Ltd with the following specifications:
-
- - Amlogic S905 ARM Cortex-A53 quad-core SoC @ 2GHz
- - ARM Mali 450 GPU
- - 2GB DDR3 SDRAM
- - Gigabit Ethernet
- - HDMI 2.0 4K/60Hz display
- - 40-pin GPIO header
- - 4 x USB 2.0 Host, 1 x USB OTG
- - eMMC, microSD
- - Infrared receiver
-
-Schematics are available on the manufacturer website.
-
-Currently the u-boot port supports the following devices:
- - serial
- - eMMC, microSD
- - Ethernet
- - I2C
- - Regulators
- - Reset controller
- - Clock controller
- - ADC
-
-u-boot compilation
-==================
-
- > export ARCH=arm
- > export CROSS_COMPILE=aarch64-none-elf-
- > make odroid-c2_defconfig
- > make
-
-Image creation
-==============
-
-Amlogic doesn't provide sources for the firmware and for tools needed
-to create the bootloader image, so it is necessary to obtain them from
-the git tree published by the board vendor:
-
- > DIR=odroid-c2
- > git clone --depth 1 \
-       https://github.com/hardkernel/u-boot.git -b odroidc2-v2015.01 \
-       $DIR
- > $DIR/fip/fip_create --bl30  $DIR/fip/gxb/bl30.bin \
-                       --bl301 $DIR/fip/gxb/bl301.bin \
-                       --bl31  $DIR/fip/gxb/bl31.bin \
-                       --bl33  u-boot.bin \
-                       $DIR/fip.bin
- > $DIR/fip/fip_create --dump $DIR/fip.bin
- > cat $DIR/fip/gxb/bl2.package $DIR/fip.bin > $DIR/boot_new.bin
- > $DIR/fip/gxb/aml_encrypt_gxb --bootsig \
-                                --input $DIR/boot_new.bin \
-                                --output $DIR/u-boot.img
- > dd if=$DIR/u-boot.img of=$DIR/u-boot.gxbb bs=512 skip=96
-
-and then write the image to SD with:
-
- > DEV=/dev/your_sd_device
- > BL1=$DIR/sd_fuse/bl1.bin.hardkernel
- > dd if=$BL1 of=$DEV conv=fsync bs=1 count=442
- > dd if=$BL1 of=$DEV conv=fsync bs=512 skip=1 seek=1
- > dd if=$DIR/u-boot.gxbb of=$DEV conv=fsync bs=512 seek=97
diff --git a/board/amlogic/odroid-c2/README.nanopi-k2 b/board/amlogic/odroid-c2/README.nanopi-k2
new file mode 100644
index 0000000..d450d3c
--- /dev/null
+++ b/board/amlogic/odroid-c2/README.nanopi-k2
@@ -0,0 +1,99 @@
+U-Boot for NanoPi-K2
+====================
+
+NanoPi-K2 is a single board computer manufactured by FriendlyElec
+with the following specifications:
+
+ - Amlogic S905 ARM Cortex-A53 quad-core SoC @ 1.5GHz
+ - ARM Mali 450 GPU
+ - 2GB DDR3 SDRAM
+ - Gigabit Ethernet
+ - HDMI 2.0 4K/60Hz display
+ - 40-pin GPIO header
+ - 4 x USB 2.0 Host, 1 x USB OTG
+ - eMMC, microSD
+ - Infrared receiver
+
+Schematics are available on the manufacturer website.
+
+Currently the u-boot port supports the following devices:
+ - serial
+ - eMMC, microSD
+ - Ethernet
+
+u-boot compilation
+==================
+
+ > export ARCH=arm
+ > export CROSS_COMPILE=aarch64-none-elf-
+ > make nanopi-k2_defconfig
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
+ > git clone https://github.com/BayLibre/u-boot.git -b libretech-cc amlogic-u-boot
+ > git clone https://github.com/friendlyarm/u-boot.git -b nanopi-k2-v2015.01 amlogic-u-boot
+ > cd amlogic-u-boot
+ > sed -i 's/aarch64-linux-gnu-/aarch64-none-elf-/' Makefile
+ > sed -i 's/arm-linux-/arm-none-eabi-/' arch/arm/cpu/armv8/gxb/firmware/scp_task/Makefile
+ > make nanopi-k2_defconfig
+ > make
+ > export FIPDIR=$PWD/fip
+
+Go back to mainline U-Boot source tree then :
+ > mkdir fip
+
+ > cp $FIPDIR/gxb/bl2.bin fip/
+ > cp $FIPDIR/gxb/acs.bin fip/
+ > cp $FIPDIR/gxb/bl21.bin fip/
+ > cp $FIPDIR/gxb/bl30.bin fip/
+ > cp $FIPDIR/gxb/bl301.bin fip/
+ > cp $FIPDIR/gxb/bl31.img fip/
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
+ > $FIPDIR/fip_create \
+	 --bl30 fip/bl30_new.bin \
+	 --bl31 fip/bl31.img \
+	 --bl33 fip/bl33.bin \
+	 fip/fip.bin
+
+ > python $FIPDIR/acs_tool.pyc fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0
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
+ > cat fip/bl2_new.bin fip/fip.bin > fip/boot_new.bin
+
+ > $FIPDIR/gxb/aml_encrypt_gxb --bootsig \
+		--input fip/boot_new.bin
+		--output fip/u-boot.bin
+
+and then write the image to SD with:
+
+ > DEV=/dev/your_sd_device
+ > dd if=fip/u-boot.bin of=$DEV conv=fsync,notrunc bs=512 seek=1
diff --git a/board/amlogic/odroid-c2/README.odroid-c2 b/board/amlogic/odroid-c2/README.odroid-c2
new file mode 100644
index 0000000..bed48c5
--- /dev/null
+++ b/board/amlogic/odroid-c2/README.odroid-c2
@@ -0,0 +1,66 @@
+U-Boot for ODROID-C2
+====================
+
+ODROID-C2 is a single board computer manufactured by Hardkernel
+Co. Ltd with the following specifications:
+
+ - Amlogic S905 ARM Cortex-A53 quad-core SoC @ 2GHz
+ - ARM Mali 450 GPU
+ - 2GB DDR3 SDRAM
+ - Gigabit Ethernet
+ - HDMI 2.0 4K/60Hz display
+ - 40-pin GPIO header
+ - 4 x USB 2.0 Host, 1 x USB OTG
+ - eMMC, microSD
+ - Infrared receiver
+
+Schematics are available on the manufacturer website.
+
+Currently the u-boot port supports the following devices:
+ - serial
+ - eMMC, microSD
+ - Ethernet
+ - I2C
+ - Regulators
+ - Reset controller
+ - Clock controller
+ - ADC
+
+u-boot compilation
+==================
+
+ > export ARCH=arm
+ > export CROSS_COMPILE=aarch64-none-elf-
+ > make odroid-c2_defconfig
+ > make
+
+Image creation
+==============
+
+Amlogic doesn't provide sources for the firmware and for tools needed
+to create the bootloader image, so it is necessary to obtain them from
+the git tree published by the board vendor:
+
+ > DIR=odroid-c2
+ > git clone --depth 1 \
+       https://github.com/hardkernel/u-boot.git -b odroidc2-v2015.01 \
+       $DIR
+ > $DIR/fip/fip_create --bl30  $DIR/fip/gxb/bl30.bin \
+                       --bl301 $DIR/fip/gxb/bl301.bin \
+                       --bl31  $DIR/fip/gxb/bl31.bin \
+                       --bl33  u-boot.bin \
+                       $DIR/fip.bin
+ > $DIR/fip/fip_create --dump $DIR/fip.bin
+ > cat $DIR/fip/gxb/bl2.package $DIR/fip.bin > $DIR/boot_new.bin
+ > $DIR/fip/gxb/aml_encrypt_gxb --bootsig \
+                                --input $DIR/boot_new.bin \
+                                --output $DIR/u-boot.img
+ > dd if=$DIR/u-boot.img of=$DIR/u-boot.gxbb bs=512 skip=96
+
+and then write the image to SD with:
+
+ > DEV=/dev/your_sd_device
+ > BL1=$DIR/sd_fuse/bl1.bin.hardkernel
+ > dd if=$BL1 of=$DEV conv=fsync bs=1 count=442
+ > dd if=$BL1 of=$DEV conv=fsync bs=512 skip=1 seek=1
+ > dd if=$DIR/u-boot.gxbb of=$DEV conv=fsync bs=512 seek=97
diff --git a/configs/nanopi-k2_defconfig b/configs/nanopi-k2_defconfig
index 5c8c747..01196d6 100644
--- a/configs/nanopi-k2_defconfig
+++ b/configs/nanopi-k2_defconfig
@@ -2,7 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_MESON_GXBB=y
-CONFIG_TARGET_NANOPI_K2=y
+CONFIG_TARGET_ODROID_C2=y
 CONFIG_DEBUG_UART_BASE=0xc81004c0
 CONFIG_DEBUG_UART_CLOCK=24000000
 CONFIG_IDENT_STRING=" nanopi-k2"
-- 
2.7.4
