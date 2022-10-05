Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0368C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Oct 2022 08:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+Rxd6EsZrq/eiONlN9lgWZ5KEEBF+vnhodcXAcq7D8=; b=GeAcfRX+4PS4hT
	J5hJnG6d+v+8OLj23QYd00vbas4wHT5kj0tI4aTnhlk6RU1rY5WFbUJrU88zPCWloiuJwmIfrUMLq
	fr8UwogEbMneRXMHqfKCd5bJw2ytHqmrTh0F1TWgqGsvSCs9SesbaChS4gLCim6WKv6q5cfRWpfij
	zKDgabdC37OhMUgjOVOd/Ya/dpLr+BzG3gg8xOMeJDT+SldH8NAW/Po4rkC/plAqSxzDDbg3w+1R2
	TjRCs5PMcwf/6YtJ15CWJl5e3rqVe6zCoONohR0G4af0HLne81/fRTzu8RqnmSTgAUSEq7BOZvNcI
	///UOt5eHdWx5gumRpdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofzXl-00CzPs-ME; Wed, 05 Oct 2022 08:14:17 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofzXj-00CzOu-6Z
	for linux-amlogic@lists.infradead.org; Wed, 05 Oct 2022 08:14:16 +0000
Received: by mail-lf1-x131.google.com with SMTP id b2so13546440lfp.6
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Oct 2022 01:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Y0uHbn035tWwWO1RtVHpJOVJwEZiCVXw2pgVenq9fnw=;
        b=Xn/CjIA/NowDCL3dCSGCkqk0O2+030/EAsGXX/lTaALu9eI3v3CFG/SO7ED4xUlqAN
         N31qdCJHbTdPefleT2DVAgFt+rNYlXodKuw+POSA3Sp1TpURdVbbIVzPgtdi4CMduil6
         8Enj6zNwfEHEIu52i/KBgKsGfFNXJez8OokYjqfekYe3t+1SRb4VPH75kSGFKeYgXAGX
         4BB7c+BSd8WmhWm3Yw7g2MKnp7mmMb+7GSXjZWqj3O8Ce3T5XNC2PXlzZ0/sHh6coZDa
         wDpSfNla/jFPJS+GdqJMb7pUrfkf2JwJrw5P3pNndHjWt9rx/qGzjC6WEHgnhwfGIfme
         jPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Y0uHbn035tWwWO1RtVHpJOVJwEZiCVXw2pgVenq9fnw=;
        b=HsVLWQobjLW8Q218j1t0WDH1tEkN8QHgLRsjpYQnmCmrbUBFDDfCdrHYLRl8A4IR+C
         LSShIRMYJWTTzPqG6OvnV9FH8t6VYS2i28ThEq50MP367Ic1exFtpfGY41axDjRH3vhs
         GkS9Xrko4i++QSahhCfiyDafdGn0JSpMLP11hGrgXTZ3PD/2mVjQdDdtMPyuNBPAsu8e
         DT+F8yWAzYby7qQGDWwS5qi+w8mEVRTeZDnVnp3pPBmcXpSJVesUlhJxJ1Hv76nEyZLW
         c6A8bYnvSuXCVmlubJbItrvyV+o65znixlmqgM9Y2f4OHTYozxF8Tzq61sQqNh8XgFG+
         06Ug==
X-Gm-Message-State: ACrzQf0mSKR6IfUxJ8KrD7APF48pX/cZYS27Htq38cqiPKjF9bvNh0QF
	FSjtGmhfbzs4cenS/Gi51uJAnQ==
X-Google-Smtp-Source: AMsMyM6Wxvb70JmOJdSPcYnIs7XcdHOlzpt4207AZkXQMEhldb8cdP9iXuuVbyoxjqnO1qX2Y98o0g==
X-Received: by 2002:a05:6512:1084:b0:4a2:eb2:9d9e with SMTP id j4-20020a056512108400b004a20eb29d9emr10128640lfg.553.1664957653264;
        Wed, 05 Oct 2022 01:14:13 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g22-20020a05651222d600b0048b143c09c2sm2252172lfu.259.2022.10.05.01.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 01:14:12 -0700 (PDT)
Message-ID: <d2ce98d7-1025-9c6e-e207-00e91942077a@linaro.org>
Date: Wed, 5 Oct 2022 10:14:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 1/2] spi: dt-bindings: amlogic, meson-gx-spicc: Add
 pinctrl names for SPI signal states
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Mark Brown <broonie@kernel.org>
Cc: Da Xue <da@libre.computer>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20221004-up-aml-fix-spi-v2-0-3e8ae91a1925@baylibre.com>
 <20221004-up-aml-fix-spi-v2-1-3e8ae91a1925@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221004-up-aml-fix-spi-v2-1-3e8ae91a1925@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_011415_277297_5E4D3080 
X-CRM114-Status: GOOD (  15.24  )
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

On 04/10/2022 13:10, Amjad Ouled-Ameur wrote:
> SPI pins of the SPICC Controller in Meson-GX needs to be controlled by
> pin biais when idle. Therefore define three pinctrl names:
> - default: SPI pins are controlled by spi function.
> - idle-high: SCLK pin is pulled-up, but MOSI/MISO are still controlled
> by spi function.
> - idle-low: SCLK pin is pulled-down, but MOSI/MISO are still controlled
> by spi function.
> 
> Reported-by: Da Xue <da@libre.computer>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> ---
>  .../devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml   | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> index 0c10f7678178..53013e27f507 100644
> --- a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> +++ b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> @@ -43,6 +43,14 @@ properties:
>      minItems: 1
>      maxItems: 2
>  
> +  pinctrl-0:
> +    minItems: 1

maxItems?

> +
> +  pinctrl-1:
> +    maxItems: 1
> +
> +  pinctrl-names: true

Why do you need all these in the bindings?

> +
>  if:
>    properties:
>      compatible:
> @@ -69,6 +77,13 @@ else:
>        items:
>          - const: core
>  
> +    pinctrl-names:
> +      minItems: 1
> +      items:
> +        - const: default
> +        - const: idle-high
> +        - const: idle-low

This does not match what you wrote in the bindings - you mentioned only
two set of pin controls.


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
