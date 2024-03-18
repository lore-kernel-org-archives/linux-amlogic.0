Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1499AC54E5D
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2024 12:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2lqGICjIb937qGINQPAcYa20LxLzwfqWJ6WgQR5jULs=; b=LSTj0BL9YInTAF
	OkaEHo3FOEYFrQQmIT0rhviLkEsX5kqgS4otWorczrBxXZKI6ND7aTuOzWd/eziGdf15e8i4VQfGC
	6ruEIjpRiuAw2DifrLsuOq8DeHMCUH3huRDrSPO+4HX4IiureuDcVYN6uP5hN7ynSfWHoXZP0/6Sj
	69zontbpwzDgA66CR5gdO/4bCfQG71fxZYKxyePc7cGZ/FJCaxJ5lnhMEYRchgcPXJrWJy25fo2HA
	sN+A59NkwWt0smEQjiHXlB/5aakgIg+SszRtlB46oPYmMIkMRc+qZgfJYsp4Qpdc958g0Sb5BeAB7
	kfxnN9JkPLTbzezS9ABQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmCEs-00000008XE7-3q8y;
	Mon, 18 Mar 2024 12:37:14 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmCEn-00000008XCl-233N
	for linux-amlogic@lists.infradead.org;
	Mon, 18 Mar 2024 12:37:13 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-33ed6078884so1435678f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2024 05:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710765427; x=1711370227; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=rOOelAXYkB/aiK2SaiRN9v1LrZq2BMclSsiRMOgV+hM=;
        b=QizRueRhwsZp3AoAL+gX4slu9WAgLlrtYU0YcsaY/x6fynp2edbKZyBMdtdmbcfQxs
         ZDmCscrJXXmudMMZdZCVYk3NNQcVA+yIWH/Yf85MZS3WVutKqvwB4iqbWZtyCSldhs+u
         9opz3e0LzViZW92ZJYAHXfzuL72ul6PlxTJBn8mXOsjtqAesP7xqcc9rieC0BNarJicl
         VnPiNmYsiGoew0x4h9xb4tQxQSB8rknzs719SZZtmu7u2g8i7JcgJKart6wwICDhRfLJ
         nm8QWnaOGCta9/T7aEtNNH5sALHdfrA/sjgV2dmAPjA7W0ac+ylJntQ4U9jbfi4Fidxr
         nplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710765427; x=1711370227;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOOelAXYkB/aiK2SaiRN9v1LrZq2BMclSsiRMOgV+hM=;
        b=cDbzCW9JlP104oy29NuwsfB0tmeMUigMT4Oiq9cnwc6hOLOZAwH5s2sKIGw5RmcJgC
         CvdSwSwn6L+pbik+x2lgv7ZO3/8K50G4Gxe3DuOqq8FiWqKnrd+Hny0jsVNCe37Fpoij
         DdFbbIKbwJv9TXtwdLzxzwTuKH/GDU2O0AQ2nP27CTlZSKUbmK2ufniBDLJm8Uh1MfPs
         6H5GY/XLeGJr4KanCdJAYx6TOJsretN7cHelqcmuW/ISNiu7sThfiDqBEHlnVCB+s+pe
         me/+IlGB0VmsKrzKFXiFlguxVRgIfge7rLY0ZZFyHR6jChPLwP49q78YeYrWzC12q2Wq
         pSdg==
X-Forwarded-Encrypted: i=1; AJvYcCXwEQDUxkliv9ZL2yiiiywlN/XEZeuu5WnGHRjqL/djbxgBZZ/tu56zxnhp5B6Oww7rjZUzWPHL7sfkcVrP+lHoP8V0a3VcWsNV/wvd6ydz4q4=
X-Gm-Message-State: AOJu0YyuMx3Ha18VWKqbKo9+uTXXjiUkolHyk05wiEVs//4d2mWfpb+E
	DY4i5al7//rlgJUnUq5SGQYonJTTq7j9I6rO45SeVhXU8KxTuhmB5Apz3HKmYIM=
X-Google-Smtp-Source: AGHT+IGH3TE2GhAXJz1wHAYIWwW1VoL15oPzUDNMTpeZ23Nb9XboEbKTQoGyB/c9i7ijddIXELni7w==
X-Received: by 2002:a5d:404a:0:b0:33e:6a81:d8b9 with SMTP id w10-20020a5d404a000000b0033e6a81d8b9mr10519425wrp.20.1710765426924;
        Mon, 18 Mar 2024 05:37:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e4d5:78c0:18b:ad85])
        by smtp.gmail.com with ESMTPSA id p6-20020adfe606000000b0033e79eca6dfsm9665379wrm.50.2024.03.18.05.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 05:37:06 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-14-jan.dakinevich@salutedevices.com>
 <ca80caab-2664-4797-a222-e14537eea440@linaro.org>
 <1jil1nhjwd.fsf@starbuckisacylon.baylibre.com>
 <6feba9ff-8bbf-4494-93f0-732679bc4032@salutedevices.com>
 <1j1q87hkq2.fsf@starbuckisacylon.baylibre.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Krzysztof Kozlowski
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
Date: Mon, 18 Mar 2024 13:19:28 +0100
In-reply-to: <1j1q87hkq2.fsf@starbuckisacylon.baylibre.com>
Message-ID: <1jwmpzg1hq.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_053709_796634_0D28DFA5 
X-CRM114-Status: GOOD (  20.37  )
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


On Mon 18 Mar 2024 at 11:55, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Sun 17 Mar 2024 at 18:52, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:
>
>> On 3/15/24 13:22, Jerome Brunet wrote:
>>> 
>>> On Fri 15 Mar 2024 at 11:00, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>>> 
>>>> On 15/03/2024 00:21, Jan Dakinevich wrote:
>>>>> This option allow to redefine the rate of DSP system clock.
>>>>
>>>> And why is it suitable for bindings? Describe the hardware, not what you
>>>> want to do in the driver.
>>>>
>>>>>
>>>>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml | 4 ++++
>>>>>  1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
>>>>> index df21dd72fc65..d2f23a59a6b6 100644
>>>>> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
>>>>> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
>>>>> @@ -40,6 +40,10 @@ properties:
>>>>>    resets:
>>>>>      maxItems: 1
>>>>>  
>>>>> +  sysrate:
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>> +    description: redefine rate of DSP system clock
>>>>
>>>> No vendor prefix, so is it a generic property? Also, missing unit
>>>> suffix, but more importantly I don't understand why this is a property
>>>> of hardware.
>>> 
>>> +1.
>>> 
>>> The appropriate way to set rate of the clock before the driver take over
>>> is 'assigned-rate', if you need to customize this for different
>>> platform.
>>> 
>>
>> It would be great, but it doesn't work. Below, is what I want to see:
>>
>> 	assigned-clocks =
>> 		<&clkc_audio AUD2_CLKID_PDM_SYSCLK_SEL>,
>> 		<&clkc_audio AUD2_CLKID_PDM_SYSCLK_DIV>;
>> 	assigned-clock-parents =
>> 		<&clkc_pll CLKID_FCLK_DIV3>,
>> 		<0>;
>> 	assigned-clock-rates =
>> 		<0>,
>> 		<256000000>;
>>
>> But regardles of this declaration, PDM's driver unconditionally sets
>> sysclk'rate to 250MHz and throws away everything that was configured
>> before, reparents audio2_pdm_sysclk_mux to hifi_pll and changes
>> hifi_pll's rate.
>>
>> This value 250MHz is declared here:
>>
>> static const struct axg_pdm_cfg axg_pdm_config = {
>> 	.filters = &axg_default_filters,
>> 	.sys_rate = 250000000,
>> };
>>
>> The property 'sysrate' is intended to redefine hardcoded 'sys_rate'
>> value in 'axg_pdm_config'.
>
> What is stopping you from removing that from the driver and adding
> assigned-rate to 250M is the existing platform ?

... Also, considering how PDM does work, I'm not sure I get the point of
the doing all this to go from 250MHz to 256Mhz.

PDM value is sampled at ~75% of the half period. That clock basically
feeds a counter and the threshold is adjusted based on the clock rate.

So there is no need to change the rate. Changing it is only necessary
when the captured audio rate is extremely slow (<8kHz) and the counter
may overflow. The driver already adjust this automatically.

So changing the input rate from 250MHz to 256MHz should not make any
difference.

>
>>
>>> Then you don't have to deal with it in the device driver.
>>> 
>>>>
>>>> Best regards,
>>>> Krzysztof
>>> 
>>> 


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
