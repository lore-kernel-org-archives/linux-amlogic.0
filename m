From: khilman@baylibre.com (Kevin Hilman)
Date: Mon, 27 Feb 2017 19:09:08 -0800
Subject: [PATCH v2] mmc: meson-gx: remove mmc host on device removal
In-Reply-To: <20170218170647.5860-2-webczat@webczatnet.pl> (=?utf-8?Q?=22M?=
 =?utf-8?Q?icha=C5=82?= Zegan"'s
 message of "Sat, 18 Feb 2017 18:06:47 +0100")
References: <20170218170647.5860-1-webczat@webczatnet.pl>
 <20170218170647.5860-2-webczat@webczatnet.pl>
Message-ID: <m2h93f106j.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Micha? Zegan <webczat@webczatnet.pl> writes:

> The mmc host was added in meson_mmc_probe, but never removed in
> meson_mmc_remove.
> Fix that by removing the host before deallocating other resources.
>
> Signed-off-by: Micha? Zegan <webczat@webczatnet.pl>
> Tested-by: Micha? Zegan <webczat@webczatnet.pl>

Acked-by: Kevin Hilman <khilman@baylibre.com>

> ---
> changes since v1:
> rebased on top of patchset at
> https://patchwork.kernel.org/patch/9581057/
> This is in turn based on patchset at
> https://patchwork.kernel.org/patch/9561215/
>
>  drivers/mmc/host/meson-gx-mmc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index e759e4c2e4a0..336b6a2e94c6 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -791,6 +791,8 @@ static int meson_mmc_remove(struct platform_device *pdev)
>  {
>  	struct meson_host *host = dev_get_drvdata(&pdev->dev);
>  
> +	mmc_remove_host(host->mmc);
> +
>  	/* disable interrupts */
>  	writel(0, host->regs + SD_EMMC_IRQ_EN);
