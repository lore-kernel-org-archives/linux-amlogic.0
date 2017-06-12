From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 12 Jun 2017 09:37:16 +0200
Subject: [PATCH 13/13] ARM: dts: meson: use the real ethernet clock on
 Meson8 and Meson8b
In-Reply-To: <20170611101644.28581-14-martin.blumenstingl@googlemail.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
 <20170611101644.28581-14-martin.blumenstingl@googlemail.com>
Message-ID: <f26c205e-9956-3315-27bf-b520cbaff1ad@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 06/11/2017 12:16 PM, Martin Blumenstingl wrote:
> Until now clk81 was used as gate clock for the ethernet controller on
> Meson8 whereas Meson8b did not configure a gate clock at all. Use
> CLKID_ETH for both SoCs, which is the real gate clock for the ethernet
> controller.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  arch/arm/boot/dts/meson8.dtsi  | 2 +-
>  arch/arm/boot/dts/meson8b.dtsi | 5 +++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
> index f6816ea09aeb..d997185896b7 100644
> --- a/arch/arm/boot/dts/meson8.dtsi
> +++ b/arch/arm/boot/dts/meson8.dtsi
> @@ -242,7 +242,7 @@
>  };
>  
>  &ethmac {
> -	clocks = <&clkc CLKID_CLK81>;
> +	clocks = <&clkc CLKID_ETH>;
>  	clock-names = "stmmaceth";
>  };
>  
> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> index 2b13570b0e60..e57934f82098 100644
> --- a/arch/arm/boot/dts/meson8b.dtsi
> +++ b/arch/arm/boot/dts/meson8b.dtsi
> @@ -176,6 +176,11 @@
>  	};
>  };
>  
> +&ethmac {
> +	clocks = <&clkc CLKID_ETH>;
> +	clock-names = "stmmaceth";
> +};
> +
>  &hwrng {
>  	clocks = <&clkc CLKID_RNG0>;
>  	clock-names = "core";
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
