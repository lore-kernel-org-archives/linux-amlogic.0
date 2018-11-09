From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri,  9 Nov 2018 16:26:42 +0100
Subject: [PATCH u-boot 03/19] board: amlogic: remove p212 derivatives
In-Reply-To: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
References: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1541777218-472-4-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

The Khadas vim and the libretech aml-s905x-cc (aka Potato) derive
from amlogic s905x reference design (P212).

All the code in these board is a copy/paste from the p212, which is
tedious to maintain. This change use p212 u-boot board for all these
boards, while keeping a dedicated defconfig to customize the names
and device tree.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/mach-meson/Kconfig               |  22 +------
 board/amlogic/khadas-vim/Kconfig          |  12 ----
 board/amlogic/khadas-vim/MAINTAINERS      |   6 --
 board/amlogic/khadas-vim/Makefile         |   6 --
 board/amlogic/khadas-vim/README           | 102 -----------------------------
 board/amlogic/khadas-vim/khadas-vim.c     |  57 -----------------
 board/amlogic/libretech-cc/Kconfig        |  12 ----
 board/amlogic/libretech-cc/MAINTAINERS    |   6 --
 board/amlogic/libretech-cc/Makefile       |   6 --
 board/amlogic/libretech-cc/README         | 102 -----------------------------
 board/amlogic/libretech-cc/libretech-cc.c |  57 -----------------
 board/amlogic/p212/README                 | 103 ------------------------------
 board/amlogic/p212/README.khadas-vim      | 102 +++++++++++++++++++++++++++++
 board/amlogic/p212/README.libretech-cc    | 102 +++++++++++++++++++++++++++++
 board/amlogic/p212/README.p212            | 103 ++++++++++++++++++++++++++++++
 configs/khadas-vim_defconfig              |   2 +-
 configs/libretech-cc_defconfig            |   2 +-
 17 files changed, 311 insertions(+), 491 deletions(-)
 delete mode 100644 board/amlogic/khadas-vim/Kconfig
 delete mode 100644 board/amlogic/khadas-vim/MAINTAINERS
 delete mode 100644 board/amlogic/khadas-vim/Makefile
 delete mode 100644 board/amlogic/khadas-vim/README
 delete mode 100644 board/amlogic/khadas-vim/khadas-vim.c
 delete mode 100644 board/amlogic/libretech-cc/Kconfig
 delete mode 100644 board/amlogic/libretech-cc/MAINTAINERS
 delete mode 100644 board/amlogic/libretech-cc/Makefile
 delete mode 100644 board/amlogic/libretech-cc/README
 delete mode 100644 board/amlogic/libretech-cc/libretech-cc.c
 delete mode 100644 board/amlogic/p212/README
 create mode 100644 board/amlogic/p212/README.khadas-vim
 create mode 100644 board/amlogic/p212/README.libretech-cc
 create mode 100644 board/amlogic/p212/README.p212

diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index bc0f6a1..e0b2812 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -47,22 +47,8 @@ config TARGET_P212
 	  P212 is a reference dessign board based on Meson GXL S905X SoC
 	  with 2 GiB of RAM, Ethernet, HDMI, 2 USB, micro-SD slot,
 	  eMMC, IR receiver, CVBS+Audio jack and a SDIO WiFi module.
-
-config TARGET_LIBRETECH_CC
-	bool "LIBRETECH-CC"
-	select MESON_GXL
-	help
-	  LibreTech CC is a single board computer based on Meson GXL
-	  with 2 GiB of RAM, Ethernet, HDMI, 4 USB, micro-SD slot,
-	  eMMC, IR receiver and a 40-pin GPIO header.
-
-config TARGET_KHADAS_VIM
-	bool "KHADAS-VIM"
-	select MESON_GXL
-	help
-	  Khadas VIM is a single board computer based on Meson GXL
-	  with 2 GiB of RAM, Ethernet, HDMI, 4 USB, micro-SD slot,
-	  eMMC, IR receiver and a 40-pin GPIO header.
+	  You should also select this TARGET if you have Khadas Vim or
+	  a libretech aml-s905x-cc
 
 config TARGET_KHADAS_VIM2
 	bool "KHADAS-VIM2"
@@ -86,10 +72,6 @@ source "board/amlogic/nanopi-k2/Kconfig"
 
 source "board/amlogic/p212/Kconfig"
 
-source "board/amlogic/libretech-cc/Kconfig"
-
-source "board/amlogic/khadas-vim/Kconfig"
-
 source "board/amlogic/khadas-vim2/Kconfig"
 
 endif
diff --git a/board/amlogic/khadas-vim/Kconfig b/board/amlogic/khadas-vim/Kconfig
deleted file mode 100644
index 0fa8db9..0000000
--- a/board/amlogic/khadas-vim/Kconfig
+++ /dev/null
@@ -1,12 +0,0 @@
-if TARGET_KHADAS_VIM
-
-config SYS_BOARD
-	default "khadas-vim"
-
-config SYS_VENDOR
-	default "amlogic"
-
-config SYS_CONFIG_NAME
-	default "khadas-vim"
-
-endif
diff --git a/board/amlogic/khadas-vim/MAINTAINERS b/board/amlogic/khadas-vim/MAINTAINERS
deleted file mode 100644
index 024220a..0000000
--- a/board/amlogic/khadas-vim/MAINTAINERS
+++ /dev/null
@@ -1,6 +0,0 @@
-KHADAS-VIM
-M:	Neil Armstrong <narmstrong@baylibre.com>
-S:	Maintained
-F:	board/amlogic/khadas-vim/
-F:	include/configs/khadas-vim.h
-F:	configs/khadas-vim_defconfig
diff --git a/board/amlogic/khadas-vim/Makefile b/board/amlogic/khadas-vim/Makefile
deleted file mode 100644
index 558c076..0000000
--- a/board/amlogic/khadas-vim/Makefile
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0+
-#
-# (C) Copyright 2016 BayLibre, SAS
-# Author: Neil Armstrong <narmstrong@baylibre.com>
-
-obj-y	:= khadas-vim.o
diff --git a/board/amlogic/khadas-vim/README b/board/amlogic/khadas-vim/README
deleted file mode 100644
index b194236..0000000
--- a/board/amlogic/khadas-vim/README
+++ /dev/null
@@ -1,102 +0,0 @@
-U-Boot for Khadas VIM
-=======================
-
-Khadas VIM is an Open Source DIY Box manufactured by Shenzhen Wesion
-Technology Co., Ltd with the following specifications:
-
- - Amlogic S905X ARM Cortex-A53 quad-core SoC @ 1.5GHz
- - ARM Mali 450 GPU
- - 2GB DDR3 SDRAM
- - 10/100 Ethernet
- - HDMI 2.0 4K/60Hz display
- - 40-pin GPIO header
- - 2 x USB 2.0 Host, 1 x USB 2.0 Type-C OTG
- - 8GB/16GBeMMC
- - microSD
- - SDIO Wifi Module, Bluetooth
- - Two channels IR receiver
-
-Currently the u-boot port supports the following devices:
- - serial
- - eMMC, microSD
- - Ethernet
- - I2C
- - Regulators
- - Reset controller
- - Clock controller
- - USB Host
- - ADC
-
-U-Boot compilation
-==================
-
- > export ARCH=arm
- > export CROSS_COMPILE=aarch64-none-elf-
- > make khadas-vim_defconfig
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
- > git clone https://github.com/khadas/u-boot -b Vim vim-u-boot
- > cd vim-u-boot
- > make kvim_defconfig
- > make
- > export FIPDIR=$PWD/fip
-
-Go back to mainline U-Boot source tree then :
- > mkdir fip
-
- > cp $FIPDIR/gxl/bl2.bin fip/
- > cp $FIPDIR/gxl/acs.bin fip/
- > cp $FIPDIR/gxl/bl21.bin fip/
- > cp $FIPDIR/gxl/bl30.bin fip/
- > cp $FIPDIR/gxl/bl301.bin fip/
- > cp $FIPDIR/gxl/bl31.img fip/
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
- > $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl30_new.bin
- > $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl31.img
- > $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl33.bin
- > $FIPDIR/gxl/aml_encrypt_gxl --bl2sig --input fip/bl2_new.bin --output fip/bl2.n.bin.sig
- > $FIPDIR/gxl/aml_encrypt_gxl --bootmk \
-		--output fip/u-boot.bin \
-		--bl2 fip/bl2.n.bin.sig \
-		--bl30 fip/bl30_new.bin.enc \
-		--bl31 fip/bl31.img.enc \
-		--bl33 fip/bl33.bin.enc
-
-and then write the image to SD with:
-
- > DEV=/dev/your_sd_device
- > dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
- > dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=444
diff --git a/board/amlogic/khadas-vim/khadas-vim.c b/board/amlogic/khadas-vim/khadas-vim.c
deleted file mode 100644
index 692bf2a..0000000
--- a/board/amlogic/khadas-vim/khadas-vim.c
+++ /dev/null
@@ -1,57 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Copyright (C) 2016 BayLibre, SAS
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#include <common.h>
-#include <dm.h>
-#include <environment.h>
-#include <asm/io.h>
-#include <asm/arch/gx.h>
-#include <asm/arch/mem.h>
-#include <asm/arch/sm.h>
-#include <asm/arch/eth.h>
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
-	meson_gx_eth_init(PHY_INTERFACE_MODE_RMII,
-			  MESON_GXL_USE_INTERNAL_RMII_PHY);
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
-					  EFUSE_SN_SIZE);
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
diff --git a/board/amlogic/libretech-cc/Kconfig b/board/amlogic/libretech-cc/Kconfig
deleted file mode 100644
index 7a6f916..0000000
--- a/board/amlogic/libretech-cc/Kconfig
+++ /dev/null
@@ -1,12 +0,0 @@
-if TARGET_LIBRETECH_CC
-
-config SYS_BOARD
-	default "libretech-cc"
-
-config SYS_VENDOR
-	default "amlogic"
-
-config SYS_CONFIG_NAME
-	default "libretech-cc"
-
-endif
diff --git a/board/amlogic/libretech-cc/MAINTAINERS b/board/amlogic/libretech-cc/MAINTAINERS
deleted file mode 100644
index 398ce57..0000000
--- a/board/amlogic/libretech-cc/MAINTAINERS
+++ /dev/null
@@ -1,6 +0,0 @@
-LIBRETECH-CC
-M:	Neil Armstrong <narmstrong@baylibre.com>
-S:	Maintained
-F:	board/amlogic/libretech-cc/
-F:	include/configs/libretech-cc.h
-F:	configs/libretech-cc_defconfig
diff --git a/board/amlogic/libretech-cc/Makefile b/board/amlogic/libretech-cc/Makefile
deleted file mode 100644
index 3b0adf8..0000000
--- a/board/amlogic/libretech-cc/Makefile
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0+
-#
-# (C) Copyright 2016 BayLibre, SAS
-# Author: Neil Armstrong <narmstrong@baylibre.com>
-
-obj-y	:= libretech-cc.o
diff --git a/board/amlogic/libretech-cc/README b/board/amlogic/libretech-cc/README
deleted file mode 100644
index d007f58..0000000
--- a/board/amlogic/libretech-cc/README
+++ /dev/null
@@ -1,102 +0,0 @@
-U-Boot for LibreTech CC
-=======================
-
-LibreTech CC is a single board computer manufactured by Libre Technology
-with the following specifications:
-
- - Amlogic S905X ARM Cortex-A53 quad-core SoC @ 1.5GHz
- - ARM Mali 450 GPU
- - 2GB DDR3 SDRAM
- - 10/100 Ethernet
- - HDMI 2.0 4K/60Hz display
- - 40-pin GPIO header
- - 4 x USB 2.0 Host
- - eMMC, microSD
- - Infrared receiver
-
-Schematics are available on the manufacturer website.
-
-Currently the U-Boot port supports the following devices:
- - serial
- - eMMC, microSD
- - Ethernet
- - I2C
- - Regulators
- - Reset controller
- - Clock controller
- - USB Host
- - ADC
-
-U-Boot compilation
-==================
-
- > export ARCH=arm
- > export CROSS_COMPILE=aarch64-none-elf-
- > make libretech-cc_defconfig
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
- > cd amlogic-u-boot
- > make libretech_cc_defconfig
- > make
- > export FIPDIR=$PWD/fip
-
-Go back to mainline U-Boot source tree then :
- > mkdir fip
-
- > cp $FIPDIR/gxl/bl2.bin fip/
- > cp $FIPDIR/gxl/acs.bin fip/
- > cp $FIPDIR/gxl/bl21.bin fip/
- > cp $FIPDIR/gxl/bl30.bin fip/
- > cp $FIPDIR/gxl/bl301.bin fip/
- > cp $FIPDIR/gxl/bl31.img fip/
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
- > $FIPDIR/acs_tool.pyc fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0
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
- > $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl30_new.bin
- > $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl31.img
- > $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl33.bin
- > $FIPDIR/gxl/aml_encrypt_gxl --bl2sig --input fip/bl2_new.bin --output fip/bl2.n.bin.sig
- > $FIPDIR/gxl/aml_encrypt_gxl --bootmk \
-		--output fip/u-boot.bin \
-		--bl2 fip/bl2.n.bin.sig \
-		--bl30 fip/bl30_new.bin.enc \
-		--bl31 fip/bl31.img.enc \
-		--bl33 fip/bl33.bin.enc
-
-and then write the image to SD with:
-
- > DEV=/dev/your_sd_device
- > dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
- > dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=444
diff --git a/board/amlogic/libretech-cc/libretech-cc.c b/board/amlogic/libretech-cc/libretech-cc.c
deleted file mode 100644
index ccab127..0000000
--- a/board/amlogic/libretech-cc/libretech-cc.c
+++ /dev/null
@@ -1,57 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Copyright (C) 2016 BayLibre, SAS
- * Author: Neil Armstrong <narmstrong@baylibre.com>
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
-	meson_gx_eth_init(PHY_INTERFACE_MODE_RMII,
-			  MESON_GXL_USE_INTERNAL_RMII_PHY);
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
-					  EFUSE_SN_SIZE);
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
diff --git a/board/amlogic/p212/README b/board/amlogic/p212/README
deleted file mode 100644
index ef5370c..0000000
--- a/board/amlogic/p212/README
+++ /dev/null
@@ -1,103 +0,0 @@
-U-Boot for Amlogic P212
-=======================
-
-P212 is a reference board manufactured by Amlogic with the following
-specifications:
-
- - Amlogic S905X ARM Cortex-A53 quad-core SoC @ 1.5GHz
- - ARM Mali 450 GPU
- - 2GB DDR3 SDRAM
- - 10/100 Ethernet
- - HDMI 2.0 4K/60Hz display
- - 2 x USB 2.0 Host
- - eMMC, microSD
- - Infrared receiver
- - SDIO WiFi Module
- - CVBS+Stereo Audio Jack
-
-Schematics are available from Amlogic on demand.
-
-Currently the u-boot port supports the following devices:
- - serial
- - eMMC, microSD
- - Ethernet
- - I2C
- - Regulators
- - Reset controller
- - Clock controller
- - USB Host
- - ADC
-
-u-boot compilation
-==================
-
- > export ARCH=arm
- > export CROSS_COMPILE=aarch64-none-elf-
- > make p212_defconfig
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
- > git clone https://github.com/BayLibre/u-boot.git -b n-amlogic-openlinux-20170606 amlogic-u-boot
- > cd amlogic-u-boot
- > make gxl_p212_v1_defconfig
- > make
- > export FIPDIR=$PWD/fip
-
-Go back to mainline U-boot source tree then :
- > mkdir fip
-
- > cp $FIPDIR/gxl/bl2.bin fip/
- > cp $FIPDIR/gxl/acs.bin fip/
- > cp $FIPDIR/gxl/bl21.bin fip/
- > cp $FIPDIR/gxl/bl30.bin fip/
- > cp $FIPDIR/gxl/bl301.bin fip/
- > cp $FIPDIR/gxl/bl31.img fip/
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
- > $FIPDIR/acs_tool.pyc fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0
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
- > $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl30_new.bin
- > $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl31.img
- > $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl33.bin
- > $FIPDIR/gxl/aml_encrypt_gxl --bl2sig --input fip/bl2_new.bin --output fip/bl2.n.bin.sig
- > $FIPDIR/gxl/aml_encrypt_gxl --bootmk \
-		--output fip/u-boot.bin \
-		--bl2 fip/bl2.n.bin.sig \
-		--bl30 fip/bl30_new.bin.enc \
-		--bl31 fip/bl31.img.enc \
-		--bl33 fip/bl33.bin.enc
-
-and then write the image to SD with:
-
- > DEV=/dev/your_sd_device
- > dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
- > dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=444
diff --git a/board/amlogic/p212/README.khadas-vim b/board/amlogic/p212/README.khadas-vim
new file mode 100644
index 0000000..b194236
--- /dev/null
+++ b/board/amlogic/p212/README.khadas-vim
@@ -0,0 +1,102 @@
+U-Boot for Khadas VIM
+=======================
+
+Khadas VIM is an Open Source DIY Box manufactured by Shenzhen Wesion
+Technology Co., Ltd with the following specifications:
+
+ - Amlogic S905X ARM Cortex-A53 quad-core SoC @ 1.5GHz
+ - ARM Mali 450 GPU
+ - 2GB DDR3 SDRAM
+ - 10/100 Ethernet
+ - HDMI 2.0 4K/60Hz display
+ - 40-pin GPIO header
+ - 2 x USB 2.0 Host, 1 x USB 2.0 Type-C OTG
+ - 8GB/16GBeMMC
+ - microSD
+ - SDIO Wifi Module, Bluetooth
+ - Two channels IR receiver
+
+Currently the u-boot port supports the following devices:
+ - serial
+ - eMMC, microSD
+ - Ethernet
+ - I2C
+ - Regulators
+ - Reset controller
+ - Clock controller
+ - USB Host
+ - ADC
+
+U-Boot compilation
+==================
+
+ > export ARCH=arm
+ > export CROSS_COMPILE=aarch64-none-elf-
+ > make khadas-vim_defconfig
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
+ > git clone https://github.com/khadas/u-boot -b Vim vim-u-boot
+ > cd vim-u-boot
+ > make kvim_defconfig
+ > make
+ > export FIPDIR=$PWD/fip
+
+Go back to mainline U-Boot source tree then :
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
diff --git a/board/amlogic/p212/README.libretech-cc b/board/amlogic/p212/README.libretech-cc
new file mode 100644
index 0000000..d007f58
--- /dev/null
+++ b/board/amlogic/p212/README.libretech-cc
@@ -0,0 +1,102 @@
+U-Boot for LibreTech CC
+=======================
+
+LibreTech CC is a single board computer manufactured by Libre Technology
+with the following specifications:
+
+ - Amlogic S905X ARM Cortex-A53 quad-core SoC @ 1.5GHz
+ - ARM Mali 450 GPU
+ - 2GB DDR3 SDRAM
+ - 10/100 Ethernet
+ - HDMI 2.0 4K/60Hz display
+ - 40-pin GPIO header
+ - 4 x USB 2.0 Host
+ - eMMC, microSD
+ - Infrared receiver
+
+Schematics are available on the manufacturer website.
+
+Currently the U-Boot port supports the following devices:
+ - serial
+ - eMMC, microSD
+ - Ethernet
+ - I2C
+ - Regulators
+ - Reset controller
+ - Clock controller
+ - USB Host
+ - ADC
+
+U-Boot compilation
+==================
+
+ > export ARCH=arm
+ > export CROSS_COMPILE=aarch64-none-elf-
+ > make libretech-cc_defconfig
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
+ > cd amlogic-u-boot
+ > make libretech_cc_defconfig
+ > make
+ > export FIPDIR=$PWD/fip
+
+Go back to mainline U-Boot source tree then :
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
diff --git a/board/amlogic/p212/README.p212 b/board/amlogic/p212/README.p212
new file mode 100644
index 0000000..ef5370c
--- /dev/null
+++ b/board/amlogic/p212/README.p212
@@ -0,0 +1,103 @@
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
+ - Ethernet
+ - I2C
+ - Regulators
+ - Reset controller
+ - Clock controller
+ - USB Host
+ - ADC
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
diff --git a/configs/khadas-vim_defconfig b/configs/khadas-vim_defconfig
index 0c89d9a..af30113 100644
--- a/configs/khadas-vim_defconfig
+++ b/configs/khadas-vim_defconfig
@@ -2,7 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_MESON_GXL=y
-CONFIG_TARGET_KHADAS_VIM=y
+CONFIG_TARGET_P212=y
 CONFIG_DEBUG_UART_BASE=0xc81004c0
 CONFIG_DEBUG_UART_CLOCK=24000000
 CONFIG_IDENT_STRING=" khadas-vim"
diff --git a/configs/libretech-cc_defconfig b/configs/libretech-cc_defconfig
index 36d117c..7526516 100644
--- a/configs/libretech-cc_defconfig
+++ b/configs/libretech-cc_defconfig
@@ -2,7 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_MESON_GXL=y
-CONFIG_TARGET_LIBRETECH_CC=y
+CONFIG_TARGET_P212=y
 CONFIG_DEBUG_UART_BASE=0xc81004c0
 CONFIG_DEBUG_UART_CLOCK=24000000
 CONFIG_IDENT_STRING=" libretech-cc"
-- 
2.7.4
