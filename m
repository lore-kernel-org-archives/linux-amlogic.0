Return-Path: <SRS0=HPE/=V3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8734C0650F
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jul 2019 15:15:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93F8B20693
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jul 2019 15:15:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ecNw82Wu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="smWwwiLf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93F8B20693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TxxZ6JyKSSXxgflJpwWx78QIpWCBT08M2rQIFEvAVOo=; b=ecNw82WuJ1v1kD
	xF6CKd+bPePjbIsAY+MFeYIyJqAgsptMnL4P4DJ0Tz21jgWLnu7HIty4XzIYBvYUvwajm/oPoVAxT
	jaAmcEnD1YvBaD0bC2XrG4zkK7iPV5xP723C2boPPIqWUQxE3YGaLwUBvTIDoGznWgfWteI/pqR93
	d8VWS+veRO8vOSl6qRWBUnWZLe5+XVz+Toffz/wFLmqnnKeXkFTTYAni8hgzY0JP0NByDMvErNiu/
	S70NPghRWzLecMc5efLDhvMHOzTBGXYZheCoB9V/eFVS0zRr6OsWhP91+huKToA9QEdOKXb1xdMAg
	A73smpDXDX3XdWMOEAjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsTq9-0003Zb-CE; Tue, 30 Jul 2019 15:15:01 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsTq4-0003Yh-NM
 for linux-amlogic@lists.infradead.org; Tue, 30 Jul 2019 15:14:59 +0000
Received: by mail-wr1-x443.google.com with SMTP id n4so66275993wrs.3
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Jul 2019 08:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZOGEYkIwZDJRgit5Pt/9TpD9rMgykD3hszhx8LLxEdg=;
 b=smWwwiLf3j46e0X52mDH16gAJ4lorwf5rxhpIq9a7R74u/Rk4g+2WCI1v2uBfBy/Fm
 ewIygKL+T59fL9NKFpS/3NcJnof5R/lkid08JHorLPc1vtTLFjS+CA/bgVsqE+sEZY+/
 sTQo++LswisgFgYk3IgSp+CPbDaU/C0YfK8iuSLnvuzyu/Jjydv5Hh1Xc7Fv6zeFIiWe
 9vK5+7pY9yVPmaPJrfLLEqW4CAwVRe/5oJmBmPg5eyrTCfKcUtmSGJMNkKT3ZqvS/iOB
 IIaFj31IDr7mwrT6hvLm7BzgkqpigO82IyUMsu8ZtnU7odGlnACKlLlLB0Fs3A/mR5xD
 ggfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZOGEYkIwZDJRgit5Pt/9TpD9rMgykD3hszhx8LLxEdg=;
 b=s0FRCMJnRFujfvp1tWhCObaoSJx2IBi/Dr5vOO+WNxCkKMfbUZb6upiUiI5CsAULWX
 pYIDjpe2hRMpAL/IRWjV7jV30ZhbDu8nVgMw+LTAWh/BPV1G/sTLwoErpHIg2WjZqZyF
 hkS9lhS9GaXn9qDttQeHkxtiP2KlVOnCjrL/3wHIfRqHumoHTkMI5dVwpFXDLoiGTcaH
 nl5yN5kkXQi3beWQN2y3qg+TW8Y+1yU9o4wFKMsROElMkDxwMM8BZ3WpUvDCWXZm0Sbp
 NTfq3PtkZtvtpxquv5H02sJCYs63ARrCyVk/5lDx5jCPaIOoC0IVgohinLa+B5AIYoeQ
 m20Q==
X-Gm-Message-State: APjAAAWLio0RIujzo6iuoSvJrdPkrtq6LXm3hiQFtJpyHhjEjRcEnXrd
 ICy2GlGJv5PqnfeIjCpjaNiKn0A6Q8k=
X-Google-Smtp-Source: APXvYqwlCadMa0VRCkkH404iVtKGzkG2DQngT4Y19XlQIJdiCa7AurcA71F4z7GNTbJVdZ+NJBCa1Q==
X-Received: by 2002:a5d:4d81:: with SMTP id b1mr47348036wru.27.1564499694615; 
 Tue, 30 Jul 2019 08:14:54 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f204sm98079780wme.18.2019.07.30.08.14.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 08:14:53 -0700 (PDT)
Subject: Re: [PATCH 3/4] clk: meson: g12a: add notifiers to handle cpu clock
 change
To: Jerome Brunet <jbrunet@baylibre.com>
References: <20190729131656.7308-1-narmstrong@baylibre.com>
 <20190729131656.7308-4-narmstrong@baylibre.com>
 <1j36in3okl.fsf@starbuckisacylon.baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <e4ed8d79-a385-fcfc-b587-da6a2b1d2346@baylibre.com>
Date: Tue, 30 Jul 2019 17:14:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1j36in3okl.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_081456_792512_60017BFA 
X-CRM114-Status: GOOD (  28.72  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 30/07/2019 10:37, Jerome Brunet wrote:
> On Mon 29 Jul 2019 at 15:16, Neil Armstrong <narmstrong@baylibre.com> wrote:
> 
>> In order to implement clock switching for the CLKID_CPU_CLK and
>> CLKID_CPUB_CLK, notifiers are added on specific points of the
>> clock tree :
>>
>> cpu_clk / cpub_clk
>> |   \- cpu_clk_dyn
>> |      |  \- cpu_clk_premux0
>> |      |        |- cpu_clk_postmux0
>> |      |        |    |- cpu_clk_dyn0_div
>> |      |        |    \- xtal/fclk_div2/fclk_div3
>> |      |        \- xtal/fclk_div2/fclk_div3
>> |      \- cpu_clk_premux1
>> |            |- cpu_clk_postmux1
>> |            |    |- cpu_clk_dyn1_div
>> |            |    \- xtal/fclk_div2/fclk_div3
>> |            \- xtal/fclk_div2/fclk_div3
>> \ sys_pll / sys1_pll
>>
>> This for each cluster, a single one for G12A, two for G12B.
>>
>> Each cpu_clk_premux1 tree is marked as read-only and CLK_SET_RATE_NO_REPARENT,
>> to be used as "parking" clock in a safe clock frequency.
>>
>> A notifier is added on each cpu_clk_premux0 to detech when CCF want to
>> change the frequency of the cpu_clk_dyn tree.
>> In this notifier, the cpu_clk_premux1 tree is configured to use the xtal
>> clock and then the cpu_clk_dyn is switch to cpu_clk_premux1 while CCF
>> updates the cpu_clk_premux0 tree.
>>
>> A notifier is added on each sys_pll/sys1_pll to detect when CCF wants to
>> change the PLL clock source of the cpu_clk.
>> In this notifier, the cpu_clk is switched to cpu_clk_dyn while CCF
>> updates the sys_pll/sys1_pll frequency.
>>
>> A third small notifier is added on each cpu_clk / cpub_clk and cpu_clk_dyn,
>> add a small delay at PRE_RATE_CHANGE/POST_RATE_CHANGE to let the other
>> notofiers change propagate before changing the cpu_clk_premux0 and sys_pll
>> clock trees.
>>
>> This notifier set permits switching the cpu_clk / cpub_clk without any
>> glitches and using a safe parking clock while switching between sub-GHz
>> clocks using the cpu_clk_dyn tree.
>>
>> This setup has been tested and validated on the Amlogic G12A and G12B
>> SoCs running the arm64 cpuburn at [1] and cycling between all the possible
>> cpufreq translations of each cluster and checking the final frequency using
>> the clock-measurer, script at [2].
>>
>> [1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
>> [2] https://gist.github.com/superna9999/d4de964dbc0f84b7d527e1df2ddea25f

Signoff missing.... will fix in v2

>> ---
>>  drivers/clk/meson/g12a.c | 567 +++++++++++++++++++++++++++++++++++----
>>  1 file changed, 521 insertions(+), 46 deletions(-)
>>
>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>> index e4957fd9f91f..23162310c7ee 100644
>> --- a/drivers/clk/meson/g12a.c
>> +++ b/drivers/clk/meson/g12a.c
>> @@ -14,6 +14,7 @@
>>  #include <linux/init.h>
>>  #include <linux/of_device.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/clk.h>
>>  
>>  #include "clk-mpll.h"
>>  #include "clk-pll.h"
>> @@ -88,16 +89,9 @@ static struct clk_regmap g12a_fixed_pll = {
>>  	},
>>  };
>>  
>> -/*
>> - * Internal sys pll emulation configuration parameters
>> - */
>> -static const struct reg_sequence g12a_sys_init_regs[] = {
>> -	{ .reg = HHI_SYS_PLL_CNTL1,	.def = 0x00000000 },
>> -	{ .reg = HHI_SYS_PLL_CNTL2,	.def = 0x00000000 },
>> -	{ .reg = HHI_SYS_PLL_CNTL3,	.def = 0x48681c00 },
>> -	{ .reg = HHI_SYS_PLL_CNTL4,	.def = 0x88770290 },
>> -	{ .reg = HHI_SYS_PLL_CNTL5,	.def = 0x39272000 },
>> -	{ .reg = HHI_SYS_PLL_CNTL6,	.def = 0x56540000 },
>> +static const struct pll_mult_range g12a_sys_pll_mult_range = {
>> +	.min = 128,
>> +	.max = 250,
>>  };
> 
> The init sequence is removed, I suppose you were concerned about
> glitching the clock on startup ?
> 
> Without the init sequence, it will inherit whatever is left by the
> bootloader. We have seen in the past that this is not desirable.
> 
> I'm mostly concerned about CNTL3 to CNTL6. Should we apply the sequence
> on .set_rate() instead ? It should be safe then ?
> 

This PLL (and the SYS1_PLL) cannot be disabled (thus re-initialized) until
the cpu has been parked on a safe clock, and the default beahavior of the
current G12A & G12B BL2 is to setup this PLL and the SYS1_PLL to start with
the cores at 1,2GHz. So we can consider theses PLLs has been correctly
initialized, thus removing the init code and still be safe.

>>
> 
> [...]
> 
>>  
>> @@ -364,16 +366,50 @@ static struct clk_regmap g12a_cpu_clk_premux1 = {
>>  	},
>>  	.hw.init = &(struct clk_init_data){
>>  		.name = "cpu_clk_dyn1_sel",
>> -		.ops = &clk_regmap_mux_ro_ops,
>> +		.ops = &clk_regmap_mux_ops,
>>  		.parent_data = (const struct clk_parent_data []) {
>>  			{ .fw_name = "xtal", },
>>  			{ .hw = &g12a_fclk_div2.hw },
>>  			{ .hw = &g12a_fclk_div3.hw },
>>  		},
>>  		.num_parents = 3,
>> +		/* This sub-tree is used a parking clock */
>> +		.flags = CLK_SET_RATE_NO_REPARENT
>>  	},
>>  };
>>  
>> +#define SYS_CPU_DYN_ENABLE	BIT(26)
>> +
>> +/* This divider uses bit 26 to take change in account */
>> +static int g12a_cpu_clk_mux0_div_set_rate(struct clk_hw *hw, unsigned long rate,
>> +					  unsigned long parent_rate)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	ret = divider_get_val(rate, parent_rate, div->table, div->width,
>> +			      div->flags);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	val = (unsigned int)ret << div->shift;
>> +
>> +	regmap_update_bits(clk->map, HHI_SYS_CPU_CLK_CNTL0,
>> +			   SYS_CPU_DYN_ENABLE, SYS_CPU_DYN_ENABLE);
>> +
>> +	return regmap_update_bits(clk->map, div->offset,
>> +				  clk_div_mask(div->width) << div->shift |
>> +				  SYS_CPU_DYN_ENABLE, val);
>> +};
>> +
>> +const struct clk_ops g12a_cpu_clk_mux0_div_ops = {
>> +	.recalc_rate = clk_regmap_div_recalc_rate,
>> +	.round_rate = clk_regmap_div_round_rate,
>> +	.set_rate = g12a_cpu_clk_mux0_div_set_rate,
>> +};
> 
> I would prefer if we could keep the clock drivers and clock controllers
> separated.
> 
> Could you move the above above in another file ?

Yup, done

> 
>> +
> 
> [...]
> 
>>  
>> +/* This divider uses bit 26 to take change in account */
>> +static int g12b_cpub_clk_mux0_div_set_rate(struct clk_hw *hw,
>> +					   unsigned long rate,
>> +					   unsigned long parent_rate)
>> +{
>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>> +	struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	ret = divider_get_val(rate, parent_rate, div->table, div->width,
>> +			      div->flags);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	val = (unsigned int)ret << div->shift;
>> +
>> +	regmap_update_bits(clk->map, HHI_SYS_CPUB_CLK_CNTL,
> 
> Unless I missed something, this function is same as the g12a with the
> exception of the register address.
> 
> It seems this clock could have its own clock type and its own data
> structure to store the 'dyn enable' register parameter.

Yup done

> 
>> +			   SYS_CPU_DYN_ENABLE, SYS_CPU_DYN_ENABLE);
>> +
>> +	return regmap_update_bits(clk->map, div->offset,
>> +				  clk_div_mask(div->width) << div->shift |
>> +				  SYS_CPU_DYN_ENABLE, val);
>> +};
>> +
>> +static const struct clk_ops g12b_cpub_clk_mux0_div_ops = {
>> +	.recalc_rate = clk_regmap_div_recalc_rate,
>> +	.round_rate = clk_regmap_div_round_rate,
>> +	.set_rate = g12b_cpub_clk_mux0_div_set_rate,
>> +};
>> +
> 
> [...]
> 
>> +
>> +static int g12a_cpu_clk_postmux_notifier_cb(struct notifier_block *nb,
>> +					    unsigned long event, void *data)
>> +{
>> +	struct g12a_cpu_clk_postmux_nb_data *nb_data =
>> +		container_of(nb, struct g12a_cpu_clk_postmux_nb_data, nb);
>> +
>> +	switch (event) {
>> +	case PRE_RATE_CHANGE:
>> +		/*
>> +		 * This notifier means cpu_clk_postmux0 clock will be changed
>> +		 * to feed cpu_clk, this is the current path :
>> +		 * cpu_clk
>> +		 *    \- cpu_clk_dyn
>> +		 *          \- cpu_clk_postmux0
>> +		 *                \- cpu_clk_muxX_div
>> +		 *                      \- cpu_clk_premux0
>> +		 *				\- fclk_div3 or fclk_div2
>> +		 *		OR
>> +		 *                \- cpu_clk_premux0
>> +		 *			\- fclk_div3 or fclk_div2
>> +		 */
>> +
>> +		/* Setup cpu_clk_premux1 to xtal */
>> +		clk_hw_set_parent(nb_data->cpu_clk_premux1,
>> +				  nb_data->xtal);
>> +
>> +		/* Setup cpu_clk_postmux1 to bypass divider */
>> +		clk_hw_set_parent(nb_data->cpu_clk_postmux1,
>> +				  nb_data->cpu_clk_premux1);
>> +
>> +		/* Switch to parking clk on cpu_clk_postmux1 */
>> +		clk_hw_set_parent(nb_data->cpu_clk_dyn,
>> +				  nb_data->cpu_clk_postmux1);
>> +
>> +		/*
>> +		 * Now, cpu_clk is 24MHz in the current path :
>> +		 * cpu_clk
>> +		 *    \- cpu_clk_dyn
>> +		 *          \- cpu_clk_postmux1
>> +		 *                \- cpu_clk_premux1
>> +		 *                      \- xtal
>> +		 */
>> +
>> +		udelay(100);
> 
> Just curious about the this 100us delay. It seems fairly long, even at
> 24MHz. In your stress tests, have you tried shorter delays ? 10us maybe ?

Honestly no, I took the values from Amlogic implementation to be safe for
the first implementation, and I gave all my test scripts and utilities for
others to re-run them to eventually reduce these values to 10us in a second
time.

> 
>> +
>> +		return NOTIFY_OK;
>> +
>> +	case POST_RATE_CHANGE:
>> +		/*
>> +		 * The cpu_clk_postmux0 has ben updated, now switch back
>> +		 * cpu_clk_dyn to cpu_clk_postmux0 and take the changes
>> +		 * in account.
>> +		 */
>> +
>> +		/* Configure cpu_clk_dyn back to cpu_clk_postmux0 */
>> +		clk_hw_set_parent(nb_data->cpu_clk_dyn,
>> +				  nb_data->cpu_clk_postmux0);
>> +
>> +		/*
>> +		 * new path :
>> +		 * cpu_clk
>> +		 *    \- cpu_clk_dyn
>> +		 *          \- cpu_clk_postmux0
>> +		 *                \- cpu_clk_muxX_div
>> +		 *                      \- cpu_clk_premux0
>> +		 *				\- fclk_div3 or fclk_div2
>> +		 *		OR
>> +		 *                \- cpu_clk_premux0
>> +		 *			\- fclk_div3 or fclk_div2
>> +		 */
>> +
>> +		udelay(100);
>> +
>> +		return NOTIFY_OK;
>> +
>> +	default:
>> +		return NOTIFY_DONE;
>> +	}
>> +}
>> +

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
