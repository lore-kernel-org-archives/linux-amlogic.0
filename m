From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 14 Jun 2018 13:43:36 +0200
Subject: [PATCH u-boot 0/5] Amlogic Meson GX Updates for v2018.07
Message-ID: <1528976621-8397-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patchset :
 - fixes meson-saradc build
 - adds the meson clock driver from Beniamino with it's consent
 - switches to the clock driver for Ethernet and I2C
 - Enables boot from USB if config is enabled
 - finally enables USB, Regulator & ADC drivers for selected boards

Beniamino Galvani (2):
  clk: add Amlogic meson clock driver
  meson: use the clock driver

Neil Armstrong (3):
  adc: meson-saradc: fix regmap_init_mem call
  config: meson-gx-common: Enable USB boot
  configs: Update Meson GX configs

 arch/arm/include/asm/arch-meson/clock.h   | 117 +++++++++
 arch/arm/include/asm/arch-meson/gx.h      |  10 -
 arch/arm/mach-meson/Kconfig               |   2 +
 arch/arm/mach-meson/eth.c                 |   3 +-
 board/amlogic/libretech-cc/libretech-cc.c |   4 -
 board/amlogic/odroid-c2/odroid-c2.c       |   3 -
 configs/khadas-vim_defconfig              |  14 ++
 configs/libretech-cc_defconfig            |  17 ++
 configs/odroid-c2_defconfig               |   4 +
 configs/p212_defconfig                    |  14 ++
 drivers/adc/meson-saradc.c                |   2 +-
 drivers/clk/Makefile                      |   1 +
 drivers/clk/clk_meson.c                   | 393 ++++++++++++++++++++++++++++++
 drivers/clk/clk_meson.h                   |  47 ++++
 drivers/i2c/meson_i2c.c                   |  20 +-
 include/configs/meson-gx-common.h         |   7 +
 16 files changed, 635 insertions(+), 23 deletions(-)
 create mode 100644 arch/arm/include/asm/arch-meson/clock.h
 create mode 100644 drivers/clk/clk_meson.c
 create mode 100644 drivers/clk/clk_meson.h

-- 
2.7.4
