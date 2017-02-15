From: khilman@baylibre.com (Kevin Hilman)
Date: Wed, 15 Feb 2017 09:14:27 -0800
Subject: [PATCH 06/18] mmc: meson-gx: simplify bounce buffer setting in
 meson_mmc_start_cmd
In-Reply-To: <10457b8c-401b-d473-0a24-30dfacb4eb48@gmail.com> (Heiner
 Kallweit's message of "Tue, 14 Feb 2017 21:06:26 +0100")
References: <420b75a9-b8c2-b3d7-ae60-3ed8a5a18ead@gmail.com>
 <10457b8c-401b-d473-0a24-30dfacb4eb48@gmail.com>
Message-ID: <m21suzbclo.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Heiner Kallweit <hkallweit1@gmail.com> writes:

> If xfer_bytes is zero we can configure the chip to use the bounce
> buffer as well because it won't get used anyway.
> And we don't have to reset bit CMD_CFG_DATA_NUM because cmd_cfg
> was zero-initialized and this bit isn't set.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index c7bf0e12..423b4b17 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -505,15 +505,7 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
>  			cmd_cfg &= ~CMD_CFG_DATA_WR;
>  		}
>  
> -		if (xfer_bytes > 0) {
> -			cmd_cfg &= ~CMD_CFG_DATA_NUM;
> -			cmd_data = host->bounce_dma_addr & CMD_DATA_MASK;
> -		} else {
> -			/* write data to data_addr */
> -			cmd_cfg |= CMD_CFG_DATA_NUM;
> -			cmd_data = 0;
> -		}
> -
> +		cmd_data = host->bounce_dma_addr & CMD_DATA_MASK;

Could use a comment above this, mentioning (similar to the changelog)
that when CMD_CFG_DATA_NUM is set, this isn't used.

Otherwise:

Acked-by: Kevin Hilman <khilman@baylibre.com>
