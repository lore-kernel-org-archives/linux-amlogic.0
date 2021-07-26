Return-Path: <SRS0=QpTa=MS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25455C4338F
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 08:01:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B88F360F0F
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 08:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B88F360F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=P8uAxplwwsKy+pnZ9zRZqOWUfBzbUPuW8+I7e8JxoyY=; b=xfTU1Pp/gPBEJ8LBGwuFFSX4VE
	kEUV6RJaNHmrzKFT8F7Q8SVzk2aWzeJcwhlhw6xMfoA4KXj/hqGvsCo1gwclpl8YnMYpmWoNbph60
	VU2Gr4/mx+IEGJvlHatp8YmSuVGUPnha5pxPfdJqKCwfHNYnZGEQFL3g/QoCTgEyElYGliA3WkXNw
	sAPiAIrgzJTq+Crgi6lqEelD+qmHjETS9JEh2YThK79izR/eEqZVgcjiNxkLkJwQ0kq1ShrTXkzIa
	vLezTA6p5Rmov0hxZ8/96ujeiJcg4Uf35Wk/Acac2acUXNuUVA0ndweQs0Kl6TjQ6xfYxoRBVrjrS
	RxwBHKNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7vXn-00A3og-1M; Mon, 26 Jul 2021 08:00:59 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7vXW-00A3jQ-9v
 for linux-amlogic@lists.infradead.org; Mon, 26 Jul 2021 08:00:43 +0000
Received: by mail-wr1-x42d.google.com with SMTP id z7so9881804wrn.11
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Jul 2021 01:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q59twgfa+FeEQtVy2D8Ev2ETY/cVtZPoYvkK2eCUnjw=;
 b=hpvOzN/KAig7+OUzRL4S+LB0gZf8i0GqTijEG7k1KQKP1LLS/aeSF1us+5j0JG+gTS
 ye8EWJ2N0CMWl6hVXer67x/jfgeuG0aNQM/h8UOLqKgNdbkyN1+3kH7vsbcRHNy3H7df
 R/naq0SfdHNJHUt5m3a65CUr0Lv5TlQanlNUxUK8MsbfMJ9voR0xmsk2xJCpzCKEo7Kt
 3b/TPzNVCUOE6hgBedEVMBM8yvk5zTKK+gUNtpmJXFZvZV76TDLeu/ei/MLh8BfY+lHR
 5kGmSh6LY2f9lEaf9lBpeklN9q+j1mC9epJy1KJbTza3EBpLBUhvK0hwe45W85BIzNXa
 Wu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Q59twgfa+FeEQtVy2D8Ev2ETY/cVtZPoYvkK2eCUnjw=;
 b=OI2JCRATsApqopefszIcWgVoEb/7ZlZdkcG+ihCN6piHk9/Moa8FnnRN6SkGSdinqa
 R4R0illG2LGWrcc5eK4gRxeXTpmQNGHzf0KnxlqRx/r0dCcvIQfA7FOwCOTAosNzhvIV
 YYy6hVTNVSzuNcuqhJKOyLsTt6HeESnnZ9o1uVBximxPAiWzE0tgLSUerBZD4T9jCyL/
 KkAwNbSquUddBYPw4o7IgYSyggDwLJAr48VEujTg1LYuiMynWr32mCYg4U63kPRGhjsq
 Te2z1JPMTX86MBsqmylizH5xu1zAED8aIu32GmPd5isiP6yFAEuqW/qAnAYY4bnaJkqD
 1YuQ==
X-Gm-Message-State: AOAM532jx67s4Xpam3dzebhtUhPMLFZECs37bU+GKLLOc5JoyKado+/J
 bi/GJ0a6WvhhzFBo09q34+Srug==
X-Google-Smtp-Source: ABdhPJz/Z2jYtoBkZHOZZfKrdjl4coISzKdv9e4USG4jdwOPJ86qy4fy0xa1bGusXEHS4Usc2NWb5w==
X-Received: by 2002:a5d:6b91:: with SMTP id n17mr17673714wrx.385.1627286440817; 
 Mon, 26 Jul 2021 01:00:40 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:32b6:aa71:d2df:4f1d?
 ([2001:861:44c0:66c0:32b6:aa71:d2df:4f1d])
 by smtp.gmail.com with ESMTPSA id f15sm12416743wmj.15.2021.07.26.01.00.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 01:00:40 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] ARM: dts: meson8b: ec100: wire up the RT5640 audio
 codec
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: khilman@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210717233030.331273-1-martin.blumenstingl@googlemail.com>
 <20210717233030.331273-3-martin.blumenstingl@googlemail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <fbcf5556-4c32-151a-7e45-9577c6a1349b@baylibre.com>
Date: Mon, 26 Jul 2021 10:00:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717233030.331273-3-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_010042_369439_87A3C558 
X-CRM114-Status: GOOD (  21.41  )
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

On 18/07/2021 01:30, Martin Blumenstingl wrote:
> The Realtek RT5640 codec is connected to the SoC's I2S interface.
> Describe this in the .dts together with the codec's LDO1 enable GPIO so
> audio can be played on the Endless Mini.
> While here, add a note about the realtek,ldo1-en-gpios for which the
> EC100 uses GPIO_BSD_EN. Due to driver limitations this pin cannot be
> used currently.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  arch/arm/boot/dts/meson8b-ec100.dts | 44 +++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/meson8b-ec100.dts b/arch/arm/boot/dts/meson8b-ec100.dts
> index 8e48ccc6b634..e404bdccdab9 100644
> --- a/arch/arm/boot/dts/meson8b-ec100.dts
> +++ b/arch/arm/boot/dts/meson8b-ec100.dts
> @@ -96,6 +96,32 @@ rtc32k_xtal: rtc32k-xtal-clk {
>  		#clock-cells = <0>;
>  	};
>  
> +	sound {
> +		compatible = "amlogic,gx-sound-card";
> +		model = "M8B-EC100";
> +
> +		assigned-clocks = <&clkc CLKID_MPLL0>,
> +				  <&clkc CLKID_MPLL1>,
> +				  <&clkc CLKID_MPLL2>;
> +		assigned-clock-rates = <270950400>,
> +				       <294912000>,
> +				       <393216000>;
> +
> +		dai-link-0 {
> +			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
> +		};
> +
> +		dai-link-1 {
> +			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
> +			dai-format = "i2s";
> +			mclk-fs = <256>;
> +
> +			codec-0 {
> +				sound-dai = <&rt5640>;
> +			};
> +		};
> +	};
> +
>  	usb_vbus: regulator-usb-vbus {
>  		/*
>  		 * Silergy SY6288CCAC-GP 2A Power Distribution Switch.
> @@ -242,6 +268,14 @@ vddee: regulator-vddee {
>  	};
>  };
>  
> +&aiu {
> +	status = "okay";
> +
> +	pinctrl-0 = <&i2s_am_clk_pins>, <&i2s_out_ao_clk_pins>,
> +		    <&i2s_out_lr_clk_pins>, <&i2s_out_ch01_ao_pins>;
> +	pinctrl-names = "default";
> +};
> +
>  &cpu0 {
>  	cpu-supply = <&vcck>;
>  };
> @@ -283,9 +317,19 @@ &i2c_A {
>  
>  	rt5640: codec@1c {
>  		compatible = "realtek,rt5640";
> +
>  		reg = <0x1c>;
> +
> +		#sound-dai-cells = <0>;
> +
>  		interrupt-parent = <&gpio_intc>;
>  		interrupts = <13 IRQ_TYPE_EDGE_BOTH>; /* GPIOAO_13 */
> +
> +		/*
> +		 * TODO: realtek,ldo1-en-gpios is connected to GPIO_BSD_EN.
> +		 * We currently cannot configure this pin correctly.
> +		 * Luckily for us it's in the "right" state by default.
> +		 */
>  		realtek,in1-differential;
>  	};
>  };
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
