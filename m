Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137FEC4332F
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Oct 2022 07:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otSace4txT9Cd79RA0/m0H466fZk9xIIh/I6DSKTG7A=; b=Orgz0xBUJ2HpSeg4ziXFOQ0jDS
	6qKasBOEDXGApkYfIBxWOtRYJaYWD/MUZAqhmqO0usjO784zfKiDInWgKqZ46CujDKa94tO7CZ9ET
	UX88mvqEsEZLaK/U+bY9jE74DTMNnPFox3ffFhpCUlXPkqRDIzMMN9CH3XFEksB+hg+Cqg8qNQrAn
	/j4M9tU/WXrfR1SQ9NT2C6TH8ocQu27gYcS4dkL2xn6HYGpEJJbqWeitFmmll5GCI/3EzGjcQ+xfb
	wfaC/QTuDh9KivEcj3ER1Rk92/MyYI81bFS8kVG9usBtvpuC/Xpwj/4/Za2Jt26Aq8FLaU09WDR+R
	UhzAB8Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogi2u-007zus-QO; Fri, 07 Oct 2022 07:45:24 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogi2j-007ziv-TU
	for linux-amlogic@lists.infradead.org; Fri, 07 Oct 2022 07:45:15 +0000
Received: by mail-wr1-x435.google.com with SMTP id bk15so5962232wrb.13
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Oct 2022 00:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=HZsbpC7Fo58je5AmkmLVo75u4dpgKURYG9fcUKw+/7E=;
        b=Wxr7jwjN3154+ni1xb93XMsuqfMBGVqPSr1kFsCJAKLaL2DSvJmrF3P/RsDpTWrRez
         gHWnvNSUiTxFCEsbh6DB/jtIOVc1MU1QzJwWLgv78pE+eJQKPV2zjoxoYAXcgvdbTDX3
         JAKxTmKZZct9kmAhhs5leZqRwkZld8vPFo9saBXFh+lPI/YdbeMdouiFt3xLtNJl7PZf
         4hCQIw67aXbzYv14pRLGXf5WkrH6onm3dO92DtBi+kHMc9Qgfr58Z1/G7hgpLF96Fh9X
         U87XurpP7oK8Xy07/eLy2n1SzV5aRm5TSl07sOMLS+068rWSn/hM12AT9C8DOiu8jUIf
         A41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=HZsbpC7Fo58je5AmkmLVo75u4dpgKURYG9fcUKw+/7E=;
        b=2i9TUGGLlnKxJSiEYImvVXPLn8tkLhungjsIIdJ1OcOMWmaol11g2VcjMi4ZMgvu2m
         NvWpKb3e6h29IE/FBV8pbytOQ8wBa+BqKMR5QY/ghlD8Kua5Y1nNKBWDH+khXV3zvCDi
         7/c3nH30g5AEJJhhjQXaSh2D6lvX+meWiJy7D0J5Gx+M4dxZ/pJm5zOwYwW+CCwGxRC9
         Y7Np2jxlBz5ErLuEhKBnJB/8mbqoozTFzDJV7optZdEAFwgj9ZoHShzHCW7n3U/UGkiu
         BTrTT8BFDgqHwXH1Q5nvlXfIXFWB899zXbjnqOLKOyhPlyxTWck/ZLQG9xbn/Lsh+MYd
         /4GA==
X-Gm-Message-State: ACrzQf3c5Fb5lwmFbaV7e8BPwpxmTob5AvHmozGVpqYprJg3J1/mv2zQ
	HgLxIn0y5wPIUZSVjZ6lGOKA1A==
X-Google-Smtp-Source: AMsMyM4efyzJENR3pFVQbCNJGQaFRP38aks/hCC41uhribF9GuF9AwMXNsiR0ywxFEVjzHWmugT8yA==
X-Received: by 2002:a5d:6245:0:b0:225:41ae:a930 with SMTP id m5-20020a5d6245000000b0022541aea930mr2298053wrv.342.1665128711357;
        Fri, 07 Oct 2022 00:45:11 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id f11-20020a05600c154b00b003a3442f1229sm8185520wmg.29.2022.10.07.00.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 00:45:10 -0700 (PDT)
Message-ID: <96160129-e9a0-ec0f-20d9-c92d1487eac6@linaro.org>
Date: Fri, 7 Oct 2022 09:45:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/2] spi: dt-bindings: amlogic, meson-gx-spicc: Add
 pinctrl names for SPI signal states
Content-Language: en-US
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
 <2c22e3b9-3da4-78c4-e068-78b84e24b2c3@linaro.org>
 <83649505-d8eb-b0b5-da9d-4536f58a7daa@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <83649505-d8eb-b0b5-da9d-4536f58a7daa@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_004514_047037_6F76EA52 
X-CRM114-Status: GOOD (  21.04  )
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

On 07/10/2022 09:04, Krzysztof Kozlowski wrote:
> On 06/10/2022 17:48, Neil Armstrong wrote:
>> On 06/10/2022 16:11, Krzysztof Kozlowski wrote:
>>> On 06/10/2022 12:57, Amjad Ouled-Ameur wrote:
>>>> Hi Krzysztof,
>>>>
>>>> Thank you for the review.
>>>>
>>>> On 10/5/22 10:14, Krzysztof Kozlowski wrote:
>>>>> On 04/10/2022 13:10, Amjad Ouled-Ameur wrote:
>>>>>> SPI pins of the SPICC Controller in Meson-GX needs to be controlled by
>>>>>> pin biais when idle. Therefore define three pinctrl names:
>>>>>> - default: SPI pins are controlled by spi function.
>>>>>> - idle-high: SCLK pin is pulled-up, but MOSI/MISO are still controlled
>>>>>> by spi function.
>>>>>> - idle-low: SCLK pin is pulled-down, but MOSI/MISO are still controlled
>>>>>> by spi function.
>>>>>>
>>>>>> Reported-by: Da Xue <da@libre.computer>
>>>>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>>>>> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>>>>>> ---
>>>>>>     .../devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml   | 15 +++++++++++++++
>>>>>>     1 file changed, 15 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
>>>>>> index 0c10f7678178..53013e27f507 100644
>>>>>> --- a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
>>>>>> @@ -43,6 +43,14 @@ properties:
>>>>>>         minItems: 1
>>>>>>         maxItems: 2
>>>>>>     
>>>>>> +  pinctrl-0:
>>>>>> +    minItems: 1
>>>>> maxItems?
>>>>>
>>>> Will fill it in next version.
>>>>>> +
>>>>>> +  pinctrl-1:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +  pinctrl-names: true
>>>>> Why do you need all these in the bindings?
>>>>
>>>> SPI clock bias needs to change at runtime depending on SPI mode, here is an example of
>>>>
>>>> how this is supposed to be used ("spi_idle_low_pins" and "spi_idle_low_pins" are defined
>>>>
>>>> in the second patch of this series):
>>>
>>> I know what it the point in general of pinctrl configuration... But the
>>> question is why do you need to specify them in the bindings? Core
>>> handles that. IOW, do you require them and missing/incomplete pinctrl
>>> should be reported?
>>
>> Looking at other bindings, when specific pinctrl state names were requires, they were
>> documented.
> 
> Yes, the required and/or necessary entries were added to few other
> bindings. Since Amjad did not make them required, why adding them? So I
> repeat the question for the third time - why do you need to add them to
> the bindings?
> 
>> There's some bindings with pinctrl-names for specific states like rockchip/rockchip,dw-hdmi.yaml,
>> mediatek/mediatek,dpi.yaml, mmc/mtk-sd.yaml or mmc/fsl-imx-esdhc.yaml
> 
> And? Just because someone did something is not itself an argument. They
> might have their reasons. If their reasons are applicable here, please
> state them.

OK, I thought the reason was explicit, we find it worth documenting
those optional pinctrl states for when the spi lines are in idle state.

If it's not an enough good reason, we'll drop this patch.

> 
> Best regards,
> Krzysztof
> 

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
