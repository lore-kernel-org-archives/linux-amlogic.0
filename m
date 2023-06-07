Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B6AC77B7A
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jun 2023 14:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s00R1Lyu/k1ACgnIta76Xds2yFEBb6mONwXMlnWxWpI=; b=2PuArS8LiW/S5F
	HMqw58iQQiZJTyswbBz7NVzB0cwp9IFrm/fp4zE2/a8E24R+Ed9Ngk8K/UumzP/qnS2E3Cazp3bka
	vq1UOiK2Zsl901KNZisSRw3yOPqZe8c7EMv/BvtP8rYIXnzgPYgU5Ij8O1qfYRPR7q0ij+I2Ch7Ga
	JmbU6+rfEgtDdMR/SWHHbrhwCF2/Lg1Kh2+5xJYqzhRY0aUsqkyjs8Y2gvMZTXu6+/IQZxsMBa9h9
	8ybUa9P5BNnItIPqGGXMfHdyUyCwexC4cgGrKUOMWi9RlWBUXomacpt/qOz6SYND1oDVlQo7Uo7bg
	67lY/lKm9Vjm7GJdCBAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ucW-006KWz-1x;
	Wed, 07 Jun 2023 14:58:44 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ucT-006KUM-1a
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Jun 2023 14:58:42 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9788554a8c9so116692166b.2
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Jun 2023 07:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686149913; x=1688741913;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gJjTaZ/9cZA9GnMjrlFxN0BcpW9ecqXexzGH0t5m7pg=;
        b=QZtp60wD+75gS8sutSysW1Gt5v97dtcxNep2QtjO8YjTnwodJlOnvSVKHI9xa8kYtr
         DLvw+vYLWItGs39/ssYBe6cGf3k1K86bMckozzamLHDw8So1t81h1NuirKkpAACPOosL
         3+IHpGoghgtv+K5fQNtJMk7KRb4NZrlVVeqDpDQiCwF45+OQdMYsf18vErJE0e4+o1qq
         +99a7XbNwoEjshZltQVZbDB+bVs9ZuRjhEHU2xfzruJb/OMmzhUEsY87IASFlbxxnmPQ
         tw3V+IR8IPYE4cTPSTNj+nmOoeuyIlRwASCc5eLMnhlRt6OyFR80XImfkn/TJ8UHOLtw
         ebXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686149913; x=1688741913;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gJjTaZ/9cZA9GnMjrlFxN0BcpW9ecqXexzGH0t5m7pg=;
        b=ZEGK2Rti23bAuuDcXWj4VT7PmrzTHFELOeBlmzP+vMLfIwVocAZL+xn+GQUOY0h1GQ
         AtGdA6em7lbpYpVAQen+J4X5DAkPZIz0qQi6oo5BO00y7Fc2JyqZhtHj1q1tBFMm4331
         lHy5SttoM1v+9F3e90Z4j22RJwAwIK1fNJMzWi14VHLsLxIdJfsnONB5LFJpnIGID4s9
         j4jfYcPFDNQevobeBvYzt2aV3IlbhRc/N+fPSatQASrzTYM16alzpviCMUCgN7vwFeDQ
         YUTqvUYj1/FTl/MTIuP56mPtDbx3XNfCR/hLBMwSP05fYXT/I5Bpz4Kc6HLNXE7v51Hd
         8YMQ==
X-Gm-Message-State: AC+VfDw/xiFy1kWpuwpJWSr4FUiX2za0LzDVr2hczOSfc3RmDoaBrIeo
	9Vz/h4i6ZiHq3SHyWV8r+AK9wA==
X-Google-Smtp-Source: ACHHUZ6wzBYezPQx+NTgUt4QVORBO0tD9ssE0IbCfRYurBIDs8W2LBeRt9iNG8JBmBTHHs8zUMPPHA==
X-Received: by 2002:a17:907:1c17:b0:971:2ead:e161 with SMTP id nc23-20020a1709071c1700b009712eade161mr6874357ejc.6.1686149912938;
        Wed, 07 Jun 2023 07:58:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id bv13-20020a170906b1cd00b00978743b54bdsm1822713ejb.78.2023.06.07.07.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 07:58:32 -0700 (PDT)
Message-ID: <9105207b-0dfb-346f-422f-984cf3454f90@linaro.org>
Date: Wed, 7 Jun 2023 16:58:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v1] dt-bindings: nand: meson: Fix 'nand-rb' property
Content-Language: en-US
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 oxffffaa@gmail.com, kernel@sberdevices.ru, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230606193507.35024-1-AVKrasnov@sberdevices.ru>
 <20230607095802.3adcd4f9@xps-13>
 <166bdc27-f77c-9076-f866-180cfa5bff76@sberdevices.ru>
 <08da4e86-433a-7d2e-25ff-ffa24221abdf@linaro.org>
 <835a3587-1e0f-64d7-1d1a-b639ae8b7307@sberdevices.ru>
 <2ca6e619-1d57-8fff-6176-9ee890e0d167@linaro.org>
 <5ca9eb2b-4bc8-5883-a029-3eeca905fe6e@sberdevices.ru>
 <20230607113605.50a992bb@xps-13>
 <6c1973d1-38c0-6048-90ad-da2f60df8238@sberdevices.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6c1973d1-38c0-6048-90ad-da2f60df8238@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_075841_527482_E97E7F0C 
X-CRM114-Status: GOOD (  16.01  )
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

On 07/06/2023 16:52, Arseniy Krasnov wrote:
> 
> 
> On 07.06.2023 12:36, Miquel Raynal wrote:
>> Hi Arseniy,
>>
>> avkrasnov@sberdevices.ru wrote on Wed, 7 Jun 2023 12:04:29 +0300:
>>
>>> On 07.06.2023 12:08, Krzysztof Kozlowski wrote:
>>>> On 07/06/2023 10:57, Arseniy Krasnov wrote:  
>>>>>
>>>>>
>>>>> On 07.06.2023 11:53, Krzysztof Kozlowski wrote:  
>>>>>> On 07/06/2023 10:40, Arseniy Krasnov wrote:  
>>>>>>> Hello Miquel, 
>>>>>>>
>>>>>>> On 07.06.2023 10:58, Miquel Raynal wrote:
>>>>>>>  
>>>>>>>> Hi Arseniy,
>>>>>>>>
>>>>>>>> AVKrasnov@sberdevices.ru wrote on Tue, 6 Jun 2023 22:35:07 +0300:
>>>>>>>>  
>>>>>>>>> Add description of 'nand-rb' property. Use "Fixes" because this property
>>>>>>>>> must be supported since the beginning. For this controller 'nand-rb' is
>>>>>>>>> stored in the controller node (not in chip), because it has only single
>>>>>>>>> r/b wire for all chips.  
>>>>>>>>
>>>>>>>> Sorry if I mislead you in the first place, but you could definitely
>>>>>>>> have two chips and only one with RB wired. It needs to be defined in
>>>>>>>> the chips.  
>>>>>>>
>>>>>>> Ok, so to clarify: is it ok, that in bindings this property will be placed in the
>>>>>>> chip, but in driver, i'm trying to read it from the controller node (thus  in
>>>>>>> dts file it will be also in controller node)?  
>>
>> The bindings and your driver internal representation are two different
>> things. Anyway, as mentioned above, wiring the RB line to one die and
>> not the other would be valid hardware design and would require the rb
>> property to be in the chip node. Please perform a per-chip property read
>> in the driver as well.
> 
> Done, I resend both patches (bindings + driver update) as a single patchset. Your review comments
> for driver code were also fixed.

No, please send new version, not the same. New version means with fixed
comments and with patch changelog.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
