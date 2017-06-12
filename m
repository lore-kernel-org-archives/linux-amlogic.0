From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 12 Jun 2017 09:28:22 +0200
Subject: [PATCH 03/13] clk: meson8b: export the gate clock for the HW
 random number generator
In-Reply-To: <20170611101644.28581-4-martin.blumenstingl@googlemail.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
 <20170611101644.28581-4-martin.blumenstingl@googlemail.com>
Message-ID: <63798af4-4037-6256-cebc-716df3ebcbac@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 06/11/2017 12:16 PM, Martin Blumenstingl wrote:
> This exports the clock so it can be used in the dt-bindings.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/clk/meson/meson8b.h              | 2 +-
>  include/dt-bindings/clock/meson8b-clkc.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
> index e0fb386ccc23..51c3f6717180 100644
> --- a/drivers/clk/meson/meson8b.h
> +++ b/drivers/clk/meson/meson8b.h
> @@ -89,7 +89,7 @@
>  #define CLKID_I2C		22
>  /* #define CLKID_SAR_ADC */
>  #define CLKID_SMART_CARD	24
> -#define CLKID_RNG0		25
> +/* #define CLKID_RNG0 */
>  #define CLKID_UART0		26
>  #define CLKID_SDHC		27
>  #define CLKID_STREAM		28
> diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
> index 821b08574900..f004e6760b5d 100644
> --- a/include/dt-bindings/clock/meson8b-clkc.h
> +++ b/include/dt-bindings/clock/meson8b-clkc.h
> @@ -22,6 +22,7 @@
>  #define CLKID_MPEG_SEL		14
>  #define CLKID_MPEG_DIV		15
>  #define CLKID_SAR_ADC		23
> +#define CLKID_RNG0		25
>  #define CLKID_SDIO		30
>  #define CLKID_SANA		69
>  
> 


Acked-by: Neil Armstrong <narmstrong@baylibre.com>
