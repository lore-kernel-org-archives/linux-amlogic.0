Return-Path: <SRS0=H3eD=OU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9434FC07E85
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Dec 2018 17:00:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C4A420851
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Dec 2018 17:00:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O5j4/QgS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yHMt8fM+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C4A420851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y1GQxFSE5mAssS0gRcIn0dqxa9WiDMEsXHKieR+e+mE=; b=O5j4/QgSOX7UL2
	3FQGiBGRl608Yo5buYFc4JssH2OLTdgssxYX36zKgT4QP9iihaojl2THgDnhFPoZj3PjfRU73Y5d6
	wdNvCbQqhbRXYwoKJQIXnWUCcezEr1O7RK/Cmyrfr+Y7OTGK5m+EKKPqWBwMLYM3DHWVYnOfdlZzI
	MdiS8MyHguRehi3kCHeCE3icTd/1eX/dd/pIoMXze0ZOOaPnewtf0ZLfUHFRx1WchjoEdOlq2XHH0
	RTZgIZ9lSN2kVAqEtc3osnETwf1pVzq2fDU2mv7WHQ2MUYtDcxREG0ztzQWmwGGDr0c9ZGTGwT+TH
	H3aFNWo5Ii3EJngNe7DA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWlOF-0004cs-Tf; Tue, 11 Dec 2018 17:00:11 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWlO0-00045a-IL
 for linux-amlogic@lists.infradead.org; Tue, 11 Dec 2018 16:59:58 +0000
Received: by mail-wr1-x441.google.com with SMTP id 96so14877366wrb.2
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Dec 2018 08:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=xOKX2gbKoA2NpJTa7/BRU3Vb3BtYAQ+Du3EjLyCbzew=;
 b=yHMt8fM+lM2b6e2iBNwZQiNNz+RmbfdgUt0WX7znzDNYKuObVcAp/fZZimJIlXofKh
 3Zte+pQ7AdC3TbcehHb2vR/pUGf+ct46Zx1ye2VS9UjTsGufG1mkazVXvfynFrS1dhzm
 MQkilBXIR4s8B3UCL0jHucERzjRJPC+Kw1wWjxaUw74cDppIdemD7qgiHkcB2LslHcnN
 nvmukeZvhi22xuAV0Fr1+kDbdED4XRcLxOpSnTq0m5wDknOgePu/ZwnhFB5BA7yna1pU
 2yQNkhWtL1NdOYKWe0gFzGM1eDYqZfluz+s/c0a7c/+iqghMFZuqJkK9ExIkO1MTImdL
 xwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=xOKX2gbKoA2NpJTa7/BRU3Vb3BtYAQ+Du3EjLyCbzew=;
 b=M5eKzIE5QLToW16EF9WC2N9ANVuDrk8Cs4AV28DOfDGwR4NLJI+hYWyG17vDQiyWP+
 nLyITMsOHSas/yKioXns0ApzQy/tsA/NIyVLnkDGPCBmZSNxLwzq+EX4yy66ilquu2nW
 05WIES5IaiwZLM35+ZOWVQ8F3GN1UcOKMe5ndd876sxG4jzSfARZvhWgrA8nTt16b51T
 z4HB1NP2UxxG8u6McneO8V+43Ak8v0hAsz+n4TyqSOzOfHcgU1IDAWasYV96R8XEKVDz
 n0PbWmXL+DIeVlweptWbxt+PnB0XVokXpT4YWm01ht/nD0ZoKi9A8rrREw+8PD8XcTPo
 gYMQ==
X-Gm-Message-State: AA+aEWbDi++k/WZSf7BTxokC1lq1eZRfsIQZi9r4OEapDBQSaPNh7v0e
 LyFLnELWoNfd22xHymkEIb/mVA==
X-Google-Smtp-Source: AFSGD/VdZzyUApqILkNjzgyyGcNYvsa8660u4HVWbs6gOSnxK971VCAku0WIo2pRgifC3jmJvNGo1A==
X-Received: by 2002:adf:f504:: with SMTP id q4mr15086933wro.321.1544547584907; 
 Tue, 11 Dec 2018 08:59:44 -0800 (PST)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 j33sm28683992wre.91.2018.12.11.08.59.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 11 Dec 2018 08:59:44 -0800 (PST)
Message-ID: <10f2875c9724d9d9dd4bd32eab1fa3f8e42a809c.camel@baylibre.com>
Subject: Re: [PATCH RESEND v7 3/4] clk: meson: add sub MMC clock controller
 driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jianxin Pan <jianxin.pan@amlogic.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Date: Tue, 11 Dec 2018 17:59:41 +0100
In-Reply-To: <1544457877-51301-4-git-send-email-jianxin.pan@amlogic.com>
References: <1544457877-51301-1-git-send-email-jianxin.pan@amlogic.com>
 <1544457877-51301-4-git-send-email-jianxin.pan@amlogic.com>
User-Agent: Evolution 3.30.2 (3.30.2-2.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181211_085956_609213_C4E96348 
X-CRM114-Status: GOOD (  27.89  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Yixun Lan <yixun.lan@amlogic.com>,
 linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@bootlin.com>,
 Liang Yang <liang.yang@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Qiufang Dai <qiufang.dai@amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 2018-12-11 at 00:04 +0800, Jianxin Pan wrote:
> From: Yixun Lan <yixun.lan@amlogic.com>
> 
> The patch will add a MMC clock controller driver which used by MMC or NAND,
> It provide a mux and divider clock, and three phase clocks - core, tx, tx.
> 
> Two clocks are provided as the parent of MMC clock controller from
> upper layer clock controller - eg "amlogic,axg-clkc" in AXG platform.
> 
> To specify which clock the MMC or NAND driver may consume,
> the preprocessor macros in the dt-bindings/clock/amlogic,mmc-clkc.h header
> can be used in the device tree sources.
> 
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  drivers/clk/meson/Kconfig    |  10 ++
>  drivers/clk/meson/Makefile   |   1 +
>  drivers/clk/meson/mmc-clkc.c | 313
> +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 324 insertions(+)
>  create mode 100644 drivers/clk/meson/mmc-clkc.c
> 
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index efaa70f..6bb0d44 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -15,6 +15,16 @@ config COMMON_CLK_MESON_AO
>  	select COMMON_CLK_REGMAP_MESON
>  	select RESET_CONTROLLER
>  
> +config COMMON_CLK_MMC_MESON
> +	tristate "Meson MMC Sub Clock Controller Driver"
> +	select MFD_SYSCON
> +	select COMMON_CLK_AMLOGIC
> +	select COMMON_CLK_AMLOGIC_AUDIO

No it is wrong for the mmc to select AUDIO clocks.
If as a result of your patch sclk is needed for things, make the necessary
change in the Makefile.

> +	help
> +	  Support for the MMC sub clock controller on Amlogic Meson Platform,
> +	  which include S905 (GXBB, GXL), A113D/X (AXG) devices.
> +	  Say Y if you want this clock enabled.
> +
>  config COMMON_CLK_REGMAP_MESON
>  	bool
>  	select REGMAP
> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
> index 39ce566..31c16d5 100644
> --- a/drivers/clk/meson/Makefile
> +++ b/drivers/clk/meson/Makefile
> @@ -9,4 +9,5 @@ obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o
>  obj-$(CONFIG_COMMON_CLK_GXBB)	 += gxbb.o gxbb-aoclk.o gxbb-aoclk-
> 32k.o
>  obj-$(CONFIG_COMMON_CLK_AXG)	 += axg.o axg-aoclk.o
>  obj-$(CONFIG_COMMON_CLK_AXG_AUDIO)	+= axg-audio.o
> +obj-$(CONFIG_COMMON_CLK_MMC_MESON) 	+= mmc-clkc.o
>  obj-$(CONFIG_COMMON_CLK_REGMAP_MESON)	+= clk-regmap.o
> diff --git a/drivers/clk/meson/mmc-clkc.c b/drivers/clk/meson/mmc-clkc.c
> new file mode 100644
> index 0000000..f5a79a4
> --- /dev/null
> +++ b/drivers/clk/meson/mmc-clkc.c
> @@ -0,0 +1,313 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Amlogic Meson MMC Sub Clock Controller Driver
> + *
> + * Copyright (c) 2017 Baylibre SAS.
> + * Author: Jerome Brunet <jbrunet@baylibre.com>
> + *
> + * Copyright (c) 2018 Amlogic, inc.
> + * Author: Yixun Lan <yixun.lan@amlogic.com>
> + * Author: Jianxin Pan <jianxin.pan@amlogic.com>
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
> +#include "clkc.h"
> +#include "clkc-audio.h"

Again having audio in the mmc controller is wrong.
Please make the necessary rework.

> +
> +/* clock ID used by internal driver */
> +#define CLKID_MMC_MUX			0
> +
> +#define   SD_EMMC_CLOCK		0
           ^
why the multiple space here ? this looks odd

> +#define   CLK_DELAY_STEP_PS		200

Please keep thing aligned aligned consistently.

> +
> +#define MUX_CLK_NUM_PARENTS		2
> +#define MMC_MAX_CLKS			5
> +
> +struct mmc_clkc_data {
> +	struct meson_clk_phase_delay_data	tx;
> +	struct meson_clk_phase_delay_data	rx;

Why use a tab above ?

> +};
> +
> +static struct clk_regmap_mux_data mmc_clkc_mux_data = {
> +	.offset		= SD_EMMC_CLOCK,
> +	.mask		= 0x3,
> +	.shift		= 6,
> +};
> +
> +static const struct meson_sclk_div_data mmc_clkc_div_data = {
> +	.div = {
> +		.reg_off = SD_EMMC_CLOCK,
> +		.shift   = (0),
> +		.width   = (6),

Please remove the unncessary parenthesis

> +	},
> +	.hi = {
> +		.width   = 0,
> +	},

structure is a static const, all non-list members will be zero
drop the 

> +	.flags = CLK_DIVIDER_ONE_BASED,
> +};
> +
> +static struct meson_clk_phase_data mmc_clkc_core_phase = {
> +	.ph = {
> +		.reg_off	= SD_EMMC_CLOCK,
> +		.shift	= 8,
> +		.width	= 2,
> +	}
> +};
> +
> +static const struct mmc_clkc_data mmc_clkc_gx_data = {
> +	.tx = {
> +		.phase = {
> +			.reg_off	= SD_EMMC_CLOCK,
> +			.shift	= 10,
> +			.width	= 2,
> +		},
> +		.delay = {
> +			.reg_off	= SD_EMMC_CLOCK,
> +			.shift	= 16,
> +			.width	= 4,
> +		},

Again, an effort on alignement would appreciated, same below

> +		.delay_step_ps	= CLK_DELAY_STEP_PS,
> +	},
> +	.rx = {
> +		.phase = {
> +			.reg_off	= SD_EMMC_CLOCK,
> +			.shift	= 12,
> +			.width	= 2,
> +		},
> +		.delay = {
> +			.reg_off	= SD_EMMC_CLOCK,
> +			.shift	= 20,
> +			.width	= 4,
> +		},
> +		.delay_step_ps	= CLK_DELAY_STEP_PS,
> +	},
> +};
> +
> +static const struct mmc_clkc_data mmc_clkc_axg_data = {
> +	.tx = {
> +		.phase = {
> +			.reg_off	= SD_EMMC_CLOCK,
> +			.shift	= 10,
> +			.width	= 2,
> +		},
> +		.delay = {
> +			.reg_off	= SD_EMMC_CLOCK,
> +			.shift	= 16,
> +			.width	= 6,
> +		},
> +		.delay_step_ps	= CLK_DELAY_STEP_PS,
> +	},
> +	.rx = {
> +		.phase = {
> +			.reg_off	= SD_EMMC_CLOCK,
> +			.shift	= 12,
> +			.width	= 2,
> +		},
> +		.delay = {
> +			.reg_off	= SD_EMMC_CLOCK,
> +			.shift	= 22,
> +			.width	= 6,
> +		},
> +		.delay_step_ps	= CLK_DELAY_STEP_PS,
> +	},
> +};
> +
> +static const struct of_device_id mmc_clkc_match_table[] = {
> +	{
> +		.compatible	= "amlogic,gx-mmc-clkc",
> +		.data		= &mmc_clkc_gx_data
> +	},
> +	{
> +		.compatible	= "amlogic,axg-mmc-clkc",
> +		.data		= &mmc_clkc_axg_data
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mmc_clkc_match_table);
> +
> +static struct clk_regmap *
> +mmc_clkc_register_clk(struct device *dev, struct regmap *map,
> +		      struct clk_init_data *init,
> +		      const char *suffix, void *data)
> +{
> +	struct clk_regmap *clk;
> +	char *name;
> +	int ret;
> +
> +	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
> +	if (!clk)
> +		return ERR_PTR(-ENOMEM);
> +
> +	name = kasprintf(GFP_KERNEL, "%s#%s", dev_name(dev), suffix);
> +	if (!name)
> +		return ERR_PTR(-ENOMEM);
> +
> +	init->name = name;
> +

nitpick: remove this newline

> +	clk->map = map;
> +	clk->data = data;
> +	clk->hw.init = init;
> +
> +	ret = devm_clk_hw_register(dev, &clk->hw);
> +	if (ret)
> +		clk = ERR_PTR(ret);
> +
> +	kfree(name);
> +	return clk;
> +}
> +
> +static struct clk_regmap *mmc_clkc_register_mux(struct device *dev,
> +						struct regmap *map)
> +{
> +	const char *parent_names[MUX_CLK_NUM_PARENTS];
> +	struct clk_init_data init;
> +	struct clk_regmap *mux;
> +	struct clk *clk;
> +	int i;
> +
> +	for (i = 0; i < MUX_CLK_NUM_PARENTS; i++) {
> +		char name[8];
> +
> +		snprintf(name, sizeof(name), "clkin%d", i);
> +		clk = devm_clk_get(dev, name);
> +		if (IS_ERR(clk)) {
> +			if (clk != ERR_PTR(-EPROBE_DEFER))
> +				dev_err(dev, "Missing clock %s\n", name);
> +			return ERR_PTR((long)clk);

I don't think this cast is necessary     ^

> +		}
> +
> +		parent_names[i] = __clk_get_name(clk);
> +	}
> +
> +	init.ops = &clk_regmap_mux_ops;
> +	init.flags = CLK_SET_RATE_PARENT;
> +	init.parent_names = parent_names;
> +	init.num_parents = MUX_CLK_NUM_PARENTS;
> +
> +	mux = mmc_clkc_register_clk(dev, map, &init, "mux",
> &mmc_clkc_mux_data);
> +	if (IS_ERR(mux))
> +		dev_err(dev, "Mux clock registration failed\n");
> +
> +	return mux;
> +}
> +
> +static struct clk_regmap *
> +mmc_clkc_register_clk_with_parent(struct device *dev, struct regmap *map,
> +				  char *suffix, const struct clk_hw *hw,
> +				  unsigned long flags,
> +				  const struct clk_ops *ops, void *data)
> +{
> +	struct clk_init_data init;
> +	struct clk_regmap *clk;
> +	const char *parent_name = clk_hw_get_name(hw);
> +
> +	init.ops = ops;
> +	init.flags = flags;
> +	init.parent_names = &parent_name;
> +	init.num_parents = 1;
> +
> +	clk = mmc_clkc_register_clk(dev, map, &init, suffix, data);
> +	if (IS_ERR(clk))
> +		dev_err(dev, "Core %s clock registration failed\n", suffix);

                               ^
this function is not only called by the core clock, is it ?

> +
> +	return clk;
> +}
> +
> +static int mmc_clkc_probe(struct platform_device *pdev)
> +{
> +	struct clk_hw_onecell_data *onecell_data;
> +	struct device *dev = &pdev->dev;
> +	struct mmc_clkc_data *data;
> +	struct regmap *map;
> +	struct clk_regmap *clk, *core;
> +	struct meson_sclk_div_data *div_data;
> +
> +	/*cast to drop the const in match->data*/
> +	data = (struct mmc_clkc_data *)of_device_get_match_data(dev);
> +	if (!data)
> +		return -ENODEV;
> +
> +	map = syscon_node_to_regmap(dev->of_node);
> +	if (IS_ERR(map)) {
> +		dev_err(dev, "could not find mmc clock controller\n");
> +		return PTR_ERR(map);
> +	}
> +
> +	onecell_data = devm_kzalloc(dev, sizeof(*onecell_data) +
> +				    sizeof(*onecell_data->hws) * MMC_MAX_CLKS,
> +				    GFP_KERNEL);
> +	if (!onecell_data)
> +		return -ENOMEM;
> +
> +	clk = mmc_clkc_register_mux(dev, map);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +	onecell_data->hws[CLKID_MMC_MUX]		= &clk->hw,

It does not really need to have an ID or be in the onecell data if you are not
going to expose it. On the other controllers, we are using the onecell for the
registration as well, which is why there is unexpeosed IDs, but it is not the
case here.

... and please, stop with this unnecessary tab. a space will do. same below.

> +
> +	div_data = devm_kzalloc(dev, sizeof(*div_data), GFP_KERNEL);
> +	if (!div_data)
> +		return -ENOMEM;
> +	*div_data = mmc_clkc_div_data;

memcpy would be more appropriate.

> +
> +	clk = mmc_clkc_register_clk_with_parent(dev, map, "div",
> +						&clk->hw,
> +						CLK_SET_RATE_PARENT,
> +						&meson_sclk_div_ops,
> +						div_data);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +	onecell_data->hws[CLKID_MMC_DIV]		= &clk->hw,
> +
> +	core = mmc_clkc_register_clk_with_parent(dev, map, "core",
> +						 &clk->hw,
> +						 CLK_SET_RATE_PARENT,
> +						 &meson_clk_phase_ops,
> +						 &mmc_clkc_core_phase);
> +	if (IS_ERR(core))
> +		return PTR_ERR(core);
> +	onecell_data->hws[CLKID_MMC_PHASE_CORE]		= &core->hw,
> +
> +	clk = mmc_clkc_register_clk_with_parent(dev, map, "rx",
> +						&core->hw,  0,
> +						&meson_clk_phase_delay_ops,
> +						&data->rx);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +	onecell_data->hws[CLKID_MMC_PHASE_RX]		= &clk->hw,
> +
> +	clk = mmc_clkc_register_clk_with_parent(dev, map, "tx",
> +						&core->hw,  0,
> +						&meson_clk_phase_delay_ops,
> +						&data->tx);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +	onecell_data->hws[CLKID_MMC_PHASE_TX]		= &clk->hw,
> +
> +	onecell_data->num				= MMC_MAX_CLKS;
> +
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +					   onecell_data);
> +}
> +
> +static struct platform_driver mmc_clkc_driver = {
> +	.probe		= mmc_clkc_probe,
> +	.driver		= {
> +		.name	= "meson-mmc-clkc",
> +		.of_match_table = of_match_ptr(mmc_clkc_match_table),
> +	},
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
