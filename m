Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE8ACD1284
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Apr 2024 14:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WIuG8uyLu6OUZFgORyGXV/LrnOI99tUts1DHPiAF0wk=; b=0rV1Z0inUMLmj3
	vY6WRVhSAaWK0GwyIiD/ji+XtiYnuUCAuTAfA0Bpne2rS3qOfZnt78StYVl0BrcakTyGKefCMaI6/
	0BgoAXkZs4Mw6Ly80JHj8gB1/Uo8EmilWkLQRkVyyNrWEk4hmnDeRt3+uW8OmjwUrxkVzRKRXchTK
	9GcDo81ItnZg/Z5jdlvOwrdCPp3rL1mikHX4iwFwLrQ3fGJsp8S1NwKgrlXJOdD0BYnCVVZXMyeJG
	Cvh1/L8a+GBxAsZxH9vzKnJmcNj53JybFXziQ2QPabx9nLeYD73yvxTg6q8NbyentqtwyleQn47d1
	XYzE/1B//ImKRy20WdDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrfCC-0000000Baq4-3jgb;
	Tue, 02 Apr 2024 14:33:04 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrfC9-0000000Bap9-2UsV
	for linux-amlogic@lists.infradead.org;
	Tue, 02 Apr 2024 14:33:03 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4161d73d876so3488935e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 02 Apr 2024 07:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712068379; x=1712673179; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=HEtsCpz4MIzWRds8geMwgNxbFpu0vjPrqmUI/UEAmeE=;
        b=M1v2m+Lg6hav0J5XcHzB05++HSTcHG77BGsAQ9yn/YPcz619Iw97J4P0Ne7O+sAgcP
         j31IOWyEtQRVxOi4K6/Gyttm9qSGrf355AM5ZJ+MX5+r8Q0SddeTOKlGLuHMocm83/A3
         30eBV71bWQ1fku7FCeH6gDiNN7YiZh6mlOZ910a9H0oNnlzEUNSsIWUA+PzlJqufCGjz
         NPQ1q+qiiuKY3b9DkgiWXP5TnoXYYYKrzKDEDuHaNwXb7/fFXpSe2urIVJ+18hTtIL+X
         jqs/NArsP1OT0wunAdm4sZ96DIqqW83vBVypQr1oKZ5yjtZcl2/2KJ1Wh3DU6nCiuGFS
         BPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712068379; x=1712673179;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEtsCpz4MIzWRds8geMwgNxbFpu0vjPrqmUI/UEAmeE=;
        b=Dc0Vg0hAqZQQBlUj/qbHa1OsMplTRpSoAaJd4SnEA4oOvVVVljSUC95AtLSHT6nEDC
         A2OAqCHw7pzf9t2ThMc7NUsi6O7K11jC95eUIVlL9hwIJPp3VaUyn4DZu3KgWwu8Ae7x
         i7N2aeDxS8j0zGJHiS83PBkQqEsHrEMnBCUAdzTOMVgyzrih9DJSUEbssryYH1c4qJAQ
         GEaN3uQkA8qBSQf+vDe+gaPIJqAj/8+N884ST7CxyLYPTj3+lC4LxDnfOgTVu5hNpSqC
         1Mj+aEwLbCzXla/Jt0Mp6cY6USLt93/jCi/hnjwhRKOLZYOoZPGyWcokQIgapwVpA9Na
         skiA==
X-Forwarded-Encrypted: i=1; AJvYcCWtS7TvLcJdB5itFUQbw8xLMihvg0xraulFnJ3VpEqaiX/Xdoxu6BuwkK7ctaADvturMOThWCvubQ77KYesAOfq0FITamQ7m0oLJGDhF2oPxHY=
X-Gm-Message-State: AOJu0Yzx/14bEnfOYOhUiNyCHe2yJf7oIGWTqy83VdDh3+AxL/zDjc71
	wVZPmCn8XkQxVVte65CmcttxRWGXd3V+I2knKUfQr+TxVgZhqgFbUJq6ozG9Ypw=
X-Google-Smtp-Source: AGHT+IGjNhWiDBYNmq+K/GKR39m/w7jR+0GLSVTnRUJMeSZ9vwCrOhr9OwZtV2iO8DIQ0nlr/sftPA==
X-Received: by 2002:a5d:69cd:0:b0:33e:cf4e:86ba with SMTP id s13-20020a5d69cd000000b0033ecf4e86bamr6631161wrw.63.1712068379089;
        Tue, 02 Apr 2024 07:32:59 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2b3:4f20:7b45:be58])
        by smtp.gmail.com with ESMTPSA id k4-20020a05600c1c8400b00414807ef8dfsm18315928wms.5.2024.04.02.07.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 07:32:58 -0700 (PDT)
References: <20240329205904.25002-1-ddrokosov@salutedevices.com>
 <20240329205904.25002-3-ddrokosov@salutedevices.com>
 <1j4jckjftk.fsf@starbuckisacylon.baylibre.com>
 <20240402121546.qrrc7r5un75464pb@CAB-WSD-L081021>
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
Subject: Re: [PATCH v1 2/6] clk: meson: a1: pll: support 'syspll'
 general-purpose PLL for CPU clock
Date: Tue, 02 Apr 2024 16:27:17 +0200
In-reply-to: <20240402121546.qrrc7r5un75464pb@CAB-WSD-L081021>
Message-ID: <1jmsqbj0md.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_073301_738189_195FD245 
X-CRM114-Status: GOOD (  39.58  )
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


On Tue 02 Apr 2024 at 15:15, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:

> On Tue, Apr 02, 2024 at 11:00:42AM +0200, Jerome Brunet wrote:
>> 
>> On Fri 29 Mar 2024 at 23:58, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:
>> 
>> > The 'syspll' PLL, also known as the system PLL, is a general and
>> > essential PLL responsible for generating the CPU clock frequency.
>> > With its wide-ranging capabilities, it is designed to accommodate
>> > frequencies within the range of 768MHz to 1536MHz.
>> >
>> > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
>> > ---
>> >  drivers/clk/meson/a1-pll.c | 78 ++++++++++++++++++++++++++++++++++++++
>> >  drivers/clk/meson/a1-pll.h |  6 +++
>> >  2 files changed, 84 insertions(+)
>> >
>> > diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
>> > index 60b2e53e7e51..02fd2d325cc6 100644
>> > --- a/drivers/clk/meson/a1-pll.c
>> > +++ b/drivers/clk/meson/a1-pll.c
>> > @@ -138,6 +138,81 @@ static struct clk_regmap hifi_pll = {
>> >  	},
>> >  };
>> >  
>> > +static const struct pll_mult_range sys_pll_mult_range = {
>> > +	.min = 32,
>> > +	.max = 64,
>> > +};
>> > +
>> > +/*
>> > + * We assume that the sys_pll_clk has already been set up by the low-level
>> > + * bootloaders as the main CPU PLL source. Therefore, it is not necessary to
>> > + * run the initialization sequence.
>> > + */
>> 
>> I see no reason to make such assumption.
>> This clock is no read-only, it apparently is able to re-lock so assuming
>> anything from the bootloader is just asking from trouble
>> 
>
> Indeed, I have implemented the following initialization sequence. I have
> dumped the bootloader setup and included it in the definition of my
> sys_pll. However, I have encountered an issue with the enable bit. If I
> leave the enable bit switched on by default, there is a possibility that
> the bootloader selects a fixed CPU clock while the sys_pll should be
> switched off. On the other hand, if I keep the enable bit switched off
> by default, the bootloader might configure the CPU clock to use sys_pll,
> resulting in the execution halting when the initialization sequence is
> run. This situation has led me to assume that we should place our trust
> in the bootloader setup.
>
> If you believe it is necessary to include the initialization sequence, I
> can prepare it with the sys_pll enabled by default.

I just noted your initial comment is misleading.

You could submit a patch to apply the init sequence only if the PLL is
not already enabled. Maybe even condition that to flag in the pll data
to avoid applying it to the other platforms for now.

>
>> > +static struct clk_regmap sys_pll = {
>> > +	.data = &(struct meson_clk_pll_data){
>> > +		.en = {
>> > +			.reg_off = ANACTRL_SYSPLL_CTRL0,
>> > +			.shift   = 28,
>> > +			.width   = 1,
>> > +		},
>> > +		.m = {
>> > +			.reg_off = ANACTRL_SYSPLL_CTRL0,
>> > +			.shift   = 0,
>> > +			.width   = 8,
>> > +		},
>> > +		.n = {
>> > +			.reg_off = ANACTRL_SYSPLL_CTRL0,
>> > +			.shift   = 10,
>> > +			.width   = 5,
>> > +		},
>> > +		.frac = {
>> > +			.reg_off = ANACTRL_SYSPLL_CTRL1,
>> > +			.shift   = 0,
>> > +			.width   = 19,
>> > +		},
>> > +		.l = {
>> > +			.reg_off = ANACTRL_SYSPLL_STS,
>> > +			.shift   = 31,
>> > +			.width   = 1,
>> > +		},
>> > +		.current_en = {
>> > +			.reg_off = ANACTRL_SYSPLL_CTRL0,
>> > +			.shift   = 26,
>> > +			.width   = 1,
>> > +		},
>> > +		.l_detect = {
>> > +			.reg_off = ANACTRL_SYSPLL_CTRL2,
>> > +			.shift   = 6,
>> > +			.width   = 1,
>> > +		},
>> > +		.range = &sys_pll_mult_range,
>> > +	},
>> > +	.hw.init = &(struct clk_init_data){
>> > +		.name = "sys_pll",
>> > +		.ops = &meson_clk_pll_ops,
>> > +		.parent_names = (const char *[]){ "syspll_in" },
>> > +		.num_parents = 1,
>> > +		/*
>> > +		 * This clock is used as the main CPU PLL source in low-level
>> > +		 * bootloaders, and it is necessary to mark it as critical.
>> > +		 */
>> > +		.flags = CLK_IS_CRITICAL,
>> 
>> No I don't think so. Downstream consumer maybe critical but that one is
>> not, unless it is read-only.
>> 
>> A CPU pll, like on the g12 family, is unlikely to be read-only since the
>> PLL will need to relock to change rates. During this phase, there will
>> be no reate coming from the PLL so the PLL is not critical and you must
>> be able to "park" your CPU an another clock while poking this one
>> 
>
> Initially, I tagged it with CLK_IS_CRITICAL because I observed in the
> kernel start that CCF disables it.
> However, upon further understanding,
> I realized that this happened due to other reasons. I believe that if I
> provide an init sequence where sys_pll is enabled by default, CCF will
> not disable this clock.
>
>> > +	},
>> > +};
>> > +
>> > +static struct clk_fixed_factor sys_pll_div16 = {
>> > +	.mult = 1,
>> > +	.div = 16,
>> > +	.hw.init = &(struct clk_init_data){
>> > +		.name = "sys_pll_div16",
>> > +		.ops = &clk_fixed_factor_ops,
>> > +		.parent_hws = (const struct clk_hw *[]) {
>> > +			&sys_pll.hw
>> > +		},
>> > +		.num_parents = 1,
>> > +	},
>> > +};
>> > +
>> >  static struct clk_fixed_factor fclk_div2_div = {
>> >  	.mult = 1,
>> >  	.div = 2,
>> > @@ -283,6 +358,8 @@ static struct clk_hw *a1_pll_hw_clks[] = {
>> >  	[CLKID_FCLK_DIV5]	= &fclk_div5.hw,
>> >  	[CLKID_FCLK_DIV7]	= &fclk_div7.hw,
>> >  	[CLKID_HIFI_PLL]	= &hifi_pll.hw,
>> > +	[CLKID_SYS_PLL]		= &sys_pll.hw,
>> > +	[CLKID_SYS_PLL_DIV16]	= &sys_pll_div16.hw,
>> >  };
>> >  
>> >  static struct clk_regmap *const a1_pll_regmaps[] = {
>> > @@ -293,6 +370,7 @@ static struct clk_regmap *const a1_pll_regmaps[] = {
>> >  	&fclk_div5,
>> >  	&fclk_div7,
>> >  	&hifi_pll,
>> > +	&sys_pll,
>> >  };
>> >  
>> >  static struct regmap_config a1_pll_regmap_cfg = {
>> > diff --git a/drivers/clk/meson/a1-pll.h b/drivers/clk/meson/a1-pll.h
>> > index 4be17b2bf383..666d9b2137e9 100644
>> > --- a/drivers/clk/meson/a1-pll.h
>> > +++ b/drivers/clk/meson/a1-pll.h
>> > @@ -18,6 +18,12 @@
>> >  #define ANACTRL_FIXPLL_CTRL0	0x0
>> >  #define ANACTRL_FIXPLL_CTRL1	0x4
>> >  #define ANACTRL_FIXPLL_STS	0x14
>> > +#define ANACTRL_SYSPLL_CTRL0	0x80
>> > +#define ANACTRL_SYSPLL_CTRL1	0x84
>> > +#define ANACTRL_SYSPLL_CTRL2	0x88
>> > +#define ANACTRL_SYSPLL_CTRL3	0x8c
>> > +#define ANACTRL_SYSPLL_CTRL4	0x90
>> > +#define ANACTRL_SYSPLL_STS	0x94
>> >  #define ANACTRL_HIFIPLL_CTRL0	0xc0
>> >  #define ANACTRL_HIFIPLL_CTRL1	0xc4
>> >  #define ANACTRL_HIFIPLL_CTRL2	0xc8


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
