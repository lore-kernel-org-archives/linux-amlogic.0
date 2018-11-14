From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 14 Nov 2018 11:25:17 +0100
Subject: [PATCH u-boot v3 0/3] Add Amlogic Meson SPI Flash Controller driver
Message-ID: <20181114102520.25346-1-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Amlogic Meson SoCs embeds a Flash oriented SPI Controller name SPIFC.

This patchset add the driver ported from linux, but also import the regmap
regmap_read_poll_timeout() to implify the register polling in the driver.

Neil Armstrong (3):
  regmap: add regmap_read_poll_timeout() helper
  test: regmap: add regmap_read_poll_timeout test
  spi: Add Amlogic Meson SPI Flash Controller driver

 drivers/spi/Kconfig       |   8 +
 drivers/spi/Makefile      |   1 +
 drivers/spi/meson_spifc.c | 330 ++++++++++++++++++++++++++++++++++++++
 include/regmap.h          |  38 +++++
 test/dm/regmap.c          |  26 +++
 5 files changed, 403 insertions(+)
 create mode 100644 drivers/spi/meson_spifc.c

-- 
2.19.1
