Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FCAC38142
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 15:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Apxh9XTMdehIh8nlJiZPUytF/OHGl70lEpxoqRM42HU=; b=R2j6J/Wru/dgN1
	Ys5i4R0AdG0bCnR8oo/a/M/pIoC+NkjN27AmTQYYd+RRFOly3ERaMdoyJMg5L4ddEZTJybpiQGcNY
	jYzD3q5RQkO0xN/zRX0HsVtRlgoQj00UC2o5mZ7RH+gkvqTSofUOkQtXdOUB7gvJK6EOmuCTlDauc
	fF4dDjln2e1HZvd0gReeqJBoqRtjs5odxwxhPOixr+EZHjE4OB4Vf6HJwdnBRivx7Z/+jxMz9WI8V
	HNzXMgCjNuNJwTVlotgDfu1njbolCrU8WLTCVPR/Og4jR0kNngQz7e65RJ5K02PFBfjgyDz2vzIiF
	S5R9q+6SySf/gSR1K+3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLQIl-00FOZK-Bm; Fri, 27 Jan 2023 15:06:03 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLQIU-00FOVM-5j; Fri, 27 Jan 2023 15:05:48 +0000
Received: by mail-wm1-x32d.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so5612373wmb.2;
        Fri, 27 Jan 2023 07:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2yUZnCC5Nfg8sIMe5cwqfneD9ywtGZHXM6QwrCZeBY=;
        b=COpOcZaxfSkwMINkKGfGtKx1qS1UVNa4nyFUOXy9NpoecQfP1jl+D6izw53VdZ3dem
         AcdY9vScIIiWrfKxSyGt8pxrjc9e5Pk9GgDDjJ8eL07POuR6h7cuuC5XztjbtpxJFics
         ltPKUzFuA8QC+j0K2/WRDPu9f2i9RgBXMgLaUp4vfkulDoB4XDBEf8QfBaBROVjA1Wj8
         70VJ9rvlAlAjA+B9ruSu2pbe9d+4V7hozMSH38+PzY6pF81qVUazbiTuHwOT9UTvqY+O
         TIGRsGQrgtlaaVAem9MEkAv6165qIeSprUEhuiPQvB16kv51sNrjbVWU5dgfv7OkffW9
         cg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2yUZnCC5Nfg8sIMe5cwqfneD9ywtGZHXM6QwrCZeBY=;
        b=RK3s0Kyr1jvmr+1954LbxxUUMiqPIvAcB6UFU8UMo/hRosjkxPERMjovTQD26E1HVi
         G4749U3FbG7LIfU0BCQwaFA/vh3DKCyGki6MWM7X7+XpWqdndped5wfQs6YP7trEbR7E
         FQwPe07O9tpVzW3xpRS7/4rmzugNQ3i7S9EGrf9Nb7CYrjRgmc9N+oH07rUGjuCWFucK
         +2NWwEB0CCp4aekX6YAraESTtHJH66L9uQNWou8Z9LTA3fNdhxAGgS4tCKmwcVM64LOy
         iwqZZ7NexUW4+DRQYNjiye5bhdHSyePl6gAiFgnknm7TvTtDSrUmH3H0bqXESQqq0mNO
         EX3A==
X-Gm-Message-State: AFqh2kpAHgCQRx2RFRtkmfy4isclPtpk8QSRXyEQ+nxjEp63k/ZzFP8N
	7lCv7md4VCe8Y/OtS8iRBUM=
X-Google-Smtp-Source: AMrXdXt/3ydWgS76GgADBkN1HuOKpbgj6JByan7yiH9GGIpIRSN/9TOac06Ut3TNvozsaMqdy0XtXA==
X-Received: by 2002:a05:600c:a11:b0:3db:f1f:bc31 with SMTP id z17-20020a05600c0a1100b003db0f1fbc31mr37466072wmp.16.1674831944422;
        Fri, 27 Jan 2023 07:05:44 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id l4-20020a7bc444000000b003db03725e86sm4573395wmi.8.2023.01.27.07.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:05:43 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: meson: add support for Radxa Zero2
Date: Fri, 27 Jan 2023 15:05:36 +0000
Message-Id: <20230127150536.3719090-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127150536.3719090-1-christianshewitt@gmail.com>
References: <20230127150536.3719090-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_070546_280334_F10E32C1 
X-CRM114-Status: GOOD (  17.39  )
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
Cc: Yuntian Zhang <yt@radxa.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Yuntian Zhang <yt@radxa.com>

Radxa Zero2 is a small form factor SBC based on the Amlogic A311D
chipset that ships in a number of eMMC configurations:

- Amlogic A311D (Quad A73 + Dual A53) CPU
- 4GB LPDDR4 RAM
- 32/64/128GB eMMC
- Mali G52-MP4 GPU
- HDMI 2.1 output (micro)
- BCM4345 WiFi (2.4/5GHz a/b/g/n/ac) and BT 5.0
- 1x USB 2.0 port - Type C (OTG)
- 1x USB 3.0 port - Type C (Host)
- 1x micro SD Card slot
- 40 Pin GPIO header

Signed-off-by: Yuntian Zhang <yt@radxa.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
The original dts from Yuntian contains some additional content for
the USB-C device, but this is not working for me so I have ommited
it and kept things simple. I've also left out some pwm-fan/thermal
content; while the board does not ship with a fan the A311D chip
should be used with one and I believe the board has a connector to
add a fan, but until this is confirmed (and production boards are
available) it's best left out.

Changes from v1:
- Corrected underscores in node names
- Corrected wifi32k clock node name

 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../dts/amlogic/meson-g12b-radxa-zero2.dts    | 489 ++++++++++++++++++
 2 files changed, 490 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 04114e8c9992..bb1af1d80c21 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-go-ultra.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2-plus.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2l.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-radxa-zero2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-ugoos-am6.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
new file mode 100644
index 000000000000..9a60c5ec2072
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
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
+	clock-names = "clkin2";
+	status = "okay";
+};
+
+&pwm_AO_ab {
+	pinctrl-0 = <&pwm_ao_a_pins>;
+	pinctrl-names = "default";
+	clocks = <&xtal>;
+	clock-names = "clkin3";
+	status = "okay";
+};
+
+&pwm_AO_cd {
+	pinctrl-0 = <&pwm_ao_d_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&xtal>;
+	clock-names = "clkin4";
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
