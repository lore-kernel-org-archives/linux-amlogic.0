From: jbrunet@baylibre.com (jbrunet at baylibre.com)
Date: Tue, 06 Nov 2018 18:35:55 +0100
Subject: [PATCH u-boot] spi: Add Amlogic Meson SPI Flash Controller driver
In-Reply-To: <1541496359-18064-1-git-send-email-narmstrong@baylibre.com>
References: <1541496359-18064-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <0b95b7ee7a738ef92b8ca96b040a1ec84ba6abec.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, 2018-11-06 at 10:25 +0100, Neil Armstrong wrote:
> The Amlogic Meson SoCs embeds a Flash oriented SPI Controller name SPIFC.
> This driver, ported from the Linux meson-spi-spifc driver, add support
> for this controller on the Amlogic Meson GX SoCs in U-Boot.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Tested-by: Jerome Brunet <jbrunet@baylibre.com>
