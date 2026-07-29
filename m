Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2528AC53200
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2026 14:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0BMNJXDO6gYl7CeLu+fi8DP7bsVJPJcInehG6d1m66g=; b=1iS5QrjFuZ4YBF
	e2kTL0Ycm66OesrN2+soO3ft/H5uvXgtQ14JkLGzXB6G2ltFImh8NsO60j9G9plrytyUGkFSCckxF
	rhjfg2KrC1kVz1XnuqhkDGbq/3GT0K+oMDnqFmT1l4nsEyr132YyVFyoxVh4QoilqL206Mo3rKgJu
	stEomicnw5lzIAqtl6iyAR3vgGe79s3lYNvuROWlujONEson/27ttdHq72jT0Y1wsFSPi1Kgn8kjT
	m3SpsCjBNCWP6AsuU/A/E/uDRqY0GyFzbIf++e0kz1RSMq7sug3SqMVHHEqtMWSDykdO/cKi78lW9
	qZ5TODtdJDK3JOynIf/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp51e-00000008Dnc-3Q1r;
	Wed, 29 Jul 2026 14:12:50 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp51W-00000008Di9-1iPg
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Jul 2026 14:12:43 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4728c12ba97so683040f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 29 Jul 2026 07:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785334360; x=1785939160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dg/MbR2Z6TESuIFxgaSk9l6XDWrZ8tDzJ8s/nIWGkrA=;
        b=LL5BVvTM4FZCiiLyaEzSxtckIKxZEQ1jmjGBW06+JfZJfVlOKDVXUxTVqHjIG2I/dQ
         LMCsoxDxW4qPL/5vAA//n9gX8MUlUkSGN1vn9JBgE9Gkhbl+v836RitOI0xlbI1GCbUS
         Yr/aSSZLncu80USxqyd8w0DANc9D7FfWkoserD/FsuM1HCQtS89nZ1z44QzuYVIgjh+o
         kgAZBw2kE3Ew6LxTb7iI4ATltNM1EmNIWGshZDVacMQnvZ/lZdKmMqNuYQopVXmyhNZp
         vC22f6RWW2TuAuXmBjv+m1i8x6rDcTCalZtmPeICO1uU0phiU4jeifCgAlB8QM8Qyrjw
         W0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334360; x=1785939160;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dg/MbR2Z6TESuIFxgaSk9l6XDWrZ8tDzJ8s/nIWGkrA=;
        b=p/swHV82RECCpuGnI8dPav5my+/4SqJ6BApyW5Tz4pKx09lzADdRf4Y2kYUrsFn+8K
         oykiJNxO3GIuwPDSyLcZGXLRwNFLOE3y4NZfIc3zUMoQFaaxZ3N1B/1oVF/m3hNnfzwx
         yCyFdUmSMJt0dXmWKVDilcnXOhBxuJcfVzFnJ3dY+ZORDdpJCPHGdEbSDG2YF7cG+AXv
         mfqjeBL96G7uX8LCqdyV5qe/28TwSn+JYVU9fciQLJTltS+Sf/nauCEPneluDxjJOiK1
         auZXRcxOc8Fnnap0ceuJlHWGGH8mwuZ8f2STGbHUzrXQanPbtXwdA4UA1cCKH+mebV9j
         U+Cg==
X-Forwarded-Encrypted: i=1; AHgh+RpDVybe9ludfYucdDeqelTt9qUM7KllBBx+dmXhi7qgW3U1nqkH3tmzXmBn4SDfFtJ/cj1tXD3qVTaMtW7e@lists.infradead.org
X-Gm-Message-State: AOJu0YwdeCBW7asNEF16HE9MzkEa7B44t2eEV425ewKFCvmESl1Evrgz
	8MzEy84FqTvEo3WwtkM/xnkeWYdMQoqUTYrvZurrHmG7AOzTCjXR1/AO
X-Gm-Gg: AR+sD12TubOy8oheC7rtevQPx33V1KV1Ida81s0ZZv3VhPQi41A0FGm6zV9qQwNBe8+
	U4P1NuKZmeDoPjnpKvzHDCPfaIrg79iVV18U4pvzKBlkj1cRkPgjBmAWyjcgnnOFaH7OJ0FTu5f
	HmcYap6eVBh6ILhuyyPSWQ3ZoQMM+tbxuX5j5+KGrpWDXw6HLF4HA1hbUQO7EnUBFxOiGkqZHKM
	W2nVCXnOaczLar3JyIgzqPV8BUrXLmBZi1rX/ny4hkC3mf+woVuhqzSxwLUJ6YUIori1qZm1mgJ
	svWX9kQNsdI2FzNF88S+rb/D8UGmGVFlG0u8xPKp4i82SVmAaFJWHANONy0fVxdI5/uH1KSHQVy
	z4p6HgpZamrQHEkAzqYW3uQCQILPlWpkKu2+UamYxMGQ/c0jGyxwWVdaOhR8zi7MabL4Q9sfwom
	tBmCnzOB04KbhJJijtck3t4+B0Ow2nI8IPPAqRZD3mx1licLgjCZtqGvmzP8opSj58lbcsCJGfy
	rafLhKiIx0GeI/afBURgA==
X-Received: by 2002:adf:e19c:0:b0:472:3090:d878 with SMTP id ffacd0b85a97d-47fb1ecaf7emr7635569f8f.4.1785334360362;
        Wed, 29 Jul 2026 07:12:40 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6ad01b6sm8955482f8f.16.2026.07.29.07.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 07:12:40 -0700 (PDT)
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
Subject: [PATCH v4 3/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Wed, 29 Jul 2026 16:12:34 +0200
Message-ID: <20260729141234.65037-4-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729141234.65037-1-robazzalberto@gmail.com>
References: <20260729141234.65037-1-robazzalberto@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_071242_488735_305601D8 
X-CRM114-Status: GOOD (  16.82  )
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
index 000000000..6e696ddbc
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
+		clocks = <&clock_32768>;
+		clock-names = "ext_clock";
+	};
+
+	clock_32768: clock-32768 {
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
+		clocks = <&clock_32768>;
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
