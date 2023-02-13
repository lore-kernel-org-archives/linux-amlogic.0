Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06675C636D4
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Feb 2023 11:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lzBzo3GTVZmzf8IrNROJPnKMrdUVQ05D5JAcmvJawvQ=; b=1UqHcBSi8ht00Z
	irYftRTEDILjs6RSeFhtKQU/nCt67WbTvs5RVuEnQixmyWvdyq1YEphNh2h0tSnwxd6oppqJmQUVa
	S70DEY3IVy1RMgBSxTcOF4RJx7ZM4ids3y/Rm6FPhqfXGx3e7CrvQhlQ+Kh4P/m7SZzbePo07/Cwf
	VwvnloIGmzveNIRYIf4WCH/t/gjEiQcR6aZqBoVVP9QMH3WzqHL/FuX8T1yKz7Hro3J6wvEy134YV
	FAlomg2hdKECORGEwyRlQ8VFHTVYCOZMfks58miigR8fZtR1zM35vywWe883bLwstqfvPr2BjqSnJ
	V7lZ6rWwY6LRYEB0GU8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRWbc-00EIRp-9j; Mon, 13 Feb 2023 11:02:44 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRWaz-00EI9s-Td
	for linux-amlogic@lists.infradead.org; Mon, 13 Feb 2023 11:02:10 +0000
Received: by mail-wm1-x32d.google.com with SMTP id he5so596552wmb.3
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Feb 2023 03:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8WzWyArS5gEO/wRc+fU03BRey5p9sqIym9cvOO3Y6eU=;
        b=zTMeYc9cO7mscsDds2h1TZLFUu8Tl/dWC1eLhgkAYD33QzKi6lOyFZCe4+5knSiBwW
         XR9UNZ7XsvjvO+JG615egdZseIchSL73cinaBanQbKXDwrgW6dI+LJeA0+4BOQMu1/PF
         v9zI5YVn0kLkc96zUF45F0XddOourilUsjqZ5szNWdTcjvKSgFQ7Kr49GHZCMqFk8XYo
         6nXIBHRxVldefmfy3uIgJCqG2AYHb6yEFGpeYNwKl0qVOBfBX4MJGRdOwPOuRWvjK2iH
         i+aPALN0LvPGF6CkeuXz11c6z1jOZewTHifzj233mIEG8CXKDMNEdNxzgiLC/bHO7oc6
         XePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8WzWyArS5gEO/wRc+fU03BRey5p9sqIym9cvOO3Y6eU=;
        b=w352h+qm7i7sC5NByGqGMMFVbfN30i7UjfWpwW773mYJQMlVdsHsgaOLnoGTzl2yy6
         hNw6T9KZpfpk/0/oBz8allZnpzmeNHPs810MrBs06VY8Gaq8Xetg6w/HyCMIYmmIDg9Q
         5hDnFitfsnjX6a0+J9bAFzLEacr3KJdbEpNByTKrvBjwx+pmkAraxCHf9pP1nifCZx50
         3k/m1DEHgR8Tdf28akH0bz4ZMNUl3f/LKYKjzI2OmIAB72sKVWkh6rYd6ypgNin0EbEK
         ITorOZV+erDRN/7EaRgQdWwAAb8bVPua73hBJKFofF6EYcNN6LzkAxCSuSE9sjQNywsp
         cjUA==
X-Gm-Message-State: AO0yUKWox5gjYYqexFwypUNA5TL4LvEx+Sh/y4YSSpDPNoHknP/SYvhs
	WG4J++bED/3a3x9igfxhGcPCTQ==
X-Google-Smtp-Source: AK7set+QKXqhsOFrxdGsWPqrhu0Ju0VH7kga/YlH2Hs/FF4nhofUvdKD5RlJPyj/WOB3XGC6kDFFXg==
X-Received: by 2002:a05:600c:30ca:b0:3df:c284:7e78 with SMTP id h10-20020a05600c30ca00b003dfc2847e78mr20536285wmn.38.1676286121946;
        Mon, 13 Feb 2023 03:02:01 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g10-20020a05600c310a00b003e1e8d794e1sm4719972wmo.13.2023.02.13.03.02.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 03:02:01 -0800 (PST)
Message-ID: <4b8e3164-f39a-c559-7bac-86c4fdcd6834@linaro.org>
Date: Mon, 13 Feb 2023 12:01:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/6] dt-bindings: soc: amlogic: convert
 amlogic,gxbb-clkc.txt to dt-schema
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
 <20230209-b4-amlogic-bindings-convert-take2-v1-4-c4fe9049def9@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230209-b4-amlogic-bindings-convert-take2-v1-4-c4fe9049def9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_030206_021619_F39D8A3D 
X-CRM114-Status: GOOD (  10.87  )
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

On 09/02/2023 14:41, Neil Armstrong wrote:
> Convert the Amlogic Clock Controller bindings to dt-schema.

Subject prefix - clock, not soc.

> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/clock/amlogic,gxbb-clkc.txt           | 53 ----------------------
>  .../bindings/clock/amlogic,gxbb-clkc.yaml          | 51 +++++++++++++++++++++
>  2 files changed, 51 insertions(+), 53 deletions(-)


> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: xtal
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +unevaluatedProperties: false

additionalProperties: false

> +
> +examples:
> +  - |
> +    sysctrl: system-controller@0 {
> +        compatible = "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon";
> +        reg = <0 0x400>;

Drop the parent node, not needed here. You could even skip the example
entirely as it is part of your syscon. If you keep example, then without
parent pieces.

> + 
> +        clkc: clock-controller {
> +            compatible = "amlogic,gxbb-clkc";
> +            #clock-cells = <1>;
> +            clocks = <&xtal>;
> +            clock-names = "xtal";
> +        };
> +    };
> 

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
