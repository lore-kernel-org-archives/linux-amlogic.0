Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511A4C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jan 2022 15:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2WShaKXwci4QJwic09KArfxAOEQFbQPCfLykXG7bRvQ=; b=h7GvEZTwRCimNH1djsXBrOhPfA
	YRRK3wJU0Ha9VBgOzAA7MNFwrK7ZJjiTVel0MWcaV0bQEvYAhswqBlrMCZiftNNSC+b0cf5lqTjtE
	kgB0dYtalhYB6XJS5M2CsTX3tXJCKObH8sC60azk+ULkIT91OmuSg+FNWxMxrosXg0ClT02rvgIP1
	jMgE4fPm8Oy1XvVYX7Y5GRl5Luk5UTBrMRITNPSu5UEY2OumheTVkN1STp+WPWwSWA9q18huO7O5J
	JPlIegQU99pfslxLkrWGZLCLwSKnv/bW2tfRgx1pSraqGETbfgDvpglfR71aZmG6nJwyJQ9j9ySIw
	8vVIeCvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD6Xo-00GDDi-8r; Thu, 27 Jan 2022 15:18:40 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD6XA-00GCiK-JC
 for linux-amlogic@lists.infradead.org; Thu, 27 Jan 2022 15:18:02 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 d138-20020a1c1d90000000b0034e043aaac7so3560279wmd.5
 for <linux-amlogic@lists.infradead.org>; Thu, 27 Jan 2022 07:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i/4aHvLx0xlbDSqE5Ac8Q/MRCnzzAZwCoPVM4qh+V4w=;
 b=FdlX2cAa7CE60w67jBg6HmtvKc522BNrx0l5/2tRysWxW0cNYpAb64ydNIshwNPuTd
 uxrL5qiIeadcTJYyAi8luphU/iB2wmS2vmTXY6O17gq7nFGs+w1rvKQXcNb/6uMUuscI
 /ulkX6vF3MLTbtT0fwQwEByn8zVwz1cBgwR1uVuMFya9EgKviwKkzkVCtmdtrcSQtlT/
 jd+KSPnvl8NhhDt/rFqWA1wYgTnbjIAFRbaGBYXaFEP5GP9A5R6e3gRcleChZxdHMhPL
 tIdICe8JGho+oSLYj7ziMHqWpnOWafyNPs2M0hGJ98mbMo3qToD3gVacyxJEmHH/n/Er
 yZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=i/4aHvLx0xlbDSqE5Ac8Q/MRCnzzAZwCoPVM4qh+V4w=;
 b=o98JnOuPSsiaMH1yAI/Lq0DSmT45e/+Nrr7vrRPrWG9LeSqQlkM5EBC33yJj/xXlcc
 n32VpqH6nOKjHnGnQIARYGH/KMGNvS4vuxIuZYHG8k3+g8+BoIOMjlKRKLvRmuCPZS5i
 +0c6tMb3dtMHwIfswvYrSKq/rnd5E3kQi/3QPqvlQrAAnq9+aj0u5in/fk0O99ADnb5q
 K86xztNk+TagaLN9Tpj/kfiF8KPgZDoZQ4Lz3fiMUqbEi20Ag0XX/3KHHlllH0JCR4cl
 llbH+t+2XQKBNobayDWFlfs7Jxq4gVQD27pGwS5RAks75sgJkN6kFlllmGvXTLSIaG0x
 LXKw==
X-Gm-Message-State: AOAM532hOed6T4RaM0QiRxwRu0scnB+htYsXQOwKAiBYu8SXNSzp7yqW
 +RihyLaVTDAM5eyrwZB4rj2JgQ==
X-Google-Smtp-Source: ABdhPJxCtaI6rDdSrWhgGXAU48ojSnr/s7UKOh8uTG3JXRhqdw26prPvM1Sx1LN+Lig1Hi2yFiTrKg==
X-Received: by 2002:a05:600c:4e90:: with SMTP id
 f16mr943648wmq.175.1643296678696; 
 Thu, 27 Jan 2022 07:17:58 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:bd6:ac2b:1e48:f2ff?
 ([2001:861:44c0:66c0:bd6:ac2b:1e48:f2ff])
 by smtp.gmail.com with ESMTPSA id d9sm2544985wrp.14.2022.01.27.07.17.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 07:17:58 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: meson-sm1-bananapi-m5: fix wrong GPIO domain
 for GPIOE_2
To: Dongjin Kim <tobetter@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220127151656.GA2419733@paju>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <6cd58652-f24e-3919-589f-d71eb0e8070f@baylibre.com>
Date: Thu, 27 Jan 2022 16:17:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220127151656.GA2419733@paju>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_071800_690313_4774B1F4 
X-CRM114-Status: GOOD (  16.15  )
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

On 27/01/2022 16:16, Dongjin Kim wrote:
> GPIOE_2 is in AO domain and "<&gpio GPIOE_2 ...>" changes the state of
> TF_PWR_EN of 'FC8731' on BPI-M5
> 
> Fixes: 976e920183e4 ("arm64: dts: meson-sm1: add Banana PI BPI-M5 board dts")
> 
> Signed-off-by: Dongjin Kim <tobetter@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> index 212c6aa5a3b8..5751c48620ed 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> @@ -123,7 +123,7 @@ vddio_c: regulator-vddio_c {
>  		regulator-min-microvolt = <1800000>;
>  		regulator-max-microvolt = <3300000>;
>  
> -		enable-gpio = <&gpio GPIOE_2 GPIO_ACTIVE_HIGH>;
> +		enable-gpio = <&gpio_ao GPIOE_2 GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
>  		regulator-always-on;
>  
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks !

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
