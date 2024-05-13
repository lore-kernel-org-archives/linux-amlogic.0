Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EE2C25B10
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2024 12:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZA1YMZfn/RFmnpHy91eRkG8+c1flCJf+QLKIBb32A3o=; b=qtUf1ItLpQv8p5
	KrTxkaawrzUo0NHne4PSHuJIPLXrNoncGIq6iBEG506VZ+L/3WyKxIc/pzf1Hs8zIA6DXN2z7yJ/q
	LGvt/FzRcI9gT6U6RAEMPaKkLk6FM+C59INB3svaL3my8wSVEvujtzNnwrW7qEENulv4aOyC9VWbr
	lgDKOqmx5BbI/8dQ8e3kPbiRaD7Lcd4KArwncKRxaN7BTH7cr7I5tQ7rkTFzGfFPuP9LoSCE4fn1D
	l36MjVwKaTVSO6AHOg6QlwmLAR1CjEjSQmGmlW8SzLsgo1N+JaaRPZx3/zJefg+FxAg7ktcU7w9i9
	Rllwr3PjVVE+Z89MADSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6VGh-0000000CuiA-15Et;
	Mon, 13 May 2024 12:59:03 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6VGc-0000000CugC-2Ggq
	for linux-amlogic@lists.infradead.org;
	Mon, 13 May 2024 12:59:00 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-34e28e32ea4so2700837f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 13 May 2024 05:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715605136; x=1716209936; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=+KHY/va/UiG2Na9MP8nc/w2XW81daquGbqT+2NhsgSg=;
        b=bjtNRQb08Z1ZVreAmXks4m/Zy8h0ErdvjMNsm/ZSsRFnmRFEy0FggM/XNGJfGewjfn
         i6d7WPyRIj6Dyy/28+tVPTn9P+pP3NPDyx3YRoEhlP11sO3TLiYha23IAQURVIIo1EAc
         Nr9t0EAjIjG1ef2ACOeiImwlr//Q64qULAKcHm3X2iXSlzcA/7XkYaB61VKOShuKImMn
         /5GPdaMZpbSZI5fNDEr3lvQL7hY03YOWlRCYkaxgqANE1J4Lm8GEJaTshmIR9vmMac/B
         YpkpnXIn4smJRAwmPwpKvkgWMfw9bBMFUTn7s9HaqtwPtR1pl/+V8HWoZ1n8Q0diddsr
         kCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715605136; x=1716209936;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KHY/va/UiG2Na9MP8nc/w2XW81daquGbqT+2NhsgSg=;
        b=acM2eSXX1EojCglTPP4qjuDpyMlU2PVGEbRYlS0apI1cHuAmaYGYxwQOWqYRmobbgB
         P5Cd+3GsQBsMK+Y1QbK2lrV1Nh34Ig43FoFu0iWSiK9ad6vPa4v8GKQGMdTeYn9atPyX
         OqbL/5S+TYs8ivgtMbLl+moeoomt0jUNRXuhjgH8eqJf4YYb+77ZbZJMbH4aEhsDlGjG
         RQDYH0EKCzVG+Uz4nMoM11YOrWLvSSP5ksVKuipB9kBQy8Ln3OrLXzHgNfKvghak28AS
         wahkfBWmGBtoPVlTw9dfTAp9crrRJHE0JkMf97wT2B8mSRUIHuAXXOJrOAeyKs1QG5j9
         gg6A==
X-Forwarded-Encrypted: i=1; AJvYcCUIESwnZtaTgFFXRjNnMyqIkqz0oX16hiuI0UwgEQJqt9T+yvj2Clhge8Mm+r6CAg/LuC9oKkxERENmmuPoqK0OhBEg/GuKp7ZF6nSFkIY4Eog=
X-Gm-Message-State: AOJu0Yx2sVjYGIAH7WSoJ9OYlPPrN5wIXPmT2DO3A3jtryHHra00aLBM
	LfT/T04TrMxldBig8HRfuCIL8UTrUy/5snVgBasfKeDob/1mwqV+4OkVkjNE/4E=
X-Google-Smtp-Source: AGHT+IHeRnTDN4SH3gn7w7eJ7nzHsxhbKa6Pl2AcPY9SrajcE/+4MjtBKCpMvS1sSqhDwJN1TAPHXQ==
X-Received: by 2002:adf:fe04:0:b0:34f:f540:bdc9 with SMTP id ffacd0b85a97d-3504a63300amr6183580f8f.9.1715605136359;
        Mon, 13 May 2024 05:58:56 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5b77:3e5a:a808:339a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b8969fbsm11019601f8f.37.2024.05.13.05.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 05:58:55 -0700 (PDT)
References: <20240510090933.19464-1-ddrokosov@salutedevices.com>
 <20240510090933.19464-4-ddrokosov@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, jian.hu@amlogic.com,
 kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/7] clk: meson: a1: pll: support 'syspll'
 general-purpose PLL for CPU clock
Date: Mon, 13 May 2024 14:48:58 +0200
In-reply-to: <20240510090933.19464-4-ddrokosov@salutedevices.com>
Message-ID: <1jbk59zx4g.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_055858_622493_3C2ABBD7 
X-CRM114-Status: GOOD (  19.05  )
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


On Fri 10 May 2024 at 12:08, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:

> The 'syspll' PLL, also known as the system PLL, is a general and
> essential PLL responsible for generating the CPU clock frequency.
> With its wide-ranging capabilities, it is designed to accommodate
> frequencies within the range of 768MHz to 1536MHz.
>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>  drivers/clk/meson/a1-pll.c | 79 ++++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/a1-pll.h |  6 +++
>  2 files changed, 85 insertions(+)
>
> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
> index 60b2e53e7e51..af47ba308bbe 100644
> --- a/drivers/clk/meson/a1-pll.c
> +++ b/drivers/clk/meson/a1-pll.c
> @@ -138,6 +138,82 @@ static struct clk_regmap hifi_pll = {
>  	},
>  };
>  
> +static const struct pll_mult_range sys_pll_mult_range = {
> +	.min = 32,
> +	.max = 64,
> +};
> +
> +static const struct reg_sequence sys_pll_init_regs[] = {
> +	{ .reg = ANACTRL_SYSPLL_CTRL1, .def = 0x01800000 },
> +	{ .reg = ANACTRL_SYSPLL_CTRL2, .def = 0x00001100 },
> +	{ .reg = ANACTRL_SYSPLL_CTRL3, .def = 0x10022300 },
> +	{ .reg = ANACTRL_SYSPLL_CTRL4, .def = 0x00300000 },
> +	{ .reg = ANACTRL_SYSPLL_CTRL0, .def = 0x01f18432 },
> +};
> +
> +static struct clk_regmap sys_pll = {
> +	.data = &(struct meson_clk_pll_data){
> +		.en = {
> +			.reg_off = ANACTRL_SYSPLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = ANACTRL_SYSPLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 8,
> +		},
> +		.n = {
> +			.reg_off = ANACTRL_SYSPLL_CTRL0,
> +			.shift   = 10,
> +			.width   = 5,
> +		},
> +		.frac = {
> +			.reg_off = ANACTRL_SYSPLL_CTRL1,
> +			.shift   = 0,
> +			.width   = 19,
> +		},
> +		.l = {
> +			.reg_off = ANACTRL_SYSPLL_STS,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.current_en = {
> +			.reg_off = ANACTRL_SYSPLL_CTRL0,
> +			.shift   = 26,
> +			.width   = 1,
> +		},
> +		.l_detect = {
> +			.reg_off = ANACTRL_SYSPLL_CTRL2,
> +			.shift   = 6,
> +			.width   = 1,
> +		},
> +		.range = &sys_pll_mult_range,
> +		.init_regs = sys_pll_init_regs,
> +		.init_count = ARRAY_SIZE(sys_pll_init_regs),

Like other 'fishy' flags, I would like a clear comment why this flag is
required so, 2y from now, we will know why it was put there and how we
can deal with it.

> +		.flags = CLK_MESON_PLL_INIT_ONCE,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "sys_pll",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_names = (const char *[]){ "syspll_in" },
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_fixed_factor sys_pll_div16 = {
> +	.mult = 1,
> +	.div = 16,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "sys_pll_div16",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&sys_pll.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};

Unlike the fdivs, this fixed divider is not part of the diagram
describing the syspll clock.

IMO, it could as well be in peripheral controller because it exists
(from what I can see) just testing purposes, to make the sys pll
observable through tst_out or gen_clk.

It also looks less awkward in the bindings.

> +
>  static struct clk_fixed_factor fclk_div2_div = {
>  	.mult = 1,
>  	.div = 2,
> @@ -283,6 +359,8 @@ static struct clk_hw *a1_pll_hw_clks[] = {
>  	[CLKID_FCLK_DIV5]	= &fclk_div5.hw,
>  	[CLKID_FCLK_DIV7]	= &fclk_div7.hw,
>  	[CLKID_HIFI_PLL]	= &hifi_pll.hw,
> +	[CLKID_SYS_PLL]		= &sys_pll.hw,
> +	[CLKID_SYS_PLL_DIV16]	= &sys_pll_div16.hw,
>  };
>  
>  static struct clk_regmap *const a1_pll_regmaps[] = {
> @@ -293,6 +371,7 @@ static struct clk_regmap *const a1_pll_regmaps[] = {
>  	&fclk_div5,
>  	&fclk_div7,
>  	&hifi_pll,
> +	&sys_pll,
>  };
>  
>  static struct regmap_config a1_pll_regmap_cfg = {
> diff --git a/drivers/clk/meson/a1-pll.h b/drivers/clk/meson/a1-pll.h
> index 4be17b2bf383..666d9b2137e9 100644
> --- a/drivers/clk/meson/a1-pll.h
> +++ b/drivers/clk/meson/a1-pll.h
> @@ -18,6 +18,12 @@
>  #define ANACTRL_FIXPLL_CTRL0	0x0
>  #define ANACTRL_FIXPLL_CTRL1	0x4
>  #define ANACTRL_FIXPLL_STS	0x14
> +#define ANACTRL_SYSPLL_CTRL0	0x80
> +#define ANACTRL_SYSPLL_CTRL1	0x84
> +#define ANACTRL_SYSPLL_CTRL2	0x88
> +#define ANACTRL_SYSPLL_CTRL3	0x8c
> +#define ANACTRL_SYSPLL_CTRL4	0x90
> +#define ANACTRL_SYSPLL_STS	0x94
>  #define ANACTRL_HIFIPLL_CTRL0	0xc0
>  #define ANACTRL_HIFIPLL_CTRL1	0xc4
>  #define ANACTRL_HIFIPLL_CTRL2	0xc8


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
