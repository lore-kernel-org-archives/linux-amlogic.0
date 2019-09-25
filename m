Return-Path: <SRS0=JnL7=XU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456EBC432C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2019 13:12:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17D7E20640
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2019 13:12:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BKw0DaId";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tsOpwJ5S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17D7E20640
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:From:To:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O4SJFZbEy7sZizECtg/zIZUBxN+BC9BcCDZJHk2DpQU=; b=BKw0DaIdUZ0AKn
	16p5kawnnx78VWGt9wxDWQjlq/PnbC7q1uIGKXr8SyzccN9cDWmrVyVZeYrv3P9xFExoFb6d5Yls8
	inIr7KhDMoCNuhTKky+h7spTXroOd2hONL2gmdOi84kdKf9SBLuGfWofWss6td1ILMktfygQdwI4M
	QyWIzmz3DrQnu7uZQIt5nTmXVZ0tUoBKb8Ve8mtELV5qqBXlLzlg1NiIkulKWwcSOO4a/LTMy4X1e
	Sa0aXZDT4LvKO+TKnUqVxq7BCkECISzUka9ppEUqTfNWbu9p61I9BpNUKT6WmLyTsdUeZ/QC25OPi
	QtbQJlP7/6umu0u1oiBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iD75v-0003ma-58; Wed, 25 Sep 2019 13:12:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iD75s-0003m6-Qa; Wed, 25 Sep 2019 13:12:34 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4751020640;
 Wed, 25 Sep 2019 13:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569417152;
 bh=AaD74a0PCviH3ASjVa4uhtW3hNJxUotze4MI2kShMJ8=;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
 b=tsOpwJ5S9fDmc4Pig1XjNj6oLCGe0M4hVsW7WQl+PPUlaPGYjFsdvDpJGyLSCkYXl
 RwoiYlq1n4QdPzXJR0cX4hpiE3clNqWYqt4fHMwGiMMHQFCwQh9F3LlMVFCxX4YDLV
 n9hY1eXpcN13X/mM4pOEay05xt499/QddSCpAgX4=
MIME-Version: 1.0
In-Reply-To: <1569411888-98116-3-git-send-email-jian.hu@amlogic.com>
References: <1569411888-98116-1-git-send-email-jian.hu@amlogic.com>
 <1569411888-98116-3-git-send-email-jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Jian Hu <jian.hu@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: meson: a1: add support for Amlogic A1 clock
 driver
User-Agent: alot/0.8.1
Date: Wed, 25 Sep 2019 06:12:31 -0700
Message-Id: <20190925131232.4751020640@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190925_061232_907032_3E788D8B 
X-CRM114-Status: GOOD (  18.34  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Jian Hu <jian.hu@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jian Hu (2019-09-25 04:44:48)
> The Amlogic A1 clock includes three parts:
> peripheral clocks, pll clocks, CPU clocks.
> sys pll and CPU clocks will be sent in next patch.
> 
> Unlike the previous series, there is no EE/AO domain
> in A1 CLK controllers.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>

This second name didn't send the patch. Please follow the signoff
procedures documented in Documentation/process/submitting-patches.rst

> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 16d7614..a48f67d 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -138,6 +138,7 @@ config ARCH_MESON
>         select COMMON_CLK_AXG
>         select COMMON_CLK_G12A
>         select MESON_IRQ_GPIO
> +       select COMMON_CLK_A1

Sort?

>         help
>           This enables support for the arm64 based Amlogic SoCs
>           such as the s905, S905X/D, S912, A113X/D or S905X/D2
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index dabeb43..e6cb4c3 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -107,3 +107,13 @@ config COMMON_CLK_G12A
>         help
>           Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2
>           devices, aka g12a. Say Y if you want peripherals to work.
> +
> +config COMMON_CLK_A1

Probably should be placed somewhere alphabetically in this file?

> +       bool
> +       depends on ARCH_MESON
> +       select COMMON_CLK_MESON_REGMAP
> +       select COMMON_CLK_MESON_DUALDIV
> +       select COMMON_CLK_MESON_PLL
> +       help
> +         Support for the clock controller on Amlogic A113L device,
> +         aka a1. Say Y if you want peripherals to work.
> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
> index 3939f21..6be3a8f 100644
> --- a/drivers/clk/meson/Makefile
> +++ b/drivers/clk/meson/Makefile
> @@ -19,3 +19,4 @@ obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
>  obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
>  obj-$(CONFIG_COMMON_CLK_G12A) += g12a.o g12a-aoclk.o
>  obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o
> +obj-$(CONFIG_COMMON_CLK_A1) += a1.o

I would guess this should be sorted on Kconfig name in this file?

> diff --git a/drivers/clk/meson/a1.c b/drivers/clk/meson/a1.c
> new file mode 100644
> index 0000000..26edae0f
> --- /dev/null
> +++ b/drivers/clk/meson/a1.c
> @@ -0,0 +1,2617 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/init.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/of_address.h>
> +#include "clk-mpll.h"
> +#include "clk-pll.h"
> +#include "clk-regmap.h"
> +#include "vid-pll-div.h"
> +#include "clk-dualdiv.h"
> +#include "meson-eeclk.h"
> +#include "a1.h"
> +
[...]
> +
> +/*
> + * The Meson A1 HIFI PLL is 614.4M, it requires
> + * a strict register sequence to enable the PLL.
> + * set meson_clk_pcie_pll_ops as its ops

Please remove this last line as it's obvious from the code what ops are
used.

> + */
> +static struct clk_regmap a1_hifi_pll = {
> +       .data = &(struct meson_clk_pll_data){
> +               .en = {
> +                       .reg_off = ANACTRL_HIFIPLL_CTRL0,
> +                       .shift   = 28,
> +                       .width   = 1,
> +               },
> +               .m = {
> +                       .reg_off = ANACTRL_HIFIPLL_CTRL0,
> +                       .shift   = 0,
> +                       .width   = 8,
> +               },
> +               .n = {
> +                       .reg_off = ANACTRL_HIFIPLL_CTRL0,
> +                       .shift   = 10,
> +                       .width   = 5,
> +               },
> +               .frac = {
> +                       .reg_off = ANACTRL_HIFIPLL_CTRL1,
> +                       .shift   = 0,
> +                       .width   = 19,
> +               },
> +               .l = {
> +                       .reg_off = ANACTRL_HIFIPLL_STS,
> +                       .shift   = 31,
> +                       .width   = 1,
> +               },
> +               .table = a1_hifi_pll_params_table,
> +               .init_regs = a1_hifi_init_regs,
> +               .init_count = ARRAY_SIZE(a1_hifi_init_regs),
> +       },
> +       .hw.init = &(struct clk_init_data){
> +               .name = "hifi_pll",
> +               .ops = &meson_clk_pcie_pll_ops,
> +               .parent_hws = (const struct clk_hw *[]) {
> +                       &a1_xtal_hifipll.hw
> +               },
> +               .num_parents = 1,
> +       },
> +};
> +
[..]
> +
> +static struct clk_regmap a1_fclk_div2 = {
> +       .data = &(struct clk_regmap_gate_data){
> +               .offset = ANACTRL_FIXPLL_CTRL0,
> +               .bit_idx = 21,
> +       },
> +       .hw.init = &(struct clk_init_data){
> +               .name = "fclk_div2",
> +               .ops = &clk_regmap_gate_ops,
> +               .parent_hws = (const struct clk_hw *[]) {
> +                       &a1_fclk_div2_div.hw
> +               },
> +               .num_parents = 1,
> +               /*
> +                * add CLK_IS_CRITICAL flag to avoid being disabled by clk core
> +                * or its children clocks.

This comment is useless. Please replace it with an actual reason for
keeping the clk on instead of describing what the flag does.

> +                */
> +               .flags = CLK_IS_CRITICAL,
> +       },
> +};
> +
[..]
> +static struct clk_regmap a1_dmc = {
> +       .data = &(struct clk_regmap_gate_data){
> +               .offset = DMC_CLK_CTRL,
> +               .bit_idx = 8,
> +       },
> +       .hw.init = &(struct clk_init_data) {
> +               .name = "dmc",
> +               .ops = &clk_regmap_gate_ops,
> +               .parent_hws = (const struct clk_hw *[]) {
> +                       &a1_dmc_sel2.hw
> +               },
> +               .num_parents = 1,
> +               /*
> +                * add CLK_IGNORE_UNUSED to avoid hangup
> +                * DDR clock should not change at runtime
> +                */
> +               .flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,

So not CLK_IS_CRITICAL?

> +       },
> +};
> +
[...]
> +
> +/*
> + * cpu clock register base address is 0xfd000080
> + */
> +static struct clk_regmap *const a1_cpu_clk_regmaps[] = {
> +       /* TODO */

Can it be done?

> +};

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
