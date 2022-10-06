Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDB3C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Oct 2022 15:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRg9wrt6rPavzyaDJSiA2pQRjvyiEBE4Nn+vc77keAY=; b=1Rp/0BrcnjcY2FumnN06ch1YNv
	FBvY2rOoMZo/bFCYF9inIdBu/uAKv/t1CXsZO0uERB9EIJS/Y9QzXbEZuvSQpLggThQ70PyoPPRPR
	DDLUxFH8Vy74U6/okuVquCTaNvc/+OE1rbcIyLLRgDZ4xd+t3GVZvL2/lXDFDeJcHkECP2O4LRkTX
	JTb47SxFpfsb4yS7L3yY+DVwXX1CtTkS3ivXtOC9nZ9BrOJ0q0/X173CoQX/F74QkoDEBVyO/VWzS
	jJKsUn7jUG46+FbYZXLX+SiNzpSxWwrSQqY+M2RgYZmdD7N2Awok7AGJMo57FExrvtPLWm626p7RS
	41smgc6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogT7K-003YHj-2o; Thu, 06 Oct 2022 15:48:58 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogT7G-003YFW-5d
	for linux-amlogic@lists.infradead.org; Thu, 06 Oct 2022 15:48:56 +0000
Received: by mail-wr1-x42d.google.com with SMTP id a3so3399092wrt.0
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Oct 2022 08:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=+3zPXnpnurVqkyWfh7imcEmKL4InpVj2u33K45eRBbc=;
        b=IoWihUEwnpnTLnpHQHHxLiTKyV5QPuNS6PCBEKsl6ZrLL3RofTtoyfmOlSYH9ok1TD
         L+ADNRSC2g7EfFev6QLgV2hFhbPHPqfCLFjivFtejVfszLS5rCZiMCAfVa+SPtYYgimV
         ezvCd+rBuhbwsoRzz5b9HahwwEfr7lMFepXdK+l+30H2E8Ervyh811Ls18ET+Jy4gu4n
         mpAq+tDaJ91UL1xwXentpVhNtRnL5RriVsyLlXxdtwc8+Ls0Qr0f96+iQDo4hpSt5wgm
         CC63L8xRZfBdsZQZbo5HtpirZG/1jdcu/qfQcx4Fq14mJNuQLaqblzmVQUgTJLD2oOiZ
         Jvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=+3zPXnpnurVqkyWfh7imcEmKL4InpVj2u33K45eRBbc=;
        b=4J7prnO0v+YBtg+PrOQTrDJFsOpKWtkI0hnv0lYbWGyb3caminBK04IeeL2QPnKsar
         5yy+hPGmkatl4gHGou7Fq1CaC48GHKRnol6tgq03bDKsIo2op9Z/sqZtX4CcPrYmckAu
         bHl3zA9FcLLuCiUb0Fadek+X/NDUZorbcpWxiKPBqGujHi3PRz9NvMcAu7kLHi14eHqI
         oYo32RmqJW4lEkGmUMn+PxA52hhOkDDAi1/5PARcfe9zJ9jvlXk/PsFf9mofuzZmgXu2
         P0uvScihmW6vNuLGPaFog+CIB2zEDkzFhmOPSvbCx/NDpO8xwNmwveEUuqwCFSWVul5P
         RHTw==
X-Gm-Message-State: ACrzQf2y7NRypixPUm7mT0tyR8VnfQThTJUvTlVNP5zEcMS1FPcjvoH4
	W1x2Tw0sQo+tYmtROA1WXhIQjw==
X-Google-Smtp-Source: AMsMyM5l/VXA+U+pVwucM15R2+ysEwIQb1CUvCAdfzFaI6nIzUDdNI8kxERgz563HumDXD6XBsebmw==
X-Received: by 2002:a5d:6d07:0:b0:22a:3f21:3b56 with SMTP id e7-20020a5d6d07000000b0022a3f213b56mr383272wrq.679.1665071331331;
        Thu, 06 Oct 2022 08:48:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e032:72ae:542:774? ([2a01:e0a:982:cbb0:e032:72ae:542:774])
        by smtp.gmail.com with ESMTPSA id bh9-20020a05600005c900b0022ccbc7efb5sm18696153wrb.73.2022.10.06.08.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 08:48:50 -0700 (PDT)
Message-ID: <2c22e3b9-3da4-78c4-e068-78b84e24b2c3@linaro.org>
Date: Thu, 6 Oct 2022 17:48:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] spi: dt-bindings: amlogic, meson-gx-spicc: Add
 pinctrl names for SPI signal states
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Mark Brown <broonie@kernel.org>
Cc: Da Xue <da@libre.computer>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20221004-up-aml-fix-spi-v2-0-3e8ae91a1925@baylibre.com>
 <20221004-up-aml-fix-spi-v2-1-3e8ae91a1925@baylibre.com>
 <d2ce98d7-1025-9c6e-e207-00e91942077a@linaro.org>
 <fb2706e3-f758-a0b0-d595-75ef362a853e@baylibre.com>
 <7bcb9ef1-6b56-2f5f-3ac9-acc9ed9370df@linaro.org>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <7bcb9ef1-6b56-2f5f-3ac9-acc9ed9370df@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_084854_280533_B9328FE5 
X-CRM114-Status: GOOD (  17.89  )
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

On 06/10/2022 16:11, Krzysztof Kozlowski wrote:
> On 06/10/2022 12:57, Amjad Ouled-Ameur wrote:
>> Hi Krzysztof,
>>
>> Thank you for the review.
>>
>> On 10/5/22 10:14, Krzysztof Kozlowski wrote:
>>> On 04/10/2022 13:10, Amjad Ouled-Ameur wrote:
>>>> SPI pins of the SPICC Controller in Meson-GX needs to be controlled by
>>>> pin biais when idle. Therefore define three pinctrl names:
>>>> - default: SPI pins are controlled by spi function.
>>>> - idle-high: SCLK pin is pulled-up, but MOSI/MISO are still controlled
>>>> by spi function.
>>>> - idle-low: SCLK pin is pulled-down, but MOSI/MISO are still controlled
>>>> by spi function.
>>>>
>>>> Reported-by: Da Xue <da@libre.computer>
>>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>>> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>>>> ---
>>>>    .../devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml   | 15 +++++++++++++++
>>>>    1 file changed, 15 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
>>>> index 0c10f7678178..53013e27f507 100644
>>>> --- a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
>>>> +++ b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
>>>> @@ -43,6 +43,14 @@ properties:
>>>>        minItems: 1
>>>>        maxItems: 2
>>>>    
>>>> +  pinctrl-0:
>>>> +    minItems: 1
>>> maxItems?
>>>
>> Will fill it in next version.
>>>> +
>>>> +  pinctrl-1:
>>>> +    maxItems: 1
>>>> +
>>>> +  pinctrl-names: true
>>> Why do you need all these in the bindings?
>>
>> SPI clock bias needs to change at runtime depending on SPI mode, here is an example of
>>
>> how this is supposed to be used ("spi_idle_low_pins" and "spi_idle_low_pins" are defined
>>
>> in the second patch of this series):
> 
> I know what it the point in general of pinctrl configuration... But the
> question is why do you need to specify them in the bindings? Core
> handles that. IOW, do you require them and missing/incomplete pinctrl
> should be reported?

Looking at other bindings, when specific pinctrl state names were requires, they were
documented.

There's some bindings with pinctrl-names for specific states like rockchip/rockchip,dw-hdmi.yaml,
mediatek/mediatek,dpi.yaml, mmc/mtk-sd.yaml or mmc/fsl-imx-esdhc.yaml

Neil


> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
