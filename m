Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDECC7618B
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Mar 2023 16:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g7QqMhIIwdb6gseY7mY24EaALEth+i61MZsgumQGh/k=; b=aCTIMTGUdtx+tK
	R7kJRsDRnSxPCd+Q8nPA58FZ+7POHMrp1hS5tKNebbyJv0V+QK6efKcGBbDczxPp62x0tCY0lQFua
	IxVOtWCihWhAyStUmn+zAavCFGiT1XBGDVGEeIMfCO/SevPolwj2UE4pSMwupIDEoEAQ0h87dHFKc
	3CJ+Gl4kHiatFK5AgQXHjeb1CMXk+zrS72/89tbPiXClZSfA06Zr7FkAFrxK1OaUzG0/Tqmyfnz/1
	01Zi4S5ylBv4VHidRfsRND8NtGatC/pbcrAB+4EX3fj9l3ahtQHvS2wbThbhcHOrmxfcOrrZiaUnq
	V1jn7D2SZSyINsXVImig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcqWy-00H0kX-22;
	Thu, 16 Mar 2023 16:32:44 +0000
Received: from smtp2-g21.free.fr ([212.27.42.2])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcqWv-00H0j5-1a
	for linux-amlogic@lists.infradead.org;
	Thu, 16 Mar 2023 16:32:43 +0000
Received: from [192.168.108.81] (unknown [213.36.7.13])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 01C352003FC;
	Thu, 16 Mar 2023 17:32:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1678984356;
	bh=8sxdS7H6QXG5b1HcsaZpyapE7VTJ4sB6Qlb5kGXbL10=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MQRtlVLIN+1AQSla3QoJO1URqtofQVlubM5Jv54dcIUtXcFF+O7sIwiVdAO7e0uBo
	 I6j/4Ask5QawH2XJw5UxUceItUCEJBKGXu7bxAMAMjqQ6PIIYiS+vr+EeXcsCQKzfj
	 y6vZPFJ1k2DqepjkRNPNRX0jDPZuXftuOh2+7fB6kniW6bkT/Gdai3LYX4amv6tmDk
	 day6Q/UlFc5IGjtd4WSAT68vMUYKLUTsY/8BM4lUrivDtTVnOrnfjvpnpDVNqWh24P
	 x+EzwrE+jGem4ugyEABr+sEalD7mXxFpDlaCGthJbwMjIr2IbauRel1jIFxgJLjbfV
	 rlcKWcq8UmPfA==
Message-ID: <7ac7d5c5-912b-7598-0050-3b8c76ef6cab@free.fr>
Date: Thu, 16 Mar 2023 17:32:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] mmc: meson-gx: increase power-up delay
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Pierre-Hugues Husson <phh@phh.me>, Rong Chen <rong.chen@amlogic.com>,
 Yang Yingliang <yangyingliang@huawei.com>, MMC <linux-mmc@vger.kernel.org>,
 AML <linux-amlogic@lists.infradead.org>
References: <11a8a0c8-a5b1-8f38-a139-97172ab7be68@free.fr>
 <0696106f-8d70-6410-999a-fcda6c5b39c2@gmail.com>
 <b6971cd6-80f2-522a-64fb-82b126500010@free.fr>
 <1jcz5axc8j.fsf@starbuckisacylon.baylibre.com>
 <CAPDyKFqYK2bEbkZ7A=t-VYwmgSYJUGxm2Ew5-7CFeO741fB-_w@mail.gmail.com>
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
In-Reply-To: <CAPDyKFqYK2bEbkZ7A=t-VYwmgSYJUGxm2Ew5-7CFeO741fB-_w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_093241_809967_1ABE8D4E 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 16/03/2023 12:59, Ulf Hansson wrote:

> If the problem is regulator specific, this would be the correct thing to do.
> 
> Although, if the problem is pwrseq specific, like that we need a delay
> after enabling the clock and asserting the GPIO enable pin for the
> WiFi chip, then we have the "post-power-on-delay-ms" of the pwrseq
> node to play with instead.

Heiner, Jerome, Uffe, Amlogic DT maintainers,

Perhaps tweaking the driver for every user is too intrusive.

Another solution would be to factorize all boards that implement
the reference design SDIO-based RF (WiFi + BT using brcm).

Then we can add post-power-on-delay-ms = 20 in sdio_pwrseq.

NB: there's vddio_ao1v8 vs vddao_1v8 in sei510.
Is my addition OK?

RFC prototype:

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
index e3bb6df42ff3e..42b5dcf358912 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "meson-g12a.dtsi"
+#include "meson-g12a-ref-design-brcm-rf.dtsi"
 #include <dt-bindings/gpio/meson-g12a-gpio.h>
 #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
 
@@ -53,13 +54,6 @@ emmc_pwrseq: emmc-pwrseq {
 		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
 	};
 
-	sdio_pwrseq: sdio-pwrseq {
-		compatible = "mmc-pwrseq-simple";
-		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
-		clocks = <&wifi32k>;
-		clock-names = "ext_clock";
-	};
-
 	ao_5v: regulator-ao_5v {
 		compatible = "regulator-fixed";
 		regulator-name = "AO_5V";
@@ -182,13 +176,6 @@ codec {
 			};
 		};
 	};
-
-	wifi32k: wifi32k {
-		compatible = "pwm-clock";
-		#clock-cells = <0>;
-		clock-frequency = <32768>;
-		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
-	};
 };
 
 &arb {
@@ -299,37 +286,6 @@ &saradc {
 	vref-supply = <&vddao_1v8>;
 };
 
-/* SDIO */
-&sd_emmc_a {
-	status = "okay";
-	pinctrl-0 = <&sdio_pins>;
-	pinctrl-1 = <&sdio_clk_gate_pins>;
-	pinctrl-names = "default", "clk-gate";
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	bus-width = <4>;
-	cap-sd-highspeed;
-	sd-uhs-sdr50;
-	max-frequency = <100000000>;
-
-	non-removable;
-	disable-wp;
-
-	/* WiFi firmware requires power to be kept while in suspend */
-	keep-power-in-suspend;
-
-	mmc-pwrseq = <&sdio_pwrseq>;
-
-	vmmc-supply = <&vddao_3v3>;
-	vqmmc-supply = <&vddao_1v8>;
-
-	brcmf: wifi@1 {
-		reg = <1>;
-		compatible = "brcm,bcm4329-fmac";
-	};
-};
-
 /* SD card */
 &sd_emmc_b {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-ref-design-brcm-rf.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a-ref-design-brcm-rf.dtsi
new file mode 100644
index 0000000000000..e462324596964
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-ref-design-brcm-rf.dtsi
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2018 Amlogic, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/gpio/meson-g12a-gpio.h>
+
+/ {
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
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
+	vqmmc-supply = <&vddao_1v8>;
+
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index 23b790c6469d3..e12aeb956b7d7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "meson-g12a.dtsi"
+#include "meson-g12a-ref-design-brcm-rf.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/meson-g12a-gpio.h>
@@ -96,6 +97,15 @@ emmc_1v8: regulator-emmc_1v8 {
 		regulator-always-on;
 	};
 
+	vddao_1v8: regulator-vddao_1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
 	vddao_3v3: regulator-vddao_3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3";
@@ -143,20 +153,6 @@ vddio_ao1v8: regulator-vddio_ao1v8 {
 		regulator-always-on;
 	};
 
-	sdio_pwrseq: sdio-pwrseq {
-		compatible = "mmc-pwrseq-simple";
-		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
-		clocks = <&wifi32k>;
-		clock-names = "ext_clock";
-	};
-
-	wifi32k: wifi32k {
-		compatible = "pwm-clock";
-		#clock-cells = <0>;
-		clock-frequency = <32768>;
-		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
-	};
-
 	sound {
 		compatible = "amlogic,axg-sound-card";
 		model = "SEI510";
@@ -375,37 +371,6 @@ &saradc {
 	vref-supply = <&vddio_ao1v8>;
 };
 
-/* SDIO */
-&sd_emmc_a {
-	status = "okay";
-	pinctrl-0 = <&sdio_pins>;
-	pinctrl-1 = <&sdio_clk_gate_pins>;
-	pinctrl-names = "default", "clk-gate";
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	bus-width = <4>;
-	cap-sd-highspeed;
-	sd-uhs-sdr50;
-	max-frequency = <100000000>;
-
-	non-removable;
-	disable-wp;
-
-	/* WiFi firmware requires power to be kept while in suspend */
-	keep-power-in-suspend;
-
-	mmc-pwrseq = <&sdio_pwrseq>;
-
-	vmmc-supply = <&vddao_3v3>;
-	vqmmc-supply = <&vddio_ao1v8>;
-
-	brcmf: wifi@1 {
-		reg = <1>;
-		compatible = "brcm,bcm4329-fmac";
-	};
-};
-
 /* SD card */
 &sd_emmc_b {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index b2bb94981838f..68a8876386115 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "meson-g12a.dtsi"
+#include "meson-g12a-ref-design-brcm-rf.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/gpio/meson-g12a-gpio.h>
 #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
@@ -60,13 +61,6 @@ emmc_pwrseq: emmc-pwrseq {
 		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
 	};
 
-	sdio_pwrseq: sdio-pwrseq {
-		compatible = "mmc-pwrseq-simple";
-		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
-		clocks = <&wifi32k>;
-		clock-names = "ext_clock";
-	};
-
 	flash_1v8: regulator-flash_1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "FLASH_1V8";
@@ -226,13 +220,6 @@ codec {
 			};
 		};
 	};
-
-	wifi32k: wifi32k {
-		compatible = "pwm-clock";
-		#clock-cells = <0>;
-		clock-frequency = <32768>;
-		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
-	};
 };
 
 &arb {
@@ -391,37 +378,6 @@ &usb {
 	dr_mode = "host";
 };
 
-/* SDIO */
-&sd_emmc_a {
-	status = "okay";
-	pinctrl-0 = <&sdio_pins>;
-	pinctrl-1 = <&sdio_clk_gate_pins>;
-	pinctrl-names = "default", "clk-gate";
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	bus-width = <4>;
-	cap-sd-highspeed;
-	sd-uhs-sdr50;
-	max-frequency = <100000000>;
-
-	non-removable;
-	disable-wp;
-
-	/* WiFi firmware requires power to be kept while in suspend */
-	keep-power-in-suspend;
-
-	mmc-pwrseq = <&sdio_pwrseq>;
-
-	vmmc-supply = <&vddao_3v3>;
-	vqmmc-supply = <&vddao_1v8>;
-
-	brcmf: wifi@1 {
-		reg = <1>;
-		compatible = "brcm,bcm4329-fmac";
-	};
-};
-
 /* SD card */
 &sd_emmc_b {
 	status = "okay";


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
