Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E325FC61D92
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Nov 2023 08:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQo8ltsQg+r7Tek7aOGDqGl4bssEYURPoWzDHAUSiWk=; b=4cL1DUK2c6nKFx
	FUR2HwTlZ9osly6SpY0qKXE5lx02YGtpMMwM7TMr7Dk5kK1GuktPtwc9z/fwZ6VKBK6AQ8PlXHvyd
	OvNQVT7HFdeEiW0+D2G0kuoBd8KEHl9yg3Lo1ahf9SMVunncGlBTdSiK9j8St5yJwl2dDbMr3AsRl
	onHJ5sllhURfgrx+US18voPEAsXDFN0aQeg0HX1F/FFTCUWvM9pXzSxzM2gQFvxWRFK+OZcZxfA6E
	Fhn2ueHkJmgiyabTojCMscIJ+jfPx2Rv9OF5VRXgCt3Ye8RGAri5BBg2MzpxdWoUS+NBqwxhR12Z1
	SZ4nOJsrXbveff4t1bzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5im0-0015I4-33;
	Wed, 22 Nov 2023 08:39:52 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5ilx-0015EK-3A
	for linux-amlogic@lists.infradead.org;
	Wed, 22 Nov 2023 08:39:51 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-53d8320f0easo9380918a12.3
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Nov 2023 00:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700642381; x=1701247181; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aS+XXhwuzroVSKVuFdZ7dXAQSJNNm0caeZbcLLCsivU=;
        b=HA2jCVZ3qPx5KwE1id0BhebbRa2tlZlZZ91D5i8LpAQXivRsPawlCyuO/Nkb4VYdSs
         BCKIGQ9+VKdFTmVjCstqiGlJTWt67zho7FcycBxlb3eYmc8388v5Q6qwhr6/VyVKZdPG
         FJB6655MEMWTguuR4McUce/xY5hOQhizbODq7M/AT/TW/p4q4MVwc/0KiJRzi/h8ZkN9
         DexX1TmiGHs3Vrzc89cjVz+XV8EeM68BFuKwO2bZpsfnzJu8LBYFXZZhHeXVWiUte/bk
         a8tNizvRRcJr5rNQjXUpAffmVZYYClR5xkckgrv5xVvHRW9bsgggw0ZmgjntrFc2d1IW
         5/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700642381; x=1701247181;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aS+XXhwuzroVSKVuFdZ7dXAQSJNNm0caeZbcLLCsivU=;
        b=V7stdkv4YdxLgvpx7UyYGFlF3fRU8XvvYhKlh0ADYpxVaQbprzdHCRgd/cYZd7QaK9
         ejWY57Tm8aGHLILHXCduf/Uh1uyxxtFxDYcrlMvQzqqjxo3CoYmuPnXhwZyZ6x6r7pGJ
         4nK1ePYvzaQdM/WCiRCztbMbbIp2gH88TbfqWyEsV7mosqXVIuLWKHyKJo/cOb4a53dH
         GuFn3OnuIK9N3V4WeSOJ0nwiVnapvY8vBQDiC5wvz/BiV64Q7aI1F43/WFL5Q/Z3z8FT
         Fl/WhU/EKjN8gHD3Bx01JXBdthc9ysMxFwsUrolszT9q1gn5U/6kSNRcTAdwjwVgrGtv
         6PHg==
X-Gm-Message-State: AOJu0YxyZZ1YUuDj8NcBa4TZb/JE/7JnBxtlmn34KNmLfoqzcSE4ZTwb
	rvM0DOvuuH3vXNgLmQ3HI4UMWA==
X-Google-Smtp-Source: AGHT+IF2CSCjDTEXm1SkcZqwuxmoDKpLN1XjBfvcVi12yyNS4bJa/vqnjuwCRcnZsj7/ysSkGHEnvA==
X-Received: by 2002:a17:906:7105:b0:9c6:8190:359f with SMTP id x5-20020a170906710500b009c68190359fmr935327ejj.33.1700642381688;
        Wed, 22 Nov 2023 00:39:41 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.100])
        by smtp.gmail.com with ESMTPSA id a1-20020a170906190100b009a19701e7b5sm6321163eje.96.2023.11.22.00.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 00:39:41 -0800 (PST)
Message-ID: <f04d8ad1-4411-4334-8d22-0aa757bf227c@linaro.org>
Date: Wed, 22 Nov 2023 09:39:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm: dts: amlogic: migrate pwms to new meson8 v2
 binding
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-pwm@vger.kernel.org, JunYi Zhao <junyi.zhao@amlogic.com>
References: <20231117125919.1696980-1-jbrunet@baylibre.com>
 <20231117125919.1696980-6-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231117125919.1696980-6-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_003950_020243_8C6F3843 
X-CRM114-Status: GOOD (  11.73  )
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

On 17/11/2023 13:59, Jerome Brunet wrote:
> Update Amlogic based SoC PWMs to meson8-pwm-v2 compatible

Why? Your commit msg must explain this. You break users of this DTS on
older kernels and also this makes it impossible to apply via different
branches in the same cycle. All this needs explanation and proper
justification. Your message tells here nothing, because "what" is quite
obvious.

> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  arch/arm/boot/dts/amlogic/meson.dtsi           |  4 ++--
>  arch/arm/boot/dts/amlogic/meson8.dtsi          | 16 +++++++++++++---
>  arch/arm/boot/dts/amlogic/meson8b-ec100.dts    |  2 --
>  arch/arm/boot/dts/amlogic/meson8b-mxq.dts      |  2 --
>  arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts |  2 --
>  arch/arm/boot/dts/amlogic/meson8b.dtsi         | 16 +++++++++++++---
>  6 files changed, 28 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/amlogic/meson.dtsi b/arch/arm/boot/dts/amlogic/meson.dtsi
> index 8e3860d5d916..80cc004ad5fe 100644
> --- a/arch/arm/boot/dts/amlogic/meson.dtsi
> +++ b/arch/arm/boot/dts/amlogic/meson.dtsi
> @@ -83,14 +83,14 @@ i2c_A: i2c@8500 {
>  			};
>  
>  			pwm_ab: pwm@8550 {
> -				compatible = "amlogic,meson-pwm";
> +				compatible = "amlogic,meson8-pwm-v2";

That's breaking users of this DTS (old kernel, out of tree, other
projects) for no real reasons without explanation.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
