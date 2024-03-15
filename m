Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BBBC54E58
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2024 09:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zE4102VqmohIO/KLqfQCQFGPiKg0L9M0KGG6GjePdnw=; b=0z8pbAInM/h+sC
	uxM6gDhdtEBTa1W4mclA4ANfW0jWAf+556Lrynl3z5u6skl681j4zGQ5rqbTZHuInj3OuURZGaFXK
	tBZKspdnahMy+uYMtDHSgSds3PeWQHP1VADdf4IVMKZscQU++a6j7Tl+HhXy7GV6L8DvnzUZPgcrQ
	PcjkdgHf4T5pUxb2m0oLYhqdeUJPcKgqreCU66US2sfCjp/F8RCP8QotUkGlnith2gukZz7MPjkEA
	OOzwZyIE2Xe9MATg8BbeIhPdITBu57swB2fKPPDttOkRmZnoxgntwV/OEjRiHwUG7vaobMr/b39uV
	GY9ANTm7Ey5T2/M2MSVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl4JS-0000000HN7D-0004;
	Fri, 15 Mar 2024 09:57:18 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl4JE-0000000HMyU-27DU
	for linux-amlogic@lists.infradead.org;
	Fri, 15 Mar 2024 09:57:10 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a44f2d894b7so206699066b.1
        for <linux-amlogic@lists.infradead.org>; Fri, 15 Mar 2024 02:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710496622; x=1711101422; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bN2u4rR1Zr2xT6D08j7QKgDjL2CpcTPg9+Xe9EIpbXI=;
        b=xdUaz5KEj1JvpNjCYSj7oKkCPAgTOhlzODdc+sBDezjFnLGANqrO+WmQYuTRhKX9Vv
         xSbR/znPls23rgDOnkeTag6Puoohie4MRZL5F9JhQRtAZ4eksuTSFCGkZYjGrotDePcS
         77GdsyjnLWZxeK1n7XOsYBTpGN3nSHLrm/qcq+hVD4jzo9zHRPX/iEhKaXiPSC5KkPBv
         DMMYPq1G6C6+gaYexhDc6844bZj4ueCy088LS+RWTvcatbC2VCXEr1Rkq/kphJxhMCg3
         3O/kz7+GVWkRKPQ+Q0m+xJCyWtKNzFJJhvhhC053BUCBoE76fDDd+elsZ3jkoZJuiZ+T
         W72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710496622; x=1711101422;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bN2u4rR1Zr2xT6D08j7QKgDjL2CpcTPg9+Xe9EIpbXI=;
        b=WlkcSMem42LSlnDY771umzpK2+tkjgenZpt3nlQUkHMn5DM+9iE2N6FDjdc5E8s/Ue
         YU4Qkr5d9nRBael8tR0+GUxMYKJjlG+UeQ2ajJw+Kumnid4lJw9SFt+a6OZQUyEusnrw
         KBA/m7cLCYPFVMp4xAwJV2aHptfgzmX3w+sH34QTedvtshW87KdaW1CoOGkyPp38E9ST
         gk1WBCBQfO07FbX8RzBAA3mm9PO1Vs651muRyWhezKoBamzAni/4Rkq49aoc6oIoW9wt
         WAW5/dx011qh04N6RI3cJudktwO9kXRrewKo37ZbooMOiDNYpldWiemUC7mzTwZ0I2Fp
         PigA==
X-Forwarded-Encrypted: i=1; AJvYcCWDy7uq0JQuwa5+isR/PkQkeJQQLyDdOZ/j6d7Pvl+m8i/jskYoTRKgNSddI9/rSxnafF88MS+xSB0bMe0SZv0d3k4xISlhu5ug+L5KPJSjEKw=
X-Gm-Message-State: AOJu0Yy3AYn1EQAe6eZSUNIR7DaxnM8qe/FInXKL1lMd3Vi/d2hKnuaA
	LyuobtkCk7magE8VHYppGZaaYxY4ruSuPUE4HHn9KxyoBsG1n636hBhHiXzt1og=
X-Google-Smtp-Source: AGHT+IHq7D1NT9mx8FX1vpzkEoVOa1oMEgKYpoLeGT8a7OVBLnX0kslJwG9cpWL/bxxXlee0+eehhA==
X-Received: by 2002:a17:907:c783:b0:a46:74f0:6278 with SMTP id tz3-20020a170907c78300b00a4674f06278mr3165655ejc.50.1710496621489;
        Fri, 15 Mar 2024 02:57:01 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id dv22-20020a170906b81600b00a4658d3e405sm1529599ejb.196.2024.03.15.02.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 02:57:00 -0700 (PDT)
Message-ID: <1b766dae-463f-4839-b527-e260dec5e628@linaro.org>
Date: Fri, 15 Mar 2024 10:56:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/25] dt-bindings: clock: meson: add A1 audio clock and
 reset controller bindings
Content-Language: en-US
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
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
 linux-gpio@vger.kernel.org
Cc: kernel@salutedevices.com
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-4-jan.dakinevich@salutedevices.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240314232201.2102178-4-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_025705_058928_15D96182 
X-CRM114-Status: GOOD (  13.57  )
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

On 15/03/2024 00:21, Jan Dakinevich wrote:
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>

You must provide commit messages.

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18


> ---
>  .../bindings/clock/amlogic,a1-audio-clkc.yaml |  83 ++++++++++++
>  .../dt-bindings/clock/amlogic,a1-audio-clkc.h | 122 ++++++++++++++++++
>  .../reset/amlogic,meson-a1-audio-reset.h      |  29 +++++
>  3 files changed, 234 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,a1-audio-clkc.h
>  create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml
> new file mode 100644
> index 000000000000..c76cad4da493
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,a1-audio-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic A1 Audio Clock Control Unit and Reset Controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +  - Jan Dakinevich <jan.dakinevich@salutedevices.com>
> +
> +properties:
> +  compatible:
> +    const: amlogic,a1-audio-clkc
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  reg:
> +    minItems: 2

Drop

> +    maxItems: 2
> +
> +  clocks:
> +    items:
> +      - description: input main peripheral bus clock
> +      - description: input dds_in
> +      - description: input fixed pll div2
> +      - description: input fixed pll div3
> +      - description: input hifi_pll
> +      - description: input oscillator (usually at 24MHz)
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: dds_in
> +      - const: fclk_div2
> +      - const: fclk_div3
> +      - const: hifi_pll
> +      - const: xtal
> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
> +    #include <dt-bindings/clock/amlogic,a1-peripherals-clkc.h>
> +    audio {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clkc_audio: audio-clock-controller@0 {
> +                compatible = "amlogic,a1-audio-clkc";
> +                reg = <0x0 0xfe050000 0x0 0xb0>,

Messed indentayion. Use 4 spaces for example indentation.

> +                      <0x0 0xfe054800 0x0 0x20>;
> +                #clock-cells = <1>;
> +                #reset-cells = <1>;
> +                clocks = <&clkc_periphs CLKID_AUDIO>,
> +                         <&clkc_periphs CLKID_DDS_IN>,
> +                         <&clkc_pll CLKID_FCLK_DIV2>,
> +                         <&clkc_pll CLKID_FCLK_DIV3>,
> +                         <&clkc_pll CLKID_HIFI_PLL>,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
