From: jagan@amarulasolutions.com (Jagan Teki)
Date: Thu, 22 Nov 2018 12:10:46 +0530
Subject: [U-Boot] [PATCH u-boot v3 0/3] Add Amlogic Meson SPI Flash
 Controller driver
In-Reply-To: <20181114102520.25346-1-narmstrong@baylibre.com>
References: <20181114102520.25346-1-narmstrong@baylibre.com>
Message-ID: <CAMty3ZAQOdxjTttfCFA4hnZzgEX9cgijZrmdcxHXnkka+uNusQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, Nov 14, 2018 at 3:55 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The Amlogic Meson SoCs embeds a Flash oriented SPI Controller name SPIFC.
>
> This patchset add the driver ported from linux, but also import the regmap
> regmap_read_poll_timeout() to implify the register polling in the driver.
>
> Neil Armstrong (3):
>   regmap: add regmap_read_poll_timeout() helper
>   test: regmap: add regmap_read_poll_timeout test
>   spi: Add Amlogic Meson SPI Flash Controller driver

There are few regmap patches upstreamed recently, can you rebase and
the send the series again. take care of direct poll_timeout w/o any
function on driver.
