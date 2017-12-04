From: jbrunet@baylibre.com (Jerome Brunet)
Date: Mon, 04 Dec 2017 10:42:21 +0100
Subject: [PATCH 1/2] ARM64: dts: meson: add comments with the GPIO for
 the PHY interrupts
In-Reply-To: <20171202214037.17017-2-martin.blumenstingl@googlemail.com>
References: <20171202214037.17017-1-martin.blumenstingl@googlemail.com>
 <20171202214037.17017-2-martin.blumenstingl@googlemail.com>
Message-ID: <1512380541.2574.36.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, 2017-12-02 at 22:40 +0100, Martin Blumenstingl wrote:
> Currently one has to look/calculate the GPIO for the PHY interrupts
> manually. Add a comment for the existing PHY interrupt lines to make it
> easier to find out which GPIO is used.
> This is done using the following calculation:
> - number of GPIO AO pins (14 on GXBB: GPIOAO_0..13)
> - add the offset of the pin which is used for the interrupt (for example
>   GPIOZ_15 = 15 on Odroid-C2)
> 

Reviewed-By: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
