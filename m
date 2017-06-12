From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 12 Jun 2017 09:33:56 +0200
Subject: [PATCH 08/13] ARM: dts: meson: add the SAR ADC
In-Reply-To: <20170611101644.28581-9-martin.blumenstingl@googlemail.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
 <20170611101644.28581-9-martin.blumenstingl@googlemail.com>
Message-ID: <55f901c9-a433-c729-c097-4c1747316b2d@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 06/11/2017 12:16 PM, Martin Blumenstingl wrote:
> This adds the SAR ADC to meson.dtsi and configures the clocks on Meson8
> and Meson8b to allow boards to use it. Some boards use it to connect a
> button to it.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  arch/arm/boot/dts/meson.dtsi   | 8 ++++++++
>  arch/arm/boot/dts/meson8.dtsi  | 8 ++++++++
>  arch/arm/boot/dts/meson8b.dtsi | 8 ++++++++
>  3 files changed, 24 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
> index 8d9c36970dfd..b05796bee088 100644
> --- a/arch/arm/boot/dts/meson.dtsi
> +++ b/arch/arm/boot/dts/meson.dtsi
> @@ -101,6 +101,14 @@
>  				status = "disabled";
>  			};
>  
> +			saradc: adc at 8680 {
> +				compatible = "amlogic,meson-saradc";
> +				reg = <0x8680 0x34>;
> +				#io-channel-cells = <1>;
> +				interrupts = <0 73 1>;

Can you use the correct GIC_ and IRQ_TYPE_ ... defines for the IRQ property ?

> +				status = "disabled";
> +			};
> +
>  			uart_C: serial at 8700 {
>  				compatible = "amlogic,meson-uart";
>  				reg = <0x8700 0x18>;
> diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
> index 1bbfc04c3f10..8582490fcb52 100644
> --- a/arch/arm/boot/dts/meson8.dtsi
> +++ b/arch/arm/boot/dts/meson8.dtsi
> @@ -232,6 +232,14 @@
>  	arm,filter-ranges = <0x100000 0xc0000000>;
>  };
>  
> +&saradc {
> +	compatible = "amlogic,meson8-saradc", "amlogic,meson-saradc";
> +	clocks = <&clkc CLKID_XTAL>,
> +		<&clkc CLKID_SAR_ADC>,
> +		<&clkc CLKID_SANA>;
> +	clock-names = "clkin", "core", "sana";
> +};
> +
>  &spifc {
>  	clocks = <&clkc CLKID_CLK81>;
>  };
> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> index d9f116a418b2..1c09090ff4a5 100644
> --- a/arch/arm/boot/dts/meson8b.dtsi
> +++ b/arch/arm/boot/dts/meson8b.dtsi
> @@ -177,6 +177,14 @@
>  	arm,filter-ranges = <0x100000 0xc0000000>;
>  };
>  
> +&saradc {
> +	compatible = "amlogic,meson8b-saradc", "amlogic,meson-saradc";
> +	clocks = <&clkc CLKID_XTAL>,
> +		<&clkc CLKID_SAR_ADC>,
> +		<&clkc CLKID_SANA>;
> +	clock-names = "clkin", "core", "sana";
> +};
> +
>  &uart_AO {
>  	clocks = <&clkc CLKID_CLK81>;
>  };
> 

Apart from that :
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
