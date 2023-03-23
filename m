Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A25C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 08:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPhVupwmZXmq6sMIS64ng8bm5S6KhXTKwypk5JUfFaY=; b=l7X83383mECMkC3TB9WKxv0wb/
	ehAtXy43NHWs0oMNRZ92oEm2IA+ZJjJEweCGjbK1oGP62lIwM2ALmGkR65EFg2RKRndv3HtStb44d
	EpgJfFGzkoRE3804CzHkplUsM1xPoTuKa7cgyQDDT8zC8h3UWIwOsH5s+3tCyTzNnJL2FzQ79Plaw
	UI976xMQ+XNMNHA9a8mIX11F2ce+wnnays781sQs7tLSLWlacZ3SLcj5oTgjJ11ZOAbp//pC0jKgD
	584nCBDF9JPkzuB7Rwr3GfOEFi9VCqXFZsblQqvfkAtyIONFTeeP0HVWcZIyCa4hjInvsesl1Ctcn
	/C+c7NqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGf2-001KKj-0H;
	Thu, 23 Mar 2023 08:51:04 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGey-001KJD-2t
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 08:51:03 +0000
Received: by mail-wr1-x433.google.com with SMTP id r29so19559655wra.13
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 01:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679561457;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S1Dg4WZLj/pIYUjQZnVGBJfT+J7h+1Vzckypdn+Otys=;
        b=YBRzrefv0LQGpQT49rYhNEyEXhOayh3z0lvDM2sp5Tw9NutImXJ7ciWgxEkiP36uwE
         uyZdtQiAvj4Mxj64/IPY3wO/NHfAfZAfUZlzucgXD3/E+Wft8mjfYWSHwcxXQi4xPXum
         zlLVgm026PtY5Oji4/Rvo3UMNq5BOhO5OCgy2iN38m4k2O+WJPQMncTr2ahqwrLYQuOx
         217jKq+WEbW8vkMxOBAgFvOvuCd75Etw6+oeuQuKgU08pxbrjMfWI8k2wS+wYqJRofCV
         YuA2apkv51ybFaAIlOlm+jxSlMvgpVzn3dYIboIcJf1myeMN8YLPaPBhS34U85Z12I4h
         0ouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679561457;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1Dg4WZLj/pIYUjQZnVGBJfT+J7h+1Vzckypdn+Otys=;
        b=4YcZS8MTksAvan2S19EFusvRUmNV0EaOjlMwIo72sup8AjsR0p8l3UpgrhjmxgH/lr
         FQPHmvDicGm4D4hgHNlIaw01fFjdmxgbMZtiifjjEAEvLkusPyjLvOof6aS8ZVpZ4b2z
         svuKiOUL1YDYYyNJNekjaCbbJS2osmu9+2/CvSAn8evZ5Is+TQx71GLdvBv5nSGtaYmX
         5Umuxznmub4DWODyL3B1FPLHezhEf0TrYD0CRtWBSRMb49iYNu6BSh0TeDZTjewMrEj9
         LfyXXcMLDNx4T5lZtXi25RfIaqQPPy+weQ0Hp9sK13HAOVacbyOQt9DFD6RPxoTNIA/6
         5ByA==
X-Gm-Message-State: AAQBX9dz7o4tlWvGGGxO4VOrG7BVRUxWB7PRHkLqJBcHE5WN7jAd4T41
	0B8tWOAhlinoA8uVvAfY90en/g==
X-Google-Smtp-Source: AKy350bc/uVG7M/K48Jn4Qu67tzzEV6uHyfK3WJ6MDPO+u2B/2XAQZ8kWnPO6L0xd6y02s6U4INgOg==
X-Received: by 2002:a5d:4382:0:b0:2da:f0b5:2595 with SMTP id i2-20020a5d4382000000b002daf0b52595mr1926054wrq.0.1679561457180;
        Thu, 23 Mar 2023 01:50:57 -0700 (PDT)
Received: from [192.168.7.188] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id v13-20020a5d6b0d000000b002daf0b52598sm2538296wrw.18.2023.03.23.01.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 01:50:56 -0700 (PDT)
Message-ID: <c95eb801-9d1a-fabb-82f3-54248356983a@linaro.org>
Date: Thu, 23 Mar 2023 09:50:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 05/13] ARM: dts: add support for BananaPi M2S
Content-Language: en-US
To: u-boot-amlogic@groups.io, christianshewitt@gmail.com,
 u-boot@lists.denx.de, linux-amlogic@lists.infradead.org
References: <20230323065458.776029-1-christianshewitt@gmail.com>
 <20230323065458.776029-6-christianshewitt@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230323065458.776029-6-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_015100_937829_745FFD93 
X-CRM114-Status: GOOD (  18.29  )
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
> Import the device-tree from linux-amlogic/for-next (Linux 6.4-rc1)
> and omit the NPU node from the A311D board variant dts as this is
> not supported under U-Boot.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   arch/arm/dts/Makefile                         |   1 +
>   .../arm/dts/meson-g12b-a311d-bananapi-m2s.dts |  33 ++
>   arch/arm/dts/meson-g12b-bananapi-u-boot.dtsi  |   7 +
>   arch/arm/dts/meson-g12b-bananapi.dtsi         | 521 ++++++++++++++++++
>   .../arm/dts/meson-g12b-s922x-bananapi-m2s.dts |  14 +
>   5 files changed, 576 insertions(+)
>   create mode 100644 arch/arm/dts/meson-g12b-a311d-bananapi-m2s.dts
>   create mode 100644 arch/arm/dts/meson-g12b-bananapi-u-boot.dtsi
>   create mode 100644 arch/arm/dts/meson-g12b-bananapi.dtsi
>   create mode 100644 arch/arm/dts/meson-g12b-s922x-bananapi-m2s.dts
> 
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index d6139429e5..eb20524a99 100644
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -204,6 +204,7 @@ dtb-$(CONFIG_ARCH_MESON) += \
>   	meson-g12a-radxa-zero.dtb \
>   	meson-g12a-sei510.dtb \
>   	meson-g12a-u200.dtb \
> +	meson-g12b-a311d-bananapi-m2s.dtb \
>   	meson-g12b-a311d-khadas-vim3.dtb \
>   	meson-g12b-bananapi-cm4-cm4io.dtb \
>   	meson-g12b-gsking-x.dtb \
> diff --git a/arch/arm/dts/meson-g12b-a311d-bananapi-m2s.dts b/arch/arm/dts/meson-g12b-a311d-bananapi-m2s.dts
> new file mode 100644
> index 0000000000..31365316b2
> --- /dev/null
> +++ b/arch/arm/dts/meson-g12b-a311d-bananapi-m2s.dts
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2023 Christian Hewitt <christianshewitt@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-g12b-a311d.dtsi"
> +#include "meson-g12b-bananapi.dtsi"
> +
> +/ {
> +	compatible = "bananapi,bpi-m2s", "amlogic,a311d", "amlogic,g12b";
> +	model = "BananaPi M2S";
> +
> +	aliases {
> +		i2c0 = &i2c1;
> +		i2c1 = &i2c3;
> +	};
> +};
> +
> +/* Camera (CSI) bus */
> +&i2c1 {
> +	status = "okay";
> +	pinctrl-0 = <&i2c1_sda_h6_pins>, <&i2c1_sck_h7_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +/* Display (DSI) bus */
> +&i2c3 {
> +	status = "okay";
> +	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> +	pinctrl-names = "default";
> +};
> diff --git a/arch/arm/dts/meson-g12b-bananapi-u-boot.dtsi b/arch/arm/dts/meson-g12b-bananapi-u-boot.dtsi
> new file mode 100644
> index 0000000000..236f2468dc
> --- /dev/null
> +++ b/arch/arm/dts/meson-g12b-bananapi-u-boot.dtsi
> @@ -0,0 +1,7 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2019 BayLibre, SAS.
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + */
> +
> +#include "meson-g12-common-u-boot.dtsi"
> diff --git a/arch/arm/dts/meson-g12b-bananapi.dtsi b/arch/arm/dts/meson-g12b-bananapi.dtsi
> new file mode 100644
> index 0000000000..83709787eb
> --- /dev/null
> +++ b/arch/arm/dts/meson-g12b-bananapi.dtsi
> @@ -0,0 +1,521 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2019 BayLibre, SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + * Copyright (c) 2023 Christian Hewitt <christianshewitt@gmail.com>
> + */
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/gpio/meson-g12a-gpio.h>
> +#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
> +
> +/ {
> +	aliases {
> +		serial0 = &uart_AO;
> +		ethernet0 = &ethmac;
> +		rtc1 = &vrtc;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x0 0x0 0x80000000>; /* 2 GiB or 4 GiB */
> +	};
> +
> +	adc-keys {
> +		compatible = "adc-keys";
> +		io-channels = <&saradc 2>;
> +		io-channel-names = "buttons";
> +		keyup-threshold-microvolt = <1710000>;
> +
> +		button-function {
> +			label = "RST";
> +			linux,code = <KEY_POWER>;
> +			press-threshold-microvolt = <10000>;
> +		};
> +	};
> +
> +	emmc_pwrseq: emmc-pwrseq {
> +		compatible = "mmc-pwrseq-emmc";
> +		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	fan0: pwm-fan {
> +		compatible = "pwm-fan";
> +		#cooling-cells = <2>;
> +		cooling-min-state = <0>;
> +		cooling-max-state = <3>;
> +		cooling-levels = <0 120 170 220>;
> +		pwms = <&pwm_cd 1 40000 0>;
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
> +		led-0 {
> +			color = <LED_COLOR_ID_BLUE>;
> +			function = LED_FUNCTION_STATUS;
> +			gpios = <&gpio_ao GPIOAO_7 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +
> +		led-1 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_STATUS;
> +			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
> +		clocks = <&wifi32k>;
> +		clock-names = "ext_clock";
> +	};
> +
> +	wifi32k: wifi32k {
> +		compatible = "pwm-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
> +	};
> +
> +	dc_in: regulator-dc-in {
> +		compatible = "regulator-fixed";
> +		regulator-name = "DC_IN";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	vcc_5v: regulator-vcc-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&dc_in>;
> +
> +		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
> +		enable-active-high;
> +	};
> +
> +	vcc_3v3: regulator-vcc-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vsys_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	vcc_1v8: regulator-vcc-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vcc_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	vddao_1v8: regulator-vddao-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDIO_AO1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vsys_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	vddcpu_a: regulator-vddcpu-a {
> +		compatible = "pwm-regulator";
> +		regulator-name = "VDDCPU_A";
> +		regulator-min-microvolt = <690000>;
> +		regulator-max-microvolt = <1050000>;
> +		pwm-supply = <&dc_in>;
> +		pwms = <&pwm_ab 0 1250 0>;
> +		pwm-dutycycle-range = <100 0>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vddcpu_b: regulator-vddcpu-b {
> +		compatible = "pwm-regulator";
> +		regulator-name = "VDDCPU_B";
> +		regulator-min-microvolt = <690000>;
> +		regulator-max-microvolt = <1050000>;
> +		pwm-supply = <&vsys_3v3>;
> +		pwms = <&pwm_AO_cd 1 1250 0>;
> +		pwm-dutycycle-range = <100 0>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vsys_3v3: regulator-vsys-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VSYS_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&dc_in>;
> +		regulator-always-on;
> +	};
> +
> +	emmc_1v8: regulator-emmc-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "EMMC_AO1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vcc_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	usb_pwr: regulator-usb-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USB_PWR";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc_5v>;
> +
> +		gpio = <&gpio GPIOA_6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	sound {
> +		compatible = "amlogic,axg-sound-card";
> +		model = "BPI-M2S";
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
> +&arb {
> +	status = "okay";
> +};
> +
> +&clkc_audio {
> +	status = "okay";
> +};
> +
> +&cecb_AO {
> +	pinctrl-0 = <&cec_ao_b_h_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +	hdmi-phandle = <&hdmi_tx>;
> +};
> +
> +&cpu0 {
> +	cpu-supply = <&vddcpu_b>;
> +	operating-points-v2 = <&cpu_opp_table_0>;
> +	clocks = <&clkc CLKID_CPU_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu1 {
> +	cpu-supply = <&vddcpu_b>;
> +	operating-points-v2 = <&cpu_opp_table_0>;
> +	clocks = <&clkc CLKID_CPU_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu100 {
> +	cpu-supply = <&vddcpu_a>;
> +	operating-points-v2 = <&cpub_opp_table_1>;
> +	clocks = <&clkc CLKID_CPUB_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu101 {
> +	cpu-supply = <&vddcpu_a>;
> +	operating-points-v2 = <&cpub_opp_table_1>;
> +	clocks = <&clkc CLKID_CPUB_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu102 {
> +	cpu-supply = <&vddcpu_a>;
> +	operating-points-v2 = <&cpub_opp_table_1>;
> +	clocks = <&clkc CLKID_CPUB_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu103 {
> +	cpu-supply = <&vddcpu_a>;
> +	operating-points-v2 = <&cpub_opp_table_1>;
> +	clocks = <&clkc CLKID_CPUB_CLK>;
> +	clock-latency = <50000>;
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
> +&ext_mdio {
> +	external_phy: ethernet-phy@0 {
> +		/* Realtek RTL8211F (0x001cc916) */
> +		reg = <0>;
> +		max-speed = <1000>;
> +
> +		reset-assert-us = <10000>;
> +		reset-deassert-us = <80000>;
> +		reset-gpios = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
> +
> +		interrupt-parent = <&gpio_intc>;
> +		/* MAC_INTR on GPIOZ_14 */
> +		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
> +	};
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
> +/* Main i2c bus */
> +&i2c2 {
> +	status = "okay";
> +	pinctrl-0 = <&i2c2_sda_x_pins>, <&i2c2_sck_x_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&pcie {
> +	status = "okay";
> +	reset-gpios = <&gpio GPIOA_8 GPIO_ACTIVE_LOW>;
> +};
> +
> +&pwm_ab {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_a_e_pins>;
> +	pinctrl-names = "default";
> +	clocks = <&xtal>;
> +	clock-names = "clkin0";
> +};
> +
> +&pwm_cd {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_d_x6_pins>;
> +	pinctrl-names = "default";
> +	pwm-gpios = <&gpio GPIOAO_10 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&pwm_ef {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_e_pins>;
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
> +/* SDIO */
> +&sd_emmc_a {
> +	/* enable if WiFi/BT board connected */
> +	status = "disabled";
> +	pinctrl-0 = <&sdio_pins>;
> +	pinctrl-1 = <&sdio_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	bus-width = <4>;
> +	sd-uhs-sdr104;
> +	max-frequency = <50000000>;
> +
> +	non-removable;
> +	disable-wp;
> +
> +	/* WiFi firmware requires power in suspend */
> +	keep-power-in-suspend;
> +
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +
> +	vmmc-supply = <&vsys_3v3>;
> +	vqmmc-supply = <&vddao_1v8>;
> +
> +	rtl8822cs: wifi@1 {
> +		reg = <1>;
> +	};
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
> +	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
> +	vmmc-supply = <&vsys_3v3>;
> +	vqmmc-supply = <&vsys_3v3>;
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
> +	vqmmc-supply = <&emmc_1v8>;
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
> +&uart_A {
> +	/* enable if WiFi/BT board connected */
> +	status = "disabled";
> +	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> +	pinctrl-names = "default";
> +	uart-has-rtscts;
> +
> +	bluetooth {
> +		compatible = "realtek,rtl8822cs-bt";
> +		enable-gpios  = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
> +		host-wake-gpios = <&gpio GPIOX_19 GPIO_ACTIVE_HIGH>;
> +		device-wake-gpios = <&gpio GPIOX_18 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +&uart_AO {
> +	status = "okay";
> +	pinctrl-0 = <&uart_ao_a_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&usb2_phy0 {
> +	phy-supply = <&dc_in>;
> +};
> +
> +&usb2_phy1 {
> +	phy-supply = <&usb_pwr>;
> +};
> +
> +&usb3_pcie_phy {
> +	phy-supply = <&usb_pwr>;
> +};
> +
> +&usb {
> +	status = "okay";
> +	dr_mode = "peripheral";
> +	phys = <&usb2_phy0>, <&usb2_phy1>;
> +	phy-names = "usb2-phy0", "usb2-phy1";
> +};
> diff --git a/arch/arm/dts/meson-g12b-s922x-bananapi-m2s.dts b/arch/arm/dts/meson-g12b-s922x-bananapi-m2s.dts
> new file mode 100644
> index 0000000000..7f66f263a2
> --- /dev/null
> +++ b/arch/arm/dts/meson-g12b-s922x-bananapi-m2s.dts
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2023 Christian Hewitt <christianshewitt@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-g12b-s922x.dtsi"
> +#include "meson-g12b-bananapi.dtsi"
> +
> +/ {
> +	compatible = "bananapi,bpi-m2s", "amlogic,s922x", "amlogic,g12b";
> +	model = "BananaPi M2S";
> +};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
