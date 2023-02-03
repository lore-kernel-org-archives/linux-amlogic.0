Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1795C636CC
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Feb 2023 08:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELFgUxIKN//kgohAICAf/fQ02UBtNYAYVcThheqKzrM=; b=w5rCdbY5uMpjfRDxhwlFvflspN
	FHdknJZC8j5vQnMFVkleSbk3HaWn4dmaqiM4YG9eqFkyBZb7S4gBvXtSOuiUBGGZFdxiZLncDwH6U
	U57CjMWpJDG2o1uWJq+FrvvWJksXIGQlykBNdEC6pMmq8rxzE9KplMt72peJwWuJhEstZFuyzqjoy
	aXicmvx0QdAHGAzv91ouhcSusqUGZ06w8q7xqmOKHHa3wPBjrWAIr8L9sCy/oeb8j9Sn0f/X8wq1d
	7FmeA9no0x/P/z9OcsU8mDcr18ezRZR5dMQIShGfLe11UZCwfJ6MMAlQV/6LizH88i54WbXdMQfGr
	DUbu27WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNr54-000wKA-JJ; Fri, 03 Feb 2023 08:05:58 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNr4x-000wER-4h
	for linux-amlogic@lists.infradead.org; Fri, 03 Feb 2023 08:05:52 +0000
Received: by mail-wm1-x32d.google.com with SMTP id l37-20020a05600c1d2500b003dfe46a9801so1732147wms.0
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Feb 2023 00:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TBb+YU7SO9tXMHbbbe3lRQtLl3hjjENAuVRnnvbAouQ=;
        b=QJE6CvGnrJbrhcbIULlyIgh7EGrD/BwwrwxSTGVar8/OGB3ZD664u+4mW1oeAiTvxL
         lVL2UzYpXKst2uCB87NqMeu42JuiEUyowVPupvbw1E3u7xoVew8l5r929Nyv1yn2I45F
         6xNvQLFq1Mt4/aVm0Rqk0xkqoyWVfSx5ZSbX0gS/mCCODuPDnAvCJvbaZv7KLQ9LiMyH
         0aQ4RZVrusZIOYaylhzODbwfpqZv309y+tOscnTGB+kO5qGnsB+zZb/A0S4+JNYWf9SR
         +So0qZD3DqezJR9T/jwRHnmbNKFKLAzWZPdmdLlKCwiN0S3sPbElJg1H7S3/Q851ywlB
         ffqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TBb+YU7SO9tXMHbbbe3lRQtLl3hjjENAuVRnnvbAouQ=;
        b=wJARR3KqXxNjHmpMcLBjXaXJQErzx5pznkDHm/OWDrNP1IFTbrIVjB9fz0IsPc6rqM
         MtOX4vu2FHJ5Q3pCvOSa0X9V/FwUy0RaEkYERZQJKdkutpeKG3Sl8iQRWineBdR+45c0
         Q8ttCE+2cPGY22ZIqRCn8H8NUSanvp7tL+3fuKRopYqdBNRE2QpZmHiP2y9PFxHw6PaX
         EyZTYkwCD4aXebATRvz9jUJrR6PAkWBvw3JiDOHd/f5wNLLRbTt8n9sLMqL6NxABjo1T
         NtvcTDn9rGsEl2ppsSZOFTerKcRj8HwVnjuycdkXlZQwmdOzI61wiIlf8CQY66a3Zt2F
         Wl6w==
X-Gm-Message-State: AO0yUKWYPGPCuIJhtLFNb1DQjHDQLZbcaPOQC5RPz0JKS0aZKX2v+jJh
	7YKRbGHleQVYb6yLjQtvH/WSmHa7aB/3Z/InWZI=
X-Google-Smtp-Source: AK7set9Qeevei0rAJimV5DKfjxA3Glzr4ERMiDyhAqNUYlKx3bpWEPIWMw274SSUFsMq6LXct0E8iQ==
X-Received: by 2002:a05:600c:6018:b0:3dc:3f51:c697 with SMTP id az24-20020a05600c601800b003dc3f51c697mr3796816wmb.18.1675411547943;
        Fri, 03 Feb 2023 00:05:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:7407:d8b9:ec7a:537? ([2a01:e0a:982:cbb0:7407:d8b9:ec7a:537])
        by smtp.gmail.com with ESMTPSA id m5-20020a056000008500b002bf95500254sm1368211wrx.64.2023.02.03.00.05.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 00:05:46 -0800 (PST)
Message-ID: <7bf5f842-3471-b07b-704c-cc03b87f2ee3@linaro.org>
Date: Fri, 3 Feb 2023 09:05:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/4] arm64: dts: meson: adjust order of some compatibles
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-pwm@vger.kernel.org
References: <8df4ceec-663c-dc68-d775-5caeb02c0cca@gmail.com>
 <1ce888df-6096-73de-a98a-354d086428d4@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <1ce888df-6096-73de-a98a-354d086428d4@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_000551_215865_656F3AA7 
X-CRM114-Status: GOOD (  13.74  )
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

On 01/02/2023 20:59, Heiner Kallweit wrote:
> During review of a new yaml binding, affecting these dts, it turned out
> that some compatibles aren't ordered as they should be. Order should be
> most specific to least specific.
> 
> Suggested-by: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 4 ++--
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
