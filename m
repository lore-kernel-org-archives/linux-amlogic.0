Return-Path: <SRS0=67Zv=6I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0552EC54FD0
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Apr 2020 12:45:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E2C120706
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Apr 2020 12:45:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sWa5JbMV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VL4hnD63"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E2C120706
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b4YSgNVT2u8zQoHChXJADlcGAYsgwgNPalYhwgw1LQA=; b=sWa5JbMVal13Cl
	dzG5s53weKhfrE4NSB9IwoZz58cKkH5qolGxMo+yg0kqLwe+y9NJq1cvZ8XQ8mPzfz2KBUfuyTR+2
	5UFIzzAEA4T5V6uepc+Sceo0vLLtJQX8Tv75fo4h/ingM3uanCSnE5TEcIRgpP/SjzU9m3LwHc1b0
	N4sqrgHdpRa4HWjQPaZRAnlTGUQ3GkRANyzA5conos/DSGXKRVPkqaH6s/hjAz6YL/48mnPTU911K
	7rW07z6I9q7jefpynvtGE1JsbBeV/iyF6j2TAbhL1CBiFbCHgicq+JENRwI15tIqoaFFEGS4R86a2
	hqKClquHbs+Twh/Km6jQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRxhV-0006L0-4p; Fri, 24 Apr 2020 12:45:01 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRxgn-0005Vu-K6
 for linux-amlogic@lists.infradead.org; Fri, 24 Apr 2020 12:44:20 +0000
Received: by mail-wm1-x344.google.com with SMTP id z6so10566740wml.2
 for <linux-amlogic@lists.infradead.org>; Fri, 24 Apr 2020 05:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=agrejjHN1jSQUIPzValMowV0V9G4jLbXqfp7dKhXeg4=;
 b=VL4hnD630F9Cp8ncfsX67ItFslZYYIaUdWrePL64ztGaCZ0ACig15BX4xUa0jGFbq+
 vpJHvI6JV1s0dTQqxwYedP4W71v8C+buWi7knk/odQn/Y5rqH6MAjObPhRoDlRhgjllQ
 gSrS522ubbqXIuQmd2EABeaNqzXyxAWEKNqUtE3zgaOaGDktRXd1rFftLf+xsyyAA3TQ
 ++nOjUjlwDeH8Lxc1oeyUHb63tGV5vVlki5D12SjLS04xTdTLogXueBSQlDTFbjHZeDr
 DIIzXR2sME0QDTpI0GnkUlN+lpar3D7mmd69AnjzQH3BtleJ43W0zIrk3xWufMeft7si
 3aBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=agrejjHN1jSQUIPzValMowV0V9G4jLbXqfp7dKhXeg4=;
 b=bVsDJcYzdvQQxIo47l+NH31oNaSKTDjHqergLO4JnDdeJMc+J+2IrA0aVfOvHtpnZL
 ZqOZuMIp7Q02/6fb76rbe72kxhkKEW0Y/wE06kwydZgEgYhcGizGa+fls7kN46B0Tx0U
 f0M8W+nFAe2z4sgQ/2qankFh2VXYkmg+8+k6E4HwYgRprFGKsHgMWUUV6w79b7HeC9+N
 vXCJFuOOU66MRKAjbBV+17rLLBOnkqTRLbcruR/y8Oe+WD5M2q59ccRsOFj6EncKg7ay
 1GspTgOWlILAv5bzR2lQdMWwYBhLkbXnP+RTKNPAqF0+4B99IEGZ0zH7zZo1N2WZu7rJ
 cSCg==
X-Gm-Message-State: AGi0PubwlzGL+MsodzM2fdzaAS8YCo/bNV2h3ebi9WwoR/3dPO86dSjY
 cuPOaxQ4otv2kpEEYd3VA9dMsQ==
X-Google-Smtp-Source: APiQypK53uwGHwsiA4BlwVwnADELEaIPcjzkyMBPiQOyRXlXMJipeX8y0dies4irFNTK8m288T6CQA==
X-Received: by 2002:a7b:c213:: with SMTP id x19mr9749211wmi.53.1587732255676; 
 Fri, 24 Apr 2020 05:44:15 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:4460:3fd3:382:4a71])
 by smtp.gmail.com with ESMTPSA id
 q184sm2692689wma.25.2020.04.24.05.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 05:44:14 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 2/2] arm64: dts: meson-sm1: add support for Hardkernel
 ODROID-C4
Date: Fri, 24 Apr 2020 14:44:06 +0200
Message-Id: <20200424124406.13870-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200424124406.13870-1-narmstrong@baylibre.com>
References: <20200424124406.13870-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_054417_780008_DE3DCDA6 
X-CRM114-Status: GOOD (  19.22  )
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
Cc: Dongjin Kim <tobetter@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Dongjin Kim <tobetter@gmail.com>

Add the board support for the Hardkernel Odroid-C4 single board computer.

The Odroid-C4 is the Odroid-C2 successor with same form factor, but using
a modern Amlogic S905X3 (SM1) SoC and 4x USB3 ports.

Signed-off-by: Dongjin Kim <tobetter@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 399 ++++++++++++++++++
 2 files changed, 400 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index eef0045320f2..5daab72f5639 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -40,4 +40,5 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-s912-libretech-pc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-khadas-vim3l.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-c4.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-a1-ad401.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
new file mode 100644
index 000000000000..4882c604a7e0
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
@@ -0,0 +1,399 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2020 Dongjin Kim <tobetter@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "meson-sm1.dtsi"
+#include <dt-bindings/gpio/meson-g12a-gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	compatible = "hardkernel,odroid-c4", "amlogic,sm1";
+	model = "Hardkernel ODROID-C4";
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
+	leds {
+		compatible = "gpio-leds";
+
+		led-blue {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio_ao GPIOAO_11 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			panic-indicator;
+		};
+	};
+
+	tflash_vdd: regulator-tflash_vdd {
+		compatible = "regulator-fixed";
+
+		regulator-name = "TFLASH_VDD";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
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
+	hub_5v: regulator-hub_5v {
+		compatible = "regulator-fixed";
+		regulator-name = "HUB_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_5v>;
+
+		/* Connected to the Hub CHIPENABLE, LOW sets low power state */
+		gpio = <&gpio GPIOH_4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
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
+		reset-assert-us = <10000>;
+		reset-deassert-us = <30000>;
+		reset-gpios = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
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
+
+	/*
+	 * WARNING: The USB Hub on the Odroid-C4 needs a reset signal
+	 * to be turned high in order to be detected by the USB Controller
+	 * This signal should be handled by a USB specific power sequence
+	 * in order to reset the Hub when USB bus is powered down.
+	 */
+	usb-hub {
+		gpio-hog;
+		gpios = <GPIOH_4 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "usb-hub-reset";
+	};
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
+
+&usb2_phy1 {
+	/* Enable the hub which is connected to this port */
+	phy-supply = <&hub_5v>;
+};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
