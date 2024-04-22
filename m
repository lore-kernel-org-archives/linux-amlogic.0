Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85200C4345F
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Apr 2024 07:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ztHwu+jah2W6j3S74sz08nTOIyeP+Acz/k2doCz9lxM=; b=SxBFfLpRGwi1BI
	8JK9npfrD2D60+Fpq77Meu5t4kQaeFfGlZCVXColU5DqDQqcSsAkw5OPymi8uZXac8txd4y7XBhWY
	3doTmyKiFuICH2MsugEw4k1IWVg70gZCbXwQQMq4vDNKEPF8wYp51tQTpsC229OwWOX8Av3OQBAKv
	/9HcyrDqN/avKvJFP3/brCk2wZzofklNuABD0sxzvRjMU/WWVAR5rwkjPlLSkWzTnbE27mhcp5ezk
	/7v18ZwPvgvVMI+hq97JLanzsx/Hf1xROCl/JEXwUDyz82or+Dcq2Msr2AjKVqHq6r+fjsLVVYou4
	LehkgxmWwpKf8I1STl2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryoL6-0000000CUBE-1rHV;
	Mon, 22 Apr 2024 07:43:48 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryoL3-0000000CU93-0tGX
	for linux-amlogic@lists.infradead.org;
	Mon, 22 Apr 2024 07:43:46 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-343c2f5b50fso2937616f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 22 Apr 2024 00:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713771822; x=1714376622; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=kfvBFZLfcCNDYszUkEjQ11vl0msgHceKXcUSI0a//gM=;
        b=L/7+1JvJXm1vAyLSFd52puW+gROawc6HFNOzvBeLow1tPlWwagWkVSp2ixzE+mTdWK
         IHFRSZ/LYFoWGlz3QPd1yCeZM1yCWLwz0O+Nbd4HuLaKGUHDGNgsxvPbBqrJ+wlnD0GW
         +qaxjQNVhMwpLazFrJeAyTgivSR/YU9Sao/1ZBG8JC5OClTvOyr8yswywIOtghWoWj3b
         ueM0uMc6Dh1pU7kH67vWeRH30OlsCJJH+AeJ7/Q8jrInlM5gqV+0s4RwImhtDSI/mQa4
         b8gCDmIKwidKd2dRz8IplYh1K9QOkCGS7f9niQX1MzCdV9pteINswIwiOHG6fUGUKvrR
         4I+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713771822; x=1714376622;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfvBFZLfcCNDYszUkEjQ11vl0msgHceKXcUSI0a//gM=;
        b=NSCM9AKAGDd6TB8fkbwJOqqkvFexfAeLrVflM0lydqkFdtU8Id2hm+7KspTxo5iS8X
         fo7713yocOozJvQQEvbpTlCgMHTwTYrnu4e3ooCr3TYAeXxCKMpQGajzdorACGxu9K82
         HQgMCFJAV1qQph5eJf0pjhYPn0DaJvoLoYUtZueQyQPeBCono0V8AbZE7TiakI+ghQ6u
         LVd3/CrxGU++nesvlJWtw/Qeia7n0z6x4fZsunWZhWkT5qJzkBDBIW55Ef1e4YBnMMmo
         xmTTv64TNcRjCQObnilwL+yLQK+Ds4lT8EYo0FRiKOszhh/awKdGYHQzr36H5ZSAvSpQ
         z9Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUdBI1+AORF2LjudRvv2uvEWR9+jNHz/JgzKuWSyS+VCaYLna32kjpgnNbOMpDkLMWrEqMcSDci83+D4OkTfKoGQXhXSRzZ/4gVGWJhgWH4DbY=
X-Gm-Message-State: AOJu0YzEEPcWVVbaagjUTMxkQN/2o4wSdzQPfc/5W0hLBGRlgX/avDnZ
	V4zMHYSMhlKkk/NSCBF9m0Xo9o0GPOzHDH7CoCM37gj+NxOWBnISQvLnf4KkDns=
X-Google-Smtp-Source: AGHT+IGXz4ihquQ0AAf0yOpe2B/eFN6P67bXlP8OvnX6InizQwyfBUNlf/di3apDLwgepPVHK16i5A==
X-Received: by 2002:a5d:440c:0:b0:34a:a836:b940 with SMTP id z12-20020a5d440c000000b0034aa836b940mr3387304wrq.18.1713771822295;
        Mon, 22 Apr 2024 00:43:42 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a619:ccb0:5f40:262c])
        by smtp.gmail.com with ESMTPSA id y18-20020a5d4ad2000000b0034a0d3c0715sm11036715wrs.50.2024.04.22.00.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 00:43:42 -0700 (PDT)
References: <20240419125812.983409-1-jan.dakinevich@salutedevices.com>
 <20240419125812.983409-5-jan.dakinevich@salutedevices.com>
 <07b1ca57-49a0-4151-99bf-caac053eaa01@kernel.org>
 <0194ddb8-6e93-4a77-9fdd-93fc79a4e03e@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
  Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
  Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor  Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin  Blumenstingl <martin.blumenstingl@googlemail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jiucheng Xu <jiucheng.xu@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH v3 4/6] dt-bindings: clock: meson: document A1 SoC
 audio clock controller driver
Date: Mon, 22 Apr 2024 09:43:08 +0200
In-reply-to: <0194ddb8-6e93-4a77-9fdd-93fc79a4e03e@salutedevices.com>
Message-ID: <1jcyqhc05u.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_004345_290083_F1D22DC0 
X-CRM114-Status: GOOD (  17.67  )
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


On Sat 20 Apr 2024 at 17:48, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> On 4/19/24 17:06, Krzysztof Kozlowski wrote:
>> On 19/04/2024 14:58, Jan Dakinevich wrote:
>>> Add device tree bindings for A1 SoC audio clock and reset controllers.
>>>
>>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>> 
>> This is still RFC, so not ready.
>> 
>> Limited, incomplete review follows. Full review will be provided when
>> the work is ready.
>> 
>> Drop "driver" references, e.g. from subject. Bindings are about hardware.
>> 
>> 
>> ....
>> 
>>> +
>>> +  clocks:
>>> +    maxItems: 26
>>> +    items:
>>> +      - description: input main peripheral bus clock
>>> +      - description: input dds_in
>>> +      - description: input fixed pll div2
>>> +      - description: input fixed pll div3
>>> +      - description: input hifi_pll
>>> +      - description: input oscillator (usually at 24MHz)
>>> +    additionalItems:
>>> +      oneOf:
>>> +        - description: slv_sclk[0-9] - slave bit clocks provided by external components
>>> +        - description: slv_lrclk[0-9]- slave sample clocks provided by external components
>> 
>> What does it mean the clocks are optional? Pins could be not routed?
>
> Yes exactly. Pins could be routed in any combination or could be not
> routed at all. It is determined by schematics and that how external
> codecs are configured.
>
>> It's really rare case that clocks within the SoC are optional, so every
>> such case is questionable.
>> 
>> 
>>> +
>>> +  clock-names:
>>> +    maxItems: 26
>>> +    items:
>>> +      - const: pclk
>>> +      - const: dds_in
>>> +      - const: fclk_div2
>>> +      - const: fclk_div3
>>> +      - const: hifi_pll
>>> +      - const: xtal
>>> +    additionalItems:
>>> +      oneOf:
>>> +        - pattern: "^slv_sclk[0-9]$"
>>> +        - pattern: "^slv_lrclk[0-9]$"
>>> +
>>> +required:
>>> +  - compatible
>>> +  - '#clock-cells'
>>> +  - reg
>>> +  - clocks
>>> +  - clock-names
>>> +
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: amlogic,a1-audio-clkc
>>> +    then:
>>> +      required:
>>> +        - '#reset-cells'
>>> +    else:
>>> +      properties:
>>> +        '#reset-cells': false
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
>>> +    #include <dt-bindings/clock/amlogic,a1-peripherals-clkc.h>
>>> +    #include <dt-bindings/clock/amlogic,a1-audio-clkc.h>
>>> +    audio {
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>> +
>>> +        clkc_audio: clock-controller@fe050000 {
>>> +                compatible = "amlogic,a1-audio-clkc";
>>> +                reg = <0x0 0xfe050000 0x0 0xb0>;
>>> +                #clock-cells = <1>;
>>> +                #reset-cells = <1>;
>>> +                clocks = <&clkc_audio_vad AUD_CLKID_VAD_AUDIOTOP>,
>>> +                         <&clkc_periphs CLKID_DDS_IN>,
>>> +                         <&clkc_pll CLKID_FCLK_DIV2>,
>>> +                         <&clkc_pll CLKID_FCLK_DIV3>,
>>> +                         <&clkc_pll CLKID_HIFI_PLL>,
>>> +                         <&xtal>;
>>> +                clock-names = "pclk",
>>> +                              "dds_in",
>>> +                              "fclk_div2",
>>> +                              "fclk_div3",
>>> +                              "hifi_pll",
>>> +                              "xtal";
>> 
>> Make it complete - list all clocks.
>> 
>
> You mean, all optional clocks should be mentioned here. Right?
>
>>> +        };
>>> +
>>> +        clkc_audio_vad: clock-controller@fe054800 {
>> 
>> Just keep one example. It's basically almost the same.
>> 
>
> The worth of this duplication is to show how a clock from second
> controller (<&clkc_audio_vad AUD_CLKID_VAD_AUDIOTOP>) is used by first
> one. May be it would be better to keep it... What do you think?

If you think that is worth mentioning, make it part of the
documentation, not the example.

>
>> 
>> 
>> Best regards,
>> Krzysztof
>> 


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
