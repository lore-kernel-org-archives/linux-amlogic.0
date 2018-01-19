From: yixun.lan@amlogic.com (Yixun Lan)
Date: Fri, 19 Jan 2018 10:06:50 +0800
Subject: [PATCH 3/9] clk: meson: remove unnecessary rounding in the pll
 clock
In-Reply-To: <20180118184532.6856-4-jbrunet@baylibre.com>
References: <20180118184532.6856-1-jbrunet@baylibre.com>
 <20180118184532.6856-4-jbrunet@baylibre.com>
Message-ID: <31b18269-22f3-e536-9eb2-449a7e1fb863@amlogic.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org


On 01/19/18 02:45, Jerome Brunet wrote:
> The pll driver perform the rate calculation in Mhz, which adds an
> unnecessary rounding down to the Mhz of the rate. Use 64bits long
> integer to perform this calculation safely on meson8b and perform the
> calculation in Hz instead
> 
> Fixes: 7a29a869434e ("clk: meson: Add support for Meson clock controller")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/clk-pll.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 2614341fc4ad..fa4cec13d6e8 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -51,8 +51,7 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
>  {
>  	struct meson_clk_pll *pll = to_meson_clk_pll(hw);
>  	struct parm *p;
> -	unsigned long parent_rate_mhz = parent_rate / 1000000;
> -	unsigned long rate_mhz;
> +	u64 rate;
>  	u16 n, m, frac = 0, od, od2 = 0;
>  	u32 reg;
>  
> @@ -74,17 +73,18 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
>  		od2 = PARM_GET(p->width, p->shift, reg);
>  	}
>  
> +	rate = (u64)m * parent_rate;
> +
>  	p = &pll->frac;
>  	if (p->width) {
>  		reg = readl(pll->base + p->reg_off);
>  		frac = PARM_GET(p->width, p->shift, reg);
> -		rate_mhz = (parent_rate_mhz * m + \
> -				(parent_rate_mhz * frac >> 12)) * 2 / n;
> -		rate_mhz = rate_mhz >> od >> od2;
> -	} else
> -		rate_mhz = (parent_rate_mhz * m / n) >> od >> od2;
>  
> -	return rate_mhz * 1000000;
> +		rate += (u64)parent_rate * frac >> 12;
> +		rate *= 2;
> +	}
> +
> +	return (rate / n) >> od >> od2;
>  }
>  
>  static long meson_clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> 

Hi Jerome:
 This is exactly what I want to propose, thanks for pushing this!

 With the whole series, the fixed_pll is more accurate, and the ethernet
driver on axg is capable of choosing fclk_div2..

Yixun
