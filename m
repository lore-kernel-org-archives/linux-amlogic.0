Return-Path: <SRS0=b0VC=J2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB67C433B4
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 12:15:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05E6961456
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 12:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05E6961456
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M7FVwmyTLZwPJUvfDtZtG9fyhJcMoPtCh9RPJDWD47s=; b=lE/ME0idyKg5drbkonjdffZ/+
	yYnaJ/HcmnjPDpXVybsdU6T4OUuXJGC1D0MqzC9Mr1nzBdZnyqa+uwzKhR8tCn5SdBgHMw7Tu3OTj
	ID7y7i5xz8vX2QCo/HCeiPM+77wTm4LlKR1HowQiPCbdaLXf90k2jieccnWl7olK4IkFrVwlia41e
	CLL8dvTl8reBijaw/fjG8j1kZNgxKZR6uB5fQ8cdLifsr8f7YNAq6jVAWOJeTvHn/iIBq3T2Wnj9X
	DY6jvZRpWSxWyXZFCdfSPUvd92p7YyjObTvAItZ89ESQ7nLVl5HBMFDg86RsUtY7Vn2Ctp7HyPC3v
	XL46OMhlQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc5ZW-005bay-OP; Thu, 29 Apr 2021 12:15:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc5ZU-005bab-Ps
 for linux-amlogic@desiato.infradead.org; Thu, 29 Apr 2021 12:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=yRijLkfkG3QMx5ZZ+V2aLtoew1Ejz/66bv4l23pIpjo=; b=IAMphDhzbinTywhlqTW96EM4ms
 gYJ+VzeC9KpvYBFpF9VTdZTqqU/W3krQsZpP37LeL+KLkNz09+RInPxnr5RQoZhvV6WTWmGTvadFQ
 15NdeMTQZHufdQ+wr5kRqHVX+662HknuhwfD7Q3nF5Mtdu4q0g2YS+6cvGKbtOitCRV1JyaanMgl2
 DbnpjoU2dDI3ljDLJLu699+i4JW3j71PbndReGm/RBjGl8sUbv97R3p0qMdbZnFfWEukYatlTt6ry
 E79ElkOYnG52tlXNQXfrhIH8Lq6UCMUJiqXBlthfAqPKox5Mn8liZcRHBhH/TahmVurnz6iFfxWse
 9B+Lb2JQ==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc5ZR-000c9Z-D9
 for linux-amlogic@lists.infradead.org; Thu, 29 Apr 2021 12:15:07 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 b19-20020a05600c06d3b029014258a636e8so6520582wmn.2
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Apr 2021 05:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yRijLkfkG3QMx5ZZ+V2aLtoew1Ejz/66bv4l23pIpjo=;
 b=FzhLeC4gCNejTx5HoNxqezTO6fZRp9Z7mpGk1i7FcVLYC0Ps/Z0TCymd3LJOB24vsL
 c9oWNJlBC8hWdw/R4GpnNPXJ/URyvWgMETraIalCaT/NDsWHtKLHi9Z9tjUf5dlbEL+z
 GIbCK2Tbi0OkvfsN/jSIVUllehkIM55kcb4bFCRpECnzVXkLllhJ4+IYNOPG/DgQqLAG
 JG3LKj9L1f6Id6JZe7Nui687SfoS+ElcdMbQVVL1GSCX5XKeaR2C0lH+jmaWTeuPH4BO
 1RA+7lWSH/w5W8ZIxVGvvrNqEzXkLBwAdYdOBstiTmJTKydTTumFEZomRRheR+Vc9fYr
 IyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=yRijLkfkG3QMx5ZZ+V2aLtoew1Ejz/66bv4l23pIpjo=;
 b=ug+y7yS6ay0sm1Zx0EcmL9DIlnHkl5Zp2hvmLpXB5hk31n/izc/YNjb4Nu5IjD6LIU
 g762y8MojS1WBvvlN2FRPmSvJK8jB2Cth0IjWBiLNIl/YKwCrHlVFq0mYxePVfcFf5dH
 cMSBlwTIh8BSnOxiq90LmWzW6yxqKWhDWLnNM0B3WwPlpLIHU06RGl2EWfEhMf2r44zt
 uOhAPYyMRpTDLWsaywMmyNYAOVRZlRsmZ+u3DRlyGZo7+Zow8IQZHauOzgJeJfwlFykN
 +j8UE7lwfzVoHQyTH9XLnQQsapDD2uNdefodDfd3muQmYlJ0mEDiTQ+DxJDsJjrIhMSP
 mAvw==
X-Gm-Message-State: AOAM533ZLIo8I9wVtRzz8pqj2zquPNcxvOA378zYZ8MLruFSdLRSkFFI
 tmV7je3L5sqeMfjg30QdUWbQKg==
X-Google-Smtp-Source: ABdhPJx0km615u7GvO3ILb2I5zbhnFoL+VtBtfrAqmMAmXF6hZ4vspHOx0cmiCymM4mAxpMyeDtUIw==
X-Received: by 2002:a7b:c344:: with SMTP id l4mr9906537wmj.120.1619698502370; 
 Thu, 29 Apr 2021 05:15:02 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:c304:4b2b:4a79:1da9?
 ([2a01:e0a:90c:e290:c304:4b2b:4a79:1da9])
 by smtp.gmail.com with ESMTPSA id h10sm4993111wrt.40.2021.04.29.05.15.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 05:15:01 -0700 (PDT)
Subject: Re: [PATCH] clk: meson: g12a: fix gp0 and hifi ranges
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210429090325.60970-1-jbrunet@baylibre.com>
 <979eb290-6fc2-38df-0596-867b82d22226@baylibre.com>
 <1jim45juf1.fsf@starbuckisacylon.baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <0cfc7286-7be6-57ec-8040-a4370d0b4204@baylibre.com>
Date: Thu, 29 Apr 2021 14:15:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1jim45juf1.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_051505_549931_38B5734F 
X-CRM114-Status: GOOD (  32.91  )
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

On 29/04/2021 11:45, Jerome Brunet wrote:
> 
> On Thu 29 Apr 2021 at 11:20, Neil Armstrong <narmstrong@baylibre.com> wrote:
> 
>> On 29/04/2021 11:03, Jerome Brunet wrote:
>>> While some SoC samples are able to lock with a PLL factor of 55, others
>>> samples can't. ATM, a minimum of 60 appears to work on all the samples
>>> I have tried.
>>>
>>> Even with 60, it sometimes takes a long time for the PLL to eventually
>>> lock. The documentation says that the minimum rate of these PLLs DCO
>>> should be 3GHz, a factor of 125. Let's use that to be on the safe side.
>>>
>>> With factor range changed, the PLL seems to lock quickly (enough) so far.
>>> It is still unclear if the range was the only reason for the delay.
>>>
>>> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>> ---
>>>  drivers/clk/meson/g12a.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>>> index b080359b4645..a805bac93c11 100644
>>> --- a/drivers/clk/meson/g12a.c
>>> +++ b/drivers/clk/meson/g12a.c
>>> @@ -1603,7 +1603,7 @@ static struct clk_regmap g12b_cpub_clk_trace = {
>>>  };
>>>  
>>>  static const struct pll_mult_range g12a_gp0_pll_mult_range = {
>>> -	.min = 55,
>>> +	.min = 125,
>>>  	.max = 255,
>>>  };
>>>  
>>>
>>
>> I got other issues with GP0 when trying to use it for DSI on VIM3 & VIM3L.
>>
>> I had to do change the following to have it lock correctly and achieve rates usable for MIPI-DSI requested bandwidth:
>>
>> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
>> index cde07f7ebad6..897cd6db5c0f 100644
>> --- a/drivers/clk/meson/clk-pll.c
>> +++ b/drivers/clk/meson/clk-pll.c
>> @@ -391,9 +391,9 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>>                 meson_parm_write(clk->map, &pll->frac, frac);
>>         }
>>
>> -       /* If the pll is stopped, bail out now */
>> +       /* If the pll is stopped, bail out now * /
>>         if (!enabled)
>> -               return 0;
>> +               return 0;*/
> 
> This enables the PLL everytime set_rate() is called :/
> 
>>
>>         if (meson_clk_pll_enable(hw)) {
>>                 pr_warn("%s: pll did not lock, trying to restore old rate %lu\n",
>>
>> This one is tricky, for DSI the clock rate is set with assigned-clock-rates in DT, but
>> then the GP0 is seen as stopped and then the rate is never set.
> 
> Audio does the same - PLL is set and enabled afterward. This has been
> working so far.
> 
>>
>> When afterwards we enable the PLL, the rate set in the registers is invalid and never locks,
>> this permits setting the rate in the registers even if the PLL is
>> stopped.
> 
> There something to be explained here cause the register have been set
> before bailing out. What is happening ? The pokes before have no effect
> or are the value being reset at another point ?
> 
> I understand this need to address this concern but it does not seems
> related to this particular patch.
> 
>>
>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>> index 1b0167b8de3b..08174724a115 100644
>> --- a/drivers/clk/meson/g12a.c
>> +++ b/drivers/clk/meson/g12a.c
>> @@ -1602,8 +1602,8 @@ static struct clk_regmap g12b_cpub_clk_trace = {
>>  };
>>
>>  static const struct pll_mult_range g12a_gp0_pll_mult_range = {
>> -       .min = 55,
>> -       .max = 255,
>> +       .min = 120,
>> +       .max = 168,
>>  };
>>
>> I had to change the min/max to achieve a stable and functional rate of 720MHz after the ODs.
>>
> 
> How about the range provided in here ? This is range documented by AML
> (3GHz < DCO < 6GHz). 168 limits would limit the rate to ~4GHz which is
> way below spec and would negatively impact audio clocks.

For hifi pll right, not for GP0 ?

>> Neil
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
