From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Mon, 18 Sep 2017 21:11:57 +0200
Subject: [PATCH/RFT] mmc: meson-gx: include tx phase in the tuning process
In-Reply-To: <20170918134431.17520-1-jbrunet@baylibre.com>
References: <b31253d8-38a3-dd25-1d74-6afde6ae8362@gmail.com>
 <20170918134431.17520-1-jbrunet@baylibre.com>
Message-ID: <3fd34a04-9a22-83e7-fb48-833b72bbea9f@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 18.09.2017 um 15:44 schrieb Jerome Brunet:
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index c885c2d4b904..0254d8bfd536 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -717,6 +717,22 @@ static int meson_mmc_clk_phase_tuning(struct mmc_host *mmc, u32 opcode,
>  static int meson_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
>  {
>  	struct meson_host *host = mmc_priv(mmc);
> +	int ret;
> +
> +	/*
> +	 * If this is the initial tuning, try to get a sane Rx starting
> +	 * phase before doing the actual tuning.
> +	 */
> +	if (!mmc->doing_retune) {
> +		ret = meson_mmc_clk_phase_tuning(mmc, opcode, host->rx_clk);
> +
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = meson_mmc_clk_phase_tuning(mmc, opcode, host->tx_clk);
> +	if (ret)
> +		return ret;
>  
>  	return meson_mmc_clk_phase_tuning(mmc, opcode, host->rx_clk);
>  }
> -- 2.13.5
Unfortunately this still doesn't fix the issue here.
Tuning rx and tx clk sequentially assumes both are independent, what they
IMHO are not. So meybe we have to check all combinations of rx/tx clk phase.
