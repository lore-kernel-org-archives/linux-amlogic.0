Return-Path: <SRS0=PYAY=4S=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE8D3C3F2CE
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Mar 2020 04:19:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BA8720848
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Mar 2020 04:19:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VvW+WaIN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBzUDtH7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BA8720848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mfj8nCaWtC6ERuzttqL+g+YxxY8KHPgXgF0DLyQvzk4=; b=VvW+WaINZlXnvErO0UT76vALUp
	6nqV0d8D+ZvIBP/KPoNO4UmQHVsn1FTd8o7zMmag72g/tDiMIS0QbTH6eFwVPfwfzjEjt3BOag7t9
	KnCL0HB2Ko9yvgMowPodYJ7DzkyPdMwklSP7RyHli0J8QpJWu7fiVwsKd7Rsu27nw1stlidt6nRZI
	4czpKC7oLJ42pM6agEnrjUgUJDEaR7ToJKc9yT29XlTKNpgJ8jdkF4iq0knPCIEpMJ49DkyMULKWm
	I3SD0LGM6I95UqsI/oP21ZZgbAfXfW/J95/6EBqJAxmO4L/8MXxs8sJLPUvXSkicj2t9kf2XN06lj
	MK7Y2Hiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8G4m-0001dH-7d; Sun, 01 Mar 2020 04:19:36 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8G3c-0000cf-Dy; Sun, 01 Mar 2020 04:18:26 +0000
Received: by mail-lj1-x241.google.com with SMTP id e3so7965335lja.10;
 Sat, 29 Feb 2020 20:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ld9u9TxxhB6GTRW+L7DSutYhV37fS80nY83j3DEGlJ8=;
 b=jBzUDtH76UDqLZrlYFXPDa+vE0yyF2sg8I5P0YTnC588gKp5vCxCL+SC5gXxmxTaJ+
 ZvwP1D7JRw1ZTpljJk8lrmA5zzuWhPUPcC0Y5nlguNgzK+EqMGOPYYVDlBOVfYwPHLZm
 fkTH7pCqVWwOrrAqwVXPNRaP2rkdKddCBZrcEVDVbo8H8Pk9TI+sSL85xOeC+STWiC1N
 BaNP3timZZ8/uy1PRYR0QUHlH+JeGqWxMoG+tiIf4BqUYclif8y9qWmVoGYVG8DRfuur
 6nBklPTqAIypEC3YJPNehrlWblGGWOwBYljpq1Uz2Z0MHkjH5x+t28gve/F4/SBbn6yP
 u4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ld9u9TxxhB6GTRW+L7DSutYhV37fS80nY83j3DEGlJ8=;
 b=a00m3kh4cUMbwWgK9cyyS3+TwvBdREFpP8rTgmFy5DWnTpCNphVml7mFRvodv6oovj
 Gln68quEVvFLGvVnIcxQHhEX7oAYmpuvnA4dYok84BYbrBV0g7zKnLh1NNg4HUy9ydX2
 QICGCt7GaiaKc1S6phJhAqjrgNq5V/Ww71dYqBK14r6VWC4C8crF9iSXa++zCDFqOPj2
 6b2Hx7d+cCTiMLOb7h8diOdTn6q4KzkODA2glZP+Su7F07Tw+Vw30LqMpHyGKAAA7GkC
 Zdyuqq1aACX9QBsfwCS1UO+xSSa1W2AMyKP/Vpwd2yFPepcuTLaAIgJWIMlA1a0MZldw
 OK2Q==
X-Gm-Message-State: ANhLgQ36sthaY12Ulnd9YN6ImDhDaTXQ4Xddg14BwmMPYwUvPhVM2bfn
 dAEFjIo/Ix+WkonZ2ujbknA=
X-Google-Smtp-Source: ADFU+vs12iT1iTeX/p5KjtPNv/Wr9Y0dMYncfHXhkIoFBBahFc1zaonlENtx8YhsJU86dj8sgNI+/A==
X-Received: by 2002:a2e:585c:: with SMTP id x28mr5777076ljd.285.1583036302079; 
 Sat, 29 Feb 2020 20:18:22 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id y24sm9568864lfg.63.2020.02.29.20.18.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 29 Feb 2020 20:18:21 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/3] arm64: dts: meson: add support for the SmartLabs
 SML-5442TW
Date: Sun,  1 Mar 2020 08:17:21 +0400
Message-Id: <1583036241-88937-4-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583036241-88937-1-git-send-email-christianshewitt@gmail.com>
References: <1583036241-88937-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_201824_575623_F8D14F5E 
X-CRM114-Status: GOOD (  18.17  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 =?UTF-8?q?Jer=C3=B4me=20Brunet?= <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The SmartLabs SML-5442TW is broadly similar to the P231 reference design
but with the following differences:

- The Yellow and Blue LEDs are available but disabled
- The Red and Green LEDs are used to signal off/on status
- uart_AO can be accessed after opening the case; soldered pins exist
- GPIOX_17 is forced high to enable the QCA9377 module

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts | 292 +++++++++++++++++++++
 2 files changed, 293 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index eef0045..6cf8c4a 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -27,6 +27,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p230.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p231.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-phicomm-n1.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-sml5442tw.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805x-p241.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-p281.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-tx3-mini.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
new file mode 100644
index 0000000..5fdf1ca
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
@@ -0,0 +1,292 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2016 Endless Computers, Inc.
+ * Author: Carlo Caione <carlo@endlessm.com>
+ * Copyright (c) 2018 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+/dts-v1/;
+
+#include "meson-gxl-s905d.dtsi"
+
+/ {
+	compatible = "smartlabs,sml5442tw", "amlogic,s905d",
+		"amlogic,meson-gxl";
+	model = "SmartLabs SML-5442TW";
+
+	aliases {
+		serial0 = &uart_AO;
+		serial1 = &uart_A;
+		ethernet0 = &ethmac;
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
+	leds {
+		compatible = "gpio-leds";
+
+		yellow {
+			label = "sml5442tw:yellow";
+			gpios = <&gpio_ao GPIOAO_6 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		blue {
+			label = "sml5442tw:blue";
+			gpios = <&gpio GPIODV_28 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		green {
+			label = "sml5442tw:green";
+			gpios = <&gpio_ao GPIOAO_9 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+
+		red {
+			label = "sml5442tw:red";
+			gpios = <&gpio GPIODV_27 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
+
+	hdmi_5v: regulator-hdmi-5v {
+		compatible = "regulator-fixed";
+
+		regulator-name = "HDMI_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&gpio GPIOH_3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	vddio_ao18: regulator-vddio_ao18 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	vddio_boot: regulator-vddio_boot {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_BOOT";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	vddao_3v3: regulator-vddao_3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	vcc_3v3: regulator-vcc_3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
+	};
+
+	wifi32k: wifi32k {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
+		clocks = <&wifi32k>;
+		clock-names = "ext_clock";
+	};
+
+	cvbs-connector {
+		compatible = "composite-video-connector";
+
+		port {
+			cvbs_connector_in: endpoint {
+				remote-endpoint = <&cvbs_vdac_out>;
+			};
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
+};
+
+&cec_AO {
+	status = "okay";
+	pinctrl-0 = <&ao_cec_pins>;
+	pinctrl-names = "default";
+	hdmi-phandle = <&hdmi_tx>;
+};
+
+&cvbs_vdac_port {
+	cvbs_vdac_out: endpoint {
+		remote-endpoint = <&cvbs_connector_in>;
+	};
+};
+
+&ethmac {
+	status = "okay";
+	phy-mode = "rmii";
+	phy-handle = <&internal_phy>;
+};
+
+/* This will enable the bluetooth module */
+&gpio {
+	bt-en {
+		gpio-hog;
+		gpios = <GPIOX_17 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "bt-en";
+	};
+};
+
+&hdmi_tx {
+	status = "okay";
+	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
+	pinctrl-names = "default";
+	hdmi-supply = <&hdmi_5v>;
+};
+
+&hdmi_tx_tmds_port {
+	hdmi_tx_tmds_out: endpoint {
+		remote-endpoint = <&hdmi_connector_in>;
+	};
+};
+
+&i2c_A {
+	status = "okay";
+	pinctrl-0 = <&i2c_a_pins>;
+	pinctrl-names = "default";
+};
+
+&internal_phy {
+	pinctrl-0 = <&eth_link_led_pins>, <&eth_act_led_pins>;
+	pinctrl-names = "default";
+};
+
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_input_ao_pins>;
+	pinctrl-names = "default";
+};
+
+&pwm_ef {
+	status = "okay";
+	pinctrl-0 = <&pwm_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&clkc CLKID_FCLK_DIV4>;
+	clock-names = "clkin0";
+};
+
+&saradc {
+	status = "okay";
+	vref-supply = <&vddio_ao18>;
+};
+
+/* Wireless SDIO Module */
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
+	mmc-pwrseq = <&sdio_pwrseq>;
+
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddio_boot>;
+};
+
+/* SD card */
+&sd_emmc_b {
+	status = "okay";
+	pinctrl-0 = <&sdcard_pins>;
+	pinctrl-1 = <&sdcard_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+
+	bus-width = <4>;
+	cap-sd-highspeed;
+	max-frequency = <100000000>;
+	disable-wp;
+
+	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddio_boot>;
+};
+
+/* eMMC */
+&sd_emmc_c {
+	status = "okay";
+	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
+	pinctrl-1 = <&emmc_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	max-frequency = <100000000>;
+	non-removable;
+	disable-wp;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+
+	mmc-pwrseq = <&emmc_pwrseq>;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vddio_boot>;
+};
+
+/* This is connected to the Bluetooth module: */
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+};
+
+/* This UART is brought out to the debug header */
+&uart_AO {
+	status = "okay";
+	pinctrl-0 = <&uart_ao_a_pins>;
+	pinctrl-names = "default";
+};
+
+&usb0 {
+	status = "okay";
+};
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
