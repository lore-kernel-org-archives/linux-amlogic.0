Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E74EC4321E
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 11:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L13Z1+yK/ZPoInBFbhNxbCgSkLY/i5nkwppgtuhH9HY=; b=QD+3l75s+Qfgz8
	8JE63JfSZDnhCWOXTnXNUeCNGOh28jdyzpuEhk1bMsbDRRmzuZ7k3R5ge2AO6VoHJxI1gAYF6kE+W
	P6q9BqBj9n7mdMpUH4bLVRiSz+ev3RDZGAUpVBdsrB7KE72H0BUd/nFrBj332ptxFYUVi/fPBhA5a
	33xIjBaTPArdSUJvSNRZyyW5rcOFsxY1m/YUTVhYhCWFQYvZ/nAvCYk7fPEkQiaQLqZBsJu4wv02P
	8+uETBQHgYiXOBpBjA4HdueisQSl4TCoxejBB84yVVH1ByYs6l2a3Ki4Q2KLYiEceP4g7DinH410C
	7MNUEGbMjUItqjkk2Faw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p144E-00FwIJ-VJ; Fri, 02 Dec 2022 11:18:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p143X-00Fw4V-T3
	for linux-amlogic@lists.infradead.org; Fri, 02 Dec 2022 11:18:14 +0000
Received: by mail-wm1-x32e.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso3988502wms.4
        for <linux-amlogic@lists.infradead.org>; Fri, 02 Dec 2022 03:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=DZRUxz+2oeV4H1MQgImrONOfTACg5vH21fQewg5fziY=;
        b=68zhrre/NqRRPetK2lPHVnMEDS+iV8bejCIsSaLXRXCvuSxu/lRSYxf76IIE2tLmcN
         XlXvFgvyy0iEk4pyHGaRLgMLkYYLSMq64vVaGKs04ejoOSmuopq2+SXMIRZB/twCMaWo
         Tgl1kayBu6z5ulwQ8IDfz7qg562dI003ZdSjJhFf3t1HC8GGbQyk//vxuQ4oS6fwnLmR
         xy8qrgDxHVtbmvMGK3vEqDTphRS2mfY0ejBL1UqDwof1IK0VDUv6Oowp1p5ZrDFuRv4G
         mTidcMZ/z7mqkprcSC7wTzF77waXxPshtFANSvoPjvmv/lSzVlOGtMzfD80ddbjyIESA
         CI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZRUxz+2oeV4H1MQgImrONOfTACg5vH21fQewg5fziY=;
        b=ImJ5WRqAI/R1eNeWOqsUHTDkRFnbPkAg1jO1FrPfNQ6qbHD7iQ8co3w/yn8dKsyCYB
         hX/a0wiRujuAhKYb+l56FVdVOSGCTRvq8W/SdkSNUmZUDwNRjTnp1mkw/2xNUn8xrVnN
         1ZPzt6Li/05D/aiZi77qftoYSm+O19SdwaehGYxZIMa4XY5rOu+eLqDqckOa4goIjDqE
         xrU3nL8+ZFSedtuICkj/NxJdBghXAwStlGOxw0ODeUJJx6r/ebdfMbVxyQ8/6B4r9GNL
         VKHy3B1T9XdJz43aRorhsq+1Y9rJktJ3jhwEq4QfoRao2IokqqVF/8MfHYIBuo9cmOlS
         lBGQ==
X-Gm-Message-State: ANoB5plA/PWG7KThv4ZcaEH3/FymoPN68pPcmC4g5KqF9GCrwPx8izsC
	/92sLBwKxpfUzuhe7UG1tp9lIg==
X-Google-Smtp-Source: AA0mqf4h5FG/KgQS7jyCqdyinrM9iQDiP64AcZB9EtNcAaCR6AfeJXSZagJCN0ax7i52XhC/Y1fa3Q==
X-Received: by 2002:a05:600c:1c9a:b0:3cf:7514:a806 with SMTP id k26-20020a05600c1c9a00b003cf7514a806mr40880268wms.116.1669979888132;
        Fri, 02 Dec 2022 03:18:08 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id az39-20020a05600c602700b003cf78aafdd7sm8484809wmb.39.2022.12.02.03.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 03:18:07 -0800 (PST)
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-3-ddrokosov@sberdevices.ru>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, neil.armstrong@linaro.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 02/11] clk: meson: a1: add support for Amlogic A1 PLL
 clock driver
Date: Fri, 02 Dec 2022 12:16:12 +0100
In-reply-to: <20221201225703.6507-3-ddrokosov@sberdevices.ru>
Message-ID: <1j7cza8368.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_031811_952318_E0998AB7 
X-CRM114-Status: GOOD (  35.29  )
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


On Fri 02 Dec 2022 at 01:56, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:

> From: Jian Hu <jian.hu@amlogic.com>
>
> The Amlogic A1 clock includes three drivers:
> pll clocks, peripheral clocks, CPU clocks.
> sys pll and CPU clocks will be sent in next patch.
>
> Unlike the previous series, there is no EE/AO domain
> in A1 CLK controllers.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  drivers/clk/meson/Kconfig  |   9 +
>  drivers/clk/meson/Makefile |   1 +
>  drivers/clk/meson/a1-pll.c | 360 +++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/a1-pll.h |  56 ++++++
>  4 files changed, 426 insertions(+)
>  create mode 100644 drivers/clk/meson/a1-pll.c
>  create mode 100644 drivers/clk/meson/a1-pll.h
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index fc002c155bc3..ab34662b24f0 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -99,6 +99,15 @@ config COMMON_CLK_AXG_AUDIO
>  	  Support for the audio clock controller on AmLogic A113D devices,
>  	  aka axg, Say Y if you want audio subsystem to work.
>  
> +config COMMON_CLK_A1_PLL
> +	bool

Could you add a tristate with some text please ?

> +	depends on ARCH_MESON
> +	select COMMON_CLK_MESON_REGMAP
> +	select COMMON_CLK_MESON_PLL
> +	help
> +	  Support for the PLL clock controller on Amlogic A113L device,
> +	  aka a1. Say Y if you want PLL to work.
> +
>  config COMMON_CLK_G12A
>  	tristate "G12 and SM1 SoC clock controllers support"
>  	depends on ARM64
> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
> index 6eca2a406ee3..2f17f475a48f 100644
> --- a/drivers/clk/meson/Makefile
> +++ b/drivers/clk/meson/Makefile
> @@ -16,6 +16,7 @@ obj-$(CONFIG_COMMON_CLK_MESON_VID_PLL_DIV) += vid-pll-div.o
>  
>  obj-$(CONFIG_COMMON_CLK_AXG) += axg.o axg-aoclk.o
>  obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
> +obj-$(CONFIG_COMMON_CLK_A1_PLL) += a1-pll.o
>  obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
>  obj-$(CONFIG_COMMON_CLK_G12A) += g12a.o g12a-aoclk.o
>  obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o meson8-ddr.o
> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
> new file mode 100644
> index 000000000000..69c1ca07d041
> --- /dev/null
> +++ b/drivers/clk/meson/a1-pll.c
> @@ -0,0 +1,360 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
> + * Author: Jian Hu <jian.hu@amlogic.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include "a1-pll.h"
> +#include "clk-pll.h"
> +#include "clk-regmap.h"
> +
> +static struct clk_regmap a1_fixed_pll_dco = {
> +	.data = &(struct meson_clk_pll_data){
> +		.en = {
> +			.reg_off = ANACTRL_FIXPLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = ANACTRL_FIXPLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 8,
> +		},
> +		.n = {
> +			.reg_off = ANACTRL_FIXPLL_CTRL0,
> +			.shift   = 10,
> +			.width   = 5,
> +		},
> +		.frac = {
> +			.reg_off = ANACTRL_FIXPLL_CTRL1,
> +			.shift   = 0,
> +			.width   = 19,
> +		},
> +		.l = {
> +			.reg_off = ANACTRL_FIXPLL_STS,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = ANACTRL_FIXPLL_CTRL0,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "fixed_pll_dco",
> +		.ops = &meson_clk_pll_ro_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "xtal_fixpll",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a1_fixed_pll = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = ANACTRL_FIXPLL_CTRL0,
> +		.bit_idx = 20,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "fixed_pll",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a1_fixed_pll_dco.hw
> +		},
> +		.num_parents = 1,
> +		/*
> +		 * It is enough that the fdiv leaf has critical flag,
> +		 * No critical or unused flag here.
> +		 */
> +	},
> +};
> +
> +static const struct pll_mult_range a1_hifi_pll_mult_range = {
> +	.min = 32,
> +	.max = 64,
> +};
> +
> +static const struct reg_sequence a1_hifi_init_regs[] = {
> +	{ .reg = ANACTRL_HIFIPLL_CTRL1, .def = 0x01800000 },
> +	{ .reg = ANACTRL_HIFIPLL_CTRL2, .def = 0x00001100 },
> +	{ .reg = ANACTRL_HIFIPLL_CTRL3, .def = 0x100a1100 },
> +	{ .reg = ANACTRL_HIFIPLL_CTRL4, .def = 0x00302000 },
> +	{ .reg = ANACTRL_HIFIPLL_CTRL0, .def = 0x01f18440 },
> +};
> +
> +static struct clk_regmap a1_hifi_pll = {
> +	.data = &(struct meson_clk_pll_data){
> +		.en = {
> +			.reg_off = ANACTRL_HIFIPLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = ANACTRL_HIFIPLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 8,
> +		},
> +		.n = {
> +			.reg_off = ANACTRL_HIFIPLL_CTRL0,
> +			.shift   = 10,
> +			.width   = 5,
> +		},
> +		.frac = {
> +			.reg_off = ANACTRL_HIFIPLL_CTRL1,
> +			.shift   = 0,
> +			.width   = 19,
> +		},
> +		.l = {
> +			.reg_off = ANACTRL_HIFIPLL_STS,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.current_en = {
> +			.reg_off = ANACTRL_HIFIPLL_CTRL0,
> +			.shift   = 26,
> +			.width   = 1,
> +		},
> +		.l_detect = {
> +			.reg_off = ANACTRL_HIFIPLL_CTRL2,
> +			.shift   = 6,
> +			.width   = 1,
> +		},
> +		.range = &a1_hifi_pll_mult_range,
> +		.init_regs = a1_hifi_init_regs,
> +		.init_count = ARRAY_SIZE(a1_hifi_init_regs),
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "hifi_pll",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "xtal_hifipll",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_fixed_factor a1_fclk_div2_div = {
> +	.mult = 1,
> +	.div = 2,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "fclk_div2_div",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a1_fixed_pll.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a1_fclk_div2 = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = ANACTRL_FIXPLL_CTRL0,
> +		.bit_idx = 21,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "fclk_div2",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a1_fclk_div2_div.hw
> +		},
> +		.num_parents = 1,
> +		/*
> +		 * This clock is used by DDR clock in BL2 firmware
> +		 * and is required by the platform to operate correctly.
> +		 * Until the following condition are met, we need this clock to
> +		 * be marked as critical:
> +		 * a) Mark the clock used by a firmware resource, if possible
> +		 * b) CCF has a clock hand-off mechanism to make the sure the
> +		 *    clock stays on until the proper driver comes along
> +		 */
> +		.flags = CLK_IS_CRITICAL,
> +	},
> +};
> +
> +static struct clk_fixed_factor a1_fclk_div3_div = {
> +	.mult = 1,
> +	.div = 3,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "fclk_div3_div",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a1_fixed_pll.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a1_fclk_div3 = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = ANACTRL_FIXPLL_CTRL0,
> +		.bit_idx = 22,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "fclk_div3",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a1_fclk_div3_div.hw
> +		},
> +		.num_parents = 1,
> +		/*
> +		 * This clock is used by APB bus which is set in boot ROM code
> +		 * and is required by the platform to operate correctly.
> +		 * About critical, refer to a1_fclk_div2.
> +		 */
> +		.flags = CLK_IS_CRITICAL,
> +	},
> +};
> +
> +static struct clk_fixed_factor a1_fclk_div5_div = {
> +	.mult = 1,
> +	.div = 5,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "fclk_div5_div",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a1_fixed_pll.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a1_fclk_div5 = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = ANACTRL_FIXPLL_CTRL0,
> +		.bit_idx = 23,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "fclk_div5",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a1_fclk_div5_div.hw
> +		},
> +		.num_parents = 1,
> +		/*
> +		 * This clock is used by AXI bus which setted in Romcode
> +		 * and is required by the platform to operate correctly.
> +		 * About critical, refer to a1_fclk_div2.
> +		 */
> +		.flags = CLK_IS_CRITICAL,
> +	},
> +};
> +
> +static struct clk_fixed_factor a1_fclk_div7_div = {
> +	.mult = 1,
> +	.div = 7,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "fclk_div7_div",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a1_fixed_pll.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a1_fclk_div7 = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = ANACTRL_FIXPLL_CTRL0,
> +		.bit_idx = 24,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "fclk_div7",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a1_fclk_div7_div.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +/* Array of all clocks provided by this provider */
> +static struct clk_hw_onecell_data a1_pll_hw_onecell_data = {
> +	.hws = {
> +		[CLKID_FIXED_PLL_DCO]		= &a1_fixed_pll_dco.hw,
> +		[CLKID_FIXED_PLL]		= &a1_fixed_pll.hw,
> +		[CLKID_HIFI_PLL]		= &a1_hifi_pll.hw,
> +		[CLKID_FCLK_DIV2]		= &a1_fclk_div2.hw,
> +		[CLKID_FCLK_DIV3]		= &a1_fclk_div3.hw,
> +		[CLKID_FCLK_DIV5]		= &a1_fclk_div5.hw,
> +		[CLKID_FCLK_DIV7]		= &a1_fclk_div7.hw,
> +		[CLKID_FCLK_DIV2_DIV]		= &a1_fclk_div2_div.hw,
> +		[CLKID_FCLK_DIV3_DIV]		= &a1_fclk_div3_div.hw,
> +		[CLKID_FCLK_DIV5_DIV]		= &a1_fclk_div5_div.hw,
> +		[CLKID_FCLK_DIV7_DIV]		= &a1_fclk_div7_div.hw,
> +		[NR_PLL_CLKS]			= NULL,
> +	},
> +	.num = NR_PLL_CLKS,
> +};
> +
> +static struct clk_regmap *const a1_pll_regmaps[] = {
> +	&a1_fixed_pll_dco,
> +	&a1_fixed_pll,
> +	&a1_hifi_pll,
> +	&a1_fclk_div2,
> +	&a1_fclk_div3,
> +	&a1_fclk_div5,
> +	&a1_fclk_div7,
> +};
> +
> +static struct regmap_config clkc_regmap_config = {
> +	.reg_bits       = 32,
> +	.val_bits       = 32,
> +	.reg_stride     = 4,
> +};
> +
> +static int meson_a1_pll_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	void __iomem *base;
> +	struct regmap *map;
> +	int ret, i;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +
> +	base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);

devm_platform_ioremap_resource ?

> +
> +	map = devm_regmap_init_mmio(dev, base, &clkc_regmap_config);
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);
> +
> +	/* Populate regmap for the regmap backed clocks */
> +	for (i = 0; i < ARRAY_SIZE(a1_pll_regmaps); i++)
> +		a1_pll_regmaps[i]->map = map;
> +
> +	for (i = 0; i < a1_pll_hw_onecell_data.num; i++) {
> +		/* array might be sparse */
> +		if (!a1_pll_hw_onecell_data.hws[i])
> +			continue;
> +
> +		ret = devm_clk_hw_register(dev, a1_pll_hw_onecell_data.hws[i]);
> +		if (ret) {
> +			dev_err(dev, "Clock registration failed\n");
> +			return ret;
> +		}
> +	}
> +
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +					   &a1_pll_hw_onecell_data);
> +}
> +
> +static const struct of_device_id clkc_match_table[] = {
> +	{ .compatible = "amlogic,a1-pll-clkc", },
> +	{}
> +};
> +
> +static struct platform_driver a1_pll_driver = {
> +	.probe		= meson_a1_pll_probe,
> +	.driver		= {
> +		.name	= "a1-pll-clkc",
> +		.of_match_table = clkc_match_table,
> +	},
> +};
> +
> +builtin_platform_driver(a1_pll_driver);
> diff --git a/drivers/clk/meson/a1-pll.h b/drivers/clk/meson/a1-pll.h
> new file mode 100644
> index 000000000000..8ded267061ad
> --- /dev/null
> +++ b/drivers/clk/meson/a1-pll.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> +/*
> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
> + */
> +
> +#ifndef __A1_PLL_H
> +#define __A1_PLL_H
> +
> +/* PLL register offset */
> +#define ANACTRL_FIXPLL_CTRL0		0x0
> +#define ANACTRL_FIXPLL_CTRL1		0x4
> +#define ANACTRL_FIXPLL_CTRL2		0x8
> +#define ANACTRL_FIXPLL_CTRL3		0xc
> +#define ANACTRL_FIXPLL_CTRL4		0x10
> +#define ANACTRL_FIXPLL_STS		0x14
> +#define ANACTRL_SYSPLL_CTRL0		0x80
> +#define ANACTRL_SYSPLL_CTRL1		0x84
> +#define ANACTRL_SYSPLL_CTRL2		0x88
> +#define ANACTRL_SYSPLL_CTRL3		0x8c
> +#define ANACTRL_SYSPLL_CTRL4		0x90
> +#define ANACTRL_SYSPLL_STS		0x94
> +#define ANACTRL_HIFIPLL_CTRL0		0xc0
> +#define ANACTRL_HIFIPLL_CTRL1		0xc4
> +#define ANACTRL_HIFIPLL_CTRL2		0xc8
> +#define ANACTRL_HIFIPLL_CTRL3		0xcc
> +#define ANACTRL_HIFIPLL_CTRL4		0xd0
> +#define ANACTRL_HIFIPLL_STS		0xd4
> +#define ANACTRL_AUDDDS_CTRL0		0x100
> +#define ANACTRL_AUDDDS_CTRL1		0x104
> +#define ANACTRL_AUDDDS_CTRL2		0x108
> +#define ANACTRL_AUDDDS_CTRL3		0x10c
> +#define ANACTRL_AUDDDS_CTRL4		0x110
> +#define ANACTRL_AUDDDS_STS		0x114
> +#define ANACTRL_MISCTOP_CTRL0		0x140
> +#define ANACTRL_POR_CNTL		0x188
> +
> +/*
> + * CLKID index values
> + *
> + * These indices are entirely contrived and do not map onto the hardware.
> + * It has now been decided to expose everything by default in the DT header:
> + * include/dt-bindings/clock/a1-pll-clkc.h. Only the clocks ids we don't want
> + * to expose, such as the internal muxes and dividers of composite clocks,
> + * will remain defined here.
> + */
> +#define CLKID_FIXED_PLL_DCO		0
> +#define CLKID_FCLK_DIV2_DIV		2
> +#define CLKID_FCLK_DIV3_DIV		3
> +#define CLKID_FCLK_DIV5_DIV		4
> +#define CLKID_FCLK_DIV7_DIV		5
> +#define NR_PLL_CLKS			11
> +
> +/* include the CLKIDs that have been made part of the DT binding */
> +#include <dt-bindings/clock/a1-pll-clkc.h>
> +
> +#endif /* __A1_PLL_H */


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
