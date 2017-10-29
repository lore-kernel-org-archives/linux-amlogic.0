From: b.galvani@gmail.com (Beniamino Galvani)
Date: Sun, 29 Oct 2017 10:08:59 +0100
Subject: [PATCH 0/2] Amlogic I2C driver for u-boot
Message-ID: <20171029090901.24299-1-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

this series adds support for the Amlogic Meson I2C controller to
u-boot.

Beniamino Galvani (2):
  i2c: add Amlogic Meson driver
  odroid-c2: enable I2C

 arch/arm/include/asm/arch-meson/gxbb.h |   1 +
 arch/arm/include/asm/arch-meson/i2c.h  |  11 ++
 board/amlogic/odroid-c2/odroid-c2.c    |   1 +
 configs/odroid-c2_defconfig            |   3 +
 drivers/i2c/Kconfig                    |   6 +
 drivers/i2c/Makefile                   |   1 +
 drivers/i2c/meson_i2c.c                | 263 +++++++++++++++++++++++++++++++++
 7 files changed, 286 insertions(+)
 create mode 100644 arch/arm/include/asm/arch-meson/i2c.h
 create mode 100644 drivers/i2c/meson_i2c.c

-- 
2.13.6
