Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE24AC54F4C
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Jul 2026 15:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9xXpCW8TEloon/pTf4TS9Bw0NfSE7Sx2kdyUXS3RBKA=; b=hUfC/Wi5ituAIi
	6ivflbVY/1M2A6zNABmA4hPsoOums6/JJoH5f0v294kmmdzCgDzk62xcHlr48W+ZJAftYvpa3/Yr7
	VKBlRWD7iLwe6d4b9C5eIKfMmN49rZ2zFcg91g9XKwYltfghQaBB13ns2G05pkYriNM6y8oSrIKIb
	hWqVgSjRLfP4EFOVwkJ0H8aAJLlcct1dDMRw9HkrqN6z+g5N99Sb2HlWGgJQAt2ed2/XN0lqZ5F6R
	3ji3xMc2i9LtzswnImcTKxivTruNWG+pkOfZwbER4J/RJT80YZ0WYD82kyoeADvBtEWtmvbqCSKhV
	cXx5DkorNP9ABiLL8DLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojYD-00000005cFn-0WbU;
	Tue, 28 Jul 2026 15:17:01 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojXz-00000005c6G-3tni
	for linux-amlogic@lists.infradead.org;
	Tue, 28 Jul 2026 15:16:49 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47362928f65so3788237f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 28 Jul 2026 08:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785251805; x=1785856605; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7QNyWJjOlsPLUMiOSNZBEFuwctRhGOyXIhHqXv/w/08=;
        b=NerhLJ7z/SBPoYryGgLM3dn8YMFkhRtrNZzrizgsNMOcTPQlJiCyT8jvGusEU6TdrL
         ENWQtt6383QMBC2xEu8Q8Yi5qxuDD0B1X7Gh6RpKStkn2CFdeGpGcoxeGAoUX0lq/mEV
         1swginBOVfmS5wiJs9f978zGszD5IlLd5eY9ctxITauGj9hQixcAOS4ANgaAAgW6Bu1k
         bIYg9JDbjxjJM1YsAQotY8SAm5+39JpWg79jik6jQJwV+TNpp1m5qqMQ6rsSyGeqIg0H
         V9LqyrfmUIY/QxNzlEB2wg21Y2DvxAdMI1fN6lzdDK7w5t2McGlYI1b4eNsd2sjsL3bw
         qGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785251805; x=1785856605;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QNyWJjOlsPLUMiOSNZBEFuwctRhGOyXIhHqXv/w/08=;
        b=byGnOU59/FojdiyI3DIqYkiyuo/UMocohMcLwqTevy86a8nzXbqUYVHmStULZlO2wd
         kEqPN6j8Iwlheg7UujB+idShcK2Z84GyU4ZTyLVv9VYPf3fcsVT170sVOtiaObqJsPVB
         f2X6G51dFk64XsKAbh/YoKrT8ub/ckEZpB+/CBGddh3mQFqQvygU2wCvIXNlgqSmuFb/
         Yqzh3VM++j8q5E2nay+ywWq17QkqeItDr9L/NrGQf89C/oVYBr8uNICoggw2qy5umgnk
         2HrVLFgliWg8GDAqmFQdHmQ+AmxJy9Y2AQtqAnfZjlWusPsZPNi/qgK0BQUiBdlo86tx
         Jp8w==
X-Forwarded-Encrypted: i=1; AHgh+RoS5Td2iVdtpkHst2ngH6UBhBwEBFmOppz1h/414iuqeGt9G0eZjPJ8PqV635XSXmtfdP6mvn0Dk1iAbMCg@lists.infradead.org
X-Gm-Message-State: AOJu0YwhU1ABahmgQhM0wDctgOWf4ICmh9xsty5LfUXagyl8DFXKmslc
	vFCsJaaTdpnhMI4bT3ZP7mbcP/dgjbQV2MLiQHstXHo1o4LjDQDxdzBe
X-Gm-Gg: AR+sD10y1C6dV8Th6zNWIFZXAT3yBNj5OhkeU5/XkZTJ84PWQFXg/eUcw+IV9HHSNYN
	eauRWACuIptH3hPBIVBMtpIhfXco3BP+Q1aZOoZJK9q79N4sAFrUgXNkSEiAdHHd7v8W5atsxAY
	evuVVgNJIhkETxfsXT5KifsUx0l8jKM0QrONltx8ddQz20XWwS6EMqdJKvsrFZiEoxcb1USxwQ4
	LYE5BMfcEAzw77oLwdB/6i8XnZbTW8WvtyzRNWrqFp+DdHZxp2z+bq3Iuid/JjFihVv2y9QkgJV
	MkE/4PRFy6oqsXevOvCyt7sFNEjc1kAJZDaIr5bJC2pkHkv8Kacbz73PG7BzRcsb6QrhMuFe+si
	pEU+vCpJZAXQrIN6Wdv+0QCblHBYoMIruM9kIVIPJKVpBSpc9jEwI1wOKrtk4rexbXWY/m7o8Iv
	qNydSuj6jDO7LM3rlFSXR/sm9sTaE793y3KDQ=
X-Received: by 2002:a05:6000:430c:b0:47f:9254:d453 with SMTP id ffacd0b85a97d-47fb1ec8030mr3188995f8f.8.1785251804447;
        Tue, 28 Jul 2026 08:16:44 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c631fdsm58422500f8f.28.2026.07.28.08.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:16:44 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Alberto Robazza <robazzalberto@gmail.com>
Subject: [PATCH v3 3/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Tue, 28 Jul 2026 17:16:36 +0200
Message-ID: <20260728151636.236393-4-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728151636.236393-1-robazzalberto@gmail.com>
References: <20260728151636.236393-1-robazzalberto@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_081648_003360_CF574936 
X-CRM114-Status: GOOD (  16.95  )
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
Reply-To: Alberto Robazza <robazza.alberto@proton.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Orbbec Zora P1 is an A311D (Meson G12B) board with 2/4 GiB DDR4,
an Ampak AP6256 combo module (Broadcom BCM43456 Wi-Fi over SDIO and
BCM4345C5 Bluetooth over UART_A).

According to the original Linux dts, the board is a modded version
of the ODROID-N2, with Amlogic A311D instead of the original S922X
and WiFi and Bluetooth support.
So the device tree builds on meson-g12b-a311d.dtsi and
meson-g12b-odroid-n2.dtsi (using same vddcpu values of N2+),
extended with the board-specific GPIO wiring for the AP6256 handling,
and some modifications for the led, GPIO_ACTIVE_LOW instead of
GPIO_ACTIVE_HIGH and different label (it is a green led, not blue as
in the Odroid N2).
Add the new DTB to the Makefile.

Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-zora-p1.dts   | 105 ++++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 57bc440fa..83fb38b94 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -40,6 +40,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12b-radxa-zero2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-bananapi-m2s.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-ugoos-am6.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-zora-p1.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts
new file mode 100644
index 000000000..d003582fd
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Alberto Robazza <robazza.alberto@proton.me>
+ */
+
+/dts-v1/;
+
+#include "meson-g12b-a311d.dtsi"
+#include "meson-g12b-odroid-n2.dtsi"
+#include <dt-bindings/leds/common.h>
+
+/ {
+	compatible = "orbbec,zora-p1", "amlogic,a311d", "amlogic,g12b";
+	model = "Orbbec Zora P1";
+
+	leds {
+		/* Status led on Zora is actually green, same pin as N2, but reversed polarity */
+		led-blue {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_GREEN>;
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
+/* vddcpu regulators same as Odroid N2+ */
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
