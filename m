From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 8 Nov 2018 14:26:59 +0100
Subject: [PATCH] clk: meson: axg: mark fdiv2 and fdiv3 as critical
In-Reply-To: <20181108093123.21498-1-jbrunet@baylibre.com>
References: <20181108093123.21498-1-jbrunet@baylibre.com>
Message-ID: <59cda050-988f-20b9-b211-e6a426139665@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 08/11/2018 10:31, Jerome Brunet wrote:
> Similar to gxbb and gxl platforms, axg SCPI Cortex-M co-processor
> uses the fdiv2 and fdiv3 to, among other things, provide the cpu
> clock.
> 
> Until clock hand-off mechanism makes its way to CCF and the generic
> SCPI claims platform specific clocks, these clocks must be marked as
> critical to make sure they are never disabled when needed by the
> co-processor.
> 
> Fixes: 05f814402d61 ("clk: meson: add fdiv clock gates")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> 
> Hi Stephen,
> 
> If you can put this one in clk-fixes as well, it would be awesome.
> It is basically the same thing as the change you took this Tuesday.
> 
> Since then, we had reports the same problem with SCPI was happening
> on the axg, calling for the same fixup.
> 
> Cheers
> Jerome
> 
>  drivers/clk/meson/axg.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
> index c981159b02c0..792735d7e46e 100644
> --- a/drivers/clk/meson/axg.c
> +++ b/drivers/clk/meson/axg.c
> @@ -325,6 +325,7 @@ static struct clk_regmap axg_fclk_div2 = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_names = (const char *[]){ "fclk_div2_div" },
>  		.num_parents = 1,
> +		.flags = CLK_IS_CRITICAL,
>  	},
>  };
>  
> @@ -349,6 +350,18 @@ static struct clk_regmap axg_fclk_div3 = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_names = (const char *[]){ "fclk_div3_div" },
>  		.num_parents = 1,
> +		/*
> +		 * FIXME:
> +		 * This clock, as fdiv2, is used by the SCPI FW and is required
> +		 * by the platform to operate correctly.
> +		 * Until the following condition are met, we need this clock to
> +		 * be marked as critical:
> +		 * a) The SCPI generic driver claims and enable all the clocks
> +		 *    it needs
> +		 * b) CCF has a clock hand-off mechanism to make the sure the
> +		 *    clock stays on until the proper driver comes along
> +		 */
> +		.flags = CLK_IS_CRITICAL,
>  	},
>  };
>  
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
