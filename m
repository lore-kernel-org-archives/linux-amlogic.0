From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri,  9 Nov 2018 16:26:43 +0100
Subject: [PATCH u-boot 04/19] board: amlogic: move khadas-vim2 as q200 ref
 board
In-Reply-To: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
References: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1541777218-472-5-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Khadas vim2 derive from amlogic s912 reference design (Q200).

This patch moves the khadas-vim2 board support to a generic Q200 board,
while keeping a dedicated defconfig to customize the names and device tree.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/mach-meson/Kconfig             |   9 +--
 board/amlogic/khadas-vim2/Kconfig       |  12 ----
 board/amlogic/khadas-vim2/MAINTAINERS   |   6 --
 board/amlogic/khadas-vim2/Makefile      |   6 --
 board/amlogic/khadas-vim2/README        | 103 --------------------------------
 board/amlogic/khadas-vim2/khadas-vim2.c |  62 -------------------
 board/amlogic/q200/Kconfig              |  12 ++++
 board/amlogic/q200/MAINTAINERS          |   6 ++
 board/amlogic/q200/Makefile             |   6 ++
 board/amlogic/q200/README.khadas-vim2   | 103 ++++++++++++++++++++++++++++++++
 board/amlogic/q200/README.q200          | 102 +++++++++++++++++++++++++++++++
 board/amlogic/q200/q200.c               |  62 +++++++++++++++++++
 configs/khadas-vim2_defconfig           |   2 +-
 include/configs/khadas-vim2.h           |  18 ------
 include/configs/q200.h                  |  18 ++++++
 15 files changed, 315 insertions(+), 212 deletions(-)
 delete mode 100644 board/amlogic/khadas-vim2/Kconfig
 delete mode 100644 board/amlogic/khadas-vim2/MAINTAINERS
 delete mode 100644 board/amlogic/khadas-vim2/Makefile
 delete mode 100644 board/amlogic/khadas-vim2/README
 delete mode 100644 board/amlogic/khadas-vim2/khadas-vim2.c
 create mode 100644 board/amlogic/q200/Kconfig
 create mode 100644 board/amlogic/q200/MAINTAINERS
 create mode 100644 board/amlogic/q200/Makefile
 create mode 100644 board/amlogic/q200/README.khadas-vim2
 create mode 100644 board/amlogic/q200/README.q200
 create mode 100644 board/amlogic/q200/q200.c
 delete mode 100644 include/configs/khadas-vim2.h
 create mode 100644 include/configs/q200.h

diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index e0b2812..98303db 100644
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
diff --git a/board/amlogic/khadas-vim2/Kconfig b/board/amlogic/khadas-vim2/Kconfig
deleted file mode 100644
index d0af362..0000000
--- a/board/amlogic/khadas-vim2/Kconfig
+++ /dev/null
@@ -1,12 +0,0 @@
-if TARGET_KHADAS_VIM2
-
-config SYS_BOARD
-	default "khadas-vim2"
-
-config SYS_VENDOR
-	default "amlogic"
-
-config SYS_CONFIG_NAME
-	default "khadas-vim2"
-
-endif
diff --git a/board/amlogic/khadas-vim2/MAINTAINERS b/board/amlogic/khadas-vim2/MAINTAINERS
deleted file mode 100644
index ca63e31..0000000
--- a/board/amlogic/khadas-vim2/MAINTAINERS
+++ /dev/null
@@ -1,6 +0,0 @@
-KHADAS-VIM2
-M:	Neil Armstrong <narmstrong@baylibre.com>
-S:	Maintained
-F:	board/amlogic/khadas-vim2/
-F:	include/configs/khadas-vim2.h
-F:	configs/khadas-vim2_defconfig
diff --git a/board/amlogic/khadas-vim2/Makefile b/board/amlogic/khadas-vim2/Makefile
deleted file mode 100644
index 4e7c9a0..0000000
--- a/board/amlogic/khadas-vim2/Makefile
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0+
-#
-# (C) Copyright 2016 BayLibre, SAS
-# Author: Neil Armstrong <narmstrong@baylibre.com>
-
-obj-y	:= khadas-vim2.o
diff --git a/board/amlogic/khadas-vim2/README b/board/amlogic/khadas-vim2/README
deleted file mode 100644
index 578693f..0000000
--- a/board/amlogic/khadas-vim2/README
+++ /dev/null
@@ -1,103 +0,0 @@
-U-Boot for Khadas VIM2
-=======================
-
-Khadas VIM2 is an Open Source DIY Box manufactured by Shenzhen Wesion
-Technology Co., Ltd with the following specifications:
-
- - Amlogic S912 ARM Cortex-A53 octo-core SoC @ 1.5GHz
- - ARM Mali T860 GPU
- - 2/3GB DDR4 SDRAM
- - 10/100/1000 Ethernet
- - HDMI 2.0 4K/60Hz display
- - 40-pin GPIO header
- - 2 x USB 2.0 Host, 1 x USB 2.0 Type-C OTG
- - 16GB/32GB/64GB eMMC
- - 2MB SPI Flash
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
- > make khadas-vim2_defconfig
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
diff --git a/board/amlogic/khadas-vim2/khadas-vim2.c b/board/amlogic/khadas-vim2/khadas-vim2.c
deleted file mode 100644
index ff56569..0000000
--- a/board/amlogic/khadas-vim2/khadas-vim2.c
+++ /dev/null
@@ -1,62 +0,0 @@
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
-	meson_gx_eth_init(PHY_INTERFACE_MODE_RGMII, 0);
-
-	/* Reset PHY on GPIOZ_14 */
-	clrbits_le32(GX_GPIO_EN(3), BIT(14));
-	clrbits_le32(GX_GPIO_OUT(3), BIT(14));
-	mdelay(10);
-	setbits_le32(GX_GPIO_OUT(3), BIT(14));
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
diff --git a/board/amlogic/q200/Kconfig b/board/amlogic/q200/Kconfig
new file mode 100644
index 0000000..cfaf379
--- /dev/null
+++ b/board/amlogic/q200/Kconfig
@@ -0,0 +1,12 @@
+if TARGET_Q200
+
+config SYS_BOARD
+	default "q200"
+
+config SYS_VENDOR
+	default "amlogic"
+
+config SYS_CONFIG_NAME
+	default "q200"
+
+endif
diff --git a/board/amlogic/q200/MAINTAINERS b/board/amlogic/q200/MAINTAINERS
new file mode 100644
index 0000000..be86386
--- /dev/null
+++ b/board/amlogic/q200/MAINTAINERS
@@ -0,0 +1,6 @@
+Q200
+M:	Neil Armstrong <narmstrong@baylibre.com>
+S:	Maintained
+F:	board/amlogic/q200/
+F:	include/configs/q200.h
+F:	configs/khadas-vim2_defconfig
diff --git a/board/amlogic/q200/Makefile b/board/amlogic/q200/Makefile
new file mode 100644
index 0000000..fd78fd0
--- /dev/null
+++ b/board/amlogic/q200/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0+
+#
+# (C) Copyright 2016 BayLibre, SAS
+# Author: Neil Armstrong <narmstrong@baylibre.com>
+
+obj-y	:= q200.o
diff --git a/board/amlogic/q200/README.khadas-vim2 b/board/amlogic/q200/README.khadas-vim2
new file mode 100644
index 0000000..578693f
--- /dev/null
+++ b/board/amlogic/q200/README.khadas-vim2
@@ -0,0 +1,103 @@
+U-Boot for Khadas VIM2
+=======================
+
+Khadas VIM2 is an Open Source DIY Box manufactured by Shenzhen Wesion
+Technology Co., Ltd with the following specifications:
+
+ - Amlogic S912 ARM Cortex-A53 octo-core SoC @ 1.5GHz
+ - ARM Mali T860 GPU
+ - 2/3GB DDR4 SDRAM
+ - 10/100/1000 Ethernet
+ - HDMI 2.0 4K/60Hz display
+ - 40-pin GPIO header
+ - 2 x USB 2.0 Host, 1 x USB 2.0 Type-C OTG
+ - 16GB/32GB/64GB eMMC
+ - 2MB SPI Flash
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
diff --git a/board/amlogic/q200/README.q200 b/board/amlogic/q200/README.q200
new file mode 100644
index 0000000..55d730a
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
diff --git a/board/amlogic/q200/q200.c b/board/amlogic/q200/q200.c
new file mode 100644
index 0000000..ff56569
--- /dev/null
+++ b/board/amlogic/q200/q200.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2016 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include <common.h>
+#include <dm.h>
+#include <environment.h>
+#include <asm/io.h>
+#include <asm/arch/gx.h>
+#include <asm/arch/mem.h>
+#include <asm/arch/sm.h>
+#include <asm/arch/eth.h>
+
+#define EFUSE_SN_OFFSET		20
+#define EFUSE_SN_SIZE		16
+#define EFUSE_MAC_OFFSET	52
+#define EFUSE_MAC_SIZE		6
+
+int board_init(void)
+{
+	return 0;
+}
+
+int misc_init_r(void)
+{
+	u8 mac_addr[EFUSE_MAC_SIZE];
+	char serial[EFUSE_SN_SIZE];
+	ssize_t len;
+
+	meson_gx_eth_init(PHY_INTERFACE_MODE_RGMII, 0);
+
+	/* Reset PHY on GPIOZ_14 */
+	clrbits_le32(GX_GPIO_EN(3), BIT(14));
+	clrbits_le32(GX_GPIO_OUT(3), BIT(14));
+	mdelay(10);
+	setbits_le32(GX_GPIO_OUT(3), BIT(14));
+
+	if (!eth_env_get_enetaddr("ethaddr", mac_addr)) {
+		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
+					  mac_addr, EFUSE_MAC_SIZE);
+		if (len == EFUSE_MAC_SIZE && is_valid_ethaddr(mac_addr))
+			eth_env_set_enetaddr("ethaddr", mac_addr);
+	}
+
+	if (!env_get("serial#")) {
+		len = meson_sm_read_efuse(EFUSE_SN_OFFSET, serial,
+					  EFUSE_SN_SIZE);
+		if (len == EFUSE_SN_SIZE)
+			env_set("serial#", serial);
+	}
+
+	return 0;
+}
+
+int ft_board_setup(void *blob, bd_t *bd)
+{
+	meson_gx_init_reserved_memory(blob);
+
+	return 0;
+}
diff --git a/configs/khadas-vim2_defconfig b/configs/khadas-vim2_defconfig
index f21e3a8..387d7da 100644
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
diff --git a/include/configs/khadas-vim2.h b/include/configs/khadas-vim2.h
deleted file mode 100644
index 7ef8f42..0000000
--- a/include/configs/khadas-vim2.h
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
diff --git a/include/configs/q200.h b/include/configs/q200.h
new file mode 100644
index 0000000..7ef8f42
--- /dev/null
+++ b/include/configs/q200.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Configuration for Khadas VIM2
+ *
+ * Copyright (C) 2017 Baylibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#ifndef __CONFIG_H
+#define __CONFIG_H
+
+#define CONFIG_MISC_INIT_R
+
+#define MESON_FDTFILE_SETTING "fdtfile=amlogic/meson-gxm-khadas-vim2.dtb\0"
+
+#include <configs/meson-gx-common.h>
+
+#endif /* __CONFIG_H */
-- 
2.7.4
