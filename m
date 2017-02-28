From: khilman@baylibre.com (Kevin Hilman)
Date: Mon, 27 Feb 2017 19:07:41 -0800
Subject: [PATCH v3 10/10] mmc: meson-gx: replace magic timeout numbers
 with constants
In-Reply-To: <8dadc1fd-2612-48d4-f265-95501c83a124@gmail.com> (Heiner
 Kallweit's message of "Sat, 18 Feb 2017 14:26:04 +0100")
References: <583f6496-68a9-b8e1-6b25-1f073f819a3c@gmail.com>
 <8dadc1fd-2612-48d4-f265-95501c83a124@gmail.com>
Message-ID: <m2poi3108y.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Heiner Kallweit <hkallweit1@gmail.com> writes:

> Replace timeout magic numbers with proper constants.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>

> ---
> v3:
> - added to patch series
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 5281014e..f244fcf9 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -116,6 +116,8 @@
>  
>  #define SD_EMMC_CFG_BLK_SIZE 512 /* internal buffer max: 512 bytes */
>  #define SD_EMMC_CFG_RESP_TIMEOUT 256 /* in clock cycles */
> +#define SD_EMMC_CMD_TIMEOUT 1024 /* in ms */
> +#define SD_EMMC_CMD_TIMEOUT_DATA 4096 /* in ms */
>  #define SD_EMMC_CFG_CMD_GAP 16 /* in clock cycles */
>  #define MUX_CLK_NUM_PARENTS 2
>  
> @@ -498,10 +500,10 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
>  
>  		desc->cmd_data = host->bounce_dma_addr & CMD_DATA_MASK;
>  
> -		cmd_cfg_timeout = 12;
> +		cmd_cfg_timeout = ilog2(SD_EMMC_CMD_TIMEOUT_DATA);
>  	} else {
>  		desc->cmd_cfg &= ~CMD_CFG_DATA_IO;
> -		cmd_cfg_timeout = 10;
> +		cmd_cfg_timeout = ilog2(SD_EMMC_CMD_TIMEOUT);
>  	}
>  	desc->cmd_cfg |= (cmd_cfg_timeout & CMD_CFG_TIMEOUT_MASK) <<
>  		CMD_CFG_TIMEOUT_SHIFT;
