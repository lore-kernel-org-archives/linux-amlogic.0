From: ldevulder@suse.de (Loic Devulder)
Date: Tue, 20 Nov 2018 22:08:12 +0100
Subject: [U-Boot] [PATCH u-boot 17/19] board: amlogic: add support for
 S400 board
In-Reply-To: <1541777218-472-18-git-send-email-narmstrong@baylibre.com>
References: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
 <1541777218-472-18-git-send-email-narmstrong@baylibre.com>
Message-ID: <9e6017fc-3d51-5f81-c475-0b95d8be7204@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Neil,

On 11/9/18 4:26 PM, Neil Armstrong wrote:
> The S400 board is the Amlogic AXG SoC reference board including :
>  - Amlogic A113DX ARM Cortex-A53 quad-core SoC @ 1.2GHz
>  - 1GB DDR4 SDRAM
>  - 10/100 Ethernet
>  - 2 x USB 2.0 Host
>  - eMMC
>  - Infrared receiver
>  - SDIO WiFi Module
>  - MIPI DSI Connector
>  - Audio HAT Connector
>  - PCI-E M.2 Connectors
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  arch/arm/mach-meson/Kconfig    |   1 +
>  board/amlogic/s400/MAINTAINERS |   6 +++
>  board/amlogic/s400/Makefile    |   6 +++
>  board/amlogic/s400/README      | 110 +++++++++++++++++++++++++++++++++++++++++
>  board/amlogic/s400/s400.c      |  33 +++++++++++++
>  configs/s400_defconfig         |  38 ++++++++++++++
>  6 files changed, 194 insertions(+)
>  create mode 100644 board/amlogic/s400/MAINTAINERS
>  create mode 100644 board/amlogic/s400/Makefile
>  create mode 100644 board/amlogic/s400/README
>  create mode 100644 board/amlogic/s400/s400.c
>  create mode 100644 configs/s400_defconfig
> 
> diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
> index 7f217fa..deddcc5 100644
> --- a/arch/arm/mach-meson/Kconfig
> +++ b/arch/arm/mach-meson/Kconfig
> @@ -63,6 +63,7 @@ config SYS_BOARD
>  	default "odroid-c2" if MESON_GXBB
>  	default "p212" if MESON_GXL
>  	default "q200" if MESON_GXM
> +	default "s400" if MESON_AXG
>  	default ""
>  	help
>  	  This option contains information about board name.
> diff --git a/board/amlogic/s400/MAINTAINERS b/board/amlogic/s400/MAINTAINERS
> new file mode 100644
> index 0000000..9ca9836
> --- /dev/null
> +++ b/board/amlogic/s400/MAINTAINERS
> @@ -0,0 +1,6 @@
> +S400
> +M:	Neil Armstrong <narmstrong@baylibre.com>
> +S:	Maintained
> +F:	board/amlogic/s400/
> +F:	include/configs/s400.h
> +F:	configs/s400_defconfig
> diff --git a/board/amlogic/s400/Makefile b/board/amlogic/s400/Makefile
> new file mode 100644
> index 0000000..bf03862
> --- /dev/null
> +++ b/board/amlogic/s400/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +#
> +# (C) Copyright 2016 BayLibre, SAS
> +# Author: Neil Armstrong <narmstrong@baylibre.com>
> +
> +obj-y	:= s400.o
> diff --git a/board/amlogic/s400/README b/board/amlogic/s400/README
> new file mode 100644
> index 0000000..29ccf2d
> --- /dev/null
> +++ b/board/amlogic/s400/README
> @@ -0,0 +1,110 @@
> +U-Boot for Amlogic S400
> +=======================
> +
> +S400 is a reference board manufactured by Amlogic with the following
> +specifications:
> +
> + - Amlogic A113DX ARM Cortex-A53 quad-core SoC @ 1.2GHz
> + - 1GB DDR4 SDRAM
> + - 10/100 Ethernet
> + - 2 x USB 2.0 Host
> + - eMMC
> + - Infrared receiver
> + - SDIO WiFi Module
> + - MIPI DSI Connector
> + - Audio HAT Connector
> + - PCI-E M.2 Connectors
> +
> +Schematics are available from Amlogic on demand.
> +
> +Currently the u-boot port supports the following devices:
> + - serial
> + - eMMC
> + - Ethernet
> + - I2C
> + - Regulators
> + - Reset controller
> + - Clock controller
> + - USB Host
> + - ADC
> +
> +u-boot compilation
> +==================
> +
> + > export ARCH=arm
> + > export CROSS_COMPILE=aarch64-none-elf-
> + > make s400_defconfig
> + > make
> +
> +Image creation
> +==============
> +
> +Amlogic doesn't provide sources for the firmware and for tools needed
> +to create the bootloader image, so it is necessary to obtain them from
> +the git tree published by the board vendor:
> +
> + > wget https://releases.linaro.org/archive/13.11/components/toolchain/binaries/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux.tar.xz
> + > wget https://releases.linaro.org/archive/13.11/components/toolchain/binaries/gcc-linaro-arm-none-eabi-4.8-2013.11_linux.tar.xz
> + > tar xvfJ gcc-linaro-aarch64-none-elf-4.8-2013.11_linux.tar.xz
> + > tar xvfJ gcc-linaro-arm-none-eabi-4.8-2013.11_linux.tar.xz
> + > export PATH=$PWD/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux/bin:$PWD/gcc-linaro-arm-none-eabi-4.8-2013.11_linux/bin:$PATH
> + > git clone https://github.com/BayLibre/u-boot.git -b n-amlogic-openlinux-20170606 amlogic-u-boot
> + > cd amlogic-u-boot
> + > make axg_s400_v1_defconfig
> + > make
> + > export FIPDIR=$PWD/fip
> +
> +Go back to mainline U-boot source tree then :
> + > mkdir fip
> +
> + > cp $FIPDIR/axg/bl2.bin fip/
> + > cp $FIPDIR/axg/acs.bin fip/
> + > cp $FIPDIR/axg/bl21.bin fip/
> + > cp $FIPDIR/axg/bl30.bin fip/
> + > cp $FIPDIR/axg/bl301.bin fip/
> + > cp $FIPDIR/axg/bl31.img fip/
> + > cp u-boot.bin fip/bl33.bin
> +
> + > $FIPDIR/blx_fix.sh \
> +	fip/bl30.bin \
> +	fip/zero_tmp \
> +	fip/bl30_zero.bin \
> +	fip/bl301.bin \
> +	fip/bl301_zero.bin \
> +	fip/bl30_new.bin \
> +	bl30
> +
> + > $FIPDIR/acs_tool.pyc fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0
> +
> + > $FIPDIR/blx_fix.sh \
> +	fip/bl2_acs.bin \
> +	fip/zero_tmp \
> +	fip/bl2_zero.bin \
> +	fip/bl21.bin \
> +	fip/bl21_zero.bin \
> +	fip/bl2_new.bin \
> +	bl2
> +
> + > $FIPDIR/axg/aml_encrypt_axg --bl3sig --input fip/bl30_new.bin \
> +	 				--output fip/bl30_new.bin.enc \

I have a git warning because there is a white space between two tabs in
that line.

> +					--level v3 --type bl30
> + > $FIPDIR/axg/aml_encrypt_axg --bl3sig --input fip/bl31.img \
> +	 				--output fip/bl31.img.enc \

Same here :)

> +					--level v3 --type bl31
> + > $FIPDIR/axg/aml_encrypt_axg --bl3sig --input fip/bl33.bin --compress lz4 \
> +	 				--output fip/bl33.bin.enc \

Same here :)
> +					--level v3 --type bl33
> + > $FIPDIR/axg/aml_encrypt_axg --bl2sig --input fip/bl2_new.bin \
> +	 				--output fip/bl2.n.bin.sig

And same here :) (the last!)

> + > $FIPDIR/axg/aml_encrypt_axg --bootmk \
> +		--output fip/u-boot.bin \
> +		--bl2 fip/bl2.n.bin.sig \
> +		--bl30 fip/bl30_new.bin.enc \
> +		--bl31 fip/bl31.img.enc \
> +		--bl33 fip/bl33.bin.enc --level v3
> +
> +and then write the image to SD with:
> +
> + > DEV=/dev/your_sd_device
> + > dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
> + > dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=444
> diff --git a/board/amlogic/s400/s400.c b/board/amlogic/s400/s400.c
> new file mode 100644
> index 0000000..c2b50f6
> --- /dev/null
> +++ b/board/amlogic/s400/s400.c
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2016 BayLibre, SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + */
> +
> +#include <common.h>
> +#include <dm.h>
> +#include <environment.h>
> +#include <asm/io.h>
> +#include <asm/arch/axg.h>
> +#include <asm/arch/sm.h>
> +#include <asm/arch/eth.h>
> +#include <asm/arch/mem.h>
> +
> +int board_init(void)
> +{
> +	return 0;
> +}
> +
> +int misc_init_r(void)
> +{
> +	meson_eth_init(PHY_INTERFACE_MODE_RGMII, 0);
> +
> +	return 0;
> +}
> +
> +int ft_board_setup(void *blob, bd_t *bd)
> +{
> +	meson_init_reserved_memory(blob);
> +
> +	return 0;
> +}
> diff --git a/configs/s400_defconfig b/configs/s400_defconfig
> new file mode 100644
> index 0000000..1bd4b71
> --- /dev/null
> +++ b/configs/s400_defconfig
> @@ -0,0 +1,38 @@
> +CONFIG_ARM=y
> +CONFIG_ARCH_MESON=y
> +CONFIG_SYS_TEXT_BASE=0x01000000
> +CONFIG_MESON_AXG=y
> +CONFIG_DEBUG_UART_BASE=0xff803000
> +CONFIG_DEBUG_UART_CLOCK=24000000
> +CONFIG_IDENT_STRING=" s400"
> +CONFIG_DEBUG_UART=y
> +CONFIG_NR_DRAM_BANKS=1
> +CONFIG_OF_BOARD_SETUP=y
> +CONFIG_MISC_INIT_R=y
> +# CONFIG_DISPLAY_CPUINFO is not set
> +# CONFIG_DISPLAY_BOARDINFO is not set
> +# CONFIG_CMD_BDI is not set
> +# CONFIG_CMD_IMI is not set
> +CONFIG_CMD_GPIO=y
> +# CONFIG_CMD_LOADS is not set
> +CONFIG_CMD_MMC=y
> +# CONFIG_CMD_SETEXPR is not set
> +CONFIG_CMD_REGULATOR=y
> +CONFIG_OF_CONTROL=y
> +CONFIG_DEFAULT_DEVICE_TREE="meson-axg-s400"
> +CONFIG_NET_RANDOM_ETHADDR=y
> +CONFIG_DM_GPIO=y
> +CONFIG_DM_MMC=y
> +CONFIG_MMC_MESON_GX=y
> +CONFIG_DM_ETH=y
> +CONFIG_ETH_DESIGNWARE=y
> +CONFIG_PINCTRL=y
> +CONFIG_PINCTRL_MESON_AXG=y
> +CONFIG_DM_REGULATOR=y
> +CONFIG_DM_REGULATOR_FIXED=y
> +CONFIG_DM_RESET=y
> +CONFIG_DEBUG_UART_MESON=y
> +CONFIG_DEBUG_UART_ANNOUNCE=y
> +CONFIG_DEBUG_UART_SKIP_INIT=y
> +CONFIG_MESON_SERIAL=y
> +CONFIG_OF_LIBFDT_OVERLAY=y
> 

-- 
Loic Devulder <ldevulder@suse.com> | ldevulder at irc
0x175A963893C85F55 | D220 DEF5 56A3 DE00 9DAA 78BA 175A 9638 93C8 5F55
Senior QA Engineer | Container & Storage Solutions Quality Assurance
team (qa-css)
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 Nuernberg, Germany
GF: F. Imend?rffer, J. Smithard, J. Guild, D. Upmanyu, G. Norton HRB,
21284 (AG Nuernberg)

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: OpenPGP digital signature
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20181120/c98bff16/attachment.sig>
