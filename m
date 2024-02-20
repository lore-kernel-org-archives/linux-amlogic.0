Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC65C48BC4
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Feb 2024 10:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p/1kJeOPVIUME1LNdJR/gCkJQZMUD9IJClnTA1MOC6w=; b=PCZbIj+QNvFNbu
	NkOssJc0Ygdxfz0f2yPoLHsRJ3VZWhEu/G6phKwQ9OEhHIKgGM3LO24zjHIIhggsem05veBRjonxa
	dP3U3ChmM1OKrzeaMGNjm70p/picFrn9uKP3fIux438NrKJfnoVRT0QQagMG/wDpyXR9ziRksZPbe
	GY1EZ/tcbnCXNbw5SlgaAz8+USAUG1XCK7gRsWD0WXG4inwBHMUNwlf+zCu7bEb3PG1Ic6Kkx55X5
	O2T1myuRhZkeZDJb53xugwjLKx3ZlUv82q+SUboFEttjz/JWFOuKUuTOi/ATpFSeGRDavy+KKVMbi
	cGMpzvw0g0q7QEiUxN0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcMwf-0000000E9hk-3FWX;
	Tue, 20 Feb 2024 10:01:49 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcMwc-0000000E9eZ-1L8b
	for linux-amlogic@lists.infradead.org;
	Tue, 20 Feb 2024 10:01:48 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-512b3b04995so2055457e87.3
        for <linux-amlogic@lists.infradead.org>; Tue, 20 Feb 2024 02:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708423304; x=1709028104; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ggp/kKDUoEQak3ZEjckeJCKOSJSXt76vc0O59mn16VM=;
        b=HJT5JPy4i7jaqsoPYjPjiMC6tda5QNNJyUl41ohRy6fG7xyhPCAbygK0tgJmvzgv8/
         i5SRqYybBWv/AqUvJ5DDoaGPunCoqj+XeYUs+/o3l8lV5/4C9acMFGd4WAil61bIYE8F
         YYQ0tN38lDW44J2VD6HaaLV7RuI0DJU7AmzRVWC8iN2EKw7lWDffDP9SfFt2+t1RleZK
         1MVLUDe+fJ3yhsMVRN/lWJXdKhcBem/yalfkvLUBBdwaoY3XvmUz71ac8J0IKjg3Llt9
         l8TpzQtfu0JmpX5Yjkta8TLdQtUI/QA79TA63Hvkd0os/Q8rrFDkzbG1gRgrttJsnzV4
         IdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708423304; x=1709028104;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ggp/kKDUoEQak3ZEjckeJCKOSJSXt76vc0O59mn16VM=;
        b=luAzJMKgf7uVSwMyTRMHpb7dgHwMZ9MH0wMpr12p5+yhPOcU6QR5hGDCTA7SbLTdr1
         7ruE7oUSbIUmTOrJbDMGRa4r9Gdzk35c5qHTlP1x/4JLno/hFX6wirw9qD8k6JoF61vw
         p66m3weSgm/GSbhWJ5/76Z6S2tXJizKE3aXnTRZAW/txFhDX88EKXGFIRGwpAktIHojL
         Ciisz241KsScKQI2NaWE6Itqa/bC53Iiw14mblAe/bLz+1it6VEB/Re4WKWS3R9XB7fV
         do2k1TPhsMiNDVRDW4sAOwuSxyIYp+jdsqAZqleTAmCWLSUBx4MEN8VJEo70kr5905L9
         0l4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFDXrHhTewG1mo7icnxoRi5KNQUG6ARDFf+hNApDpnY0xkR/p8ZI7qluWcCyIBQOEus88vOK9p2dsso2T9QocuhX3maA/JCDQthCs0rL/85Ms=
X-Gm-Message-State: AOJu0YxlMZVQn+UvLaT8nVdX8/xMbn38lEZM5W20i8FOHOqhwm+cijv/
	9mBFG4eJlE/pWXs3VmlZHAsK79nmpgd4a8wCtSNjFRk4S2E2+SoemQWndQubR20=
X-Google-Smtp-Source: AGHT+IGD8mn8jn1AWhQhMcgxsjJFxlnlOWqY+CESrDpuZ/vXpFd9OzitMTysH9GCquG5N9V4JRnevg==
X-Received: by 2002:a05:6512:1192:b0:512:8aeb:aaa8 with SMTP id g18-20020a056512119200b005128aebaaa8mr11055024lfr.49.1708423304193;
        Tue, 20 Feb 2024 02:01:44 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id jl22-20020a05600c6a9600b0041069adbd87sm13859729wmb.21.2024.02.20.02.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 02:01:43 -0800 (PST)
Message-ID: <95cafd69-de6d-497f-b3d6-b6d7a8a3b795@linaro.org>
Date: Tue, 20 Feb 2024 11:01:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: amlogic: add fbx8am DT overlays
Content-Language: en-US
To: Marc Gonzalez <mgonzalez@freebox.fr>, DT <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 AML <linux-amlogic@lists.infradead.org>
References: <07f7a695-18a0-4211-82e9-b1e2c7166969@freebox.fr>
 <79ba726d-d02c-44b9-b6f6-59b17ba9755c@freebox.fr>
 <54b4e810-754e-481a-bbc8-984f859b116d@linaro.org>
 <15fcafb2-4b4a-40a1-8ef5-ee3aef9b3b9d@freebox.fr>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <15fcafb2-4b4a-40a1-8ef5-ee3aef9b3b9d@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_020146_411763_7CA0AE6B 
X-CRM114-Status: GOOD (  15.68  )
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

On 19/02/2024 11:32, Marc Gonzalez wrote:
> On 14/02/2024 10:47, Neil Armstrong wrote:
> 
>> On 13/02/2024 18:14, Marc Gonzalez wrote:
>>
>>> Add support for two variants of the fbx8am board.
>>>
>>> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
>>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>>> ---
>>>   arch/arm64/boot/dts/amlogic/Makefile                       |  6 ++++++
>>>   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso    | 35 ++++++++++++++++++++++++++++++++++
>>>   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso | 25 ++++++++++++++++++++++++
>>>   3 files changed, 66 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
>>> index cc8b34bd583d8..1ab160bf928ae 100644
>>> --- a/arch/arm64/boot/dts/amlogic/Makefile
>>> +++ b/arch/arm64/boot/dts/amlogic/Makefile
>>> @@ -8,6 +8,8 @@ dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j100.dtb
>>>   dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j110-rev-2.dtb
>>>   dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j110-rev-3.dtb
>>>   dtb-$(CONFIG_ARCH_MESON) += meson-axg-s400.dtb
>>> +dtb-$(CONFIG_ARCH_MESON) += meson-g12a-fbx8am-brcm.dtb
>>> +dtb-$(CONFIG_ARCH_MESON) += meson-g12a-fbx8am-realtek.dtb
>>>   dtb-$(CONFIG_ARCH_MESON) += meson-g12a-radxa-zero.dtb
>>>   dtb-$(CONFIG_ARCH_MESON) += meson-g12a-sei510.dtb
>>>   dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
>>> @@ -80,3 +82,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-hc4.dtb
>>>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
>>>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air-gbit.dtb
>>>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
>>> +
>>> +# Overlays
>>> +meson-g12a-fbx8am-brcm-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-brcm.dtbo
>>> +meson-g12a-fbx8am-realtek-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-realtek.dtbo
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso
>>> new file mode 100644
>>> index 0000000000000..ed79809b15859
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso
>>> @@ -0,0 +1,35 @@
>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>> +// Copyright (c) 2024 Freebox SAS
>>> +
>>> +/dts-v1/;
>>> +/plugin/;
>>> +
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +#include <dt-bindings/gpio/meson-g12a-gpio.h>
>>> +
>>> +/ {
>>> +	compatible = "freebox,fbx8am-brcm", "freebox,fbx8am", "amlogic,g12a";
>>
>> This looks fine but I'm unsure if those new compatible should be documented or not,
>> since they are in an overlay

All compatibles in entire Linux source code shall be documented, so
please document any new ones appearing in overlays.

> 
> Rob, Krzysztof, Conor,
> 
> Just want to make sure this was done "right".
> 
> Is it acceptable for an overlay (DTSO) to define a more specific compatible prop?

I think it is fine and some DTSO already do it. User-space might want to
identify that specific overlay is applied or not. Of course this will
not work when multiple overlays are applied and each changes compatible,
thus I would say this is in general specific to particular cases of
exclusive overlays. In such case, why not making it new board DTS?

If this is not exclusive overlay, then new compatible looks wrong.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
