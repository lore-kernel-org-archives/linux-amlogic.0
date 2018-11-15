From: jbrunet@baylibre.com (Jerome Brunet)
Date: Thu, 15 Nov 2018 16:41:47 +0100
Subject: [PATCH u-boot v3 0/3] Add Amlogic Meson SPI Flash Controller
 driver
In-Reply-To: <20181114102520.25346-1-narmstrong@baylibre.com>
References: <20181114102520.25346-1-narmstrong@baylibre.com>
Message-ID: <b27129c3dea56c172c28f71a94fc98c7164af5db.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, 2018-11-14 at 11:25 +0100, Neil Armstrong wrote:
> The Amlogic Meson SoCs embeds a Flash oriented SPI Controller name SPIFC.
> 
> This patchset add the driver ported from linux, but also import the regmap
> regmap_read_poll_timeout() to implify the register polling in the driver.
> 
> Neil Armstrong (3):
>   regmap: add regmap_read_poll_timeout() helper
>   test: regmap: add regmap_read_poll_timeout test
>   spi: Add Amlogic Meson SPI Flash Controller driver
> 
>  drivers/spi/Kconfig       |   8 +
>  drivers/spi/Makefile      |   1 +
>  drivers/spi/meson_spifc.c | 330 ++++++++++++++++++++++++++++++++++++++
>  include/regmap.h          |  38 +++++
>  test/dm/regmap.c          |  26 +++
>  5 files changed, 403 insertions(+)
>  create mode 100644 drivers/spi/meson_spifc.c
> 

Tested-by: Jerome Brunet <jbrunet@baylibre.com>

... on the libretech aml-s805x-ac which should be submitted soon.
