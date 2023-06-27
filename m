Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FDBEB64D9
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jun 2023 07:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wD7iHYhxvIw174qf8K8aAO8EpDSp0ZMTeGgQ+UfRlxQ=; b=GdAqCBHZLOgOv5yH2UIv6ZClXH
	PvD6T+rLaCe8gzDPYB/OnKkmJdqnuReYO9QJDPkXHKrIl1Iga8D/ZEEObBQPcgfSiQS5nJoSJ17Wl
	GrqGyGdAdpaakXh4q62BTJ3ywrgnB5EDRvQU+PC9v26P4E/MjXe0HJkcWTEonXQiwTmRcK6KY/UnU
	KnaeK/26fZEfLa2h+xd/YTnODwjJPvSd0XETayLJTyonKfpaZxf8ND6Fo4biEOmW/TvXn/99Bl6Si
	sO77LxmAeRrX5xZZ8k2dfp/6VC/hkL+75q6pe4mZD3NPH9iYAnbhm7NOnVAQ0bMqj9OqbTJdTjYXz
	gchB3eoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE3ak-00CTic-1x;
	Tue, 27 Jun 2023 07:58:26 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE3ah-00CTgM-1b
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Jun 2023 07:58:24 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f9ede60140so39507605e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Jun 2023 00:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687852698; x=1690444698;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x7/UbGp0E9Bxa4Bhgpxyx0OZdgH6N8kqPZt6xJxSjzc=;
        b=S5lD4ZfD82fXh6u0RLMYUVxFyY8zWED+PywdEsWbvPIfqz/XGaKoCpdhOoG+l9vCgG
         tV7f59jsuUPbx2irZ8DkkIq7GEcILFt8K4dkYB3kqnfLPGGRk4va+mN/3x9vITZmDL2E
         d0u2SeH+4ISstZ3b1pznIRxcTIHyN6DrjC8eRfNputWrDLl/pBpL0rlzb2u/Z1CNtUE/
         6IaQIaoEcYceN9M+6RvdF5A3TZPiVaaN8QtbgiFbwQmjKkhLdFPYSllYnhsPakWxEsvT
         7AxAHAOGulzd1Uezs+TWE/dMiD4e4to3V1rkqEQhC6vEJhTGjimwZLa65zypLzNjnBdU
         weFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687852698; x=1690444698;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7/UbGp0E9Bxa4Bhgpxyx0OZdgH6N8kqPZt6xJxSjzc=;
        b=NGYLjTWwpX9+5HeRanmG5TfjLCZJw32vxtUmk82avDzVWx29YHX3QNPlB6bNhCUtdh
         hyrLkwxmiism+zhkjz853IT3wOqHnS5bKUq8qPaICF/3qO7rzucOKuKHg1T16qIZXwya
         eRWVV+8T+2Fn7GCPahQvXLj0s+/V4iFmtVs5zGDhpLqvGsaT7xxwvMhyFWajkQLfNAWr
         k0gA0LUazUvokMXxMpVwYlc37Xxkyg51fuFhppZy8lSpds4JgKWIUwoEG/3Ih2+uN1tU
         3nGOUrus/ckub/w9k0xaArFPhIp9fkxcPcWYUPVGkCK5CINbP2TW98i86PV1K7oEg+Ms
         5SSg==
X-Gm-Message-State: AC+VfDydyRQ5VYmHebu9MMzqSBvcO1Ys8GBfXs8tdgY+aOtdO7S8iIIB
	BU7+OmHYH+qujL9b/8XnWslvDA==
X-Google-Smtp-Source: ACHHUZ4T/mzd1n8WwSghkYHzfB3fNK8Osd9PatO6HzHUrj6H8NK2aujs9IEhlhWWHP4pX4bdd92wkw==
X-Received: by 2002:a7b:c7c5:0:b0:3fa:9554:fb23 with SMTP id z5-20020a7bc7c5000000b003fa9554fb23mr3704596wmk.21.1687852698475;
        Tue, 27 Jun 2023 00:58:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cec9:2929:7a19:7afa? ([2a01:e0a:982:cbb0:cec9:2929:7a19:7afa])
        by smtp.gmail.com with ESMTPSA id o16-20020a1c7510000000b003f9b155b148sm12832074wmc.34.2023.06.27.00.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 00:58:18 -0700 (PDT)
Message-ID: <286732aa-a4b4-a426-d59e-3c37520479a5@linaro.org>
Date: Tue, 27 Jun 2023 09:58:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: New binding for
 Meson-C3 SoCs
Content-Language: en-US
To: Huqiang Qin <huqiang.qin@amlogic.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, tglx@linutronix.de,
 maz@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20230620070849.2059451-1-huqiang.qin@amlogic.com>
 <2e762290-46f1-0f0c-48b1-b399812f9ac1@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <2e762290-46f1-0f0c-48b1-b399812f9ac1@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_005823_540129_D3107957 
X-CRM114-Status: GOOD (  13.18  )
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

On 20/06/2023 09:34, Krzysztof Kozlowski wrote:
> On 20/06/2023 09:08, Huqiang Qin wrote:
>> Update dt-binding document for GPIO interrupt controller of Meson-C3 SoCs
>>
>> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
>> ---
>>   .../bindings/interrupt-controller/amlogic,meson-gpio-intc.txt    | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
>> index bde63f8f090e..fdea0488a98c 100644
>> --- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
>> @@ -19,6 +19,7 @@ Required properties:
>>       "amlogic,meson-sm1-gpio-intc" for SM1 SoCs (S905D3, S905X3, S905Y3)
>>       "amlogic,meson-a1-gpio-intc" for A1 SoCs (A113L)
>>       "amlogic,meson-s4-gpio-intc" for S4 SoCs (S802X2, S905Y4, S805X2G, S905W2)
>> +    "amlogic,meson-c3-gpio-intc" for C3 SoCs (C308L, C302X)
> 
> Where is the user?
> 
> If there is going to be resend/new version:
> A nit, subject: drop second/last, redundant "New binding for". The
> "dt-bindings" prefix is already stating that these are bindings.
> "Add Meson C3 SoC interrupt controller"

And the bindings was updated to yaml and merged for v6.5, please rebase on:
https://lore.kernel.org/all/e06e9f26-cf55-5596-c799-d698e9d7b409@gmail.com/

Neil

> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
