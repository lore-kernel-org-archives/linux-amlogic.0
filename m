Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC58C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jan 2022 21:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wHoxM+2QRPgdZXQtFf726QMH74T/Zb/8eczn0SbZvgQ=; b=KBficZj5gO5gUP
	dDlGZHYZvVJddbW8sfwuuST2HMX9O8Hc83g52Ce3lH+3aMllvcD1GZ6h5rP6FooKsffOTR8+8L4GE
	2s8gVCanxVu3RnQ/DWJUkt3P00WWFD3GS74tOwRNjOsd0tzj0m7STnqLYur8rU3Hht1vDbae2Sgq+
	zCwrz6x12azMZcxjRrp2ireq86UGClU9XZZALYhtJcM0IUVdtnarBSH4i50jjjYQILtQU5/srQ5m4
	3+CVeeweI9fvl5cmX73gx9D7eZBAu89vRukIfh2gdjFgQ/G8j5BPSgGtj7Lp+i7N2sNI9pY3FBz4s
	TWrmbOnGJsndojeEy5WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n87kc-0079y0-69; Thu, 13 Jan 2022 21:35:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n87kY-0079xK-SS; Thu, 13 Jan 2022 21:35:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 57FC461444;
 Thu, 13 Jan 2022 21:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9819AC36AEA;
 Thu, 13 Jan 2022 21:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642109713;
 bh=kBzzd4YU14o+Y5Yg58a6FnXb4N5XBBZe+VK8mCrDl00=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=SePOwZPgneYtIm/CvArHR98JFE2W+OWmNtUAgFOLfnqlkd4qrBUUQM5QMItyVjEsF
 eZncjxMMu4Wz+AosNcYldGSauLzS3Q93BIWkIfAjg0MF9mVHNyq0miM1UEyxKGUmAb
 Wec2NCWYymQWueb9cWusUrtOm0uWCe6TRgCIEgnNmuiW6xFTlAlF6Z3wzfqr+GCjBu
 cH2eZ6rw3ql+Qugnsvt8e8QQunSOoglsG4IBIWXOt4RCof/7UyYVkQeN7/V9WBYU/u
 abJjdej14Yml8HNa3diXqBqeE+zOYmu6Rlfaxxkcv9rBv9TYoCL+eEVBKuMOWdfmFI
 nVb9lE1lno8Pw==
MIME-Version: 1.0
In-Reply-To: <20220113115745.45826-5-liang.yang@amlogic.com>
References: <20220113115745.45826-1-liang.yang@amlogic.com>
 <20220113115745.45826-5-liang.yang@amlogic.com>
Subject: Re: [PATCH v9 4/4] clk: meson: add sub MMC clock controller driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: Liang Yang <liang.yang@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 XianWei Zhao <xianwei.zhao@amlogic.com>,
 Kelvin Zhang <kelvin.zhang@amlogic.com>,
 BiChao Zheng <bichao.zheng@amlogic.com>, YongHui Yu <yonghui.yu@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Liang Yang <liang.yang@amlogic.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org
Date: Thu, 13 Jan 2022 13:35:12 -0800
User-Agent: alot/0.9.1
Message-Id: <20220113213513.9819AC36AEA@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_133515_037711_A301F9D4 
X-CRM114-Status: GOOD (  25.94  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Liang Yang (2022-01-13 03:57:45)
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index bb0f59eea366..3de6f3b24461 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -39,6 +39,20 @@ config COMMON_CLK_MESON_AO_CLKC
>         select COMMON_CLK_MESON_REGMAP
>         select RESET_CONTROLLER
>  
> +config COMMON_CLK_MMC_MESON
> +       tristate "Meson MMC Sub Clock Controller Driver"
> +       depends on ARCH_MESON || COMPILE_TEST
> +       select MFD_SYSCON
> +       select COMMON_CLK_AMLOGIC
> +       select COMMON_CLK_MESON_PHASE
> +       select COMMON_CLK_MESON_PHASE_DELAY
> +       select COMMON_CLK_MESON_SCLK_DIV
> +       help
> +         Support for the MMC sub clock controller on
> +         Amlogic Meson Platform, which includes S905 (GXBB, GXL),
> +         A113D/X (AXG) devices . Say Y if you want this

s/devices /devices/

> +         clock enabled.
> +
>  config COMMON_CLK_MESON_EE_CLKC
>         tristate
>         select COMMON_CLK_MESON_REGMAP
> diff --git a/drivers/clk/meson/mmc-clkc.c b/drivers/clk/meson/mmc-clkc.c
> new file mode 100644
> index 000000000000..f53977f61390
> --- /dev/null
> +++ b/drivers/clk/meson/mmc-clkc.c
> @@ -0,0 +1,300 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/of_device.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/clock/amlogic,mmc-clkc.h>
> +
> +#include "sclk-div.h"
> +#include "clk-phase-delay.h"
> +#include "clk-regmap.h"
> +#include "clk-phase.h"
> +
> +/* clock ID used by internal driver */
> +
> +#define SD_EMMC_CLOCK          0
> +#define CLK_DELAY_STEP_PS_GX   200
> +#define CLK_DELAY_STEP_PS_AXG  78
> +#define MUX_CLK_NUM_PARENTS    2
> +#define MMC_MAX_CLKS           4
> +
> +struct mmc_clkc_data {
> +       struct meson_clk_phase_delay_data tx;
> +       struct meson_clk_phase_delay_data rx;
> +};
> +
> +static struct clk_regmap_mux_data mmc_clkc_mux_data = {
> +       .offset = SD_EMMC_CLOCK,
> +       .mask   = 0x3,
> +       .shift  = 6,
> +};
> +
> +static const struct meson_sclk_div_data mmc_clkc_div_data = {
> +       .div = {
> +               .reg_off = SD_EMMC_CLOCK,
> +               .width   = 6,
> +       },
> +       .flags = MESON_SCLK_ONE_BASED,
> +};
> +
> +static struct meson_clk_phase_data mmc_clkc_core_phase = {
> +       .ph = {
> +               .reg_off = SD_EMMC_CLOCK,
> +               .shift   = 8,
> +               .width   = 2,
> +       }
> +};
> +
> +static const struct mmc_clkc_data mmc_clkc_gx_data = {
> +       .tx = {
> +               .phase = {
> +                       .reg_off = SD_EMMC_CLOCK,
> +                       .shift   = 10,
> +                       .width   = 2,
> +               },
> +               .delay = {
> +                       .reg_off = SD_EMMC_CLOCK,
> +                       .shift   = 16,
> +                       .width   = 4,
> +               },
> +               .delay_step_ps = CLK_DELAY_STEP_PS_GX,
> +       },
> +       .rx = {
> +               .phase = {
> +                       .reg_off = SD_EMMC_CLOCK,
> +                       .shift   = 12,
> +                       .width   = 2,
> +               },
> +               .delay = {
> +                       .reg_off = SD_EMMC_CLOCK,
> +                       .shift   = 20,
> +                       .width   = 4,
> +               },
> +               .delay_step_ps   = CLK_DELAY_STEP_PS_GX,
> +       },
> +};
> +
> +static const struct mmc_clkc_data mmc_clkc_axg_data = {
> +       .tx = {
> +               .phase = {
> +                       .reg_off = SD_EMMC_CLOCK,
> +                       .shift   = 10,
> +                       .width   = 2,
> +               },
> +               .delay = {
> +                       .reg_off = SD_EMMC_CLOCK,
> +                       .shift   = 16,
> +                       .width   = 6,
> +               },
> +               .delay_step_ps   = CLK_DELAY_STEP_PS_AXG,
> +       },
> +       .rx = {
> +               .phase = {
> +                       .reg_off = SD_EMMC_CLOCK,
> +                       .shift   = 12,
> +                       .width   = 2,
> +               },
> +               .delay = {
> +                       .reg_off = SD_EMMC_CLOCK,
> +                       .shift   = 22,
> +                       .width   = 6,
> +               },
> +               .delay_step_ps   = CLK_DELAY_STEP_PS_AXG,
> +       },
> +};
> +
> +static const struct of_device_id mmc_clkc_match_table[] = {
> +       {
> +               .compatible     = "amlogic,gx-mmc-clkc",
> +               .data           = &mmc_clkc_gx_data
> +       },
> +       {
> +               .compatible     = "amlogic,axg-mmc-clkc",
> +               .data           = &mmc_clkc_axg_data
> +       },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, mmc_clkc_match_table);
> +
> +static struct clk_regmap *
> +mmc_clkc_register_clk(struct device *dev, struct regmap *map,
> +                     struct clk_init_data *init,
> +                     const char *suffix, void *data)
> +{
> +       struct clk_regmap *clk;
> +       char *name;
> +       int ret;
> +
> +       clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
> +       if (!clk)
> +               return ERR_PTR(-ENOMEM);
> +
> +       name = kasprintf(GFP_KERNEL, "%s#%s", dev_name(dev), suffix);
> +       if (!name)
> +               return ERR_PTR(-ENOMEM);
> +
> +       init->name = name;
> +       clk->map = map;
> +       clk->data = data;
> +       clk->hw.init = init;
> +       ret = devm_clk_hw_register(dev, &clk->hw);
> +       if (ret)
> +               clk = ERR_PTR(ret);
> +
> +       kfree(name);
> +       return clk;
> +}
> +
> +static struct clk_regmap *mmc_clkc_register_mux(struct device *dev,
> +                                               struct regmap *map)
> +{
> +       const char *parent_names[MUX_CLK_NUM_PARENTS];
> +       struct clk_init_data init;
> +       struct clk_regmap *mux;
> +       struct clk *clk;
> +       int i;
> +
> +       for (i = 0; i < MUX_CLK_NUM_PARENTS; i++) {
> +               char name[8];
> +
> +               snprintf(name, sizeof(name), "clkin%d", i);
> +               clk = devm_clk_get(dev, name);
> +               if (IS_ERR(clk)) {
> +                       if (clk != ERR_PTR(-EPROBE_DEFER))
> +                               dev_err(dev, "Missing clock %s\n", name);

Use dev_err_probe()?

> +                       return ERR_CAST(clk);
> +               }
> +
> +               parent_names[i] = __clk_get_name(clk);

Why can't we use clk_parent_data?

> +       }
> +
> +       init.ops = &clk_regmap_mux_ops;
> +       init.flags = CLK_SET_RATE_PARENT;
> +       init.parent_names = parent_names;
> +       init.num_parents = MUX_CLK_NUM_PARENTS;
> +
> +       mux = mmc_clkc_register_clk(dev, map, &init, "mux", &mmc_clkc_mux_data);
> +       if (IS_ERR(mux))
> +               dev_err(dev, "Mux clock registration failed\n");
> +
> +       return mux;
> +}
> +
> +static struct clk_regmap *
> +mmc_clkc_register_clk_with_parent(struct device *dev, struct regmap *map,
> +                                 char *suffix, const struct clk_hw *hw,
> +                                 unsigned long flags,
> +                                 const struct clk_ops *ops, void *data)
> +{
> +       struct clk_init_data init;
> +       struct clk_regmap *clk;
> +       const char *parent_name = clk_hw_get_name(hw);
> +
> +       init.ops = ops;
> +       init.flags = flags;
> +       init.parent_names = &parent_name;
> +       init.num_parents = 1;
> +
> +       clk = mmc_clkc_register_clk(dev, map, &init, suffix, data);
> +       if (IS_ERR(clk))
> +               dev_err(dev, "%s clock registration failed\n", suffix);
> +
> +       return clk;
> +}
> +
> +static int mmc_clkc_probe(struct platform_device *pdev)
> +{
> +       struct clk_hw_onecell_data *onecell_data;
> +       struct device *dev = &pdev->dev;
> +       struct mmc_clkc_data *data;
> +       struct regmap *map;
> +       struct clk_regmap *clk, *core;
> +       struct meson_sclk_div_data *div_data;
> +
> +       /*cast to drop the const in match->data*/

Space after *, also why do we need to cast away const? The user of this
pointer passes it all the way down to mmc_clkc_register_clk() which
could take the data as const void pointer and decide to cast away const
there.

> +       data = (struct mmc_clkc_data *)of_device_get_match_data(dev);
> +       if (!data)
> +               return -ENODEV;
> +
> +       map = syscon_node_to_regmap(dev->of_node);
> +       if (IS_ERR(map)) {
> +               dev_err(dev, "could not find mmc clock controller\n");
> +               return PTR_ERR(map);
> +       }
> +
> +       onecell_data = devm_kzalloc(dev,
> +                                   struct_size(onecell_data, hws,
> +                                               MMC_MAX_CLKS),
> +                                   GFP_KERNEL);
> +       if (!onecell_data)
> +               return -ENOMEM;
> +
> +       clk = mmc_clkc_register_mux(dev, map);
> +       if (IS_ERR(clk))
> +               return PTR_ERR(clk);
> +
> +       div_data = devm_kzalloc(dev, sizeof(*div_data), GFP_KERNEL);
> +       if (!div_data)
> +               return -ENOMEM;
> +
> +       memcpy(div_data, &mmc_clkc_div_data, sizeof(*div_data));
> +       clk = mmc_clkc_register_clk_with_parent(dev, map, "div",
> +                                               &clk->hw,
> +                                               CLK_SET_RATE_PARENT,
> +                                               &meson_sclk_div_ops,
> +                                               div_data);
> +       if (IS_ERR(clk))
> +               return PTR_ERR(clk);
> +
> +       onecell_data->hws[CLKID_MMC_DIV] = &clk->hw;
> +       core = mmc_clkc_register_clk_with_parent(dev, map, "core",
> +                                                &clk->hw,
> +                                                CLK_SET_RATE_PARENT,
> +                                                &meson_clk_phase_ops,
> +                                                &mmc_clkc_core_phase);
> +       if (IS_ERR(core))
> +               return PTR_ERR(core);
> +
> +       onecell_data->hws[CLKID_MMC_PHASE_CORE] = &core->hw;
> +       clk = mmc_clkc_register_clk_with_parent(dev, map, "rx",
> +                                               &core->hw,  0,
> +                                               &meson_clk_phase_delay_ops,
> +                                               &data->rx);
> +       if (IS_ERR(clk))
> +               return PTR_ERR(clk);
> +
> +       onecell_data->hws[CLKID_MMC_PHASE_RX] = &clk->hw;
> +       clk = mmc_clkc_register_clk_with_parent(dev, map, "tx",
> +                                               &core->hw,  0,
> +                                               &meson_clk_phase_delay_ops,
> +                                               &data->tx);
> +       if (IS_ERR(clk))
> +               return PTR_ERR(clk);
> +
> +       onecell_data->hws[CLKID_MMC_PHASE_TX] = &clk->hw;
> +       onecell_data->num = MMC_MAX_CLKS;
> +       return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +                                          onecell_data);
> +}
> +
> +static struct platform_driver mmc_clkc_driver = {
> +       .probe          = mmc_clkc_probe,
> +       .driver         = {
> +               .name   = "meson-mmc-clkc",
> +               .of_match_table = of_match_ptr(mmc_clkc_match_table),
> +       },
> +};
> +
> +module_platform_driver(mmc_clkc_driver);
> +
> +MODULE_DESCRIPTION("Amlogic AXG MMC clock driver");
> +MODULE_AUTHOR("Jianxin Pan <jianxin.pan@amlogic.com>");
> +MODULE_LICENSE("GPL v2");

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
