From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 12 Jun 2017 09:37:05 +0200
Subject: [PATCH 12/13] ARM: dts: meson8b: add the SCU device node
In-Reply-To: <20170611101644.28581-13-martin.blumenstingl@googlemail.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
 <20170611101644.28581-13-martin.blumenstingl@googlemail.com>
Message-ID: <9a556b03-3565-8b0f-ed99-67baa4002270@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 06/11/2017 12:16 PM, Martin Blumenstingl wrote:
> Amlogic's Meson8b SoC has a Snoop Control Unit (SCU), just like many
> other Cortex-A5 SoCs. Add the corresponding devicetree node so it can be
> used during SMP boot.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  arch/arm/boot/dts/meson8.dtsi  | 5 +++++
>  arch/arm/boot/dts/meson8b.dtsi | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
> index 7bfce6d8d0af..f6816ea09aeb 100644
> --- a/arch/arm/boot/dts/meson8.dtsi
> +++ b/arch/arm/boot/dts/meson8.dtsi
> @@ -110,6 +110,11 @@
>  			no-map;
>  		};
>  	};
> +
> +	scu at c4300000 {
> +		compatible = "arm,cortex-a9-scu";
> +		reg = <0xc4300000 0x100>;
> +	};
>  }; /* end of / */
>  
>  &aobus {
> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> index aa4664713b66..2b13570b0e60 100644
> --- a/arch/arm/boot/dts/meson8b.dtsi
> +++ b/arch/arm/boot/dts/meson8b.dtsi
> @@ -82,6 +82,11 @@
>  			reg = <0x203>;
>  		};
>  	};
> +
> +	scu at c4300000 {
> +		compatible = "arm,cortex-a5-scu";
> +		reg = <0xc4300000 0x100>;
> +	};
>  }; /* end of / */
>  
>  &aobus {
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
