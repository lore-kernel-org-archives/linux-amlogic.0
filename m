Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB89C6FD1C
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Mar 2023 10:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lfj91cZgcaX5lmC4Y+dL/Bc2V3o7W6/3XqICqJEpaw0=; b=loj9cIIPIbgv7G18Imuo/3gC5l
	1ZTLwz0vAwYBltPSafxgA4m4RCWBH2YQwNsqUtqZ7NtvvdoWvx9yDMdBFlVPugiHfZP8JcpndopSI
	pMrKXybDpsB3rWxfl6IZhMuCZTtmP1z5e7+c1p7kYlBqIT9ayK4EXfByweKdxLzNCTWLYcJqQPn3X
	WNq1rF53fiWQ8EvqrP1RhG0Rig7D6L/Ina+t4lJJ9+xI5eVHkBqLvHlMGDm/sqZpBAvpPN++V+VGS
	/Kay/ZIt6ogGDwuMehbbiDPt7f1ck80VBKoN8YuHaR2h3c+0x9pFT9D53l3cNYBx+b4j1Df/2/1fc
	BYQsR0pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pevk4-00FeEn-1n;
	Wed, 22 Mar 2023 10:30:52 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pevk1-00FeBA-0B
	for linux-amlogic@lists.infradead.org;
	Wed, 22 Mar 2023 10:30:50 +0000
Received: by mail-wr1-x42c.google.com with SMTP id l12so16454110wrm.10
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Mar 2023 03:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679481045;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HS1TthkA1D783Zl2TDLfV0qjKb5jmiXmhJ6n2zgO/b0=;
        b=U0i1asBOZxJ6VioQ2kAaKVDljpLZYtdcXc8Qtpw0mFrPut11p+GGz293JmHGHT4yXl
         GdITAje81Q5pblvWTczmf205lakcLLGb0WYiyScp73RML8M46JgjmqZO4yNzyxnKecod
         v9Gzee/X/nvRBEnEnXTEqdFfs0EW4UAV7cx3MXT/ri/THcjeaqpYlfiOX1fpoA0MlPzQ
         pJHED/HiF0OLLC4trsX6ZpiY+MjtQ8DkUy03/Ng3GoKp2ulV4MQtj9w5aIr87pTBSzHv
         ZEVXXIXrlxHPxxjsI/1b+DsmHHy8tRjaHXcusXV72eC5DGzNSwvyvWpPy0d36BIHajqb
         nu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679481045;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HS1TthkA1D783Zl2TDLfV0qjKb5jmiXmhJ6n2zgO/b0=;
        b=Fo/crybPPk8lhDEgJ9waDtsmAmCcAPwUQs/eJDvkSjW5/nFqY+DKOj2RBbNOq/5V71
         kCaPV/QCYxIYUNn0tMjIusnPra0VOOJD5907XsIeCvPnrfffEISFYEBx2qyUHYGzWsbv
         ZInCXobvhE9fg5OTMVy1goP5DzJQdREnNB+2u4NUIMTfrQf+ls/3yDgzEBTzLBJ87Shc
         SnWkUpx724Sw+OtE7ePZHJ3KpS2bR00hH1yRp714p6EtVqg5KQ4XMgKnrntAXzUmpLV3
         0IVGvym1QSYVw5nK3FJNqcHRULajVbwbx4Zg4W8ZjL1PTOCzizqLA+7jodKSqT6nMdrs
         zcpg==
X-Gm-Message-State: AO0yUKUX4P+ZqLxbWFC+86qEih5xaVghn3uQA0r/8Mw1Eh36dyEnsfwn
	kwZslp2oy0+vbtFOHNssWIXMSQ==
X-Google-Smtp-Source: AK7set+SptPdFQRECxHi/SgpJ/cDbVBTk06DRTZBqXUJZ4lwFD0Oy7fakaIxrUXhCUUC38GcSeFuyw==
X-Received: by 2002:a5d:48c5:0:b0:2cf:e7d5:8fcb with SMTP id p5-20020a5d48c5000000b002cfe7d58fcbmr4648685wrs.49.1679481045491;
        Wed, 22 Mar 2023 03:30:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3606:a601:f273:994a? ([2a01:e0a:982:cbb0:3606:a601:f273:994a])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6082000000b002c6d0462163sm13437081wrt.100.2023.03.22.03.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 03:30:45 -0700 (PDT)
Message-ID: <c16cfd67-d8b7-87a6-1b59-2ab351174513@linaro.org>
Date: Wed, 22 Mar 2023 11:30:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 3/3] ARM: dts: meson8m2: mxiii-plus: Enable Bluetooth
 and WiFi support
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230321171213.2808460-1-martin.blumenstingl@googlemail.com>
 <20230321171213.2808460-4-martin.blumenstingl@googlemail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230321171213.2808460-4-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_033049_104405_4E442698 
X-CRM114-Status: GOOD (  16.86  )
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

On 21/03/2023 18:12, Martin Blumenstingl wrote:
> The MXIII Plus uses an Ampak AP6330 Bluetooth and WiFi combo chip.
> Bluetooth is connected to &uart_A and requires toggling GPIOX_20.
> WiFi can be routed to either &sdhc or &sdio. Route WiFi to &sdhc
> since  &sdio is already connected to the SD card. Additionally WiFi
> requires toggling GPIOX_11 and GPIOAO_6 as well as enabling the 32kHz
> clock signal.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   arch/arm/boot/dts/meson8m2-mxiii-plus.dts | 48 ++++++++++++++++++++++-
>   1 file changed, 47 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
> index fa6d55f1cfb9..aa4d4bf70629 100644
> --- a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
> +++ b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
> @@ -19,7 +19,6 @@ aliases {
>   		ethernet0 = &ethmac;
>   		i2c0 = &i2c_AO;
>   		serial0 = &uart_AO;
> -		serial1 = &uart_A;
>   		mmc0 = &sd_card_slot;
>   	};
>   
> @@ -45,12 +44,32 @@ button-function {
>   		};
>   	};
>   
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +
> +		pinctrl-0 = <&xtal_32k_out_pins>;
> +		pinctrl-names = "default";
> +
> +		reset-gpios = <&gpio GPIOX_11 GPIO_ACTIVE_LOW>,
> +			      <&gpio_ao GPIOAO_6 GPIO_ACTIVE_LOW>;
> +
> +		clocks = <&xtal_32k_out>;
> +		clock-names = "ext_clock";
> +	};
> +
>   	vcc_3v3: regulator-vcc3v3 {
>   		compatible = "regulator-fixed";
>   		regulator-name = "VCC3V3";
>   		regulator-min-microvolt = <3300000>;
>   		regulator-max-microvolt = <3300000>;
>   	};
> +
> +	xtal_32k_out: xtal-32k-out-clk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		clock-output-names = "xtal_32k_out";
> +	};
>   };
>   
>   &cpu0 {
> @@ -192,6 +211,27 @@ &saradc {
>   	vref-supply = <&vddio_ao1v8>;
>   };
>   
> +/* SDIO wifi */
> +&sdhc {
> +	status = "okay";
> +
> +	pinctrl-0 = <&sdxc_a_pins>;
> +	pinctrl-names = "default";
> +
> +	bus-width = <4>;
> +	max-frequency = <50000000>;
> +
> +	disable-wp;
> +	non-removable;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&vcc_3v3>;
> +};
> +
>   &sdio {
>   	status = "okay";
>   
> @@ -222,6 +262,12 @@ &uart_A {
>   	pinctrl-0 = <&uart_a1_pins>, <&uart_a1_cts_rts_pins>;
>   	pinctrl-names = "default";
>   	uart-has-rtscts;
> +
> +	bluetooth {
> +		compatible = "brcm,bcm20702a1";
> +		shutdown-gpios = <&gpio GPIOX_20 GPIO_ACTIVE_HIGH>;
> +		max-speed = <2000000>;
> +	};
>   };
>   
>   &uart_AO {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
