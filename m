From: jagan@amarulasolutions.com (Jagan Teki)
Date: Fri, 23 Nov 2018 11:09:24 +0530
Subject: [U-Boot] [PATCH u-boot v3 0/3] Add Amlogic Meson SPI Flash
 Controller driver
In-Reply-To: <20181122100105.14829-1-narmstrong@baylibre.com>
References: <20181122100105.14829-1-narmstrong@baylibre.com>
Message-ID: <CAMty3ZDuffrA5bZvY=iGTzi=dv3P92gT_PyWRKoM8KLA3kumOQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Nov 22, 2018 at 3:31 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
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

Applied to u-boot-spi/master
