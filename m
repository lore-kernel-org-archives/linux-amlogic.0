Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623FFC2BD05
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Jun 2024 14:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ga58fDTGzbTeFXBIxYrl541lVvksCeN3nknmc7VO0o=; b=xOGwKTWL5Kp1Nm
	m1uH4K2jlp3hywMUjvmPDslGxHGRyQRqeUFiS3FMudOoQewnhBYFRD4G12FHGMrQnKA7VIgMYzb21
	mcflCj1v0uP30ztlMW4EpaPXXUc6ajL256K0JtuoEXcaMZPMXqgwFE8iSksAarjq1aMsEC781+KUq
	sJZMgeeFqnn0NXW0oFkoUUMNZcGbVibut5CnqkuNlJDPRGcMgO+Z/uPezKJlD55Bd3TrmP3cQfdJL
	nneTAoU6Co7ILdhqQCGZgzRi/ceVAF9IafRmC5bzeRcgbbZwRh8tDO2NymKohqWbHYqmNHyZlIxGK
	gUDGfWhzFwJi4+RCBZlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL1JA-0000000CCfk-1wtB;
	Sat, 22 Jun 2024 14:01:36 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL1J0-0000000CCZk-1ByR;
	Sat, 22 Jun 2024 14:01:27 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a63359aaacaso432713466b.1;
        Sat, 22 Jun 2024 07:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719064882; x=1719669682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLvV2VTWAcjodNcp3MfviP3sDUHSwc6DqDjb10RCEHs=;
        b=WDuE3/1T0lWOGjM0A4FDaQy7p21tjyKStT7tMHJ+75Nqkoc7MINJZ9qYBiX4R05Fz6
         gKOl6XEWk97Mcetb5fztwNZNXTqKyQBOOR88abb6RpcH3yE7nNqsYqM16iEaCmF8t3fm
         6moLhJW4UfAH92QbfHD36bxrFsjnbT3FE2daFOHU/imKRmIJ+tvKc7EavDHNgCnkqT5I
         HA/24PkZTpV7lPNNVSNTI/XIkmPl2LWyjYtFa9tKEy0ssrOFF0hk3hrCNL09dhF8VLSe
         pSF1HA3SDgymOrUzBoSDZBk3q1dH1saffzzxRsjKe1NgFqlLCfyhc0zbtZ9RTyej7aGl
         XHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719064882; x=1719669682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLvV2VTWAcjodNcp3MfviP3sDUHSwc6DqDjb10RCEHs=;
        b=omxONSJA65dQhTLajHHzWg0cl8xkZ5EYKgD2a7SpneRiK+YQsWh3G/qe57EVplGiDx
         MAjYwNSVYPmpn194IOmdQrVLZASql/hkkQPvsdD9zuHq7f9kSzxXHs5ZpVdVCVFKoSWG
         q+OLdO5XmitSRDj6azjsIkg2hKp4KRPQrWp7GGLrKa59zopsRL5WkZ8oGUxRnrwdMHAo
         xdy0TK7NAOYoJxnABZqlRU09zdSfh83cBHyUn04Da/swoH9O3R94J0W3+f82IvwGhA/8
         0iBmPy8w7B+wUoImgMh6EF9wrxemc2djXSrDvkzER3h1+CUiZsAtHKEhkjTukEExpxek
         vDOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVretvi/gy/a6NotaEp9WOJFM5twtfnXoWdbnm8l2DM20nT45NhJz+Kmw4zd8mSwx05N/dz6QnKDua6N9R5TAhfGBomiFnL0OTzwWF+7V8np35qi5pC7waPmOecOJibXpzc2XisC1udV+pDvoexPuWS3Eydn7iHEQ==
X-Gm-Message-State: AOJu0YzrfXZTmFlMwiiMBnqG4O+FWbMBl2FYThNLhamfvYz0SDxASAZK
	3okmlyV/MkEPxy/YTh557s0GZfBT3V9BqdTR5xVkBiu0LvK1BWxU
X-Google-Smtp-Source: AGHT+IGv4yfPRuhrA0FwFK4MSf3NTDGOrmKmbLLSx3sSa73OntyRY6T1rGZN+QhVItLZ2NJhtvKvdw==
X-Received: by 2002:a17:907:c80d:b0:a6f:a756:2e8e with SMTP id a640c23a62f3a-a6fab604e66mr915231566b.14.1719064881876;
        Sat, 22 Jun 2024 07:01:21 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf549166sm198715166b.132.2024.06.22.07.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 07:01:21 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 3/3] arm64: dts: meson: add initial support for Dreambox One/Two
Date: Sat, 22 Jun 2024 14:01:12 +0000
Message-Id: <20240622140112.2609534-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240622140112.2609534-1-christianshewitt@gmail.com>
References: <20240622140112.2609534-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_070126_355473_E57C19F0 
X-CRM114-Status: GOOD (  14.91  )
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
Cc: Emanuel Strobel <emanuel.strobel@yahoo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Dreambox One and Dreambox Two are based on the Amlogic W400 reference
board with an S922X chip and the following specs:

- 2GB DDR3 RAM
- 16GB eMMC
- 10/100/1000 Base-T Ethernet
- AP6356 Wireless (802.11 b/g/n/ac, BT 5.0)
- HDMI 2.1 video
- S/PDIF optical output
- 2x DVB-S2/T2
- Smartcard Reader Slot
- 2x USB 2.0 port (1x micro-USB for service)
- 1x USB 3.0 port
- IR receiver
- 1x Power LED (blue)
- 1x Power button (top)
- 1x Update/Reset button (underside)
- 1x micro SD card slot

Dreambox Two differences:

- 3" Colour LCD display (MIPI-DSI)
- Common Interface Slot

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes since v1:
- Move assigned-clocks under sound node as requested by Neil

 arch/arm64/boot/dts/amlogic/Makefile          |   2 +
 .../dts/amlogic/meson-g12b-dreambox-one.dts   |  17 ++
 .../dts/amlogic/meson-g12b-dreambox-two.dts   |  20 +++
 .../boot/dts/amlogic/meson-g12b-dreambox.dtsi | 154 ++++++++++++++++++
 4 files changed, 193 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 0746e01b5853..4addcae2c54e 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -21,6 +21,8 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-ts050.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-cm4io.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-mnt-reform2.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-dreambox-one.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-dreambox-two.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gsking-x.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dts
new file mode 100644
index 000000000000..ecfa1c683dde
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 Christian Hewitt <christianshewitt@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "meson-g12b-dreambox.dtsi"
+
+/ {
+	compatible = "dream,dreambox-one", "amlogic,s922x", "amlogic,g12b";
+	model = "Dreambox One";
+};
+
+&sd_emmc_a {
+	sd-uhs-sdr12;
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dts
new file mode 100644
index 000000000000..df0d71983c3d
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 Christian Hewitt <christianshewitt@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "meson-g12b-dreambox.dtsi"
+
+/ {
+	compatible = "dream,dreambox-two", "amlogic,s922x", "amlogic,g12b";
+	model = "Dreambox Two";
+};
+
+&sd_emmc_a {
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi
new file mode 100644
index 000000000000..3a24c2411552
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2021 Christian Hewitt <christianshewitt@gmail.com>
+ */
+
+#include "meson-g12b-w400.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
+
+/ {
+	cvbs-connector {
+		status = "disabled";
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOA_11 GPIO_ACTIVE_LOW>;
+		clocks = <&wifi32k>;
+		clock-names = "ext_clock";
+	};
+
+	spdif_dit: audio-codec-1 {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+		status = "okay";
+		sound-name-prefix = "DIT";
+	};
+
+	sound {
+		compatible = "amlogic,axg-sound-card";
+		model = "DREAMBOX";
+		audio-aux-devs = <&tdmout_b>;
+		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
+				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
+				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
+				"TDM_B Playback", "TDMOUT_B OUT",
+				"SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
+				"SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
+				"SPDIFOUT_A IN 2", "FRDDR_C OUT 3";
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
+				sound-dai = <&spdif_dit>;
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
+&ir {
+	linux,rc-map-name = "rc-dreambox";
+};
+
+&saradc {
+	status = "okay";
+	vref-supply = <&vddao_1v8>;
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
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
