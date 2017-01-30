From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 30 Jan 2017 09:44:59 +0100
Subject: [RFC] spi-gpio on Odroid-C2 board
In-Reply-To: <20170129103326.GA26547@x220.localdomain>
References: <20170129103326.GA26547@x220.localdomain>
Message-ID: <867f36c0-7ee1-4580-516a-28b56a5db498@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 01/29/2017 11:33 AM, Slawomir Stepien wrote:
> Hi
> 
> Are there any issues regarding using spi-gpio on Odroid-C2 board dts file?
> I would like to use it but from what I can see dts still doesn't have it?
> 
> I tested something like this and is seems to works:
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index 5d28e1cdc998..62104dcd48a6 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -135,6 +135,18 @@
>                 compatible = "mmc-pwrseq-emmc";
>                 reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
>         };
> +
> +       spi-gpio {
> +               compatible = "spi-gpio";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               gpio-sck  = <&gpio GPIOX_2 GPIO_ACTIVE_HIGH>;
> +               gpio-miso = <&gpio GPIOX_4 GPIO_ACTIVE_HIGH>;
> +               gpio-mosi = <&gpio GPIOX_7 GPIO_ACTIVE_HIGH>;
> +               cs-gpios  = <&gpio GPIOX_1 GPIO_ACTIVE_HIGH
> +                            &gpio GPIOY_14 GPIO_ACTIVE_HIGH>;
> +               num-chipselects = <2>;
> +       };
>  };
>  
>  &scpi_clocks {
> 

Hi Slawomir,

Thanks for testing the spi-gpio interface, but since these pins are not explicitely used
as SPI, there is no real need to have them in the upstream Odroid-C2 dts file.

Such entries should added locally for each local projects.

Neil
