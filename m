Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BE8C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 10:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SEYkFj6MfSm718ADQeGiaRCTF0EopbIw7lsKzGK7+MM=; b=JsEXTP/jbedpIJ
	6Uz0QsQzl+lmST9iYVpdpwXAp3NQWs0svJJd3kYWsXFBaKo+l50jpO4EmBa0C8N8iArrfA4dn17qf
	B9H54Gg9YjZEkB43qq/tKfuGqlUwtKLViaMOsXu/J2DVZRcAMDaS+XBTGNlmbwk04h0AOz/GIBWAk
	wS/eSyjMW/SJ/VvtXBjfhyahiXDkf2I9gQGSFvnpSCAHQTtqTRmh0npORIawiiZdfpEBeJzvukkpK
	g5PlOg7TVwYosINE17IGZiN/I+wMUfGLSy53TqF8tOo9Sx5kmBF/8GfHx4kpVSTrcAmLMGmF+Eu+7
	S/XxiWCurNCzRGBddKpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13Vl-00FfTP-VI; Fri, 02 Dec 2022 10:43:18 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13VY-00FfKm-Cp
	for linux-amlogic@lists.infradead.org; Fri, 02 Dec 2022 10:43:06 +0000
Received: by mail-lf1-x12a.google.com with SMTP id bp15so6751291lfb.13
        for <linux-amlogic@lists.infradead.org>; Fri, 02 Dec 2022 02:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FOsmaL4anJC2+9DXpJewYEXrleBsDHtL92Z/rXNrpKo=;
        b=eAJDJN0qMViRxh4ns/kXNjw3fCtoTmUzOhKbXZdJvcQZbau/z2W5Qc6/daAooUOecV
         uyUKNXPmweLEKWUTHQZCxwzcqMwACGyy6FmbUhXldMkW/gSleQF1bLL3NOPV4aFwlwpH
         n+GY/namLNOMdT2DS4dUYsedkTRkW6TgMEgD2ezt9ZBUmBXUCdoWjjUHVH9ePr50Ckr8
         iQWtNbUMDPmoqC9osJ/+PemjROT/CUXFTBhJf1bYD3kL6MtqPhi+NqEcb1D5+u62HcJL
         9vbkRqQs9V2qXMoPjzKw0xUFDk6DqqHoC0ikgIZZ32bn0po80tojrIP94rDaItgmwNK2
         eH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FOsmaL4anJC2+9DXpJewYEXrleBsDHtL92Z/rXNrpKo=;
        b=0AKPk94QuveL+KaMjVAiYGFyOnIsBLV7HQtrG84awHZYju965hclkBWFMIK3hjLFZN
         6flw0jeHsl40N40pQ+fW38XOVwF+Rm9vgAZ1CYjgMDb9lM9+/JvlLtTkTo4pL6UBz78O
         7JILo1BOYAxCdMSAIu1zrrwRPXZtTebDoX/vjyiJlWr0V32vRfyBorqGb7UzsRLDEpZG
         kpIhVFhtzz2HoPOFMEKsI6DukrBJ5DFDzjOsy1RND8gOfLRPiuA/HlJGvpd7rJj8EiBN
         ru7Wq3oH32bfzhA3VM/fp6wx6LrONzaxcXyMRQNf2Tg0e4iX+A6EAl7iQB9l5iDzUbOD
         YDew==
X-Gm-Message-State: ANoB5pnZm/T0PJr4QEF4LOP/tdVj+9IOVxlUV7zKL64IuLzAeBn3gaqB
	gk7okkgxHHfRW3uFjvYL2ytM/A==
X-Google-Smtp-Source: AA0mqf5UBOg0i6Xr6M6KKYFT9OI7GF9i21kFLBRMat9GNrL6pNiojrS10vzl1eD/ZKgZfWiEKVBctA==
X-Received: by 2002:a19:7111:0:b0:499:b4b3:2f68 with SMTP id m17-20020a197111000000b00499b4b32f68mr16889454lfc.203.1669977779852;
        Fri, 02 Dec 2022 02:42:59 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c10-20020a056512074a00b00499f9aaa9desm972863lfs.179.2022.12.02.02.42.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 02:42:58 -0800 (PST)
Message-ID: <38fda078-e4d4-5172-25c7-b126282f9f88@linaro.org>
Date: Fri, 2 Dec 2022 11:42:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v8 01/11] dt-bindings: clock: meson: add A1 PLL clock
 controller bindings
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, neil.armstrong@linaro.org,
 jbrunet@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-2-ddrokosov@sberdevices.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221201225703.6507-2-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_024304_505389_3E3F20BC 
X-CRM114-Status: GOOD (  15.75  )
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

On 01/12/2022 23:56, Dmitry Rokosov wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> Add the documentation to support Amlogic A1 PLL clock driver,
> and add A1 PLL clock controller bindings.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  .../bindings/clock/amlogic,a1-pll-clkc.yaml   | 52 +++++++++++++++++++
>  include/dt-bindings/clock/a1-pll-clkc.h       | 16 ++++++
>  2 files changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/a1-pll-clkc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> new file mode 100644
> index 000000000000..d67250fbeece
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/amlogic,a1-pll-clkc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Drop quotes from both.

> +
> +title: Amlogic Meson A/C serials PLL Clock Control Unit Device Tree Bindings

Drop "Device Tree Bindings"

> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>

Not correct email address.

> +  - Jerome Brunet <jbrunet@baylibre.com>
> +  - Jian Hu <jian.hu@jian.hu.com>
> +
> +properties:
> +  compatible:
> +    const: amlogic,a1-pll-clkc
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +     - description: input xtal_fixpll
> +     - description: input xtal_hifipll

As pointed already - this patch cannot work and must not be merged.

> +
> +  clock-names:
> +    items:
> +      - const: xtal_fixpll
> +      - const: xtal_hifipll
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clkc_pll: pll-clock-controller@7c80 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +                compatible = "amlogic,a1-pll-clkc";

Use 4 spaces for example indentation.

> +                reg = <0 0x7c80 0 0x18c>;
> +                #clock-cells = <1>;
> +                clocks = <&clkc_periphs 1>,
> +                         <&clkc_periphs 4>;
> +                clock-names = "xtal_fixpll", "xtal_hifipll";
> +    };
> diff --git a/include/dt-bindings/clock/a1-pll-clkc.h b/include/dt-bindings/clock/a1-pll-clkc.h
> new file mode 100644
> index 000000000000..58eae237e503
> --- /dev/null
> +++ b/include/dt-bindings/clock/a1-pll-clkc.h 

Filename matching compatible / bindings file.

> @@ -0,0 +1,16 @@

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
