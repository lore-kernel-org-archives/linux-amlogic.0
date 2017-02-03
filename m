From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 03 Feb 2017 10:18:41 -0800
Subject: [PATCH v2 7/9] mmc: meson-gx: reduce bounce buffer size
In-Reply-To: <90d34a64-bd3e-dcf2-4c36-5ef4e2ac8666@gmail.com> (Heiner
 Kallweit's message of "Wed, 1 Feb 2017 07:49:18 +0100")
References: <584e5061-d359-1436-05ee-3767a5a4b10f@gmail.com>
 <90d34a64-bd3e-dcf2-4c36-5ef4e2ac8666@gmail.com>
Message-ID: <7hvasruohq.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Heiner Kallweit <hkallweit1@gmail.com> writes:

> A bounce buffer of 512K isn't needed as the max request size is
> 511 * 512 byte.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

> ---
> v2:
> - no changes
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 883263c5..48ce4ba4 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -785,7 +785,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
>  	mmc->max_req_size = mmc->max_blk_count * mmc->max_blk_size;
>  
>  	/* data bounce buffer */
> -	host->bounce_buf_size = SZ_512K;
> +	host->bounce_buf_size = mmc->max_req_size;
>  	host->bounce_buf =
>  		dma_alloc_coherent(host->dev, host->bounce_buf_size,
>  				   &host->bounce_dma_addr, GFP_KERNEL);
