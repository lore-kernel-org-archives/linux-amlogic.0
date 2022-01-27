Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBEAC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jan 2022 13:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3dVByVObN0tk6aYmf+yaJWFDk98X5H45nRhl6R5x1h0=; b=E2CJ5wTthomv482zEXxPCQzjSK
	Jtr4jbZ2ctbWg9XIroD1hzX4qYgoqsTPs1LpxX4Yd4Z+BbWkcWfSe/mg69wEUpcNsrz5c+LodzVCx
	kb7hgIBh69K/EgfxVUGkkpZbvtuK6KfwCVrjEfKbb2urTtopakxbqU1xrY/KyJYMKH2PJ9MxQpsdQ
	/twWYReGaKRCvSesbHb7sIBueAWKh4VMQroz3zKLmhX6AOS2cfbyBITJhvPtdiWSmiMG6ujdKiYlb
	CnRBurFSckTkka6NUc4tB7K6DavFYQGeKcx8V69ipMB1B7g/g7DdcvolweL7Lq1CWBF3gZv8gFnD7
	3XrZPdHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD4O5-00Fnz0-M7; Thu, 27 Jan 2022 13:00:29 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD4Nr-00FntO-Ip
 for linux-amlogic@lists.infradead.org; Thu, 27 Jan 2022 13:00:16 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so5837958wms.3
 for <linux-amlogic@lists.infradead.org>; Thu, 27 Jan 2022 05:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ThKwZzEoBwxLlFAIZol3ZN4msDIng1irxNDgy0k+rvc=;
 b=ydj0/OueVnJjO8OAlorriaqhjLQotHZJEeqmyT0xqowTtn7ESjmnqrqzKnaGS+u9c1
 wudEpQIHBGi2/w3k4pV64TB3aHgAmXxTtheV50G9i2m7MBaDh3p6sGWSbN6BMwVsgGLi
 YNBFgPGd29YkQdq1uztpkLgWK8jV18DISDhOa1ENmFGhpzzDRHv/qSuAOCZ2uLn4mbb/
 PldoF15pe5iQLDtEZdA+BVU6u8Yd1Pf5wRTEpT2XYS07pXM6pnEQv/drX2fq7Iz2+wjf
 zEcqRQm3irQ61f9WeQCR9qo/QraPkxnODk5wrQTgNbBR5ZwjKMxlK308icVc30XXAw/U
 zmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ThKwZzEoBwxLlFAIZol3ZN4msDIng1irxNDgy0k+rvc=;
 b=2doAPyu5mJh65YUXMHXvgBx2Yd+TG0rqmFEK1HNdxbRC70TWoc+fS/MQQFtz2x4xXL
 V6DT51u0aMqqfNxgIEqBXYEZDAr65oLgzpt2/aH50dmZ24zqiU9GSiNIp960YuTeFyML
 wpmu9+NL7j5ICANq/f52kd4NRrW08j/C5iFQB0c/6PWegF4ALS6S8FjIrprJFQTSgOGD
 +Im7nw/qIA8uu7w7U89gXVeS21ST4w/Wi2sMr2WS2SWNjXf3NTQ09i0DZOfliocWPs6p
 HQD1+ERTDd2CdnmtyuutKDtxB/U6O7V3jveMPxWuxAfHBppal8Kglb6DbaktdbNFKwTf
 Qg6Q==
X-Gm-Message-State: AOAM532WzKFRPkA4UtggiCXA6OxrC2ukZpmNjPwlNQD7rXRdlX5Sw4+9
 uqkL/PUgl3N0qKR77kngo/mAHw==
X-Google-Smtp-Source: ABdhPJytoOWrwFTPO/vhPLQQlw+pOJNhOpY0awU0APR5Dw/RblEz48fpW5KA5FMrx6jC3i5IimycUQ==
X-Received: by 2002:a05:600c:3d94:: with SMTP id
 bi20mr11706693wmb.14.1643288412500; 
 Thu, 27 Jan 2022 05:00:12 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:bd6:ac2b:1e48:f2ff?
 ([2001:861:44c0:66c0:bd6:ac2b:1e48:f2ff])
 by smtp.gmail.com with ESMTPSA id c13sm2169441wrv.24.2022.01.27.05.00.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 05:00:12 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: meson-sm1: fix wrong GPIO domain for GPIOE_2
To: Dongjin Kim <tobetter@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <YfKPSvnFKOaLr74+@anyang>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <dcb67b4e-6a46-86a6-b21f-99263cc9ff05@baylibre.com>
Date: Thu, 27 Jan 2022 14:00:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YfKPSvnFKOaLr74+@anyang>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_050015_642304_A8D54CB6 
X-CRM114-Status: GOOD (  17.43  )
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

Hi,

On 27/01/2022 13:25, Dongjin Kim wrote:
> GPIOE_2 is in AO domain and "<&gpio GPIOE_2 ...>" changes the state of
> GPIOZ_14 connected to INTR of 'RTL8211F' on ODROID-HC and TF_PWR_EN of
> 'FC8731' on BPI-M5
> 
> Fixes: 1f80a5cf74a6 ("arm64: dts: meson-sm1-odroid: add missing enable gpio and supply for tf_io regulator")
> Fixes: 976e920183e4 ("arm64: dts: meson-sm1: add Banana PI BPI-M5 board dts")
> 
> Signed-off-by: Dongjin Kim <tobetter@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
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
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> index bf29afac645f..d4349b355e4a 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> @@ -52,7 +52,7 @@ tf_io: gpio-regulator-tf_io {
>  		regulator-max-microvolt = <3300000>;
>  		vin-supply = <&vcc_5v>;
>  
> -		enable-gpio = <&gpio GPIOE_2 GPIO_ACTIVE_HIGH>;
> +		enable-gpio = <&gpio_ao GPIOE_2 GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
>  		regulator-always-on;
>  
> 
Thanks for the fixes,
can you send 2 patches fixing each files instead ?

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
