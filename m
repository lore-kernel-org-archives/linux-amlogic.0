Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163E7C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Nov 2022 12:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FKXeHcECHWGuEKgw9RK9us5BJsCpAQ4W9ITOf9jpS5w=; b=EYdtyBOeZkZ6+1
	o/x6gtfqAF7NxCb6LI3yf1bGaZapasA6j/5dGlyXnBs1GqTPGpk+v45D9ecISxmMOgb4tUaRdl3BF
	M9XNqAMWks34HIll6PsPm6sBzTAIcnJvT9Wc9qJAecahKWVte89xi3celNx5mHexEFN9avb7+Kw1S
	WMnwps7z46R/IjEhO+0UKTxR/f3yTgSpxr1Cdt6e/I8r3Dx5gUIVbP88Ac9NQcPQ4CTdUBLbqoDaw
	JhqUubJZVwRALoh/v2ENhqlvrogks9JVNKm/X4FO+1WPgeWCujVJNIp+KiAfwyil0tPIeHeKZsclX
	1ET1J/OLyWl7lgXGqcyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozdKS-001Y6P-Sg; Mon, 28 Nov 2022 12:33:44 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozdKH-001Y2q-DB
	for linux-amlogic@lists.infradead.org; Mon, 28 Nov 2022 12:33:35 +0000
Received: by mail-wm1-x330.google.com with SMTP id r66-20020a1c4445000000b003d05a3775d4so2043541wma.3
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Nov 2022 04:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=+gmo9nIirdbed4J/LDnU4BNvdJRcxPBpHK1YwQWHx3A=;
        b=Ov/KaEuWs1Y8eHtYdGfDUCbL84zNHUFESCRmPJbwiL4b4IkVYPUs0G1f90nHsfQ/zv
         ehKTVNWofEcOeyX9H++dsbFfqvqpLv4UI5SpMeltJX+7PhkxVUhqbOS5sWWAgao/afWy
         Vmu2IYeujw1lNxavecWXZtBV2Xt7zVVCw10XpuwEZq0dkxd13hpGwtmlvIqyQeE/KNoX
         rA3Xh3b7GEY59tYVfwF7IRQcBMpp4dMqeAK/0dBG+Bw03kgBT6s60v17KxK+pPdPro6G
         FLxZbP+uH3QEA3DqFca6aUkawOebjlWwlLD1jmOpKkTr40d27MyLfvvmN0ta9OMOThQY
         4WLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+gmo9nIirdbed4J/LDnU4BNvdJRcxPBpHK1YwQWHx3A=;
        b=0B2gNAqQDuAxO9o0weWAUrMllk4LxUw/2qTYFvbOMnwCBPOder6nbdE/1E7aySBWkB
         ffL7OOIdJHAbEvKQunp7VizQcB7xI9QxRc6+qQZk2jRsrN3FufMaxJncTJV4JM/G6DWB
         UOYOowKQEck9thXGKIphgxWOxpwUQS5qUEDSoCeTqMOfnj8GIWURtb/7WT9nrBFSyGr5
         whnCGnHEWeV/Kyb0XNEVOi+1Dg0C149FkKcUAlWwSDqB19e0eDMRiqDovs+Sa5coVihG
         1/exU9dBU/2XDMCxrZwykrxHYITcQk5n6fXjvmc0vzrPY5Wn/HHF4M8R60jkoMQp4grW
         xwlA==
X-Gm-Message-State: ANoB5pk0WMWmi3KFQf2rk2K6f4RR3zDw5/oYtYe2rkaRivrSAYqeX+S3
	PulBcLagiwsrwF3WD+2exJI0kg==
X-Google-Smtp-Source: AA0mqf4jVHezM2bL21HVhzKH1EZ/A3CxuShkRmJj0N14THKAhU4L/c00faHr4CoC1CPZ4bH3MFrAHA==
X-Received: by 2002:a05:600c:35cf:b0:3cf:aa11:93a8 with SMTP id r15-20020a05600c35cf00b003cfaa1193a8mr41173747wmq.31.1669638809617;
        Mon, 28 Nov 2022 04:33:29 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id bs30-20020a056000071e00b002364c77bcacsm10489898wrb.38.2022.11.28.04.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 04:33:28 -0800 (PST)
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-4-yu.tu@amlogic.com>
 <1jbkov2vb9.fsf@starbuckisacylon.baylibre.com>
 <81d9a794-2920-64f1-1d80-50653113624c@amlogic.com>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <narmstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen  Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com
Subject: Re: [PATCH V5 3/4] clk: meson: s4: add s4 SoC peripheral clock
 controller driver and bindings
Date: Mon, 28 Nov 2022 13:23:08 +0100
In-reply-to: <81d9a794-2920-64f1-1d80-50653113624c@amlogic.com>
Message-ID: <1jilizp8bs.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_043333_453157_BB29DE9E 
X-CRM114-Status: GOOD (  19.16  )
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


On Mon 28 Nov 2022 at 16:08, Yu Tu <yu.tu@amlogic.com> wrote:

>>> +
>>> +/*
>>> + * This RTC clock can be supplied by an external 32KHz crystal oscillator.
>>> + * If it is used, it should be documented in using fw_name and documented in the
>>> + * Bindings. Not currently in use on this board, so skip it.
>>> + */
>>> +static u32 rtc_clk_sel[] = { 0, 1 };
>> No reason to do that
>
> I'm going to change it to static u32 rtc_clk_sel[] = { 0, 1, 2 };.
> I don't know if that's okay with you?

... then there is no need to specify this table.



>
>> 
>>> +static const struct clk_parent_data rtc_clk_sel_parent_data[] = {
>>> +	{ .hw = &s4_rtc_32k_by_oscin.hw },
>>> +	{ .hw = &s4_rtc_32k_by_oscin_div.hw },
>>> +	{ .fw_name = "ext_32k",  }
>>> +};
>>> +
>>> +static struct clk_regmap s4_rtc_clk = {
>>> +	.data = &(struct clk_regmap_mux_data) {
>>> +		.offset = CLKCTRL_RTC_CTRL,
>>> +		.mask = 0x3,
>>> +		.shift = 0,
>>> +		.table = rtc_clk_sel,
>>> +		.flags = CLK_MUX_ROUND_CLOSEST,
>>> +	},
>>> +	.hw.init = &(struct clk_init_data){
>>> +		.name = "rtc_clk_sel",
>>> +		.ops = &clk_regmap_mux_ops,
>>> +		.parent_data = rtc_clk_sel_parent_data,
>>> +		.num_parents = 2,
>>> +		.flags = CLK_SET_RATE_PARENT,
>>> +	},
>>> +};
>>> +

[...]

>>> +
>>> +/* Video Clocks */
>>> +static struct clk_regmap s4_vid_pll_div = {
>>> +	.data = &(struct meson_vid_pll_div_data){
>>> +		.val = {
>>> +			.reg_off = CLKCTRL_VID_PLL_CLK_DIV,
>>> +			.shift   = 0,
>>> +			.width   = 15,
>>> +		},
>>> +		.sel = {
>>> +			.reg_off = CLKCTRL_VID_PLL_CLK_DIV,
>>> +			.shift   = 16,
>>> +			.width   = 2,
>>> +		},
>>> +	},
>>> +	.hw.init = &(struct clk_init_data) {
>>> +		.name = "vid_pll_div",
>>> +		/* Same to g12a */
>>> +		.ops = &meson_vid_pll_div_ro_ops,
>> Please add an helpful explanation.
>> 'Same to g12a' is not helpful.
>> 
>
> "Because the vid_pll_div clock is a clock that does not need to change the
> divisor, ops only provides meson_vid_pll_div_ro_ops."
> I wonder if this description is ok for you?

I understand this divider will not change with RO ops.
I'm interrested why it does not change and how it is expected to be setup.

>
>>> +		.parent_data = (const struct clk_parent_data []) {
>>> +			{ .fw_name = "hdmi_pll", }
>>> +		},
>>> +		.num_parents = 1,
>>> +		.flags = CLK_SET_RATE_PARENT,
>>> +	},
>>> +};

[...]

>>> +
>>> +static struct clk_regmap s4_vclk_sel = {
>>> +	.data = &(struct clk_regmap_mux_data){
>>> +		.offset = CLKCTRL_VID_CLK_CTRL,
>>> +		.mask = 0x7,
>>> +		.shift = 16,
>>> +	},
>>> +	.hw.init = &(struct clk_init_data){
>>> +		.name = "vclk_sel",
>>> +		.ops = &clk_regmap_mux_ops,
>>> +		.parent_data = s4_vclk_parent_data,
>>> +		.num_parents = ARRAY_SIZE(s4_vclk_parent_data),
>>> +	},
>> You are stopping rate propagation here.
>> It deserves an explanation. Same goes below.
>
> "When the driver uses this clock, needs to specify the patent clock he
> wants in the dts."
> Is ok for you?

Then you still don't understand the clock flag usage.

Preserving the parent selection (CLK_SET_RATE_NO_REPARENT) and rate
propagation (CLK_SET_RATE_PARENT) is not the same thing.

As it stands, your comment is not aliged with what you do.

>
>> 
>>> +};

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
