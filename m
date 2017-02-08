From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 8 Feb 2017 11:17:54 +0100
Subject: [PATCH v3 9/9] mmc: meson-gx: add support for HS400 mode
In-Reply-To: <282ded48-616d-b0c3-b1e1-34f0987a9255@gmail.com>
References: <0991d40b-e05b-2fcb-9ee4-7b529448de69@gmail.com>
 <282ded48-616d-b0c3-b1e1-34f0987a9255@gmail.com>
Message-ID: <b424cb1a-46b9-a62a-1e78-da3afc561bb7@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 02/07/2017 10:35 PM, Heiner Kallweit wrote:
> Add support for HS400 mode.
> 
> The driver still misses support for tuning, therefore
> highspeed modes like HS400 might not work under all
> circumstances yet.
> 
> Successfully tested on a Odroid C2 (S905 GXBB).
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> ---
> v3:
> - extended commit message
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 3cc6334a..5a959783 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -83,6 +83,7 @@
>  #define   CFG_RC_CC_MASK 0xf
>  #define   CFG_STOP_CLOCK BIT(22)
>  #define   CFG_CLK_ALWAYS_ON BIT(18)
> +#define   CFG_CHK_DS BIT(20)
>  #define   CFG_AUTO_CLK BIT(23)
[...]
> +	val &= ~CFG_DDR;
[...]
> +	val &= ~CFG_CHK_DS;

I think these two values masking explains why it solves the issue we can have on some boards,
if u-boot does not remove these bits the HW will still behave in a bad mode.

It would be better to have a clean HS400/DDR mode later on and keep this to fix the eMMC init for now.

Neil
