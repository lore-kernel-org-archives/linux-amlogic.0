From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sat, 4 Mar 2017 10:56:34 +0100
Subject: [PATCH v4 0/10] mmc: meson-gx: series with smaller improvements
In-Reply-To: <c1a6c969-2426-4069-6836-fcbe4f4bdebd@gmail.com>
References: <c1a6c969-2426-4069-6836-fcbe4f4bdebd@gmail.com>
Message-ID: <22be7ab8-2e98-160b-cb5d-8ff9a247e266@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 04.03.2017 um 10:30 schrieb Helmut Klein:
> Hallo Heiner,
> 
> i had the same problem as mentioned from Kevin.
> 
> The solution for my box (netxeon MiniMX) was to partly revert your patch 8
> 
> --- meson-gx-mmc.c.heiner    2017-02-20 13:25:47.000000000 +0100
> +++ meson-gx-mmc.c.helmut    2017-02-21 11:30:30.360445366 +0100
> @@ -741,6 +742,10 @@ static int meson_mmc_probe(struct platfo
>      if (ret)
>          goto free_host;
> 
> +    ret = meson_mmc_clk_init(host);
> +    if (ret)
> +        goto err_core_clk;
> +
>      /* Stop execution */
>      writel(0, host->regs + SD_EMMC_START);
> 
> @@ -751,11 +756,7 @@ static int meson_mmc_probe(struct platfo
> 
>      /* set config to sane default */
>      meson_mmc_cfg_init(host);
> -
> -    ret = meson_mmc_clk_init(host);
> -    if (ret)
> -        goto free_host;
> -
> +
>      ret = devm_request_threaded_irq(&pdev->dev, irq, meson_mmc_irq,
>                      meson_mmc_irq_thread, IRQF_SHARED,
>                      DRIVER_NAME, host);
> 
> The rest of your patches are ok. Thank you for them.
> 
> Before applying the patches, i couldn't read the mmc (hs200 type) at all (got crc errors only). Now this is fixed.
> 
> regards
> Helmut
> 
> ps: i hope, it is ok, to send this mail directly to you??
> 
Sure. I just think other people would consider your findings interesting too, so I cc Kevin and the lists.
Let me check on my system, I'll come up with a corrected version of the patch set.

Rgds, Heiner
