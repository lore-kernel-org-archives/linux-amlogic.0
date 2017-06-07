From: robh@kernel.org (Rob Herring)
Date: Wed, 7 Jun 2017 16:13:12 -0500
Subject: [PATCH v5 3/9] dt-bindings: add Amlogic Meson GPIO
 interrupt-controller DT binding documentation
In-Reply-To: <c190f764-b3af-8982-00e3-87e28eabecca@gmail.com>
References: <66c57893-0a9e-4f8c-a017-ab346abbdfd0@gmail.com>
 <c190f764-b3af-8982-00e3-87e28eabecca@gmail.com>
Message-ID: <20170607211312.av5osk5xxa5k5pr2@rob-hp-laptop>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, May 30, 2017 at 10:26:33PM +0200, Heiner Kallweit wrote:
> Add dt binding documentation for Amlogic meson GPIO interrupt controller.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> v5:
> - added Reviewed-by
> ---
>  .../amlogic,meson-gpio-intc.txt                    | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
> new file mode 100644
> index 00000000..2f20d212
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
> @@ -0,0 +1,26 @@
> +Amlogic meson GPIO interrupt controller
> +
> +Meson SoCs contains an interrupt controller which is able watch the SoC pads
> +and generate an interrupt on edges or level. The controller is essentially a
> +256 pads to 8 GIC interrupt multiplexer, with a filter block to select edge
> +or level and polarity. The actual number of interrupt exposed depends on the
> +SoC.
> +
> +Required properties:
> +
> +- compatible : should be "amlogic,meson-gpio-intc".
> +- reg : Specifies base physical address and size of the registers.
> +- interrupt-controller : Identifies the node as an interrupt controller.
> +- #interrupt-cells : should be 2.
> +- parent-interrupts : list of GIC interrupts which can be used with the
> +		      GPIO IRQ multiplexer

Just use "interrupts" here.

> +
> +Example:
> +
> +gpio_intc: interrupt-controller at 9880 {
> +	compatible = "amlogic,meson-gpio-intc";
> +	reg = <0x0 0x09880 0x0 0x10>;
> +	interrupt-controller;
> +	#interrupt-cells = <2>;
> +	parent-interrupts = <64 65 66 67 68 69 70 71>;
> +};
> -- 
> 2.13.0
> 
> 
