From: sboyd@codeaurora.org (Stephen Boyd)
Date: Tue, 11 Jul 2017 18:22:12 -0700
Subject: [PATCH v3 02/10] clk: add clk_core_set_phase_nolock function
In-Reply-To: <20170612194438.12298-3-jbrunet@baylibre.com>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
 <20170612194438.12298-3-jbrunet@baylibre.com>
Message-ID: <20170712012212.GS22780@codeaurora.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 06/12, Jerome Brunet wrote:
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index f5c371532509..dceaf0ff23db 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1873,6 +1873,23 @@ int clk_set_parent(struct clk *clk, struct clk *parent)
>  }
>  EXPORT_SYMBOL_GPL(clk_set_parent);
>  
> +static int clk_core_set_phase_nolock(struct clk_core *core, int degrees)
> +{
> +	int ret = -EINVAL;
> +
> +	if (!core)
> +		return 0;

Same comment about lockdep assertion applies here.

> +
> +	trace_clk_set_phase(core, degrees);
> +
> +	if (core->ops->set_phase)
> +		ret = core->ops->set_phase(core->hw, degrees);
> +
> +	trace_clk_set_phase_complete(core, degrees);
> +
> +	return ret;
> +}
> +
>  /**
>   * clk_set_phase - adjust the phase shift of a clock signal
>   * @clk: clock signal source

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
