Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319C0C54E5D
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2024 08:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QMKb73hhw+1W27zywODuOwteADo6iHtaX4PaUAZI7Ww=; b=AdIOu+uD9flnoq
	131JvsPgnTZGgi/Z1dJDF5xYlK06qi63ylJMC211G+c9n7Dj6O3jBr7E25IVV4OEDK1GcE88JV6WD
	zxDx2gGWVQ0w50pAVLnC1lQO+3geT58nQWGO6T7/aLf7AYIWVLF3SwBCi77+jsCska7wD0IyK3a+X
	hQbnpOo4OlWL6xvdxkzQ8+5ZKSnySL4+U2veAMJqjPGLyJmg1z8u/vslH+ozZtVzkYknSixe3iYvp
	gZjl9eTi6uNxj+WwfMrEsnYtSEOwDPwaek7r5S91k3jTiAJ1TfiklcdsHadLcdHwNYPrhD2fZycbt
	EJB+3Rz6Mo3pP5UK2SkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmUpr-0000000Buvf-1zg9;
	Tue, 19 Mar 2024 08:28:39 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmUpm-0000000Busn-3LSM
	for linux-amlogic@lists.infradead.org;
	Tue, 19 Mar 2024 08:28:37 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-414612cfd82so7314305e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 19 Mar 2024 01:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710836913; x=1711441713; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=hgFFAPN7B2IdqbSbHOUWcvyqPwWPHdQWlex71RuQvmY=;
        b=t54+f+jhkffXZNo/R1i0x3tIfm/T/LwPTELZxEdHHUyv0TEm0Zb5VkoCnOHRdTJ3lC
         03VfEOV1ZsISKhhFEe/YAoG85rQS1kpiTQoY4Y+g0eky0KYBivYWNkXUATpDBLON1SaA
         nFIA6LvM2jSFKDMAvea6WSDKr01jRrCmR3s8i2KuAFk8rIKKP260vtTuowiFrM4EzCm4
         rSDSlUEypzJv+16Ojcv21h31eJkG+hWng+1+DTB0j2xhKgZpJwqHMLm6VBsVCVBUbJFY
         QjrYVHrWGqDny2XwWnPIwHNxHPn/eCbeECXzHa92ss+Zz/2XOAubeT4vuU9LzIasqgPM
         Ij0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710836913; x=1711441713;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgFFAPN7B2IdqbSbHOUWcvyqPwWPHdQWlex71RuQvmY=;
        b=CTMMlK2A899U2Ab36RUcZhLDnZ5DN9/kRbQ+VgmsaChaNbkM3OiHM/YVc3s+j0RgIT
         EZLynlMFyMAMv0Xp+DDhEAsxc/C4nReA7ubRY+d5CK2Fy8g+bz7sYmtVOLLkbAO2H7KX
         jO//tQpabUoXwm4rIN2imULRTmAppambzkTEDURKRuDoC6xEsaEeUqEdzHTC4VDlCCkG
         RQIWF9O6zOlEs8N96wPZyCwT6dn7fjBiRcFy1Hs/sejiPtcOeI0h621NL2wiWIK08zTs
         7sCmZsCiP5py9Eamo2oH3g+s3oT3+FlW4UdWFi3DwlgXDVUx2uFLEunQ4ha/D84/tz8G
         oLjg==
X-Forwarded-Encrypted: i=1; AJvYcCVatCTbXjXjlCZi9lRhIn5o+DeiFf8Q+GeD79/mfqVc52Gt9/h6vz3sE0STizYircQom9WCxgZM93/y+cxZfI9FrUk10EgiIfxsIh52tfDJaGI=
X-Gm-Message-State: AOJu0Yz7gGy38TeVkqsa9xBqz9R2Rt2oy8bSv4TUu7WA0zVnkqQEpM2l
	AFbB4Y1bspQ4KV2dmcprYMJtzAqQniLMPhFUhzbvvkCYaF2jGWtl3iAVPTO95xI=
X-Google-Smtp-Source: AGHT+IF8VeQ4xCRzE1F2nR3lm7Kyoo5lbqorbXz3zLlgIR0czhWjHZf4ZYDwVRGEa2XhkhvSTql6LA==
X-Received: by 2002:adf:a358:0:b0:341:8666:ce2e with SMTP id d24-20020adfa358000000b003418666ce2emr913294wrb.0.1710836912716;
        Tue, 19 Mar 2024 01:28:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a757:fdcf:e3d7:eaed])
        by smtp.gmail.com with ESMTPSA id ay25-20020a5d6f19000000b0033e3cb02cefsm11883313wrb.86.2024.03.19.01.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 01:28:32 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-2-jan.dakinevich@salutedevices.com>
 <1j8r2jj24k.fsf@starbuckisacylon.baylibre.com>
 <cbfd9c66-cca5-49f5-9468-43710c48518e@salutedevices.com>
 <1jedc7hlg4.fsf@starbuckisacylon.baylibre.com>
 <d4cfef9e-3cae-4f1a-90b3-33d5707596f9@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@salutedevices.com
Subject: Re: [PATCH 01/25] clk: meson: a1: restrict an amount of 'hifi_pll'
 params
Date: Tue, 19 Mar 2024 09:21:27 +0100
In-reply-to: <d4cfef9e-3cae-4f1a-90b3-33d5707596f9@salutedevices.com>
Message-ID: <1jsf0mfwwg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_012835_024793_129266F0 
X-CRM114-Status: GOOD (  31.95  )
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


On Tue 19 Mar 2024 at 01:35, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> On 3/18/24 13:17, Jerome Brunet wrote:
>> 
>> On Sun 17 Mar 2024 at 17:17, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
>> 
>>> On 3/15/24 11:58, Jerome Brunet wrote:
>>>>
>>>> On Fri 15 Mar 2024 at 02:21, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
>>>>
>>>>> Existing values were insufficient to produce accurate clock for audio
>>>>> devices. New values are safe and most suitable to produce 48000Hz sample
>>>>> rate.
>>>>
>>>> The hifi pll is not about 48k only. I see no reason to restrict the PLL
>>>> to a single setting.
>>>>> You've provided no justification why the PLL driver can't reach the same
>>>> setting for 48k. The setting below is just the crude part. the fine
>>>> tuning is done done with the frac parameter so I doubt this provides a
>>>> more accurate rate.
>>>>
>>>
>>> You are right, it is not about 48k only. However, there are two issues.
>>>
>>> First, indeed, I could just extend the range of multipliers to 1..255.
>> 
>> Why 1..255 ? This is not what I'm pointing out
>> 
>> According to the datasheet - the range is 32 - 64, as currently
>> set in the driver.
>> 
>
> Could you point where in the doc the range 32..64 is documented?
> Documentation that I have may be not so complete, but I don't see there
> any mention about it.
>
> Anyway, range 32..64 of multipliers is not enough to produce accurate
> clock, and a need 128 for 48kHz.

A1 datasheet v0.4 - Section 7.6.3.2

>
>> The change you have provided request a multipler of 128/5 = 25,6
>> If you put assigned-rate = 614400000 in DT, I see no reason can find the
>> same solution on its own.
>> 
>
> The reasoning is following. I don't know why 32..64 range was declared
> for this clock, and whether it would be safe to extend it and include
> 128, which is required for 48kHz. But I know, that multiplier=128 is
> safe and works fine (together divider=5).

You have not answer my remark.
Mainline does not do everything like the AML SDK does. Saying you are
copying it because you know it works (in your opinion) is not good
enough.

I'm telling you that your hack is not necessary and so far, you have not
demonstrated that it is.

Also the multiplier range in m/n, not m alone.

>
>>> But I am unsure if hifi_pll is able to handle whole range of
>>> mulptipliers. The value 128 is taken from Amlogic's branch, and I am
>>> pretty sure that it works.
>> 
>>>
>>> Second, unfortunately frac parameter currently doesn't work. When frac
>>> is used enabling of hifi_pll fails in meson_clk_pll_wait_lock(). I see
>>> it when try to use 44100Hz and multipliers' range is set to 1..255. So,
>>> support of other rates than 48k requires extra effort.
>> 
>> Then your change is even more problematic because it certainly does not
>> disable frac ... which you say is broken.
>> 
>> That parameter should be removed with a proper comment explaining why
>> you are disabling it. That type a limitation / known issue should be
>> mentionned in your change.
>> 
>
> Handling of frac should not be removed, it should be fixed to achieve
> another rates. But that is not the goal of this commit.

You argued that frac was broken and that was partly why you introduced
this work around. I'm telling you this approach is incorrect.

So either :
* Remove frac for now, until it is fixed, because it is broken and add
  comment clearly explaining that quirk.
* Or fix it now.

Your choice.

>
>
>>>
>>>>>
>>>>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>>>>> ---
>>>>>  drivers/clk/meson/a1-pll.c | 8 ++++----
>>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
>>>>> index 4325e8a6a3ef..00e06d03445b 100644
>>>>> --- a/drivers/clk/meson/a1-pll.c
>>>>> +++ b/drivers/clk/meson/a1-pll.c
>>>>> @@ -74,9 +74,9 @@ static struct clk_regmap fixed_pll = {
>>>>>  	},
>>>>>  };
>>>>>  
>>>>> -static const struct pll_mult_range hifi_pll_mult_range = {
>>>>> -	.min = 32,
>>>>> -	.max = 64,
>>>>> +static const struct pll_params_table hifi_pll_params_table[] = {
>>>>> +	PLL_PARAMS(128, 5),
>>>>> +	{ },
>>>>>  };
>>>>>  
>>>>>  static const struct reg_sequence hifi_init_regs[] = {
>>>>> @@ -124,7 +124,7 @@ static struct clk_regmap hifi_pll = {
>>>>>  			.shift   = 6,
>>>>>  			.width   = 1,
>>>>>  		},
>>>>> -		.range = &hifi_pll_mult_range,
>>>>> +		.table = hifi_pll_params_table,
>>>>>  		.init_regs = hifi_init_regs,
>>>>>  		.init_count = ARRAY_SIZE(hifi_init_regs),
>>>>>  	},
>>>>
>>>>
>> 
>> 


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
