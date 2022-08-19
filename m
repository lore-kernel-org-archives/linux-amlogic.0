Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974DDC32771
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Aug 2022 13:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kBKrJ9L8p6NokqYjXD/xslW3DwD542ZRiwYZEfzyLsY=; b=UDVd9PnSmsgvRo
	H8m2SpkpaHpQOWcXkZT6F+9cLX5zdjGdUUI+9P1jEn1FDi5WDYjIy9eckqKpgKbQijjpfZnCVOJIC
	VFxcgwIn1S6Vmma4qh0SIr+P77TQEYougHM99ORjMFSyeOFU4Pw4oE3RDxKkzVq3wlVK/eJ7BGfC9
	HZJ0hoBslOfgLTjYUyhgHe/qC8HfDI7wu23AHwX7BNghUzcr4Yb+EE4RukvabVWDo3VzTfu1oGa05
	r1kPYgB9yze7H9lC4t6bB61BPY1022OVU7KDJbB5CHbu6ZB/O8sscNMebMSDCWxYA6wDL+UUl0831
	B0AqQggOfocxLKaZoq7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP2Ty-009GNG-RT; Fri, 19 Aug 2022 13:56:18 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP2Tw-009GJA-Ld
	for linux-amlogic@lists.infradead.org; Fri, 19 Aug 2022 13:56:18 +0000
Received: by mail-lj1-x235.google.com with SMTP id x25so4599266ljm.5
        for <linux-amlogic@lists.infradead.org>; Fri, 19 Aug 2022 06:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=7wKbTinwLLhyC/6cSb9XNE1uZn1Os1hcFfqjEzJyPxE=;
        b=k52lhCtLZm/1ReDEzS87+JWzXQ8IGW5O1J2BzGcgq6lPRxjdq8sXJcdUGFOscjGycm
         h7R/PgkjM8d+HMeGzuR//aFOvtd9K4S1ZNFcP1g3MnWgKohVJY9fNPb+Wq+mHmaArZgS
         y+hBFaeaJLSIMrCwhHSx0btBYgRTTSHK52heJVS33/EYMXaxW0rlgmlue5KnjohLvqwT
         LcEuxo3VO4RkpRzwA6eA6PjJ3B0PwWxrbOiSKpdQagIhbllut9DCos+l9D2zPZgnf3PL
         xCa9vite+tpqkI+gfa1T4auJNCAc02QJfo/N/N1jPuiijHFmN0jn1enkdadlgnMj1bKa
         bTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=7wKbTinwLLhyC/6cSb9XNE1uZn1Os1hcFfqjEzJyPxE=;
        b=EUJz7BUn6h6I/mH37qi+vuGOrejcJXI94nbL/ej9V4nEvNkrQj6u/V9XWBnp34+Dtk
         lFU06LvMCp03LmJGXhfVmVGdrS5pjCjyaN7PTLHtVTxJCnelGyWVPdjoIPAYsr3Ceq5L
         JW4KByxcmgf6mdLi93HK5e7KmEdOZtqqgvCArtxcKDbGAIO4TajJhmIwj90lVAuw24xK
         KI1mOUIm8k5hsvZ5qujxSK0zFRwWT2ARpYoNXcw1onXEWSZMUpSM+IgEL8/9jsz7NNax
         xVSRGvFDeEsF5NiK7txgecGbZIZXMothJ/GTrE5mK36r3/RulEpRZI0NnecZplaGUwy6
         chbQ==
X-Gm-Message-State: ACgBeo2N46rxYb636XA35LPx71ayvMNxBtg0Dwpzcfr3tEFcqgGrs746
	Nld6hWqGkvlnod/kj989qQMeUw==
X-Google-Smtp-Source: AA6agR46YW+0l7LgxUwuaGr0IASRdKw2I3+qnYWru5NiSpKYlerSSWgXiXMKZEktADcRTcfxSqmc9w==
X-Received: by 2002:a2e:9346:0:b0:261:8a31:b40c with SMTP id m6-20020a2e9346000000b002618a31b40cmr2087216ljh.267.1660917374078;
        Fri, 19 Aug 2022 06:56:14 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id w16-20020a19c510000000b00491aee1c4a5sm648010lfe.168.2022.08.19.06.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 06:56:13 -0700 (PDT)
Message-ID: <803b9823-3fde-c4fc-8431-79677212684b@linaro.org>
Date: Fri, 19 Aug 2022 16:56:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v5 3/4] dt-binding: perf: Add Amlogic DDR PMU
Content-Language: en-US
To: Jiucheng Xu <jiucheng.xu@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chris Healy <cphealy@gmail.com>
References: <20220817113423.2088581-1-jiucheng.xu@amlogic.com>
 <20220817113423.2088581-3-jiucheng.xu@amlogic.com>
 <0a10f55c-1e91-de8d-74c1-e2778841b7fc@linaro.org>
 <81452c8a-623c-3668-2411-fd7c39dc4280@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <81452c8a-623c-3668-2411-fd7c39dc4280@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_065616_752947_141800CE 
X-CRM114-Status: GOOD (  12.00  )
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

On 19/08/2022 16:44, Jiucheng Xu wrote:
> 
> On 2022/8/18 16:25, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On 17/08/2022 14:34, Jiucheng Xu wrote:
>>> Add binding documentation for the Amlogic G12 series DDR
>>> performance monitor unit.
>>>
>>> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
>> (...)
>>
>>> +
>>> +  interrupts:
>>> +    items:
>>> +      - description: The IRQ of the inside timer timeout.
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    pmu {
>>> +        #address-cells=<2>;
>>> +        #size-cells=<2>;
>>> +
>>> +        pmu@ff638000 {
>>> +
>> No need for blank line.
>>
>>> +            compatible = "amlogic,g12a-ddr-pmu";
>>> +            reg = <0x0 0xff638000 0x0 0x100>,
>>> +                  <0x0 0xff638c00 0x0 0x100>;
>>> +            interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
>>> +        };
>>> +    };
>> With above fixed:
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Thanks for your valuable comments and I learn a lot from them.
> 
> One more question, do you mean after modify the above two places
> 
> I could resubmit V6 as the final patch which include your reviewed tag?

Yes.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540


Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
