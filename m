Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB213C10F15
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Apr 2024 07:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YXUZXb0w8NeJhceforqYpg2pXlHPpkTgmpVz66kR1Rc=; b=MkHYOg7WTnIIUp
	/LGcyvzf9Rkr32TqU7OYkEcCpQiA8M9DKGrY0dw2KHNq4GP7ezkmJLYDM/yRMD5BrgnrR84nUEpHg
	LX90H9VzdptPCdTmCwa6FM2UlB3Umg+cmkoWpFrypeWnl5BkSEzRMPZheToWhfZtlSd1WfU0sXzJo
	P69EYNJKu7nRsvoTYvfyXlTBUaM8CL5tfIEYobDvKfcdSlEZhILvS7+B14XXwHicK+yb2BAOsuI50
	MixeseYJrbYiyD+87M6ik+V4rJGwcig+UGOTSPxyDusEOYM0mOeEo/yHuuVd7BziCyPLx+R31SL/D
	hiM1G4MbVxJCJyH7bySA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryoKS-0000000CTrD-0sMP;
	Mon, 22 Apr 2024 07:43:08 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryoKO-0000000CTq8-1VP4
	for linux-amlogic@lists.infradead.org;
	Mon, 22 Apr 2024 07:43:06 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-41a4f291f80so5131255e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 22 Apr 2024 00:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713771781; x=1714376581; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=HHcC35lTBA1qq/FSmPAERIZakoHs1RZ6aesGXnLE7vc=;
        b=iVvGcHvvrOBw1iPW/8xajif3rdYsMPQCXKVePl4zibPssLH8A3toZaGfbsBOcZEL2k
         AQ4sswjZh3I8uVDwgJzvI9wrTX6h8nd91s4lXkr1Xcsi1XZMnp7i4N/lUSi7oStIDxIa
         A17Iyy5BaP5FwZhnE2E05eMRJwNoHMRV/oH2X4Vt3R0kgR7/7CCmBaDY1K9NnTBeh0U+
         Tq8Fi3UrFpItyjm9oEgakaZhxq8GPFCqhLPRqNbXj3FX+9tlJvKui0a4/jMljizuL5IR
         x6nM5NFT4lOxvLvACxlo80LKo4EWAHoLBUIWqPFSzfHy17c9R7PPT0dlrlEU43bXH5QT
         u/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713771781; x=1714376581;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHcC35lTBA1qq/FSmPAERIZakoHs1RZ6aesGXnLE7vc=;
        b=hEf5ApZNd4s7l18ieIpAWFDWLMpjxT9OFgC88GJ4PZfy5N8vfUvUJDEgdhj/w6GoS0
         iyGza46NV8axSkUuQnROySoXc20CHtk+4F1qg4jPenPM7Tnpb2zQTUoEpn6bk3v5bMcA
         Kkr3UNTtTo6gMMRiH1+1WNZiWxGSMgVZEesG3yBttiDu1PoaZlaYvmbyK05Gtqhzy9Rc
         qcolyTmlrKS4W0Egr4Pq+EjBep1NsMHrDOoZnA3jI12q9KosEDlN6ZPtqMXwDxVjpjs0
         s0OGyYNxQd5o+bP2naaA7HnU6j+4xe1JYlSdgLD+l9PTgY0PwsohAeWAebz/Zvlw6ZZS
         4VNw==
X-Forwarded-Encrypted: i=1; AJvYcCUcXPB2jrMG811IhqMYc4ZzEiySUAr7Tto5M1S0jUfzYr7BK2wvpi2nD9emGBmZwMZvYEfAL69FPOWF5CucISF6li/nZjiDU0RHHGI+Pei25d8=
X-Gm-Message-State: AOJu0YwyZF91oxRGcXSekR6Ds5ONNgdDT7M1eanNDwTaipfXLri2Zcqc
	susXVFw1ps/y2ZZBXRWYDp/BGa8JxI+2KA1JThWmbKVbtLy9/rbHqbUHRgRAP7A=
X-Google-Smtp-Source: AGHT+IG+A95DvetUpmSiY4UAcJOEPu6SSGTsaidF5CEZnR1DR7rVmegouBvIruk2eV3rCEGYcijL0A==
X-Received: by 2002:a05:600c:4fd4:b0:419:c8c2:a47a with SMTP id o20-20020a05600c4fd400b00419c8c2a47amr5912142wmq.34.1713771780756;
        Mon, 22 Apr 2024 00:43:00 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a619:ccb0:5f40:262c])
        by smtp.gmail.com with ESMTPSA id p6-20020a05600c468600b00418accde252sm15737039wmo.30.2024.04.22.00.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 00:43:00 -0700 (PDT)
References: <20240419125812.983409-1-jan.dakinevich@salutedevices.com>
 <20240419125812.983409-5-jan.dakinevich@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, Michael  Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob  Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor  Dooley <conor+dt@kernel.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin  Blumenstingl
 <martin.blumenstingl@googlemail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jiucheng Xu <jiucheng.xu@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH v3 4/6] dt-bindings: clock: meson: document A1 SoC
 audio clock controller driver
Date: Mon, 22 Apr 2024 09:40:48 +0200
In-reply-to: <20240419125812.983409-5-jan.dakinevich@salutedevices.com>
Message-ID: <1jh6ftc070.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_004304_435040_554A1C72 
X-CRM114-Status: GOOD (  20.97  )
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


On Fri 19 Apr 2024 at 15:58, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> Add device tree bindings for A1 SoC audio clock and reset controllers.
>
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>
> This controller has 6 mandatory and up to 20 optional clocks. To describe
> this, I use 'additionalItems'. It produces correct processed-schema.json:
>
>   "clock-names": {
>       "maxItems": 26,
>       "items": [
>           {
>               "const": "pclk"
>           },
>           {
>               "const": "dds_in"
>           },
>           {
>               "const": "fclk_div2"
>           },
>           {
>               "const": "fclk_div3"
>           },
>           {
>               "const": "hifi_pll"
>           },
>           {
>               "const": "xtal"
>           }
>       ],
>       "additionalItems": {
>           "oneOf": [
>               {
>                   "pattern": "^slv_sclk[0-9]$"
>               },
>               {
>                   "pattern": "^slv_lrclk[0-9]$"
>               }
>           ]
>       },
>       "type": "array",
>       "minItems": 6
>   },
>
> and it behaves as expected. However, the checking is followed by
> complaints like this:
>
>   Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml: properties:clock-names:additionalItems: {'oneOf': [{'pattern': '^slv_sclk[0-9]$'}, {'pattern': '^slv_lrclk[0-9]$'}]} is not of type 'boolean'
>
> And indeed, 'additionalItems' has boolean type in meta-schema. So, how to
> do it right?
> ---
>  .../bindings/clock/amlogic,a1-audio-clkc.yaml | 124 ++++++++++++++++++
>  .../dt-bindings/clock/amlogic,a1-audio-clkc.h | 122 +++++++++++++++++
>  .../reset/amlogic,meson-a1-audio-reset.h      |  29 ++++
>  3 files changed, 275 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,a1-audio-clkc.h
>  create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h
>
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml
> new file mode 100644
> index 000000000000..40a0af3635f4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml
> @@ -0,0 +1,124 @@
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
> +    enum:
> +      - amlogic,a1-audio-clkc
> +      - amlogic,a1-audio-vad-clkc
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 26
> +    items:
> +      - description: input main peripheral bus clock
> +      - description: input dds_in
> +      - description: input fixed pll div2
> +      - description: input fixed pll div3
> +      - description: input hifi_pll
> +      - description: input oscillator (usually at 24MHz)
> +    additionalItems:
> +      oneOf:
> +        - description: slv_sclk[0-9] - slave bit clocks provided by external components
> +        - description: slv_lrclk[0-9]- slave sample clocks provided by external components
> +
> +  clock-names:
> +    maxItems: 26
> +    items:
> +      - const: pclk
> +      - const: dds_in
> +      - const: fclk_div2
> +      - const: fclk_div3
> +      - const: hifi_pll
> +      - const: xtal
> +    additionalItems:
> +      oneOf:
> +        - pattern: "^slv_sclk[0-9]$"
> +        - pattern: "^slv_lrclk[0-9]$"
> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: amlogic,a1-audio-clkc
> +    then:
> +      required:
> +        - '#reset-cells'
> +    else:
> +      properties:
> +        '#reset-cells': false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
> +    #include <dt-bindings/clock/amlogic,a1-peripherals-clkc.h>
> +    #include <dt-bindings/clock/amlogic,a1-audio-clkc.h>
> +    audio {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clkc_audio: clock-controller@fe050000 {
> +                compatible = "amlogic,a1-audio-clkc";
> +                reg = <0x0 0xfe050000 0x0 0xb0>;
> +                #clock-cells = <1>;
> +                #reset-cells = <1>;
> +                clocks = <&clkc_audio_vad AUD_CLKID_VAD_AUDIOTOP>,
> +                         <&clkc_periphs CLKID_DDS_IN>,
> +                         <&clkc_pll CLKID_FCLK_DIV2>,
> +                         <&clkc_pll CLKID_FCLK_DIV3>,
> +                         <&clkc_pll CLKID_HIFI_PLL>,
> +                         <&xtal>;
> +                clock-names = "pclk",
> +                              "dds_in",
> +                              "fclk_div2",
> +                              "fclk_div3",
> +                              "hifi_pll",
> +                              "xtal";
> +        };
> +
> +        clkc_audio_vad: clock-controller@fe054800 {
> +                compatible = "amlogic,a1-audio2-clkc";
> +                reg = <0x0 0xfe054800 0x0 0x20>;
> +                #clock-cells = <1>;
> +                clocks = <&clkc_periphs CLKID_AUDIO>,
> +                         <&clkc_periphs CLKID_DDS_IN>,
> +                         <&clkc_pll CLKID_FCLK_DIV2>,
> +                         <&clkc_pll CLKID_FCLK_DIV3>,
> +                         <&clkc_pll CLKID_HIFI_PLL>,
> +                         <&xtal>;
> +                clock-names = "pclk",
> +                              "dds_in",
> +                              "fclk_div2",
> +                              "fclk_div3",
> +                              "hifi_pll",
> +                              "xtal";
> +        };
> +    };
> diff --git a/include/dt-bindings/clock/amlogic,a1-audio-clkc.h b/include/dt-bindings/clock/amlogic,a1-audio-clkc.h
> new file mode 100644
> index 000000000000..6534d1878816
> --- /dev/null
> +++ b/include/dt-bindings/clock/amlogic,a1-audio-clkc.h
> @@ -0,0 +1,122 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (c) 2024, SaluteDevices. All Rights Reserved.
> + *
> + * Author: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> + */
> +
> +#ifndef __A1_AUDIO_CLKC_BINDINGS_H
> +#define __A1_AUDIO_CLKC_BINDINGS_H
> +
> +#define AUD_CLKID_DDR_ARB		1
> +#define AUD_CLKID_TDMIN_A		2
> +#define AUD_CLKID_TDMIN_B		3
> +#define AUD_CLKID_TDMIN_LB		4
> +#define AUD_CLKID_LOOPBACK		5
> +#define AUD_CLKID_TDMOUT_A		6
> +#define AUD_CLKID_TDMOUT_B		7
> +#define AUD_CLKID_FRDDR_A		8
> +#define AUD_CLKID_FRDDR_B		9
> +#define AUD_CLKID_TODDR_A		10
> +#define AUD_CLKID_TODDR_B		11
> +#define AUD_CLKID_SPDIFIN		12
> +#define AUD_CLKID_RESAMPLE		13
> +#define AUD_CLKID_EQDRC			14
> +#define AUD_CLKID_LOCKER		15
> +#define AUD_CLKID_MST_A_MCLK_SEL	16
> +#define AUD_CLKID_MST_A_MCLK_DIV	17
> +#define AUD_CLKID_MST_A_MCLK		18
> +#define AUD_CLKID_MST_B_MCLK_SEL	19
> +#define AUD_CLKID_MST_B_MCLK_DIV	20
> +#define AUD_CLKID_MST_B_MCLK		21
> +#define AUD_CLKID_MST_C_MCLK_SEL	22
> +#define AUD_CLKID_MST_C_MCLK_DIV	23
> +#define AUD_CLKID_MST_C_MCLK		24
> +#define AUD_CLKID_MST_D_MCLK_SEL	25
> +#define AUD_CLKID_MST_D_MCLK_DIV	26
> +#define AUD_CLKID_MST_D_MCLK		27
> +#define AUD_CLKID_SPDIFIN_CLK_SEL	28
> +#define AUD_CLKID_SPDIFIN_CLK_DIV	29
> +#define AUD_CLKID_SPDIFIN_CLK		30
> +#define AUD_CLKID_RESAMPLE_CLK_SEL	31
> +#define AUD_CLKID_RESAMPLE_CLK_DIV	32
> +#define AUD_CLKID_RESAMPLE_CLK		33
> +#define AUD_CLKID_LOCKER_IN_CLK_SEL	34
> +#define AUD_CLKID_LOCKER_IN_CLK_DIV	35
> +#define AUD_CLKID_LOCKER_IN_CLK		36
> +#define AUD_CLKID_LOCKER_OUT_CLK_SEL	37
> +#define AUD_CLKID_LOCKER_OUT_CLK_DIV	38
> +#define AUD_CLKID_LOCKER_OUT_CLK	39
> +#define AUD_CLKID_EQDRC_CLK_SEL		40
> +#define AUD_CLKID_EQDRC_CLK_DIV		41
> +#define AUD_CLKID_EQDRC_CLK		42
> +#define AUD_CLKID_MST_A_SCLK_PRE_EN	43
> +#define AUD_CLKID_MST_A_SCLK_DIV	44
> +#define AUD_CLKID_MST_A_SCLK_POST_EN	45
> +#define AUD_CLKID_MST_A_SCLK		46
> +#define AUD_CLKID_MST_B_SCLK_PRE_EN	47
> +#define AUD_CLKID_MST_B_SCLK_DIV	48
> +#define AUD_CLKID_MST_B_SCLK_POST_EN	49
> +#define AUD_CLKID_MST_B_SCLK		50
> +#define AUD_CLKID_MST_C_SCLK_PRE_EN	51
> +#define AUD_CLKID_MST_C_SCLK_DIV	52
> +#define AUD_CLKID_MST_C_SCLK_POST_EN	53
> +#define AUD_CLKID_MST_C_SCLK		54
> +#define AUD_CLKID_MST_D_SCLK_PRE_EN	55
> +#define AUD_CLKID_MST_D_SCLK_DIV	56
> +#define AUD_CLKID_MST_D_SCLK_POST_EN	57
> +#define AUD_CLKID_MST_D_SCLK		58
> +#define AUD_CLKID_MST_A_LRCLK_DIV	59
> +#define AUD_CLKID_MST_A_LRCLK		60
> +#define AUD_CLKID_MST_B_LRCLK_DIV	61
> +#define AUD_CLKID_MST_B_LRCLK		62
> +#define AUD_CLKID_MST_C_LRCLK_DIV	63
> +#define AUD_CLKID_MST_C_LRCLK		64
> +#define AUD_CLKID_MST_D_LRCLK_DIV	65
> +#define AUD_CLKID_MST_D_LRCLK		66
> +#define AUD_CLKID_TDMIN_A_SCLK_SEL	67
> +#define AUD_CLKID_TDMIN_A_SCLK_PRE_EN	68
> +#define AUD_CLKID_TDMIN_A_SCLK_POST_EN	69
> +#define AUD_CLKID_TDMIN_A_SCLK		70
> +#define AUD_CLKID_TDMIN_A_LRCLK		71
> +#define AUD_CLKID_TDMIN_B_SCLK_SEL	72
> +#define AUD_CLKID_TDMIN_B_SCLK_PRE_EN	73
> +#define AUD_CLKID_TDMIN_B_SCLK_POST_EN	74
> +#define AUD_CLKID_TDMIN_B_SCLK		75
> +#define AUD_CLKID_TDMIN_B_LRCLK		76
> +#define AUD_CLKID_TDMIN_LB_SCLK_SEL	77
> +#define AUD_CLKID_TDMIN_LB_SCLK_PRE_EN	78
> +#define AUD_CLKID_TDMIN_LB_SCLK_POST_EN	79
> +#define AUD_CLKID_TDMIN_LB_SCLK		80
> +#define AUD_CLKID_TDMIN_LB_LRCLK	81
> +#define AUD_CLKID_TDMOUT_A_SCLK_SEL	82
> +#define AUD_CLKID_TDMOUT_A_SCLK_PRE_EN	83
> +#define AUD_CLKID_TDMOUT_A_SCLK_POST_EN	84
> +#define AUD_CLKID_TDMOUT_A_SCLK		85
> +#define AUD_CLKID_TDMOUT_A_LRCLK	86
> +#define AUD_CLKID_TDMOUT_B_SCLK_SEL	87
> +#define AUD_CLKID_TDMOUT_B_SCLK_PRE_EN	88
> +#define AUD_CLKID_TDMOUT_B_SCLK_POST_EN	89
> +#define AUD_CLKID_TDMOUT_B_SCLK		90
> +#define AUD_CLKID_TDMOUT_B_LRCLK	91
> +
> +#define AUD_CLKID_VAD_DDR_ARB		1
> +#define AUD_CLKID_VAD_PDM		2
> +#define AUD_CLKID_VAD_TDMIN		3
> +#define AUD_CLKID_VAD_TODDR		4
> +#define AUD_CLKID_VAD			5
> +#define AUD_CLKID_VAD_AUDIOTOP		6
> +#define AUD_CLKID_VAD_MCLK_SEL		7
> +#define AUD_CLKID_VAD_MCLK_DIV		8
> +#define AUD_CLKID_VAD_MCLK		9
> +#define AUD_CLKID_VAD_CLK_SEL		10
> +#define AUD_CLKID_VAD_CLK_DIV		11
> +#define AUD_CLKID_VAD_CLK		12
> +#define AUD_CLKID_VAD_PDM_DCLK_SEL	13
> +#define AUD_CLKID_VAD_PDM_DCLK_DIV	14
> +#define AUD_CLKID_VAD_PDM_DCLK		15
> +#define AUD_CLKID_VAD_PDM_SYSCLK_SEL	16
> +#define AUD_CLKID_VAD_PDM_SYSCLK_DIV	17
> +#define AUD_CLKID_VAD_PDM_SYSCLK	18
> +

Again, please split the a1 and a1-vad controller.
They are independent and there is no reason to use a single file for them

> +#endif /* __A1_AUDIO_CLKC_BINDINGS_H */
> diff --git a/include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h b/include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h
> new file mode 100644
> index 000000000000..653fddba1d8f
> --- /dev/null
> +++ b/include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (c) 2024, SaluteDevices. All Rights Reserved.
> + *
> + * Author: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> + */
> +
> +#ifndef _DT_BINDINGS_AMLOGIC_MESON_A1_AUDIO_RESET_H
> +#define _DT_BINDINGS_AMLOGIC_MESON_A1_AUDIO_RESET_H
> +
> +#define AUD_RESET_DDRARB	0
> +#define AUD_RESET_TDMIN_A	1
> +#define AUD_RESET_TDMIN_B	2
> +#define AUD_RESET_TDMIN_LB	3
> +#define AUD_RESET_LOOPBACK	4
> +#define AUD_RESET_TDMOUT_A	5
> +#define AUD_RESET_TDMOUT_B	6
> +#define AUD_RESET_FRDDR_A	7
> +#define AUD_RESET_FRDDR_B	8
> +#define AUD_RESET_TODDR_A	9
> +#define AUD_RESET_TODDR_B	10
> +#define AUD_RESET_SPDIFIN	11
> +#define AUD_RESET_RESAMPLE	12
> +#define AUD_RESET_EQDRC		13
> +#define AUD_RESET_LOCKER	14
> +#define AUD_RESET_TOACODEC	30
> +#define AUD_RESET_CLKTREE	31
> +
> +#endif /* _DT_BINDINGS_AMLOGIC_MESON_A1_AUDIO_RESET_H */


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
