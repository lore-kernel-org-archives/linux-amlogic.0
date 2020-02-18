Return-Path: <SRS0=xbMy=4G=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD4CC34026
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Feb 2020 09:06:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 604E924649
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Feb 2020 09:06:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oHZoJSmQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="uXc+7s1r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 604E924649
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UvoW1EZmMCruP1m4xf1QknjzPlCLFV1CL9RsQt8sfLs=; b=oHZoJSmQJaUkU3pdcdkVbdxg01
	JRzlm6DDFYGSjcwkL8QqXro7UzEgDZZ9j/Mjg9wAewmSKBIabz+vppni0i5azXFOKnzm4IAdOtrHo
	szFiTKuNhETFMrVz3vEdtrWAeERmSKku7zFYw6y89dt12fEk1F9UuaYbdzu1e1VlaNYoS/46VTHw8
	wsD72NMQGJpNjzR12L3+MPpMmFQgHwmS935u++b1fikDTjFZ1w8e1JHqOf81L0dxV8XsspZ03E02K
	si1ERFC87oAUQZqY67eL/BKPisNo8mISHrI/QvoaVMsSBhs2ObVA2VeKHRnaqoPe+HpOo6rZ8c5gG
	t778UjqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3ypD-0002GH-Ig; Tue, 18 Feb 2020 09:05:51 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3yp9-0002FQ-Q8
 for linux-amlogic@lists.infradead.org; Tue, 18 Feb 2020 09:05:50 +0000
Received: by mail-wr1-x441.google.com with SMTP id w15so22914571wru.4
 for <linux-amlogic@lists.infradead.org>; Tue, 18 Feb 2020 01:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=ZQOUNLnI2259PEgDQeFnGl4MBwAdHmsWL1wSexCinM4=;
 b=uXc+7s1riFQCb+A5ws5EF3BokKj3HF5Ic7fu+a6RWMuGmjkBH2YIJ5d/XCq/0hbPe8
 ZdV/SnkczBOx9DNcZDRkEG62+CVv+Ul71XEunTqjDbZba1X8yaPVIXjo8ZcC2X6TZwzV
 zJdM5EVbamvY8CL1TmWChxN3kC2d7sJcmT57hcBw7iuT3weuEUHczpA/dEa7J8NHyLSj
 3FfbhHrvX8TMlqVUm32ZicYOl4h6wkXdN6dPRY1WZRglffWh8F9fo3uwGhstowwATguW
 GlhpbGhH7eQOnT6OVc3ya1iec+VOHF2fM96YAJpoNJzX6sCVFkDt+WAG1J5VIhjCy3l/
 6FBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=ZQOUNLnI2259PEgDQeFnGl4MBwAdHmsWL1wSexCinM4=;
 b=HZkqUtOJH3/6peMuWCNo8a3hRZWuFYZjYiTX+F95rysc/qaKCOpSXeoDX4gD3oItOe
 tbo92DO6IhRLsCDnSxSiqnDI87nzBds03RkRDayK5YfNCyzu4h+9P0+xZo2UNsVy8hoy
 HtKuWj+BMKvJlKKnI+Ik7DCpiPeLNQ0oHhbtHCDRBvFb03p6teLW5TczJ6WcqYBujqkt
 RViXoBXPViq6Jh0ebwUhPp5iJIt4QleDEt4sXk6pOI3AcqXNUCq/58t7BH/tIEJoln+3
 2r8gW31K/UXiuhAwNxrxlJZ03mvo8KnJcCynBdi/DV/hwV8rdv867b32udduf8xhWSFm
 NQ2g==
X-Gm-Message-State: APjAAAVxE62vB0iSLEVOtcPPEQxH6kwfsh3XhQSVIx21eGMLw6w0GuHg
 57QXgJtIlzVuIg0D2tHmIwtnWg==
X-Google-Smtp-Source: APXvYqw7gVv24LXO4yo+TKhY0kNEn11cDs1o6RHPmwxTKhpnXMxlZFCrF93NRIGzbtr+nGTfG9euuQ==
X-Received: by 2002:a5d:5647:: with SMTP id j7mr27755061wrw.265.1582016745546; 
 Tue, 18 Feb 2020 01:05:45 -0800 (PST)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id w7sm2722224wmi.9.2020.02.18.01.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:05:44 -0800 (PST)
References: <20200120034937.128600-1-jian.hu@amlogic.com>
 <20200120034937.128600-3-jian.hu@amlogic.com>
 <1jftfq7ir8.fsf@starbuckisacylon.baylibre.com>
 <ce7d406e-b5bd-44c8-84fb-5edd3b3ffbce@amlogic.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v7 2/5] clk: meson: add support for A1 PLL clock ops
In-reply-to: <ce7d406e-b5bd-44c8-84fb-5edd3b3ffbce@amlogic.com>
Date: Tue, 18 Feb 2020 10:05:43 +0100
Message-ID: <1jd0ac5kpk.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_010547_913544_08B378D8 
X-CRM114-Status: GOOD (  20.11  )
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
 Jianxin Pan <jianxin.pan@amlogic.com>, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Qiufang Dai <qiufang.dai@amlogic.com>,
 Chandle Zou <chandle.zou@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 10 Feb 2020 at 07:11, Jian Hu <jian.hu@amlogic.com> wrote:

> Hi Jerome
>
> Thanks for your suggestions.
>
> On 2020/2/4 18:24, Jerome Brunet wrote:
>>
>> On Mon 20 Jan 2020 at 04:49, Jian Hu <jian.hu@amlogic.com> wrote:
>>
>>> Compared with the previous SoCs, self-adaption current module
>>> is newly added for A1, and there is no reset parm except the
>>> fixed pll. In A1 PLL, the PLL enable sequence is different, using
>>> the new power-on sequence to enable the PLL.
>>
>> Things are getting clearer thanks to Martin's suggestions and I can
>> understand what your driver is doing now
>>
>> However, I still have a problem with the fact that 2 different pll types
>> are getting intertwined in this driver. Parameters mandatory to one is
>> made optional to the other. Nothing clearly shows which needs what and
>> the combinatorial are quickly growing.
>>
>> Apparently the only real difference is in enable/disable, So I would
>> prefer if the a1 had dedicated function for these ops.
>>
>> I suppose you'll have to submit clk_hw_enable() and clk_hw_disable()
>> to the framework to call the appropriate ops dependind on the SoC.
>>
> I am confused here.
> What does clk_hw_is_enabled/clk_hw_enable/clk_hw_disable use here?

I'm asking you to make different callback for .enable() and .disable().
The .set_rate() callback of this driver needs to turn off and on the
clock, so it needs to call the appropriate one.

To do so, you should go through a clk_hw_xxxxx() function.

>
> clk_hw_is_enabled is intend to check a parm's existence? But
> clk_hw_is_enabled which is existed in CCF to check a PLL is locked or
> not. Maybe I understand wrong about your suggestions.
>
> Could you list a example for clk_hw_enable and clk_hw_disable function
> implementation?

drivers/clk/clk.c:523 : clk_hw_is_enabled()

clk_hw_enable() and clk_hw_disable() so you'll need to implement these
one and submit them.

>>>
>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>> ---
>>>   drivers/clk/meson/clk-pll.c | 47 +++++++++++++++++++++++++++++++------
>>>   drivers/clk/meson/clk-pll.h |  2 ++
>>>   2 files changed, 42 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
>>> index ddb1e5634739..10926291440f 100644
>>> --- a/drivers/clk/meson/clk-pll.c
>>> +++ b/drivers/clk/meson/clk-pll.c
>>> @@ -283,10 +283,14 @@ static void meson_clk_pll_init(struct clk_hw *hw)
>>>   	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
>>>     	if (pll->init_count) {
>>> -		meson_parm_write(clk->map, &pll->rst, 1);
>>> +		if (MESON_PARM_APPLICABLE(&pll->rst))
>>> +			meson_parm_write(clk->map, &pll->rst, 1);
>>> +
>>
>> replace by
>>          enabled = clk_hw_is_enabled(hw)
>>          if (enabled)
>>             clk_hw_disable(hw)
>>
> clk_hw_is_enabled here is used to check 'pll->rst'?
>>>   		regmap_multi_reg_write(clk->map, pll->init_regs,
>>>   				       pll->init_count);
>>> -		meson_parm_write(clk->map, &pll->rst, 0);
>>> +
>>> +		if (MESON_PARM_APPLICABLE(&pll->rst))
>>> +			meson_parm_write(clk->map, &pll->rst, 0);
>>
>>         /* restore if necessary */
>>         if (enabled)
>>            clk_hw_enable(hw)
>>
>>>   	}
>>>   }
>>>   @@ -295,8 +299,11 @@ static int meson_clk_pll_is_enabled(struct clk_hw
>>> *hw)
>>>   	struct clk_regmap *clk = to_clk_regmap(hw);
>>>   	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
>>>   -	if (meson_parm_read(clk->map, &pll->rst) ||
>>> -	    !meson_parm_read(clk->map, &pll->en) ||
>>> +	if (MESON_PARM_APPLICABLE(&pll->rst) &&
>>> +	    meson_parm_read(clk->map, &pll->rst))
>>> +		return 0;
>>> +
>>> +	if (!meson_parm_read(clk->map, &pll->en) ||
>>>   	    !meson_parm_read(clk->map, &pll->l))
>>>   		return 0;
>>
>> I suppose the pll can't be locked if it was in reset, so we could drop
>> the check on `rst` entirely to simplify the function
>>
> OK, I will drop 'rst' check.
>>>   @@ -323,13 +330,34 @@ static int meson_clk_pll_enable(struct clk_hw
>>> *hw)
>>>   		return 0;
>>>     	/* Make sure the pll is in reset */
>>> -	meson_parm_write(clk->map, &pll->rst, 1);
>>> +	if (MESON_PARM_APPLICABLE(&pll->rst))
>>> +		meson_parm_write(clk->map, &pll->rst, 1);
>>>     	/* Enable the pll */
>>>   	meson_parm_write(clk->map, &pll->en, 1);
>>>     	/* Take the pll out reset */
>>> -	meson_parm_write(clk->map, &pll->rst, 0);
>>> +	if (MESON_PARM_APPLICABLE(&pll->rst))
>>> +		meson_parm_write(clk->map, &pll->rst, 0);
>>> +
>>> +	/*
>>> +	 * Compared with the previous SoCs, self-adaption current module
>>> +	 * is newly added for A1, keep the new power-on sequence to enable the
>>> +	 * PLL. The sequence is:
>>> +	 * 1. enable the pll, delay for 10us
>>> +	 * 2. enable the pll self-adaption current module, delay for 40us
>>> +	 * 3. enable the lock detect module
>>> +	 */
>>> +	if (MESON_PARM_APPLICABLE(&pll->current_en)) {
>>> +		udelay(10);
>>> +		meson_parm_write(clk->map, &pll->current_en, 1);
>>> +		udelay(40);
>>> +	};
>>> +
>>> +	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
>>> +		meson_parm_write(clk->map, &pll->l_detect, 1);
>>> +		meson_parm_write(clk->map, &pll->l_detect, 0);
>>> +	}
>>>     	if (meson_clk_pll_wait_lock(hw))
>>>   		return -EIO;
>>> @@ -343,10 +371,15 @@ static void meson_clk_pll_disable(struct clk_hw *hw)
>>>   	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
>>>     	/* Put the pll is in reset */
>>> -	meson_parm_write(clk->map, &pll->rst, 1);
>>> +	if (MESON_PARM_APPLICABLE(&pll->rst))
>>> +		meson_parm_write(clk->map, &pll->rst, 1);
>>>     	/* Disable the pll */
>>>   	meson_parm_write(clk->map, &pll->en, 0);
>>> +
>>> +	/* Disable PLL internal self-adaption current module */
>>> +	if (MESON_PARM_APPLICABLE(&pll->current_en))
>>> +		meson_parm_write(clk->map, &pll->current_en, 0);
>>>   }
>>
>> With the above clarified, it should be easy to properly split the
>> functions between the legacy type and the a1 type.
>>
>> You'll need to update meson_clk_pll_set_rate() to call
>>   - clk_hw_is_enabled()
>>   - clk_hw_enable() and clk_hw_disable() (again, you'll need to add
>>   those in the framework first)
>>
>>>     static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long
>>> rate,
>>> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
>>> index 367efd0f6410..a2228c0fdce5 100644
>>> --- a/drivers/clk/meson/clk-pll.h
>>> +++ b/drivers/clk/meson/clk-pll.h
>>> @@ -36,6 +36,8 @@ struct meson_clk_pll_data {
>>>   	struct parm frac;
>>>   	struct parm l;
>>>   	struct parm rst;
>>> +	struct parm current_en;
>>> +	struct parm l_detect;
>>>   	const struct reg_sequence *init_regs;
>>>   	unsigned int init_count;
>>>   	const struct pll_params_table *table;
>>
>> .
>>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
