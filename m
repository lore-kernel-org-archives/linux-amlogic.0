From: robh@kernel.org (Rob Herring)
Date: Fri, 12 May 2017 14:38:06 -0500
Subject: [PATCH 2/5] pintrl: meson: document GPIO IRQ DT binding
In-Reply-To: <0d835130-7c6c-751c-af15-c2ab69edcb42@gmail.com>
References: <a4ca587b-d3e8-a22d-4d25-289871d2d095@gmail.com>
 <0d835130-7c6c-751c-af15-c2ab69edcb42@gmail.com>
Message-ID: <20170512193806.trt7jbvfyygkqard@rob-hp-laptop>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, May 07, 2017 at 06:34:09PM +0200, Heiner Kallweit wrote:
> Document the DT binding for GPIO IRQ support on Amlogic Meson SoC's.
> 
> This documentation is intentionally not placed under
> interrupt-controllers as GPIO IRQ support on these SoC's acts more
> like an interrupt multiplexer.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  .../bindings/gpio/amlogic,meson-gpio-interrupt.txt | 30 ++++++++++++++++++++++

Seems more like an irqchip?

>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/amlogic,meson-gpio-interrupt.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/amlogic,meson-gpio-interrupt.txt b/Documentation/devicetree/bindings/gpio/amlogic,meson-gpio-interrupt.txt
> new file mode 100644
> index 00000000..35a052b8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/amlogic,meson-gpio-interrupt.txt
> @@ -0,0 +1,30 @@
> +Amlogic meson GPIO interrupt controller
> +
> +Meson SoCs contains an interrupt controller which is able watch the SoC pads
> +and generate an interrupt on edges or level. The controller is essentially a
> +256 pads to 8 GIC interrupt multiplexer, with a filter block to select edge
> +or level and polarity. We don't expose all 256 mux inputs because the
> +documentation shows that upper part is not mapped to any pad. The actual number
> +of interrupt exposed depends on the SoC.
> +
> +Required properties:
> +
> +- compatible : should be "amlogic,meson-gpio-interrupt", "syscon".

Why syscon?

> +- reg : Specifies base physical address and size of the registers.
> +- interrupts : list of GIC interrupts which can be used with the
> +	       GPIO IRQ multiplexer

What about interrupt-controller property?

> +
> +Example:
> +
> +gpio_irq at 9880 {

interrupt-controller at ...

> +	compatible = "amlogic,meson-gpio-interrupt", "syscon";
> +	reg = <0x0 0x09880 0x0 0x10>;
> +	interrupts = <GIC_SPI 64 IRQ_TYPE_NONE>,
> +		     <GIC_SPI 65 IRQ_TYPE_NONE>,
> +		     <GIC_SPI 66 IRQ_TYPE_NONE>,
> +		     <GIC_SPI 67 IRQ_TYPE_NONE>,
> +		     <GIC_SPI 68 IRQ_TYPE_NONE>,
> +		     <GIC_SPI 69 IRQ_TYPE_NONE>,
> +		     <GIC_SPI 70 IRQ_TYPE_NONE>,
> +		     <GIC_SPI 71 IRQ_TYPE_NONE>;
> +	};
> -- 
> 2.12.2
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo at vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
