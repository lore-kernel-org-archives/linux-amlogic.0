From: ulf.hansson@linaro.org (Ulf Hansson)
Date: Tue, 14 Mar 2017 17:21:46 +0100
Subject: [PATCH] mmc: meson-gx: fix error path when driver initialization
 fails before enabling clocks
In-Reply-To: <20170218170647.5860-1-webczat@webczatnet.pl>
References: <20170218170647.5860-1-webczat@webczatnet.pl>
Message-ID: <CAPDyKFrfSc-8BdNx4edFhiyKXoDQYQJ4bReGZq08=OX_CirG8w@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 18 February 2017 at 18:06, Micha? Zegan <webczat@webczatnet.pl> wrote:
> This patch fixes the case where meson_mmc_probe function fails before
> core_clk is enabled.
> Originally, that would result in a try to disable the core clock, and if
> it was not already enabled, it would result in a kernel warning.
> This issue is similar to the one with div_clk.
> Fix it by introducing another error path used only between successfully
> enabling the core clock, and successfully enabling the div clock.
> That would ensure that core clock is disabled only if it was enabled before.
>
> Signed-off-by: Micha? Zegan <webczat@webczatnet.pl>

This one didn't apply on my next branch after applying Heiner's
series. Can please re-base and send a new version.

Kind regards
Uffe

> ---
> applies on top of Heiner's patchset v3
> https://patchwork.kernel.org/patch/9581057/
> That in turn applies on top of https://patchwork.kernel.org/patch/9561215/
>
>  drivers/mmc/host/meson-gx-mmc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 336b6a2e94c6..7917a3fe51ad 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -752,7 +752,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
>
>         ret = meson_mmc_clk_init(host);
>         if (ret)
> -               goto free_host;
> +               goto err_core_clk;
>
>         ret = devm_request_threaded_irq(&pdev->dev, irq, meson_mmc_irq,
>                                         meson_mmc_irq_thread, IRQF_SHARED,
> @@ -781,8 +781,9 @@ static int meson_mmc_probe(struct platform_device *pdev)
>
>  err_div_clk:
>         clk_disable_unprepare(host->cfg_div_clk);
> -free_host:
> +err_core_clk:
>         clk_disable_unprepare(host->core_clk);
> +free_host:
>         mmc_free_host(mmc);
>         return ret;
>  }
> --
> 2.11.0
>
