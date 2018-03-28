From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 28 Mar 2018 10:59:13 +0200
Subject: [PATCH 0/4] Meson clock driver
In-Reply-To: <20171203091713.22029-1-b.galvani@gmail.com>
References: <20171203091713.22029-1-b.galvani@gmail.com>
Message-ID: <6e03826d-9de8-7be1-9aba-4ebdd3c14a45@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Beniamino,

On 03/12/2017 10:17, Beniamino Galvani wrote:
> Hi,
> 
> this is a basic clock driver for u-boot that supports
> enabling/disabling clock gates and getting their frequency. With this,
> some hardcoded initializations can be removed from the board code, and
> drivers can use the information from device tree to initialize clocks.
> 
> Beniamino Galvani (4):
>   ARM: dts: update gxbb-clkc.h from Linux 4.14
>   ARM: meson: add clock measurement function
>   clk: add Amlogic meson clock driver
>   meson: use the clock driver
> 
>  arch/arm/include/asm/arch-meson/clock.h |  34 ++++++
>  arch/arm/include/asm/arch-meson/gxbb.h  |  10 --
>  arch/arm/include/asm/arch-meson/i2c.h   |  11 --
>  arch/arm/mach-meson/Kconfig             |   2 +
>  arch/arm/mach-meson/Makefile            |   2 +-
>  arch/arm/mach-meson/clock.c             |  45 ++++++++
>  board/amlogic/odroid-c2/odroid-c2.c     |   4 +-
>  board/amlogic/p212/p212.c               |   3 +-
>  drivers/clk/Makefile                    |   1 +
>  drivers/clk/clk_meson.c                 | 196 ++++++++++++++++++++++++++++++++
>  drivers/i2c/meson_i2c.c                 |  20 +++-
>  include/dt-bindings/clock/gxbb-clkc.h   |  75 ++++++++++++
>  12 files changed, 373 insertions(+), 30 deletions(-)
>  create mode 100644 arch/arm/include/asm/arch-meson/clock.h
>  delete mode 100644 arch/arm/include/asm/arch-meson/i2c.h
>  create mode 100644 arch/arm/mach-meson/clock.c
>  create mode 100644 drivers/clk/clk_meson.c
> 

Do you plan to re-send the driver soon ?

Thanks,
Neil
