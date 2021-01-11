Return-Path: <SRS0=5e44=GO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B88FFC433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Jan 2021 14:03:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74ACE223E8
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Jan 2021 14:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74ACE223E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w8vYGdej5grPjDR56nlUi/IQoYHkXYnPRM/kqBYqScA=; b=qn/6v5zWbq/b1QRKcuOeF6H3t
	TMLHskyZ3Owv+YJKx24intAu54ywjw+sigp+YviikcSu4K9N4sJxi4ARVl9H4mL+GfKKcE1km469z
	nfJVEsX2NiIbAzFirJnYMLdA03Qpij+mgqDLsunl3+f2x8ZxJMaHqvOUy/M6aYWb0tuyUxSC1bTJh
	eenS9Yx/XIJZDG29HRLntLJHY2R/3MaeVRxrm3QOeM2Qn4oDjdZr2w7oCx6z0LUelr26EfVyFPM+x
	yojoRQIgF0zjBOWXkFi4BOOfm57iUhudIgYzf56Tp1EJE8eFxYvdvKtSNlvt4SBjrSWKkjv4dTYRa
	vzWqtRBfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyxmo-0006gr-HJ; Mon, 11 Jan 2021 14:03:10 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyxmi-0006eK-An
 for linux-amlogic@lists.infradead.org; Mon, 11 Jan 2021 14:03:06 +0000
Received: by mail-wm1-x336.google.com with SMTP id v14so13919029wml.1
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Jan 2021 06:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uUfUDdGFg+KzOzGTBmGUqmDy9inEby6Kce6phzRd4pU=;
 b=CnsoZzKpBW6PcNyRpvPAI4KDQCUaXXvBiXNE3cebMx6/NxWJAFclJ98GILA0Ny7G4d
 mdd5DK54R0tiPpfI0tIkxV+ua1NmZoJt96BrBOG5dJa9XtdVdoQezTc8s44B9/WfUWiN
 i1iTRIqjRHpzFnR3ENhv+iPqEKei1NmqXMJ415snGwD9iwJuVoJwOPDF98url45CDlPV
 jtGSMRIxy4683LmiGtDzjWU3JJlMpXLip7D4C+8U8GwtgYKMUaoZJth4zzQLnbn8ZZwU
 cBRxhLmkywEiOZ0IzFigKpNvr7eOgcUlMCnW0XGqrlO9Ft8tOuIupCJVK5mGjisBjND7
 IhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=uUfUDdGFg+KzOzGTBmGUqmDy9inEby6Kce6phzRd4pU=;
 b=a9cJe2IRlOd4riPUQywHvl6WLuegJXN7QUKfFncZcjtnuzBDo6D7yf7PAWe0Velgdv
 fnx6FRV4gyqcqf4L5A8D2tEyR0g2l8wI1romZAhsAZHCpsEjYmTqe2ei8m6Tg0zwPkFY
 843jjjyOQJYgPgNSc4iGgpWSwZT8S3n7nQ0UFfNpniDvtOaIhtPArDKd+3Do+Emkg67g
 TRhg+bqht3PD4RYIzi16Y48CKEfXV65sJXHt9jjvuixWgfowPOtUqjnpv9H/Jnug9lxn
 Sr8v0NDVt/a/V4ljvN1om+wW5RDJ5CQKz0TAfdGZkoYltQzWSZP3yqV6lfxn2Mtnx1Gd
 rLng==
X-Gm-Message-State: AOAM530DpWMjLRwUWJ/ic8WMwjbAaWKSvGLKEioY/2W57TL1P2upJI0w
 lfTtbeVQUffPSFxXE6jMC5PI5g==
X-Google-Smtp-Source: ABdhPJyTYXJbpxvLDLeIqnQaRiT8bonr+ja91r5Ulm5wdpLzAVlCLWF6iWq3lhMbHidIte1FlyYt8w==
X-Received: by 2002:a1c:a912:: with SMTP id s18mr14400927wme.26.1610373782808; 
 Mon, 11 Jan 2021 06:03:02 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:7474:6cdc:8087:ca98?
 ([2a01:e35:2ec0:82b0:7474:6cdc:8087:ca98])
 by smtp.gmail.com with ESMTPSA id z8sm21907871wmg.17.2021.01.11.06.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 06:03:02 -0800 (PST)
Subject: Re: [PATCH 1/5] ARM: dts: meson: move iio-hwmon for the SoC
 temperature to meson.dtsi
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, khilman@baylibre.com
References: <20201221181306.904272-1-martin.blumenstingl@googlemail.com>
 <20201221181306.904272-2-martin.blumenstingl@googlemail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <5ff93086-d913-6465-7af3-9555c1cceba2@baylibre.com>
Date: Mon, 11 Jan 2021 15:03:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201221181306.904272-2-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_090304_474836_5415138C 
X-CRM114-Status: GOOD (  20.08  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 21/12/2020 19:13, Martin Blumenstingl wrote:
> The SoC temperature can be retrieved from ADC channel 8 on all 32-bit
> SoCs (Meson6, Meson8, Meson8b and Meson8m2). Move the iio-hwmon instance
> to meson.dtsi instead of duplicating it in all board.dts.
> If the temperature sensor calibration data is missing for a board then
> iio-hwmon will simply not probe.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  arch/arm/boot/dts/meson.dtsi              | 5 +++++
>  arch/arm/boot/dts/meson8b-ec100.dts       | 5 -----
>  arch/arm/boot/dts/meson8b-mxq.dts         | 5 -----
>  arch/arm/boot/dts/meson8b-odroidc1.dts    | 5 -----
>  arch/arm/boot/dts/meson8m2-mxiii-plus.dts | 5 -----
>  5 files changed, 5 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
> index 7649dd1e0b9e..5f074f7aa1a2 100644
> --- a/arch/arm/boot/dts/meson.dtsi
> +++ b/arch/arm/boot/dts/meson.dtsi
> @@ -11,6 +11,11 @@ / {
>  	#size-cells = <1>;
>  	interrupt-parent = <&gic>;
>  
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&saradc 8>;
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		#address-cells = <1>;
> diff --git a/arch/arm/boot/dts/meson8b-ec100.dts b/arch/arm/boot/dts/meson8b-ec100.dts
> index ed06102a4014..8e48ccc6b634 100644
> --- a/arch/arm/boot/dts/meson8b-ec100.dts
> +++ b/arch/arm/boot/dts/meson8b-ec100.dts
> @@ -70,11 +70,6 @@ gpio-poweroff {
>  		timeout-ms = <20000>;
>  	};
>  
> -	iio-hwmon {
> -		compatible = "iio-hwmon";
> -		io-channels = <&saradc 8>;
> -	};
> -
>  	leds {
>  		compatible = "gpio-leds";
>  
> diff --git a/arch/arm/boot/dts/meson8b-mxq.dts b/arch/arm/boot/dts/meson8b-mxq.dts
> index 33037ef62d0a..f3937d55472d 100644
> --- a/arch/arm/boot/dts/meson8b-mxq.dts
> +++ b/arch/arm/boot/dts/meson8b-mxq.dts
> @@ -27,11 +27,6 @@ memory {
>  		reg = <0x40000000 0x40000000>;
>  	};
>  
> -	iio-hwmon {
> -		compatible = "iio-hwmon";
> -		io-channels = <&saradc 8>;
> -	};
> -
>  	vcck: regulator-vcck {
>  		compatible = "pwm-regulator";
>  
> diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
> index 5963566dbcc9..c440ef94e082 100644
> --- a/arch/arm/boot/dts/meson8b-odroidc1.dts
> +++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
> @@ -85,11 +85,6 @@ tf_io: gpio-regulator-tf_io {
>  			  1800000 1>;
>  	};
>  
> -	iio-hwmon {
> -		compatible = "iio-hwmon";
> -		io-channels = <&saradc 8>;
> -	};
> -
>  	rtc32k_xtal: rtc32k-xtal-clk {
>  		/* X3 in the schematics */
>  		compatible = "fixed-clock";
> diff --git a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
> index 8f4eb1ed4581..fa6d55f1cfb9 100644
> --- a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
> +++ b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
> @@ -45,11 +45,6 @@ button-function {
>  		};
>  	};
>  
> -	iio-hwmon {
> -		compatible = "iio-hwmon";
> -		io-channels = <&saradc 8>;
> -	};
> -
>  	vcc_3v3: regulator-vcc3v3 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "VCC3V3";
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
