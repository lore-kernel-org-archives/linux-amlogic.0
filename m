Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BA1C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Mar 2023 15:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RpW9k8Cw+24AOBAqWGLrzrHN0mrKKkVi3TVrXYodNYE=; b=HRUWVrn2I96WM7Ox67O+HHyGuC
	PA+rIRA3vugE6hZu3wWvyijHtz3d6ufUwixMyqnwLoKKhcjDpAfBpepYl30FQLVzxfNfuPyRS3u9e
	1UoOaf6LeDgRsOVQ+65srUEm/D50sGhDSLEvXbDyvL+ofBOQE89tgHYoZwh8MJNP/Uy1qcThPqjJ3
	P7FrUijPJCAR2SrTS/c49SFGOChU159skkUf8cy0lzZUzpaUL4TOGLGs/X9yajFRwjPQ5vCmDHREH
	3ZpMqx2CAMKeG77X5AI8Z6eSPUZ/NhBw8aGc692ntm2haglX+wfhH+JyuhGFDBK+PKWKVCvYq0whP
	8g2qgKsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf0oD-00GZER-1C;
	Wed, 22 Mar 2023 15:55:29 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf0oA-00GZCV-0B
	for linux-amlogic@lists.infradead.org;
	Wed, 22 Mar 2023 15:55:27 +0000
Received: by mail-wm1-x32e.google.com with SMTP id m35so11847668wms.4
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Mar 2023 08:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679500519;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zJTqUefxnpBvO7DIOSS6rnsCqCeH+NolRi/V2K9dxfM=;
        b=NCdIIOqHzKpbcNsSqbp4T0Wbx9wgB5qslNsVyTS+nBnFKE6zMSOj+9hr19VTdzAoBN
         RtGV0jlb29PXpNCILxAVWsF159DMzBZZOgdWk1LMJFUs2yNiR+Q9J6VitcqrUMhuotsM
         1hz1KSf7VIa8OELwy7ZhfATew9lxeSaYmM0mKdpLokGKVUTDO5zADqClO6gGqmlYtGy6
         PuFA2CgSujK4sqgFPI9EdFX3nXDg8l42rdXgk9dxY8Ryb+b53InDYL7NKLqM+LhW7fb8
         20IMV2mcBND+7Af5GCKNQn8XVdDmbj8o0PZTcaO+NiV5fA+tazO5oHLYyFybQDjZMB8S
         wa0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679500519;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJTqUefxnpBvO7DIOSS6rnsCqCeH+NolRi/V2K9dxfM=;
        b=tk64nt3boe1Rxx6ub3zzj/E+0j0ue2iHuV/lxmqi/oZxlG/tKmRsvVAoaG38U/J/nb
         BN9b9YWvA9m/GLYieN8pLB2rYP+g037+JRIaZypeETEw37f2IGJyCFGg9CpLt9p3VV2/
         l00XHDbBL4kuA9Hs47yHJB/D2bfjAsCRyyLh4BKgwEHFw6c0JPCz0KrkZMw/5+d8YJZo
         XAOa+/drdIVeb+IA/O7ONsU1LzwBqgZpNn5LYSQtwi2fYH1I0CxAYh3idNg/SoHrtoYe
         UZPUWIBDPrzLf9Iaqeq4TQ7T8SAch02vRJE+W2v+2vLkP59tgzlLNodyH6LRG0dnP41F
         Qflg==
X-Gm-Message-State: AO0yUKVPafEvREqcLvKZcJcsMNP1b5b2yJsTzFxnHSbR5vC5dDqiQ6uE
	v80US8G75z6f2fkPOj0MFcaSfA==
X-Google-Smtp-Source: AK7set/A6xCnkrsudKHQ0e0Y5/lirw38lluwjAT3qhc34uN8OF92RHjxAc1J1NYlLdOJYFUFgLjP0Q==
X-Received: by 2002:a1c:f311:0:b0:3ed:2a8f:e6dd with SMTP id q17-20020a1cf311000000b003ed2a8fe6ddmr31355wmq.6.1679500518772;
        Wed, 22 Mar 2023 08:55:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3606:a601:f273:994a? ([2a01:e0a:982:cbb0:3606:a601:f273:994a])
        by smtp.gmail.com with ESMTPSA id m16-20020a7bcb90000000b003edf2dc7ca3sm9906939wmi.34.2023.03.22.08.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 08:55:18 -0700 (PDT)
Message-ID: <f173b241-5efd-24a3-de06-647e33a62417@linaro.org>
Date: Wed, 22 Mar 2023 16:55:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: spi: add binding for meson-spifc-a1
To: Martin Kurbanov <mmkurbanov@sberdevices.ru>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@sberdevices.ru
References: <20230322150458.783901-1-mmkurbanov@sberdevices.ru>
 <20230322150458.783901-2-mmkurbanov@sberdevices.ru>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <20230322150458.783901-2-mmkurbanov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_085526_094259_50027299 
X-CRM114-Status: GOOD (  14.83  )
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

On 22/03/2023 16:04, Martin Kurbanov wrote:
> Add YAML devicetree binding for Amlogic Meson A113L (A1 family)
> SPIFC Driver.
> 
> Signed-off-by: Martin Kurbanov <mmkurbanov@sberdevices.ru>
> ---
>   .../bindings/spi/amlogic,meson-a1-spifc.yaml  | 42 +++++++++++++++++++
>   1 file changed, 42 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/spi/amlogic,meson-a1-spifc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-a1-spifc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-a1-spifc.yaml
> new file mode 100644
> index 000000000000..5f84063b01f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/amlogic,meson-a1-spifc.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/amlogic,meson-a1-spifc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson A113L SPI Flash Controller

I think it should be "A1 SPI Flash Controller" to be more coherent

Neil

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
> +          compatible = "amlogic,meson-a1-spifc";
> +          reg = <0xfd000400 0x290>;
> +          clocks = <&clkc_periphs CLKID_SPIFC>;
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +    };


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
