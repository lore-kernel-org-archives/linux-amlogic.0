From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 24 Mar 2017 15:52:38 -0700
Subject: [PATCH 1/4] mmc: meson-gx: use bitfield macros
In-Reply-To: <0dd17076-d3a8-a14b-74b8-3893f843c2cb@gmail.com> (Heiner
 Kallweit's message of "Fri, 24 Mar 2017 23:05:11 +0100")
References: <f6960395-370e-16b0-1a2a-2a1fce720d45@gmail.com>
 <0dd17076-d3a8-a14b-74b8-3893f843c2cb@gmail.com>
Message-ID: <m2a88afft5.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Heiner Kallweit <hkallweit1@gmail.com> writes:

> Use GENMASK consistently for all bit masks and switch to using the
> bitfield macros GET_FIELD and PREP_FIELD. This hides parts of the
> complexity of dealing with bit fields.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Very nice.  I should've used these from the beginning.

Some comments below...

> ---
>  drivers/mmc/host/meson-gx-mmc.c | 84 +++++++++++++++++++----------------------
>  1 file changed, 38 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index b917765c..cf2ccc67 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -36,23 +36,25 @@
>  #include <linux/clk-provider.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/interrupt.h>
> +#include <linux/bitfield.h>
>  
>  #define DRIVER_NAME "meson-gx-mmc"
>  
>  #define SD_EMMC_CLOCK 0x0
>  #define   CLK_DIV_SHIFT 0
>  #define   CLK_DIV_WIDTH 6
> -#define   CLK_DIV_MASK 0x3f
> +#define   CLK_DIV_MASK GENMASK(5, 0)
>  #define   CLK_DIV_MAX 63
>  #define   CLK_SRC_SHIFT 6
>  #define   CLK_SRC_WIDTH 2

Shouldn't you get rid of the shift/width here too?

> -#define   CLK_SRC_MASK 0x3
> +#define   CLK_SRC_MASK GENMASK(7, 6)
>  #define   CLK_SRC_XTAL 0   /* external crystal */
>  #define   CLK_SRC_XTAL_RATE 24000000
>  #define   CLK_SRC_PLL 1    /* FCLK_DIV2 */
>  #define   CLK_SRC_PLL_RATE 1000000000
> -#define   CLK_PHASE_SHIFT 8
> -#define   CLK_PHASE_MASK 0x3
> +#define   CLK_CORE_PHASE_MASK GENMASK(9, 8)
> +#define   CLK_TX_PHASE_MASK GENMASK(11, 10)
> +#define   CLK_RX_PHASE_MASK GENMASK(13, 12)

The latter 2 aren't used anywhere yet.  I prefer to keep this #defines
to only fields that are actually used.

>  #define   CLK_PHASE_0 0
>  #define   CLK_PHASE_90 1
>  #define   CLK_PHASE_180 2

Otherwise, looks good to me.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Kevin
