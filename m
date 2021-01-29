Return-Path: <SRS0=l5NU=HA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7579BC433E0
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jan 2021 08:11:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E95264DE9
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jan 2021 08:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E95264DE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yEN8jyMO0xB+QAjN7Y3GyFsOgttpTpiwR4nhfb/oHqw=; b=eGup3MoD5+JYoThwlOuRmZRRX
	XUS/qD5OzEP0sGNYGFjt/80eX55l4rEQUroexI71ka5eQSfCrmV7swkgGAGSgSyglnGWgW5KWvdDb
	WHlV0VSvMHKG4whmOl4pNs+ZBvb+F+3RRfNfhNGC7StzRD3RSfPzICEDlgZUYZOd2AyamVNsXs1zM
	IBBrH4GGcIck4PCabHpKyV3jSfNYOvXFFqZ9L9MhbLaiKAixQgq2clYgdeeyxJqq4W3NOVDSnkdoc
	uomibFIz+mJcHecO6bZ5bdw5hwjTI2ZrRuWirslXur9UUNWPPWLgEfGebC3kvCY4DspCQY5fspkqA
	Od0Vop/gQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5OsQ-0000wQ-Gz; Fri, 29 Jan 2021 08:11:34 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5OsL-0000u8-9V
 for linux-amlogic@lists.infradead.org; Fri, 29 Jan 2021 08:11:32 +0000
Received: by mail-wm1-x336.google.com with SMTP id z16so3820062wml.2
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Jan 2021 00:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ou2C9AUpJQR/nqyD4b/Gkt+0xtDpUt39jG1bm/gbQ0g=;
 b=GIxy813EYV8NJkK6LfQgPpvFXQcNSLD9ky4c0V7yPiWhdP3sGq0LDULsmaWr9Ool8H
 k0IML5Ui6Txqa0QDpBuIsh3VjV7Zq2vJh/vhXLN7cT429KwiCbuBCnuyXgeVzO6O9TBl
 EDVGQqRKP/TpAbXT/xUY+DlDUem+D/pGpeaHPCIW4/0U6kcKEw/4OYjSR6UV7DAl7C/N
 Um7ujOK+QXeAjyV1jo8s8g2GUDZ6fYEOO3h9o/eItbtOjANoQUshvNBwgU/aeG3VG8Ot
 0aWFRrUmn+staqIy15SjjV+iDv88NqO58/FJlD4wcKflcaky8vejZxd3fRau5pzvEFYD
 oArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ou2C9AUpJQR/nqyD4b/Gkt+0xtDpUt39jG1bm/gbQ0g=;
 b=R8cka1bIOYG7vkEyryuJXtk8TsAxdefXmRQoV1g8635WamgS/KN0DeApmxk2ROvMgR
 GL9CCrqSIzYJU91wIIMeX0ZtLZPE79Ko9zsf/WNJPQJHtsFyBYUw9NpkniolURfiO2Cl
 7gRIO4BKaTpQHtjm8ovwZ2Fv4xPEaS7kiSKl2WpW91fPLlMcfZo5xZPResTXoC7fftR/
 bn5aSX8wHmzyxDPHaGRVWUl+/M+PsmgRZLVERCo7tV05NgkDcf01NMd8qWL3Br03Ur/L
 cPqKJxdSq0LlQmNGZAPmi6gaE/pyb/KEf7TvQ/gShUzqNcoiT1lu3Fi8tj7GMTQk5qPf
 6uFQ==
X-Gm-Message-State: AOAM533c5VKSMzY7ZsCuPgwvTaW3AfdIDiVT6G8i2pVKAWx2Ztd6NWzR
 TAq6k6xDYFYvR306c7/jIOpsKQ==
X-Google-Smtp-Source: ABdhPJy+4mr5aJy0dmR5lMkW6ixDE1bvLgh9y/qlTLxeFnGehHHaZWv9oHEpCKuRY+GT2dABzlbSVA==
X-Received: by 2002:a1c:4e05:: with SMTP id g5mr2630179wmh.105.1611907887853; 
 Fri, 29 Jan 2021 00:11:27 -0800 (PST)
Received: from ?IPv6:2a01:e0a:90c:e290:849c:ba34:4d4f:a235?
 ([2a01:e0a:90c:e290:849c:ba34:4d4f:a235])
 by smtp.gmail.com with ESMTPSA id j13sm8673745wmi.24.2021.01.29.00.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 00:11:27 -0800 (PST)
Subject: Re: [PATCH 3/5] arm64: dts: meson: convert meson-sm1-odroid-c4 to dtsi
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210129065137.5473-1-christianshewitt@gmail.com>
 <20210129065137.5473-4-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <4133d71a-df91-033f-f03e-d432003d1550@baylibre.com>
Date: Fri, 29 Jan 2021 09:11:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210129065137.5473-4-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_031129_459882_9AF2D1B2 
X-CRM114-Status: GOOD (  17.46  )
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
Cc: Dongjin Kim <tobetter@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 29/01/2021 07:51, Christian Hewitt wrote:
> Convert the ODRIOD-C4 dts to meson-sm1-odroid.dtsi and C4 board dts in
> preparation for adding additional C4 family boards.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 427 +----------------
>  .../boot/dts/amlogic/meson-sm1-odroid.dtsi    | 441 ++++++++++++++++++
>  2 files changed, 442 insertions(+), 426 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
> index eadd75e6e067..b2a4e823c1d8 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
> @@ -5,34 +5,12 @@
>  
>  /dts-v1/;
>  
> -#include "meson-sm1.dtsi"
> -#include <dt-bindings/gpio/meson-g12a-gpio.h>
> -#include <dt-bindings/leds/common.h>
> -#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
> +#include "meson-sm1-odroid.dtsi"
>  
>  / {
>  	compatible = "hardkernel,odroid-c4", "amlogic,sm1";
>  	model = "Hardkernel ODROID-C4";
>  
> -	aliases {
> -		serial0 = &uart_AO;
> -		ethernet0 = &ethmac;
> -	};
> -
> -	chosen {
> -		stdout-path = "serial0:115200n8";
> -	};
> -
> -	memory@0 {
> -		device_type = "memory";
> -		reg = <0x0 0x0 0x0 0x40000000>;
> -	};
> -
> -	emmc_pwrseq: emmc-pwrseq {
> -		compatible = "mmc-pwrseq-emmc";
> -		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
> -	};
> -
>  	leds {
>  		compatible = "gpio-leds";
>  
> @@ -45,96 +23,6 @@
>  		};
>  	};
>  
> -	tflash_vdd: regulator-tflash_vdd {
> -		compatible = "regulator-fixed";
> -
> -		regulator-name = "TFLASH_VDD";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -
> -		gpio = <&gpio_ao GPIOAO_3 GPIO_OPEN_DRAIN>;
> -		enable-active-high;
> -		regulator-always-on;
> -	};
> -
> -	tf_io: gpio-regulator-tf_io {
> -		compatible = "regulator-gpio";
> -
> -		regulator-name = "TF_IO";
> -		regulator-min-microvolt = <1800000>;
> -		regulator-max-microvolt = <3300000>;
> -
> -		gpios = <&gpio_ao GPIOAO_6 GPIO_ACTIVE_HIGH>;
> -		gpios-states = <0>;
> -
> -		states = <3300000 0>,
> -			 <1800000 1>;
> -	};
> -
> -	flash_1v8: regulator-flash_1v8 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "FLASH_1V8";
> -		regulator-min-microvolt = <1800000>;
> -		regulator-max-microvolt = <1800000>;
> -		vin-supply = <&vcc_3v3>;
> -		regulator-always-on;
> -	};
> -
> -	main_12v: regulator-main_12v {
> -		compatible = "regulator-fixed";
> -		regulator-name = "12V";
> -		regulator-min-microvolt = <12000000>;
> -		regulator-max-microvolt = <12000000>;
> -		regulator-always-on;
> -	};
> -
> -	vcc_5v: regulator-vcc_5v {
> -		compatible = "regulator-fixed";
> -		regulator-name = "5V";
> -		regulator-min-microvolt = <5000000>;
> -		regulator-max-microvolt = <5000000>;
> -		regulator-always-on;
> -		vin-supply = <&main_12v>;
> -	};
> -
> -	vcc_1v8: regulator-vcc_1v8 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "VCC_1V8";
> -		regulator-min-microvolt = <1800000>;
> -		regulator-max-microvolt = <1800000>;
> -		vin-supply = <&vcc_3v3>;
> -		regulator-always-on;
> -	};
> -
> -	vcc_3v3: regulator-vcc_3v3 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "VCC_3V3";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		vin-supply = <&vddao_3v3>;
> -		regulator-always-on;
> -		/* FIXME: actually controlled by VDDCPU_B_EN */
> -	};
> -
> -	vddcpu: regulator-vddcpu {
> -		/*
> -		 * MP8756GD Regulator.
> -		 */
> -		compatible = "pwm-regulator";
> -
> -		regulator-name = "VDDCPU";
> -		regulator-min-microvolt = <721000>;
> -		regulator-max-microvolt = <1022000>;
> -
> -		vin-supply = <&main_12v>;
> -
> -		pwms = <&pwm_AO_cd 1 1250 0>;
> -		pwm-dutycycle-range = <100 0>;
> -
> -		regulator-boot-on;
> -		regulator-always-on;
> -	};
> -
>  	hub_5v: regulator-hub_5v {
>  		compatible = "regulator-fixed";
>  		regulator-name = "HUB_5V";
> @@ -147,215 +35,12 @@
>  		enable-active-high;
>  	};
>  
> -	usb_pwr_en: regulator-usb_pwr_en {
> -		compatible = "regulator-fixed";
> -		regulator-name = "USB_PWR_EN";
> -		regulator-min-microvolt = <5000000>;
> -		regulator-max-microvolt = <5000000>;
> -		vin-supply = <&vcc_5v>;
> -
> -		/* Connected to the microUSB port power enable */
> -		gpio = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -	};
> -
> -	vddao_1v8: regulator-vddao_1v8 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "VDDAO_1V8";
> -		regulator-min-microvolt = <1800000>;
> -		regulator-max-microvolt = <1800000>;
> -		vin-supply = <&vddao_3v3>;
> -		regulator-always-on;
> -	};
> -
> -	vddao_3v3: regulator-vddao_3v3 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "VDDAO_3V3";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		vin-supply = <&main_12v>;
> -		regulator-always-on;
> -	};
> -
> -	hdmi-connector {
> -		compatible = "hdmi-connector";
> -		type = "a";
> -
> -		port {
> -			hdmi_connector_in: endpoint {
> -				remote-endpoint = <&hdmi_tx_tmds_out>;
> -			};
> -		};
> -	};
> -
>  	sound {
> -		compatible = "amlogic,axg-sound-card";
>  		model = "ODROID-C4";
> -		audio-aux-devs = <&tdmout_b>;
> -		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
> -				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
> -				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
> -				"TDM_B Playback", "TDMOUT_B OUT";
> -
> -		assigned-clocks = <&clkc CLKID_MPLL2>,
> -				  <&clkc CLKID_MPLL0>,
> -				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
> -		assigned-clock-rates = <294912000>,
> -				       <270950400>,
> -				       <393216000>;
> -		status = "okay";
> -
> -		dai-link-0 {
> -			sound-dai = <&frddr_a>;
> -		};
> -
> -		dai-link-1 {
> -			sound-dai = <&frddr_b>;
> -		};
> -
> -		dai-link-2 {
> -			sound-dai = <&frddr_c>;
> -		};
> -
> -		/* 8ch hdmi interface */
> -		dai-link-3 {
> -			sound-dai = <&tdmif_b>;
> -			dai-format = "i2s";
> -			dai-tdm-slot-tx-mask-0 = <1 1>;
> -			dai-tdm-slot-tx-mask-1 = <1 1>;
> -			dai-tdm-slot-tx-mask-2 = <1 1>;
> -			dai-tdm-slot-tx-mask-3 = <1 1>;
> -			mclk-fs = <256>;
> -
> -			codec {
> -				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
> -			};
> -		};
> -
> -		/* hdmi glue */
> -		dai-link-4 {
> -			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
> -
> -			codec {
> -				sound-dai = <&hdmi_tx>;
> -			};
> -		};
> -	};
> -};
> -
> -&arb {
> -	status = "okay";
> -};
> -
> -&clkc_audio {
> -	status = "okay";
> -};
> -
> -&cpu0 {
> -	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
> -};
> -
> -&cpu1 {
> -	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU1_CLK>;
> -	clock-latency = <50000>;
> -};
> -
> -&cpu2 {
> -	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU2_CLK>;
> -	clock-latency = <50000>;
> -};
> -
> -&cpu3 {
> -	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU3_CLK>;
> -	clock-latency = <50000>;
> -};
> -
> -&ext_mdio {
> -	external_phy: ethernet-phy@0 {
> -		/* Realtek RTL8211F (0x001cc916) */
> -		reg = <0>;
> -		max-speed = <1000>;
> -
> -		interrupt-parent = <&gpio_intc>;
> -		/* MAC_INTR on GPIOZ_14 */
> -		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
>  	};
>  };
>  
> -&ethmac {
> -	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
> -	pinctrl-names = "default";
> -	status = "okay";
> -	phy-mode = "rgmii";
> -	phy-handle = <&external_phy>;
> -	amlogic,tx-delay-ns = <2>;
> -};
> -
> -&frddr_a {
> -	status = "okay";
> -};
> -
> -&frddr_b {
> -	status = "okay";
> -};
> -
> -&frddr_c {
> -	status = "okay";
> -};
> -
>  &gpio {
> -	gpio-line-names =
> -		/* GPIOZ */
> -		"", "", "", "", "", "", "", "",
> -		"", "", "", "", "", "", "", "",
> -		/* GPIOH */
> -		"", "", "", "", "",
> -		"PIN_36", /* GPIOH_5 */
> -		"PIN_26", /* GPIOH_6 */
> -		"PIN_32", /* GPIOH_7 */
> -		"",
> -		/* BOOT */
> -		"", "", "", "", "", "", "", "",
> -		"", "", "", "", "", "", "", "",
> -		/* GPIOC */
> -		"", "", "", "", "", "", "", "",
> -		/* GPIOA */
> -		"", "", "", "", "", "", "", "",
> -		"", "", "", "", "", "",
> -		"PIN_27", /* GPIOA_14 */
> -		"PIN_28", /* GPIOA_15 */
> -		/* GPIOX */
> -		"PIN_16", /* GPIOX_0 */
> -		"PIN_18", /* GPIOX_1 */
> -		"PIN_22", /* GPIOX_2 */
> -		"PIN_11", /* GPIOX_3 */
> -		"PIN_13", /* GPIOX_4 */
> -		"PIN_7",  /* GPIOX_5 */
> -		"PIN_33", /* GPIOX_6 */
> -		"PIN_15", /* GPIOX_7 */
> -		"PIN_19", /* GPIOX_8 */
> -		"PIN_21", /* GPIOX_9 */
> -		"PIN_24", /* GPIOX_10 */
> -		"PIN_23", /* GPIOX_11 */
> -		"PIN_8",  /* GPIOX_12 */
> -		"PIN_10", /* GPIOX_13 */
> -		"PIN_29", /* GPIOX_14 */
> -		"PIN_31", /* GPIOX_15 */
> -		"PIN_12", /* GPIOX_16 */
> -		"PIN_3",  /* GPIOX_17 */
> -		"PIN_5",  /* GPIOX_18 */
> -		"PIN_35"; /* GPIOX_19 */
> -
>  	/*
>  	 * WARNING: The USB Hub on the Odroid-C4 needs a reset signal
>  	 * to be turned high in order to be detected by the USB Controller
> @@ -370,120 +55,10 @@
>  	};
>  };
>  
> -&gpio_ao {
> -	gpio-line-names =
> -		/* GPIOAO */
> -		"", "", "", "",
> -		"PIN_47", /* GPIOAO_4 */
> -		"", "",
> -		"PIN_45", /* GPIOAO_7 */
> -		"PIN_46", /* GPIOAO_8 */
> -		"PIN_44", /* GPIOAO_9 */
> -		"PIN_42", /* GPIOAO_10 */
> -		"",
> -		/* GPIOE */
> -		"", "", "";
> -};
> -
> -&hdmi_tx {
> -	status = "okay";
> -	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
> -	pinctrl-names = "default";
> -	hdmi-supply = <&vcc_5v>;
> -};
> -
> -&hdmi_tx_tmds_port {
> -	hdmi_tx_tmds_out: endpoint {
> -		remote-endpoint = <&hdmi_connector_in>;
> -	};
> -};
> -
>  &ir {
> -	status = "okay";
> -	pinctrl-0 = <&remote_input_ao_pins>;
> -	pinctrl-names = "default";
>  	linux,rc-map-name = "rc-odroid";
>  };
>  
> -&pwm_AO_cd {
> -	pinctrl-0 = <&pwm_ao_d_e_pins>;
> -	pinctrl-names = "default";
> -	clocks = <&xtal>;
> -	clock-names = "clkin1";
> -	status = "okay";
> -};
> -
> -&saradc {
> -	status = "okay";
> -};
> -
> -/* SD card */
> -&sd_emmc_b {
> -	status = "okay";
> -	pinctrl-0 = <&sdcard_c_pins>;
> -	pinctrl-1 = <&sdcard_clk_gate_c_pins>;
> -	pinctrl-names = "default", "clk-gate";
> -
> -	bus-width = <4>;
> -	cap-sd-highspeed;
> -	max-frequency = <200000000>;
> -	sd-uhs-sdr12;
> -	sd-uhs-sdr25;
> -	sd-uhs-sdr50;
> -	sd-uhs-sdr104;
> -	disable-wp;
> -
> -	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
> -	vmmc-supply = <&tflash_vdd>;
> -	vqmmc-supply = <&tf_io>;
> -};
> -
> -/* eMMC */
> -&sd_emmc_c {
> -	status = "okay";
> -	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_8b_pins>, <&emmc_ds_pins>;
> -	pinctrl-1 = <&emmc_clk_gate_pins>;
> -	pinctrl-names = "default", "clk-gate";
> -
> -	bus-width = <8>;
> -	cap-mmc-highspeed;
> -	mmc-ddr-1_8v;
> -	mmc-hs200-1_8v;
> -	max-frequency = <200000000>;
> -	disable-wp;
> -
> -	mmc-pwrseq = <&emmc_pwrseq>;
> -	vmmc-supply = <&vcc_3v3>;
> -	vqmmc-supply = <&flash_1v8>;
> -};
> -
> -&tdmif_b {
> -	status = "okay";
> -};
> -
> -&tdmout_b {
> -	status = "okay";
> -};
> -
> -&tohdmitx {
> -	status = "okay";
> -};
> -
> -&uart_AO {
> -	status = "okay";
> -	pinctrl-0 = <&uart_ao_a_pins>;
> -	pinctrl-names = "default";
> -};
> -
> -&usb {
> -	status = "okay";
> -	vbus-supply = <&usb_pwr_en>;
> -};
> -
> -&usb2_phy0 {
> -	phy-supply = <&vcc_5v>;
> -};
> -
>  &usb2_phy1 {
>  	/* Enable the hub which is connected to this port */
>  	phy-supply = <&hub_5v>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> new file mode 100644
> index 000000000000..a66d55d93183
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> @@ -0,0 +1,441 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2020 Dongjin Kim <tobetter@gmail.com>
> + */
> +
> +#include "meson-sm1.dtsi"
> +#include <dt-bindings/gpio/meson-g12a-gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
> +
> +/ {
> +	aliases {
> +		serial0 = &uart_AO;
> +		ethernet0 = &ethmac;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x0 0x0 0x40000000>;
> +	};
> +
> +	emmc_pwrseq: emmc-pwrseq {
> +		compatible = "mmc-pwrseq-emmc";
> +		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	tflash_vdd: regulator-tflash_vdd {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "TFLASH_VDD";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&gpio_ao GPIOAO_3 GPIO_OPEN_DRAIN>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	tf_io: gpio-regulator-tf_io {
> +		compatible = "regulator-gpio";
> +
> +		regulator-name = "TF_IO";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpios = <&gpio_ao GPIOAO_6 GPIO_ACTIVE_HIGH>;
> +		gpios-states = <0>;
> +
> +		states = <3300000 0>,
> +			 <1800000 1>;
> +	};
> +
> +	flash_1v8: regulator-flash_1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "FLASH_1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vcc_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	main_12v: regulator-main_12v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "12V";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		regulator-always-on;
> +	};
> +
> +	vcc_5v: regulator-vcc_5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +		vin-supply = <&main_12v>;
> +	};
> +
> +	vcc_1v8: regulator-vcc_1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vcc_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	vcc_3v3: regulator-vcc_3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vddao_3v3>;
> +		regulator-always-on;
> +		/* FIXME: actually controlled by VDDCPU_B_EN */
> +	};
> +
> +	vddcpu: regulator-vddcpu {
> +		/*
> +		 * MP8756GD Regulator.
> +		 */
> +		compatible = "pwm-regulator";
> +
> +		regulator-name = "VDDCPU";
> +		regulator-min-microvolt = <721000>;
> +		regulator-max-microvolt = <1022000>;
> +
> +		vin-supply = <&main_12v>;
> +
> +		pwms = <&pwm_AO_cd 1 1250 0>;
> +		pwm-dutycycle-range = <100 0>;
> +
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	usb_pwr_en: regulator-usb_pwr_en {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USB_PWR_EN";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc_5v>;
> +
> +		/* Connected to the microUSB port power enable */
> +		gpio = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	vddao_1v8: regulator-vddao_1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDAO_1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vddao_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	vddao_3v3: regulator-vddao_3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDAO_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&main_12v>;
> +		regulator-always-on;
> +	};
> +
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_connector_in: endpoint {
> +				remote-endpoint = <&hdmi_tx_tmds_out>;
> +			};
> +		};
> +	};
> +
> +	sound {
> +		compatible = "amlogic,axg-sound-card";
> +		audio-aux-devs = <&tdmout_b>;
> +		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
> +				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
> +				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
> +				"TDM_B Playback", "TDMOUT_B OUT";
> +
> +		assigned-clocks = <&clkc CLKID_MPLL2>,
> +				  <&clkc CLKID_MPLL0>,
> +				  <&clkc CLKID_MPLL1>;
> +
> +		assigned-clock-parents = <0>, <0>, <0>;
> +		assigned-clock-rates = <294912000>,
> +				       <270950400>,
> +				       <393216000>;
> +		status = "okay";
> +
> +		dai-link-0 {
> +			sound-dai = <&frddr_a>;
> +		};
> +
> +		dai-link-1 {
> +			sound-dai = <&frddr_b>;
> +		};
> +
> +		dai-link-2 {
> +			sound-dai = <&frddr_c>;
> +		};
> +
> +		/* 8ch hdmi interface */
> +		dai-link-3 {
> +			sound-dai = <&tdmif_b>;
> +			dai-format = "i2s";
> +			dai-tdm-slot-tx-mask-0 = <1 1>;
> +			dai-tdm-slot-tx-mask-1 = <1 1>;
> +			dai-tdm-slot-tx-mask-2 = <1 1>;
> +			dai-tdm-slot-tx-mask-3 = <1 1>;
> +			mclk-fs = <256>;
> +
> +			codec {
> +				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
> +			};
> +		};
> +
> +		/* hdmi glue */
> +		dai-link-4 {
> +			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
> +			codec {
> +				sound-dai = <&hdmi_tx>;
> +			};
> +		};
> +	};
> +};
> +
> +&arb {
> +	status = "okay";
> +};
> +
> +&clkc_audio {
> +	status = "okay";
> +};
> +
> +&cpu0 {
> +	cpu-supply = <&vddcpu>;
> +	operating-points-v2 = <&cpu_opp_table>;
> +	clocks = <&clkc CLKID_CPU_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu1 {
> +	cpu-supply = <&vddcpu>;
> +	operating-points-v2 = <&cpu_opp_table>;
> +	clocks = <&clkc CLKID_CPU1_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu2 {
> +	cpu-supply = <&vddcpu>;
> +	operating-points-v2 = <&cpu_opp_table>;
> +	clocks = <&clkc CLKID_CPU2_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu3 {
> +	cpu-supply = <&vddcpu>;
> +	operating-points-v2 = <&cpu_opp_table>;
> +	clocks = <&clkc CLKID_CPU3_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&ext_mdio {
> +	external_phy: ethernet-phy@0 {
> +		/* Realtek RTL8211F (0x001cc916) */
> +		reg = <0>;
> +		max-speed = <1000>;
> +
> +		interrupt-parent = <&gpio_intc>;
> +		/* MAC_INTR on GPIOZ_14 */
> +		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
> +&ethmac {
> +	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +	phy-mode = "rgmii";
> +	phy-handle = <&external_phy>;
> +	amlogic,tx-delay-ns = <2>;
> +};
> +
> +&frddr_a {
> +	status = "okay";
> +};
> +
> +&frddr_b {
> +	status = "okay";
> +};
> +
> +&frddr_c {
> +	status = "okay";
> +};
> +
> +&gpio {
> +	gpio-line-names =
> +		/* GPIOZ */
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		/* GPIOH */
> +		"", "", "", "", "",
> +		"PIN_36", /* GPIOH_5 */
> +		"PIN_26", /* GPIOH_6 */
> +		"PIN_32", /* GPIOH_7 */
> +		"",
> +		/* BOOT */
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		/* GPIOC */
> +		"", "", "", "", "", "", "", "",
> +		/* GPIOA */
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "",
> +		"PIN_27", /* GPIOA_14 */
> +		"PIN_28", /* GPIOA_15 */
> +		/* GPIOX */
> +		"PIN_16", /* GPIOX_0 */
> +		"PIN_18", /* GPIOX_1 */
> +		"PIN_22", /* GPIOX_2 */
> +		"PIN_11", /* GPIOX_3 */
> +		"PIN_13", /* GPIOX_4 */
> +		"PIN_7",  /* GPIOX_5 */
> +		"PIN_33", /* GPIOX_6 */
> +		"PIN_15", /* GPIOX_7 */
> +		"PIN_19", /* GPIOX_8 */
> +		"PIN_21", /* GPIOX_9 */
> +		"PIN_24", /* GPIOX_10 */
> +		"PIN_23", /* GPIOX_11 */
> +		"PIN_8",  /* GPIOX_12 */
> +		"PIN_10", /* GPIOX_13 */
> +		"PIN_29", /* GPIOX_14 */
> +		"PIN_31", /* GPIOX_15 */
> +		"PIN_12", /* GPIOX_16 */
> +		"PIN_3",  /* GPIOX_17 */
> +		"PIN_5",  /* GPIOX_18 */
> +		"PIN_35"; /* GPIOX_19 */
> +};
> +
> +&gpio_ao {
> +	gpio-line-names =
> +		/* GPIOAO */
> +		"", "", "", "",
> +		"PIN_47", /* GPIOAO_4 */
> +		"", "",
> +		"PIN_45", /* GPIOAO_7 */
> +		"PIN_46", /* GPIOAO_8 */
> +		"PIN_44", /* GPIOAO_9 */
> +		"PIN_42", /* GPIOAO_10 */
> +		"",
> +		/* GPIOE */
> +		"", "", "";
> +};
> +
> +&hdmi_tx {
> +	status = "okay";
> +	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
> +	pinctrl-names = "default";
> +	hdmi-supply = <&vcc_5v>;
> +};
> +
> +&hdmi_tx_tmds_port {
> +	hdmi_tx_tmds_out: endpoint {
> +		remote-endpoint = <&hdmi_connector_in>;
> +	};
> +};
> +
> +&ir {
> +	status = "okay";
> +	pinctrl-0 = <&remote_input_ao_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&pwm_AO_cd {
> +	pinctrl-0 = <&pwm_ao_d_e_pins>;
> +	pinctrl-names = "default";
> +	clocks = <&xtal>;
> +	clock-names = "clkin1";
> +	status = "okay";
> +};
> +
> +&saradc {
> +	status = "okay";
> +};
> +
> +/* SD card */
> +&sd_emmc_b {
> +	status = "okay";
> +	pinctrl-0 = <&sdcard_c_pins>;
> +	pinctrl-1 = <&sdcard_clk_gate_c_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	max-frequency = <200000000>;
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	disable-wp;
> +
> +	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
> +	vmmc-supply = <&tflash_vdd>;
> +	vqmmc-supply = <&tf_io>;
> +};
> +
> +/* eMMC */
> +&sd_emmc_c {
> +	status = "okay";
> +	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_8b_pins>, <&emmc_ds_pins>;
> +	pinctrl-1 = <&emmc_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +
> +	bus-width = <8>;
> +	cap-mmc-highspeed;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	max-frequency = <200000000>;
> +	disable-wp;
> +
> +	mmc-pwrseq = <&emmc_pwrseq>;
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&flash_1v8>;
> +};
> +
> +&tdmif_b {
> +	status = "okay";
> +};
> +
> +&tdmout_b {
> +	status = "okay";
> +};
> +
> +&tohdmitx {
> +	status = "okay";
> +};
> +
> +&uart_AO {
> +	status = "okay";
> +	pinctrl-0 = <&uart_ao_a_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&usb {
> +	status = "okay";
> +	vbus-supply = <&usb_pwr_en>;
> +};
> +
> +&usb2_phy0 {
> +	phy-supply = <&vcc_5v>;
> +};
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
