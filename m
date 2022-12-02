Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE3FC4167B
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 13:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hOtzn1BdDx7cmYXpGeUYo65sBy4/uykr/c5lU/P+7Jo=; b=op7uG1r2tAKUo/
	3puZtJ3iMGt7bbubAyWqXtoY9VSespezpjuMVpLmiJf1LBeNMStUutF8meEhR9j30R7bVcw0Gg30D
	Em3TCECcx8SnpBjGsmtuvnm7dm7nNALZMYxA/ULf12CqNEx5LqByurw3JGA/gsZ03TIhtMvNQSSgM
	Ovvp3Sd8VJbgCe8wSFZEDapvqhp0Y4cRApiWZu3H3cL1CT8YMOtmylR3AxRgIULLLeEJQqAhfU5JT
	L3Xq+/o9MaUAYevWS5+F7Uyo8dsQKQQbC76XV8q3yNHxZPEqBElTzjTCNTdVD2ZikQvUq+/YE1bzj
	TW5quOpkHOt7sWmaxuHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p15gb-00GX08-Km; Fri, 02 Dec 2022 13:02:37 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p15gO-00GWvg-8M
	for linux-amlogic@lists.infradead.org; Fri, 02 Dec 2022 13:02:26 +0000
Received: by mail-wr1-x430.google.com with SMTP id z4so7715663wrr.3
        for <linux-amlogic@lists.infradead.org>; Fri, 02 Dec 2022 05:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=VSGdRkSATXRqKQ0oJba1FJCwjfGxv8hG7quZPS95hvo=;
        b=kVQJH+qbKlFSL/lKFRaeroiYGaVJTUnlUnXd7aiavCn9HHnizu+WWANGihtdRNDna8
         gOt9GvdHfAe6rYp5ofwnMes+P4GZy9Hf5LozVSkkicjfe8g8Zoucopd609V/EwGpW9UN
         GIFT4Zvk0w6TpKs5Y+8/t9RA0qC2cvhVey8tmcArrLMXMFxhfE466wMJGQjvrGwd3Q5/
         ENO+zqUQd9BanfxXBWeC+RFMomLTUyulJ3/utt3lTTlmsT38RH5mGVGHSSD0bmEb5of/
         sgShbMSo2KGdgRxn0fkcjb4MW1ZuCbuFKojyEGKpMUJK83QTxUoVJvK2yC8uMy4COhiU
         6x8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSGdRkSATXRqKQ0oJba1FJCwjfGxv8hG7quZPS95hvo=;
        b=AdxgWlcavNaMK9jT1O90dwtnA/p1EzKe6mI8Ph5BuiSq0HRMGWRgKkFD9jW1VFuvfs
         2TAXnJVuSQoDWgXycV0jeEAhAYOy66r6XgC9/97b9Ldf0QHvQvgU9SiVsBfxQq65V/ah
         OI1kctkgXWMXtpFjRKQVsrgmdCpbOWL8q0neKbQQGje2xXZuDer/Bco0xYDhXDK8nMpX
         00WtOZxyqcElH0Qfkgq0G3VtebH24G7Y5LK9NYrrC+Hlc4zlRR2F3jPiO0Y8yx3i+pVY
         TOa3CiB4ybJ97AHFvX5pvs1tHpPnaS4F5QqGbwkqhXiP703GlXLV+/XVVk7YGc8bNkt/
         pCoQ==
X-Gm-Message-State: ANoB5pkusAmfUQPmXaAqK7pHFxs5n2zZvOrkIvfncWMTKNOXD3+cCurc
	1Dwd3UHUi6+96xBJqb4Lu+MBXw==
X-Google-Smtp-Source: AA0mqf4nlk4w6LcawMx9ECvjWt6+yVF8oBT4lT6RFJmdvgQzCahSEK7NLtivQOb0bLQz3bsBY/s6mg==
X-Received: by 2002:adf:ee0d:0:b0:242:28c9:d116 with SMTP id y13-20020adfee0d000000b0024228c9d116mr8740663wrn.286.1669986139791;
        Fri, 02 Dec 2022 05:02:19 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id j33-20020a05600c1c2100b003b4ff30e566sm14902720wms.3.2022.12.02.05.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 05:02:19 -0800 (PST)
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-8-ddrokosov@sberdevices.ru>
 <1jtu2e6mn5.fsf@starbuckisacylon.baylibre.com>
 <20221202124730.uckax232hnjqg26a@CAB-WSD-L081021>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 07/11] clk: meson: a1: redesign Amlogic A1 PLL clock
 controller
Date: Fri, 02 Dec 2022 13:49:59 +0100
In-reply-to: <20221202124730.uckax232hnjqg26a@CAB-WSD-L081021>
Message-ID: <1jh6ye6js6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_050224_526828_14CF2EFA 
X-CRM114-Status: GOOD (  29.31  )
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


On Fri 02 Dec 2022 at 15:47, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:

> On Fri, Dec 02, 2022 at 12:42:17PM +0100, Jerome Brunet wrote:
>> 
>> On Fri 02 Dec 2022 at 01:56, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:
>> 
>> > Summary changes:
>> >     - supported meson-a1-clkc common driver
>> >     - inherited from the base clk-pll driver, implemented own version of
>> >       init/enable/disable/enabled routines; rate calculating logic is
>> >       fully the same
>> >     - aligned CLKID-related definitions with CLKID list from order
>> >       perspective to remove holes and permutations
>> >     - corrected Kconfig dependencies and types
>> >     - provided correct MODULE_AUTHORs() and MODULE_LICENSE()
>> >     - optimized and fix up some clock relationships
>> >     - removed unused register offset definitions (ANACTRL_* group)
>> 
>> This patch mix PLL stuff, factorization change, etc ...
>> In general, when your commit description is a list, it is a hint that
>> you are doing more than one thing in it. It is unlikely to be OK then
>
> It will be fixed by itself, when I'll squash patches.
>
>> > +static int meson_a1_pll_init(struct clk_hw *hw)
>> > +{
>> > +	struct clk_regmap *clk = to_clk_regmap(hw);
>> > +	struct meson_a1_pll_data *pll = meson_a1_pll_data(clk);
>> > +
>> > +	regmap_multi_reg_write(clk->map, pll->base.init_regs,
>> > +			       pll->base.init_count);
>> > +
>> > +	return 0;
>> 
>> Looks the the default init mostly
>> 
>> Looks like you are trying the handle the absence of the rst bit.
>> I'm pretty sure the hifi PLL of the SoC as one but you really don't want
>> to poke, this can be in the generic driver, with MESON_PARM_APPLICABLE()
>> test.
>> 
>> No need to redefine this
>> 
>
> I've redefined it, because in the previous v7 you mentioned that's
> not acceptable to mix init/enable/disable sequences between a1 pll and clk
> common pll driver:
>
> https://lore.kernel.org/linux-amlogic/1jd0ac5kpk.fsf@starbuckisacylon.baylibre.com/
>
> Hmmm, looks like I've made a mistake. You meant only enable/disable
> callbacks...
>
> Anyway, it doesn't matter to me. I think both approaches are okay:
>     * clk-pll customization using MESON_PARM_APPLICABLE()
>     * custom callbacks implementation for some clk_ops like implemented in
>       this patchset.
>
> Please advise what's the best from you point of view?

It is a balance.

Everytime a new PLL comes up, it tends to treaded as a new ip block but,
most of the time after some digging and rework, we learn new things and
it ends up being compatible with the previous ones.

From what I see here
* You are trying to make rst optional, that's fine. Do it with
  MESON_PARM_APPLICABLE() in the main driver. Still I would recommend to
  thorougly for this bit. I'm pretty sure the hifi pll has one.

* You add a new feature called current self-adaptation.
  This can be made optional too in the enable sequence.
  I would not be surprised to find out more PLL have that, even on
  earlier SoC.

>
>> > +}
>> > +
>> > +static int meson_a1_pll_is_enabled(struct clk_hw *hw)
>> > +{
>> > +	struct clk_regmap *clk = to_clk_regmap(hw);
>> > +	struct meson_a1_pll_data *pll = meson_a1_pll_data(clk);
>> > +
>> > +	if (MESON_PARM_APPLICABLE(&pll->base.rst) &&
>> > +	    meson_parm_read(clk->map, &pll->base.rst))
>> > +		return 0;
>> > +
>> > +	if (!meson_parm_read(clk->map, &pll->base.en) ||
>> > +	    !meson_parm_read(clk->map, &pll->base.l))
>> > +		return 0;
>> > +
>> 
>> Same here, pretty sure rst is there and the generic function works but
>> if this update is required, it seems safe to do in the generic driver.
>
> The same thing... in the v7 version you suggested to not touch clk-pll
> driver.
>
> https://lore.kernel.org/linux-amlogic/1jd0ac5kpk.fsf@starbuckisacylon.baylibre.com/
>
> ...


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
