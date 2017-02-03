From: ulf.hansson@linaro.org (Ulf Hansson)
Date: Fri, 3 Feb 2017 09:29:15 +0100
Subject: [PATCH v2 1/9] mmc: meson-gx: fix setting f_min
In-Reply-To: <e8f1b59a-927b-b50e-4137-0b4b9e3cbc6e@gmail.com>
References: <e8f1b59a-927b-b50e-4137-0b4b9e3cbc6e@gmail.com>
Message-ID: <CAPDyKFq9mScEuqcmP0E3Lz0APhYbHYtyUvc6WXkGGXR1OZavgg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 1 February 2017 at 07:48, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> Currently f_min is set to 4 MHz whilst the comment states 400 MHz.
> I think the itention is to set f_min to 400 kHz.
> Change value and comment accordingly.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Acked-by: Kevin Hilman <khilman@baylibre.com>
> ---
> v2:
> - added acked-by
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 5eca88bc..da3cce31 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -268,7 +268,7 @@ static int meson_mmc_clk_init(struct meson_host *host)
>         if (f_min != UINT_MAX)
>                 f_min = DIV_ROUND_UP(CLK_SRC_XTAL_RATE, CLK_DIV_MAX);
>         else
> -               f_min = 4000000;  /* default min: 400 MHz */
> +               f_min = 400000;  /* default min: 400 kHz */
>         host->mmc->f_min = f_min;

This hole thing looks really weird to me. Although instead of
discussing it here, I decided to post a patch to show how I think this
should be done. Could you please have look!?
https://patchwork.kernel.org/patch/9553599/

Kind regards
Uffe
