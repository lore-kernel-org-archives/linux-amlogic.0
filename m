Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FBEC6FD1C
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 09:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsz8JhLyjnGo5xqFpFk4XWTIsm3uU36GrUv52tZBM8Y=; b=Mf8k8PzKee1rvcS2J6zmseKHtm
	fQ9P0xM/0zTXerRSqXQ4Eet9a8yPqetpAPmEP51/Z0LuevrSXYdK8AGtRRl2aS4h1PMtL9mJxL9Q1
	aKkMvm1jEMdaKWCKJM4gzD5HAIMDhIA6cIHcTJ92PptV9RSLwkft/g3YGH0m8aOu7v7MZhw2d3ScH
	esA06cdNrBuuabAnV2HXbYhZF3+djnydzvH0U58kY+87trMMSEp4KJoEtTEJxLl3DEVkTJFU+864x
	3SabxXKAUG1stm433kJptoxNJVnn4O0wfP0UvuMy3x5KB5OMA5RYni3cpw/GZf+u7XLcdKZulUbLg
	6nSXlpMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGzJ-001NuT-1h;
	Thu, 23 Mar 2023 09:12:01 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGzG-001NtA-0J
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 09:11:59 +0000
Received: by mail-wr1-x433.google.com with SMTP id d17so11203097wrb.11
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 02:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679562716;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FFw6On5GWKP9Yx/iOzJZ3hP79avgSWRYu5AU8eAnFgg=;
        b=XrOk5J0nOb+4Bwzoxv40TzazsK0MVkdhumyNdd2X20npfWaqd9fXxZXrjxFw3nvnYD
         6f8UHlhCTaQm3r2aCP4bdOGtexK5xje6t2s6ihYfpwcwme/6JpaaEm4Cwm8G5Wo1UfJg
         TwGGIA3TWc8BMxl2GHIrWdD5FOlffGfFVC7BBd4dzNvqXNLDq2uHUqARvfgo/TLztf2W
         8gKgxl02UlNLZXMppw7giKePav+cv99pOPjJG8sTsXHz3BY2Vs7yR+YrY65CWc3Xbri/
         ji5itVRKb9o7uC3I5bjPND6l9lLWaio5lcR4tgCG/DjYtF5ipjFwX7mYrRB397D36I7U
         F2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679562716;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FFw6On5GWKP9Yx/iOzJZ3hP79avgSWRYu5AU8eAnFgg=;
        b=U+HmcJDRr9HDa7kXwp2S6ThLy62l9Dbya6bGeekFsAvtfT9ktWQTqq/Wd8YfvqUWZT
         ch4ineP2c8luusuTy1I7bcDPcqJkanPpqmx6h3X7v+hErPXTtvgvU8GF226t8YmaO0er
         +vaM/aCHaVclEaevmsInv8KJ9yF35nOnUyJuoB0Jt37j/gQKcq6j5zd+NhAOhdIQKsPz
         Mt1bZmLqRoMKOEop5sUXRfoBLFMcnhNrdjP4FpEH7vEk3JWABbVFNQZxD+honk8/uaP2
         3k+U0g+0LglSXH+9DmcHGk8j+t2Fy7OYE8fCt/7cl4LBOhFVTU3vfq6nr5fMb16CMHrV
         SZAg==
X-Gm-Message-State: AAQBX9cHdrseA72hoZnivtc5ldeJikLdmdWKNE9PjZN2iAthsWTcunjv
	vsQMC0GChXzOgFnSaxTvD9U3sw==
X-Google-Smtp-Source: AKy350b92zCNadItJJq5B+JKgVLvHKVmzqOd2qkeIzALoHhVFAZA099EcknZzO4P7ASa8073zZYoaQ==
X-Received: by 2002:a5d:5003:0:b0:2d7:a918:a2b7 with SMTP id e3-20020a5d5003000000b002d7a918a2b7mr2334209wrt.48.1679562716566;
        Thu, 23 Mar 2023 02:11:56 -0700 (PDT)
Received: from [192.168.7.188] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6082000000b002c6d0462163sm15607659wrt.100.2023.03.23.02.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 02:11:56 -0700 (PDT)
Message-ID: <6c0c9b5a-3499-b0b2-ae58-7d5b17039c6f@linaro.org>
Date: Thu, 23 Mar 2023 10:11:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: i2c: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Michal Simek <michal.simek@xilinx.com>, Peter Rosin <peda@axentia.se>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20230322173530.3971676-1-robh@kernel.org>
Organization: Linaro Developer Services
In-Reply-To: <20230322173530.3971676-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_021158_137987_59057EA0 
X-CRM114-Status: GOOD (  16.43  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 22/03/2023 18:35, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml | 4 ++--

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

>   Documentation/devicetree/bindings/i2c/apple,i2c.yaml          | 4 ++--
>   Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml  | 2 +-
>   Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml     | 4 ++--
>   Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml       | 4 ++--
>   Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++--
>   Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml       | 2 +-
>   .../devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml          | 4 ++--
>   8 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> index 199a354ccb97..26bed558c6b8 100644
> --- a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> @@ -2,8 +2,8 @@
>   # Copyright 2019 BayLibre, SAS
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/i2c/amlogic,meson6-i2c.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/amlogic,meson6-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Amlogic Meson I2C Controller
>   
> diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> index 4ac61fec90e2..243da7003cec 100644
> --- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/i2c/apple,i2c.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Apple/PASemi I2C controller
>   
> diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> index ea2303c0e143..6adedd3ec399 100644
> --- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> @@ -75,7 +75,7 @@ required:
>     - clocks
>   
>   allOf:
> -  - $ref: "i2c-controller.yaml"
> +  - $ref: i2c-controller.yaml
>     - if:
>         properties:
>           compatible:
> diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> index 2e95cda7262a..7a675aa08c44 100644
> --- a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> +++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/i2c/cdns,i2c-r1p10.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/cdns,i2c-r1p10.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Cadence I2C controller
>   
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
> index 6e0a5686af04..f34cc7ad5a00 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
> @@ -45,7 +45,7 @@ properties:
>   
>     i2c-parent:
>       description: phandle of the I2C bus that this multiplexer's master-side port is connected to
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    $ref: /schemas/types.yaml#/definitions/phandle
>   
>     mux-gpios:
>       description: list of GPIOs used to control the muxer
> @@ -55,7 +55,7 @@ properties:
>     idle-state:
>       description: Value to set the muxer to when idle. When no value is given, it defaults to the
>         last value used.
> -    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    $ref: /schemas/types.yaml#/definitions/uint32
>   
>   allOf:
>     - $ref: i2c-mux.yaml
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> index 0e88c85985b5..9f66a3bb1f80 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/i2c/qcom,i2c-geni-qcom.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/qcom,i2c-geni-qcom.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Qualcomm Geni based QUP I2C Controller
>   
> diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> index bf396e9466aa..94b75d9f66cd 100644
> --- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> @@ -90,7 +90,7 @@ properties:
>     st,syscfg-fmp:
>       description: Use to set Fast Mode Plus bit within SYSCFG when Fast Mode
>         Plus speed is selected by slave.
> -    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>       items:
>         - items:
>             - description: phandle to syscfg
> diff --git a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
> index 1b598638d457..658ae92fa86d 100644
> --- a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
> +++ b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Xilinx IIC controller
>   


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
