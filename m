From: khilman@baylibre.com (Kevin Hilman)
Date: Wed, 15 Feb 2017 11:27:51 -0800
Subject: [PATCH 13/18] mmc: meson-gx: remove unneeded meson_mmc_clk_set in
 meson_mmc_clk_init
In-Reply-To: <f891a0bd-62f3-8104-5658-5e8fb2d9e070@gmail.com> (Heiner
 Kallweit's message of "Tue, 14 Feb 2017 21:06:57 +0100")
References: <420b75a9-b8c2-b3d7-ae60-3ed8a5a18ead@gmail.com>
 <f891a0bd-62f3-8104-5658-5e8fb2d9e070@gmail.com>
Message-ID: <m2bmu38dag.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Heiner Kallweit <hkallweit1@gmail.com> writes:

> I don't think this clk_disable_unprepare is right here. We do this
> in meson_mmc_remove what should be sufficient.

I don't think so, because if _clk_init() fails, then _probe will fail,
and the driver's ->remove() will not be called.

Kevin

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 74ceda75..39904fb5 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -315,11 +315,7 @@ static int meson_mmc_clk_init(struct meson_host *host)
>  	/* Get the nearest minimum clock to 400KHz */
>  	host->mmc->f_min = clk_round_rate(host->cfg_div_clk, 400000);
>  
> -	ret = meson_mmc_clk_set(host, host->mmc->f_min);
> -	if (!ret)
> -		clk_disable_unprepare(host->cfg_div_clk);
> -
> -	return ret;
> +	return meson_mmc_clk_set(host, host->mmc->f_min);
>  }
>  
>  static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
