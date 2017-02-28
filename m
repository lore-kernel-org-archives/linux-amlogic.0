From: khilman@baylibre.com (Kevin Hilman)
Date: Tue, 28 Feb 2017 10:04:05 -0800
Subject: [PATCH] clk: meson: fix SET_PARM macro
In-Reply-To: <20170228093016.5624-1-jbrunet@baylibre.com> (Jerome Brunet's
 message of "Tue, 28 Feb 2017 10:30:16 +0100")
References: <20170228093016.5624-1-jbrunet@baylibre.com>
Message-ID: <m24lze19be.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> parameter val is not enclosed in parenthesis which is buggy when given an
> expression instead of a simple value
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/clk/meson/clkc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
> index 9bb70e7a7d6a..c6be77dd8694 100644
> --- a/drivers/clk/meson/clkc.h
> +++ b/drivers/clk/meson/clkc.h
> @@ -25,7 +25,7 @@
>  #define PARM_GET(width, shift, reg)					\
>  	(((reg) & SETPMASK(width, shift)) >> (shift))
>  #define PARM_SET(width, shift, reg, val)				\
> -	(((reg) & CLRPMASK(width, shift)) | (val << (shift)))
> +	(((reg) & CLRPMASK(width, shift)) | ((val) << (shift)))
>  
>  #define MESON_PARM_APPLICABLE(p)		(!!((p)->width))
