Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2453DC38142
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Feb 2023 17:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdpaKJsQc2pZrJRUFPZ9vkx6mVXx+mLLOZY5TvruGUM=; b=mmrsezcSYymrX1YE+soZk1SVDQ
	lJzDB8dFtJvO1x/XoL3vuu6t1fM200cZLGMo+zjsduyPk0PyxQ5UexZa2Ol2E8CjX0DUACo9GZcqf
	p4hIADPGcfu4I7VE/grsv7g5An4bJI+OtFVcQRRx11k4FH69NhSsqQBvcPvefWcwUoH+ZHHryBy6n
	tpxaC/2z/ar3sZ1XxdiGnj94v7NKZZZBTrizOCELoNZLQUsh+4HGuLAM6BZcxGScS1ruIJ7uGbnNA
	tl97WX49I8sDrbD+FQAQFoglZFM9uI46iFyMfaFD4gdK8Hi4Yi67kY8hT8EkUpQItSQZYYmhvvho6
	C/t8+XTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNGyt-00D1xM-Ee; Wed, 01 Feb 2023 17:33:11 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNGyj-00D1uY-LS
	for linux-amlogic@lists.infradead.org; Wed, 01 Feb 2023 17:33:03 +0000
Received: by mail-wm1-x330.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so1968459wma.1
        for <linux-amlogic@lists.infradead.org>; Wed, 01 Feb 2023 09:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yTNQ69NaFESesDbKqqHzZsJ1GdW9dr4YOTSclaVyT/c=;
        b=kv1tR49gFxGRDQXeZOsKND0zxUUWwjW9gdj3y9HET/ctPq4Vk6FIivSiQTvDu4UYV8
         Z7rJlXm6zqzBH8+DbDK3/YCmsJCLHvYu4JuFrPUxNtP5cNh+OzHStuBMWmLwl0NYP/GA
         a1A138Ibt4yu2i4Pzd6tA1eFc8GgQKYZKe/eAx96mQnravY/9rJhQLSZs+eXs6PrzwcT
         UfvYYlMxQ7vXXL4K7poqAtROdVO4cclBjH21tUbRJuGW8wRdTGT9BWoBEoO2QBncSpC3
         YJgGkT2H91Lm0RHWmAZvbQs+7zIhyquK0Xv3hWA76q59qL1HHfHjJcsoCYGY99mX20sP
         6/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yTNQ69NaFESesDbKqqHzZsJ1GdW9dr4YOTSclaVyT/c=;
        b=0pQShgDbk1douImsQqwP4UEgCuejAzsNhKf8xCsssk9aG3cKrHdAYjMd0rL6Ob9IMU
         0eon4v1rm8fC2BqxCB6Vyh17YNL8eyiIcHwBddNr4zuddhxL7WX1IPngDH7GP3gFQ+FN
         LU7kjCeBJHtjFxge8GBs9aw3TvCtcVfmcLHUCtZt39hbaZ1vUCs/Gy+/JMN3g46kURUz
         Nqt0gjQ4C09UOWJXaIPIp3CGAukljchNTlBxrLhKp1aFieOVMvEnPpiyXsY0iMuxAF8u
         84xODCXCd6KOsv1RNngVLIzuwLKjIBzxDn+rNhTVafkqnHYnTzpze3cSga4k3/kxtybm
         pH5g==
X-Gm-Message-State: AO0yUKXwWe8pS4Ay4ixbNeiQ3iht/lXt2wpI5kPKfX0B4cg+cUjicoD2
	L66FGqXV2qvEZSN4X/Kkc4VnKg==
X-Google-Smtp-Source: AK7set+uLoGEVOb+Dqvby0dr6kUPyElhg73To3RP0NFn9EcKfqx/HKG4tTB+yqyrt2Yet6n25v/HDg==
X-Received: by 2002:a05:600c:3547:b0:3dd:1c45:fe3a with SMTP id i7-20020a05600c354700b003dd1c45fe3amr8090592wmq.16.1675272777906;
        Wed, 01 Feb 2023 09:32:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bad9:621b:618e:38d6? ([2a01:e0a:982:cbb0:bad9:621b:618e:38d6])
        by smtp.gmail.com with ESMTPSA id r9-20020a05600c158900b003dc4ecfc4d7sm2239253wmf.29.2023.02.01.09.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 09:32:57 -0800 (PST)
Message-ID: <b5a29098-53b2-c940-0b1f-4dff40d97e44@linaro.org>
Date: Wed, 1 Feb 2023 18:32:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm(64): dts: meson: adjust order of some compatibles
To: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <e7b3fd1e-69eb-e66e-8abc-72b7c5fa975d@gmail.com>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <e7b3fd1e-69eb-e66e-8abc-72b7c5fa975d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_093301_743169_FF713219 
X-CRM114-Status: GOOD (  16.16  )
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

Hi Heiner,

On 01/02/2023 18:30, Heiner Kallweit wrote:
> During review of a new yaml binding, affecting these dts, it turned out
> that some compatibles aren't ordered as they should be. Order should be
> most specific to least specific.
> 
> Suggested-by: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   arch/arm/boot/dts/meson8b.dtsi              | 4 ++--
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 4 ++--
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 4 ++--
>   3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> index d5a3fe21e..5979209fe 100644
> --- a/arch/arm/boot/dts/meson8b.dtsi
> +++ b/arch/arm/boot/dts/meson8b.dtsi
> @@ -580,8 +580,8 @@ &ethmac {
>   };
>   
>   &gpio_intc {
> -	compatible = "amlogic,meson-gpio-intc",
> -		     "amlogic,meson8b-gpio-intc";
> +	compatible = "amlogic,meson8b-gpio-intc",
> +		     "amlogic,meson-gpio-intc";
>   	status = "okay";
>   };
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> index 923d2d8bb..12ef6e81c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> @@ -300,8 +300,8 @@ &ethmac {
>   };
>   
>   &gpio_intc {
> -	compatible = "amlogic,meson-gpio-intc",
> -		     "amlogic,meson-gxbb-gpio-intc";
> +	compatible = "amlogic,meson-gxbb-gpio-intc",
> +		     "amlogic,meson-gpio-intc";
>   	status = "okay";
>   };
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> index 04e9d0f1b..af912f698 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> @@ -312,8 +312,8 @@ &clkc_AO {
>   };
>   
>   &gpio_intc {
> -	compatible = "amlogic,meson-gpio-intc",
> -		     "amlogic,meson-gxl-gpio-intc";
> +	compatible = "amlogic,meson-gxl-gpio-intc",
> +		     "amlogic,meson-gpio-intc";
>   	status = "okay";
>   };
>   

Please send a new clean patchset with the associated bindings changes then this patch,
and split ARM and arm64 in 2 patches.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
