From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 21 Nov 2018 10:43:12 +0100
Subject: [PATCH v2 1/3] ARM: meson: Add regmap support for clock driver
In-Reply-To: <20181120235020.14812-2-ldevulder@suse.de>
References: <20181120235020.14812-1-ldevulder@suse.de>
 <20181120235020.14812-2-ldevulder@suse.de>
Message-ID: <d3499bb1-9b04-93e2-f389-35e381bdb2e2@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Loic,

On 21/11/2018 00:50, Loic Devulder wrote:
> This patch modifies the meson clock driver to use syscon/regmap like
> the Linux kernel does, as it is needed if we want to share the same
> DTS files.
> 
> Signed-off-by: Loic Devulder <ldevulder@suse.de>
> ---
>  drivers/clk/clk_meson.c | 59 +++++++++++++++++++++++++------------------------
>  1 file changed, 30 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/clk/clk_meson.c b/drivers/clk/clk_meson.c
> index 978f646284..f477a4c510 100644
> --- a/drivers/clk/clk_meson.c
> +++ b/drivers/clk/clk_meson.c
> @@ -11,6 +11,8 @@
>  #include <clk-uclass.h>
>  #include <div64.h>
>  #include <dm.h>
> +#include <regmap.h>
> +#include <syscon.h>
>  #include <dt-bindings/clock/gxbb-clkc.h>
>  #include "clk_meson.h"
>  
> @@ -65,7 +67,7 @@
>  #define XTAL_RATE 24000000
>  
>  struct meson_clk {
> -	void __iomem *addr;
> +	struct regmap *map;
>  };
>  
>  static ulong meson_div_get_rate(struct clk *clk, unsigned long id);
> @@ -217,8 +219,8 @@ static int meson_set_gate_by_id(struct clk *clk, unsigned long id, bool on)
>  
>  	debug("%s: really %sabling %ld\n", __func__, on ? "en" : "dis", id);
>  
> -	clrsetbits_le32(priv->addr + gate->reg,
> -			BIT(gate->bit), on ? BIT(gate->bit) : 0);
> +	regmap_update_bits(priv->map, gate->reg,
> +			   BIT(gate->bit), on ? BIT(gate->bit) : 0);
>  
>  	/* Propagate to next gate(s) */
>  	switch (id) {
> @@ -269,7 +271,7 @@ static ulong meson_div_get_rate(struct clk *clk, unsigned long id)
>  	unsigned int rate, parent_rate;
>  	struct parm *parm;
>  	int parent;
> -	u32 reg;
> +	uint reg;
>  
>  	switch (id) {
>  	case CLKID_VPU_0_DIV:
> @@ -292,7 +294,7 @@ static ulong meson_div_get_rate(struct clk *clk, unsigned long id)
>  		return -ENOENT;
>  	}
>  
> -	reg = readl(priv->addr + parm->reg_off);
> +	regmap_read(priv->map, parm->reg_off, &reg);
>  	reg = PARM_GET(parm->width, parm->shift, reg);
>  
>  	debug("%s: div of %ld is %d\n", __func__, id, reg + 1);
> @@ -318,7 +320,6 @@ static ulong meson_div_set_rate(struct clk *clk, unsigned long id, ulong rate,
>  	unsigned long parent_rate;
>  	struct parm *parm;
>  	int parent;
> -	u32 reg;
>  	int ret;
>  
>  	if (current_rate == rate)
> @@ -383,9 +384,8 @@ static ulong meson_div_set_rate(struct clk *clk, unsigned long id, ulong rate,
>  
>  	debug("%s: setting div of %ld to %d\n", __func__, id, new_div);
>  
> -	reg = readl(priv->addr + parm->reg_off);
> -	writel(PARM_SET(parm->width, parm->shift, reg, new_div - 1),
> -	       priv->addr + parm->reg_off);
> +	regmap_update_bits(priv->map, parm->reg_off, SETPMASK(parm->width, parm->shift),
> +			   (new_div - 1) << parm->shift);
>  
>  	debug("%s: new rate of %ld is %ld\n",
>  	      __func__, id, meson_div_get_rate(clk, id));
> @@ -446,7 +446,7 @@ static ulong meson_mux_get_parent(struct clk *clk, unsigned long id)
>  	struct meson_clk *priv = dev_get_priv(clk->dev);
>  	struct parm *parm;
>  	int *parents;
> -	u32 reg;
> +	uint reg;
>  
>  	switch (id) {
>  	case CLKID_VPU:
> @@ -477,7 +477,7 @@ static ulong meson_mux_get_parent(struct clk *clk, unsigned long id)
>  		return -ENOENT;
>  	}
>  
> -	reg = readl(priv->addr + parm->reg_off);
> +	regmap_read(priv->map, parm->reg_off, &reg);
>  	reg = PARM_GET(parm->width, parm->shift, reg);
>  
>  	debug("%s: parent of %ld is %d (%d)\n",
> @@ -494,7 +494,6 @@ static ulong meson_mux_set_parent(struct clk *clk, unsigned long id,
>  	unsigned int new_index = -EINVAL;
>  	struct parm *parm;
>  	int *parents;
> -	u32 reg;
>  	int i;
>  
>  	if (IS_ERR_VALUE(cur_parent))
> @@ -546,9 +545,8 @@ static ulong meson_mux_set_parent(struct clk *clk, unsigned long id,
>  
>  	debug("%s: new index of %ld is %d\n", __func__, id, new_index);
>  
> -	reg = readl(priv->addr + parm->reg_off);
> -	writel(PARM_SET(parm->width, parm->shift, reg, new_index),
> -	       priv->addr + parm->reg_off);
> +	regmap_update_bits(priv->map, parm->reg_off, SETPMASK(parm->width, parm->shift),
> +			   new_index << parm->shift);
>  
>  	debug("%s: new parent of %ld is %ld\n",
>  	      __func__, id, meson_mux_get_parent(clk, id));
> @@ -570,7 +568,7 @@ static unsigned long meson_clk81_get_rate(struct clk *clk)
>  {
>  	struct meson_clk *priv = dev_get_priv(clk->dev);
>  	unsigned long parent_rate;
> -	u32 reg;
> +	uint reg;
>  	int parents[] = {
>  		-1,
>  		-1,
> @@ -583,7 +581,7 @@ static unsigned long meson_clk81_get_rate(struct clk *clk)
>  	};
>  
>  	/* mux */
> -	reg = readl(priv->addr + HHI_MPEG_CLK_CNTL);
> +	regmap_read(priv->map, HHI_MPEG_CLK_CNTL, &reg);
>  	reg = (reg >> 12) & 7;
>  
>  	switch (reg) {
> @@ -597,7 +595,7 @@ static unsigned long meson_clk81_get_rate(struct clk *clk)
>  	}
>  
>  	/* divider */
> -	reg = readl(priv->addr + HHI_MPEG_CLK_CNTL);
> +	regmap_read(priv->map, HHI_MPEG_CLK_CNTL, &reg);
>  	reg = reg & ((1 << 7) - 1);
>  
>  	/* clk81 divider is zero based */
> @@ -640,8 +638,9 @@ static ulong meson_mpll_get_rate(struct clk *clk, unsigned long id)
>  {
>  	struct meson_clk *priv = dev_get_priv(clk->dev);
>  	struct parm *psdm, *pn2;
> -	unsigned long reg, sdm, n2;
> +	unsigned long sdm, n2;
>  	unsigned long parent_rate;
> +	uint reg;
>  
>  	switch (id) {
>  	case CLKID_MPLL0:
> @@ -664,10 +663,10 @@ static ulong meson_mpll_get_rate(struct clk *clk, unsigned long id)
>  	if (IS_ERR_VALUE(parent_rate))
>  		return parent_rate;
>  
> -	reg = readl(priv->addr + psdm->reg_off);
> +	regmap_read(priv->map, psdm->reg_off, &reg);
>  	sdm = PARM_GET(psdm->width, psdm->shift, reg);
>  
> -	reg = readl(priv->addr + pn2->reg_off);
> +	regmap_read(priv->map, pn2->reg_off, &reg);
>  	n2 = PARM_GET(pn2->width, pn2->shift, reg);
>  
>  	return mpll_rate_from_params(parent_rate, sdm, n2);
> @@ -691,7 +690,7 @@ static ulong meson_pll_get_rate(struct clk *clk, unsigned long id)
>  	struct parm *pm, *pn, *pod;
>  	unsigned long parent_rate_mhz = XTAL_RATE / 1000000;
>  	u16 n, m, od;
> -	u32 reg;
> +	uint reg;
>  
>  	switch (id) {
>  	case CLKID_FIXED_PLL:
> @@ -708,13 +707,13 @@ static ulong meson_pll_get_rate(struct clk *clk, unsigned long id)
>  		return -ENOENT;
>  	}
>  
> -	reg = readl(priv->addr + pn->reg_off);
> +	regmap_read(priv->map, pn->reg_off, &reg);
>  	n = PARM_GET(pn->width, pn->shift, reg);
>  
> -	reg = readl(priv->addr + pm->reg_off);
> +	regmap_read(priv->map, pm->reg_off, &reg);
>  	m = PARM_GET(pm->width, pm->shift, reg);
>  
> -	reg = readl(priv->addr + pod->reg_off);
> +	regmap_read(priv->map, pod->reg_off, &reg);
>  	od = PARM_GET(pod->width, pod->shift, reg);
>  
>  	return ((parent_rate_mhz * m / n) >> od) * 1000000;
> @@ -876,8 +876,8 @@ static ulong meson_clk_set_rate(struct clk *clk, ulong rate)
>  	if (IS_ERR_VALUE(ret))
>  		return ret;
>  
> -	printf("clock %lu has new rate %lu\n", clk->id,
> -	       meson_clk_get_rate_by_id(clk, clk->id));
> +	debug("clock %lu has new rate %lu\n", clk->id,
> +	      meson_clk_get_rate_by_id(clk, clk->id));
>  
>  	return 0;
>  }
> @@ -885,9 +884,11 @@ static int meson_clk_probe(struct udevice *dev)
>  {
>  	struct meson_clk *priv = dev_get_priv(dev);
> 
> -	priv->addr = dev_read_addr_ptr(dev);
> +	priv->map = syscon_node_to_regmap(dev_get_parent(dev)->node);
> +	if (IS_ERR(priv->map))
> +		return PTR_ERR(priv->map);
>  
> -	debug("meson-clk: probed at addr %p\n", priv->addr);
> +	debug("meson-clk: probed\n");
>  
>  	return 0;
>  }
> 

Thanks for doing the conversion,

Since this depends on the updated DT, I'll squash it with the last DT update patch, otherwise you'll have a breakage between these 2 commits if we try to bisect an issue.

Same for patch 2, you should add the SYSCON dependency directly on the MESON64_COMMON config in arch/arm/mach-meson/Kconfig

Otherwise, for this change squashed with the DT sync and SYSCON moved to MESON64_COMMON:
Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Neil
