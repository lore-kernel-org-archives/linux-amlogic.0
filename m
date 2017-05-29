From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 29 May 2017 10:49:28 +0200
Subject: [PATCH RfC v4 4/6] ARM(64): dts: meson: add GPIO
 interrupt-controller support
In-Reply-To: <5294644a-967e-dba8-d287-d932b38244d1@gmail.com>
References: <49ab677f-3165-d6f5-75f5-a963879e8ecf@gmail.com>
 <5294644a-967e-dba8-d287-d932b38244d1@gmail.com>
Message-ID: <860a50b5-3e7c-29d0-54fa-89bf2840e04e@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org



Please correct the subject to :
ARM64: dts: meson: add GPIO interrupt-controller support

On 05/28/2017 09:11 PM, Heiner Kallweit wrote:
> Add support for the GPIO interupt controller of certain Amlogic Meson
> Soc's.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  arch/arm/boot/dts/meson8.dtsi             | 8 ++++++++
>  arch/arm/boot/dts/meson8b.dtsi            | 8 ++++++++
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 8 ++++++++
>  3 files changed, 24 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
> index 69930773..b4c4175d 100644
> --- a/arch/arm/boot/dts/meson8.dtsi
> +++ b/arch/arm/boot/dts/meson8.dtsi
> @@ -126,6 +126,14 @@
>  };
>  
>  &cbus {
> +	gpio_intc: interrupt-controller at 9880 {
> +		compatible = "amlogic,meson-gpio-intc";
> +		reg = <0x9880 0x10>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		parent-interrupts = <64 65 66 67 68 79 70 71>;
> +	};
> +
>  	pinctrl_cbus: pinctrl at 9880 {
>  		compatible = "amlogic,meson8-cbus-pinctrl";
>  		reg = <0x9880 0x10>;
> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> index d9f116a4..1bce64a6 100644
> --- a/arch/arm/boot/dts/meson8b.dtsi
> +++ b/arch/arm/boot/dts/meson8b.dtsi
> @@ -151,6 +151,14 @@
>  		interrupts = <0 0 1>;
>  	};
>  
> +	gpio_intc: interrupt-controller at 9880 {
> +		compatible = "amlogic,meson-gpio-intc";
> +		reg = <0x9880 0x10>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		parent-interrupts = <64 65 66 67 68 79 70 71>;
> +	};
> +
>  	pinctrl_cbus: pinctrl at 9880 {
>  		compatible = "amlogic,meson8b-cbus-pinctrl";
>  		reg = <0x9880 0x10>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> index 436b8750..66dde761 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -312,6 +312,14 @@
>  				status = "disabled";
>  			};
>  
> +			gpio_intc: interrupt-controller at 9880 {
> +				compatible = "amlogic,meson-gpio-intc";
> +				reg = <0x0 0x09880 0x0 0x10>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				parent-interrupts = <64 65 66 67 68 79 70 71>;
> +			};
> +
>  			watchdog at 98d0 {
>  				compatible = "amlogic,meson-gx-wdt", "amlogic,meson-gxbb-wdt";
>  				reg = <0x0 0x098d0 0x0 0x10>;
> 

Seems correct with the dt-bindings,

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
