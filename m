Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9A2C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Mar 2023 15:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayzR0EnRn25mHVY1+PWMT6yXPLuFYA51MLKveu0ZCnI=; b=WpJ6BuoidrRTdKlV+oK5BBB/wA
	4rYe4kklXwsb6usQWLp5NFmfnm7Z+Zd27gwU1RQZqDaBakHanR6LPzKHiIOEjAPdoYbAsRrcgszNd
	3NXilW3WCJq2UjFnlXs7fXCQS09ePu+v1zLG6CkGIUgF3C7opwdo+DKWIGnAegAJMGRTyisK0Mv6T
	6zhy1ApJiXEhY87vK7aTIABDU/2WAFPfafIQlxOVM4Oo0lNavMJAWerqyU58qOiBZ4sm5xD75FmCe
	i1CBylNF01KmUNjUp8YH+Mq1ASc2prigFk5dk0t/iibMa0SRnYjhydjfxgVxYYWeCa5SnMNlY4yC5
	ADckQ+0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc6lH-00AegL-0U;
	Tue, 14 Mar 2023 15:40:27 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc6lE-00Aeei-0H
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Mar 2023 15:40:25 +0000
Received: by mail-wr1-x42e.google.com with SMTP id j2so14743913wrh.9
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Mar 2023 08:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678808421;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=txkXz/I3r3Tjb5s8k1jSMemJtidVgLhZ7+02zqLYGf4=;
        b=sD6q8uCo8xBD0SMMmwkuzWrvH9QcadfmFi4Z+WiGG7JnU3M7+5m5oo1OLN4tkuNsrk
         rUJ6NQPlzNUtqwoCi31FrojSxjnNDfgnvzH3+a/4CzEKlXKIeA7PrzyMv6HymuGSSgvz
         wohHyqnxU6dYWpIgbNHHGD2C94TmbVvu5PBKRQbrwj4UqgumRQvG+AnArg2MXqlYtrjL
         Al/uLzsabUckDbPAX+VH06mju/nbsLsJf7CwOiCN6WRBKNpQEsZQDMzrKDHGxtDvYh34
         ff477xAWAkCRmkVGI7JUbZiLEI22/ho/M3v7jfYIlIs5U6CtMuELrINjyOaQWe2/UvQ4
         L0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678808421;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=txkXz/I3r3Tjb5s8k1jSMemJtidVgLhZ7+02zqLYGf4=;
        b=jUF/Lm36ARbbCblF7WajhGv4bLQ6tZhAvGlX+OYu8zjYYlR4RuCpqe36KJh55BSPAD
         KlDdiccPna01NubWtf67u5gM4RTNFtR0JGhjxdHyZaYTLMBMv3J5NGP8cwu07A0z5t2L
         yCee61Zj/yYiUMdHsey2SDUSZlNp1G637w96Ctbo2gRc20sjP2faGTHjfrBs+VB/ewhP
         z96Y1Ayy6YAm4Q+M7dS2wRn4xDL9RGV50+39fm2RksViVBFiDivCko20nSCQGcYEs3Zl
         rO48AyR3coK3n3d8qiDorA+JDFoi3klziFuqJqfix9ydcey/eyXtNiNM6jJ1JMBftzej
         BXCw==
X-Gm-Message-State: AO0yUKUIi1w4cZJisL596ONJdFdyCP3SSC+56fMBroRU7P+L/5My2bqG
	HOpIVGKVT7RQnmFGy20CKF7I7g==
X-Google-Smtp-Source: AK7set/rB1r35ueF97ISYBhFnUPTdvBSKd9cI6GOQPNUprLBXMlhEuGTztdytq7ar4n0jR5So2Z6jQ==
X-Received: by 2002:adf:fb51:0:b0:2ce:7219:42b8 with SMTP id c17-20020adffb51000000b002ce721942b8mr17688166wrs.32.1678808421181;
        Tue, 14 Mar 2023 08:40:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:11c3:d4e5:ef75:8eb9? ([2a01:e0a:982:cbb0:11c3:d4e5:ef75:8eb9])
        by smtp.gmail.com with ESMTPSA id g10-20020a5d698a000000b002c71a32394dsm2291933wru.64.2023.03.14.08.40.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 08:40:20 -0700 (PDT)
Message-ID: <6b7ae52c-d84d-8d08-139c-5c67ec363e85@linaro.org>
Date: Tue, 14 Mar 2023 16:40:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v10 3/5] dt-bindings: clock: meson: add A1 PLL and
 Peripherals clkcs bindings
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: jbrunet@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, jian.hu@amlogic.com,
 kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230313201259.19998-1-ddrokosov@sberdevices.ru>
 <20230313201259.19998-4-ddrokosov@sberdevices.ru>
 <ffebef1d-8447-181b-1890-3e638d399c62@linaro.org>
 <20230314114825.yiv4vcszr6b7m45w@CAB-WSD-L081021>
 <2d9297e9-dab7-9615-3859-79b3b2980d9a@linaro.org>
 <20230314150107.mwcglcu2jv4ixy3r@CAB-WSD-L081021>
 <9d176288-cd7c-7107-e180-761e372a2b6e@linaro.org>
 <c8fecf94-2581-6cc9-955c-324efdc7c70a@linaro.org>
 <21add21d-4afe-7840-6c49-3786f82761d9@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <21add21d-4afe-7840-6c49-3786f82761d9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_084024_129010_A553BD07 
X-CRM114-Status: GOOD (  10.86  )
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

On 14/03/2023 16:37, Krzysztof Kozlowski wrote:
> On 14/03/2023 16:33, neil.armstrong@linaro.org wrote:
>>> There are many ways - depend on your driver. For example like this:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/samsung/clk-exynos5420.c#n975
>>>
>>> The first argument is the clock ID (or ignore).
>>>
>>> BTW, quite likely the problem is generic to all Meson clock drivers.
>>
>> This issue about "public" non-continuous defined was already discussed at https://lore.kernel.org/all/c088e01c-0714-82be-8347-6140daf56640@linaro.org/
>>
>> I don't see what's different with this one.
> 
> So you are aware that all undocumented clock IDs are still allowed to
> use in DTS and they are ABI? Changing them will be an ABI break.

Yes of course.

Neil

> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
