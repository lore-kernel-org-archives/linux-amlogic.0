From: khilman@baylibre.com (Kevin Hilman)
Date: Wed, 15 Feb 2017 11:30:14 -0800
Subject: [PATCH 14/18] mmc: meson-gx: remove unneeded devm_kstrdup in
 meson_mmc_clk_init
In-Reply-To: <04781c15-b543-337c-d6d4-8378bd558cf7@gmail.com> (Heiner
 Kallweit's message of "Tue, 14 Feb 2017 21:07:01 +0100")
References: <420b75a9-b8c2-b3d7-ae60-3ed8a5a18ead@gmail.com>
 <04781c15-b543-337c-d6d4-8378bd558cf7@gmail.com>
Message-ID: <m27f4r8d6h.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Heiner Kallweit <hkallweit1@gmail.com> writes:

> MMC core does a deep copy of init.name, therefore it's fully ok to

I assume you mean the clock framework, not the MMC core, right?

> provide a local variable.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

With the changelog fixed,

Acked-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/mmc/host/meson-gx-mmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 39904fb5..806554b1 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -276,7 +276,7 @@ static int meson_mmc_clk_init(struct meson_host *host)
>  
>  	/* create the divider */
>  	snprintf(clk_name, sizeof(clk_name), "%s#div", dev_name(host->dev));
> -	init.name = devm_kstrdup(host->dev, clk_name, GFP_KERNEL);
> +	init.name = clk_name;
>  	init.ops = &clk_divider_ops;
>  	init.flags = CLK_SET_RATE_PARENT;
>  	clk_div_parents[0] = __clk_get_name(host->mux_clk);
