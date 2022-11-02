Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C90C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Nov 2022 19:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TcMPCjzrH1hUHSJUIn1psge+g20/OLO/fnFOR1s6K5o=; b=Nh+PnDw14jmUqk
	Pagq9mv4EUvhm+UW/EhqU4tMRVDUFdgpyrentYlmjsZRrKk1Jibrh/evphhIAbRtdYE/Js0AlhkTm
	8K5e0VqaZROn+QklhblvdM274BZq1Z0l4lcCwwU5WpCQ89shnHjsVcwhk5JkUiPC7OQVeMKFvaUo3
	pHVPeeSTsyNkA6DVsxlEKMiklwiNHPRZupD1Yml8F+CgofzWfDcIU9L/YrfXJwP5xt1KyNADU3JbW
	X1F3YBRb2wMUWdsdGL+Ws4LzeR5Pj9QkIXZ7TjH6VdRY8rafVaGNjhW1WfIvqB70eYghWZ6y9Rkq5
	LgZX0OK312UgzuQCf4zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqJE1-00DbxQ-3a; Wed, 02 Nov 2022 19:16:33 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqJDp-00Dbao-IF
	for linux-amlogic@lists.infradead.org; Wed, 02 Nov 2022 19:16:25 +0000
Received: by mail-qk1-x72c.google.com with SMTP id k2so6869937qkk.7
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Nov 2022 12:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wLS+bOIIfbD8sL8vdg69vyaZL+BJExdPPYNORGEz7jY=;
        b=rgFYlLpexHbuskjxRoHH/hug52JsoY6SjEyYxjyOwl9I/HoGThtdwZi7dNjnDStdzU
         WMT/NbAKvHNnhTd9XrvxvSKJoe1hBAilmOg+OMkCHQYumooveITE63Is8A2lJGrO6pFG
         MPgT2MVxpIm4XniYsPFuwRUmgdwG9JACwdnv+xnqLxs+azKiZV/y10iUGlm7LbsAfaUY
         fwqS8uV9FyW/kJhMyr6fVKwuVyQc+tRWkcUdM+xFoDFPmE6FwPYiJaMtZoFlGS+b+EHn
         uG1Eq5v2t38D+/qSRcspoCW5ywBP/bw3uqBBbt/JFNkP3PGY1qBRNex/++etjMigiUnh
         lJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wLS+bOIIfbD8sL8vdg69vyaZL+BJExdPPYNORGEz7jY=;
        b=D5tuDJtDYBeHKquY7IyMkLwKAPDAMbmqeOvsOIC+O3p7OUutqoepZx3MqUn291je0F
         YiLpIKLrqYtQT0Idvs0DFY1hjjIFZANmaeXcaewtJYmeQoR7cfl78umme6szCU6+6yVT
         gKBM5Hftdn9jt5Ydx9gSuS02ijTA3iuNYSDz0nn0/i3mkrNwu5sJlukXSMFxGFzT5QgQ
         EAdrNxUYA7aIZWxvhIuMtR8HgzjViiTpTol5Pp12+/gBE9mxLkd72XI6ytLbk7f5jsFJ
         g5Mj3MEyNaF3tT/g+RazvtViV3j1MGzqyITC1V8pOn9ZbsL55SOS3V3ZSHFUlUKq/Hv0
         gt+A==
X-Gm-Message-State: ACrzQf2UbyDf/U3Lxkz9eUSnIqJ+AH0M3vMrNddddfjtFnXnfXot8iGg
	bkIPCDKN6rJN3TksZdvoisI5bw==
X-Google-Smtp-Source: AMsMyM6+hJihixpj5ihHgDCFCpAqfbg24XU9LnTAdw0a2VTZrllTTbpulT0xVt8tMVZLj9dcdWcF4w==
X-Received: by 2002:a05:620a:7ee:b0:6fa:5811:760e with SMTP id k14-20020a05620a07ee00b006fa5811760emr4146583qkk.363.1667416579783;
        Wed, 02 Nov 2022 12:16:19 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id c5-20020ac81105000000b003a494b61e67sm6969257qtj.46.2022.11.02.12.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 12:16:19 -0700 (PDT)
Message-ID: <856d4dc7-f110-67f7-ecd3-6dfb3c1b795f@linaro.org>
Date: Wed, 2 Nov 2022 15:16:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 4/4] arm64: dts: amlogic: add initial Odroid Go Ultra DTS
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Sebastian Reichel <sre@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20221031-b4-odroid-go-ultra-initial-v1-0-42e3dbea86d5@linaro.org>
 <20221031-b4-odroid-go-ultra-initial-v1-4-42e3dbea86d5@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221031-b4-odroid-go-ultra-initial-v1-4-42e3dbea86d5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_121621_625491_4DCD312E 
X-CRM114-Status: GOOD (  11.91  )
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

On 31/10/2022 12:47, Neil Armstrong wrote:
> This adds initial support for the Hardkernel Odroid Go Ultra.
> 
> The Odroid Go Ultra is a portable gaming device with the following

(...)

> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	codec_clk: codec-clk {
> +		compatible = "fixed-clock";
> +		clock-frequency = <12288000>;
> +		clock-output-names = "codec_clk";
> +		#clock-cells = <0>;
> +	};
> +
> +	gpio-keys-polled {

Just gpio-keys

> +		compatible = "gpio-keys-polled";
> +		poll-interval = <10>;
> +		pinctrl-0 = <&keypad_gpio_pins>;
> +		pinctrl-names = "default";
> +
> +		volume-up-button {
> +			label = "VOLUME-UP";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&gpio GPIOX_8 GPIO_ACTIVE_LOW>;
> +		};
> +		volume-down-button {
> +			label = "VOLUME-DOWN";
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			gpios = <&gpio GPIOX_9 GPIO_ACTIVE_LOW>;
> +		};
> +		dpad-up-button {
> +			label = "DPAD-UP";
> +			linux,code = <BTN_DPAD_UP>;
> +			gpios = <&gpio GPIOX_0 GPIO_ACTIVE_LOW>;
> +		};
> +		dpad-down-button {
> +			label = "DPAD-DOWN";
> +			linux,code = <BTN_DPAD_DOWN>;
> +			gpios = <&gpio GPIOX_1 GPIO_ACTIVE_LOW>;
> +		};
> +		dpad-left-button {
> +			label = "DPAD-LEFT";
> +			linux,code = <BTN_DPAD_LEFT>;
> +			gpios = <&gpio GPIOX_2 GPIO_ACTIVE_LOW>;
> +		};
> +		dpad-right-button {
> +			label = "DPAD-RIGHT";
> +			linux,code = <BTN_DPAD_RIGHT>;
> +			gpios = <&gpio GPIOX_3 GPIO_ACTIVE_LOW>;
> +		};
> +		a-button {
> +			label = "A";
> +			linux,code = <BTN_EAST>;
> +			gpios = <&gpio GPIOX_4 GPIO_ACTIVE_LOW>;
> +		};
> +		b-button {
> +			label = "B";
> +			linux,code = <BTN_SOUTH>;
> +			gpios = <&gpio GPIOX_5 GPIO_ACTIVE_LOW>;
> +		};
> +		y-button {
> +			label = "Y";
> +			linux,code = <BTN_WEST>;
> +			gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
> +		};
> +		x-button {
> +			label = "X";
> +			linux,code = <BTN_NORTH>;
> +			gpios = <&gpio GPIOX_7 GPIO_ACTIVE_LOW>;
> +		};
> +		f1-button {
> +			label = "F1";
> +			linux,code = <BTN_TRIGGER_HAPPY1>;
> +			gpios = <&gpio GPIOX_17 GPIO_ACTIVE_LOW>;
> +		};
> +		f2-button {
> +			label = "F2";
> +			linux,code = <BTN_TRIGGER_HAPPY2>;
> +			gpios = <&gpio GPIOX_10 GPIO_ACTIVE_LOW>;
> +		};
> +		f3-button {
> +			label = "F3";
> +			linux,code = <BTN_TRIGGER_HAPPY3>;
> +			gpios = <&gpio GPIOX_11 GPIO_ACTIVE_LOW>;
> +		};
> +		f4-button {
> +			label = "F4";
> +			linux,code = <BTN_TRIGGER_HAPPY4>;
> +			gpios = <&gpio GPIOX_12 GPIO_ACTIVE_LOW>;
> +		};
> +		f5-button {
> +			label = "F5";
> +			linux,code = <BTN_TRIGGER_HAPPY5>;
> +			gpios = <&gpio GPIOX_13 GPIO_ACTIVE_LOW>;
> +		};
> +		f6-button {
> +			label = "F6";
> +			linux,code = <BTN_TRIGGER_HAPPY6>;
> +			gpios = <&gpio GPIOX_16 GPIO_ACTIVE_LOW>;
> +		};
> +		top-left-button {
> +			label = "TOP Left";
> +			linux,code = <BTN_TL>;
> +			gpios = <&gpio GPIOX_14 GPIO_ACTIVE_LOW>;
> +		};
> +		top-left2-button {
> +			label = "TOP Left 2";
> +			linux,code = <BTN_TL2>;
> +			gpios = <&gpio GPIOX_19 GPIO_ACTIVE_LOW>;
> +		};
> +		top-right-button {
> +			label = "TOP Right";
> +			linux,code = <BTN_TR>;
> +			gpios = <&gpio GPIOX_15 GPIO_ACTIVE_LOW>;
> +		};
> +		top-right2-button {
> +			label = "TOP Right 2";
> +			linux,code = <BTN_TR2>;
> +			gpios = <&gpio GPIOX_18 GPIO_ACTIVE_LOW>;
> +		};
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
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-blue {
> +			color = <LED_COLOR_ID_BLUE>;
> +			gpios = <&gpio_ao GPIOAO_11 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +
> +	poweroff {
> +		compatible = "hardkernel,odroid-go-ultra-poweroff";
> +		hardkernel,rk817-pmic = <&rk817>;
> +		hardkernel,rk818-pmic = <&rk818>;
> +	};
> +
> +	vdd_sys: regulator-vdd_sys {

No underscores in node names.

> +		compatible = "regulator-fixed";
> +		regulator-name = "VDD_SYS";
> +		regulator-min-microvolt = <3800000>;
> +		regulator-max-microvolt = <3800000>;
> +		regulator-always-on;
> +	};
> +
> +	sound {
> +		compatible = "amlogic,axg-sound-card";
> +		model = "Odroid GO Ultra";
> +		audio-widgets = "Microphone", "Mic Jack",
> +				"Headphone", "Headphones",
> +				"Speaker", "Internal Speakers";
> +		audio-aux-devs = <&tdmout_b>, <&tdmin_b>, <&speaker_amp>;
> +		audio-routing =	"TDMOUT_B IN 0", "FRDDR_A OUT 1",
> +				"TDM_B Playback", "TDMOUT_B OUT",
> +				"TDMIN_B IN 1", "TDM_B Capture",
> +				"TDMIN_B IN 4", "TDM_B Loopback",
> +				"TODDR_A IN 1", "TDMIN_B OUT",
> +				"MICL", "Mic Jack",
> +				"Headphones", "HPOL",
> +				"Headphones", "HPOR",
> +				"Speaker Amplifier INL", "HPOL",
> +				"Speaker Amplifier INR", "HPOR",
> +				"Internal Speakers", "Speaker Amplifier OUTL",
> +				"Internal Speakers", "Speaker Amplifier OUTR";
> +
> +		assigned-clocks = <&clkc CLKID_MPLL2>,
> +				  <&clkc CLKID_MPLL0>,
> +				  <&clkc CLKID_MPLL1>;
> +		assigned-clock-parents = <0>, <0>, <0>;
> +		assigned-clock-rates = <294912000>,
> +				       <270950400>,
> +				       <393216000>;
> +		status = "okay";

Isn't this a new node?

> +
> +		dai-link-0 {
> +			sound-dai = <&frddr_a>;
> +		};
> +
> +		dai-link-1 {
> +			sound-dai = <&toddr_a>;
> +		};
> +
> +		dai-link-2 {
> +			sound-dai = <&tdmif_b>;
> +			dai-format = "i2s";
> +			dai-tdm-slot-tx-mask-0 = <1 1>;
> +			mclk-fs = <256>;
> +
> +			codec-0 {
> +				sound-dai = <&rk817>;
> +			};
> +		};
> +	};
> +
> +	speaker_amp: speaker-amplifier {
> +		compatible = "simple-audio-amplifier";
> +		sound-name-prefix = "Speaker Amplifier";
> +		VCC-supply = <&hp_5v>;
> +	};
> +};
> +
> +&arb {
> +	status = "okay";
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
> +/* RK817 only supports 12.5mV steps, round up the values */
> +&cpu_opp_table_0 {
> +	opp-1000000000 {
> +		opp-microvolt = <737500>;
> +	};
> +	opp-1200000000 {
> +		opp-microvolt = <737500>;
> +	};
> +	opp-1398000000 {
> +		opp-microvolt = <762500>;
> +	};
> +	opp-1512000000 {
> +		opp-microvolt = <800000>;
> +	};
> +	opp-1608000000 {
> +		opp-microvolt = <837500>;
> +	};
> +	opp-1704000000 {
> +		opp-microvolt = <862500>;
> +	};
> +	opp-1896000000 {
> +		opp-microvolt = <987500>;
> +	};
> +	opp-1992000000 {
> +		opp-microvolt = <1012500>;
> +	};
> +};
> +
> +/* RK818 only supports 12.5mV steps, round up the values */
> +&cpub_opp_table_1 {
> +	opp-1000000000 {
> +		opp-microvolt = <775000>;
> +	};
> +	opp-1200000000 {
> +		opp-microvolt = <775000>;
> +	};
> +	opp-1398000000 {
> +		opp-microvolt = <800000>;
> +	};
> +	opp-1512000000 {
> +		opp-microvolt = <825000>;
> +	};
> +	opp-1608000000 {
> +		opp-microvolt = <862500>;
> +	};
> +	opp-1704000000 {
> +		opp-microvolt = <900000>;
> +	};
> +	opp-1800000000 {
> +		opp-microvolt = <987500>;
> +	};
> +	opp-1908000000 {
> +		opp-microvolt = <1025000>;
> +	};
> +};
> +
> +&i2c_AO {
> +	status = "okay";
> +	pinctrl-0 = <&i2c_ao_sck_pins>, <&i2c_ao_sda_pins>;
> +	pinctrl-names = "default";
> +
> +	rk818: pmic@1c {
> +		compatible = "rockchip,rk818";
> +		reg = <0x1c>;
> +		interrupt-parent = <&gpio_intc>;
> +		interrupts = <7 IRQ_TYPE_LEVEL_LOW>; /* GPIOAO_7 */
> +
> +		vcc1-supply = <&vdd_sys>;
> +		vcc2-supply = <&vdd_sys>;
> +		vcc3-supply = <&vdd_sys>;
> +		vcc4-supply = <&vdd_sys>;
> +		vcc6-supply = <&vdd_sys>;
> +		vcc7-supply = <&vcc_2v3>;
> +		vcc8-supply = <&vcc_2v3>;
> +		vcc9-supply = <&vddao_3v3>;
> +		boost-supply = <&vdd_sys>;
> +		switch-supply = <&vdd_sys>;
> +
> +		regulators {
> +			vddcpu_a: DCDC_REG1 {
> +				regulator-name = "vddcpu_a";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <775000>;
> +				regulator-max-microvolt = <1025000>;
> +				regulator-ramp-delay = <6001>;
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <775000>;
> +				};
> +			};
> +
> +			vdd_ee: DCDC_REG2 {
> +				regulator-name = "vdd_ee";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <875000>;
> +				regulator-max-microvolt = <1250000>;
> +				regulator-ramp-delay = <6001>;
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <875000>;
> +				};
> +			};
> +
> +			vddq_1v1: DCDC_REG3 {
> +				regulator-name = "vddq_1v1";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +				};
> +			};
> +
> +			vddao_3v3: DCDC_REG4 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vddao_3v3";
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <3300000>;
> +				};
> +			};
> +
> +			hp_5v: DCDC_BOOST {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-name = "hp_5v";
> +				regulator-min-microvolt = <5000000>;
> +				regulator-max-microvolt = <5000000>;
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vddio_ao1v8: LDO_REG5 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-name = "vddio_ao1v8";
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1800000>;
> +				};
> +			};
> +
> +			vddq_1v8: LDO_REG7 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-name = "vddq_1v8";
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1800000>;
> +				};
> +			};
> +
> +			vddio_c: LDO_REG9 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vddio_c";
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <3300000>;
> +				};
> +			};
> +
> +			vcc_sd: SWITCH_REG {
> +				regulator-name = "vcc_sd";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +				};
> +			};
> +
> +			OTG_SWITCH {
> +				regulator-name = "otg_switch";
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> +	pinctrl-names = "default";
> +
> +	rk817: pmic@20 {
> +		compatible = "rockchip,rk817";
> +		reg = <0x20>;
> +		status = "okay";

No need.

> +		interrupt-parent = <&gpio_intc>;
> +
> +		interrupts = <5 IRQ_TYPE_LEVEL_LOW>; /* GPIOAO_5 */
> +

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
