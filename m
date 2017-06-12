From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 12 Jun 2017 09:28:05 +0200
Subject: [PATCH 01/13] clk: meson8b: export the SAR ADC clocks
In-Reply-To: <20170611101644.28581-2-martin.blumenstingl@googlemail.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
 <20170611101644.28581-2-martin.blumenstingl@googlemail.com>
Message-ID: <869e279b-7b71-4946-b7ae-e507d6114956@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 06/11/2017 12:16 PM, Martin Blumenstingl wrote:
> Export the clocks for the SAR ADC so they can be used in the
> dt-bindings.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/clk/meson/meson8b.h              | 4 ++--
>  include/dt-bindings/clock/meson8b-clkc.h | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
> index 3881defc8644..5447d4a5c9ba 100644
> --- a/drivers/clk/meson/meson8b.h
> +++ b/drivers/clk/meson/meson8b.h
> @@ -87,7 +87,7 @@
>  #define CLKID_PERIPHS		20
>  #define CLKID_SPICC		21
>  #define CLKID_I2C		22
> -#define CLKID_SAR_ADC		23
> +/* #define CLKID_SAR_ADC */
>  #define CLKID_SMART_CARD	24
>  #define CLKID_RNG0		25
>  #define CLKID_UART0		26
> @@ -133,7 +133,7 @@
>  #define CLKID_MMC_PCLK		66
>  #define CLKID_DVIN		67
>  #define CLKID_UART2		68
> -#define CLKID_SANA		69
> +/* #define CLKID_SANA */
>  #define CLKID_VPU_INTR		70
>  #define CLKID_SEC_AHB_AHB3_BRIDGE	71
>  #define CLKID_CLK81_A9		72
> diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
> index a55ff8c9b30f..1c7f090da440 100644
> --- a/include/dt-bindings/clock/meson8b-clkc.h
> +++ b/include/dt-bindings/clock/meson8b-clkc.h
> @@ -21,5 +21,7 @@
>  #define CLKID_ZERO		13
>  #define CLKID_MPEG_SEL		14
>  #define CLKID_MPEG_DIV		15
> +#define CLKID_SAR_ADC		23
> +#define CLKID_SANA		69
>  
>  #endif /* __MESON8B_CLKC_H */
> 


Acked-by: Neil Armstrong <narmstrong@baylibre.com>
