From: sjg@chromium.org (Simon Glass)
Date: Wed, 18 May 2016 21:59:38 -0600
Subject: [PATCH v7 3/4] arm: add initial support for Amlogic Meson and
 ODROID-C2
In-Reply-To: <1462689017-3160-4-git-send-email-b.galvani@gmail.com>
References: <1462689017-3160-1-git-send-email-b.galvani@gmail.com>
 <1462689017-3160-4-git-send-email-b.galvani@gmail.com>
Message-ID: <CAPnjgZ1AjnXgiAAoTBfqn5c2KYV1wVvkjSt3Ec7G+gwW88P1Nw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Benjamino,

On 8 May 2016 at 00:30, Beniamino Galvani <b.galvani@gmail.com> wrote:
> This adds platform code for the Amlogic Meson GXBaby (S905) SoC and a
> board definition for ODROID-C2. This initial submission only supports
> UART and Ethernet (through the existing Designware driver). DTS files
> are the ones submitted to Linux arm-soc for 4.7 [1].
>
> [1] https://patchwork.ozlabs.org/patch/603583/
>
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> ---
>  arch/arm/Kconfig                       |   9 ++
>  arch/arm/Makefile                      |   1 +
>  arch/arm/dts/Makefile                  |   2 +
>  arch/arm/dts/meson-gxbb-odroidc2.dts   |  69 +++++++++++++
>  arch/arm/dts/meson-gxbb.dtsi           | 178 +++++++++++++++++++++++++++++++++
>  arch/arm/include/asm/arch-meson/gxbb.h |  52 ++++++++++
>  arch/arm/mach-meson/Kconfig            |  31 ++++++
>  arch/arm/mach-meson/Makefile           |   7 ++
>  arch/arm/mach-meson/board.c            |  66 ++++++++++++
>  board/hardkernel/odroid-c2/Kconfig     |  12 +++
>  board/hardkernel/odroid-c2/MAINTAINERS |   6 ++
>  board/hardkernel/odroid-c2/Makefile    |   7 ++
>  board/hardkernel/odroid-c2/README      |  60 +++++++++++
>  board/hardkernel/odroid-c2/odroid-c2.c |  51 ++++++++++
>  configs/odroid-c2_defconfig            |  23 +++++
>  drivers/serial/Kconfig                 |  15 +++
>  drivers/serial/Makefile                |   1 +
>  drivers/serial/serial_meson.c          | 162 ++++++++++++++++++++++++++++++
>  include/configs/odroid-c2.h            |  51 ++++++++++
>  19 files changed, 803 insertions(+)
>  create mode 100644 arch/arm/dts/meson-gxbb-odroidc2.dts
>  create mode 100644 arch/arm/dts/meson-gxbb.dtsi
>  create mode 100644 arch/arm/include/asm/arch-meson/gxbb.h
>  create mode 100644 arch/arm/mach-meson/Kconfig
>  create mode 100644 arch/arm/mach-meson/Makefile
>  create mode 100644 arch/arm/mach-meson/board.c
>  create mode 100644 board/hardkernel/odroid-c2/Kconfig
>  create mode 100644 board/hardkernel/odroid-c2/MAINTAINERS
>  create mode 100644 board/hardkernel/odroid-c2/Makefile
>  create mode 100644 board/hardkernel/odroid-c2/README
>  create mode 100644 board/hardkernel/odroid-c2/odroid-c2.c
>  create mode 100644 configs/odroid-c2_defconfig
>  create mode 100644 drivers/serial/serial_meson.c
>  create mode 100644 include/configs/odroid-c2.h

One point that I may have already asked...can the Ethernet use
CONFIG_DM_ETH (i.e. driver mode), perhaps in a follow-on patch?

Regards,
Simon
