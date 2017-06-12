From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 12 Jun 2017 09:28:14 +0200
Subject: [PATCH 02/13] clk: meson8b: export the SDIO clock
In-Reply-To: <20170611101644.28581-3-martin.blumenstingl@googlemail.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
 <20170611101644.28581-3-martin.blumenstingl@googlemail.com>
Message-ID: <cab58b96-050d-2992-394d-40204ca1cb7a@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 06/11/2017 12:16 PM, Martin Blumenstingl wrote:
> Export the SDIO clock so it can be used in the dt-bindings.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/clk/meson/meson8b.h              | 2 +-
>  include/dt-bindings/clock/meson8b-clkc.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
> index 5447d4a5c9ba..e0fb386ccc23 100644
> --- a/drivers/clk/meson/meson8b.h
> +++ b/drivers/clk/meson/meson8b.h
> @@ -94,7 +94,7 @@
>  #define CLKID_SDHC		27
>  #define CLKID_STREAM		28
>  #define CLKID_ASYNC_FIFO	29
> -#define CLKID_SDIO		30
> +/* #define CLKID_SDIO */
>  #define CLKID_ABUF		31
>  #define CLKID_HIU_IFACE		32
>  #define CLKID_ASSIST_MISC	33
> diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
> index 1c7f090da440..821b08574900 100644
> --- a/include/dt-bindings/clock/meson8b-clkc.h
> +++ b/include/dt-bindings/clock/meson8b-clkc.h
> @@ -22,6 +22,7 @@
>  #define CLKID_MPEG_SEL		14
>  #define CLKID_MPEG_DIV		15
>  #define CLKID_SAR_ADC		23
> +#define CLKID_SDIO		30
>  #define CLKID_SANA		69
>  
>  #endif /* __MESON8B_CLKC_H */
> 


Acked-by: Neil Armstrong <narmstrong@baylibre.com>
