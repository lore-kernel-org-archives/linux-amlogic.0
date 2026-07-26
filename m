Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1028AC53200
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Jul 2026 18:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FvXJTOExV8ZP0KIIKnxVnJ05cPn0Bz51oMkTJ41puXI=; b=xSolhsDGpnHwjN
	0Bh7f82fhO9tIPHKTrbRrtFnpvlGX5iPcdXiwt76rO0cwitnRNZ2LJvwbsHxTV0OPzBEOqF0WAvnn
	agOq/Nt7DQSWlKDIchTByMT/f2D8x2k7U//hin2W4OUUl4X8TNFxHKhR5RmASpS7k2OLvoBtC3SR4
	rKN1T5fKe+8pHFthfdCMTakSG3/vEHndye5qLrTbRb5WfOguRaJIm26qgfkHs90WaYW8G4+A6H7oX
	crb/a9R4UIWWolQnzv8wFCDhaDJAMr7QQsG1YHCz5a8TnWHn8z7XFdyjpVrd0UUDixBeFu6L7Aovg
	QFF4HFpy8Iv7xxJWvb9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3UM-00000001TrC-3G1C;
	Sun, 26 Jul 2026 18:22:14 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3UJ-00000001TnM-1Er6
	for linux-amlogic@lists.infradead.org;
	Sun, 26 Jul 2026 18:22:12 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso10069555e9.3
        for <linux-amlogic@lists.infradead.org>; Sun, 26 Jul 2026 11:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785090129; x=1785694929; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZxKcq+z+SrS9YOgP9Wucayj+sHc3IIcXGTLDJtzMh0c=;
        b=mYmVF5hhnWC0clIKFVBI5snKAyyeoxgtwV94CJhkXjoZuOwJbNx4UkM1PONzDioVsN
         9SWXCyhD8ZCWHQCEUtP9PQ6UdcvEqXM49ep5ptdIH0uygC5tB0PZOltdKiAOTj7DxE1A
         Vo7+28Vzf+YfWXt+Bgupqi1rc6U5hLl7qhU3SVpxXYjeemtsw99hXR1cSyP+rHuNG5qW
         M+QN195s5qcqrtJJWgrIjjwfXjq6MFD8NwcUTWzxXqLqoNao3PyjY4mGCa6S/SjPai68
         rnQc3mxAGIHOnsyJXavWr9NrH3pPbV4GwyFNOVag8mNPmjXeUWVhPlcJ0xa1fE/JuVJ/
         eZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785090129; x=1785694929;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZxKcq+z+SrS9YOgP9Wucayj+sHc3IIcXGTLDJtzMh0c=;
        b=RwVJWvIem2FYNxnoRCGswGW//a4j767rp3DGoIancUq0R87TxUc6h72bQwo2xaUXW9
         vs8ZJRDKkBlxL4Fd5sx2iVkGJuFu7F2CMtA+r/HdL1bYAuwDire32a2EFyI6oW4qVQyo
         R9+71TAnOWcQjxwWcJnJHG7ZKcHhLJCTbowAbPoQJzkuPNbTQaECvxGOMtOV2fQnSfgz
         yV57vSjEqs0nlF4mZM8GTzF8GGypAaiB85ofkaNUXperfJmIbt/mxjj5vLQSgpd2veRL
         BL6YdDpnzOuklAuyhrz6DcrnGfuaRrqb2+gAvzKCDQJvC9ni8512GQouyqRMnCg0w8Ss
         nYqg==
X-Forwarded-Encrypted: i=1; AHgh+RqIv7SgJc/6CO9u/5fApcQ1NxnWODAQpFWXxhJrv2F+e4/6FURKXiMTijNrSbHHScsz5lQb3rw6JpjoyZ3u@lists.infradead.org
X-Gm-Message-State: AOJu0YwjC5BJKWSvYF9om7h5UCp6OBdJ/q7lU80MNmAnIIaDeU7Kh5rC
	63WK0D0UPLcZ6LnK4HDwmPAtjWraYqpcvNS12Fc7LIP5y7QlcqH0Mdvo
X-Gm-Gg: AR+sD12XgD71g7zxM4vkvmn0xCKQpdebsEy6lxjvXO0AE0U8ZMbKzJ9IBaJcHS6Z8+y
	o0zbFWLfHFRKfGNtAI3U/0JOh5pMyeDUnqsqpBPBdHyIgGQypKkONPzSPopsyGRd+JE8JEvZpUv
	9sDbnhOe/3WRGagNyEWJctkLL5u+ZrPt/W53O2mCcK/CRn91+/XrgwFqyEc4XvOUR1ZQKmCfGrl
	rRmi477mXnNwyNW0d9ABdpC2xoOtpuKGP8WRWGXEyHGh0jsbcfwiKRKnROjIBjazdyUMpz2uuuR
	fYY7a8QmWZpoKLKvESeKK+E7a/pBAVrKdt/Gv73505aTH4EUzDES6WKZV0XQk2y0CiRapncbVBE
	eIDYH4WOIR8eyVZ8+A9sSFOXc2XFR0TBaKPifntZi8tKTDHfkRJ5t5LdHT3meMQVo2ImATB7x4/
	CpLU2eUxZV4wd/G/jrB/6Ze87Mvy+0yVpTx1q4VA==
X-Received: by 2002:a05:600c:310e:b0:495:44f3:4576 with SMTP id 5b1f17b1804b1-496b5710dc8mr79233605e9.7.1785090129119;
        Sun, 26 Jul 2026 11:22:09 -0700 (PDT)
Received: from slackboot (93-34-145-231.ip50.fastwebnet.it. [93.34.145.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b52eec24sm150748045e9.3.2026.07.26.11.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 11:22:08 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: robazza.alberto@proton.me,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 3/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Sun, 26 Jul 2026 20:21:58 +0200
Message-ID: <20260726182158.249449-4-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726182158.249449-1-robazzalberto@gmail.com>
References: <20260726182158.249449-1-robazzalberto@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_112211_382134_A3700CA3 
X-CRM114-Status: GOOD (  16.92  )
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
Reply-To: robazza.alberto@proton.me
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Alberto Robazza <robazza.alberto@proton.me>

The Orbbec Zora P1 is an A311D (Meson G12B) board with 2/4 GiB DDR4,
an Ampak AP6256 combo module (Broadcom BCM43456 Wi-Fi over SDIO and
BCM4345C5 Bluetooth over UART_A), HDMI audio output.

According to the original Linux dts, the board is a modded version
of the ODROID-N2, with Amlogic A311D instead of the original S922X
and WiFi and Bluetooth support.
So the device tree builds on meson-g12b-a311d.dtsi and
meson-g12b-odroid-n2.dtsi (using same vddcpu values of N2+),
extended with the board-specific GPIO wiring for the AP6256 handling,
and some modifications for the led, GPIO_ACTIVE_LOW instead of
GPIO_ACTIVE_HIGH and different label (it is a green led, not blue as
in the Odroid N2).

Add the "orbbec,zora-p1" compatible to the amlogic.yaml board binding
(the "orbbec" vendor prefix is already registered) and the new DTB to
the Makefile.

Signed-off-by: Alberto Robazza <robazza.alberto@proton.me>
---
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-zora-p1.dts   | 103 ++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 57bc440fa..95e9071e0 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -36,6 +36,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-go-ultra.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2-plus.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2l.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-zora-p1.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-radxa-zero2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-bananapi-m2s.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts
new file mode 100644
index 000000000..fe20d39a8
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Alberto Robazza <robazza.alberto@proton.me>
+ */
+
+/dts-v1/;
+
+#include "meson-g12b-a311d.dtsi"
+#include "meson-g12b-odroid-n2.dtsi"
+
+/ {
+	compatible = "orbbec,zora-p1", "amlogic,a311d", "amlogic,g12b";
+	model = "Orbbec Zora P1";
+
+	leds {
+		//The status led on Zora is actually green, same pin as N2, but reversed polarity
+		led-blue {
+			label = "p1:green";
+			gpios = <&gpio_ao GPIOAO_11 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_16 GPIO_ACTIVE_LOW>;
+		clocks = <&wifi32k>;
+		clock-names = "ext_clock";
+	};
+
+	wifi32k: wifi32k {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		pwms = <&pwm_ef 0 30518 0>;
+	};
+
+	sound {
+		model = "ZORA-P1";
+	};
+};
+
+&pwm_ef {
+	status = "okay";
+	pinctrl-0 = <&pwm_e_pins>;
+	pinctrl-names = "default";
+};
+
+/* AP6256 Wi-Fi: Broadcom BCM43456 over SDIO. */
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
+	non-removable;
+	disable-wp;
+	keep-power-in-suspend;
+
+	mmc-pwrseq = <&sdio_pwrseq>;
+	vmmc-supply = <&tflash_vdd>;
+	vqmmc-supply = <&vddao_1v8>;
+
+	wifi@1 {
+		compatible = "brcm,bcm4329-fmac";
+		reg = <1>;
+	};
+};
+
+/* AP6256 Bluetooth: Broadcom BCM4345C5 over UART_A. */
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm4345c5";
+		shutdown-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_HIGH>;
+		max-speed = <2000000>;
+		clocks = <&wifi32k>;
+		clock-names = "lpo";
+	};
+};
+
+//vddcpu regulators same as Odroid N2+
+&vddcpu_a {
+	regulator-min-microvolt = <680000>;
+	regulator-max-microvolt = <1040000>;
+
+	pwms = <&pwm_ab 0 1500 0>;
+};
+
+&vddcpu_b {
+	regulator-min-microvolt = <680000>;
+	regulator-max-microvolt = <1040000>;
+
+	pwms = <&pwm_AO_cd 1 1500 0>;
+};
-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
