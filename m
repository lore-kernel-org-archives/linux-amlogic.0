Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3A5C54E60
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2024 05:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y0Zmn1KVAXBrCgS6ldKI55dbMeBxUfbwHdgSO0W6zd4=; b=rymVAzgcIJLESq
	I4Fm/W8IcdK8lIO0K7Pxwa8We+08h/ASvcPMM2MmXrlHENJahwblUpoaasmNI5bGHMlZfpWUjiQy3
	TXusqPq9HffOmAJuvl2H3Yy0I0CHwXDAiXHZu7umMJ1EvOFG6OGe5AFZKpvj9o9CLVHazVOye5jlF
	I9Xj1F8YccCVxV/84wTAhIB8Bpl7j0DpioJA6lpNnc070Wa9lKCvgCxLV4eIjayGvUIIrCZbUMkc6
	CEKh2qLIQAHvv5yWs7JAikkn23lbqDBabCgTDpXJu/tIrR8u4z/n9XU4hcJTbNtqCw2I1ZvIVKQK1
	HBlR/2UTQGAEKdd8Zc8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmRrR-0000000BJbm-1Jm5;
	Tue, 19 Mar 2024 05:18:05 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmRrN-0000000BJaH-089V
	for linux-amlogic@lists.infradead.org;
	Tue, 19 Mar 2024 05:18:02 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2d4a901e284so34856231fa.1
        for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2024 22:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710825479; x=1711430279; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JI2FbCtp4a1d8gqLlxYEpKkEq7SXIcQUhF5rSMJv6eY=;
        b=W/JwnGR+M3DI7Styip9Vju4d1adhj/8kSg+ULjLzd1XB+3Hlw5WIxoBFcp/8L6glFx
         8E6Mn+lmRO/chshxZxy9gWhSYF4rbIyhhYUQNLIEfHiiQUjZGjIqP3OxeLdHzjFaQdVr
         +GRfmdT33xXxG0mqjqp4LQtRIkCr+FSPsZj4ZTndGpx9fSe7kCl3OsaFt9VUdMkp5CNb
         wJ0GqWicyXATiQiZI2VjIZjBBUXCj5aRxfkJYWoixH4Qcn3Y6P8e5Q1Ki3397pM7T70m
         aogZhAe1pLimI2xeD5DFbQVgAsD6M+mEI+dtXBwXzQ3bl9JwuuRAcGOtHFlw4yxYR3/m
         smOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710825479; x=1711430279;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JI2FbCtp4a1d8gqLlxYEpKkEq7SXIcQUhF5rSMJv6eY=;
        b=QvwivwzgV3Lu2BuzuOp7/bnlr0Q6nfKa1UpJsztqIwCMsEheFg3UNl1RJnzqicFdyL
         i9RqJXSC/jb9oLG6nBI9vG8wWdqunFqnI59pK9Lb0JYXD+rJ6ON0bZ49ZzHJvdJlZ1we
         DpDPSyw9pbYVzM0ZxpCgnl3XaBf4hDvAe8jC18iD9D+m48vnNDbcimQp9+Pr3VzqP0z8
         8wcJkz5KBvii9ltBJ9Q8+dGzWQxm1p9sumtrujOcVwcjTloO69dVjqXQxcsmAx8JDwDw
         +zWk/6pQVTD4EByCdok9HxsfTOt38Dkar2jN5jQiLbuFylpAYT7gbep8wM3nwYRa7MIy
         ZmXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCFq6BEQwR8dnYdX5nNGLDvj0eFml1AbV/or9MS5aDCb4BN5VNaBSr/xaumWsKQyEQTZ31Mrha5dphJQTzlcXFi5OBiNCdNVm3TZLoGHyKm1I=
X-Gm-Message-State: AOJu0Yy7milK3oyo2sMmKhQgXnAgBa8COMPYnPPF+qCm5bmuUBt2jkaK
	FgRrY5x4iIbYKRmvRdhnUORYpPohwmRpXQKg+4G0hun3wN25bBlLIihR9R7HEFM=
X-Google-Smtp-Source: AGHT+IHar+3YLlq5DM7n+Ac5r+Zn05BDnf47HvVfCmOszqWWqnMfN5usck6Hs24uZ5aHqMoY3k04LQ==
X-Received: by 2002:a05:651c:337:b0:2d4:513d:7b34 with SMTP id b23-20020a05651c033700b002d4513d7b34mr5860519ljp.17.1710825478704;
        Mon, 18 Mar 2024 22:17:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id dm18-20020a170907949200b00a45200fe2b5sm5566916ejc.224.2024.03.18.22.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 22:17:58 -0700 (PDT)
Message-ID: <1eb98856-dd51-4fab-84d3-392bc4c60e3f@linaro.org>
Date: Tue, 19 Mar 2024 06:17:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/25] ASoC: dt-bindings: meson: axg-pdm: document
 'sysrate' property
Content-Language: en-US
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-gpio@vger.kernel.org, kernel@salutedevices.com
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-14-jan.dakinevich@salutedevices.com>
 <ca80caab-2664-4797-a222-e14537eea440@linaro.org>
 <1jil1nhjwd.fsf@starbuckisacylon.baylibre.com>
 <6feba9ff-8bbf-4494-93f0-732679bc4032@salutedevices.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <6feba9ff-8bbf-4494-93f0-732679bc4032@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_221801_146693_B5ECDA70 
X-CRM114-Status: GOOD (  20.41  )
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

On 17/03/2024 16:52, Jan Dakinevich wrote:
> 
> 
> On 3/15/24 13:22, Jerome Brunet wrote:
>>
>> On Fri 15 Mar 2024 at 11:00, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>>
>>> On 15/03/2024 00:21, Jan Dakinevich wrote:
>>>> This option allow to redefine the rate of DSP system clock.
>>>
>>> And why is it suitable for bindings? Describe the hardware, not what you
>>> want to do in the driver.
>>>
>>>>
>>>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
>>>> index df21dd72fc65..d2f23a59a6b6 100644
>>>> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
>>>> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
>>>> @@ -40,6 +40,10 @@ properties:
>>>>    resets:
>>>>      maxItems: 1
>>>>  
>>>> +  sysrate:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description: redefine rate of DSP system clock
>>>
>>> No vendor prefix, so is it a generic property? Also, missing unit
>>> suffix, but more importantly I don't understand why this is a property
>>> of hardware.
>>
>> +1.
>>
>> The appropriate way to set rate of the clock before the driver take over
>> is 'assigned-rate', if you need to customize this for different
>> platform.
>>
> 
> It would be great, but it doesn't work. Below, is what I want to see:
> 
> 	assigned-clocks =
> 		<&clkc_audio AUD2_CLKID_PDM_SYSCLK_SEL>,
> 		<&clkc_audio AUD2_CLKID_PDM_SYSCLK_DIV>;
> 	assigned-clock-parents =
> 		<&clkc_pll CLKID_FCLK_DIV3>,
> 		<0>;
> 	assigned-clock-rates =
> 		<0>,
> 		<256000000>;
> 
> But regardles of this declaration, PDM's driver unconditionally sets

That's driver's problem. You do not change bindings, just because your
driver behaves differently. Just fix driver.

> sysclk'rate to 250MHz and throws away everything that was configured
> before, reparents audio2_pdm_sysclk_mux to hifi_pll and changes
> hifi_pll's rate.
> 
> This value 250MHz is declared here:
> 
> static const struct axg_pdm_cfg axg_pdm_config = {
> 	.filters = &axg_default_filters,
> 	.sys_rate = 250000000,
> };
> 
> The property 'sysrate' is intended to redefine hardcoded 'sys_rate'
> value in 'axg_pdm_config'.

What does it have to do with bindings? Change driver if you are not
happy how it operates.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
