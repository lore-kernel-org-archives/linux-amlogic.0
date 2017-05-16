From: jbrunet@baylibre.com (Jerome Brunet)
Date: Wed, 17 May 2017 01:28:59 +0200
Subject: [PATCH v2 2/6] pintrl: meson: document GPIO IRQ DT binding
In-Reply-To: <c5ea65c5-f604-d890-4e73-f53bdd47bd31@gmail.com>
References: <36164ed8-aa59-2a77-b7fc-9adce03a2fc1@gmail.com>
 <c5ea65c5-f604-d890-4e73-f53bdd47bd31@gmail.com>
Message-ID: <1494977339.2728.8.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Fri, 2017-05-12 at 21:13 +0200, Heiner Kallweit wrote:
> Document the DT binding for GPIO IRQ support on Amlogic Meson SoC's.
> 
> This documentation is intentionally not placed under
> interrupt-controllers as GPIO IRQ support on these SoC's acts more
> like an interrupt multiplexer.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - remove syscon
> ---
> ?arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 13 +++++++++++++
> ?1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> index 436b8750..44422b85 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -312,6 +312,19 @@
> ?				status = "disabled";
> ?			};
> ?
> +			gpio_irq at 9880 {
> +				compatible = "amlogic,meson-gpio-interrupt";
> +				reg = <0x0 0x09880 0x0 0x10>;
> +				interrupts = <GIC_SPI 64 IRQ_TYPE_NONE>,
> +					?????<GIC_SPI 65 IRQ_TYPE_NONE>,
> +					?????<GIC_SPI 66 IRQ_TYPE_NONE>,
> +					?????<GIC_SPI 67 IRQ_TYPE_NONE>,
> +					?????<GIC_SPI 68 IRQ_TYPE_NONE>,
> +					?????<GIC_SPI 69 IRQ_TYPE_NONE>,
> +					?????<GIC_SPI 70 IRQ_TYPE_NONE>,
> +					?????<GIC_SPI 71 IRQ_TYPE_NONE>;
> +			};
> +

Already tried the same thing:
https://marc.info/?l=devicetree&m=147758174404359&w=2

Irq maintainers reminded me that this is not correct as the device is not able
to generate these particular irqs (it is merely routing the signal) and the
flags are meaning less here


> ?			watchdog at 98d0 {
> ?				compatible = "amlogic,meson-gx-wdt",
> "amlogic,meson-gxbb-wdt";
> ?				reg = <0x0 0x098d0 0x0 0x10>;
