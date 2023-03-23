Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE37EC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 08:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwHsFa7UxNOEHgVQIQCMLFmm17sOZJhFbTwJ0JqRGUQ=; b=i9gy70n8dmI7T0g8G13t520sCW
	BOjCoAIHzQUnwf5MYRqDl9dd66/LMUwvUXB7tHzRFu2lWjETBLyKWTObImvGshE86p7ZAm+HnlP+C
	LW5HHocK0l/K375MXTkfw5XNGJz8iswWznEZfTsHjESy4sVhqpT+/vL71RlSaohsM6/InYz+1dfSo
	mziQExnDJed1Qu1dXEq07ZpaM03JSKl4ogrgXuWgxeJSLwKaK7x7ifLO+4Ale0NckI0/ixNFvu7bw
	SojWAYXGsoew71tcKuTXze8+lnQiyJcjV2gDcJIbAJBli2FyEW1LD4IDdNklo4ggYhY/ALZcf6Fp+
	l8HX09yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGef-001KES-2M;
	Thu, 23 Mar 2023 08:50:41 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGeb-001KD6-02
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 08:50:40 +0000
Received: by mail-wr1-x429.google.com with SMTP id y14so19587477wrq.4
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 01:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679561433;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XFckJZKK7UonEC8OF/TtCOOn/k7YytObM/TRt7VPAvc=;
        b=Tt6T9jiP7jYtREQs9WhlW5bBZIlJAkK7J1WxsHzQNFzdlMExb012NcsTAzKepVdxhK
         MMn7la62vB+RR60Kj5UcJDnhq3zO6EDcYQOOL6mDvCEDAdirti/w8CHUjLT2XgFSql0t
         kNBOZO10YD3tWfaszznYVhmqc7OsB9axoSEmYpmFptP0YASZUHvPFebGcucQmyYba2yF
         j6bceoSwfxGu9aQ4v20CGooiNNgc6UG+689fOC3S6D47tDbZ0umOPNfjSsaIlWJb0vlD
         L2irmDzJNqdwdQMeyRf6eelTSd1pCVLx+KuKyO12bZPdMcptqhu/wOkVzDDxBBqpY/MC
         I+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679561433;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XFckJZKK7UonEC8OF/TtCOOn/k7YytObM/TRt7VPAvc=;
        b=2YXwaLyUV/wgKCtLkp0hA1OHGRPUHWQk70HYCKjCL7FhfjJ7X3cZCCY9Jb4rE5XVV9
         pCvcQEX8z8QrMwsJ+1Jt399kptzhs75u0uWTOulodFKLbxr3wl7XWnIHGrENM8ybICnW
         EqvGKDwIsq0LeEoVPrizUW4s9eu3BHWntHiSQ76KBVeVtBO2hRsZ0Tr6nR+1ccIivbfG
         lEQQU8tMSI5wVU0YRTmuQsBYy35aRW4Dr/rCBJ8m5zQw6hUIZr5+wYD2KeSviZJRXi/j
         QzUTcHQjf4hwBCJOVDR0QfuNG3Ec5ch+/IdScMhKCbv9IF325U026XXgLcI4oiPXLAXp
         glnA==
X-Gm-Message-State: AAQBX9fi/U1EO6vFI4QZb4q88TvWT/44cpDVTefg5u8kXCLLYJVysmK8
	xmbHzdYA1lhKs133DGYgIAkk0Q==
X-Google-Smtp-Source: AKy350YvJdfu6zGDxBs5suyVGYAwnsaZP4ywILdKl/J/O5AaJa1XlS84J4Gxne1HVd+c6Vkdq6nI2Q==
X-Received: by 2002:adf:f1d1:0:b0:2c8:50bf:2137 with SMTP id z17-20020adff1d1000000b002c850bf2137mr1776415wro.46.1679561432726;
        Thu, 23 Mar 2023 01:50:32 -0700 (PDT)
Received: from [192.168.7.188] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id a4-20020adffb84000000b002d322b9a7f5sm15638997wrr.88.2023.03.23.01.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 01:50:32 -0700 (PDT)
Message-ID: <df242210-4493-2658-1554-e9de7537ddf8@linaro.org>
Date: Thu, 23 Mar 2023 09:50:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 02/13] ARM: dts: add support for BananaPi M2-Pro
Content-Language: en-US
To: u-boot-amlogic@groups.io, christianshewitt@gmail.com,
 u-boot@lists.denx.de, linux-amlogic@lists.infradead.org
References: <20230323065458.776029-1-christianshewitt@gmail.com>
 <20230323065458.776029-3-christianshewitt@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230323065458.776029-3-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_015037_059615_9FFE3EAA 
X-CRM114-Status: GOOD (  20.03  )
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

On 23/03/2023 07:54, Christian Hewitt wrote:
> Import the board dts from the linux-amlogic/for-next (6.4-rc1)
> branch. This involves spliting the BPI-M5 dts into a dtsi and
> then reusing this for the M2-Pro.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   arch/arm/dts/Makefile                         |   5 +-
>   .../dts/meson-sm1-bananapi-m2-pro-u-boot.dtsi |  14 +
>   arch/arm/dts/meson-sm1-bananapi-m2-pro.dts    |  97 ++++
>   arch/arm/dts/meson-sm1-bananapi-m5.dts        | 427 +----------------
>   arch/arm/dts/meson-sm1-bananapi.dtsi          | 435 ++++++++++++++++++
>   5 files changed, 550 insertions(+), 428 deletions(-)
>   create mode 100644 arch/arm/dts/meson-sm1-bananapi-m2-pro-u-boot.dtsi
>   create mode 100644 arch/arm/dts/meson-sm1-bananapi-m2-pro.dts
>   create mode 100644 arch/arm/dts/meson-sm1-bananapi.dtsi
> 
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 0c149b636a..d6139429e5 100644
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -205,14 +205,15 @@ dtb-$(CONFIG_ARCH_MESON) += \
>   	meson-g12a-sei510.dtb \
>   	meson-g12a-u200.dtb \
>   	meson-g12b-a311d-khadas-vim3.dtb \
> +	meson-g12b-bananapi-cm4-cm4io.dtb \
> +	meson-g12b-gsking-x.dtb \
>   	meson-g12b-gtking.dtb \
>   	meson-g12b-gtking-pro.dtb \
> -	meson-g12b-gsking-x.dtb \
>   	meson-g12b-odroid-go-ultra.dtb \
>   	meson-g12b-odroid-n2.dtb \
>   	meson-g12b-odroid-n2l.dtb \
>   	meson-g12b-odroid-n2-plus.dtb \
> -	meson-g12b-bananapi-cm4-cm4io.dtb \
> +	meson-sm1-bananapi-m2-pro.dtb \
>   	meson-sm1-bananapi-m5.dtb \
>   	meson-sm1-khadas-vim3l.dtb \
>   	meson-sm1-odroid-c4.dtb \
> diff --git a/arch/arm/dts/meson-sm1-bananapi-m2-pro-u-boot.dtsi b/arch/arm/dts/meson-sm1-bananapi-m2-pro-u-boot.dtsi
> new file mode 100644
> index 0000000000..4a1aeda565
> --- /dev/null
> +++ b/arch/arm/dts/meson-sm1-bananapi-m2-pro-u-boot.dtsi
> @@ -0,0 +1,14 @@
> +
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2021 BayLibre, SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + */
> +
> +#include "meson-sm1-u-boot.dtsi"
> +
> +&ethmac {
> +	snps,reset-gpio = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
> +	snps,reset-delays-us = <0 10000 1000000>;
> +	snps,reset-active-low;
> +};
> diff --git a/arch/arm/dts/meson-sm1-bananapi-m2-pro.dts b/arch/arm/dts/meson-sm1-bananapi-m2-pro.dts
> new file mode 100644
> index 0000000000..586034316e
> --- /dev/null
> +++ b/arch/arm/dts/meson-sm1-bananapi-m2-pro.dts
> @@ -0,0 +1,97 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2021 BayLibre SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-sm1-bananapi.dtsi"
> +#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
> +
> +/ {
> +	compatible = "bananapi,bpi-m2-pro", "amlogic,sm1";
> +	model = "Banana Pi BPI-M2-PRO";
> +
> +	sound {
> +		compatible = "amlogic,axg-sound-card";
> +		model = "BPI-M2-PRO";
> +		audio-aux-devs = <&tdmout_b>;
> +		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
> +				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
> +				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
> +				"TDM_B Playback", "TDMOUT_B OUT";
> +
> +		assigned-clocks = <&clkc CLKID_MPLL2>,
> +				  <&clkc CLKID_MPLL0>,
> +				  <&clkc CLKID_MPLL1>;
> +		assigned-clock-parents = <0>, <0>, <0>;
> +		assigned-clock-rates = <294912000>,
> +				       <270950400>,
> +				       <393216000>;
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
> +
> +			codec {
> +				sound-dai = <&hdmi_tx>;
> +			};
> +		};
> +	};
> +};
> +
> +&clkc_audio {
> +	status = "okay";
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
> diff --git a/arch/arm/dts/meson-sm1-bananapi-m5.dts b/arch/arm/dts/meson-sm1-bananapi-m5.dts
> index effaa138b5..f045bf8516 100644
> --- a/arch/arm/dts/meson-sm1-bananapi-m5.dts
> +++ b/arch/arm/dts/meson-sm1-bananapi-m5.dts
> @@ -6,10 +6,7 @@
>   
>   /dts-v1/;
>   
> -#include "meson-sm1.dtsi"
> -#include <dt-bindings/leds/common.h>
> -#include <dt-bindings/input/linux-event-codes.h>
> -#include <dt-bindings/gpio/meson-g12a-gpio.h>
> +#include "meson-sm1-bananapi.dtsi"
>   #include <dt-bindings/sound/meson-g12a-toacodec.h>
>   #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>   
> @@ -17,28 +14,6 @@
>   	compatible = "bananapi,bpi-m5", "amlogic,sm1";
>   	model = "Banana Pi BPI-M5";
>   
> -	adc_keys {
> -		compatible = "adc-keys";
> -		io-channels = <&saradc 2>;
> -		io-channel-names = "buttons";
> -		keyup-threshold-microvolt = <1800000>;
> -
> -		key {
> -			label = "SW3";
> -			linux,code = <BTN_3>;
> -			press-threshold-microvolt = <1700000>;
> -		};
> -	};
> -
> -	aliases {
> -		serial0 = &uart_AO;
> -		ethernet0 = &ethmac;
> -	};
> -
> -	chosen {
> -		stdout-path = "serial0:115200n8";
> -	};
> -
>   	/* TOFIX: handle CVBS_DET on SARADC channel 0 */
>   	cvbs-connector {
>   		compatible = "composite-video-connector";
> @@ -50,150 +25,6 @@
>   		};
>   	};
>   
> -	emmc_pwrseq: emmc-pwrseq {
> -		compatible = "mmc-pwrseq-emmc";
> -		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
> -	};
> -
> -	gpio-keys {
> -		compatible = "gpio-keys";
> -
> -		key {
> -			label = "SW1";
> -			linux,code = <BTN_1>;
> -			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_LOW>;
> -			interrupt-parent = <&gpio_intc>;
> -			interrupts = <3 IRQ_TYPE_EDGE_BOTH>;
> -		};
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
> -	leds {
> -		compatible = "gpio-leds";
> -
> -		green {
> -			color = <LED_COLOR_ID_GREEN>;
> -			function = LED_FUNCTION_STATUS;
> -			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
> -		};
> -
> -		blue {
> -			color = <LED_COLOR_ID_BLUE>;
> -			function = LED_FUNCTION_STATUS;
> -			gpios = <&gpio_ao GPIOAO_11 GPIO_ACTIVE_LOW>;
> -			linux,default-trigger = "heartbeat";
> -		};
> -	};
> -
> -	memory@0 {
> -		device_type = "memory";
> -		reg = <0x0 0x0 0x0 0x40000000>;
> -	};
> -
> -	emmc_1v8: regulator-emmc_1v8 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "EMMC_1V8";
> -		regulator-min-microvolt = <1800000>;
> -		regulator-max-microvolt = <1800000>;
> -		vin-supply = <&vddao_3v3>;
> -		regulator-always-on;
> -	};
> -
> -	dc_in: regulator-dc_in {
> -		compatible = "regulator-fixed";
> -		regulator-name = "DC_IN";
> -		regulator-min-microvolt = <5000000>;
> -		regulator-max-microvolt = <5000000>;
> -		regulator-always-on;
> -	};
> -
> -	vddio_c: regulator-vddio_c {
> -		compatible = "regulator-gpio";
> -		regulator-name = "VDDIO_C";
> -		regulator-min-microvolt = <1800000>;
> -		regulator-max-microvolt = <3300000>;
> -
> -		enable-gpio = <&gpio GPIOE_2 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -		regulator-always-on;
> -
> -		gpios = <&gpio_ao GPIOAO_6 GPIO_OPEN_DRAIN>;
> -		gpios-states = <1>;
> -
> -		states = <1800000 0>,
> -			 <3300000 1>;
> -	};
> -
> -	tflash_vdd: regulator-tflash_vdd {
> -		compatible = "regulator-fixed";
> -		regulator-name = "TFLASH_VDD";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		vin-supply = <&dc_in>;
> -		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
> -		enable-active-high;
> -		regulator-always-on;
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
> -		vin-supply = <&dc_in>;
> -		regulator-always-on;
> -	};
> -
> -	vddcpu: regulator-vddcpu {
> -		/*
> -		 * SY8120B1ABC DC/DC Regulator.
> -		 */
> -		compatible = "pwm-regulator";
> -
> -		regulator-name = "VDDCPU";
> -		regulator-min-microvolt = <690000>;
> -		regulator-max-microvolt = <1050000>;
> -
> -		vin-supply = <&dc_in>;
> -
> -		pwms = <&pwm_AO_cd 1 1250 0>;
> -		pwm-dutycycle-range = <100 0>;
> -
> -		regulator-boot-on;
> -		regulator-always-on;
> -	};
> -
> -	/* USB Hub Power Enable */
> -	vl_pwr_en: regulator-vl_pwr_en {
> -		compatible = "regulator-fixed";
> -		regulator-name = "VL_PWR_EN";
> -		regulator-min-microvolt = <5000000>;
> -		regulator-max-microvolt = <5000000>;
> -		vin-supply = <&dc_in>;
> -
> -		gpio = <&gpio GPIOH_6 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -	};
> -
>   	sound {
>   		compatible = "amlogic,axg-sound-card";
>   		model = "BPI-M5";
> @@ -233,7 +64,6 @@
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> -		status = "okay";
>   
>   		dai-link-0 {
>   			sound-dai = <&frddr_a>;
> @@ -319,68 +149,17 @@
>   	status = "okay";
>   };
>   
> -&arb {
> -	status = "okay";
> -};
>   
>   &clkc_audio {
>   	status = "okay";
>   };
>   
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
>   &cvbs_vdac_port {
>   	cvbs_vdac_out: endpoint {
>   		remote-endpoint = <&cvbs_connector_in>;
>   	};
>   };
>   
> -&ext_mdio {
> -	external_phy: ethernet-phy@0 {
> -		/* Realtek RTL8211F (0x001cc916) */
> -		reg = <0>;
> -		max-speed = <1000>;
> -
> -		interrupt-parent = <&gpio_intc>;
> -		/* MAC_INTR on GPIOZ_14 */
> -		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
> -	};
> -};
> -
> -&ethmac {
> -	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
> -	pinctrl-names = "default";
> -	status = "okay";
> -	phy-mode = "rgmii-txid";
> -	phy-handle = <&external_phy>;
> -};
> -
>   &frddr_a {
>   	status = "okay";
>   };
> @@ -393,191 +172,6 @@
>   	status = "okay";
>   };
>   
> -&gpio {
> -	gpio-line-names =
> -		/* GPIOZ */
> -		"ETH_MDIO", /* GPIOZ_0 */
> -		"ETH_MDC", /* GPIOZ_1 */
> -		"ETH_RXCLK", /* GPIOZ_2 */
> -		"ETH_RX_DV", /* GPIOZ_3 */
> -		"ETH_RXD0", /* GPIOZ_4 */
> -		"ETH_RXD1", /* GPIOZ_5 */
> -		"ETH_RXD2", /* GPIOZ_6 */
> -		"ETH_RXD3", /* GPIOZ_7 */
> -		"ETH_TXCLK", /* GPIOZ_8 */
> -		"ETH_TXEN", /* GPIOZ_9 */
> -		"ETH_TXD0", /* GPIOZ_10 */
> -		"ETH_TXD1", /* GPIOZ_11 */
> -		"ETH_TXD2", /* GPIOZ_12 */
> -		"ETH_TXD3", /* GPIOZ_13 */
> -		"ETH_INTR", /* GPIOZ_14 */
> -		"ETH_NRST", /* GPIOZ_15 */
> -		/* GPIOH */
> -		"HDMI_SDA", /* GPIOH_0 */
> -		"HDMI_SCL", /* GPIOH_1 */
> -		"HDMI_HPD", /* GPIOH_2 */
> -		"HDMI_CEC", /* GPIOH_3 */
> -		"VL-RST_N", /* GPIOH_4 */
> -		"CON1-P36", /* GPIOH_5 */
> -		"VL-PWREN", /* GPIOH_6 */
> -		"WiFi_3V3_1V8", /* GPIOH_7 */
> -		"TFLASH_VDD_EN", /* GPIOH_8 */
> -		/* BOOT */
> -		"eMMC_D0", /* BOOT_0 */
> -		"eMMC_D1", /* BOOT_1 */
> -		"eMMC_D2", /* BOOT_2 */
> -		"eMMC_D3", /* BOOT_3 */
> -		"eMMC_D4", /* BOOT_4 */
> -		"eMMC_D5", /* BOOT_5 */
> -		"eMMC_D6", /* BOOT_6 */
> -		"eMMC_D7", /* BOOT_7 */
> -		"eMMC_CLK", /* BOOT_8 */
> -		"",
> -		"eMMC_CMD", /* BOOT_10 */
> -		"",
> -		"eMMC_RST#", /* BOOT_12 */
> -		"eMMC_DS", /* BOOT_13 */
> -		/* GPIOC */
> -		"SD_D0_B", /* GPIOC_0 */
> -		"SD_D1_B", /* GPIOC_1 */
> -		"SD_D2_B", /* GPIOC_2 */
> -		"SD_D3_B", /* GPIOC_3 */
> -		"SD_CLK_B", /* GPIOC_4 */
> -		"SD_CMD_B", /* GPIOC_5 */
> -		"CARD_EN_DET", /* GPIOC_6 */
> -		"",
> -		/* GPIOA */
> -		"", "", "", "", "", "", "", "",
> -		"", "", "", "", "", "",
> -		"CON1-P27", /* GPIOA_14 */
> -		"CON1-P28", /* GPIOA_15 */
> -		/* GPIOX */
> -		"CON1-P16", /* GPIOX_0 */
> -		"CON1-P18", /* GPIOX_1 */
> -		"CON1-P22", /* GPIOX_2 */
> -		"CON1-P11", /* GPIOX_3 */
> -		"CON1-P13", /* GPIOX_4 */
> -		"CON1-P07", /* GPIOX_5 */
> -		"CON1-P33", /* GPIOX_6 */
> -		"CON1-P15", /* GPIOX_7 */
> -		"CON1-P19", /* GPIOX_8 */
> -		"CON1-P21", /* GPIOX_9 */
> -		"CON1-P24", /* GPIOX_10 */
> -		"CON1-P23", /* GPIOX_11 */
> -		"CON1-P08", /* GPIOX_12 */
> -		"CON1-P10", /* GPIOX_13 */
> -		"CON1-P29", /* GPIOX_14 */
> -		"CON1-P31", /* GPIOX_15 */
> -		"CON1-P26", /* GPIOX_16 */
> -		"CON1-P03", /* GPIOX_17 */
> -		"CON1-P05", /* GPIOX_18 */
> -		"CON1-P32"; /* GPIOX_19 */
> -
> -	/*
> -	 * WARNING: The USB Hub on the BPI-M5 needs a reset signal
> -	 * to be turned high in order to be detected by the USB Controller
> -	 * This signal should be handled by a USB specific power sequence
> -	 * in order to reset the Hub when USB bus is powered down.
> -	 */
> -	usb-hub {
> -		gpio-hog;
> -		gpios = <GPIOH_4 GPIO_ACTIVE_HIGH>;
> -		output-high;
> -		line-name = "usb-hub-reset";
> -	};
> -};
> -
> -&gpio_ao {
> -	gpio-line-names =
> -		/* GPIOAO */
> -		"DEBUG TX", /* GPIOAO_0 */
> -		"DEBUG RX", /* GPIOAO_1 */
> -		"SYS_LED2", /* GPIOAO_2 */
> -		"UPDATE_KEY", /* GPIOAO_3 */
> -		"CON1-P40", /* GPIOAO_4 */
> -		"IR_IN", /* GPIOAO_5 */
> -		"TF_3V3N_1V8_EN", /* GPIOAO_6 */
> -		"CON1-P35", /* GPIOAO_7 */
> -		"CON1-P12", /* GPIOAO_8 */
> -		"CON1-P37", /* GPIOAO_9 */
> -		"CON1-P38", /* GPIOAO_10 */
> -		"SYS_LED", /* GPIOAO_11 */
> -		/* GPIOE */
> -		"VDDEE_PWM", /* GPIOE_0 */
> -		"VDDCPU_PWM", /* GPIOE_1 */
> -		"TF_PWR_EN"; /* GPIOE_2 */
> -};
> -
> -&hdmi_tx {
> -	status = "okay";
> -	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
> -	pinctrl-names = "default";
> -	hdmi-supply = <&dc_in>;
> -};
> -
> -&hdmi_tx_tmds_port {
> -	hdmi_tx_tmds_out: endpoint {
> -		remote-endpoint = <&hdmi_connector_in>;
> -	};
> -};
> -
> -&ir {
> -	status = "okay";
> -	pinctrl-0 = <&remote_input_ao_pins>;
> -	pinctrl-names = "default";
> -};
> -
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
> -	vref-supply = <&vddao_1v8>;
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
> -	max-frequency = <50000000>;
> -	disable-wp;
> -
> -	/* TOFIX: SD card is barely usable in SDR modes */
> -
> -	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
> -	vmmc-supply = <&tflash_vdd>;
> -	vqmmc-supply = <&vddio_c>;
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
> -	vmmc-supply = <&vddao_3v3>;
> -	vqmmc-supply = <&emmc_1v8>;
> -};
> -
>   &tdmif_b {
>   	status = "okay";
>   };
> @@ -625,22 +219,3 @@
>   &toddr_c {
>   	status = "okay";
>   };
> -
> -&uart_AO {
> -	status = "okay";
> -	pinctrl-0 = <&uart_ao_a_pins>;
> -	pinctrl-names = "default";
> -};
> -
> -&usb {
> -	status = "okay";
> -};
> -
> -&usb2_phy0 {
> -	phy-supply = <&dc_in>;
> -};
> -
> -&usb2_phy1 {
> -	/* Enable the hub which is connected to this port */
> -	phy-supply = <&vl_pwr_en>;
> -};
> diff --git a/arch/arm/dts/meson-sm1-bananapi.dtsi b/arch/arm/dts/meson-sm1-bananapi.dtsi
> new file mode 100644
> index 0000000000..17045ff81c
> --- /dev/null
> +++ b/arch/arm/dts/meson-sm1-bananapi.dtsi
> @@ -0,0 +1,435 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2021 BayLibre SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + */
> +
> +#include "meson-sm1.dtsi"
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/gpio/meson-g12a-gpio.h>
> +
> +/ {
> +	adc-keys {
> +		compatible = "adc-keys";
> +		io-channels = <&saradc 2>;
> +		io-channel-names = "buttons";
> +		keyup-threshold-microvolt = <1800000>;
> +
> +		button-sw3 {
> +			label = "SW3";
> +			linux,code = <BTN_3>;
> +			press-threshold-microvolt = <1700000>;
> +		};
> +	};
> +
> +	aliases {
> +		serial0 = &uart_AO;
> +		ethernet0 = &ethmac;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	emmc_pwrseq: emmc-pwrseq {
> +		compatible = "mmc-pwrseq-emmc";
> +		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		key {
> +			label = "SW1";
> +			linux,code = <BTN_1>;
> +			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_LOW>;
> +			interrupt-parent = <&gpio_intc>;
> +			interrupts = <3 IRQ_TYPE_EDGE_BOTH>;
> +		};
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
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-green {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_STATUS;
> +			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		led-blue {
> +			color = <LED_COLOR_ID_BLUE>;
> +			function = LED_FUNCTION_STATUS;
> +			gpios = <&gpio_ao GPIOAO_11 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x0 0x0 0x40000000>;
> +	};
> +
> +	emmc_1v8: regulator-emmc_1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "EMMC_1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vddao_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	dc_in: regulator-dc_in {
> +		compatible = "regulator-fixed";
> +		regulator-name = "DC_IN";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	vddio_c: regulator-vddio_c {
> +		compatible = "regulator-gpio";
> +		regulator-name = "VDDIO_C";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		enable-gpios = <&gpio_ao GPIOE_2 GPIO_OPEN_DRAIN>;
> +		enable-active-high;
> +		regulator-always-on;
> +
> +		gpios = <&gpio_ao GPIOAO_6 GPIO_OPEN_DRAIN>;
> +		gpios-states = <1>;
> +
> +		states = <1800000 0>,
> +			 <3300000 1>;
> +	};
> +
> +	tflash_vdd: regulator-tflash_vdd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "TFLASH_VDD";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&dc_in>;
> +		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
> +		enable-active-high;
> +		regulator-always-on;
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
> +		vin-supply = <&dc_in>;
> +		regulator-always-on;
> +	};
> +
> +	vddcpu: regulator-vddcpu {
> +		/*
> +		 * SY8120B1ABC DC/DC Regulator.
> +		 */
> +		compatible = "pwm-regulator";
> +
> +		regulator-name = "VDDCPU";
> +		regulator-min-microvolt = <690000>;
> +		regulator-max-microvolt = <1050000>;
> +
> +		pwm-supply = <&dc_in>;
> +
> +		pwms = <&pwm_AO_cd 1 1250 0>;
> +		pwm-dutycycle-range = <100 0>;
> +
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	/* USB Hub Power Enable */
> +	vl_pwr_en: regulator-vl_pwr_en {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VL_PWR_EN";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&dc_in>;
> +
> +		gpio = <&gpio GPIOH_6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +};
> +
> +&arb {
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
> +	phy-mode = "rgmii-txid";
> +	phy-handle = <&external_phy>;
> +};
> +
> +&gpio {
> +	gpio-line-names =
> +		/* GPIOZ */
> +		"ETH_MDIO", /* GPIOZ_0 */
> +		"ETH_MDC", /* GPIOZ_1 */
> +		"ETH_RXCLK", /* GPIOZ_2 */
> +		"ETH_RX_DV", /* GPIOZ_3 */
> +		"ETH_RXD0", /* GPIOZ_4 */
> +		"ETH_RXD1", /* GPIOZ_5 */
> +		"ETH_RXD2", /* GPIOZ_6 */
> +		"ETH_RXD3", /* GPIOZ_7 */
> +		"ETH_TXCLK", /* GPIOZ_8 */
> +		"ETH_TXEN", /* GPIOZ_9 */
> +		"ETH_TXD0", /* GPIOZ_10 */
> +		"ETH_TXD1", /* GPIOZ_11 */
> +		"ETH_TXD2", /* GPIOZ_12 */
> +		"ETH_TXD3", /* GPIOZ_13 */
> +		"ETH_INTR", /* GPIOZ_14 */
> +		"ETH_NRST", /* GPIOZ_15 */
> +		/* GPIOH */
> +		"HDMI_SDA", /* GPIOH_0 */
> +		"HDMI_SCL", /* GPIOH_1 */
> +		"HDMI_HPD", /* GPIOH_2 */
> +		"HDMI_CEC", /* GPIOH_3 */
> +		"VL-RST_N", /* GPIOH_4 */
> +		"CON1-P36", /* GPIOH_5 */
> +		"VL-PWREN", /* GPIOH_6 */
> +		"WiFi_3V3_1V8", /* GPIOH_7 */
> +		"TFLASH_VDD_EN", /* GPIOH_8 */
> +		/* BOOT */
> +		"eMMC_D0", /* BOOT_0 */
> +		"eMMC_D1", /* BOOT_1 */
> +		"eMMC_D2", /* BOOT_2 */
> +		"eMMC_D3", /* BOOT_3 */
> +		"eMMC_D4", /* BOOT_4 */
> +		"eMMC_D5", /* BOOT_5 */
> +		"eMMC_D6", /* BOOT_6 */
> +		"eMMC_D7", /* BOOT_7 */
> +		"eMMC_CLK", /* BOOT_8 */
> +		"",
> +		"eMMC_CMD", /* BOOT_10 */
> +		"",
> +		"eMMC_RST#", /* BOOT_12 */
> +		"eMMC_DS", /* BOOT_13 */
> +		"", "",
> +		/* GPIOC */
> +		"SD_D0_B", /* GPIOC_0 */
> +		"SD_D1_B", /* GPIOC_1 */
> +		"SD_D2_B", /* GPIOC_2 */
> +		"SD_D3_B", /* GPIOC_3 */
> +		"SD_CLK_B", /* GPIOC_4 */
> +		"SD_CMD_B", /* GPIOC_5 */
> +		"CARD_EN_DET", /* GPIOC_6 */
> +		"",
> +		/* GPIOA */
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "",
> +		"CON1-P27", /* GPIOA_14 */
> +		"CON1-P28", /* GPIOA_15 */
> +		/* GPIOX */
> +		"CON1-P16", /* GPIOX_0 */
> +		"CON1-P18", /* GPIOX_1 */
> +		"CON1-P22", /* GPIOX_2 */
> +		"CON1-P11", /* GPIOX_3 */
> +		"CON1-P13", /* GPIOX_4 */
> +		"CON1-P07", /* GPIOX_5 */
> +		"CON1-P33", /* GPIOX_6 */
> +		"CON1-P15", /* GPIOX_7 */
> +		"CON1-P19", /* GPIOX_8 */
> +		"CON1-P21", /* GPIOX_9 */
> +		"CON1-P24", /* GPIOX_10 */
> +		"CON1-P23", /* GPIOX_11 */
> +		"CON1-P08", /* GPIOX_12 */
> +		"CON1-P10", /* GPIOX_13 */
> +		"CON1-P29", /* GPIOX_14 */
> +		"CON1-P31", /* GPIOX_15 */
> +		"CON1-P26", /* GPIOX_16 */
> +		"CON1-P03", /* GPIOX_17 */
> +		"CON1-P05", /* GPIOX_18 */
> +		"CON1-P32"; /* GPIOX_19 */
> +
> +	/*
> +	 * WARNING: The USB Hub needs a reset signal to be turned high in
> +	 * order to be detected by the USB Controller. This signal should
> +	 * be handled by a USB specific power sequence to reset the Hub
> +	 * when the USB bus is powered down.
> +	 */
> +	usb-hub-hog {
> +		gpio-hog;
> +		gpios = <GPIOH_4 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "usb-hub-reset";
> +	};
> +};
> +
> +&gpio_ao {
> +	gpio-line-names =
> +		/* GPIOAO */
> +		"DEBUG TX", /* GPIOAO_0 */
> +		"DEBUG RX", /* GPIOAO_1 */
> +		"SYS_LED2", /* GPIOAO_2 */
> +		"UPDATE_KEY", /* GPIOAO_3 */
> +		"CON1-P40", /* GPIOAO_4 */
> +		"IR_IN", /* GPIOAO_5 */
> +		"TF_3V3N_1V8_EN", /* GPIOAO_6 */
> +		"CON1-P35", /* GPIOAO_7 */
> +		"CON1-P12", /* GPIOAO_8 */
> +		"CON1-P37", /* GPIOAO_9 */
> +		"CON1-P38", /* GPIOAO_10 */
> +		"SYS_LED", /* GPIOAO_11 */
> +		/* GPIOE */
> +		"VDDEE_PWM", /* GPIOE_0 */
> +		"VDDCPU_PWM", /* GPIOE_1 */
> +		"TF_PWR_EN"; /* GPIOE_2 */
> +};
> +
> +&hdmi_tx {
> +	status = "okay";
> +	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
> +	pinctrl-names = "default";
> +	hdmi-supply = <&dc_in>;
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
> +	vref-supply = <&vddao_1v8>;
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
> +	max-frequency = <50000000>;
> +	disable-wp;
> +
> +	/* TOFIX: SD card is barely usable in SDR modes */
> +
> +	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
> +	vmmc-supply = <&tflash_vdd>;
> +	vqmmc-supply = <&vddio_c>;
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
> +	vmmc-supply = <&vddao_3v3>;
> +	vqmmc-supply = <&emmc_1v8>;
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
> +};
> +
> +&usb2_phy0 {
> +	phy-supply = <&dc_in>;
> +};
> +
> +&usb2_phy1 {
> +	/* Enable the hub which is connected to this port */
> +	phy-supply = <&vl_pwr_en>;
> +};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
