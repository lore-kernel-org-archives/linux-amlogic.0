Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5C4CD1284
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Apr 2024 16:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6nPxggG/+zWDCZ4dWRvpbsFEtZ4+KHNPhK42ToDxxO8=; b=PqNgbGO+c19rki
	6aziDL3hIdL8xyhmzkfTRo+tDV/sAmLhoMnHqDLNdMeheO41oTNfBc3aMr4gkwOPxzRmpZHDkT3uj
	4JhJPg2w6hXMxHwxWgsdmY2lNQaxECZr4htyi3mhDCwDfHiuoLl2LDsozwFm+De8zvpMeSCGeC+bL
	dVQhUEwuZ5vvqUsKfkGmPN4Q9uzVSnvEmbyx/bHCpZlh9/XN/QrAIFY8doLAJU+vfyq4kFE14nMJc
	9nOtDD04a80zut5nDN2xRuTB81icAoBnX2PcmKAo0jPiHLXrb55A7B6am6ZMSufXFzP69KBbRs0TG
	jupDLUtr2YY8zxY5XfJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrgr7-0000000C0ng-0EUn;
	Tue, 02 Apr 2024 16:19:25 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrgr1-0000000C0ly-1Kaw
	for linux-amlogic@lists.infradead.org;
	Tue, 02 Apr 2024 16:19:22 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-516b6e75dc3so828109e87.3
        for <linux-amlogic@lists.infradead.org>; Tue, 02 Apr 2024 09:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712074756; x=1712679556; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=DqVKcjjjgSIpddqjwQ2CGc9pCIQg9j3BatZ4Fu6ZpaY=;
        b=ei/Lnso0xE9xSAW5s5A4g8il1qX/fR3DYXkHeJW6u5Sudi3egGSFCLph3z+VJYMZUp
         Y1JChNmVcFybLU7YfYt3viKWHHFuosK2byJ3GMwA/LAb4C9R+mpoP4pO6Q0WZvBz/G8n
         8Y0cEOM0YGRxaVcIzcNRncL2GAaPgfzU4M4OV1H/dauL7BJ9F5Mx7+apBKXT6wbjr+ya
         swBAXWEK3kXbVhAE8GCNRB7PMQqQRVP06YOTmKanS6A8vgifdqdb02cIj+148HkpQjYm
         XGOzZC09md1ww0E3Dyx6j/LMjgzvuCKth/TyC2aygFY0G99ggv+Dz6Yyuf99gDuHwkOW
         +3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712074756; x=1712679556;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqVKcjjjgSIpddqjwQ2CGc9pCIQg9j3BatZ4Fu6ZpaY=;
        b=s+AzmSs9iU3FcIgwTjVZAlgjm51uE729KoGxtPRmCloF/Am7AxxxkOfruV6O5Wol49
         9v1tCAhLoeA1LNhxb5ULaXRZl+wclgiA9xYA78hS5mKwUzNabJR1kKOTCjxpSx+W9CNY
         mdc/OKqw+6hMtWHyYc4BMEkHGYTuocXN/azhas8wXBFs0byF4Zyu7271+gWVPi53zvmw
         i/Ya4UMbMqaEFOCJo+o4GHUBzY8aYalsxPO9MmQ7minCdzFo/49u3y6P4yyi7CMReAI0
         D0MOYjk5KSvcRJ5U+H3KKbkCz8LiMJ6Fg7RiPJu94oBK7ZFQGTJKF68d9ulr0a2Ewa+L
         mLMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV/ABZTWlZ5j01cScZLV35b20ptUorQaW14cGpi2nIAFTF+f18+gwiFCgG8v/jnAyFtJj5PuzQTZ329Wl3lQkFNQ9BftLqpJzisnPp4grvT1U=
X-Gm-Message-State: AOJu0YxMng+p1qusFzNvQbZqY8b1BbnzC5aXJLU6ZtmeQ0uo9+pmirJ/
	Sy6GJ8LpgOq2hotOmz/sFxAvW/il3LvfeVJcmXHemPk8gvO1aLwkZEZN9JYPes4=
X-Google-Smtp-Source: AGHT+IHRC3LZXRHIjL0CrBTb4aNw4dg5sWsG/AOGM4jhKL9IoKzMBch70+2GCOgG/SghP6uvuQS2aQ==
X-Received: by 2002:ac2:5501:0:b0:516:a0a2:ba1b with SMTP id j1-20020ac25501000000b00516a0a2ba1bmr5810843lfk.47.1712074756395;
        Tue, 02 Apr 2024 09:19:16 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2b3:4f20:7b45:be58])
        by smtp.gmail.com with ESMTPSA id q15-20020a7bce8f000000b0041547cdfbc7sm9601778wmj.0.2024.04.02.09.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 09:19:15 -0700 (PDT)
References: <20240329205904.25002-1-ddrokosov@salutedevices.com>
 <20240329205904.25002-7-ddrokosov@salutedevices.com>
 <1jv850hyvm.fsf@starbuckisacylon.baylibre.com>
 <20240402110538.ayectwxnhlu6o65d@CAB-WSD-L081021>
 <1jr0fnj11b.fsf@starbuckisacylon.baylibre.com>
 <20240402161110.v7t72s6t7m3bzifi@CAB-WSD-L081021>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, neil.armstrong@linaro.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, kernel@salutedevices.com,
 rockosov@gmail.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 6/6] clk: meson: a1: add Amlogic A1 CPU clock
 controller driver
Date: Tue, 02 Apr 2024 18:17:05 +0200
In-reply-to: <20240402161110.v7t72s6t7m3bzifi@CAB-WSD-L081021>
Message-ID: <1jr0fnpwjg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_091919_508294_345CBCE9 
X-CRM114-Status: GOOD (  35.81  )
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


On Tue 02 Apr 2024 at 19:11, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:

> On Tue, Apr 02, 2024 at 04:11:12PM +0200, Jerome Brunet wrote:
>> 
>> On Tue 02 Apr 2024 at 14:05, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:
>> 
>> > Hello Jerome,
>> >
>> > On Tue, Apr 02, 2024 at 11:35:49AM +0200, Jerome Brunet wrote:
>> >> 
>> >> On Fri 29 Mar 2024 at 23:58, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:
>> >> 
>> >> > The CPU clock controller plays a general role in the Amlogic A1 SoC
>> >> > family by generating CPU clocks. As an APB slave module, it offers the
>> >> > capability to inherit the CPU clock from two sources: the internal fixed
>> >> > clock known as 'cpu fixed clock' and the external input provided by the
>> >> > A1 PLL clock controller, referred to as 'syspll'.
>> >> >
>> >> > It is important for the driver to handle cpu_clk rate switching
>> >> > effectively by transitioning to the CPU fixed clock to avoid any
>> >> > potential execution freezes.
>> >> >
>> >> > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
>> >> > ---
>> >> >  drivers/clk/meson/Kconfig  |  10 ++
>> >> >  drivers/clk/meson/Makefile |   1 +
>> >> >  drivers/clk/meson/a1-cpu.c | 324 +++++++++++++++++++++++++++++++++++++
>> >> >  drivers/clk/meson/a1-cpu.h |  16 ++
>> >> >  4 files changed, 351 insertions(+)
>> >> >  create mode 100644 drivers/clk/meson/a1-cpu.c
>> >> >  create mode 100644 drivers/clk/meson/a1-cpu.h
>> >> >
>> >> > diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>> >> > index 80c4a18c83d2..148d4495eee3 100644
>> >> > --- a/drivers/clk/meson/Kconfig
>> >> > +++ b/drivers/clk/meson/Kconfig
>> >> > @@ -111,6 +111,16 @@ config COMMON_CLK_AXG_AUDIO
>> >> >  	  Support for the audio clock controller on AmLogic A113D devices,
>> >> >  	  aka axg, Say Y if you want audio subsystem to work.
>> >> >  
>> >> > +config COMMON_CLK_A1_CPU
>> >> > +	tristate "Amlogic A1 SoC CPU controller support"
>> >> > +	depends on ARM64
>> >> > +	select COMMON_CLK_MESON_REGMAP
>> >> > +	select COMMON_CLK_MESON_CLKC_UTILS
>> >> > +	help
>> >> > +	  Support for the CPU clock controller on Amlogic A113L based
>> >> > +	  device, A1 SoC Family. Say Y if you want A1 CPU clock controller
>> >> > +	  to work.
>> >> > +
>> >> >  config COMMON_CLK_A1_PLL
>> >> >  	tristate "Amlogic A1 SoC PLL controller support"
>> >> >  	depends on ARM64
>> >> > diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
>> >> > index 4968fc7ad555..2a06eb0303d6 100644
>> >> > --- a/drivers/clk/meson/Makefile
>> >> > +++ b/drivers/clk/meson/Makefile
>> >> > @@ -18,6 +18,7 @@ obj-$(CONFIG_COMMON_CLK_MESON_AUDIO_RSTC) += meson-audio-rstc.o
>> >> >  
>> >> >  obj-$(CONFIG_COMMON_CLK_AXG) += axg.o axg-aoclk.o
>> >> >  obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
>> >> > +obj-$(CONFIG_COMMON_CLK_A1_CPU) += a1-cpu.o
>> >> >  obj-$(CONFIG_COMMON_CLK_A1_PLL) += a1-pll.o
>> >> >  obj-$(CONFIG_COMMON_CLK_A1_PERIPHERALS) += a1-peripherals.o
>> >> >  obj-$(CONFIG_COMMON_CLK_A1_AUDIO) += a1-audio.o
>> >> > diff --git a/drivers/clk/meson/a1-cpu.c b/drivers/clk/meson/a1-cpu.c
>> >> > new file mode 100644
>> >> > index 000000000000..5f5d8ae112e5
>> >> > --- /dev/null
>> >> > +++ b/drivers/clk/meson/a1-cpu.c
>> >> > @@ -0,0 +1,324 @@
>> >> > +// SPDX-License-Identifier: GPL-2.0+
>> >> > +/*
>> >> > + * Amlogic A1 SoC family CPU Clock Controller driver.
>> >> > + *
>> >> > + * Copyright (c) 2024, SaluteDevices. All Rights Reserved.
>> >> > + * Author: Dmitry Rokosov <ddrokosov@salutedevices.com>
>> >> > + */
>> >> > +
>> >> > +#include <linux/clk.h>
>> >> > +#include <linux/clk-provider.h>
>> >> > +#include <linux/mod_devicetable.h>
>> >> > +#include <linux/platform_device.h>
>> >> > +#include "a1-cpu.h"
>> >> > +#include "clk-regmap.h"
>> >> > +#include "meson-clkc-utils.h"
>> >> > +
>> >> > +#include <dt-bindings/clock/amlogic,a1-cpu-clkc.h>
>> >> > +
>> >> > +static u32 cpu_fsource_sel_table[] = { 0, 1, 2 };
>> >> > +static const struct clk_parent_data cpu_fsource_sel_parents[] = {
>> >> > +	{ .fw_name = "xtal" },
>> >> > +	{ .fw_name = "fclk_div2" },
>> >> > +	{ .fw_name = "fclk_div3" },
>> >> > +};
>> >> > +
>> >> > +static struct clk_regmap cpu_fsource_sel0 = {
>> >> > +	.data = &(struct clk_regmap_mux_data) {
>> >> > +		.offset = CPUCTRL_CLK_CTRL0,
>> >> > +		.mask = 0x3,
>> >> > +		.shift = 0,
>> >> > +		.table = cpu_fsource_sel_table,
>> >> > +	},
>> >> > +	.hw.init = &(struct clk_init_data) {
>> >> > +		.name = "cpu_fsource_sel0",
>> >> > +		.ops = &clk_regmap_mux_ops,
>> >> > +		.parent_data = cpu_fsource_sel_parents,
>> >> > +		.num_parents = ARRAY_SIZE(cpu_fsource_sel_parents),
>> >> > +		.flags = CLK_SET_RATE_PARENT,
>> >> > +	},
>> >> > +};
>> >> > +
>> >> > +static struct clk_regmap cpu_fsource_div0 = {
>> >> > +	.data = &(struct clk_regmap_div_data) {
>> >> > +		.offset = CPUCTRL_CLK_CTRL0,
>> >> > +		.shift = 4,
>> >> > +		.width = 6,
>> >> > +	},
>> >> > +	.hw.init = &(struct clk_init_data) {
>> >> > +		.name = "cpu_fsource_div0",
>> >> > +		.ops = &clk_regmap_divider_ops,
>> >> > +		.parent_hws = (const struct clk_hw *[]) {
>> >> > +			&cpu_fsource_sel0.hw
>> >> > +		},
>> >> > +		.num_parents = 1,
>> >> > +		.flags = CLK_SET_RATE_PARENT,
>> >> > +	},
>> >> > +};
>> >> > +
>> >> > +static struct clk_regmap cpu_fsel0 = {
>> >> > +	.data = &(struct clk_regmap_mux_data) {
>> >> > +		.offset = CPUCTRL_CLK_CTRL0,
>> >> > +		.mask = 0x1,
>> >> > +		.shift = 2,
>> >> > +	},
>> >> > +	.hw.init = &(struct clk_init_data) {
>> >> > +		.name = "cpu_fsel0",
>> >> > +		.ops = &clk_regmap_mux_ops,
>> >> > +		.parent_hws = (const struct clk_hw *[]) {
>> >> > +			&cpu_fsource_sel0.hw,
>> >> > +			&cpu_fsource_div0.hw,
>> >> > +		},
>> >> > +		.num_parents = 2,
>> >> > +		.flags = CLK_SET_RATE_PARENT,
>> >> > +	},
>> >> > +};
>> >> > +
>> >> > +static struct clk_regmap cpu_fsource_sel1 = {
>> >> > +	.data = &(struct clk_regmap_mux_data) {
>> >> > +		.offset = CPUCTRL_CLK_CTRL0,
>> >> > +		.mask = 0x3,
>> >> > +		.shift = 16,
>> >> > +		.table = cpu_fsource_sel_table,
>> >> > +	},
>> >> > +	.hw.init = &(struct clk_init_data) {
>> >> > +		.name = "cpu_fsource_sel1",
>> >> > +		.ops = &clk_regmap_mux_ops,
>> >> > +		.parent_data = cpu_fsource_sel_parents,
>> >> > +		.num_parents = ARRAY_SIZE(cpu_fsource_sel_parents),
>> >> > +		.flags = CLK_SET_RATE_PARENT,
>> >> > +	},
>> >> > +};
>> >> > +
>> >> > +static struct clk_regmap cpu_fsource_div1 = {
>> >> > +	.data = &(struct clk_regmap_div_data) {
>> >> > +		.offset = CPUCTRL_CLK_CTRL0,
>> >> > +		.shift = 20,
>> >> > +		.width = 6,
>> >> > +	},
>> >> > +	.hw.init = &(struct clk_init_data) {
>> >> > +		.name = "cpu_fsource_div1",
>> >> > +		.ops = &clk_regmap_divider_ops,
>> >> > +		.parent_hws = (const struct clk_hw *[]) {
>> >> > +			&cpu_fsource_sel1.hw
>> >> > +		},
>> >> > +		.num_parents = 1,
>> >> > +		.flags = CLK_SET_RATE_PARENT,
>> >> > +	},
>> >> > +};
>> >> > +
>> >> > +static struct clk_regmap cpu_fsel1 = {
>> >> > +	.data = &(struct clk_regmap_mux_data) {
>> >> > +		.offset = CPUCTRL_CLK_CTRL0,
>> >> > +		.mask = 0x1,
>> >> > +		.shift = 18,
>> >> > +	},
>> >> > +	.hw.init = &(struct clk_init_data) {
>> >> > +		.name = "cpu_fsel1",
>> >> > +		.ops = &clk_regmap_mux_ops,
>> >> > +		.parent_hws = (const struct clk_hw *[]) {
>> >> > +			&cpu_fsource_sel1.hw,
>> >> > +			&cpu_fsource_div1.hw,
>> >> > +		},
>> >> > +		.num_parents = 2,
>> >> > +		.flags = CLK_SET_RATE_PARENT,
>> >> > +	},
>> >> > +};
>> >> > +
>> >> > +static struct clk_regmap cpu_fclk = {
>> >> > +	.data = &(struct clk_regmap_mux_data) {
>> >> > +		.offset = CPUCTRL_CLK_CTRL0,
>> >> > +		.mask = 0x1,
>> >> > +		.shift = 10,
>> >> > +	},
>> >> > +	.hw.init = &(struct clk_init_data) {
>> >> > +		.name = "cpu_fclk",
>> >> > +		.ops = &clk_regmap_mux_ops,
>> >> > +		.parent_hws = (const struct clk_hw *[]) {
>> >> > +			&cpu_fsel0.hw,
>> >> > +			&cpu_fsel1.hw,
>> >> > +		},
>> >> > +		.num_parents = 2,
>> >> > +		.flags = CLK_SET_RATE_PARENT,
>> >> > +	},
>> >> > +};
>> >> > +
>> >> > +static struct clk_regmap cpu_clk = {
>> >> > +	.data = &(struct clk_regmap_mux_data) {
>> >> > +		.offset = CPUCTRL_CLK_CTRL0,
>> >> > +		.mask = 0x1,
>> >> > +		.shift = 11,
>> >> > +	},
>> >> > +	.hw.init = &(struct clk_init_data) {
>> >> > +		.name = "cpu_clk",
>> >> > +		.ops = &clk_regmap_mux_ops,
>> >> > +		.parent_data = (const struct clk_parent_data []) {
>> >> > +			{ .hw = &cpu_fclk.hw },
>> >> > +			{ .fw_name = "sys_pll", },
>> >> > +		},
>> >> > +		.num_parents = 2,
>> >> > +		.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>> >> > +	},
>> >> > +};
>> >> > +
>> >> > +/* Array of all clocks registered by this provider */
>> >> > +static struct clk_hw *a1_cpu_hw_clks[] = {
>> >> > +	[CLKID_CPU_FSOURCE_SEL0]	= &cpu_fsource_sel0.hw,
>> >> > +	[CLKID_CPU_FSOURCE_DIV0]	= &cpu_fsource_div0.hw,
>> >> > +	[CLKID_CPU_FSEL0]		= &cpu_fsel0.hw,
>> >> > +	[CLKID_CPU_FSOURCE_SEL1]	= &cpu_fsource_sel1.hw,
>> >> > +	[CLKID_CPU_FSOURCE_DIV1]	= &cpu_fsource_div1.hw,
>> >> > +	[CLKID_CPU_FSEL1]		= &cpu_fsel1.hw,
>> >> > +	[CLKID_CPU_FCLK]		= &cpu_fclk.hw,
>> >> > +	[CLKID_CPU_CLK]			= &cpu_clk.hw,
>> >> > +};
>> >> > +
>> >> > +static struct clk_regmap *const a1_cpu_regmaps[] = {
>> >> > +	&cpu_fsource_sel0,
>> >> > +	&cpu_fsource_div0,
>> >> > +	&cpu_fsel0,
>> >> > +	&cpu_fsource_sel1,
>> >> > +	&cpu_fsource_div1,
>> >> > +	&cpu_fsel1,
>> >> > +	&cpu_fclk,
>> >> > +	&cpu_clk,
>> >> > +};
>> >> > +
>> >> > +static struct regmap_config a1_cpu_regmap_cfg = {
>> >> > +	.reg_bits   = 32,
>> >> > +	.val_bits   = 32,
>> >> > +	.reg_stride = 4,
>> >> > +	.max_register = CPUCTRL_CLK_CTRL1,
>> >> > +};
>> >> > +
>> >> > +static struct meson_clk_hw_data a1_cpu_clks = {
>> >> > +	.hws = a1_cpu_hw_clks,
>> >> > +	.num = ARRAY_SIZE(a1_cpu_hw_clks),
>> >> > +};
>> >> > +
>> >> > +struct a1_cpu_clk_nb_data {
>> >> > +	const struct clk_ops *mux_ops;
>> >> 
>> >> That's fishy ...
>> >> 
>> >> > +	struct clk_hw *cpu_clk;
>> >> > +	struct notifier_block nb;
>> >> > +	u8 parent;
>> >> > +};
>> >> > +
>> >> > +#define MESON_A1_CPU_CLK_GET_PARENT(nbd) \
>> >> > +	((nbd)->mux_ops->get_parent((nbd)->cpu_clk))
>> >> > +#define MESON_A1_CPU_CLK_SET_PARENT(nbd, index) \
>> >> > +	((nbd)->mux_ops->set_parent((nbd)->cpu_clk, index))
>> >> 
>> >> ... Directly going for the mux ops ??!?? No way !
>> >> 
>> >> We have a framework to handle the clocks, the whole point is to use it,
>> >> not bypass it ! 
>> >> 
>> >
>> > I suppose you understand my approach, which is quite similar to what is
>> > happening in the Mediatek driver:
>> >
>> > https://elixir.bootlin.com/linux/latest/source/drivers/clk/mediatek/clk-mux.c#L295
>> >
>> > Initially, I attempted to set the parent using the clk_set_parent() API.
>> > However, I encountered a problem with recursive calling of the
>> > notifier_block. This issue arises because the parent triggers
>> > notifications for its children, leading to repeated calls to the
>> > notifier_block.
>> >
>> > I find it puzzling why I cannot call an internal function or callback
>> > within the internal driver context. After all, the notifier block is
>> > just a part of the set_rate() flow. From a global Clock Control
>> > Framework perspective, the context should not change.
>> 
>> I don't care what MTK is doing TBH. Forcefully calling ops on a clock,
>> hoping they are going to match with the clock type is wrong.
>> 
>> There is a clk_hw API. Please it.
>> 
>
> Yes, if sys_pll has a notifier_block instead of cpu_clk, there will be
> no problem with the clk_hw API.
>
> I will rework that point.
>
>> >
>> >> > +
>> >> > +static int meson_a1_cpu_clk_notifier_cb(struct notifier_block *nb,
>> >> > +					unsigned long event, void *data)
>> >> > +{
>> >> > +	struct a1_cpu_clk_nb_data *nbd;
>> >> > +	int ret = 0;
>> >> > +
>> >> > +	nbd = container_of(nb, struct a1_cpu_clk_nb_data, nb);
>> >> > +
>> >> > +	switch (event) {
>> >> > +	case PRE_RATE_CHANGE:
>> >> > +		nbd->parent = MESON_A1_CPU_CLK_GET_PARENT(nbd);
>> >> > +		/* Fallback to the CPU fixed clock */
>> >> > +		ret = MESON_A1_CPU_CLK_SET_PARENT(nbd, 0);
>> >> > +		/* Wait for clock propagation */
>> >> > +		udelay(100);
>> >> > +		break;
>> >> > +
>> >> > +	case POST_RATE_CHANGE:
>> >> > +	case ABORT_RATE_CHANGE:
>> >> > +		/* Back to the original parent clock */
>> >> > +		ret = MESON_A1_CPU_CLK_SET_PARENT(nbd, nbd->parent);
>> >> > +		/* Wait for clock propagation */
>> >> > +		udelay(100);
>> >> > +		break;
>> >> > +
>> >> > +	default:
>> >> > +		pr_warn("Unknown event %lu for %s notifier block\n",
>> >> > +			event, clk_hw_get_name(nbd->cpu_clk));
>> >> > +		break;
>> >> > +	}
>> >> > +
>> >> > +	return notifier_from_errno(ret);
>> >> > +}
>> >> > +
>> >> > +static struct a1_cpu_clk_nb_data a1_cpu_clk_nb_data = {
>> >> > +	.mux_ops = &clk_regmap_mux_ops,
>> >> > +	.cpu_clk = &cpu_clk.hw,
>> >> > +	.nb.notifier_call = meson_a1_cpu_clk_notifier_cb,
>> >> > +};
>> >> > +
>> >> > +static int meson_a1_dvfs_setup(struct platform_device *pdev)
>> >> > +{
>> >> > +	struct device *dev = &pdev->dev;
>> >> > +	struct clk *notifier_clk;
>> >> > +	int ret;
>> >> > +
>> >> > +	/* Setup clock notifier for cpu_clk */
>> >> > +	notifier_clk = devm_clk_hw_get_clk(dev, &cpu_clk.hw, "dvfs");
>> >> > +	if (IS_ERR(notifier_clk))
>> >> > +		return dev_err_probe(dev, PTR_ERR(notifier_clk),
>> >> > +				     "can't get cpu_clk as notifier clock\n");
>> >> > +
>> >> > +	ret = devm_clk_notifier_register(dev, notifier_clk,
>> >> > +					 &a1_cpu_clk_nb_data.nb);
>> >> > +	if (ret)
>> >> > +		return dev_err_probe(dev, ret,
>> >> > +				     "can't register cpu_clk notifier\n");
>> >> > +
>> >> > +	return ret;
>> >> > +}
>> >> > +
>> >> > +static int meson_a1_cpu_probe(struct platform_device *pdev)
>> >> > +{
>> >> > +	struct device *dev = &pdev->dev;
>> >> > +	void __iomem *base;
>> >> > +	struct regmap *map;
>> >> > +	int clkid, i, err;
>> >> > +
>> >> > +	base = devm_platform_ioremap_resource(pdev, 0);
>> >> > +	if (IS_ERR(base))
>> >> > +		return dev_err_probe(dev, PTR_ERR(base),
>> >> > +				     "can't ioremap resource\n");
>> >> > +
>> >> > +	map = devm_regmap_init_mmio(dev, base, &a1_cpu_regmap_cfg);
>> >> > +	if (IS_ERR(map))
>> >> > +		return dev_err_probe(dev, PTR_ERR(map),
>> >> > +				     "can't init regmap mmio region\n");
>> >> > +
>> >> > +	/* Populate regmap for the regmap backed clocks */
>> >> > +	for (i = 0; i < ARRAY_SIZE(a1_cpu_regmaps); i++)
>> >> > +		a1_cpu_regmaps[i]->map = map;
>> >> > +
>> >> > +	for (clkid = 0; clkid < a1_cpu_clks.num; clkid++) {
>> >> > +		err = devm_clk_hw_register(dev, a1_cpu_clks.hws[clkid]);
>> >> > +		if (err)
>> >> > +			return dev_err_probe(dev, err,
>> >> > +					     "clock[%d] registration failed\n",
>> >> > +					     clkid);
>> >> > +	}
>> >> > +
>> >> > +	err = devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, &a1_cpu_clks);
>> >> > +	if (err)
>> >> > +		return dev_err_probe(dev, err, "can't add clk hw provider\n");
>> >> 
>> >> I wonder if there is a window of opportunity to poke the syspll without
>> >> your notifier here. That being said, the situation would be similar on g12.
>> >> 
>> >
>> > Yes, I have taken into account what you did in the G12A CPU clock
>> > relations. My thoughts were that it might not be applicable for the A1
>> > case. This is because the sys_pll should be located in a different
>> > driver from a logical perspective. Consequently, we cannot configure the
>> > sys_pll notifier block to manage the cpu_clk from a different driver.
>> > However, if I were to move the sys_pll clock object to the A1 CPU clock
>> > controller, I believe the g12a sys_pll notifier approach would work.
>> >
>> 
>> I fail to see the connection between the number of device and the
>> approach you took.
>> 
>> 
>> >> > +
>> >> > +	return meson_a1_dvfs_setup(pdev);
>> >> 
>> >> 
>> >> 
>> >> > +}
>> >> > +
>> >> > +static const struct of_device_id a1_cpu_clkc_match_table[] = {
>> >> > +	{ .compatible = "amlogic,a1-cpu-clkc", },
>> >> > +	{}
>> >> > +};
>> >> > +MODULE_DEVICE_TABLE(of, a1_cpu_clkc_match_table);
>> >> > +
>> >> > +static struct platform_driver a1_cpu_clkc_driver = {
>> >> > +	.probe = meson_a1_cpu_probe,
>> >> > +	.driver = {
>> >> > +		.name = "a1-cpu-clkc",
>> >> > +		.of_match_table = a1_cpu_clkc_match_table,
>> >> > +	},
>> >> > +};
>> >> > +
>> >> > +module_platform_driver(a1_cpu_clkc_driver);
>> >> > +MODULE_AUTHOR("Dmitry Rokosov <ddrokosov@salutedevices.com>");
>> >> > +MODULE_LICENSE("GPL");
>> >> > diff --git a/drivers/clk/meson/a1-cpu.h b/drivers/clk/meson/a1-cpu.h
>> >> > new file mode 100644
>> >> > index 000000000000..e9af4117e26f
>> >> > --- /dev/null
>> >> > +++ b/drivers/clk/meson/a1-cpu.h
>> >> 
>> >> There is not point putting the definition here in a header
>> >> These are clearly not going to be shared with another driver.
>> >> 
>> >> Please drop this file
>> >> 
>> >
>> > The same approach was applied to the Peripherals and PLL A1 drivers.
>> > Honestly, I am not a fan of having different file organization within a
>> > single logical code folder.
>> >
>> > Please refer to:
>> >
>> > drivers/clk/meson/a1-peripherals.h
>> > drivers/clk/meson/a1-pll.h
>> 
>> I understand. There was a time where it made sense, some definition
>> could have been shared back then. This is no longer the case and it
>> would probably welcome a rework.
>> 
>> ... and again, just pointing to another code does really invalidate my
>>  point.
>> 
>> >
>> >> > @@ -0,0 +1,16 @@
>> >> > +/* SPDX-License-Identifier: GPL-2.0+ */
>> >> > +/*
>> >> > + * Amlogic A1 CPU Clock Controller internals
>> >> > + *
>> >> > + * Copyright (c) 2024, SaluteDevices. All Rights Reserved.
>> >> > + * Author: Dmitry Rokosov <ddrokosov@salutedevices.com>
>> >> > + */
>> >> > +
>> >> > +#ifndef __A1_CPU_H
>> >> > +#define __A1_CPU_H
>> >> > +
>> >> > +/* cpu clock controller register offset */
>> >> > +#define CPUCTRL_CLK_CTRL0	0x80
>> >> > +#define CPUCTRL_CLK_CTRL1	0x84
>> >> 
>> >> You are claiming the registers from 0x00 to 0x84 (included), but only
>> >> using these 2 registers ? What is the rest ? Are you sure there is only
>> >> clocks in there ?
>> >> 
>> >
>> > Yes, unfortunately, the register map for this IP is not described in the
>> > A1 Datasheet. The only available information about it can be found in
>> > the vendor clock driver, which provides details for only two registers
>> > used to configure the CPU clock.
>> >
>> > From vendor kernel dtsi:
>> >
>> > 	clkc: clock-controller {
>> > 		compatible = "amlogic,a1-clkc";
>> > 		#clock-cells = <1>;
>> > 		reg = <0x0 0xfe000800 0x0 0x100>,
>> > 		      <0x0 0xfe007c00 0x0 0x21c>,
>> > 		      <0x0 0xfd000000 0x0 0x88>; <==== CPU clock regmap
>> > 		reg-names = "basic", "pll",
>> > 			    "cpu_clk";
>> > 		clocks = <&xtal>;
>> > 		clock-names = "core";
>> > 		status = "okay";
>> > 	};
>> >
>> > From vendor clkc driver:
>> >
>> > 	/*
>> > 	 * CPU clok register offset
>> > 	 * APB_BASE:  APB1_BASE_ADDR = 0xfd000000
>> > 	 */
>> >
>> > 	#define CPUCTRL_CLK_CTRL0		0x80
>> > 	#define CPUCTRL_CLK_CTRL1		0x84
>> 
>> If you had clock in 0x0 and 0x80, then I would agree claiming 0x0-0x88
>> is reasonable, even if you don't really know what is in between. It
>> would be a fair assumption.
>> 
>> It is not the case here.
>> For all we know it could resets, power domains, etc ...
>> 
>
> However, we do not have any information indicating that the gap from
> 0x00-0x80 contains additional registers. It is possible that there are
> internal registers, but they are not mentioned in the vendor datasheet
> or driver. Therefore, in this case, I personally prefer to rely on the
> vendor mapping.

I understand your preference. My request remains.

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
