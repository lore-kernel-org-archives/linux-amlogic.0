From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri, 28 Jul 2017 15:58:48 +0200
Subject: [PATCH] ARM64: dts: meson-gx: consistently use the GIC_SPI and
 IRQ type macros
In-Reply-To: <20170716141145.30295-1-martin.blumenstingl@googlemail.com>
References: <20170716141145.30295-1-martin.blumenstingl@googlemail.com>
Message-ID: <4643e311-36d8-a694-78b3-6a4e2033d7d6@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 07/16/2017 04:11 PM, Martin Blumenstingl wrote:
> the mailbox and ethmac nodes used the magic number "0" instead of the
> GIC_SPI preprocessor macro. Additionally the ethmac used the magic
> number "1" instead of IRQ_TYPE_EDGE_RISING.
> Fix this to make the .dtsi easier to read.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> index 35b8c88c3220..492e6a24349a 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -437,9 +437,9 @@
>  			mailbox: mailbox at 404 {
>  				compatible = "amlogic,meson-gx-mhu", "amlogic,meson-gxbb-mhu";
>  				reg = <0 0x404 0 0x4c>;
> -				interrupts = <0 208 IRQ_TYPE_EDGE_RISING>,
> -					     <0 209 IRQ_TYPE_EDGE_RISING>,
> -					     <0 210 IRQ_TYPE_EDGE_RISING>;
> +				interrupts = <GIC_SPI 208 IRQ_TYPE_EDGE_RISING>,
> +					     <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>,
> +					     <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>;
>  				#mbox-cells = <1>;
>  			};
>  		};
> @@ -448,7 +448,7 @@
>  			compatible = "amlogic,meson-gx-dwmac", "amlogic,meson-gxbb-dwmac", "snps,dwmac";
>  			reg = <0x0 0xc9410000 0x0 0x10000
>  			       0x0 0xc8834540 0x0 0x4>;
> -			interrupts = <0 8 1>;
> +			interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>;
>  			interrupt-names = "macirq";
>  			status = "disabled";
>  		};
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
