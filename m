From: webczat_200@poczta.onet.pl (=?UTF-8?Q?Micha=c5=82_Zegan?=)
Date: Sat, 18 Feb 2017 04:44:31 +0100
Subject: [PATCH v2 6/9] mmc: meson-gx: remove unneeded meson_mmc_clk_set
 in meson_mmc_clk_init
In-Reply-To: <fc824f91-f686-64ab-83e4-86b04fd512f0@gmail.com>
References: <7d5263e2-9325-dedb-a5f6-954c4a09e977@gmail.com>
 <fc824f91-f686-64ab-83e4-86b04fd512f0@gmail.com>
Message-ID: <ef2944b5-e04c-780b-6256-31af7ceb87dc@poczta.onet.pl>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hello Heiner,

W dniu 16.02.2017 o 20:42, Heiner Kallweit pisze:
> This clk_disable_unprepare isn't right here. At first the condition
> should be "if (ret)" as the disable/unprepare is supposed to be
> executed if the previous command fails.
> And if the previous command fails and meson_mmc_clk_init returns
> an error, then probe jumps to label free_host where we have this
> disable/unprepare already.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - extended commit message
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 68e76fa8..850b0152 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -320,11 +320,7 @@ static int meson_mmc_clk_init(struct meson_host *host)
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
> 

I see one problem here.
As you said, if the previous command (that is the meson_mmc_clk_set
function call) fails, then the whole meson_mmc_clk_init returns an error
value, and meson_mmc_probe jumps to free_host and disables the clock there.
But what happens if the clk_prepare_enable is the line that fails? in
this case, the function returns an error value too, and in the free_host
meson_mmc_probe tries to disable the clock that is not enabled, and that
probably results in a kernel warning because you tried to disable a
disabled clock.
I was preparing a patch to disable clocks in the probe function only if
they were enabled before, but then the meson_mmc_clk_init function
remains a problem, because we don't know if the clock was enabled
successfully or not when it returns an error.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 525 bytes
Desc: OpenPGP digital signature
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20170218/eb637f3f/attachment.sig>
