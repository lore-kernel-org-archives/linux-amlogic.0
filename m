Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777DBC433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Nov 2022 13:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KNhb6oA9uh4BjhtvXLYlh17t7lOtuGOZ6g7ChBWtlNw=; b=CapfF1N4Rjj3uh
	X/UMuZCBOuneWOw3ftuMbjXf3mnSq2QiD7DEtj18a00FyQKKKcqbqSB65dsVofXFnYWjpN6z/8On7
	2gsC2kDIEYDejw7hQr//ZQLtzcWVZ2X3xgzhimu8Wo8zV10B0Bn8oURWq6mUFxIV8SFLaatX/8TtW
	FqMGR8+vyOHGvRKdsSNZNyQ3QEUAG+JBW8MDlsgDfJwDOJnmCJYG+1sJAhXAqYb/tQXPNJ5RFx6Dv
	ITDjabGrOHiyJWwd1wQbGUdNDzcUqOjspCv4YfMW3ijYXTOFlHWrcA4SUxVqL9ObBYv3Ongc0I33C
	hMORqm1yiI4ANV0i3/mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpOa-00H6Xk-To; Wed, 23 Nov 2022 13:02:32 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpOY-00H6Uk-6o
	for linux-amlogic@lists.infradead.org; Wed, 23 Nov 2022 13:02:31 +0000
Received: by mail-lj1-x22c.google.com with SMTP id b9so21302447ljr.5
        for <linux-amlogic@lists.infradead.org>; Wed, 23 Nov 2022 05:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RUEe+xvo6A9bHKL3WK6VHdimu7vun/3ExSCGDYJweEg=;
        b=y0sFuHh0+K0wq6VzFe3oKGdWnx5+CfVCg3XFcbMQz32cMMuXuO1TlrU1gJaCosrhLC
         Ik8BY0drtu8PucxwsTRSYqdJM3F/oG31rbPMf9FgclXEojCyPO45fhVsPi9GOQkYxehW
         S9qNwcGKbqEUTH1G/UVtMv+S8gOJlWf8UjEWtzzUCg2hHem8RR+ITe/aqynuahKqmxOj
         A87gX0uXXhnYLWS2ZspJrGvVGeC9zRNkP2rzR4dk/NwEuj1kBhYRyDLM6s+YXc2qPSuf
         5WTIvFBzZm20BOzLilDiZkewal5Mo31sfO2GWH5BXRHcVb6ZH5VsqLffaIypSiuMUKgP
         k3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RUEe+xvo6A9bHKL3WK6VHdimu7vun/3ExSCGDYJweEg=;
        b=OIy9iSO/rdJzpyPJFWy2anH262Z5J3twEJDqPxQ87Yk16DRUigQ4wzzqPT6hiutO/E
         U2+j/QypOKLEUz1Ac8WfQAEXIWWVxDOuKVoNsh7/LyU/bEgMnO9uBR9gdxraS2hxRcGi
         gp6iLyJ6nhU1qnm5mnGBgPAWN5MGQ9w7vGp4FflKmyFbxf5LUqpjn1EM2OSEqGOkMntY
         SbjvX2QVF5b5arXsZ1S8J+8Z2UpWGPpjvFt7oDIHrqoyoiTTbBo/CF7hCznHcummWfJe
         7x/rvCFgjZDBw1AFokuHV9Tcg7iUYAHd/McrscGP1yfN2ssUM3pJoALVyhagQXI/WoDZ
         822w==
X-Gm-Message-State: ANoB5pmjhx6MalXI0MwSV5BaSWJf/j7BHFGyIBIppF/S7XMtvgeOY+fm
	Ml0/kvvm2cxslZ/sA5HBS8hEsg==
X-Google-Smtp-Source: AA0mqf70gL5arrMjHAnvTcCUxrJKMuIh2LzxlvsWO54zS2pI8ANGvVSfxKuPIAZ4LAMQafD4IQQ5Rg==
X-Received: by 2002:a05:651c:1601:b0:277:3a1:e86d with SMTP id f1-20020a05651c160100b0027703a1e86dmr4179100ljq.152.1669208544042;
        Wed, 23 Nov 2022 05:02:24 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k21-20020a05651239d500b00494618889c0sm2882886lfu.42.2022.11.23.05.02.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 05:02:23 -0800 (PST)
Message-ID: <8dbb3ce2-c8d9-70be-d1de-ed875de0ea1b@linaro.org>
Date: Wed, 23 Nov 2022 14:02:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH V5 4/4] arm64: dts: meson: add S4 Soc Peripheral clock
 controller in DT
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-5-yu.tu@amlogic.com>
 <ae43fadf-9255-7db7-8b5e-01200e02a2c6@linaro.org>
 <9858039f-e635-2749-80a2-75072d6e9cea@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9858039f-e635-2749-80a2-75072d6e9cea@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_050230_280053_52E60013 
X-CRM114-Status: GOOD (  13.36  )
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

On 23/11/2022 12:27, Yu Tu wrote:
> Hi Krzysztof,
> 	
> On 2022/11/23 18:10, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On 23/11/2022 03:13, Yu Tu wrote:
>>> Added information about the S4 SOC Peripheral Clock controller in DT.
>>>
>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>> ---
>>>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 26 +++++++++++++++++++++++
>>>   1 file changed, 26 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>> index bd9c2ef83314..e7fab6e400be 100644
>>> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>> @@ -6,6 +6,8 @@
>>>   #include <dt-bindings/interrupt-controller/irq.h>
>>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>   #include <dt-bindings/gpio/gpio.h>
>>> +#include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
>>> +#include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>>>   
>>>   / {
>>>   	cpus {
>>> @@ -100,6 +102,30 @@ clkc_pll: clock-controller@8000 {
>>>   				#clock-cells = <1>;
>>>   			};
>>>   
>>> +			clkc_periphs: clock-controller {
>>> +				compatible = "amlogic,s4-peripherals-clkc";
>>> +				reg = <0x0 0x0 0x0 0x49c>;
>>
>> This is broken... did you check for warnings?
> Yes, i do.
> You can have a look at the results of my test, as follows.
> 
> total: 0 errors, 0 warnings, 0 checks, 38 lines checked
> 
> ../patch_clk_v5_1122/0004-arm64-dts-meson-add-S4-Soc-Peripheral-clock-controll.patch 
> has no obvious style problems and is ready for submission.
> 

This is a checkpatch output. I am talking about DTS broken. dtc should
warn you.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
