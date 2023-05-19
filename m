Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7960FC7EE26
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 May 2023 16:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEgp2QkhQkuB5EL5Ce4hj/7DRXElGWQwJYvS46sOWuQ=; b=B0aXGXfavbwNrU
	cz7VSrWSn1IC8ouIIYIYTqkJYmkhp5aB5AoLVJwMKzbtIKIFzip/xwKGMDakq3S9nKGBmc/sP8cvR
	mzAbBZpQaMgj5toFX+Q3a2Bc61ucOqySMLfLRwdHpdP1CMtSeXiGsPzF5WOxiCV66j50MPqhmoiRU
	KJNIO/boRN/DJ8jro0DRGhHkWXkM6K3JEp0kRVAyyg6WmQoaUFQLGXxelPwcWRKd2RcgCSZYzFB6r
	K1PxAb+yW0jVbt6gdnd7btZJmr+AhWjq3mjTyf3wteeO/rKyIRcG/nF1L7y4nsKN8955t29aByX8h
	AHUpqAyOyEmsXjW2083w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q03MI-00Gm3G-09;
	Fri, 19 May 2023 16:53:38 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q03ME-00Gm2X-06;
	Fri, 19 May 2023 16:53:35 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-96f850b32caso48529066b.3;
        Fri, 19 May 2023 09:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684515212; x=1687107212;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhqhbjiHgxhBhTzi47etqIFmqfwORl9bm/cK9jaX+JM=;
        b=DEklyVOfQsbEbCBMWdUCGnWOH4jzIlKnrndmHiYi0sRjjRfRU4bP9un9Gop+ujCHSo
         LfkAGT77ClkB+D4X42c2UO+/eUDamwTKh5UseZ10gNbEeXP6xTqLU26b3OgaLfuEtR6f
         Biuez7ZlaYBLyQ5YK9Kiv/81TVJYpZiuKn4VVqSLNoJxnsnkqJSUUoQAxYJswUW0SVSW
         wY+XJ68jcfwkyt8uM84jH2cm8k7sJjblVpMQzR0mlTwNWLyrE/36i8R1ZO2k5pafCfoW
         c6BqVDGlXj9RYiYC12ZM54eckX9KDGQYVw/F3MD/dB+1lINtgA0qOASIkqyQg/DNNtQI
         VZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684515212; x=1687107212;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uhqhbjiHgxhBhTzi47etqIFmqfwORl9bm/cK9jaX+JM=;
        b=KhrmZM5g92qG8+42uBmxdA0Vt8eKiFs5bTxYA8lORepOwCdeiZSMsANi06t/NdQC38
         YCtJs+4yDJ4l5GIfEeCX21s52013fGnMnR+j8lgJs6rJ5HSJPLrOR5/gIbSIPw7pB183
         TzpdamlH2lCUz8H6hBrNT2bxyO7DgsmMfYg4UzpTz6CHzXors2AtjqilfC9Ablk85qi9
         rywH+uqvM6O+XNV2D9J2y1gfA28GciMiuvHgQtKuOcWuld62ytmt0ZJAUjLj1Q4sxxQX
         WxZL8BWMzpP5iptsb8KhA7JreyUHIihtBwubZbRyOjf5P3UkmtgP3PWEtZBZNG/cpQtD
         QyLw==
X-Gm-Message-State: AC+VfDzAmgK8C+CaqeZkqfDBVfrNxX8f04O6jVf9gPsrQcqwDzMQSH7p
	OT02MpHy/UZ9GgICIqZLbhC2bC4TwkQ=
X-Google-Smtp-Source: ACHHUZ4hVhaPfvykSFb2arTSHtJsAmZ1A/Wffctw4MyiCBOqM32sfSknwD0JEmW484MWqZwVL8ttuQ==
X-Received: by 2002:a17:907:7f09:b0:94f:8aff:c8b3 with SMTP id qf9-20020a1709077f0900b0094f8affc8b3mr2392797ejc.28.1684515212198;
        Fri, 19 May 2023 09:53:32 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c53c:ab00:54b1:eb24:1f4e:3a15? (dynamic-2a01-0c23-c53c-ab00-54b1-eb24-1f4e-3a15.c23.pool.telefonica.de. [2a01:c23:c53c:ab00:54b1:eb24:1f4e:3a15])
        by smtp.googlemail.com with ESMTPSA id gv16-20020a1709072bd000b0094bb4c75695sm2009272ejc.194.2023.05.19.09.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 09:53:31 -0700 (PDT)
Message-ID: <29961a2e-5367-0685-0f3a-1910328ad3ab@gmail.com>
Date: Fri, 19 May 2023 18:53:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Dmitry Rokosov <DDRokosov@sberdevices.ru>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "rockosov@gmail.com" <rockosov@gmail.com>, kernel <kernel@sberdevices.ru>
References: <9faca2e6-b7a1-4748-7eb0-48f8064e323e@gmail.com>
 <cb79d313-c7a2-42e9-639a-63cb5366521a@gmail.com>
 <tyuyderm7i6otsgrntw2wj4k4ii5xwp2vngfa76eaguki7yuqa@322cjuotnr6q>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v4 4/4] pwm: meson: make full use of common clock
 framework
In-Reply-To: <tyuyderm7i6otsgrntw2wj4k4ii5xwp2vngfa76eaguki7yuqa@322cjuotnr6q>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_095334_097575_94549179 
X-CRM114-Status: GOOD (  34.94  )
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

On 19.05.2023 17:30, Dmitry Rokosov wrote:
> Hello Heiner,
> 
> Thank you for the patch series!
> 
> I am currently working on the Amlogic A1 clock driver and other
> peripheral devices, including PWM. During a discussion about the clock
> driver with Martin Blumenstingl, we found an intersection between the
> clock driver and your PWM CCF support patch series. Please see my
> comments below.
> 
> On Thu, Apr 13, 2023 at 07:54:46AM +0200, Heiner Kallweit wrote:
>> Newer versions of the PWM block use a core clock with external mux,
>> divider, and gate. These components either don't exist any longer in
>> the PWM block, or they are bypassed.
>> To minimize needed changes for supporting the new version, the internal
>> divider and gate should be handled by CCF too.
>>
>> I didn't see a good way to split the patch, therefore it's somewhat
>> bigger. What it does:
>>
>> - The internal mux is handled by CCF already. Register also internal
>>   divider and gate with CCF, so that we have one representation of the
>>   input clock: [mux] parent of [divider] parent of [gate]
>>   
>> - Now that CCF selects an appropriate mux parent, we don't need the
>>   DT-provided default parent any longer. Accordingly we can also omit
>>   setting the mux parent directly in the driver.
>>   
>> - Instead of manually handling the pre-div divider value, let CCF
>>   set the input clock. Targeted input clock frequency is
>>   0xffff * 1/period for best precision.
>>   
>> - For the "inverted pwm disabled" scenario target an input clock
>>   frequency of 1GHz. This ensures that the remaining low pulses
>>   have minimum length.
>>
>> I don't have hw with the old PWM block, therefore I couldn't test this
>> patch. With the not yet included extension for the new PWM block
>> (channel->clk coming directly from get_clk(external_clk)) I didn't
>> notice any problem. My system uses PWM for the CPU voltage regulator
>> and for the SDIO 32kHz clock.
>>
>> Note: The clock gate in the old PWM block is permanently disabled.
>> This seems to indicate that it's not used by the new PWM block.
>>
>> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>> Changes to RFT/RFC version:
>> - use parent_hws instead of parent_names for div/gate clock
>> - use devm_clk_hw_register where the struct clk * returned by
>>   devm_clk_register isn't needed
>>
>> v2:
>> - add patch 1
>> - add patch 3
>> - switch to using clk_parent_data in all relevant places
>> v3:
>> - add flag CLK_IGNORE_UNUSED
>> v4:
>> - remove variable tmp in meson_pwm_get_state
>> - don't use deprecated function devm_clk_register
> 
> [...]
> 
>> @@ -166,7 +158,11 @@ static int meson_pwm_calc(struct meson_pwm *meson, struct pwm_device *pwm,
>>  	if (state->polarity == PWM_POLARITY_INVERSED)
>>  		duty = period - duty;
>>  
>> -	fin_freq = clk_get_rate(channel->clk);
>> +	freq = div64_u64(NSEC_PER_SEC * (u64)0xffff, period);
>> +	if (freq > ULONG_MAX)
>> +		freq = ULONG_MAX;
>> +
>> +	fin_freq = clk_round_rate(channel->clk, freq);
>>  	if (fin_freq == 0) {
>>  		dev_err(meson->chip.dev, "invalid source clock frequency\n");
>>  		return -EINVAL;
> 
> As mentioned previously, we have discussed one optimization for PWM
> parent clock calculation. Many modern Amlogic SoCs include an RTC clock
> within the clock tree. This clock provides a stable and efficient 32kHz
> input for several clock objects that can be inherited through the muxes
> from the RTC clock.
> 
> In short, we aim to use the RTC clock parent directly for PWM to
> generate a 32kHz clock on the PWM lines. Martin has suggested one way to
> do so, which is described in [0]. You can also refer to our IRC
> discussion in [1].
> 
> I would appreciate your thoughts on this. Please let me know what you
> think.
> 

Requesting a frequency of (NSEC_PER_SEC * 0xffffULL / period) is based
on the assumption that the highest possible input frequency always
allows to generate a period that is close enough to the requested period.

To find the best parent you'd need a somewhat more complex logic outside CCF.
What you want is the parent where (f_parent * period / NSEC_PER_SEC) is
closest to an integer in the range 1 .. 0xffff.
IOW: max(abs((f_parent * period) % 10^9 - 5 * 10^8))

This can be done, question is whether it's needed and worth the effort.

This would be the generic solution. If you just want to handle the case
that period 1/32.768Hz is requested, an adjusted version of Martins's
pseudo-code formula should do.
Best I think as follow-up to my series.

> [...]
> 
> Links:
>     [0] https://lore.kernel.org/all/CAFBinCCPf+asVakAxeBqV-jhsZp=i2zbShByTCXfYYAQ6cCnHg@mail.gmail.com/
>     [1] https://libera.irclog.whitequark.org/linux-amlogic/2023-05-18
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
