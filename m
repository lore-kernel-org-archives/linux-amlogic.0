From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 22 Nov 2018 10:07:25 +0100
Subject: [PATCH u-boot v2 04/19] board: amlogic: move khadas-vim2 as q200 ref
 board
In-Reply-To: <20181122090740.29739-1-narmstrong@baylibre.com>
References: <20181122090740.29739-1-narmstrong@baylibre.com>
Message-ID: <20181122090740.29739-5-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Khadas vim2 derive from amlogic s912 reference design (Q200).

This patch moves the khadas-vim2 board support to a generic Q200 board,
while keeping a dedicated defconfig to customize the names and device tree.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/mach-meson/Kconfig                   |   9 +-
 board/amlogic/{khadas-vim2 => q200}/Kconfig   |   6 +-
 .../amlogic/{khadas-vim2 => q200}/MAINTAINERS |   6 +-
 board/amlogic/{khadas-vim2 => q200}/Makefile  |   2 +-
 .../README => q200/README.khadas-vim2}        |   0
 board/amlogic/q200/README.q200                | 102 ++++++++++++++++++
 .../khadas-vim2.c => q200/q200.c}             |   0
 configs/khadas-vim2_defconfig                 |   2 +-
 include/configs/{khadas-vim2.h => q200.h}     |   0
 9 files changed, 115 insertions(+), 12 deletions(-)
 rename board/amlogic/{khadas-vim2 => q200}/Kconfig (56%)
 rename board/amlogic/{khadas-vim2 => q200}/MAINTAINERS (54%)
 rename board/amlogic/{khadas-vim2 => q200}/Makefile (84%)
 rename board/amlogic/{khadas-vim2/README => q200/README.khadas-vim2} (100%)
 create mode 100644 board/amlogic/q200/README.q200
 rename board/amlogic/{khadas-vim2/khadas-vim2.c => q200/q200.c} (100%)
 rename include/configs/{khadas-vim2.h => q200.h} (100%)

diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index e0b2812477..98303dbda1 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -50,13 +50,14 @@ config TARGET_P212
 	  You should also select this TARGET if you have Khadas Vim or
 	  a libretech aml-s905x-cc
 
-config TARGET_KHADAS_VIM2
+config TARGET_Q200
 	bool "KHADAS-VIM2"
 	select MESON_GXM
 	help
-	  Khadas VIM2 is a single board computer based on Meson GXM
+	  Q200 is a reference dessign board based on Meson GXM
 	  with 2/3 GiB of RAM, Ethernet, HDMI, 4 USB, micro-SD slot,
-	  eMMC, IR receiver and a 40-pin GPIO header.
+	  eMMC, IR receiver.
+	  You should also select this TARGET if you have Khadas Vim2.
 
 endchoice
 
@@ -72,6 +73,6 @@ source "board/amlogic/nanopi-k2/Kconfig"
 
 source "board/amlogic/p212/Kconfig"
 
-source "board/amlogic/khadas-vim2/Kconfig"
+source "board/amlogic/q200/Kconfig"
 
 endif
diff --git a/board/amlogic/khadas-vim2/Kconfig b/board/amlogic/q200/Kconfig
similarity index 56%
rename from board/amlogic/khadas-vim2/Kconfig
rename to board/amlogic/q200/Kconfig
index d0af36264d..cfaf3797ac 100644
--- a/board/amlogic/khadas-vim2/Kconfig
+++ b/board/amlogic/q200/Kconfig
@@ -1,12 +1,12 @@
-if TARGET_KHADAS_VIM2
+if TARGET_Q200
 
 config SYS_BOARD
-	default "khadas-vim2"
+	default "q200"
 
 config SYS_VENDOR
 	default "amlogic"
 
 config SYS_CONFIG_NAME
-	default "khadas-vim2"
+	default "q200"
 
 endif
diff --git a/board/amlogic/khadas-vim2/MAINTAINERS b/board/amlogic/q200/MAINTAINERS
similarity index 54%
rename from board/amlogic/khadas-vim2/MAINTAINERS
rename to board/amlogic/q200/MAINTAINERS
index ca63e311c6..be86386619 100644
--- a/board/amlogic/khadas-vim2/MAINTAINERS
+++ b/board/amlogic/q200/MAINTAINERS
@@ -1,6 +1,6 @@
-KHADAS-VIM2
+Q200
 M:	Neil Armstrong <narmstrong@baylibre.com>
 S:	Maintained
-F:	board/amlogic/khadas-vim2/
-F:	include/configs/khadas-vim2.h
+F:	board/amlogic/q200/
+F:	include/configs/q200.h
 F:	configs/khadas-vim2_defconfig
diff --git a/board/amlogic/khadas-vim2/Makefile b/board/amlogic/q200/Makefile
similarity index 84%
rename from board/amlogic/khadas-vim2/Makefile
rename to board/amlogic/q200/Makefile
index 4e7c9a0592..fd78fd068a 100644
--- a/board/amlogic/khadas-vim2/Makefile
+++ b/board/amlogic/q200/Makefile
@@ -3,4 +3,4 @@
 # (C) Copyright 2016 BayLibre, SAS
 # Author: Neil Armstrong <narmstrong@baylibre.com>
 
-obj-y	:= khadas-vim2.o
+obj-y	:= q200.o
diff --git a/board/amlogic/khadas-vim2/README b/board/amlogic/q200/README.khadas-vim2
similarity index 100%
rename from board/amlogic/khadas-vim2/README
rename to board/amlogic/q200/README.khadas-vim2
diff --git a/board/amlogic/q200/README.q200 b/board/amlogic/q200/README.q200
new file mode 100644
index 0000000000..55d730a0d2
--- /dev/null
+++ b/board/amlogic/q200/README.q200
@@ -0,0 +1,102 @@
+U-Boot for Amlogic Q200
+=======================
+
+Q200 is a reference board manufactured by Amlogic with the following
+specifications:
+
+ - Amlogic S912 ARM Cortex-A53 octo-core SoC @ 1.5GHz
+ - ARM Mali T860 GPU
+ - 2/3GB DDR4 SDRAM
+ - 10/100/1000 Ethernet
+ - HDMI 2.0 4K/60Hz display
+ - 2 x USB 2.0 Host, 1 x USB 2.0 Device
+ - 16GB/32GB/64GB eMMC
+ - 2MB SPI Flash
+ - microSD
+ - SDIO Wifi Module, Bluetooth
+ - IR receiver
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
+ > make khadas-vim2_defconfig
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
+ > make gxm_q200_v1_defconfig
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
diff --git a/board/amlogic/khadas-vim2/khadas-vim2.c b/board/amlogic/q200/q200.c
similarity index 100%
rename from board/amlogic/khadas-vim2/khadas-vim2.c
rename to board/amlogic/q200/q200.c
diff --git a/configs/khadas-vim2_defconfig b/configs/khadas-vim2_defconfig
index 4bbccc2f34..49b8104960 100644
--- a/configs/khadas-vim2_defconfig
+++ b/configs/khadas-vim2_defconfig
@@ -2,7 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_MESON_GXM=y
-CONFIG_TARGET_KHADAS_VIM2=y
+CONFIG_TARGET_Q200=y
 CONFIG_DEBUG_UART_BASE=0xc81004c0
 CONFIG_DEBUG_UART_CLOCK=24000000
 CONFIG_IDENT_STRING=" khadas-vim2"
diff --git a/include/configs/khadas-vim2.h b/include/configs/q200.h
similarity index 100%
rename from include/configs/khadas-vim2.h
rename to include/configs/q200.h
-- 
2.19.1
