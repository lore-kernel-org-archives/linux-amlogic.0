From: mturquette@baylibre.com (Michael Turquette)
Date: Wed, 13 Jul 2016 14:53:47 -0700
Subject: [PATCH v2 7/7] meson: clk: Add support for clock gates
In-Reply-To: <1468432181-9550-8-git-send-email-serveralex@gmail.com>
References: <1468432181-9550-1-git-send-email-serveralex@gmail.com>
 <1468432181-9550-8-git-send-email-serveralex@gmail.com>
Message-ID: <146844682774.73491.3554377408257493400@resonance>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Quoting Alexander M?ller (2016-07-13 10:49:41)
> This patch adds support for the meson8b clock gates. Most of
> them are disabled by Amlogic U-Boot, but need to be enabled
> for ethernet, USB and many other components.
> 
> Signed-off-by: Alexander M?ller <serveralex@gmail.com>
> ---
>  drivers/clk/meson/meson8b.c | 263 ++++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/meson8b.h |   5 +
>  2 files changed, 268 insertions(+)
> 
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index 9a656d9..0a0e01d 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -27,6 +27,20 @@
>  #include "clkc.h"
>  #include "meson8b.h"
>  
> +#define MESON8B_GATE(_name, _reg, _bit)                                        \
> +struct clk_gate meson8b_##_name = {                                    \
> +       .reg = (void __iomem *) _reg,                                   \
> +       .bit_idx = (_bit),                                              \
> +       .lock = &clk_lock,                                              \
> +       .hw.init = &(struct clk_init_data) {                            \
> +               .name = #_name,                                         \
> +               .ops = &clk_gate_ops,                                   \
> +               .parent_names = (const char *[]){ "clk81" },            \
> +               .num_parents = 1,                                       \
> +               .flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),     \
> +       },                                                              \
> +};

As I mentioned in patch #6, let's keep this shared between meson8b and
gxbb in clkc.h.

> +
>  static DEFINE_SPINLOCK(clk_lock);
>  
>  static const struct pll_rate_table sys_pll_rate_table[] = {
> @@ -311,6 +325,92 @@ struct clk_gate meson8b_clk81 = {
>         },
>  };
>  
> +/* Everything Else (EE) domain gates */
> +
> +static MESON8B_GATE(ddr, HHI_GCLK_MPEG0, 0);

To do the above, "ddr" will need to become "meson8b_ddr", etc.

Regards,
Mike
