Return-Path: <SRS0=6ZbY=36=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 021A2C35250
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Feb 2020 06:11:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C913520870
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Feb 2020 06:11:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OEYy32aH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C913520870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UXVwukMdVB3351E2C7J9i/wb5DHMqjhXn4o8dGS31Ds=; b=OEYy32aHF/4GYPF9lrBPp8bYX
	QxxEs82ZAbSGunp1iBfy58ppPa8BRpMYalfLjE1xoDrzlyq1HY/9WSqk+6UYc4ue4uFtQKk2KzDUs
	hRH0n5OHUvtVotfw5s3ZEzLcSFhydcGSWbgRS40NsQFm90QZlWS+XGfcF5o6hmk3nis34Std3Mgxq
	mfMHXpeWlUByWM8jenPKqVoRTDRLeuzPdwixu1/wbXk7eWqWZGr4UwYTWru26Nu0KZHShPWbSl4T9
	xIGwtkbD+gJIN4SHKynSsGBo12oTK3MwAyeYdmpe8qWBOdU/wIW8f6Xn9vF0nGWqj/4D8RknMApsH
	LG7k7lRRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j12Hr-00019I-00; Mon, 10 Feb 2020 06:11:15 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j12Hh-0000xJ-Fo; Mon, 10 Feb 2020 06:11:07 +0000
Received: from [10.7.0.4] (10.28.11.250) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server id 15.1.1591.10; Mon, 10 Feb 2020 14:11:25 +0800
From: Jian Hu <jian.hu@amlogic.com>
Subject: Re: [PATCH v7 2/5] clk: meson: add support for A1 PLL clock ops
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>
References: <20200120034937.128600-1-jian.hu@amlogic.com>
 <20200120034937.128600-3-jian.hu@amlogic.com>
 <1jftfq7ir8.fsf@starbuckisacylon.baylibre.com>
Message-ID: <ce7d406e-b5bd-44c8-84fb-5edd3b3ffbce@amlogic.com>
Date: Mon, 10 Feb 2020 14:11:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1jftfq7ir8.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
X-Originating-IP: [10.28.11.250]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200209_221105_532873_5055B903 
X-CRM114-Status: GOOD (  23.01  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome

Thanks for your suggestions.

On 2020/2/4 18:24, Jerome Brunet wrote:
> 
> On Mon 20 Jan 2020 at 04:49, Jian Hu <jian.hu@amlogic.com> wrote:
> 
>> Compared with the previous SoCs, self-adaption current module
>> is newly added for A1, and there is no reset parm except the
>> fixed pll. In A1 PLL, the PLL enable sequence is different, using
>> the new power-on sequence to enable the PLL.
> 
> Things are getting clearer thanks to Martin's suggestions and I can
> understand what your driver is doing now
> 
> However, I still have a problem with the fact that 2 different pll types
> are getting intertwined in this driver. Parameters mandatory to one is
> made optional to the other. Nothing clearly shows which needs what and
> the combinatorial are quickly growing.
> 
> Apparently the only real difference is in enable/disable, So I would
> prefer if the a1 had dedicated function for these ops.
> 
> I suppose you'll have to submit clk_hw_enable() and clk_hw_disable()
> to the framework to call the appropriate ops dependind on the SoC.
> 
I am confused here.
What does clk_hw_is_enabled/clk_hw_enable/clk_hw_disable use here?

clk_hw_is_enabled is intend to check a parm's existence? But 
clk_hw_is_enabled which is existed in CCF to check a PLL is locked or
not. Maybe I understand wrong about your suggestions.

Could you list a example for clk_hw_enable and clk_hw_disable function 
implementation?
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> ---
>>   drivers/clk/meson/clk-pll.c | 47 +++++++++++++++++++++++++++++++------
>>   drivers/clk/meson/clk-pll.h |  2 ++
>>   2 files changed, 42 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
>> index ddb1e5634739..10926291440f 100644
>> --- a/drivers/clk/meson/clk-pll.c
>> +++ b/drivers/clk/meson/clk-pll.c
>> @@ -283,10 +283,14 @@ static void meson_clk_pll_init(struct clk_hw *hw)
>>   	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
>>   
>>   	if (pll->init_count) {
>> -		meson_parm_write(clk->map, &pll->rst, 1);
>> +		if (MESON_PARM_APPLICABLE(&pll->rst))
>> +			meson_parm_write(clk->map, &pll->rst, 1);
>> +
> 
> replace by
>          enabled = clk_hw_is_enabled(hw)
>          if (enabled)
>             clk_hw_disable(hw)
> 
clk_hw_is_enabled here is used to check 'pll->rst'?
>>   		regmap_multi_reg_write(clk->map, pll->init_regs,
>>   				       pll->init_count);
>> -		meson_parm_write(clk->map, &pll->rst, 0);
>> +
>> +		if (MESON_PARM_APPLICABLE(&pll->rst))
>> +			meson_parm_write(clk->map, &pll->rst, 0);
> 
>         /* restore if necessary */
>         if (enabled)
>            clk_hw_enable(hw)
> 
>>   	}
>>   }
>>   
>> @@ -295,8 +299,11 @@ static int meson_clk_pll_is_enabled(struct clk_hw *hw)
>>   	struct clk_regmap *clk = to_clk_regmap(hw);
>>   	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
>>   
>> -	if (meson_parm_read(clk->map, &pll->rst) ||
>> -	    !meson_parm_read(clk->map, &pll->en) ||
>> +	if (MESON_PARM_APPLICABLE(&pll->rst) &&
>> +	    meson_parm_read(clk->map, &pll->rst))
>> +		return 0;
>> +
>> +	if (!meson_parm_read(clk->map, &pll->en) ||
>>   	    !meson_parm_read(clk->map, &pll->l))
>>   		return 0;
> 
> I suppose the pll can't be locked if it was in reset, so we could drop
> the check on `rst` entirely to simplify the function
> 
OK, I will drop 'rst' check.
>>   
>> @@ -323,13 +330,34 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>>   		return 0;
>>   
>>   	/* Make sure the pll is in reset */
>> -	meson_parm_write(clk->map, &pll->rst, 1);
>> +	if (MESON_PARM_APPLICABLE(&pll->rst))
>> +		meson_parm_write(clk->map, &pll->rst, 1);
>>   
>>   	/* Enable the pll */
>>   	meson_parm_write(clk->map, &pll->en, 1);
>>   
>>   	/* Take the pll out reset */
>> -	meson_parm_write(clk->map, &pll->rst, 0);
>> +	if (MESON_PARM_APPLICABLE(&pll->rst))
>> +		meson_parm_write(clk->map, &pll->rst, 0);
>> +
>> +	/*
>> +	 * Compared with the previous SoCs, self-adaption current module
>> +	 * is newly added for A1, keep the new power-on sequence to enable the
>> +	 * PLL. The sequence is:
>> +	 * 1. enable the pll, delay for 10us
>> +	 * 2. enable the pll self-adaption current module, delay for 40us
>> +	 * 3. enable the lock detect module
>> +	 */
>> +	if (MESON_PARM_APPLICABLE(&pll->current_en)) {
>> +		udelay(10);
>> +		meson_parm_write(clk->map, &pll->current_en, 1);
>> +		udelay(40);
>> +	};
>> +
>> +	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
>> +		meson_parm_write(clk->map, &pll->l_detect, 1);
>> +		meson_parm_write(clk->map, &pll->l_detect, 0);
>> +	}
>>   
>>   	if (meson_clk_pll_wait_lock(hw))
>>   		return -EIO;
>> @@ -343,10 +371,15 @@ static void meson_clk_pll_disable(struct clk_hw *hw)
>>   	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
>>   
>>   	/* Put the pll is in reset */
>> -	meson_parm_write(clk->map, &pll->rst, 1);
>> +	if (MESON_PARM_APPLICABLE(&pll->rst))
>> +		meson_parm_write(clk->map, &pll->rst, 1);
>>   
>>   	/* Disable the pll */
>>   	meson_parm_write(clk->map, &pll->en, 0);
>> +
>> +	/* Disable PLL internal self-adaption current module */
>> +	if (MESON_PARM_APPLICABLE(&pll->current_en))
>> +		meson_parm_write(clk->map, &pll->current_en, 0);
>>   }
> 
> With the above clarified, it should be easy to properly split the
> functions between the legacy type and the a1 type.
> 
> You'll need to update meson_clk_pll_set_rate() to call
>   - clk_hw_is_enabled()
>   - clk_hw_enable() and clk_hw_disable() (again, you'll need to add
>   those in the framework first)
> 
>>   
>>   static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
>> index 367efd0f6410..a2228c0fdce5 100644
>> --- a/drivers/clk/meson/clk-pll.h
>> +++ b/drivers/clk/meson/clk-pll.h
>> @@ -36,6 +36,8 @@ struct meson_clk_pll_data {
>>   	struct parm frac;
>>   	struct parm l;
>>   	struct parm rst;
>> +	struct parm current_en;
>> +	struct parm l_detect;
>>   	const struct reg_sequence *init_regs;
>>   	unsigned int init_count;
>>   	const struct pll_params_table *table;
> 
> .
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
