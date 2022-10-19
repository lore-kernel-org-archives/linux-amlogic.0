Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111E6C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Oct 2022 14:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HHe56DLQoBXIGyEPl2e9YgVj8eyKIyuF73F64lOFnGE=; b=yeZTTk3Vob/JRD
	5NEi8A166hD1QorKk6jJiljRhqUYe/ONnN33QB/FI39s/LJOm0L2IxKxmluGW2cWc/7xqTvchYn1y
	v2x/QfEuygSPR7otI/DvkDZyDpzP1kr+VPKhvu91l40RosFVs4z6l6ip6qaJe0K02vXo3PygMDzY9
	gh16urv8lfV4XQulwTmiSewuQ4VMnADcMGIFRWLmyLN4f/9jcf0mxyzA4+WfvTSE4Tez1MsXyX9JU
	s1y5yV+1ofGjIjONUr/RTBdynWZTsXfbcaCmwvGkDe4rq0BVeNIQBbzJaR5WMfyHv0UKWkcaVdC6X
	8c9bm/Xi84S80xUrCG1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olAPv-002u6U-PC; Wed, 19 Oct 2022 14:51:35 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olA4Y-002nWD-MA
	for linux-amlogic@lists.infradead.org; Wed, 19 Oct 2022 14:29:32 +0000
Received: by mail-qk1-x72e.google.com with SMTP id a5so10775786qkl.6
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Oct 2022 07:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rEmIhwLP6JWJlQRt/3w8mhy6Yg1o3TLKHqQiOhMxy0U=;
        b=ilprgxZy/nxFTTz37DvZ1mP/ydqyP3gwcaRJpuxF1UGyotKOl1P0TiyF+qbRDXAVP+
         akYeivho+XgXIdhxz/1VcgkOGZfNaJDsQECdfdTkS6TTo2LVgrhTqAm6ZgwAdYEwfXlO
         zxfaDJfLj27/AjML/XccPnZwVbKFy9U6IkozVVN5YTtOkJUYLEgBeUy/uDP62/+Tw7lL
         tMpbux0+ueArUxiap5maUr7qhn1u6sU12qPulUMS8yLmn70JLDoPH+st0+0ZPCAaAHZ7
         Dcq0zZ6TK48SG9SefGqm3jvUjdISTD6ETlJmCPAzI73W3Io2vVKh/okOJTkgLCpE94Kt
         S4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rEmIhwLP6JWJlQRt/3w8mhy6Yg1o3TLKHqQiOhMxy0U=;
        b=1MVMSIEKlLvJb5/fsDY1Dy6pvsaSesd/lvYaVuDhG2BWawo2mUeTC4/15zSTSe4SQ7
         CF5osKO1FsEsqEpaXOY/nS2u1m/w1WIf9QGjA3bwJgY+pP0tnClJ7LovxeKQmuXn/NJS
         WmC7tByDBwgEND5WGL8RwvES9DRvOeqRlDigh48LZzKGwoarA2iWy0PeaN7JD4nV0gPX
         Dz28Kp5LifadIoUI35e5/jymuKVuWxHrZ3R50P2EBLUkS1y3pEjaOYKE5NrwzHu/iT+t
         YHSFQmglAgt1Tv8uYZ3nLGA/S/Ve5sua1TbmIXImGCUWn2CaIbnVO5lwtqp0SaDQLBdH
         Cpwg==
X-Gm-Message-State: ACrzQf2sfOYziQHpC8rxhXQhCTrNlp3wRznMxNYa8iBPXs0rDQD4POL9
	fWj8Bec37n4nSo7JsPHLaLOqBA==
X-Google-Smtp-Source: AMsMyM49VXrZGh0Y6/lHBCG4YpU/HQkprtBYeSAxBKwVJI5YDUWZ81RHBa5iViI4NMMV2LjRZt4rPA==
X-Received: by 2002:a37:9ac4:0:b0:6ee:caa8:fe2f with SMTP id c187-20020a379ac4000000b006eecaa8fe2fmr5788394qke.638.1666189768362;
        Wed, 19 Oct 2022 07:29:28 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id u24-20020a37ab18000000b006bb83c2be40sm4993247qke.59.2022.10.19.07.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 07:29:27 -0700 (PDT)
Message-ID: <d355ee40-5905-4d10-8300-81e9a63117ee@linaro.org>
Date: Wed, 19 Oct 2022 10:29:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 1/2] spi: dt-bindings: amlogic, meson-gx-spicc: Add
 pinctrl names for SPI signal states
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Mark Brown <broonie@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: Da Xue <da@libre.computer>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221004-up-aml-fix-spi-v3-0-89de126fd163@baylibre.com>
 <20221004-up-aml-fix-spi-v3-1-89de126fd163@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221004-up-aml-fix-spi-v3-1-89de126fd163@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_072930_801112_5AD977CF 
X-CRM114-Status: GOOD (  10.15  )
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

On 19/10/2022 10:01, Amjad Ouled-Ameur wrote:
> SPI pins of the SPICC Controller in Meson-GX needs to be controlled by
> pin biais when idle. Therefore define three pinctrl names:
> - default: SPI pins are controlled by spi function.
> - idle-high: SCLK pin is pulled-up, but MOSI/MISO are still controlled
> by spi function.
> - idle-low: SCLK pin is pulled-down, but MOSI/MISO are still controlled
> by spi function.
>


> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,meson-gx-spicc
> +
> +    then:
> +      properties:
> +        pinctrl-names:
> +          minItems: 1
> +          items:
> +            - const: default
> +            - const: idle-high
> +            - const: idle-low

You should also define in such case pinctrl-0 and others.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
