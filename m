From: afaerber@suse.de (=?UTF-8?Q?Andreas_F=c3=a4rber?=)
Date: Fri, 8 Jul 2016 02:49:25 +0200
Subject: [PATCH 3/3] ARM64: dts: amlogic: enable sd_emmc_b on all
 Tronsmart Vega S95 devices
In-Reply-To: <20160625163446.7245-4-martin.blumenstingl@googlemail.com>
References: <20160625163446.7245-1-martin.blumenstingl@googlemail.com>
 <20160625163446.7245-4-martin.blumenstingl@googlemail.com>
Message-ID: <577EF895.1000600@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 25.06.2016 um 18:34 schrieb Martin Blumenstingl:
> sd_emmc_b is routed to the SD-card. Unlike p20x there is no GPIO
> regulator, meaning it only supports 3.3V (which seems to be hard-wired).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> index b003729..3a77829 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> @@ -53,6 +53,17 @@
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	mmc_iv: fixed-regulator {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "mmc-supply";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
>  };
>  
>  &uart_A {
> @@ -73,3 +84,19 @@
>  	pinctrl-0 = <&eth_pins>;
>  	pinctrl-names = "default";
>  };
> +
> +&sd_emmc_b {
[snip]

This does not build on next-20160707 - what branch is this based on?

Thanks,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N?rnberg, Germany
GF: Felix Imend?rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N?rnberg)
