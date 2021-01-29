Return-Path: <SRS0=l5NU=HA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F8FC433DB
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jan 2021 06:52:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3632664DFF
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jan 2021 06:52:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3632664DFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0RG+ZkASxw3Hp0A+LDbLS8rLV/3kysSyLQKhNAlc8Oc=; b=YIuQSG0mQ7MxBjGYYgRylSN6Z4
	T4MctyLv6UNiTFHaw0Jv7LpnSkmjdeJqrSa2yney4a8TVvTxat9odmZY1NDnMoO+Y74U88VUuppiH
	b/C2qukHiFf1UIienN/3KXipQDXIQPnYkx79JwW4IO2w79MjgMByhQ916baFpwDnAEFFkhFneH0wM
	0bHUYII1rO6lhOmD4xYKsYjlJEch1nk3OV/a6wpzr0JVLS9AWLdv27gIwVeawt3EnrjmVWWUaGJpB
	2fQ/HwZn/G7K77dFe89zDE6J9vnuBNAjhgaEFZFCNL3BciqwoL1jYm7xNmOJhuIYHSZzi4FmMC8sp
	ncI00GTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Ne5-0005xT-5y; Fri, 29 Jan 2021 06:52:41 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5NdG-0005eW-W2; Fri, 29 Jan 2021 06:51:55 +0000
Received: by mail-wr1-x436.google.com with SMTP id g10so7739058wrx.1;
 Thu, 28 Jan 2021 22:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7FUZFgTp+4aX43uxxvzzNKoXWX1Bf6/hlwSoJwGLyyg=;
 b=qzTPrYHxJF51yrag+/MsB5HiGhPIt2jz+DbqoBEPaAmSyXo18PGvPWC27/5ye/4XSD
 ughCTivO6io2XCQ7A9bEtnw/HrmMRNEz6xp1wAHsgLhPYGfxL/dApvCmi7mHcZoBOyY/
 pjbyU0fL8KcZC34Nk76wkg8kyKXo/ANCCKdYBgqPQc3tjc9s1wgdqkl3Pyu/waL3dDGB
 bsqXUfZYX8Z6Vz2xYffQ2xHVP9X8sPVDYDTmZCJxwC80F+arswma9bjxfutFoCG6ZXXQ
 49EF4V6HG2ovfxpNHIRsZqHmi+nYW7BMOTnUjxd7SpwJf0fKQs6Bdze0FxEYnkSArTwx
 GGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7FUZFgTp+4aX43uxxvzzNKoXWX1Bf6/hlwSoJwGLyyg=;
 b=UaKlxoJoaZebrq5buP+KiGFUbv5jVjQtEN+mL3ZHz4Q2jJAsxFCfPFfqMQ0MoNuS8k
 bPoYtw7s0mwR7xFaNF8OY8ZdBSrkv0JkICfCS7l16xwc5/Ncbw8K1lXznZ2EmNkB7nym
 caMJTkdrfrp82mFvwtcxsq5LGD3loPAHqO7cwNOS7JFYVQx0TOFdOGK78uCXB0UPSEBn
 WLW18+aKwtUz1Li9J+E07Qb7SfVCyq7mde7c7+clGyI5PK8dy46ZuT7whNry9Sizgbtj
 WqlF1tavpkiTnezsgP9EGBAmoMEAyeuVoSl/ZkOiqo29zt55wa4IARi+SfIrDox0qth5
 PASQ==
X-Gm-Message-State: AOAM533sKiaicn8B5sXmQZXUUuN5pjHV8Vr34kVTxG/+MQ2/elE86+k7
 BLLl0XzNfAXeRJ+uTby0NpQ=
X-Google-Smtp-Source: ABdhPJztqRhexQ9KQivdo5sle7kxpii5gjiHL9YRWaqXD18h8p4IC/Nh6cOhmXL5C3gayKi6WwErdg==
X-Received: by 2002:adf:ebc2:: with SMTP id v2mr2855584wrn.88.1611903109577;
 Thu, 28 Jan 2021 22:51:49 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id b7sm11501236wrs.50.2021.01.28.22.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 22:51:49 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: meson: convert meson-sm1-odroid-c4 to dtsi
Date: Fri, 29 Jan 2021 06:51:35 +0000
Message-Id: <20210129065137.5473-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210129065137.5473-1-christianshewitt@gmail.com>
References: <20210129065137.5473-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_015151_166048_6EAE0D6F 
X-CRM114-Status: GOOD (  18.61  )
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
Cc: Dongjin Kim <tobetter@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Convert the ODRIOD-C4 dts to meson-sm1-odroid.dtsi and C4 board dts in
preparation for adding additional C4 family boards.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 427 +----------------
 .../boot/dts/amlogic/meson-sm1-odroid.dtsi    | 441 ++++++++++++++++++
 2 files changed, 442 insertions(+), 426 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
index eadd75e6e067..b2a4e823c1d8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
@@ -5,34 +5,12 @@
 
 /dts-v1/;
 
-#include "meson-sm1.dtsi"
-#include <dt-bindings/gpio/meson-g12a-gpio.h>
-#include <dt-bindings/leds/common.h>
-#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
+#include "meson-sm1-odroid.dtsi"
 
 / {
 	compatible = "hardkernel,odroid-c4", "amlogic,sm1";
 	model = "Hardkernel ODROID-C4";
 
-	aliases {
-		serial0 = &uart_AO;
-		ethernet0 = &ethmac;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	memory@0 {
-		device_type = "memory";
-		reg = <0x0 0x0 0x0 0x40000000>;
-	};
-
-	emmc_pwrseq: emmc-pwrseq {
-		compatible = "mmc-pwrseq-emmc";
-		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
-	};
-
 	leds {
 		compatible = "gpio-leds";
 
@@ -45,96 +23,6 @@
 		};
 	};
 
-	tflash_vdd: regulator-tflash_vdd {
-		compatible = "regulator-fixed";
-
-		regulator-name = "TFLASH_VDD";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&gpio_ao GPIOAO_3 GPIO_OPEN_DRAIN>;
-		enable-active-high;
-		regulator-always-on;
-	};
-
-	tf_io: gpio-regulator-tf_io {
-		compatible = "regulator-gpio";
-
-		regulator-name = "TF_IO";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpios = <&gpio_ao GPIOAO_6 GPIO_ACTIVE_HIGH>;
-		gpios-states = <0>;
-
-		states = <3300000 0>,
-			 <1800000 1>;
-	};
-
-	flash_1v8: regulator-flash_1v8 {
-		compatible = "regulator-fixed";
-		regulator-name = "FLASH_1V8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		vin-supply = <&vcc_3v3>;
-		regulator-always-on;
-	};
-
-	main_12v: regulator-main_12v {
-		compatible = "regulator-fixed";
-		regulator-name = "12V";
-		regulator-min-microvolt = <12000000>;
-		regulator-max-microvolt = <12000000>;
-		regulator-always-on;
-	};
-
-	vcc_5v: regulator-vcc_5v {
-		compatible = "regulator-fixed";
-		regulator-name = "5V";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		regulator-always-on;
-		vin-supply = <&main_12v>;
-	};
-
-	vcc_1v8: regulator-vcc_1v8 {
-		compatible = "regulator-fixed";
-		regulator-name = "VCC_1V8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		vin-supply = <&vcc_3v3>;
-		regulator-always-on;
-	};
-
-	vcc_3v3: regulator-vcc_3v3 {
-		compatible = "regulator-fixed";
-		regulator-name = "VCC_3V3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vddao_3v3>;
-		regulator-always-on;
-		/* FIXME: actually controlled by VDDCPU_B_EN */
-	};
-
-	vddcpu: regulator-vddcpu {
-		/*
-		 * MP8756GD Regulator.
-		 */
-		compatible = "pwm-regulator";
-
-		regulator-name = "VDDCPU";
-		regulator-min-microvolt = <721000>;
-		regulator-max-microvolt = <1022000>;
-
-		vin-supply = <&main_12v>;
-
-		pwms = <&pwm_AO_cd 1 1250 0>;
-		pwm-dutycycle-range = <100 0>;
-
-		regulator-boot-on;
-		regulator-always-on;
-	};
-
 	hub_5v: regulator-hub_5v {
 		compatible = "regulator-fixed";
 		regulator-name = "HUB_5V";
@@ -147,215 +35,12 @@
 		enable-active-high;
 	};
 
-	usb_pwr_en: regulator-usb_pwr_en {
-		compatible = "regulator-fixed";
-		regulator-name = "USB_PWR_EN";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vcc_5v>;
-
-		/* Connected to the microUSB port power enable */
-		gpio = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
-	vddao_1v8: regulator-vddao_1v8 {
-		compatible = "regulator-fixed";
-		regulator-name = "VDDAO_1V8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		vin-supply = <&vddao_3v3>;
-		regulator-always-on;
-	};
-
-	vddao_3v3: regulator-vddao_3v3 {
-		compatible = "regulator-fixed";
-		regulator-name = "VDDAO_3V3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&main_12v>;
-		regulator-always-on;
-	};
-
-	hdmi-connector {
-		compatible = "hdmi-connector";
-		type = "a";
-
-		port {
-			hdmi_connector_in: endpoint {
-				remote-endpoint = <&hdmi_tx_tmds_out>;
-			};
-		};
-	};
-
 	sound {
-		compatible = "amlogic,axg-sound-card";
 		model = "ODROID-C4";
-		audio-aux-devs = <&tdmout_b>;
-		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
-				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
-				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
-				"TDM_B Playback", "TDMOUT_B OUT";
-
-		assigned-clocks = <&clkc CLKID_MPLL2>,
-				  <&clkc CLKID_MPLL0>,
-				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
-		assigned-clock-rates = <294912000>,
-				       <270950400>,
-				       <393216000>;
-		status = "okay";
-
-		dai-link-0 {
-			sound-dai = <&frddr_a>;
-		};
-
-		dai-link-1 {
-			sound-dai = <&frddr_b>;
-		};
-
-		dai-link-2 {
-			sound-dai = <&frddr_c>;
-		};
-
-		/* 8ch hdmi interface */
-		dai-link-3 {
-			sound-dai = <&tdmif_b>;
-			dai-format = "i2s";
-			dai-tdm-slot-tx-mask-0 = <1 1>;
-			dai-tdm-slot-tx-mask-1 = <1 1>;
-			dai-tdm-slot-tx-mask-2 = <1 1>;
-			dai-tdm-slot-tx-mask-3 = <1 1>;
-			mclk-fs = <256>;
-
-			codec {
-				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
-			};
-		};
-
-		/* hdmi glue */
-		dai-link-4 {
-			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
-
-			codec {
-				sound-dai = <&hdmi_tx>;
-			};
-		};
-	};
-};
-
-&arb {
-	status = "okay";
-};
-
-&clkc_audio {
-	status = "okay";
-};
-
-&cpu0 {
-	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
-	clock-latency = <50000>;
-};
-
-&cpu1 {
-	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU1_CLK>;
-	clock-latency = <50000>;
-};
-
-&cpu2 {
-	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU2_CLK>;
-	clock-latency = <50000>;
-};
-
-&cpu3 {
-	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU3_CLK>;
-	clock-latency = <50000>;
-};
-
-&ext_mdio {
-	external_phy: ethernet-phy@0 {
-		/* Realtek RTL8211F (0x001cc916) */
-		reg = <0>;
-		max-speed = <1000>;
-
-		interrupt-parent = <&gpio_intc>;
-		/* MAC_INTR on GPIOZ_14 */
-		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
-&ethmac {
-	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
-	pinctrl-names = "default";
-	status = "okay";
-	phy-mode = "rgmii";
-	phy-handle = <&external_phy>;
-	amlogic,tx-delay-ns = <2>;
-};
-
-&frddr_a {
-	status = "okay";
-};
-
-&frddr_b {
-	status = "okay";
-};
-
-&frddr_c {
-	status = "okay";
-};
-
 &gpio {
-	gpio-line-names =
-		/* GPIOZ */
-		"", "", "", "", "", "", "", "",
-		"", "", "", "", "", "", "", "",
-		/* GPIOH */
-		"", "", "", "", "",
-		"PIN_36", /* GPIOH_5 */
-		"PIN_26", /* GPIOH_6 */
-		"PIN_32", /* GPIOH_7 */
-		"",
-		/* BOOT */
-		"", "", "", "", "", "", "", "",
-		"", "", "", "", "", "", "", "",
-		/* GPIOC */
-		"", "", "", "", "", "", "", "",
-		/* GPIOA */
-		"", "", "", "", "", "", "", "",
-		"", "", "", "", "", "",
-		"PIN_27", /* GPIOA_14 */
-		"PIN_28", /* GPIOA_15 */
-		/* GPIOX */
-		"PIN_16", /* GPIOX_0 */
-		"PIN_18", /* GPIOX_1 */
-		"PIN_22", /* GPIOX_2 */
-		"PIN_11", /* GPIOX_3 */
-		"PIN_13", /* GPIOX_4 */
-		"PIN_7",  /* GPIOX_5 */
-		"PIN_33", /* GPIOX_6 */
-		"PIN_15", /* GPIOX_7 */
-		"PIN_19", /* GPIOX_8 */
-		"PIN_21", /* GPIOX_9 */
-		"PIN_24", /* GPIOX_10 */
-		"PIN_23", /* GPIOX_11 */
-		"PIN_8",  /* GPIOX_12 */
-		"PIN_10", /* GPIOX_13 */
-		"PIN_29", /* GPIOX_14 */
-		"PIN_31", /* GPIOX_15 */
-		"PIN_12", /* GPIOX_16 */
-		"PIN_3",  /* GPIOX_17 */
-		"PIN_5",  /* GPIOX_18 */
-		"PIN_35"; /* GPIOX_19 */
-
 	/*
 	 * WARNING: The USB Hub on the Odroid-C4 needs a reset signal
 	 * to be turned high in order to be detected by the USB Controller
@@ -370,120 +55,10 @@
 	};
 };
 
-&gpio_ao {
-	gpio-line-names =
-		/* GPIOAO */
-		"", "", "", "",
-		"PIN_47", /* GPIOAO_4 */
-		"", "",
-		"PIN_45", /* GPIOAO_7 */
-		"PIN_46", /* GPIOAO_8 */
-		"PIN_44", /* GPIOAO_9 */
-		"PIN_42", /* GPIOAO_10 */
-		"",
-		/* GPIOE */
-		"", "", "";
-};
-
-&hdmi_tx {
-	status = "okay";
-	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
-	pinctrl-names = "default";
-	hdmi-supply = <&vcc_5v>;
-};
-
-&hdmi_tx_tmds_port {
-	hdmi_tx_tmds_out: endpoint {
-		remote-endpoint = <&hdmi_connector_in>;
-	};
-};
-
 &ir {
-	status = "okay";
-	pinctrl-0 = <&remote_input_ao_pins>;
-	pinctrl-names = "default";
 	linux,rc-map-name = "rc-odroid";
 };
 
-&pwm_AO_cd {
-	pinctrl-0 = <&pwm_ao_d_e_pins>;
-	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin1";
-	status = "okay";
-};
-
-&saradc {
-	status = "okay";
-};
-
-/* SD card */
-&sd_emmc_b {
-	status = "okay";
-	pinctrl-0 = <&sdcard_c_pins>;
-	pinctrl-1 = <&sdcard_clk_gate_c_pins>;
-	pinctrl-names = "default", "clk-gate";
-
-	bus-width = <4>;
-	cap-sd-highspeed;
-	max-frequency = <200000000>;
-	sd-uhs-sdr12;
-	sd-uhs-sdr25;
-	sd-uhs-sdr50;
-	sd-uhs-sdr104;
-	disable-wp;
-
-	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
-	vmmc-supply = <&tflash_vdd>;
-	vqmmc-supply = <&tf_io>;
-};
-
-/* eMMC */
-&sd_emmc_c {
-	status = "okay";
-	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_8b_pins>, <&emmc_ds_pins>;
-	pinctrl-1 = <&emmc_clk_gate_pins>;
-	pinctrl-names = "default", "clk-gate";
-
-	bus-width = <8>;
-	cap-mmc-highspeed;
-	mmc-ddr-1_8v;
-	mmc-hs200-1_8v;
-	max-frequency = <200000000>;
-	disable-wp;
-
-	mmc-pwrseq = <&emmc_pwrseq>;
-	vmmc-supply = <&vcc_3v3>;
-	vqmmc-supply = <&flash_1v8>;
-};
-
-&tdmif_b {
-	status = "okay";
-};
-
-&tdmout_b {
-	status = "okay";
-};
-
-&tohdmitx {
-	status = "okay";
-};
-
-&uart_AO {
-	status = "okay";
-	pinctrl-0 = <&uart_ao_a_pins>;
-	pinctrl-names = "default";
-};
-
-&usb {
-	status = "okay";
-	vbus-supply = <&usb_pwr_en>;
-};
-
-&usb2_phy0 {
-	phy-supply = <&vcc_5v>;
-};
-
 &usb2_phy1 {
 	/* Enable the hub which is connected to this port */
 	phy-supply = <&hub_5v>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
new file mode 100644
index 000000000000..a66d55d93183
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -0,0 +1,441 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2020 Dongjin Kim <tobetter@gmail.com>
+ */
+
+#include "meson-sm1.dtsi"
+#include <dt-bindings/gpio/meson-g12a-gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
+
+/ {
+	aliases {
+		serial0 = &uart_AO;
+		ethernet0 = &ethmac;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x40000000>;
+	};
+
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
+	};
+
+	tflash_vdd: regulator-tflash_vdd {
+		compatible = "regulator-fixed";
+
+		regulator-name = "TFLASH_VDD";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&gpio_ao GPIOAO_3 GPIO_OPEN_DRAIN>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	tf_io: gpio-regulator-tf_io {
+		compatible = "regulator-gpio";
+
+		regulator-name = "TF_IO";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpios = <&gpio_ao GPIOAO_6 GPIO_ACTIVE_HIGH>;
+		gpios-states = <0>;
+
+		states = <3300000 0>,
+			 <1800000 1>;
+	};
+
+	flash_1v8: regulator-flash_1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "FLASH_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3>;
+		regulator-always-on;
+	};
+
+	main_12v: regulator-main_12v {
+		compatible = "regulator-fixed";
+		regulator-name = "12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-always-on;
+	};
+
+	vcc_5v: regulator-vcc_5v {
+		compatible = "regulator-fixed";
+		regulator-name = "5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		vin-supply = <&main_12v>;
+	};
+
+	vcc_1v8: regulator-vcc_1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3>;
+		regulator-always-on;
+	};
+
+	vcc_3v3: regulator-vcc_3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+		/* FIXME: actually controlled by VDDCPU_B_EN */
+	};
+
+	vddcpu: regulator-vddcpu {
+		/*
+		 * MP8756GD Regulator.
+		 */
+		compatible = "pwm-regulator";
+
+		regulator-name = "VDDCPU";
+		regulator-min-microvolt = <721000>;
+		regulator-max-microvolt = <1022000>;
+
+		vin-supply = <&main_12v>;
+
+		pwms = <&pwm_AO_cd 1 1250 0>;
+		pwm-dutycycle-range = <100 0>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	usb_pwr_en: regulator-usb_pwr_en {
+		compatible = "regulator-fixed";
+		regulator-name = "USB_PWR_EN";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_5v>;
+
+		/* Connected to the microUSB port power enable */
+		gpio = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vddao_1v8: regulator-vddao_1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
+	vddao_3v3: regulator-vddao_3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&main_12v>;
+		regulator-always-on;
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_tx_tmds_out>;
+			};
+		};
+	};
+
+	sound {
+		compatible = "amlogic,axg-sound-card";
+		audio-aux-devs = <&tdmout_b>;
+		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
+				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
+				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
+				"TDM_B Playback", "TDMOUT_B OUT";
+
+		assigned-clocks = <&clkc CLKID_MPLL2>,
+				  <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>;
+
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+		status = "okay";
+
+		dai-link-0 {
+			sound-dai = <&frddr_a>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&frddr_b>;
+		};
+
+		dai-link-2 {
+			sound-dai = <&frddr_c>;
+		};
+
+		/* 8ch hdmi interface */
+		dai-link-3 {
+			sound-dai = <&tdmif_b>;
+			dai-format = "i2s";
+			dai-tdm-slot-tx-mask-0 = <1 1>;
+			dai-tdm-slot-tx-mask-1 = <1 1>;
+			dai-tdm-slot-tx-mask-2 = <1 1>;
+			dai-tdm-slot-tx-mask-3 = <1 1>;
+			mclk-fs = <256>;
+
+			codec {
+				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
+			};
+		};
+
+		/* hdmi glue */
+		dai-link-4 {
+			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
+			codec {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+	};
+};
+
+&arb {
+	status = "okay";
+};
+
+&clkc_audio {
+	status = "okay";
+};
+
+&cpu0 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu1 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU1_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu2 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU2_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu3 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU3_CLK>;
+	clock-latency = <50000>;
+};
+
+&ext_mdio {
+	external_phy: ethernet-phy@0 {
+		/* Realtek RTL8211F (0x001cc916) */
+		reg = <0>;
+		max-speed = <1000>;
+
+		interrupt-parent = <&gpio_intc>;
+		/* MAC_INTR on GPIOZ_14 */
+		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&ethmac {
+	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+	phy-mode = "rgmii";
+	phy-handle = <&external_phy>;
+	amlogic,tx-delay-ns = <2>;
+};
+
+&frddr_a {
+	status = "okay";
+};
+
+&frddr_b {
+	status = "okay";
+};
+
+&frddr_c {
+	status = "okay";
+};
+
+&gpio {
+	gpio-line-names =
+		/* GPIOZ */
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		/* GPIOH */
+		"", "", "", "", "",
+		"PIN_36", /* GPIOH_5 */
+		"PIN_26", /* GPIOH_6 */
+		"PIN_32", /* GPIOH_7 */
+		"",
+		/* BOOT */
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		/* GPIOC */
+		"", "", "", "", "", "", "", "",
+		/* GPIOA */
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "",
+		"PIN_27", /* GPIOA_14 */
+		"PIN_28", /* GPIOA_15 */
+		/* GPIOX */
+		"PIN_16", /* GPIOX_0 */
+		"PIN_18", /* GPIOX_1 */
+		"PIN_22", /* GPIOX_2 */
+		"PIN_11", /* GPIOX_3 */
+		"PIN_13", /* GPIOX_4 */
+		"PIN_7",  /* GPIOX_5 */
+		"PIN_33", /* GPIOX_6 */
+		"PIN_15", /* GPIOX_7 */
+		"PIN_19", /* GPIOX_8 */
+		"PIN_21", /* GPIOX_9 */
+		"PIN_24", /* GPIOX_10 */
+		"PIN_23", /* GPIOX_11 */
+		"PIN_8",  /* GPIOX_12 */
+		"PIN_10", /* GPIOX_13 */
+		"PIN_29", /* GPIOX_14 */
+		"PIN_31", /* GPIOX_15 */
+		"PIN_12", /* GPIOX_16 */
+		"PIN_3",  /* GPIOX_17 */
+		"PIN_5",  /* GPIOX_18 */
+		"PIN_35"; /* GPIOX_19 */
+};
+
+&gpio_ao {
+	gpio-line-names =
+		/* GPIOAO */
+		"", "", "", "",
+		"PIN_47", /* GPIOAO_4 */
+		"", "",
+		"PIN_45", /* GPIOAO_7 */
+		"PIN_46", /* GPIOAO_8 */
+		"PIN_44", /* GPIOAO_9 */
+		"PIN_42", /* GPIOAO_10 */
+		"",
+		/* GPIOE */
+		"", "", "";
+};
+
+&hdmi_tx {
+	status = "okay";
+	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
+	pinctrl-names = "default";
+	hdmi-supply = <&vcc_5v>;
+};
+
+&hdmi_tx_tmds_port {
+	hdmi_tx_tmds_out: endpoint {
+		remote-endpoint = <&hdmi_connector_in>;
+	};
+};
+
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_input_ao_pins>;
+	pinctrl-names = "default";
+};
+
+&pwm_AO_cd {
+	pinctrl-0 = <&pwm_ao_d_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&xtal>;
+	clock-names = "clkin1";
+	status = "okay";
+};
+
+&saradc {
+	status = "okay";
+};
+
+/* SD card */
+&sd_emmc_b {
+	status = "okay";
+	pinctrl-0 = <&sdcard_c_pins>;
+	pinctrl-1 = <&sdcard_clk_gate_c_pins>;
+	pinctrl-names = "default", "clk-gate";
+
+	bus-width = <4>;
+	cap-sd-highspeed;
+	max-frequency = <200000000>;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	disable-wp;
+
+	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&tflash_vdd>;
+	vqmmc-supply = <&tf_io>;
+};
+
+/* eMMC */
+&sd_emmc_c {
+	status = "okay";
+	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_8b_pins>, <&emmc_ds_pins>;
+	pinctrl-1 = <&emmc_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	max-frequency = <200000000>;
+	disable-wp;
+
+	mmc-pwrseq = <&emmc_pwrseq>;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&flash_1v8>;
+};
+
+&tdmif_b {
+	status = "okay";
+};
+
+&tdmout_b {
+	status = "okay";
+};
+
+&tohdmitx {
+	status = "okay";
+};
+
+&uart_AO {
+	status = "okay";
+	pinctrl-0 = <&uart_ao_a_pins>;
+	pinctrl-names = "default";
+};
+
+&usb {
+	status = "okay";
+	vbus-supply = <&usb_pwr_en>;
+};
+
+&usb2_phy0 {
+	phy-supply = <&vcc_5v>;
+};
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
