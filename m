Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C12C54F51
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2026 17:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0BMNJXDO6gYl7CeLu+fi8DP7bsVJPJcInehG6d1m66g=; b=E5BqilPQ/VNGG9
	rswhFesKqwDqGxPcf0RTT12cr/tnvJq9IKq9BsQin6WVXeW0xx2bBLLUk/5Z/ScedQ9aBxoI5t0WJ
	/RtY34+9S8jfrRnnW5jjR/ksECnEVcNDwhyNuIWXbM0wS8rAr74fHPCKzB2UAzvKSjrKJxh95JzwW
	3/QkwOo4WvbiY2BFPf3aUQhCq5tnoOZIzSC17ISxgybNJjNvSQ0TAuXqrDS8TgRRBCYzZUKeKZIiS
	3sSgtkK0SNx+lrsUkvxPRVx/ERYMHBdEqCHIpF5ZdlnYIfxq3VO/11yuHXhBX0EygNKsx7S87yI8F
	XsIuf+QMw+/wqkROS1Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8Rj-00000008kK5-1AFy;
	Wed, 29 Jul 2026 17:51:59 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8RU-00000008kBS-1p3X
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Jul 2026 17:51:45 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-493f6de72faso1132655e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 29 Jul 2026 10:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785347502; x=1785952302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dg/MbR2Z6TESuIFxgaSk9l6XDWrZ8tDzJ8s/nIWGkrA=;
        b=adY2lR/52vl3bPuVWMiy/4yNhxggpMBQIH4nlqiufco0rmK3SdKXZtZ8GWe5EIh/70
         9tp1L7tLLpPRtiNkji7CRGNo0BW5E9F+sGNiVC2UsavH2gZG7773yHfTw5u2fx0185JK
         nea4+flLUKcp11wyYdZDyQv0L88N+uxTJS4s7mDDYYGsOrJAM9kiXGDQyxYVDnKrBtwe
         d8xuNuKOZIjviVhGQoz+7yaRenQR86N5bHnx7IpIdhWjE8AmrfMb3ZT8tCyO+zAWlFhK
         GldcRpLA6NsfY1aCz8dxzOxIWNl2sJ0C5UU6TKsv1VEvCOaF1FIe4/t/6eDSVh7aUGkf
         GQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785347502; x=1785952302;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dg/MbR2Z6TESuIFxgaSk9l6XDWrZ8tDzJ8s/nIWGkrA=;
        b=cn20WVHYxnA/m/Wg3Q0W+d4VfCc8EVAMJF0WTq425qltJzHAPrkbSCJSSMH9TqxZiu
         ZrkVPmWE+68V4aiX6teiNFHLErrqWZZSmsyuqHxTjCuoUcfhanKzEvxPFel0teUjNWFH
         Afk9QDSMeGkDvq7qn9lBF7EkDVEmYuYl1COmDJ8LwV1W99k3HMd765VGToLiPGKY/s4H
         KJaDIZ+TSNHbThxyO/UTWQjr8GLGNHDnZIUcWlfoL12cf4uhMslGPoxdJ8hYUzfjuv1L
         ipBxewMrvnm2PSJ6zCC7goMmdqcpLbm1EnLqSorZMY8p1bKHXE4cNZ3Fw7RBdB3oZt+8
         4eMg==
X-Forwarded-Encrypted: i=1; AHgh+RpPn+GWdPH6rseu7QR/JjXXarDU2ScUlsWXKobu9tznqbQdD86WmraYvTjjySyT4EiLmS/ZpnZKDpnn2szb@lists.infradead.org
X-Gm-Message-State: AOJu0YxYsbi1tHruMUXpoaYxgNQWjRq3Z+iUJ/uxkFk76idkcdegqS3L
	zeLmn4dNmF6PYleRENwVh6klNCRkndLYDd/mPUbf0kMSsEvTttdOt6E4
X-Gm-Gg: AR+sD13+3KqZ0HX6wL4MvYzrNIivoOaoZnZpuYRx8wvH+usysr1pxnTndhNT2g6UZYn
	6xSSpZMnKy98mVk1AxZy7bgR4fmzuwj2dqJ6P2Vb5XCu+LH6FPZ1AiF1j1MFZwa6lnS41KYAskV
	e5F9mm/HmSchiMdNfj1LxSeYkf4YRFKEPA/UnqPc53tE30P3ltFY4q0o3dk2uepc2hP/JRpb1US
	L6eydUubSh3i3KBJBy3kw30yEIHg6U4vxcghvvI4cG/vuXK1+XMeRMt6MyMrWuY6BzerrAZmMHS
	AXm9phDkn6JCAuB9iduiBfueAzgxmAwwkvYn40eZYV/JcqUwKx5tBz2sN9WvWxlV1MoBm3hXlHu
	GUE1hFAbXzjH/hZJPD7jItYSdMO+6oL8bymBnoy7bAoWpvNFNEPf2LGydoiaTn1fHi11JwwqZg7
	o7AeJne1m3ph85WPHWoBUQn9AyKtPi0rglVkVB6VoGLs31v/n1FInzXa5Popnlrdh5biJfFbNzN
	ujTlqlaD+fxl6ioq8RSBZBuzygQn1Y3
X-Received: by 2002:a05:600c:45c3:b0:495:69eb:27d3 with SMTP id 5b1f17b1804b1-497fd3014e6mr32775345e9.8.1785347502214;
        Wed, 29 Jul 2026 10:51:42 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd83fabsm75723775e9.15.2026.07.29.10.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 10:51:41 -0700 (PDT)
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
Subject: [PATCH v5 3/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Wed, 29 Jul 2026 19:51:34 +0200
Message-ID: <20260729175134.92909-4-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729175134.92909-1-robazzalberto@gmail.com>
References: <20260729175134.92909-1-robazzalberto@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_105144_496034_DD74009B 
X-CRM114-Status: GOOD (  16.72  )
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
