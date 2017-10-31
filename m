From: jbrunet@baylibre.com (Jerome Brunet)
Date: Tue, 31 Oct 2017 11:02:06 +0100
Subject: [PATCH 0/2] ARM: dts: meson: GPIO interrupt fixes for v4.15
In-Reply-To: <20171029231715.13391-1-martin.blumenstingl@googlemail.com>
References: <20171029231715.13391-1-martin.blumenstingl@googlemail.com>
Message-ID: <1509444126.13838.25.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, 2017-10-30 at 00:17 +0100, Martin Blumenstingl wrote:
> This provides two small fixes for the GPIO interrupt support on the
> 32-bit Meson SoCs.
> 
> The first change is purely cosmetic - I still decided to include to it
> because it keeps the sort order consistent. Also it's easier to find
> the node if you can rely on the sorting to be consistent.
> 
> The second patch however is required to make the GPIO interrupt
> controller functional on Meson8b. Without this the driver simply fails
> during the of_iomap call - and as a result of that GPIO interrupts are
> unavailable.
> 

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

And thanks for catching this early !

> 
> Martin Blumenstingl (2):
>   ARM: dts: meson: correct the sort order for the the gpio_intc node
>   ARM: dts: meson: fix the memory region of the GPIO interrupt
>     controller
> 
>  arch/arm/boot/dts/meson.dtsi | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
