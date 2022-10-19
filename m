Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C467C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Oct 2022 16:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLNiVmpU4fVW8MzrF4HFceizM7mAXlXI6yqntpulDyM=; b=yDarYXeod/yFw3ZYhVTIVJmkje
	BECwJ5t3EQSZmGzVIyzuvj7qm34cj4cHl5XkJVd9+jmT9H2Nc85pkx0NCDjXQ0MRBkhCY6b/dzGO8
	D6Fg1xk2r8Q6H7jX9ja0RI+pJGTN7QxQHk0bvfFSWx5xmTIvMvsq6UtDElvf6EGdUzcPc6fKcI3F2
	ncVtemQMBKGWE63B9Qxcl69Fe05goQPkCeZxWHie0O02wV+CzUSfA77v6EU7+XVThK9ng0BjhSvaW
	jAr+9sYSCPA9/t3+ctng7bdEKnR+1oNRIQlrEBea9ZI+0FaoX2OyqY7GKeZTVQSFTG81ZhXYwa3mN
	LGn3Zzxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olCK0-004SI0-9B; Wed, 19 Oct 2022 16:53:36 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olCJn-004SDe-RX
	for linux-amlogic@lists.infradead.org; Wed, 19 Oct 2022 16:53:25 +0000
Received: by mail-wr1-x42e.google.com with SMTP id bu30so30126019wrb.8
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Oct 2022 09:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LTAsnU5E92eB+qM6c/ybV2oQFafDvcuad98jbA6ENts=;
        b=WpIqH6sWxI6Hu6UReuyNYrXyJhDU+rDEgOP2RlGzl1zKwZERTXOvQh6h1JCi3h+LXe
         LZUA9R/IiGCU0NllpowXPn+Uv9KCmsSx5ADU6HXkhZHumIZ+l0Maaw1M+hDV+XYp3gmy
         mHoD7i4M2m4WiiHH6zMqPxqwk/vjAzNXHXHg1zKmOlR6q2+enQZVK4ODS1rTzYEi4c/8
         5NdGRXYH4AfV0uXEiNK5ndX2gGR1VW7a197z2UMKYuwWVSkAvTrAaiIwfBjnGuog9zyB
         C7VUpP0yfgRhA/v8u5PZlcXnxUeHasXCm4yCB6jVt/KliKDsruTiMkmulyRaxTTIu+mt
         S1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTAsnU5E92eB+qM6c/ybV2oQFafDvcuad98jbA6ENts=;
        b=Dps7AhCNrGrVuXe/sXlraUOwFlAGBfno+3Q1T47QXFZxc2Y6Bc5CWG1J1rF8MaViDu
         2Hm1GL7oUo94xRJUhUXeYFIE6U7xQnx00y7WZfrkflFm18shk5RBX/O8o46kgxDqNxnG
         AkdziwH8E2j7eOqLx7QQ2s0baGj82DsM7el8tM+n8M+vfo/aWzYQkBxN42wsGvtfZzuw
         c+9eVpWdQUcxKKjhmobBQaaGK9mDd0z6YO8sXyhU2cZ60ZdMZg4cf7onUv1Zth0b12/W
         +SGHUpIPGFD03x+CqnDfQkcRJzzSxFcGyV3F1ZRvFC8Ao/EJKloqOAykoTQ/P7wB5E9B
         TYbg==
X-Gm-Message-State: ACrzQf0LZwvhpIYuTyUWO0yXBFacoNZebEwTc76cTkRahWttRJJzWG2+
	cHkxvju74GeTnuE9GCXeJALicw==
X-Google-Smtp-Source: AMsMyM6TUejGXleI8wbR+NzTKQK8JKTIGhCs1+rC2ZIma8ucCBvl4QA0tduEqQwFPKHHpZup6eUUxg==
X-Received: by 2002:a5d:64c2:0:b0:22e:41b0:42ca with SMTP id f2-20020a5d64c2000000b0022e41b042camr5930528wri.411.1666198399330;
        Wed, 19 Oct 2022 09:53:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b15b:4b56:592a:c397? ([2a01:e0a:982:cbb0:b15b:4b56:592a:c397])
        by smtp.gmail.com with ESMTPSA id j30-20020adfa55e000000b0021e51c039c5sm14905294wrb.80.2022.10.19.09.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 09:53:18 -0700 (PDT)
Message-ID: <dc918114-8b89-441b-5ba1-aaf3ae084860@linaro.org>
Date: Wed, 19 Oct 2022 18:53:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/2] spi: dt-bindings: amlogic, meson-gx-spicc: Add
 pinctrl names for SPI signal states
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, Mark Brown
 <broonie@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: Da Xue <da@libre.computer>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221004-up-aml-fix-spi-v3-0-89de126fd163@baylibre.com>
 <20221004-up-aml-fix-spi-v3-1-89de126fd163@baylibre.com>
 <d355ee40-5905-4d10-8300-81e9a63117ee@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <d355ee40-5905-4d10-8300-81e9a63117ee@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_095323_928789_4B76A57E 
X-CRM114-Status: GOOD (  12.39  )
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

On 19/10/2022 16:29, Krzysztof Kozlowski wrote:
> On 19/10/2022 10:01, Amjad Ouled-Ameur wrote:
>> SPI pins of the SPICC Controller in Meson-GX needs to be controlled by
>> pin biais when idle. Therefore define three pinctrl names:
>> - default: SPI pins are controlled by spi function.
>> - idle-high: SCLK pin is pulled-up, but MOSI/MISO are still controlled
>> by spi function.
>> - idle-low: SCLK pin is pulled-down, but MOSI/MISO are still controlled
>> by spi function.
>>
> 
> 
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - amlogic,meson-gx-spicc
>> +
>> +    then:
>> +      properties:
>> +        pinctrl-names:
>> +          minItems: 1
>> +          items:
>> +            - const: default
>> +            - const: idle-high
>> +            - const: idle-low
> 
> You should also define in such case pinctrl-0 and others.

Ok I thought it would be covered by the pinctrl-consumer.yaml
but yeah we should allow pinctrl-1 and pinctrl-2 here aswell by adding:

             pinctrl-1: true
             pinctrl-2: true

> 
> Best regards,
> Krzysztof
> 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
