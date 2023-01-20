Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60E5C25B4E
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Jan 2023 10:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y14eQFt/hknjmWYpirh3bXWIez43Ifk4EqIeWDB9hq0=; b=bjjAEd43HJYh93
	yEKsuYhlQoDQBzgpAR0JKgmSaEJZ5MHATs3IGUNNdFX6gcpQy8tpHNl1AEXYDMzW7LcFuhbllAMLM
	5STv+losgsFYSFaNIEF1a/KlQmpoBNBrd7ZEkTz+0ERjEDxcq8KX9TF3jeUdPQ/IRpWcePdrFVQM/
	r2zoTJ5u3CQk50W9CXCLKQ95/SB1JjZjq6KCPNF7M15t0UrpUbGKZKOLzwnxbbkb6cr+vZINfvE2n
	sYqHeL0qHyppx65Q+1ikrdmxaQLpWM81wt/2kWjndFNgk5TDWOYZnNe3/s8Fw2aN7EqC0v84mb/r/
	ccNcE76ByscKoykAc36A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIoFs-009eIj-OV; Fri, 20 Jan 2023 10:04:16 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pInyK-009VLG-QW
	for linux-amlogic@lists.infradead.org; Fri, 20 Jan 2023 09:46:12 +0000
Received: by mail-wr1-x433.google.com with SMTP id h12so317439wrv.10
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Jan 2023 01:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=nsY3N5w/OcuIb37vMvk7tYxNViydXZA0c/CHmVvoNOo=;
        b=CLZIyAwQPLhK2AxK27j6A6njGog/a2p4aS79YR9wE4GKVD+dwv/7AlHUBNt8aQsIGo
         /cQH9GianjLCNV9/ankI533Tm3aUqjyjEKh5g2/Ut0g/Ee/sQ21/Ww48Ya0G2z4vSkTA
         /3LQrIEDUN0SfJL48+K2Dx2+8MO6JqU+ShhlgcvtbAqV7/Z3rf7zE3AYbJSYK7a/daqn
         YyM+cneeVpNvpm0sgUCpVkp7IYAKwXpv23Iw7mOawy4pE6HdnLVinEM+fDDR0q0nA0Wv
         iMQ8OKyVx5EP5gAqFGTXWx2tQu848yqiAqs7yqy5/n6TYRRRqnevZyIiiIFamyhkGVSQ
         +bEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsY3N5w/OcuIb37vMvk7tYxNViydXZA0c/CHmVvoNOo=;
        b=0rZXbEGYmMhzNeHI+bFGQRo7hdZD+XxUsIgpB3DraQ1eNWKyE7yoinMnu+xTuhvTgt
         E1TxHmdZzWXXjPaBb3mFfooQko2Kkr0sbyo1rK4e/5pNqQQ3eR/Slp+LdrnTrrxP4hN9
         NO1pt7MzyzX14zQEfJQJ5nZWMLRhkLcR/dWK6KLDF0PJP9Xfn1dBV4AJ01GANGmW4A4N
         /HDb0xp6ZCSnA2r+rYqeNemSuBtA5U8k4m0pWvE1WXFtI+TCnPInXQrrigvjG1heMzh3
         eF/Ecnnpdb4CtXdiizq0BZNa5X1be+C5/P3AdZvHnha3OkEUwpuGSg1r2E+iT7lvSBm9
         XXvg==
X-Gm-Message-State: AFqh2koWY1uU6pPvzy28r06TrNgiVdpThyGTpeZv5xjahiywJvwanTc2
	tjS+nZy1r3NTNejHV5pBtubCnw==
X-Google-Smtp-Source: AMrXdXvyT9hQzOoOVCprmqSF4N4hkPCiVWjbkYVZURild1qzZrpIlziAHbPHLBqJQPPZmE9kvU1gEw==
X-Received: by 2002:a05:6000:1a8f:b0:2be:3fa7:ab4e with SMTP id f15-20020a0560001a8f00b002be3fa7ab4emr6333419wry.38.1674207966518;
        Fri, 20 Jan 2023 01:46:06 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q12-20020adff50c000000b002bc83b85180sm637714wro.114.2023.01.20.01.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 01:46:05 -0800 (PST)
References: <20230116074214.2326-1-yu.tu@amlogic.com>
 <20230116074214.2326-3-yu.tu@amlogic.com>
 <1jedrqyd3w.fsf@starbuckisacylon.baylibre.com>
 <55659095-86d7-91b6-2db6-5cdca228bc09@amlogic.com>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
  Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: "kelvin . zhang" <Kelvin.Zhang@amlogic.com>, "qi . duan"
 <qi.duan@amlogic.com>
Subject: Re: [PATCH V6 2/3] clk: meson: S4: add support for Amlogic S4 SoC
 PLL clock driver
Date: Fri, 20 Jan 2023 10:43:24 +0100
In-reply-to: <55659095-86d7-91b6-2db6-5cdca228bc09@amlogic.com>
Message-ID: <1j1qnpy1wh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_014608_944156_5BE5E144 
X-CRM114-Status: GOOD (  20.96  )
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


On Fri 20 Jan 2023 at 10:58, Yu Tu <yu.tu@amlogic.com> wrote:

> Hi Jerome,
>
> On 2023/1/19 19:20, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>> On Mon 16 Jan 2023 at 15:42, Yu Tu <yu.tu@amlogic.com> wrote:
>> 
>>> Add the S4 PLL clock controller driver in the s4 SoC family.
>>>
>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>> ---
>> [...]
>> 
>>> +
>>> +static struct clk_regmap s4_fclk_div2 = {
>>> +	.data = &(struct clk_regmap_gate_data){
>>> +		.offset = ANACTRL_FIXPLL_CTRL1,
>>> +		.bit_idx = 24,
>>> +	},
>>> +	.hw.init = &(struct clk_init_data){
>>> +		.name = "fclk_div2",
>>> +		.ops = &clk_regmap_gate_ro_ops,
>> On the previous SoC, these fixed divider gate were not read-only.
>> They are marked as critical when necessary, with the appropriate
>> comment.
>> Why is it different on the s4 ?
>
> In fact, this part of the SOC is no different from the previous G12a/b and
> so on.
>
> I remember that my first version was made according to G12A, and I changed
> this way under your suggestion.
>
> Maybe you were busy and forgot. For me, this mode and the previous g12a
> mode function is ok. I can do either. So now how do you decide to go that
> way?

No I did not forgot.
I told you that cannot put CRITICAL (or IGNORE_USED) without explaining
why. I stand by this. Same goes for RO ops. 

>
>> 
>>> +		.parent_hws = (const struct clk_hw *[]) {
>>> +			&s4_fclk_div2_div.hw
>>> +		},
>>> +		.num_parents = 1,
>>> +	},
>>> +};
>>> +
>> [...]
>> 
>>> +#ifndef __MESON_S4_PLL_H__
>>> +#define __MESON_S4_PLL_H__
>>> +
>>> +/* ANA_CTRL - Registers
>>> + * REG_BASE:  REGISTER_BASE_ADDR = 0xfe008000
>> This multi-line comment style is wrong in clk/
>> REG_BASE is not used so I'm not sure this is useful
>
> I will remove REG_BASE and  change this format in next version.
>
>> 
>>> + */
>>> +#define ANACTRL_FIXPLL_CTRL0                       0x040
>>> +#define ANACTRL_FIXPLL_CTRL1                       0x044
>>> +#define ANACTRL_FIXPLL_CTRL2                       0x048
>>> +#define ANACTRL_FIXPLL_CTRL3                       0x04c
>>> +#define ANACTRL_FIXPLL_CTRL4                       0x050
>>> +#define ANACTRL_FIXPLL_CTRL5                       0x054
>>> +#define ANACTRL_FIXPLL_CTRL6                       0x058
>>> +#define ANACTRL_FIXPLL_STS                         0x05c
>>> +#define ANACTRL_GP0PLL_CTRL0                       0x080
>>> +#define ANACTRL_GP0PLL_CTRL1                       0x084
>>> +#define ANACTRL_GP0PLL_CTRL2                       0x088
>>> +#define ANACTRL_GP0PLL_CTRL3                       0x08c
>>> +#define ANACTRL_GP0PLL_CTRL4                       0x090
>>> +#define ANACTRL_GP0PLL_CTRL5                       0x094
>>> +#define ANACTRL_GP0PLL_CTRL6                       0x098
>>> +#define ANACTRL_GP0PLL_STS                         0x09c
>>> +#define ANACTRL_HIFIPLL_CTRL0                      0x100
>>> +#define ANACTRL_HIFIPLL_CTRL1                      0x104
>>> +#define ANACTRL_HIFIPLL_CTRL2                      0x108
>>> +#define ANACTRL_HIFIPLL_CTRL3                      0x10c
>>> +#define ANACTRL_HIFIPLL_CTRL4                      0x110
>>> +#define ANACTRL_HIFIPLL_CTRL5                      0x114
>>> +#define ANACTRL_HIFIPLL_CTRL6                      0x118
>>> +#define ANACTRL_HIFIPLL_STS                        0x11c
>>> +#define ANACTRL_MPLL_CTRL0                         0x180
>>> +#define ANACTRL_MPLL_CTRL1                         0x184
>>> +#define ANACTRL_MPLL_CTRL2                         0x188
>>> +#define ANACTRL_MPLL_CTRL3                         0x18c
>>> +#define ANACTRL_MPLL_CTRL4                         0x190
>>> +#define ANACTRL_MPLL_CTRL5                         0x194
>>> +#define ANACTRL_MPLL_CTRL6                         0x198
>>> +#define ANACTRL_MPLL_CTRL7                         0x19c
>>> +#define ANACTRL_MPLL_CTRL8                         0x1a0
>>> +#define ANACTRL_MPLL_STS                           0x1a4
>>> +#define ANACTRL_HDMIPLL_CTRL0                      0x1c0
>>> +#define ANACTRL_HDMIPLL_CTRL1                      0x1c4
>>> +#define ANACTRL_HDMIPLL_CTRL2                      0x1c8
>>> +#define ANACTRL_HDMIPLL_CTRL3                      0x1cc
>>> +#define ANACTRL_HDMIPLL_CTRL4                      0x1d0
>>> +#define ANACTRL_HDMIPLL_CTRL5                      0x1d4
>>> +#define ANACTRL_HDMIPLL_CTRL6                      0x1d8
>>> +#define ANACTRL_HDMIPLL_STS                        0x1dc
>>> +#define ANACTRL_HDMIPLL_VLOCK                      0x1e4
>>> +
>>> +/*
>>> + * CLKID index values
>>> + *
>>> + * These indices are entirely contrived and do not map onto the hardware.
>>> + * It has now been decided to expose everything by default in the DT header:
>>> + * include/dt-bindings/clock/axg-clkc.h. Only the clocks ids we don't want
>>> + * to expose, such as the internal muxes and dividers of composite clocks,
>>> + * will remain defined here.
>>> + */
>>> +#define CLKID_FIXED_PLL_DCO		0
>>> +#define CLKID_FCLK_DIV2_DIV		2
>>> +#define CLKID_FCLK_DIV3_DIV		4
>>> +#define CLKID_FCLK_DIV4_DIV		6
>>> +#define CLKID_FCLK_DIV5_DIV		8
>>> +#define CLKID_FCLK_DIV7_DIV		10
>>> +#define CLKID_FCLK_DIV2P5_DIV		12
>>> +#define CLKID_GP0_PLL_DCO		14
>>> +#define CLKID_HIFI_PLL_DCO		16
>>> +#define CLKID_HDMI_PLL_DCO		18
>>> +#define CLKID_HDMI_PLL_OD		19
>>> +#define CLKID_MPLL_50M_DIV		21
>>> +#define CLKID_MPLL_PREDIV		23
>>> +#define CLKID_MPLL0_DIV			24
>>> +#define CLKID_MPLL1_DIV			26
>>> +#define CLKID_MPLL2_DIV			28
>>> +#define CLKID_MPLL3_DIV			30
>>> +
>>> +#define NR_PLL_CLKS			32
>>> +/* include the CLKIDs that have been made part of the DT binding */
>>> +#include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
>>> +
>>> +#endif /* __MESON_S4_PLL_H__ */
>> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
