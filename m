From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 29 Mar 2018 10:42:58 +0200
Subject: [PATCH 3/4] clk: add Amlogic meson clock driver
In-Reply-To: <20171203091713.22029-4-b.galvani@gmail.com>
References: <20171203091713.22029-1-b.galvani@gmail.com>
 <20171203091713.22029-4-b.galvani@gmail.com>
Message-ID: <0f77c1b8-845c-9190-5550-a115bad9c926@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Beniamino,

On 03/12/2017 10:17, Beniamino Galvani wrote:
> Introduce a basic clock driver for Amlogic Meson SoCs which supports
> enabling/disabling clock gates and getting their frequency.
> 
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> ---
>  arch/arm/mach-meson/Kconfig |   2 +
>  drivers/clk/Makefile        |   1 +
>  drivers/clk/clk_meson.c     | 196 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 199 insertions(+)
>  create mode 100644 drivers/clk/clk_meson.c
> 
> diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
> index d4bd230be3..7acee3bc5c 100644
> --- a/arch/arm/mach-meson/Kconfig
> +++ b/arch/arm/mach-meson/Kconfig

[...]
> +
> +static int meson_set_gate(struct clk *clk, bool on)
> +{
> +	struct meson_clk *priv = dev_get_priv(clk->dev);
> +	struct meson_gate *gate;
> +
> +	if (clk->id >= ARRAY_SIZE(gates))
> +		return -ENOENT;

This should be -ENOSYS, otherwise it breaks the ethernet driver since it waits -ENOSYS if clock cannot be enabled.

> +
> +	gate = &gates[clk->id];
> +
> +	if (gate->reg == 0)
> +		return -ENOENT;

Same here -ENOSYS

> +
> +	clrsetbits_le32(priv->addr + gate->reg,
> +			BIT(gate->bit), on ? BIT(gate->bit) : 0);
> +	return 0;
> +}
> +
> +static int meson_clk_enable(struct clk *clk)
> +{
> +	return meson_set_gate(clk, true);
> +}
> +
> +static int meson_clk_disable(struct clk *clk)
> +{
> +	return meson_set_gate(clk, false);
> +}
> +
> +static ulong meson_clk_get_rate(struct clk *clk)
> +{
> +	struct meson_clk *priv = dev_get_priv(clk->dev);
> +
> +	if (clk->id != CLKID_CLK81) {
> +		if (clk->id >= ARRAY_SIZE(gates))
> +			return -ENOENT;

Same here -ENOSYS

> +		if (gates[clk->id].reg == 0)
> +			return -ENOENT;

Same here -ENOSYS

> +	}
> +
> +	/* Use cached value if available */
> +	if (priv->rate)
> +		return priv->rate;
> +
> +	priv->rate = meson_measure_clk_rate(CLK_81);
> +
> +	return priv->rate;
> +}
> +

[...]

Neil
