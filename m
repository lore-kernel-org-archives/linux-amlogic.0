Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E267EC64ED6
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Feb 2023 14:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D44N2K12+hAb+ESrljA3ks8UFEB3KVzbIZwJJ7CMq1s=; b=AmyH9mNwzM7oHp
	8yn1Brj2VGynAhXFhyuiOyQZQHU2DIwC2RYqYLkDq2v5XqgIAQfZjG4hpJYUEnL2OaO6X4ShfgvvG
	CziSy0CTGGfORv4ZN/AZ4MC5ZnxKybAJQoXi41YAQri77mK/xeAid0tviOXyOBjemUbtKgE1iGXzd
	RCb2SjSZ6LYqo/9GhbANOdFxsQJpcCbROH2IM+l2aHm322jKVOH9GKQ3O5633pJLlzMnm8Ne5P8wI
	LWQ0WfjIVSb2YTm6wyVK7oggAFKXuReLD6C0ps6rZcTUVzAHE7ermP+FQfIGoR7p6UJMsc6co3Z4s
	xHvJrVrSpFtnfrdWJEWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWeh3-00A1QY-Iq; Mon, 27 Feb 2023 14:41:33 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWegz-00A1NA-Gy
	for linux-amlogic@lists.infradead.org; Mon, 27 Feb 2023 14:41:32 +0000
Received: by mail-wm1-x32a.google.com with SMTP id j3so4397745wms.2
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Feb 2023 06:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K1ciYzjzBy3gfz4y6Y2JrahH5KBtu69kG00GA/F52AY=;
        b=galyeW3Y/ZKXfxjNntAQk6EiQUOCJT4CyWMa7zLNmhh+PaDRlUOlTGF0/7YLf/KEOT
         hCjDk4RMDE3fr5z3FvT+qolNVLqKXIzYk2jfteD4dboVs8vDZsEpYpW2OLZ3bK4KjN3+
         KX/Z7GrtOFfvmR8JtbRCISD8i2IsYxyXFwP0xcOxQKsSiCjDXnr8czZaqyvZSWe+Zpob
         cVjKD+4+kkKIkFHp8nPosGGa/JXYM/5haHtGN8UK2PjebfKSB2Z3Alk69TpyF7iudX/L
         rKWdHm4q6kIG/X2O6V5f+mRWH7V7/Wb68SFEVwPnUZvls7p5mX/sn6Ih7F5qvXYHtUXt
         Y8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K1ciYzjzBy3gfz4y6Y2JrahH5KBtu69kG00GA/F52AY=;
        b=UbzhSxkIZJTYW5nHEp333KK5odJLyRuzhE+v/FEA6aTT4C4JRsp/XgAPIgj8Hzcay0
         Fa1VNViYNrx8t3GieZwMQAkrK8XZV0sAz85JoTCauVXsuXnOB6D6HDc5fiBKEFH17api
         /Xspm0Ws6gUB01SfoQd9CafFlt0qeT2E763qBaWxcbX9GXp/Pq84zF9nlf1eS3gUN9eN
         yo72Ff8QW/w21ZtQ9ycF/tzymImVLtnpXVAae6RbWlxz4lhd0FDqpb+RVETFGzZB6S1g
         URdl+/HOQTefU1WuFjVozJTG3VW/ZrLPxNhLonNv6fkmat6SdybGQDALkNKboRf1mK7z
         rLxA==
X-Gm-Message-State: AO0yUKVhXLC5m3sZ3i7PB8Yi2uyUD8CojLpE0K0RrVDbAZsh6JDsY/4+
	JqW03Qdcr1zbiTDZUCM1StYM1g==
X-Google-Smtp-Source: AK7set9HRlUGJup0r4UlH2WAr4w4xlP49Ruq+BeYt0uYrYvow/OWiJSmb8hqYYmcCG6hIUXk8Ad0FQ==
X-Received: by 2002:a05:600c:ccc:b0:3df:db20:b0ae with SMTP id fk12-20020a05600c0ccc00b003dfdb20b0aemr6859368wmb.17.1677508886098;
        Mon, 27 Feb 2023 06:41:26 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n5-20020a5d51c5000000b002c70d97af78sm7386052wrv.85.2023.02.27.06.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 06:41:25 -0800 (PST)
Message-ID: <a652dd51-34c8-f493-1827-710f9b82bf5c@linaro.org>
Date: Mon, 27 Feb 2023 15:41:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 3/3] arch/arm: dts: introduce meson-a1 device tree
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: Alexey Romanov <avromanov@sberdevices.ru>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linus.walleij@linaro.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@sberdevices.ru
References: <20230222115020.55867-1-avromanov@sberdevices.ru>
 <20230222115020.55867-4-avromanov@sberdevices.ru>
 <bc514ba7-406e-bca8-4d3a-4f8997cd3241@linaro.org>
 <d5d9a1fe-2f66-66e3-d88a-76a12f2ec55e@linaro.org>
 <20230227143929.h2lppesdiaj7l3gn@CAB-WSD-L081021>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230227143929.h2lppesdiaj7l3gn@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_064130_768046_102EC3D6 
X-CRM114-Status: GOOD (  17.90  )
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

On 27/02/2023 15:39, Dmitry Rokosov wrote:
> Hello Krzysztof!
> 
> On Thu, Feb 23, 2023 at 10:09:25AM +0100, Krzysztof Kozlowski wrote:
> 
> [...]
> 
>>>> describes following compontents: CPU, GIC, IRQ, Timer, UART,
>>>> PIN controller. It's capable of booting up into
>>>> the serial console.
>>>>
>>>> This is based on arm64 version of meson-a1.dtsi.
>>>>
>>>> Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
>>>> ---
>>>>  arch/arm/boot/dts/meson-a1.dtsi | 151 ++++++++++++++++++++++++++++++++
>>>
>>> There is such file and there is such DTS/hardware support. I don't see
>>> any reason why entire DTSI should be duplicated. What's more, your
>>> commit does not explain it - does not justify duplication.
>>
>> One more comment - I think you just added dead code. It's
>> uncompilable/untestable. Otherwise, please share how to build this DTSI
>> without DTS.
> 
> You are right, Alexey doesn't provide any exact *.dts file for any
> board, and *.dtsi file should be included somewhere, otherwise this is
> dead code.
> Unfortunately, our internal board *.dts file is useless for kernel
> community, cause there is not any chance to burn locally compiled kernel
> to our product due to secureboot protection.
> But I think there is one possible option. We have reference Amlogic
> boards somewhere in the office. So we can test 32-bit configuration on
> it and prepare proper *.dts file for that. What do you think, it
> reasanoble?

You just need to provide valid board which works in 32-bit mode. Anyway
duplicating DTSI is a no-go and we do not do it in other platforms.


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
