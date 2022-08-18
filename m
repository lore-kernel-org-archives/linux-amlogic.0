Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D15C00140
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Aug 2022 08:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wtjm9L2tofHg5Gs7Mo6oPjfRU6NYPkmUreofO2goN9I=; b=iJoIjXXAbql+YN
	VcCVB583/xg9zJVdNiC7ZZ75MtCFhJ5RqsXWuWN0ydX6CH0M9I9BVL1oi5CaXf8AUxDoXa+KYFWJz
	UECn8CQbq4Y6aYCBSVji8mc9BmfHj93zNNkC1/E+B5W/qi9PsYHGi0TvDkdE7pbU9+6pkwf0NY0Mm
	96MaZSoBFtn1HE8AvdqPIgbsiFy0Bof02g7txvrNrMLy6Om91e4a1w1ZcD5Rh8bhYYeiAnx225qfL
	9si3OIC5FkVYPMlBzXLFkFmbPCkuxes06Pn6blgQa9iTuFrrYBcg79ChpDE9QG1CA9mXhhia0pJjX
	WjdjJhW5JyMTIMF5+72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOaqr-000nKO-Ph; Thu, 18 Aug 2022 08:26:05 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOaqV-000n25-3P
	for linux-amlogic@lists.infradead.org; Thu, 18 Aug 2022 08:25:44 +0000
Received: by mail-lf1-x12d.google.com with SMTP id u9so1172474lfg.11
        for <linux-amlogic@lists.infradead.org>; Thu, 18 Aug 2022 01:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=GeDInS0HAs8QReh6tItClEiurwlPP8TPLKQ+QrQqXko=;
        b=JwA58aF+G5s1e2+NfsXssQeCz5TX6jda5LlFFs4GBRNTXVhM85X6hsKI2LG+gACyXr
         IUhlBoV1ug8W5VVfakjrWebiN8Y0dJbS5kJpQ8MMucb6x1u4099mUWFRkjYGkci8rgq0
         TiVbtNtHRI3kvSoJcH7qTDQpaBANG0GRdV66JQ1MHkDa8MDQ8pDf9o8ibq2G2Gy5uyLR
         5klmjJeGeDqbvWDhpBPWgYd3/DqFVgnQYf9+DLT5wClpL7WZ8Emz0CJCBFm5uAec9ky0
         o9ZuE8SdWe+S0gcQ0Twr6DN0o+jxRdEaVXwjfeDeXEVr7XRzrPiSaArOzsG0Co0Btmf1
         sOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=GeDInS0HAs8QReh6tItClEiurwlPP8TPLKQ+QrQqXko=;
        b=ZJjJp2kow3VbPvg1r+AaPXMj4Tz4VKn6J9v7FASBacxdENEcM2TFkofqW8+h0Hq1lN
         vsOa5D247Bb2TK4fwY5R3iN+Dr67Ded1Y/GuUkBH0sVyKfCGcu+hYpD7wp/S69uScf0t
         FwzyL/19dqoambB4SQchNV4wHR41/Aq8vtLvpp7ICdrDZq77/hIFCjIpWxVumkOg/61q
         z8vOKB5xNhiSIVpnFnNTmQfSnUdgiCYjxzCN70sKFWlwcFbWl+sVf9YBanxq9lbkHiBj
         Fp1XMfLveYFPD5RJTPu2GRDjAyeo8e7BrFxaX9UUKu0FMiLfkhqUqzSNoQ7Tu3JTjb/Z
         PvVg==
X-Gm-Message-State: ACgBeo0xuL0W0vn7z5Hg9dKVxU1z8f26YwCjbbu8r34pn7XufJWuOtnk
	KcY40phEs+mNV+eRr+RHAlvu7w==
X-Google-Smtp-Source: AA6agR54egXJZqZpdKTmvYFQXJaybgU+WirjMCScZ8ypakyTZr0EbSGyWikC0cyZQBbjB1L4Te8/ow==
X-Received: by 2002:a05:6512:228a:b0:48a:fa84:e298 with SMTP id f10-20020a056512228a00b0048afa84e298mr584111lfu.183.1660811139643;
        Thu, 18 Aug 2022 01:25:39 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:53ab:2635:d4f2:d6d5? (d15l54z9nf469l8226z-4.rev.dnainternet.fi. [2001:14bb:ae:539c:53ab:2635:d4f2:d6d5])
        by smtp.gmail.com with ESMTPSA id f26-20020ac251ba000000b0048a79e3dd6csm136950lfk.26.2022.08.18.01.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 01:25:39 -0700 (PDT)
Message-ID: <0a10f55c-1e91-de8d-74c1-e2778841b7fc@linaro.org>
Date: Thu, 18 Aug 2022 11:25:37 +0300
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220817113423.2088581-3-jiucheng.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_012543_190263_D961AA4D 
X-CRM114-Status: UNSURE (   9.07  )
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

On 17/08/2022 14:34, Jiucheng Xu wrote:
> Add binding documentation for the Amlogic G12 series DDR
> performance monitor unit.
> 
> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>

(...)

> +
> +  interrupts:
> +    items:
> +      - description: The IRQ of the inside timer timeout.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    pmu {
> +        #address-cells=<2>;
> +        #size-cells=<2>;
> +
> +        pmu@ff638000 {
> +

No need for blank line.

> +            compatible = "amlogic,g12a-ddr-pmu";
> +            reg = <0x0 0xff638000 0x0 0x100>,
> +                  <0x0 0xff638c00 0x0 0x100>;
> +            interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
> +        };
> +    };

With above fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
