From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 23 Mar 2017 08:47:24 +0100
Subject: [PATCH 2/3] meson_uart: add documentation for the dt-bindings
 of meson_uart
In-Reply-To: <bc060682-1c15-4e24-6e8b-9d2aa3cf1cd3@gmail.com>
References: <bc060682-1c15-4e24-6e8b-9d2aa3cf1cd3@gmail.com>
Message-ID: <58D37D8C.7060001@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org



Le 22/03/2017 21:45, Helmut Klein a ?crit :
> this patch adds the dt-bindings information for meson_uart.
> 
> i'm pretty sure, that this is NOT the final version.
> 
> diff -Napur a/Documentation/devicetree/bindings/serial/meson_uart.txt b/Documentation/devicetree/bindings/serial/meson_uart.txt
> --- a/Documentation/devicetree/bindings/serial/meson_uart.txt    1970-01-01 01:00:00.000000000 +0100
> +++ b/Documentation/devicetree/bindings/serial/meson_uart.txt    2017-03-22 20:05:06.461911566 +0100
> @@ -0,0 +1,42 @@
> +* Amlogic Meson UART, used in multiple SoCs (e.g. S905, s905X, ...)
> +
> +Required properties:
> +- compatible        : "amlogic,meson-uart"
> +- reg            : offset and length of the register set for the device.
> +- pinctrl        : i/o pins to use for the uart function (pin mux)
> +- interrupts        : device interrupt
> +- clocks        : the baud rate clock for the UART and optional the core clock
> +
> +e.g.
> +uart_AO: serial at 4c0 {
> +    compatible = "amlogic,meson-uart";
> +    reg = <0x0 0x004c0 0x0 0x14>;
> +    pinctrl-0 = <&uart_ao_a_pins>;
> +    interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
> +    clocks = <&xtal>;
> +    status = "ok";
> +};
> +
> +Optional properties:
> +- clock-names        : the names of the clocks: "xtal" and optional "core"
> +- pinctrl-names        : the names of the pin controls, must be "default"
> +
> +e.g.
> +uart_A: serial at 84c0 {
> +    compatible = "amlogic,meson-uart";
> +    reg = <0x0 0x84c0 0x0 0x14>;
> +    pinctrl-0 = <&uart_a_pins &uart_a_cts_rts_pins>;
> +    pinctrl-names = "default";
> +    interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
> +    clocks = <&xtal>, <&clkc CLKID_UART0>;
> +    clock-names = "xtal", "core";
> +    status = "ok";
> +};
> +
> +Note: Each port should have an alias correctly numbered in "aliases" node.
> +
> +e.g.
> +aliases {
> +    serial0 = &uart_AO;
> +    serial1 = &uart_A;
> +};


At first glance it looks ok, but you'll need a DT maintainer ack, so don't forget to Cc devicetree at vger.kernel.org

Neil
