Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8675C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 06:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xQlz/1dMxX6RCREUyjYuOt1uLh3bCagCeGQtak9calQ=; b=5BTTfm6jgNbb07
	gWsSzLjKRCUkcLKJp5VZ2iFTeKUqapK/jQy88qwFj6cem3IWEDykrBjAlEkJo3/h1ijY3vJNNNCdt
	tpFTs2pTTvUmZKc/gKVDbup7z22rt4a7Jur2Z/wUeV6dQaYlXD3jGX/4B92ReQQAp1/FcqLdbW7Yb
	nwASvzE2AFWoGyAapthZSdS6P1o3SP/g3a9X79rp1mqjtX5+xzF/2DZNNRP1fNQFwe9ntp2+DMEhx
	awFIGK/UB4lyE+5TDG7FCxDbPN91TE5eW/GY/l7TepBfWORvu4kuxvgJr52PjUhwZULPMsdNw9mm4
	yBbBrZxybnwvi3iUUhmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfEr8-0012mG-1I;
	Thu, 23 Mar 2023 06:55:26 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfEr0-0012eP-0g
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 06:55:20 +0000
Received: by mail-wr1-x433.google.com with SMTP id l12so19317104wrm.10
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Mar 2023 23:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679554514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vH4AOLgDWPIf8QgS9OS4z1yE1cvukQFA7Rj/5cIY0w8=;
        b=LZ8j/u4azJ3eKTEOtGAhn6aDYhiHtvZewTdVYS7TZBV1FkxdqGK8l83x6aA1vwx5Nb
         w8DJZQb4r0qizWsVxSq85VfX6zAHObvT/J4rqoLNrqsbLSYvh/rVKRvIvugtfOIwAd1s
         /j7nfe7zlqqx4u/Sit/xAOhU5OO73muwjCU4P5mhZKrjgmuXDE9AQcrSXRB8VlQUZMr8
         TN7G+Ja27HYhDI8omYa7U4bsCd4cIrBSuD344CwlcUg3bOS/fGHYz6bnwK0dnA/Jzs67
         LPh4WO2+OP4vfXJ8wx4qE/W40uTxDBnQKYu8aLCaqLSfVl8vKDlTSyqnz+j9rWBzZyae
         jcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679554514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vH4AOLgDWPIf8QgS9OS4z1yE1cvukQFA7Rj/5cIY0w8=;
        b=0ADVe70Bo2hPoLLNgJa5TgVD4va0hWlcio3GVECv7bpQN3wn7c8RazoZk4Pegt3Crz
         0YHhU9A/IMIDP9ZYduqNbT6rw7Yz7InLgBAliC/GiQuYCele0em3OtuQZTdN5WVIR10n
         p2RkbznvB0V5F8J0Ei0SK1oICxg7FdDzifGULe64dzcUHVXGUJjdrCvkJHX0DvYmJc1e
         C0X58Tt+KxFOcUQaTMqRfZfBtg18n6LQHI+A7BvAVAkSeUYws4mmQ1FuVTCl9ZzY1qge
         OQOGbyzrRf32WtpUy++Nq+AqfFGTuv0PjL/ceV97b1M3vhOT5AjKMjLjfQQgfgdNE5Q9
         bRZg==
X-Gm-Message-State: AAQBX9dh/jLbJpz9o0gyZpTYnk+4h7GmpYYCIyHnha5+uZH2AMrjjrEb
	QDwaD07KjdQiLfUs+NBtVAU=
X-Google-Smtp-Source: AKy350ZD7gTwupOi3H26FXbyBVNTqZfwVYgsWxi+08O6Jg6b+3gQHsqdOSq26g4TdWX2bd4JoaH+aQ==
X-Received: by 2002:a5d:69cc:0:b0:2d6:4cbc:7f15 with SMTP id s12-20020a5d69cc000000b002d64cbc7f15mr1717059wrw.38.1679554514308;
        Wed, 22 Mar 2023 23:55:14 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id z15-20020a5d44cf000000b002ce9f0e4a8fsm15520831wrr.84.2023.03.22.23.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 23:55:14 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 08/13] ARM: dts: add support for Radxa Zero2
Date: Thu, 23 Mar 2023 06:54:53 +0000
Message-Id: <20230323065458.776029-9-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230323065458.776029-1-christianshewitt@gmail.com>
References: <20230323065458.776029-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_235518_272989_892F918B 
X-CRM114-Status: GOOD (  14.95  )
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

Import the device-tree from linux-amlogic/for-next (Linux 6.4-rc1)
to support the Radxa-Zero2 board.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm/dts/Makefile                         |   1 +
 .../dts/meson-g12b-radxa-zero2-u-boot.dtsi    |   7 +
 arch/arm/dts/meson-g12b-radxa-zero2.dts       | 489 ++++++++++++++++++
 3 files changed, 497 insertions(+)
 create mode 100644 arch/arm/dts/meson-g12b-radxa-zero2-u-boot.dtsi
 create mode 100644 arch/arm/dts/meson-g12b-radxa-zero2.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index eb20524a99..42da335bb5 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -214,6 +214,7 @@ dtb-$(CONFIG_ARCH_MESON) += \
 	meson-g12b-odroid-n2.dtb \
 	meson-g12b-odroid-n2l.dtb \
 	meson-g12b-odroid-n2-plus.dtb \
+	meson-g12b-radxa-zero2.dtb \
 	meson-sm1-bananapi-m2-pro.dtb \
 	meson-sm1-bananapi-m5.dtb \
 	meson-sm1-khadas-vim3l.dtb \
diff --git a/arch/arm/dts/meson-g12b-radxa-zero2-u-boot.dtsi b/arch/arm/dts/meson-g12b-radxa-zero2-u-boot.dtsi
new file mode 100644
index 0000000000..236f2468dc
--- /dev/null
+++ b/arch/arm/dts/meson-g12b-radxa-zero2-u-boot.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre, SAS.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include "meson-g12-common-u-boot.dtsi"
diff --git a/arch/arm/dts/meson-g12b-radxa-zero2.dts b/arch/arm/dts/meson-g12b-radxa-zero2.dts
new file mode 100644
index 0000000000..890f5bfebb
--- /dev/null
+++ b/arch/arm/dts/meson-g12b-radxa-zero2.dts
@@ -0,0 +1,489 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ * Copyright (c) 2019 Christian Hewitt <christianshewitt@gmail.com>
+ * Copyright (c) 2022 Radxa Limited
+ * Author: Yuntian Zhang <yt@radxa.com>
+ */
+
+/dts-v1/;
+
+#include "meson-g12b-a311d.dtsi"
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/gpio/meson-g12a-gpio.h>
+#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
+
+/ {
+	compatible = "radxa,zero2", "amlogic,a311d", "amlogic,g12b";
+	model = "Radxa Zero2";
+
+	aliases {
+		serial0 = &uart_AO;
+		serial2 = &uart_A;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x80000000>;
+	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		poll-interval = <100>;
+		power-button {
+			label = "power";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpio_ao GPIOAO_3 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-green {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio GPIOA_12 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
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
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
+		clocks = <&wifi32k>;
+		clock-names = "ext_clock";
+	};
+
+	ao_5v: regulator-ao-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "AO_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	vcc_1v8: regulator-vcc-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3>;
+		regulator-always-on;
+	};
+
+	vcc_3v3: regulator-vcc-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+		/* FIXME: actually controlled by VDDCPU_B_EN */
+	};
+
+	vddao_1v8: regulator-vddao-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
+	vddao_3v3: regulator-vddao-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&ao_5v>;
+		regulator-always-on;
+	};
+
+	vddcpu_a: regulator-vddcpu-a {
+		/*
+		 * MP8756GD Regulator.
+		 */
+		compatible = "pwm-regulator";
+
+		regulator-name = "VDDCPU_A";
+		regulator-min-microvolt = <730000>;
+		regulator-max-microvolt = <1022000>;
+
+		pwm-supply = <&ao_5v>;
+
+		pwms = <&pwm_ab 0 1250 0>;
+		pwm-dutycycle-range = <100 0>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vddcpu_b: regulator-vddcpu-b {
+		/*
+		 * Silergy SY8120B1ABC Regulator.
+		 */
+		compatible = "pwm-regulator";
+
+		regulator-name = "VDDCPU_B";
+		regulator-min-microvolt = <730000>;
+		regulator-max-microvolt = <1022000>;
+
+		pwm-supply = <&ao_5v>;
+
+		pwms = <&pwm_AO_cd 1 1250 0>;
+		pwm-dutycycle-range = <100 0>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	sound {
+		compatible = "amlogic,axg-sound-card";
+		model = "RADXA-ZERO2";
+		audio-aux-devs = <&tdmout_b>;
+		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
+				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
+				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
+				"TDM_B Playback", "TDMOUT_B OUT";
+
+		assigned-clocks = <&clkc CLKID_MPLL2>,
+				  <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
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
+
+			codec {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+	};
+
+	wifi32k: clock-0 {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
+	};
+};
+
+&arb {
+	status = "okay";
+};
+
+&cec_AO {
+	pinctrl-0 = <&cec_ao_a_h_pins>;
+	pinctrl-names = "default";
+	status = "disabled";
+	hdmi-phandle = <&hdmi_tx>;
+};
+
+&cecb_AO {
+	pinctrl-0 = <&cec_ao_b_h_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+	hdmi-phandle = <&hdmi_tx>;
+};
+
+&clkc_audio {
+	status = "okay";
+};
+
+&cpu0 {
+	cpu-supply = <&vddcpu_b>;
+	operating-points-v2 = <&cpu_opp_table_0>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu1 {
+	cpu-supply = <&vddcpu_b>;
+	operating-points-v2 = <&cpu_opp_table_0>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu100 {
+	cpu-supply = <&vddcpu_a>;
+	operating-points-v2 = <&cpub_opp_table_1>;
+	clocks = <&clkc CLKID_CPUB_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu101 {
+	cpu-supply = <&vddcpu_a>;
+	operating-points-v2 = <&cpub_opp_table_1>;
+	clocks = <&clkc CLKID_CPUB_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu102 {
+	cpu-supply = <&vddcpu_a>;
+	operating-points-v2 = <&cpub_opp_table_1>;
+	clocks = <&clkc CLKID_CPUB_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu103 {
+	cpu-supply = <&vddcpu_a>;
+	operating-points-v2 = <&cpub_opp_table_1>;
+	clocks = <&clkc CLKID_CPUB_CLK>;
+	clock-latency = <50000>;
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
+		"PIN_27", "PIN_28", "PIN_7", "PIN_11", "PIN_13", "PIN_15", "PIN_18", "PIN_40",
+		"", "", "", "", "", "", "", "",
+		/* GPIOH */
+		"", "", "", "", "PIN_19", "PIN_21", "PIN_24", "PIN_23",
+		"",
+		/* BOOT */
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "EMMC_PWRSEQ", "", "", "",
+		/* GPIOC */
+		"", "", "", "", "", "", "SD_CD", "PIN_36",
+		/* GPIOA */
+		"PIN_32", "PIN_12", "PIN_35", "", "", "PIN_38", "", "",
+		"", "", "", "", "LED_GREEN", "PIN_31", "PIN_3", "PIN_5",
+		/* GPIOX */
+		"", "", "", "", "", "", "SDIO_PWRSEQ", "",
+		"", "", "", "", "", "", "", "",
+		"", "BT_SHUTDOWN", "", "";
+};
+
+&gpio_ao {
+	gpio-line-names =
+		/* GPIOAO */
+		"PIN_8", "PIN_10", "", "BTN_POWER", "", "", "", "PIN_29",
+		"PIN_33", "PIN_37", "FAN", "",
+		/* GPIOE */
+		"", "", "";
+};
+
+&hdmi_tx {
+	status = "okay";
+	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
+	pinctrl-names = "default";
+	hdmi-supply = <&ao_5v>;
+};
+
+&hdmi_tx_tmds_port {
+	hdmi_tx_tmds_out: endpoint {
+		remote-endpoint = <&hdmi_connector_in>;
+	};
+};
+
+&ir {
+	status = "disabled";
+	pinctrl-0 = <&remote_input_ao_pins>;
+	pinctrl-names = "default";
+};
+
+&pwm_ab {
+	pinctrl-0 = <&pwm_a_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&xtal>;
+	clock-names = "clkin0";
+	status = "okay";
+};
+
+&pwm_ef {
+	pinctrl-0 = <&pwm_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&xtal>;
+	clock-names = "clkin0";
+	status = "okay";
+};
+
+&pwm_AO_ab {
+	pinctrl-0 = <&pwm_ao_a_pins>;
+	pinctrl-names = "default";
+	clocks = <&xtal>;
+	clock-names = "clkin0";
+	status = "okay";
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
+	vref-supply = <&vddao_1v8>;
+};
+
+/* SDIO */
+&sd_emmc_a {
+	status = "okay";
+	pinctrl-0 = <&sdio_pins>;
+	pinctrl-1 = <&sdio_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bus-width = <4>;
+	cap-sd-highspeed;
+	max-frequency = <100000000>;
+
+	non-removable;
+	disable-wp;
+
+	/* WiFi firmware requires power to be kept while in suspend */
+	keep-power-in-suspend;
+
+	mmc-pwrseq = <&sdio_pwrseq>;
+
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddao_1v8>;
+
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
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
+	max-frequency = <50000000>;
+	disable-wp;
+
+	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddao_3v3>;
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
+	vqmmc-supply = <&vcc_1v8>;
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
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		max-speed = <2000000>;
+		clocks = <&wifi32k>;
+		clock-names = "lpo";
+	};
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
+};
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
