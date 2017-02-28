From: khilman@baylibre.com (Kevin Hilman)
Date: Mon, 27 Feb 2017 19:06:59 -0800
Subject: [PATCH v3 6/10] mmc: meson-gx: fix error path in
 meson_mmc_clk_init / meson_mmc_probe
In-Reply-To: <8419d592-1338-d7eb-3a75-342b64897922@gmail.com> (Heiner
 Kallweit's message of "Sat, 18 Feb 2017 14:19:32 +0100")
References: <583f6496-68a9-b8e1-6b25-1f073f819a3c@gmail.com>
 <8419d592-1338-d7eb-3a75-342b64897922@gmail.com>
Message-ID: <m2tw7f10a4.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Heiner Kallweit <hkallweit1@gmail.com> writes:

> The condition should be "if (ret)" as the disable/unprepare is
> supposed to be executed if the previous command fails.
> In addition adjust the error path in probe to properly deal
> with the case that cfg_div_clk can be registered successfully
> but enable/prepare fails.
> In this case we shouldn't call clk_disable_unprepare.
>
> Reported-by: Micha? Zegan <webczat_200@poczta.onet.pl>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>

> ---
> v2:
> - extended commit message
> v3:
> - adjust error path in probe
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 68e76fa8..002e4aac 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -321,7 +321,7 @@ static int meson_mmc_clk_init(struct meson_host *host)
>  	host->mmc->f_min = clk_round_rate(host->cfg_div_clk, 400000);
>  
>  	ret = meson_mmc_clk_set(host, host->mmc->f_min);
> -	if (!ret)
> +	if (ret)
>  		clk_disable_unprepare(host->cfg_div_clk);
>  
>  	return ret;
> @@ -771,7 +771,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
>  					meson_mmc_irq_thread, IRQF_SHARED,
>  					DRIVER_NAME, host);
>  	if (ret)
> -		goto free_host;
> +		goto err_div_clk;
>  
>  	mmc->max_blk_count = CMD_CFG_LENGTH_MASK;
>  	mmc->max_req_size = mmc->max_blk_count * mmc->max_blk_size;
> @@ -784,7 +784,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
>  	if (host->bounce_buf == NULL) {
>  		dev_err(host->dev, "Unable to map allocate DMA bounce buffer.\n");
>  		ret = -ENOMEM;
> -		goto free_host;
> +		goto err_div_clk;
>  	}
>  
>  	mmc->ops = &meson_mmc_ops;
> @@ -792,8 +792,9 @@ static int meson_mmc_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> -free_host:
> +err_div_clk:
>  	clk_disable_unprepare(host->cfg_div_clk);
> +free_host:
>  	clk_disable_unprepare(host->core_clk);
>  	mmc_free_host(mmc);
>  	return ret;
