From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue, 28 Jun 2016 10:06:55 +0200
Subject: [PATCH 0/2] pinctrl: Enable support for external GPIO interrupts
Message-ID: <5772301F.3030904@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

> From: Carlo Caione <carlo@endlessm.com>
> 
> In Meson SoCs we have 8 independent GPIO interrupts that can be programmed to
> use any of the GPIOs in the chip as interrupt source.
> 
> These GPIOs are managed by GIC but they can be conditioned (and enabled) by
> some registers external to the GIC.
> 
> GPIOs |--[mux1 or mux2]--[polarity]--[filter]--[edge_select]--> GIC
> 
> The original work has been done by Beniamino. I cleaned it up, fixed a couple
> of bugs, added support for Meson8b and the fix for the .to_irq hook.

Hi Carlo, Linus,

I have another implementation idea about this subject, by using static GPIO-irq
association in DT instead of using a very complex dynamic allocation.

The idea is to add a simple property :
irqs-gpios = <>

To map a GPIO to the irqs, then we can either use the DT irq mapping or use the
gpiolib to_irq() if the gpio is in the table.

The relative drawback is that we will need DT changes to enable routing of a gpio
to an IRQ, but the complete system is based on a DT description anyway.

In this case, we could use gpiochip_irqchip.

Do you think this structure would be acceptable ?

Neil

> Beniamino Galvani (2):
>   pinctrl: meson: Enable GPIO IRQs
>   pinctrl: dt-binding: Extend meson documentation with GPIO IRQs support
> 
>  .../devicetree/bindings/pinctrl/meson,pinctrl.txt  |  12 +
>  drivers/pinctrl/Kconfig                            |   1 +
>  drivers/pinctrl/meson/pinctrl-meson.c              | 254 +++++++++++++++++++++
>  drivers/pinctrl/meson/pinctrl-meson.h              |  18 +-
>  drivers/pinctrl/meson/pinctrl-meson8.c             |  36 +--
>  drivers/pinctrl/meson/pinctrl-meson8b.c            |  36 +--
>  6 files changed, 326 insertions(+), 31 deletions(-)
> 
> -- 
> 1.9.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
