From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 21 Dec 2017 14:33:44 +0100
Subject: [PATCH 1/2] soc: amlogic: meson-gx-pwrc-vpu: don't print error
 message on probe deferral
In-Reply-To: <943d2b32-86ad-d1d5-b798-12c3ae54a0fe@gmail.com>
References: <943d2b32-86ad-d1d5-b798-12c3ae54a0fe@gmail.com>
Message-ID: <c696fc50-5f8e-79d7-eccb-b0bdad453a1e@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 20/12/2017 20:07, Heiner Kallweit wrote:
> The error message may be misleading in case of probe deferral
> (happens on my Odroid-C2). Therefore don't print it in this case.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> index 2bdeebc48..3adb2f2ec 100644
> --- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> +++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> @@ -184,7 +184,8 @@ static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
>  
>  	rstc = devm_reset_control_array_get(&pdev->dev, false, false);
>  	if (IS_ERR(rstc)) {
> -		dev_err(&pdev->dev, "failed to get reset lines\n");
> +		if (PTR_ERR(rstc) != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "failed to get reset lines\n");
>  		return PTR_ERR(rstc);
>  	}
>  
> 

Hi Heiner,

Please send a proper serie with a cover letter and the correct Fixes: tag.

Neil
