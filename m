Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9046CC05027
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Feb 2023 08:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dtJ5rVmfWx4uPa9h/u8Mrhp06aCxchrKW66Tyj0/Fn8=; b=qa/JAOhzGgld3y
	c2d/oVopsznOnwoHAlIlJaxOkvkshZbufUmOnDq7SOgEnwJRsT2cSXA890l5sSEnVWxrLDrZSPbhY
	HrnINvzICro4PWCuNpA87b9pdsRcQyS+bB9HdBQsqG4xvi1aZ4u9OjcETY7GbQX/Q7DuF5AZP13oF
	lq9AcIcgkFGlGz4dhJg3Hz3qbx3Lp9Ld7RDkRgAslAdTjq5RsLsjfy87FWh4s/JPeyKedquvPoFfQ
	m0+eWuaPap8sg3w4VqXh0Sw/RWH7hL/fDrzatImXtavoTZ8y4wCiSU3+/4dxXrY00+oS8SNQla/7I
	9K/ugu9qSq7N9kf6X1AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSwPM-00DLvn-IR; Fri, 17 Feb 2023 08:47:56 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSwPK-00DLpb-00
	for linux-amlogic@lists.infradead.org; Fri, 17 Feb 2023 08:47:55 +0000
Received: by mail-ed1-x535.google.com with SMTP id er25so1324555edb.6
        for <linux-amlogic@lists.infradead.org>; Fri, 17 Feb 2023 00:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6mCPUncoNNGQDkBH1K4Qwr2txnBpLQ2xqpC1PN44nIo=;
        b=zMOgIsHj6qxMkglPlIGwHPtY65joY5FCUCHW41i1STnDb9VvgcgzUZZh3zCuj7WAtZ
         hCP7+xRs0HlbLdfpWze78Iq4IdVNmlM3KLY6QC66gFDQZ/Fx+N57yeDOTHIQJ4uK3q7l
         R1yG2LZBj0iqb6wVnsQF1yusZT/z8wy1Z2s2+Fb7mnDdSo5NiCn+kAHS6ZHq6BCBFzds
         3aHQAavQHhPeB2EeMjpIh3J/J4dY4ASe3ZqaaljUn5HDCSqtDcxSMHD9L37ooqzBsBE3
         AKFreSM6PdOXsILNgz/BjMR9maQiQOVcoN2SjBddVvzXAHnj2IiRxb9g4aU7TOi2UapT
         JmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6mCPUncoNNGQDkBH1K4Qwr2txnBpLQ2xqpC1PN44nIo=;
        b=zglYNkKdnbQF3rs55yjlK2DvZ7/8zSbHhVqrd4ijQdTFue9JZyYMmW9arg/kM7b1BV
         +Ww3GYFyvwRGlZShj5VAoFS0acULSkD9kbmWLlTld21PcUqajtU9fDwZ/4eYuck5GVp2
         M+5/7cDR/7CU4ULCXnHTsbeQk8fD7dlT+98i5ygMtA9Gd6GkOgLs11ayjGNW1YSpHIkR
         jAFVjqTeIOPpzay573Z6UdOZelmaPU6xmFIRNzkGU4GX7+AGBmVXN8i1+jPgcu/0bR8n
         tx/xgXx5gAuL4UCvOEZlsN+ZjGCjqEZHL/5llGZGJvcXCB4jc3kvNheEp+ORTA8VBhxI
         F5Pw==
X-Gm-Message-State: AO0yUKX3mQC/48g6yL3YI927m7e7SXaz2IDigwYudC0sRF1LT+IoDB+f
	i9zgcEAIvX0qxLgmyzT6W7T4tg==
X-Google-Smtp-Source: AK7set+bc046PiYwSDnVyB86S6c9jja8hnHbQX0stMjnEgo8oKt4A8NuJK9HWepfuMYEn0SaZNEmQw==
X-Received: by 2002:a05:6402:445:b0:4ac:c720:9255 with SMTP id p5-20020a056402044500b004acc7209255mr580406edw.34.1676623673490;
        Fri, 17 Feb 2023 00:47:53 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f29-20020a50a6dd000000b004ad6e3e4a26sm1532945edc.84.2023.02.17.00.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 00:47:53 -0800 (PST)
Message-ID: <86945f01-351b-9843-0ba8-08377f12dd4d@linaro.org>
Date: Fri, 17 Feb 2023 09:47:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] dt-bindings: mmc: meson-gx: fix interrupt binding
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <c1437eb6-0c01-809f-422b-cb1109489355@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c1437eb6-0c01-809f-422b-cb1109489355@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_004754_064299_027668C8 
X-CRM114-Status: UNSURE (   7.70  )
X-CRM114-Notice: Please train this message.
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

On 16/02/2023 20:50, Heiner Kallweit wrote:
> Reflect in the binding that the cd interrupt is optional,
> and add a description of the interrupts.
> 
> Fixes: 09b31a610328 ("dt-bindings: mmc: meson-gx: support specifying cd interrupt")
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
