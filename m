Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5965CC48BEB
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 17:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1elk81GUChqEQk+adMPtip5haaJunZOtFg7f6MKqxcw=; b=GyWjAQPDBn8ByW
	BeazGctTdg+c5TiExh/KBO/5EZZWPpoiFOXEURl8HfyWKq80ZIlwIKWgX1e8u+JUOhB+5B6bPP9ds
	ut3laPG9PxVrvL5T6JqPaeecCDBDZj9Ecuseax5pNgKY75FQ7MM8jB9cPf0Dn7PnEmLyq8p0giaqn
	It4tzlSYhG0kGY+Mv/idPvfdBUUKNnJRSERtRbQDnUKWDfZbKun6O4z7+KP0M3sMZ4ECJ4NtmNiVY
	qmjIFbZqYb5cCst/SH7+U5f92nV52CpuDBn6sq++STAF2zW4jDB/upXhW/DUpKjJd1kt3RHf+ZHmz
	Z68LBghh8ISA2S21vISQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZwOo-0000000A6oe-18bO;
	Tue, 13 Feb 2024 17:16:50 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZwOl-0000000A6nM-1i88
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 17:16:48 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4108cbd92b9so25073985e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 09:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1707844605; x=1708449405; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7cj1Oe/QX1RRD7S1fFe9Rz4XJ+j9cEWjaKgta5j8NIM=;
        b=cdbHAFcmPzynRzmoE/X+CRaThXIEuy0sPonD2J/okGKzDpMRXUVLsILTwkH7heJXP/
         psAcebUlumxok4RQl5nC3QyAzb5kJ6PuAk8fOC6j0DY5IR+/1VBeTkHGhdKUj0Ud6NED
         9vE7VwaJXG0y4XIPedZlb5nYnJXgYHZyxsR+dCKs3WEOLMeAhdrjIQbZcA6jzFyGKyQN
         o1yzZbnuWesWh0rlUQqZHuEx6LkmypdZgnnjtnOrmnv40ho+TNvue4ogZftNxdnq1lYr
         fKwlpS4yUO880GbkL0jcBUp6MlSonEiY9Q/f4NF2tia8/Iw4iBPy5cpNkyxD1S6dHp4G
         ccwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707844605; x=1708449405;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7cj1Oe/QX1RRD7S1fFe9Rz4XJ+j9cEWjaKgta5j8NIM=;
        b=eFR9VPCvdZ9CIcM8CkUR2COa5/js8QudbuS9IJpyemioAUmcsNm6ODTvmpyXzpJPhr
         EMWR3l6B3AoBo2h+WWX+R4QWAdF7pNzBoc8NcGT04AO4/JAM2rf50n/2lx8iHcviT6aW
         HqjnH8h/tWOAxh/wegdCZuu3MbI6oO99dzbrBZv4O2yhKOvgIaP6ff0BGEJWRf1oO9ZL
         UiQ00TXTZcJlbK/SKTUOQ/BGjVPsPySl+uQvvUTnEXWEMZex4bU82TjlnacL3SgZHu3K
         vueMA52lfQrYFd62BjXUx2Y1nU0JrU6nZoEg5J9ar/5LAAkfgVvWaRYitV3L+/FvAPwh
         DJRA==
X-Gm-Message-State: AOJu0YxiKEtfov/c3eKlf+PWV/f0bEHcGolEZ1c/E+1F/XxyxZngDzOu
	cftvR3n0nfly1cRg86uIoyWuAmeicuVeWdzp1kwiQpCzt5v4babTOBKIvyuZKH1CHSgyTB5vAHC
	07qI=
X-Google-Smtp-Source: AGHT+IFXa4ALJoj4QgElTbL6ttwKj0Mfu68eixPhYDzpeF58xTmu2DT3iYg15zA067ww3sbyipDAEw==
X-Received: by 2002:a05:600c:1908:b0:411:6f3f:4950 with SMTP id j8-20020a05600c190800b004116f3f4950mr187106wmq.32.1707844605634;
        Tue, 13 Feb 2024 09:16:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+iYEVpa6muOZ5szHPnvlI58muAGSdGb0GeFhv0FbfY4eJhCHUW5w5phPrCDb68S14YZba1GzAuLgUYWHY7R9eHkokDYwx9VTyVF5aN0qNGdS5DV5Qie7g2F70SP76pVe1F7Bhg8zaQvOtxjQioYBWLHlgRocN5j6QWC6ljeqJSbvSLQCY7thxCgrARVfTuRLm/9ZC4R47J9rGoAZnlTuAnfISJdAYzT6dUUShttamvrRW4TLWiUk0qOGMMa3r80tVoy3VyBeEqvf9peRxksAmuKqLoSkyaSTQNwyE6c0bMzQq3rsOnnVtq7EO61MQADhfo1K4J0TkpNNXj4L0mTvmvtVKTmSIoLt+pQ2KNWgkGlg=
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id j9-20020a05600c190900b00410c2f39833sm7805785wmq.30.2024.02.13.09.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 09:16:45 -0800 (PST)
Message-ID: <59ca7d9a-a8dd-4062-852e-18b80ace6d7e@freebox.fr>
Date: Tue, 13 Feb 2024 18:13:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 3/4] arm64: dts: amlogic: add fbx8am board
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <07f7a695-18a0-4211-82e9-b1e2c7166969@freebox.fr>
In-Reply-To: <07f7a695-18a0-4211-82e9-b1e2c7166969@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_091647_497484_8215B279 
X-CRM114-Status: GOOD (  10.65  )
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

From: Pierre-Hugues Husson <phhusson@freebox.fr>

The fbx8am boards are based on the Amlogic Meson G12A S905X2 SoC,
and the SEI510 board design.

Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts | 462 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 462 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
new file mode 100644
index 0000000000000..af211d8f39520
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
@@ -0,0 +1,462 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (c) 2024 Freebox SAS
+
+/*
+ * SEI codename: SEI530FB (based on SEI510)
+ * Freebox codename: fbx8am
+ * Commercial names: Freebox Pop, Player TV Free 4K
+ */
+
+/dts-v1/;
+
+#include "meson-g12a.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/meson-g12a-gpio.h>
+#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
+
+/ {
+	compatible = "freebox,fbx8am", "amlogic,g12a";
+	model = "Freebox Player Pop";
+	chassis-type = "embedded";
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		poll-interval = <100>;
+
+		/* Physical user-accessible reset button near USB port */
+		power-button {
+			label = "Reset";
+			linux,code = <BTN_MISC>;
+			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	spdif_dit: audio-codec-2 {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+		status = "okay";
+		sound-name-prefix = "DIT";
+	};
+
+	aliases {
+		serial0 = &uart_AO;
+		ethernet0 = &ethmac;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
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
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x80000000>;
+	};
+
+	ao_5v: regulator-ao-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "AO_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&dc_in>;
+		regulator-always-on;
+	};
+
+	dc_in: regulator-dc-in {
+		compatible = "regulator-fixed";
+		regulator-name = "DC_IN";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-always-on;
+	};
+
+	emmc_1v8: regulator-emmc-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "EMMC_1V8";
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
+	vddao_3v3_t: regulator-vddao-3v3-t {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3_T";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vddao_3v3>;
+		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
+		enable-active-high;
+	};
+
+	vddcpu: regulator-vddcpu {
+		/*
+		 * SY8120B1ABC DC/DC Regulator.
+		 */
+		compatible = "pwm-regulator";
+
+		regulator-name = "VDDCPU";
+		regulator-min-microvolt = <721000>;
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
+	vddio_ao1v8: regulator-vddio-ao1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <10>; /* required for 43752 */
+		clocks = <&wifi32k>;
+		clock-names = "ext_clock";
+	};
+
+	wifi32k: wifi32k {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
+	};
+
+	sound {
+		compatible = "amlogic,axg-sound-card";
+		model = "fbx8am";
+		audio-aux-devs = <&tdmout_b>;
+		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
+				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
+				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
+				"TDM_B Playback", "TDMOUT_B OUT",
+				"SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
+				"SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
+				"SPDIFOUT_A IN 2", "FRDDR_C OUT 3";
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
+		/* spdif hdmi or toslink interface */
+		dai-link-4 {
+			sound-dai = <&spdifout_a>;
+
+			codec-0 {
+			sound-dai = <&spdif_dit>;
+			};
+
+			codec-1 {
+				sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_A>;
+			};
+		};
+
+		/* spdif hdmi interface */
+		dai-link-5 {
+			sound-dai = <&spdifout_b>;
+
+			codec {
+				sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_B>;
+			};
+		};
+
+		/* hdmi glue */
+		dai-link-6 {
+			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
+
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
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu1 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu2 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu3 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&ethmac {
+	status = "okay";
+	phy-handle = <&internal_ephy>;
+	phy-mode = "rmii";
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
+&spdifout_a {
+	pinctrl-0 = <&spdif_out_h_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&spdifout_b {
+	status = "okay";
+};
+
+&hdmi_tx {
+	status = "okay";
+	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
+	pinctrl-names = "default";
+};
+
+&hdmi_tx_tmds_port {
+	hdmi_tx_tmds_out: endpoint {
+		remote-endpoint = <&hdmi_connector_in>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
+	pinctrl-names = "default";
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
+&pwm_ef {
+	status = "okay";
+	pinctrl-0 = <&pwm_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&xtal>;
+	clock-names = "clkin0";
+};
+
+&pdm {
+	pinctrl-0 = <&pdm_din0_z_pins>, <&pdm_din1_z_pins>,
+		    <&pdm_din2_z_pins>, <&pdm_din3_z_pins>,
+		    <&pdm_dclk_z_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&saradc {
+	status = "okay";
+	vref-supply = <&vddio_ao1v8>;
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
+	sd-uhs-sdr50;
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
+	vqmmc-supply = <&vddio_ao1v8>;
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
+	non-removable;
+	disable-wp;
+
+	mmc-pwrseq = <&emmc_pwrseq>;
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&emmc_1v8>;
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
+	dr_mode = "host";
+};
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
