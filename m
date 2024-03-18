Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B39C54E58
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2024 10:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gV46cN19kjA0odu8nOiYPxBoJBD9xFQHuc7aImgQu6g=; b=Vmqv6639FA6grY
	0PW8+UkS09Xb4vnT5QWf5tDGsdIrj4J9O+crwQ8DxFVy1nDb8NEsH+qoT908X4HWfStlQ9DU85b6s
	68Fb6EybNbkgv++XF4sjZLzw8U1v4TEJal3oLSCnV2/GlAo+CjdisnugEj6QhE22FSIw6QgRHyZCf
	/VC6TkxNQmyNr2a4KaHDkHa6xHpUBZueCI7nQ6AzONu1wHkX8cr8cvr3Cp5qp/AKRWHyd32DVRSvV
	lh/bI0psqnIkoWEPQAkAv4JTu5euCCK4CQgVZriI14aC+6DNrO40/qdXcVPelWavwab0UHCgje+C1
	8Gfz+KkTalo3d2W+rxIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmAfM-00000008EPf-3xpk;
	Mon, 18 Mar 2024 10:56:28 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmAfI-00000008EOU-3omM
	for linux-amlogic@lists.infradead.org;
	Mon, 18 Mar 2024 10:56:27 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-513dd2d2415so2611988e87.3
        for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2024 03:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710759383; x=1711364183; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=F3i97oXHe0eAhEUjD88GKSO+6DE7eLwPQSdXhNfZFbQ=;
        b=2hDL0eWnpsNwrOyDPIhIHqMXsPSNpYaJd5PuVvR1VVQCTnvATTpH0hiISPsembFCay
         3Fgn/wFUbM3TWByiMp9tAP94cLCtrrWIlu1LPWjK/hNhbtwS5A30K1DcgbTmEPqaofF5
         uiHL6itbUggespXyDn4RHu6gNnfd/cPC9/LvDtu+oBYE+dqFZPIfUOraKmvJyfoZToFe
         TxlNtR8ePJvKHz7BOqKNUp27/RFNiDmru0OwBV3+d4UNoEYXmlGzI4z8o95utxyp97dD
         8XMUyGFIoMyF8DrHuTp9N3YMDiM8DrletmMSUl3ClCH8p5VvCOdgras6QiyFMvOqcbBb
         plEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710759383; x=1711364183;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3i97oXHe0eAhEUjD88GKSO+6DE7eLwPQSdXhNfZFbQ=;
        b=n+2rBKB12bfandghSWGKeqn9qyg3CFzqUFUfhRCNdIuLlNrKpvxkKnMh6ODnk19fKo
         lHoW1WNYMwJs5OkmzixPgoEKlUha1uq+cK+SyqkJnAFZZjblyS46gJ9J6Grn/mT4fIUP
         OqpNKrlJza6BxHoolBokE52ZqTFtZB8xTfm8vmicIZQr95BDY3STTC6UNivDS5D07i+6
         Kr6ILVKb/mu2MZs3CgZM64sBiIjc18Jsp8tb0gl1+NxuYoESNQtff1gIp6tVuu85GkYg
         R+/BNBoTWZaHF5XNNG0FM1tnq4Wjhe8Xoh7H9h9R7xPijaSUfUnN/fX9hpQOwVAGJWu/
         RW0g==
X-Forwarded-Encrypted: i=1; AJvYcCWxU/errh1e+7hf5lgWYu5h9i5v+FpxJajXyTj5jWfNgTG14MhF2381blq6AZPfm0AgB31F5W/3KnOYM+97Xf72jnTWkcalv2v/n7pWCz+vv44=
X-Gm-Message-State: AOJu0YztMi57S4RRZmNx5vTR2xXngV4pSDQmKAKAeWz8wFjQX30Uo/i7
	vSBlZmRYOA5RgcrBOGM/RjRI0twOOiKNNEYtdwJrNxr+SlL5+a6wFbEJ2TqX4a7xKE38JiGkBtS
	W
X-Google-Smtp-Source: AGHT+IF2t1NObGaOQ+IPe7s03JmYlEbsyaNF+u7Gb3UFP+mZEEcwim7+2sDBYhdUxYtGEoaRHjxYsg==
X-Received: by 2002:a19:8c0f:0:b0:513:9da7:3792 with SMTP id o15-20020a198c0f000000b005139da73792mr7100240lfd.19.1710759382830;
        Mon, 18 Mar 2024 03:56:22 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e4d5:78c0:18b:ad85])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c3b9200b0041407100b3csm7809350wms.30.2024.03.18.03.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 03:56:22 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-14-jan.dakinevich@salutedevices.com>
 <ca80caab-2664-4797-a222-e14537eea440@linaro.org>
 <1jil1nhjwd.fsf@starbuckisacylon.baylibre.com>
 <6feba9ff-8bbf-4494-93f0-732679bc4032@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Neil Armstrong
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
Subject: Re: [PATCH 13/25] ASoC: dt-bindings: meson: axg-pdm: document
 'sysrate' property
Date: Mon, 18 Mar 2024 11:55:35 +0100
In-reply-to: <6feba9ff-8bbf-4494-93f0-732679bc4032@salutedevices.com>
Message-ID: <1j1q87hkq2.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_035624_978292_5DC3B8B4 
X-CRM114-Status: GOOD (  20.29  )
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


On Sun 17 Mar 2024 at 18:52, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

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

What is stopping you from removing that from the driver and adding
assigned-rate to 250M is the existing platform ?

>
>> Then you don't have to deal with it in the device driver.
>> 
>>>
>>> Best regards,
>>> Krzysztof
>> 
>> 


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
