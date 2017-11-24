From: sjg@chromium.org (Simon Glass)
Date: Fri, 24 Nov 2017 15:35:50 -0700
Subject: [PATCH v2 5/5] arm: Add Khadas VIM support based on Meson GXL
 family
In-Reply-To: <1511357151-3771-6-git-send-email-narmstrong@baylibre.com>
References: <1511357151-3771-1-git-send-email-narmstrong@baylibre.com>
 <1511357151-3771-6-git-send-email-narmstrong@baylibre.com>
Message-ID: <CAPnjgZ2Bcv==RCoJmdZyVG1uqzBQDXTUL8hTcQ3we-qWC5Jc8g@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Neil,

On 22 November 2017 at 06:25, Neil Armstrong <narmstrong@baylibre.com> wrote:
> This adds platform code for the Khadas VIM board based on a
> Meson GXL (S905X) SoC with the Meson GXL configuration.
>
> This initial submission supports UART, MMC/SDCard and Ethernet with the
> Internal RMII PHY.
>
> The meson-gxl-s905x-khadas-vim.dts is synchronised from the linux 4.13
> stable tree as of 4.13.8.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  arch/arm/dts/Makefile                       |   3 +-
>  arch/arm/dts/meson-gxl-s905x-khadas-vim.dts | 137 ++++++++++++++++++++++++++++
>  arch/arm/mach-meson/Kconfig                 |   9 ++
>  board/amlogic/khadas-vim/Kconfig            |  12 +++
>  board/amlogic/khadas-vim/MAINTAINERS        |   6 ++
>  board/amlogic/khadas-vim/Makefile           |   8 ++
>  board/amlogic/khadas-vim/README             |  96 +++++++++++++++++++
>  board/amlogic/khadas-vim/khadas-vim.c       |  48 ++++++++++
>  configs/khadas-vim_defconfig                |  35 +++++++
>  include/configs/khadas-vim.h                |  21 +++++
>  10 files changed, 374 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/dts/meson-gxl-s905x-khadas-vim.dts
>  create mode 100644 board/amlogic/khadas-vim/Kconfig
>  create mode 100644 board/amlogic/khadas-vim/MAINTAINERS
>  create mode 100644 board/amlogic/khadas-vim/Makefile
>  create mode 100644 board/amlogic/khadas-vim/README
>  create mode 100644 board/amlogic/khadas-vim/khadas-vim.c
>  create mode 100644 configs/khadas-vim_defconfig
>  create mode 100644 include/configs/khadas-vim.h

Reviewed-by: Simon Glass <sjg@chromium.org>

Please see below.

> diff --git a/board/amlogic/khadas-vim/README b/board/amlogic/khadas-vim/README
> new file mode 100644
> index 0000000..add6a29
> --- /dev/null
> +++ b/board/amlogic/khadas-vim/README
> @@ -0,0 +1,96 @@
> +U-Boot for Khadas VIM
> +=======================
> +
> +Khadas VIM is an Open Source DIY Box manufactured by Shenzhen Tomato
> +Technology Co., Ltd with the following specifications:
> +
> + - Amlogic S905x ARM Cortex-A53 quad-core SoC @ 2GHz
> + - ARM Mali 450 GPU
> + - 2GB DDR3 SDRAM
> + - 10/100 Ethernet
> + - HDMI 2.0 4K/60Hz display
> + - 40-pin GPIO header
> + - 2 x USB 2.0 Host, 1 x USB 2.0 Type-C OTG
> + - 8GB/16GBeMMC
> + - microSD
> + - SDIO Wifi Module, Bluetooth
> + - Two channels IR receiver
> +
> +Currently the u-boot port supports the following devices:
> + - serial
> + - eMMC, microSD
> + - Ethernet
> +
> +u-boot compilation

U-Boot

> +==================
> +
> + > export ARCH=arm
> + > export CROSS_COMPILE=aarch64-none-elf-
> + > make khadas-vim_defconfig
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
> + > git clone https://github.com/khadas/u-boot -b Vim vim-u-boot
> + > cd vim-u-boot
> + > make kvim_defconfig
> + > make
> + > export FIPDIR=$PWD/fip
> +
> +Go back to mainline U-Boot source tree then :
> + > mkdir fip
> +
> + > cp $FIPDIR/gxl/bl2.bin fip/
> + > cp $FIPDIR/gxl/acs.bin fip/
> + > cp $FIPDIR/gxl/bl21.bin fip/
> + > cp $FIPDIR/gxl/bl30.bin fip/
> + > cp $FIPDIR/gxl/bl301.bin fip/
> + > cp $FIPDIR/gxl/bl31.img fip/
> + > cp u-boot.bin fip/bl33.bin
> +
> + > $FIPDIR/blx_fix.sh \
> +       fip/bl30.bin \
> +       fip/zero_tmp \
> +       fip/bl30_zero.bin \
> +       fip/bl301.bin \
> +       fip/bl301_zero.bin \
> +       fip/bl30_new.bin \
> +       bl30
> +
> + > $FIPDIR/acs_tool.pyc fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0
> +
> + > $FIPDIR/blx_fix.sh \
> +       fip/bl2_acs.bin \
> +       fip/zero_tmp \
> +       fip/bl2_zero.bin \
> +       fip/bl21.bin \
> +       fip/bl21_zero.bin \
> +       fip/bl2_new.bin \
> +       bl2
> +
> + > $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl30_new.bin
> + > $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl31.img
> + > $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl33.bin
> + > $FIPDIR/gxl/aml_encrypt_gxl --bl2sig --input fip/bl2_new.bin --output fip/bl2.n.bin.sig
> + > $FIPDIR/gxl/aml_encrypt_gxl --bootmk \
> +               --output fip/u-boot.bin \
> +               --bl2 fip/bl2.n.bin.sig \
> +               --bl30 fip/bl30_new.bin.enc \
> +               --bl31 fip/bl31.img.enc \
> +               --bl33 fip/bl33.bin.enc
> +
> +and then write the image to SD with:
> +
> + > DEV=/dev/your_sd_device
> + > dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
> + > dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=444

This bit (from 'got back to U-Boot sources') seems like a job for
binman, as I just mentioned in the other patch.

Regards,
Simon
