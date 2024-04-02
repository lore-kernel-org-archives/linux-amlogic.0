Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787CACD1284
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Apr 2024 09:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=olzr7gYdwgdIpx7QUd9Pg7togCN8XWRxxThO0KmAMuA=; b=STbflfi4t4ym31
	H7aXeptlhsW8HyKGHc0A+PsFrVHkoUdAWcIKmW+dEM2qHK1W6q7xN5o05Vd+m+jG6ArXDWYkKaBM/
	oGI7x1ukYreldXtwu33tYbCNu92kIPZA7ZWBrtwaUGXPXoUGA12vMJArWakSMpQoF/Yz2xfBQeeSo
	qp86bWkjWAxfzoXHU/y/W3BB9X0fS8PsJxEAhK9GAiVys/50SRsCl71/jTa1X0ruNi8urLAf6MJ3B
	0QvsCsGp4qVKVutMRnaDUBAneydm4rTzG8okmq+PFrwzMOSvhPDu+jl5zf+NNFVafVA+mRjja9Uan
	CcLMa/Q4MEV3GkgBaQgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rra4W-0000000AML2-3dT5;
	Tue, 02 Apr 2024 09:04:48 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rra4S-0000000AMIK-0l54
	for linux-amlogic@lists.infradead.org;
	Tue, 02 Apr 2024 09:04:46 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3436ffe05c9so167552f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 02 Apr 2024 02:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712048681; x=1712653481; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=5DtpQsHWTJr85nIclH627DiK8ml0pGvXwXdSfSvXc3Y=;
        b=F6Au44S7ulCRIpNIMNp/Hth7yh7tgIYWVUwvtNW9dNUOz7PmhXke+B9oFJiBid9HA1
         Eh421w+aBoy7ilfB5ILoDynsiEIhHdm0ar1PBPQksV7aXS9q1+SV8Mi2o1OI+HDg/5Sq
         pwe2HQKvit+l3gZBYuJS7QBGBcap8bjoh8D3LSwd6LN4uDr3lWMMlVj6tqUgWxkVnRRI
         fewtPK7jTtxGJsYUlzJdwoXLhYaAd926VImQ+yay/pKURsrF1h99OVHuMi5Tu/XD8KV4
         3Thvp7rMBulesklYzYS8gdZiru2HP1jQmvI7XKXJfU+B0v8m+JE3zLRtFKu0tMHYBY7W
         yPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712048681; x=1712653481;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DtpQsHWTJr85nIclH627DiK8ml0pGvXwXdSfSvXc3Y=;
        b=GMIE8CehswJCd69LCdLViGWjX1OwcjHlxc22+D+fNiwIc5Bw6car4Fjm1VCbrp863h
         8t5P+2nRq0I4m2SeYgxsBlWUYocF6noM6dukDLANLPm34dNa2wiuPySrBmevkcF9qrfY
         JgNzYMpA5xFTvYWaIXquwzcERPFQf+JqHK/pI+KeIrJFim21iha93pIaKBXn0IezG5gw
         mBj1QIbY3CLcscsndy5wj9E1pa+8n4cjBAMyHwxgRi2zAKrA27vW2XtEp7DOwZs7m+D7
         ARg3dw10OalwpHj1AHE36zK3TqkLKx6lWqtUNCeGeSXmwRZUOYsWbv3KU1hU56KN1ver
         T/yw==
X-Forwarded-Encrypted: i=1; AJvYcCWWZS47wmJmQ8wPQ5dVQiUnDJPk1b2fgnL/h6T1QJvdcoT+6IajjlVbIN0L7lgCHSovg3uB9kE/yM3nYbKenbj4iCiVrZwPRCxzNrLonqk2vKQ=
X-Gm-Message-State: AOJu0YxwPxa93casuobVKRx17niW3Q7sxqA61jn6+v+PRUmpBMkWQJf8
	imb2+o0Rrb4EKWQYoSc/9cyIEV7SqTpc171Bl/K2Iu8IpRL8Xh1NEJH01q/FH/g=
X-Google-Smtp-Source: AGHT+IH63/gwJe4lsLdmn86BYF7wjy6dJ6d3CdKbvsodEW1CIse+oGPeG50Lip9oSH4TRd0rV3oHFg==
X-Received: by 2002:a05:6000:c8:b0:341:b8d6:e7c7 with SMTP id q8-20020a05600000c800b00341b8d6e7c7mr6500554wrx.71.1712048681104;
        Tue, 02 Apr 2024 02:04:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:db22:d5c9:a527:a4cf])
        by smtp.gmail.com with ESMTPSA id dj11-20020a0560000b0b00b003437799a373sm191115wrb.83.2024.04.02.02.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 02:04:40 -0700 (PDT)
References: <20240329205904.25002-1-ddrokosov@salutedevices.com>
 <20240329205904.25002-3-ddrokosov@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, kernel@salutedevices.com,
 rockosov@gmail.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/6] clk: meson: a1: pll: support 'syspll'
 general-purpose PLL for CPU clock
Date: Tue, 02 Apr 2024 11:00:42 +0200
In-reply-to: <20240329205904.25002-3-ddrokosov@salutedevices.com>
Message-ID: <1j4jckjftk.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_020444_245853_2133153E 
X-CRM114-Status: GOOD (  25.88  )
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


On Fri 29 Mar 2024 at 23:58, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:

> The 'syspll' PLL, also known as the system PLL, is a general and
> essential PLL responsible for generating the CPU clock frequency.
> With its wide-ranging capabilities, it is designed to accommodate
> frequencies within the range of 768MHz to 1536MHz.
>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>  drivers/clk/meson/a1-pll.c | 78 ++++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/a1-pll.h |  6 +++
>  2 files changed, 84 insertions(+)
>
> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
> index 60b2e53e7e51..02fd2d325cc6 100644
> --- a/drivers/clk/meson/a1-pll.c
> +++ b/drivers/clk/meson/a1-pll.c
> @@ -138,6 +138,81 @@ static struct clk_regmap hifi_pll = {
>  	},
>  };
>  
> +static const struct pll_mult_range sys_pll_mult_range = {
> +	.min = 32,
> +	.max = 64,
> +};
> +
> +/*
> + * We assume that the sys_pll_clk has already been set up by the low-level
> + * bootloaders as the main CPU PLL source. Therefore, it is not necessary to
> + * run the initialization sequence.
> + */

I see no reason to make such assumption.
This clock is no read-only, it apparently is able to re-lock so assuming
anything from the bootloader is just asking from trouble

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
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "sys_pll",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_names = (const char *[]){ "syspll_in" },
> +		.num_parents = 1,
> +		/*
> +		 * This clock is used as the main CPU PLL source in low-level
> +		 * bootloaders, and it is necessary to mark it as critical.
> +		 */
> +		.flags = CLK_IS_CRITICAL,

No I don't think so. Downstream consumer maybe critical but that one is
not, unless it is read-only.

A CPU pll, like on the g12 family, is unlikely to be read-only since the
PLL will need to relock to change rates. During this phase, there will
be no reate coming from the PLL so the PLL is not critical and you must
be able to "park" your CPU an another clock while poking this one

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
> +
>  static struct clk_fixed_factor fclk_div2_div = {
>  	.mult = 1,
>  	.div = 2,
> @@ -283,6 +358,8 @@ static struct clk_hw *a1_pll_hw_clks[] = {
>  	[CLKID_FCLK_DIV5]	= &fclk_div5.hw,
>  	[CLKID_FCLK_DIV7]	= &fclk_div7.hw,
>  	[CLKID_HIFI_PLL]	= &hifi_pll.hw,
> +	[CLKID_SYS_PLL]		= &sys_pll.hw,
> +	[CLKID_SYS_PLL_DIV16]	= &sys_pll_div16.hw,
>  };
>  
>  static struct clk_regmap *const a1_pll_regmaps[] = {
> @@ -293,6 +370,7 @@ static struct clk_regmap *const a1_pll_regmaps[] = {
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
