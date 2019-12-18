Return-Path: <SRS0=A4ao=2I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87581C43603
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 07:21:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 582ED206B7
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 07:21:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d5yNfUZi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 582ED206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vYB7TwVxOKTfy66cnU9KCebETBAYO/Ehd3ft6e3poNM=; b=d5yNfUZiM/BYcBf3K595rejv8
	cg90aSZ/tU8Vr7cwdXUV0XAKUQxuA3w+rxdjEOAXWkeyzI42oVBExBozYkHE7wPouWK/5v1hR/TGe
	UF9Ozk+MlYeRpNh8+i2oeEgZSgwlEm6PelAS/9Wbsa5y48s0Bz+QV0ZvHatT2bIh7RH94C8zNPoRJ
	WuwxeRoxWgbi3ggQ2nfV+h8IzoCaLRZpbkbx71ejKSKrlxuVOq1aWNY6bh3nGBzrB0hBPhb9rMv53
	Fxg7JHUMr2BB0xXA8suTVteFgEmgWagwPPRhB6p2clswFx7++NoN8w2ZLIVOfGjfBXmdHHevP34Io
	KEZiYhneg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihTdc-00054e-M7; Wed, 18 Dec 2019 07:20:52 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihTdO-0004sj-79; Wed, 18 Dec 2019 07:20:41 +0000
Received: from [10.28.39.99] (10.28.39.99) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 18 Dec
 2019 15:20:49 +0800
Subject: Re: [PATCH v4 6/6] clk: meson: a1: add support for Amlogic A1
 Peripheral clock driver
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>
References: <20191206074052.15557-1-jian.hu@amlogic.com>
 <20191206074052.15557-7-jian.hu@amlogic.com>
 <1j36dplsec.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
Message-ID: <fc5ab1b2-d4ee-0ebd-4788-4f0ae6d375bf@amlogic.com>
Date: Wed, 18 Dec 2019 15:20:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1j36dplsec.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
X-Originating-IP: [10.28.39.99]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191217_232040_068853_8044CF56 
X-CRM114-Status: GOOD (  18.76  )
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
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Qiufang Dai <qiufang.dai@amlogic.com>,
 Chandle Zou <chandle.zou@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 2019/12/12 19:01, Jerome Brunet wrote:
> 
> On Fri 06 Dec 2019 at 08:40, Jian Hu <jian.hu@amlogic.com> wrote:
> 
>> Add Amlogic Meson A1 peripheral clock driver, it depends
>> on the A1 PLL driver.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   drivers/clk/meson/Kconfig  |   10 +
>>   drivers/clk/meson/Makefile |    1 +
>>   drivers/clk/meson/a1.c     | 2246 ++++++++++++++++++++++++++++++++++++
>>   drivers/clk/meson/a1.h     |  120 ++
>>   4 files changed, 2377 insertions(+)
>>   create mode 100644 drivers/clk/meson/a1.c
>>   create mode 100644 drivers/clk/meson/a1.h
>>
>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>> index 14e7936ae18e..d6b2b51316b7 100644
>> --- a/drivers/clk/meson/Kconfig
>> +++ b/drivers/clk/meson/Kconfig
>> @@ -103,6 +103,16 @@ config COMMON_CLK_A1_PLL
>>   	  Support for the PLL clock controller on Amlogic A113L device,
>>   	  aka a1. Say Y if you want PLL to work.
>>   
>> +config COMMON_CLK_A1
>> +	bool
>> +	depends on ARCH_MESON
>> +	select COMMON_CLK_MESON_EE_CLKC
>> +	select COMMON_CLK_MESON_DUALDIV
>> +	select COMMON_CLK_MESON_REGMAP
>> +	help
>> +	  Support for the Peripheral clock controller on Amlogic A113L device,
>> +	  aka a1. Say Y if you want Peripherals to work.
>> +
>>   config COMMON_CLK_G12A
>>   	bool
>>   	depends on ARCH_MESON
>> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
>> index 71d3b8e6fb8a..0f3890030118 100644
>> --- a/drivers/clk/meson/Makefile
>> +++ b/drivers/clk/meson/Makefile
>> @@ -17,6 +17,7 @@ obj-$(CONFIG_COMMON_CLK_MESON_VID_PLL_DIV) += vid-pll-div.o
>>   obj-$(CONFIG_COMMON_CLK_AXG) += axg.o axg-aoclk.o
>>   obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
>>   obj-$(CONFIG_COMMON_CLK_A1_PLL) += a1-pll.o
>> +obj-$(CONFIG_COMMON_CLK_A1) += a1.o
>>   obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
>>   obj-$(CONFIG_COMMON_CLK_G12A) += g12a.o g12a-aoclk.o
>>   obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o
>> diff --git a/drivers/clk/meson/a1.c b/drivers/clk/meson/a1.c
>> new file mode 100644
>> index 000000000000..76fa5a9e74a5
>> --- /dev/null
>> +++ b/drivers/clk/meson/a1.c
>> @@ -0,0 +1,2246 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
>> + * Author: Jian Hu <jian.hu@amlogic.com>
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include "a1.h"
>> +#include "clk-dualdiv.h"
>> +#include "meson-eeclk.h"
>> +
>> +/* PLLs clock in gates, its parent is xtal */
>> +static struct clk_regmap a1_xtal_clktree = {
>> +	.data = &(struct clk_regmap_gate_data){
>> +		.offset = SYS_OSCIN_CTRL,
>> +		.bit_idx = 0,
>> +	},
>> +	.hw.init = &(struct clk_init_data) {
>> +		.name = "xtal_clktree",
>> +		.ops = &clk_regmap_gate_ro_ops,
>> +		.parent_data = &(const struct clk_parent_data) {
>> +			.fw_name = "xtal",
>> +		},
>> +		.num_parents = 1,
>> +	},
>> +};
>> +
>> +static struct clk_regmap a1_xtal_fixpll = {
>> +	.data = &(struct clk_regmap_gate_data){
>> +		.offset = SYS_OSCIN_CTRL,
>> +		.bit_idx = 1,
>> +	},
>> +	.hw.init = &(struct clk_init_data) {
>> +		.name = "xtal_fixpll",
>> +		.ops = &clk_regmap_gate_ro_ops,
>> +		.parent_data = &(const struct clk_parent_data) {
>> +			.fw_name = "xtal",
>> +		},
>> +		.num_parents = 1,
>> +	},
>> +};
>> +
>> +static struct clk_regmap a1_xtal_usb_phy = {
>> +	.data = &(struct clk_regmap_gate_data){
>> +		.offset = SYS_OSCIN_CTRL,
>> +		.bit_idx = 2,
>> +	},
>> +	.hw.init = &(struct clk_init_data) {
>> +		.name = "xtal_usb_phy",
>> +		.ops = &clk_regmap_gate_ops,
>> +		.parent_data = &(const struct clk_parent_data) {
>> +			.fw_name = "xtal",
>> +		},
>> +		.num_parents = 1,
>> +	},
>> +};
>> +
>> +static struct clk_regmap a1_xtal_usb_ctrl = {
>> +	.data = &(struct clk_regmap_gate_data){
>> +		.offset = SYS_OSCIN_CTRL,
>> +		.bit_idx = 3,
>> +	},
>> +	.hw.init = &(struct clk_init_data) {
>> +		.name = "xtal_usb_ctrl",
>> +		.ops = &clk_regmap_gate_ops,
>> +		.parent_data = &(const struct clk_parent_data) {
>> +			.fw_name = "xtal",
>> +		},
>> +		.num_parents = 1,
>> +	},
>> +};
>> +
>> +static struct clk_regmap a1_xtal_hifipll = {
>> +	.data = &(struct clk_regmap_gate_data){
>> +		.offset = SYS_OSCIN_CTRL,
>> +		.bit_idx = 4,
>> +	},
>> +	.hw.init = &(struct clk_init_data) {
>> +		.name = "xtal_hifipll",
>> +		.ops = &clk_regmap_gate_ops,
>> +		.parent_data = &(const struct clk_parent_data) {
>> +			.fw_name = "xtal",
>> +		},
>> +		.num_parents = 1,
>> +	},
>> +};
>> +
>> +static struct clk_regmap a1_xtal_syspll = {
>> +	.data = &(struct clk_regmap_gate_data){
>> +		.offset = SYS_OSCIN_CTRL,
>> +		.bit_idx = 5,
>> +	},
>> +	.hw.init = &(struct clk_init_data) {
>> +		.name = "xtal_syspll",
>> +		.ops = &clk_regmap_gate_ops,
>> +		.parent_data = &(const struct clk_parent_data) {
>> +			.fw_name = "xtal",
>> +		},
>> +		.num_parents = 1,
>> +	},
>> +};
>> +
>> +static struct clk_regmap a1_xtal_dds = {
>> +	.data = &(struct clk_regmap_gate_data){
>> +		.offset = SYS_OSCIN_CTRL,
>> +		.bit_idx = 6,
>> +	},
>> +	.hw.init = &(struct clk_init_data) {
>> +		.name = "xtal_dds",
>> +		.ops = &clk_regmap_gate_ops,
>> +		.parent_data = &(const struct clk_parent_data) {
>> +			.fw_name = "xtal",
>> +		},
>> +		.num_parents = 1,
>> +	},
>> +};
>> +
>> +static const struct clk_parent_data sys_clk_parents[] = {
>> +	{ .fw_name = "xtal" },
>> +	{ .fw_name = "fclk_div2"},
>> +	{ .fw_name = "fclk_div3"},
>> +	{ .fw_name = "fclk_div5"},
>> +};
>> +
>> +static struct clk_regmap a1_sys_b_sel = {
>> +	.data = &(struct clk_regmap_mux_data){
>> +		.offset = SYS_CLK_CTRL0,
>> +		.mask = 0x7,
>> +		.shift = 26,
>> +	},
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "sys_b_sel",
>> +		.ops = &clk_regmap_mux_ro_ops,
>> +		.parent_data = sys_clk_parents,
>> +		.num_parents = ARRAY_SIZE(sys_clk_parents),
>> +	},
>> +};
>> +
>> +static struct clk_regmap a1_sys_b_div = {
>> +	.data = &(struct clk_regmap_div_data){
>> +		.offset = SYS_CLK_CTRL0,
>> +		.shift = 16,
>> +		.width = 10,
>> +	},
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "sys_b_div",
>> +		.ops = &clk_regmap_divider_ops,
>> +		.parent_hws = (const struct clk_hw *[]) {
>> +			&a1_sys_b_sel.hw
>> +		},
>> +		.num_parents = 1,
>> +		.flags = CLK_SET_RATE_PARENT,
>> +	},
>> +};
>> +
>> +static struct clk_regmap a1_sys_b = {
>> +	.data = &(struct clk_regmap_gate_data){
>> +		.offset = SYS_CLK_CTRL0,
>> +		.bit_idx = 29,
>> +	},
>> +	.hw.init = &(struct clk_init_data) {
>> +		.name = "sys_b",
>> +		.ops = &clk_regmap_gate_ops,
>> +		.parent_hws = (const struct clk_hw *[]) {
>> +			&a1_sys_b_div.hw
>> +		},
>> +		.num_parents = 1,
>> +		/*
>> +		 * This clock is used by APB bus which setted in Romcode
>> +		 * and is required by the platform to operate correctly.
>> +		 * Until the following condition are met, we need this clock to
>> +		 * be marked as critical:
>> +		 * a) Mark the clock used by a firmware resource, if possible
>> +		 * b) CCF has a clock hand-off mechanism to make the sure the
>> +		 *    clock stays on until the proper driver comes along
>> +		 */
>> +		.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>> +	},
>> +};
>> +
>> +static struct clk_regmap a1_sys_a_sel = {
>> +	.data = &(struct clk_regmap_mux_data){
>> +		.offset = SYS_CLK_CTRL0,
>> +		.mask = 0x7,
>> +		.shift = 10,
>> +	},
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "sys_a_sel",
>> +		.ops = &clk_regmap_mux_ro_ops,
>> +		.parent_data = sys_clk_parents,
>> +		.num_parents = ARRAY_SIZE(sys_clk_parents),
>> +	},
>> +};
>> +
>> +static struct clk_regmap a1_sys_a_div = {
>> +	.data = &(struct clk_regmap_div_data){
>> +		.offset = SYS_CLK_CTRL0,
>> +		.shift = 0,
>> +		.width = 10,
>> +	},
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "sys_a_div",
>> +		.ops = &clk_regmap_divider_ops,
>> +		.parent_hws = (const struct clk_hw *[]) {
>> +			&a1_sys_a_sel.hw
>> +		},
>> +		.num_parents = 1,
>> +		.flags = CLK_SET_RATE_PARENT,
>> +	},
>> +};
>> +
>> +static struct clk_regmap a1_sys_a = {
>> +	.data = &(struct clk_regmap_gate_data){
>> +		.offset = SYS_CLK_CTRL0,
>> +		.bit_idx = 13,
>> +	},
>> +	.hw.init = &(struct clk_init_data) {
>> +		.name = "sys_a",
>> +		.ops = &clk_regmap_gate_ops,
>> +		.parent_hws = (const struct clk_hw *[]) {
>> +			&a1_sys_a_div.hw
>> +		},
>> +		.num_parents = 1,
>> +		/*
>> +		 * This clock is used by APB bus which setted in Romcode
>> +		 * and is required by the platform to operate correctly.
> 
> #1 It weird that both sys_a and sys_b are critical, Only the leaf needs
>   to be critical which, AFAICT, is a1_sys_clk.
> 
> #2 Like on the other controller: What the clock is needed for needs is
>   needed for for each critical clock, but the explanation below needs to
>   appear only once and can be refered to afterward.
> 
OK, I will remove the flag CLK_IS_CRITICAL for a1_sys_a and a1_sys_b.
And add it for a1_sys_clk.
>> +		 * Until the following condition are met, we need this clock to
>> +		 * be marked as critical:
>> +		 * a) Mark the clock used by a firmware resource, if possible
>> +		 * b) CCF has a clock hand-off mechanism to make the sure the
>> +		 *    clock stays on until the proper driver comes along
>> +		 */
>> +		.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>> +	},
>> +};
>> +
>> +static struct clk_regmap a1_sys_clk = {
>> +	.data = &(struct clk_regmap_mux_data){
>> +		.offset = SYS_CLK_CTRL0,
>> +		.mask = 0x1,
>> +		.shift = 31,
>> +	},
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "sys_clk",
>> +		.ops = &clk_regmap_mux_ro_ops,
>> +		.parent_hws = (const struct clk_hw *[]) {
>> +			&a1_sys_a.hw, &a1_sys_b.hw,
>> +		},
>> +		.num_parents = 2,
>> +		.flags = CLK_SET_RATE_PARENT,
>> +	},
>> +};
>> +
[...]
> .
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
