Return-Path: <SRS0=mTG8=N2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7131C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Sep 2021 14:29:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6489C60F9C
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Sep 2021 14:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6489C60F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=lexina.in
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4XVRW1U1LTbfODmW6fnVRaNJjgSq918SLYMlpmZCjRA=; b=ZiZ5aCw1OhFsKY
	KobkoHSzR8EOLFweeKbsbQbbYWA2rCrRoFxEigrTvyqZG207LwyD5pDrCW+N3uzowwIgkovTl/OfP
	cZhXRle/95o4dmIzlBzyGsidM68RxnF7VfTSuTh3unWlSUDiMW9qJfeP9IJKjjNtNrLprMXz/Km5/
	M3iqse8rZQAHctvBPNXSkwNNNH462J4E4TaBLPcHvshUYHxMDkE/8ZNYLqAqqvTNlZRy93JEbrdNK
	vAe/psgcW5DC+MvCowMfO2dgXa+PIB7MtEKMUlyZg8NHvLNm79LXH9ojcmy7Yrd/YWSWnQEtdiMCW
	8PPibmB4piOdfbri/d3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMWfI-00EG2h-Jx; Sat, 04 Sep 2021 14:29:04 +0000
Received: from mx.msync.work ([95.217.65.204])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMWec-00EFqC-N6; Sat, 04 Sep 2021 14:28:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0538ED848F; Sat,  4 Sep 2021 14:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1630765700; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=NFHHl2yQyDuG3xnz3TVRh2VmYNenLDMDPA7SJk/eRXk=;
 b=m3tm68n5wDmVFyOvTOyaQ55kgPkipXFfTy9rgfxwu17F5lJb6C1Inaxj1bsT+t0tH8HR48
 NkBzFd+v7kCBOOq/yvm49AvZ9vjYJj69he9SmkR/r75Av4RjKa+BuB9f6YTVt5RIwUcw1A
 eXyagToqMrn6INbHuzc/4k3j0F87PVYVSMtmh9W336xly9w2jsz/VRJHnnIHYax/kOnaFs
 l1Vnevcvq79mVWgV0yHeJfZ6OmUv69JXJJefa4eyr6hofesq1pguvr8GRO80uF7n+tRWaK
 Z4EdvrWBZyxhMBV/btFd3gxAZCB/HkpseQyD00o2AeOXjhHraGCEv91fD2qd3Q==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] arm64: dts: meson-axg: add support for JetHub D1
Date: Sat,  4 Sep 2021 17:27:45 +0300
Message-Id: <20210904142745.183875-5-adeep@lexina.in>
In-Reply-To: <20210904142745.183875-1-adeep@lexina.in>
References: <20210904142745.183875-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210904_072823_128229_FF848C2E 
X-CRM114-Status: GOOD (  15.27  )
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

JetHome Jethub D1 (http://jethome.ru/jethub-d1) is a home automation
controller with the following features:
- DIN Rail Mounting
- Amlogic A113X (ARM Cortex-A53) quad-core up to 1.5GHz
- no video out
- 512Mb/1GB LPDDR4
- 8/16GB eMMC flash
- 1 x USB 2.0
- 1 x 10/100Mbps ethernet
- WiFi / Bluetooth AMPAK AP6255 (Broadcom BCM43455) IEEE 802.11a/b/g/n/ac,
  Bluetooth 4.2.
- TI CC2538 + CC2592 Zigbee Wireless Module with up to 20dBm output power
  and Zigbee 3.0 support.
- 2 x gpio LEDS
- GPIO user Button
- 1 x 1-Wire
- 2 x RS-485
- 4 x dry contact digital GPIO inputs
- 3 x relay GPIO outputs
- DC source with a voltage of 9 to 56 V / Passive POE

Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
---
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-axg-jethome-jethub-j100.dts | 354 ++++++++++++++++++
 2 files changed, 355 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 2c3ce7c401a5..3ba6f58b9833 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_MESON) += meson-axg-s400.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j100.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-sei510.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
new file mode 100644
index 000000000000..bc10f3357c09
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
@@ -0,0 +1,354 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2021 Vyacheslav Bocharov <adeep@lexina.in>
+ * Copyright (c) 2020 JetHome
+ * Author: Aleksandr Kazantsev <ak@tvip.ru>
+ * Author: Alexey Shevelkin <ash@tvip.ru>
+ * Author: Vyacheslav Bocharov <adeep@lexina.in>
+ */
+
+/dts-v1/;
+
+#include "meson-axg.dtsi"
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/thermal/thermal.h>
+
+/ {
+	compatible = "jethome,jethub-j100", "amlogic,a113d", "amlogic,meson-axg";
+	model = "JetHome JetHub J100";
+	aliases {
+		serial0 = &uart_AO;   /* Console */
+		serial1 = &uart_AO_B; /* External UART (Wireless Module) */
+		ethernet0 = &ethmac;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	/* 1024MB RAM */
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x40000000>;
+	};
+
+	reserved-memory {
+		linux,cma {
+			size = <0x0 0x400000>;
+		};
+	};
+
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
+	};
+
+	vcc_3v3: regulator-vcc_3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
+	vcc_5v: regulator-vcc_5v {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	vddao_3v3: regulator-vddao_3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_5v>;
+		regulator-always-on;
+	};
+
+	vddio_ao18: regulator-vddio_ao18 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
+	vddio_boot: regulator-vddio_boot {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_BOOT";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
+	usb_pwr: regulator-usb_pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "USB_PWR";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_5v>;
+		regulator-always-on;
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_7 GPIO_ACTIVE_LOW>;
+		clocks = <&wifi32k>;
+		clock-names = "ext_clock";
+	};
+
+	wifi32k: wifi32k {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		pwms = <&pwm_ab 0 30518 0>; /* PWM_A at 32.768KHz */
+	};
+
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&scpi_sensors 0>;
+			trips {
+				cpu_passive: cpu-passive {
+					temperature = <70000>; /* millicelsius */
+					hysteresis = <2000>; /* millicelsius */
+					type = "passive";
+				};
+
+				cpu_hot: cpu-hot {
+					temperature = <80000>; /* millicelsius */
+					hysteresis = <2000>; /* millicelsius */
+					type = "hot";
+				};
+
+				cpu_critical: cpu-critical {
+					temperature = <100000>; /* millicelsius */
+					hysteresis = <2000>; /* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+
+		cpu_cooling_maps: cooling-maps {
+			map0 {
+				trip = <&cpu_passive>;
+				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+
+			map1 {
+				trip = <&cpu_hot>;
+				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
+	};
+};
+
+&efuse {
+	sn: sn@32 {
+		reg = <0x32 0x20>;
+	};
+
+	eth_mac: eth_mac@0 {
+		reg = <0x0 0x6>;
+	};
+
+	bt_mac: bt_mac@6 {
+		reg = <0x6 0x6>;
+	};
+
+	wifi_mac: wifi_mac@c {
+		reg = <0xc 0x6>;
+	};
+
+	bid: bid@12 {
+		reg = <0x12 0x20>;
+	};
+};
+
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_rmii_x_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&eth_phy0>;
+	phy-mode = "rmii";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* ICPlus IP101A/G Ethernet PHY (vendor_id=0x0243, model_id=0x0c54) */
+		eth_phy0: ethernet-phy@0 {
+			/* compatible = "ethernet-phy-id0243.0c54";*/
+			max-speed = <100>;
+			reg = <0>;
+
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+			reset-gpios = <&gpio GPIOZ_5 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+/* Internal I2C bus (on CPU module) */
+&i2c1 {
+	status = "okay";
+	pinctrl-0 = <&i2c1_z_pins>;
+	pinctrl-names = "default";
+
+	/* RTC */
+	pcf8563: pcf8563@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+		status = "okay";
+	};
+};
+
+/* Peripheral I2C bus (on motherboard) */
+&i2c_AO {
+	status = "okay";
+	pinctrl-0 = <&i2c_ao_sck_10_pins>, <&i2c_ao_sda_11_pins>;
+	pinctrl-names = "default";
+};
+
+&pwm_ab {
+	status = "okay";
+	pinctrl-0 = <&pwm_a_x20_pins>;
+	pinctrl-names = "default";
+};
+
+/* wifi module */
+&sd_emmc_b {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	pinctrl-0 = <&sdio_pins>;
+	pinctrl-1 = <&sdio_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+
+	bus-width = <4>;
+	cap-sd-highspeed;
+	sd-uhs-sdr104;
+	max-frequency = <200000000>;
+	non-removable;
+	disable-wp;
+
+	mmc-pwrseq = <&sdio_pwrseq>;
+
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddio_boot>;
+
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
+
+/* emmc storage */
+&sd_emmc_c {
+	status = "okay";
+	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
+	pinctrl-1 = <&emmc_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	max-frequency = <200000000>;
+	non-removable;
+	disable-wp;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+
+	mmc-pwrseq = <&emmc_pwrseq>;
+
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vddio_boot>;
+};
+
+/* UART Bluetooth */
+&uart_B {
+	status = "okay";
+	pinctrl-0 = <&uart_b_z_pins>, <&uart_b_z_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		shutdown-gpios = <&gpio GPIOZ_7 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+/* UART Console */
+&uart_AO {
+	status = "okay";
+	pinctrl-0 = <&uart_ao_a_pins>;
+	pinctrl-names = "default";
+};
+
+/* UART Wireless module */
+&uart_AO_B {
+	status = "okay";
+	pinctrl-0 = <&uart_ao_b_pins>;
+	pinctrl-names = "default";
+};
+
+&usb {
+	status = "okay";
+	phy-supply = <&usb_pwr>;
+};
+
+&spicc1 {
+	status = "okay";
+};
+
+&gpio {
+	gpio-line-names =
+		"", "", "", "", "", // 0 - 4
+		"", "", "", "", "", // 5 - 9
+		"UserButton", "", "", "", "", // 10 - 14
+		"", "", "", "", "", // 15 - 19
+		"", "", "", "", "", // 20 - 24
+		"", "LedRed", "LedGreen", "Output3", "Output2", // 25 - 29
+		"Output1", "", "", "", "", // 30 - 34
+		"", "ZigBeeBOOT", "", "", "", // 35 - 39
+		"", "ZigBeeRESET", "", "Input4", "Input3", // 40 - 44
+		"Input2", "Input1", "", "", "", // 45 - 49
+		"", "", "", "", "", // 50 - 54
+		"", "", "", "", "", // 55 - 59
+		"", "", "", "", "", // 60 - 64
+		"", "", "", "", "", // 65 - 69
+		"", "", "", "", "", // 70 - 74
+		"", "", "", "", "", // 75 - 79
+		"", "", "", "", "", // 80 - 84
+		"", ""; // 85-86
+};
+
+&cpu0 {
+	#cooling-cells = <2>;
+};
+
+&cpu1 {
+	#cooling-cells = <2>;
+};
+
+&cpu2 {
+	#cooling-cells = <2>;
+};
+
+&cpu3 {
+	#cooling-cells = <2>;
+};
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
