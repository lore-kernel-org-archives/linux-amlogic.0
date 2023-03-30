Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4940C761AF
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Mar 2023 09:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jd6gH8oCBhvc+HLuGxqHt87YdfRn6t/HeU8zLv3ZtPk=; b=tBqmIx6cj5CVvbu9FXpaMMnXIK
	Uiis1DuBKd/12Hrocbxp/67qYQ3bGJDsRt0PgFFV+FXcOBBiIS7VmFVhiZC+BDt/rOvqoyZrgxQhl
	p/P1q0oyltJancaV5HLKvneenNob1BZOuFpByddhpK0xDNZAdnnA+HYPU67hUO4Gehju9xA+gulQb
	9Tew6OH63iutEs0kGeCAB+nXFBSG5gw+LbTvmq31NYasaR7mBUDaZLorFwm289P2MWiAid0QQvTCe
	xeACDT9Q71tiwVPodcZNNRflF6zi5CKjhxWULUIZZpBcdF5w+DPDhexeWKrWJvk8N0xTGH9tE6p54
	OSrmQz6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phoRi-003FQP-1b;
	Thu, 30 Mar 2023 09:19:50 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phoRd-003FNF-2G
	for linux-amlogic@lists.infradead.org;
	Thu, 30 Mar 2023 09:19:47 +0000
Received: by mail-wm1-x333.google.com with SMTP id bg13-20020a05600c3c8d00b003ef90adc168so3534804wmb.5
        for <linux-amlogic@lists.infradead.org>; Thu, 30 Mar 2023 02:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680167983;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CbeX3b3mkNU5KCreV7qGDGfkWXIVSy5iikXXRCofrt4=;
        b=Em1thZ80LnmvFydE9lDwXBYXKGD1PpQp8O4whHafhmwL1rSD+XG2INd+ggxm69Wn9e
         Ez3mwMf6WpDIjytF1hucvi1yCzgFfE2O0W2NJqfm2G0XcmqGgvm1VPydx6jtLqrCdYqn
         90bH5eFlz12AAvp2XbDSYeV3mHiLzqKXiN3TcxDwuuQ+NTAe8KTCirNZ2aRREpmEaM5q
         JapCiyEACTmL9aGOlMB6ak75/t3fmtUMqgGO81wOomxCKIVe4shZspy0OP7OGGICG2Mg
         gp28vNO0nxZHXerkyoNWLfvQVR8DStz23RQV2xo2Yfj1X4UqjssAlQjYK7hNxHnskdMq
         3yFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680167983;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CbeX3b3mkNU5KCreV7qGDGfkWXIVSy5iikXXRCofrt4=;
        b=2dfjFWdoufsYU3kQ6aeXngw1x4oWmGG/eellOWu0FaRlctkcduHXVKn9Uff1SeNwS/
         /d64eoLxhGwQW21tsnA5CTTI0wJcsNW46VS2DONo5m9yjq/c3kvjSRcctNEOFbzzJs4A
         rIG8kMtTfAsJjcVYhcv69x6XLpSFXkH8RYll2wiNGHD4Wc9hmZKv1TM2IUvryS/bQYe1
         tziAJ9YpoJURPyGoTtnlKls7tkabsz38ihbpl3UswNKQ3F7az6JOCLw6AYlthUyJPnvy
         SYQWl9FcntN1so+rCpfMO7hGVEgLWFuEgcxg1vHpENTfExt2sBMrkddLERWmYbl460Yc
         SVzg==
X-Gm-Message-State: AAQBX9dH4hlfeVy2tOokDuKe5P7ypbQO+kcSyhgrJ/s8/LksX6xl++PY
	ZNtnv+VnJ7o7CLbp6hTmhalDzg==
X-Google-Smtp-Source: AKy350bWernDSucGomHC3DsmFroBEfGa1UdA19ER598biAVvnw/YlqWmIh9FqC7BItHOIFjpzaGtmg==
X-Received: by 2002:a05:600c:b49:b0:3ef:5fe3:c57c with SMTP id k9-20020a05600c0b4900b003ef5fe3c57cmr15666956wmr.23.1680167983346;
        Thu, 30 Mar 2023 02:19:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:fe8e:8291:fc25:6c8f? ([2a01:e0a:982:cbb0:fe8e:8291:fc25:6c8f])
        by smtp.gmail.com with ESMTPSA id z15-20020a05600c220f00b003ef5f77901dsm5055067wml.45.2023.03.30.02.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 02:19:43 -0700 (PDT)
Message-ID: <9c8e9516-8297-3eb9-2682-5de9b089ac85@linaro.org>
Date: Thu, 30 Mar 2023 11:19:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: spi: add Amlogic Meson A1 SPI
 controller
Content-Language: en-US
To: Martin Kurbanov <mmkurbanov@sberdevices.ru>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@sberdevices.ru
References: <20230327211351.686831-1-mmkurbanov@sberdevices.ru>
 <20230327211351.686831-2-mmkurbanov@sberdevices.ru>
Organization: Linaro Developer Services
In-Reply-To: <20230327211351.686831-2-mmkurbanov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_021945_803229_AF82B6C1 
X-CRM114-Status: GOOD (  17.39  )
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

Hi,

On 27/03/2023 23:13, Martin Kurbanov wrote:
> Add YAML devicetree Amlogic Meson A113L (A1 family) SPIFC Driver.
> 
> This patch has dependencies on the A1 clock series which is still under
> review - https://lore.kernel.org/all/20230321193014.26349-1-ddrokosov@sberdevices.ru/
> 
> Signed-off-by: Martin Kurbanov <mmkurbanov@sberdevices.ru>
> ---
>   .../bindings/spi/amlogic,meson-a1-spifc.yaml  | 42 +++++++++++++++++++
>   1 file changed, 42 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/spi/amlogic,meson-a1-spifc.yaml

I think it's time to drop "Meson" from bindings, please drop Meson here and in all the file
down to the compatible which should be "amlogic,a1-spifc"

> 
> diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-a1-spifc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-a1-spifc.yaml
> new file mode 100644
> index 000000000000..d2b1c754a6e1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/amlogic,meson-a1-spifc.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/amlogic,meson-a1-spifc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson A1 SPI Flash Controller
> +
> +maintainers:
> +  - Martin Kurbanov <mmkurbanov@sberdevices.ru>
> +
> +allOf:
> +  - $ref: spi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-a1-spifc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/amlogic,a1-clkc.h>
> +    spi@fd000400 {
> +        compatible = "amlogic,meson-a1-spifc";
> +        reg = <0xfd000400 0x290>;
> +        clocks = <&clkc_periphs CLKID_SPIFC>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +    };

Drop the include and use fake label phandles instead.

Thanks,
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
