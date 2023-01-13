Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DFCC54EBE
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Jan 2023 08:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cb5GgCoSg+xqjwDu8H7QgBbcfURdbSkDT3l7LoYfVuc=; b=lU1Vrfq8fyTxWYv0SQG9IQOafY
	bSAhZ5je5cuWW2TotvZs4aHvjFGL41iKI8L9AgpFOlY2uEc33UxO8t4FfQjbwSIH1DU3N2s9SB0rr
	wVj+N2EwOrYfvfffwwysm1llPqGXm5K+3ZHLtdTLkIjhvNkn9PD08Vp6L3ZfOluNC+ho+N/p4mB0z
	awDGBYVaWUDnPQmwYDEhOGxDZBIoQnUEpXNhJObxZjUjHltfgtCvdY08+4/UpKPqAOJMqsVCJu9pZ
	3SNu0Bp5K/dxpXKmqCDckaD4UbpqXruauL9/norDnHNqyJ9sCqjywdi8fNSOjGh+cBwlz6+it+iyG
	iaqVkdYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGEzA-0014RO-2Q; Fri, 13 Jan 2023 08:00:24 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGEyZ-00144e-7t
	for linux-amlogic@lists.infradead.org; Fri, 13 Jan 2023 07:59:48 +0000
Received: by mail-wr1-x429.google.com with SMTP id e3so11051657wru.13
        for <linux-amlogic@lists.infradead.org>; Thu, 12 Jan 2023 23:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wg/RiEz7jyDLq2vZkubHTZleBkEHAFy0WqgTYw1iqQg=;
        b=sX9gyI0ffu0yoZBJ+c4+eJ3nVWf3QgZEydN4s3Y9ga1jqhrTmILffQ7EFNZGcUbToc
         VxFYqXt4WSgPdmyISgj0J1ocA1d0do8VYoOm1/slzHK8Vc2HZX1E/nXNWHAbscBuPUjr
         PfVnfKU6ALCRkbCnWbLDJCk9z0jESrpFAayh3/VocZjHEIbL7Npi3XgBD+lrKXADaHjq
         M3fIY0xH+GblldD1qtllr/eqdw4oB1OgGYQwkTeWqsoyl5slwnOT9deJTLY9xzo6Ovt3
         XE1xQZtQtyFn1KFnooo+9rxbkJJkktKhDRvA7K9YfXXXwwFBNc+797jcoMY+H62h3AoI
         dcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wg/RiEz7jyDLq2vZkubHTZleBkEHAFy0WqgTYw1iqQg=;
        b=Kqv9zl0jgBFpgZuSnoe4mhXFTd0eynphhErqDPLPsMyqmtnnVRpMwOSa/ZlLxpAEhl
         mV2vuv/4njNnLH1DTmtFm6iMFNk+RCYsllg2/wCETmrT0NMJpZlNZg2OoGrLjauFP0Kv
         06iWcg8XpIdd9X2T5ePM2h9bIjWZYvD6v1RDRtfgiEvOaUUSoNMBWWpi066Wl5wiVjjd
         se1ZV0BVN+yTTLzA6R24+Jununh517T4VkaBM02i720XgQs/HMVad7q7wDRb9iWnNg/B
         0bse5MW63aSxLGQb9KzIkDiJFGDAghFfYd+fTQU1xe950dYMZVLgVh2PYEhQotVjxIhQ
         NjDQ==
X-Gm-Message-State: AFqh2kpu8r6bcqVpjfixRm3RssOV7eGKrdqw+uLmF7AFvbUEeZ1x88Xe
	d8xEZl17YCDoYCw85277ForB8g==
X-Google-Smtp-Source: AMrXdXsgg3InzVtsIcgmU+mCO95D1hRgQWLISXh65fcKTxkt1YimJlUAMQc3VWm6wmL4mYUIoPGtkw==
X-Received: by 2002:adf:da43:0:b0:250:779a:7391 with SMTP id r3-20020adfda43000000b00250779a7391mr47177236wrl.47.1673596785924;
        Thu, 12 Jan 2023 23:59:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8660:aed9:5ce2:6bbb? ([2a01:e0a:982:cbb0:8660:aed9:5ce2:6bbb])
        by smtp.gmail.com with ESMTPSA id q16-20020adff950000000b002bcaa47bf78sm8956951wrr.26.2023.01.12.23.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 23:59:45 -0800 (PST)
Message-ID: <fbeb53ec-78cb-faf1-85ef-1c6f128c489e@linaro.org>
Date: Fri, 13 Jan 2023 08:59:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 6/6] arm64: dts: meson-gx: Fix the SCPI DVFS node name
 and unit address
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20230111211350.1461860-1-martin.blumenstingl@googlemail.com>
 <20230111211350.1461860-7-martin.blumenstingl@googlemail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230111211350.1461860-7-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_235947_338741_6668E3AA 
X-CRM114-Status: GOOD (  15.79  )
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

On 11/01/2023 22:13, Martin Blumenstingl wrote:
> Node names should be generic and use hyphens instead of underscores to
> not cause warnings. Also nodes without a reg property should not have a
> unit-address. Change the scpi_dvfs node to use clock-controller as node
> name without a unit address (since it does not have a reg property).
> 
> Fixes: 70db166a2baa ("ARM64: dts: meson-gxbb: Add SCPI with cpufreq & sensors Nodes")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> changes from v1 -> v2:
> - new patch
> 
>   arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> index f8b115cd6775..a79a35e84281 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -250,7 +250,7 @@ scpi {
>   		scpi_clocks: clocks {
>   			compatible = "arm,scpi-clocks";
>   
> -			scpi_dvfs: scpi_clocks@0 {
> +			scpi_dvfs: clock-controller {
>   				compatible = "arm,scpi-dvfs-clocks";
>   				#clock-cells = <1>;
>   				clock-indices = <0>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
