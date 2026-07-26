Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909B1C531C9
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Jul 2026 20:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9wPvfOwup+207hlkThIIHVdBrjRsnn8zdybFBG82Tmc=; b=IOLxHVQIelA+RT
	v51eN2o8WyH3FOKaYi65Gtmz2CF20/AIpPCx2RgayViGy+gTVk6+22xSfukhaz8xQG/d4rhdAA3gf
	uMd6b5F4fWD805u6qJK4F0XopxOrlLZQl8NusFRnsf9kI2Ggtz0Ck1RsWK1RoA5kkBcnH+XtML8mx
	Hcoq0MgrfJSJnsopXlLmaqDUyjHgETpfpsaqM3xJNXLksDS6dNsFVAqXd3HmwPr4M/m1wvwGonGib
	tjP44M0/orMsNsMjnMch8tjE7ERlhgnGZVPxclNpW8dsOoVkwgS5S9M7NjB7Q1tAQTJSQNYkI7OsN
	Xc1dqb0JnJbGxMV+OnrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5Hb-00000001a36-0YaV;
	Sun, 26 Jul 2026 20:17:11 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5HO-00000001ZwK-0au6
	for linux-amlogic@lists.infradead.org;
	Sun, 26 Jul 2026 20:16:59 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47f633e6058so1780039f8f.0
        for <linux-amlogic@lists.infradead.org>; Sun, 26 Jul 2026 13:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785097016; x=1785701816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G2/PwY+IVFHzX9CHGSv9APYDlo4OL8d6Ez0vNK+a/FY=;
        b=BodkwRywlpo2D7vhwzaB+prVYtWZWN0tqx9kjFmY/MG0bYF7r0u/Y7kKluXiyz5QQB
         L8QKFs+/qqw5RKYRfRNLpFlvAq1lLz4Iva7+AzMRSVSD3nzNx9n++liBmWnAAJ4GabrL
         /gW1TnVi89i4ljMubJ+sCGgXUHlA6TAsIxVMwnDBRZkf/8t75Wgogi0fbwQwbd8DFLej
         F3cX98WVN7xpsKcPBj4d67alT0VCW8cvPD2J/+sraK74FZVRmYNszBNlT8W6mlAUHsE5
         Ui/sQPLyETyuSB8YTKkcZREnWL9KkZ/OwG+ETm3PhofrAeVazBS9SwhsOUkfQLMO9LQ8
         COsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785097016; x=1785701816;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G2/PwY+IVFHzX9CHGSv9APYDlo4OL8d6Ez0vNK+a/FY=;
        b=rcuOys9KB81grF+7sBgDNbuLyi8kW5T/NByr3cLsTDEUxVwhVrSMSOFo+83WMcKeBT
         XkVx5pV8JfRkTJUxlomntWtpIq3ASCJBJLFKx6K1rSaxrVNXTikUsmurUErTfCA3hO+t
         g6Fc3hEOGT0FQlo4anCGhesmnvj+bY9j0I/KboCKJHIymZaDzmoszHa93cBr31MJd6lB
         cg3fCiyb2lnPG/PcVEvYdfdcmH/lWPKn+ve71x0+UdMTjQ74GreASWf34sHjyCvZRdZk
         wlQpHcGhcl+tftNvj3zohbERPtlTYp2PPqIIwAfclOScEdMJnDSwTyK2occ8vkszIQz8
         4uvg==
X-Forwarded-Encrypted: i=1; AHgh+Rqkfh1m69Uk6xtoSHbMnryWeq3heUtsovrXc4h3JE2b9OVH6IleUahxnIGx+aY0VBBsCul846W9lZ6PoVCV@lists.infradead.org
X-Gm-Message-State: AOJu0YxjrD90IZ+dDdx12R7cTdNRdftKM+IeWoRNj4pBLu+UljlIoZFv
	iLQ2OtTfeP0aCWvUIf6LWkSdOWNzxYudTYzYpHpe8kFMNM1dWlZfY0dR
X-Gm-Gg: AR+sD11zlO4UhQJyxedymJYtUEAPUdCZctK2OHncps/rNPAaZ5ClTyF7RsmMk3sW8+y
	WWEQHIZ6Yv48buGgix0twqYVDQsV3bW67bYmY1AR+FCHz2WSU/Cw1Wul9oUhQPa5HvsYmPcLMzU
	BQYtlhHww/I68P6Z2+xIDXAauqtWVydVVYrND3Ymz6uLsEtPXH53nZ+OdZhVE7MtKfHKCvKkT3k
	WS6US3wDVhO8bCDMg9nupxy7uczwQuEKuQtYvXggCdmmjJKdPsLy5P2gzE08WYIOoKiPU32adNw
	IbkuRPnKgCoUTiGr5fMEK5+yc1rMPu3GrW9hSPLZiJ/Sazyob4vc2iW/0GGiLRB+bTbciwRuXuD
	a7GEU3g8pjbuoa1/5YM5IlEbxxA/5AG+Ol2aN1cmIuv1Su+g0peim5zbx0UzqqE2sDsmtGlpgtN
	aYzBCx8xfOC30m8lY3J4e+Io0E1SwJE4L6t9h6KA==
X-Received: by 2002:a05:6000:1863:b0:47f:7c4d:c9a7 with SMTP id ffacd0b85a97d-47f9fea88b6mr9103956f8f.47.1785097016441;
        Sun, 26 Jul 2026 13:16:56 -0700 (PDT)
Received: from slackboot (93-34-145-231.ip50.fastwebnet.it. [93.34.145.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm43621117f8f.20.2026.07.26.13.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:16:56 -0700 (PDT)
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
Subject: [PATCH v2 3/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Sun, 26 Jul 2026 22:16:47 +0200
Message-ID: <20260726201647.264108-4-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726201647.264108-1-robazzalberto@gmail.com>
References: <20260726201647.264108-1-robazzalberto@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_131658_238783_7CAB618A 
X-CRM114-Status: GOOD (  16.73  )
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

Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-zora-p1.dts   | 103 ++++++++++++++++++
 2 files changed, 104 insertions(+)
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
