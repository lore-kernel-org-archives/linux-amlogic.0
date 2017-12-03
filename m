From: b.galvani@gmail.com (Beniamino Galvani)
Date: Sun,  3 Dec 2017 10:17:09 +0100
Subject: [PATCH 0/4] Meson clock driver
Message-ID: <20171203091713.22029-1-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

this is a basic clock driver for u-boot that supports
enabling/disabling clock gates and getting their frequency. With this,
some hardcoded initializations can be removed from the board code, and
drivers can use the information from device tree to initialize clocks.

Beniamino Galvani (4):
  ARM: dts: update gxbb-clkc.h from Linux 4.14
  ARM: meson: add clock measurement function
  clk: add Amlogic meson clock driver
  meson: use the clock driver

 arch/arm/include/asm/arch-meson/clock.h |  34 ++++++
 arch/arm/include/asm/arch-meson/gxbb.h  |  10 --
 arch/arm/include/asm/arch-meson/i2c.h   |  11 --
 arch/arm/mach-meson/Kconfig             |   2 +
 arch/arm/mach-meson/Makefile            |   2 +-
 arch/arm/mach-meson/clock.c             |  45 ++++++++
 board/amlogic/odroid-c2/odroid-c2.c     |   4 +-
 board/amlogic/p212/p212.c               |   3 +-
 drivers/clk/Makefile                    |   1 +
 drivers/clk/clk_meson.c                 | 196 ++++++++++++++++++++++++++++++++
 drivers/i2c/meson_i2c.c                 |  20 +++-
 include/dt-bindings/clock/gxbb-clkc.h   |  75 ++++++++++++
 12 files changed, 373 insertions(+), 30 deletions(-)
 create mode 100644 arch/arm/include/asm/arch-meson/clock.h
 delete mode 100644 arch/arm/include/asm/arch-meson/i2c.h
 create mode 100644 arch/arm/mach-meson/clock.c
 create mode 100644 drivers/clk/clk_meson.c

-- 
2.14.3
