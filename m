Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34925C001B0
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Aug 2023 09:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0wC5xlooE7VfL3LvyTPfHBwfVc6987q9++MnzZAtwi4=; b=aJMGKT05BzYhFi
	V1+stpRlsFhC7F71IP/ejJ3DUm4YxHFNDLqd7eDVlAXgtmU5XFIN4Gab98MUe71/UrziNg20cnpMh
	3UtjvJPwpgcCkw89RttWXBCzVtHlvk5TZjfR3diG0ij4VKFqLgy5evH7X9VTRfjGuq+cyUZJCGkM7
	eCKucvw8pAr2Zz4POtVvDEJe+tYq6XFBRG3gSVQD9QawwSY+xuKYhhFRV9UOEa1m5V4ydmJ02wrK0
	D2opR77YKcyXtz2zd7MumnsJvOBxOFLuOqSfoYKPx9WQ9pKG69+70xzchWSqpgZ7h0OIE7jW8+fMe
	ZBYqllzz5DMyI4MS/bDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVqLc-001CzL-0i;
	Tue, 15 Aug 2023 09:28:20 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVqLQ-001CuT-1M;
	Tue, 15 Aug 2023 09:28:09 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3197b461bb5so1260583f8f.3;
        Tue, 15 Aug 2023 02:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692091685; x=1692696485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtNqUIeopnCvxTcNi3T2GUEEaoZ28Jy+DFjFFFyT8kY=;
        b=nexZY3hBbqKB0Q9QZ6kXTH9joGExdFXSe3KJ7D1JPU19KhorfVL0IogIxT6aHkfat1
         F52EeJe0JgDFTiu54XCoRY6By8x24dfKMsBrRibKmwiyi+sdOJ3D7dOgk/kVg3UW2SDj
         bL5Z2wSM/LK44wlJDYN2+0zhOdDGhokkTvlL5PLLNKZTei2LGuEkRHaikWsrp72lue/J
         WNDvjO0bsdlezv2khldCa1LOQqZKVQKlXZSOR/3azq+fkPP36Q9e97O8K8cpptkgRGg7
         id0gb9OxRzND2yufuugb8WYGBz2fR8nG+J4QoBa0HksvHJiulNCJfEaOl5vP7JsyaHdD
         BnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692091685; x=1692696485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtNqUIeopnCvxTcNi3T2GUEEaoZ28Jy+DFjFFFyT8kY=;
        b=dZMuLYHailxXCnVK772geW/8W7pYlQfQyVQ6XDqtDAQ7Yelp8DVZyLjsaBxJDGWYqZ
         4A/xhL73E/orBxdn4WCMB/W8z7JyTgrsG4vrIUn02gX+S0K96FUIF+ET+RHI+/urTJ4y
         qv+eNIEA3SpwOo9Hi3FHv/wwCPlDRxWvvduvRujJ7qM8h6VDEJVanlrVPnFgSECSMJyU
         w00BoGMzQ/6688D4Y48Nyk0PnNy0DcVrmXtgHELGqFpi5Yw3soL3WyEWpbyNBf0w4RaI
         OMYNunEK85rqEeTCNPb5WcYlbrE92i+AmdaBxna3wXzYsotzwOMDxeINaVrO0mqRU37r
         V/aA==
X-Gm-Message-State: AOJu0YxJyW/Ut5X9/XrZcAUVclODD86gnwW9u8PN/OoOJJk61LioSSA3
	s8rhlp+nFb8jmD1d9v57Unw=
X-Google-Smtp-Source: AGHT+IGgJ1hXfXH8IdLfVcudHzzrTaQA/LZPdPXhWhwFfOnj9AXnrEffCEAUM0KBjbQKJ3lmT9K8mw==
X-Received: by 2002:adf:ee11:0:b0:319:6e6a:66e with SMTP id y17-20020adfee11000000b003196e6a066emr6071786wrn.14.1692091684544;
        Tue, 15 Aug 2023 02:28:04 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id p1-20020adfcc81000000b003179b3fd837sm17230853wrj.33.2023.08.15.02.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 02:28:03 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: meson: add audio playback to u200
Date: Tue, 15 Aug 2023 09:27:51 +0000
Message-Id: <20230815092751.1791195-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815092751.1791195-1-christianshewitt@gmail.com>
References: <20230815092751.1791195-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_022808_465258_964457D7 
X-CRM114-Status: GOOD (  11.35  )
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

Add initial support limited to HDMI i2s and SPDIF (LPCM).

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../boot/dts/amlogic/meson-g12a-u200.dts      | 129 ++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index 4b5d11e56364..2878e3ad7de2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -8,6 +8,7 @@
 #include "meson-g12a.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/gpio/meson-g12a-gpio.h>
+#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
 
 / {
 	compatible = "amlogic,u200", "amlogic,g12a";
@@ -18,6 +19,13 @@ aliases {
 		ethernet0 = &ethmac;
 	};
 
+	spdif_dit: audio-codec-1 {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+		status = "okay";
+		sound-name-prefix = "DIT";
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -147,6 +155,89 @@ vddcpu: regulator-vddcpu {
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	sound {
+		compatible = "amlogic,axg-sound-card";
+		model = "U200";
+		audio-aux-devs = <&tdmout_b>;
+		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
+				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
+				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
+				"TDM_B Playback", "TDMOUT_B OUT",
+				"SPDIFOUT IN 0", "FRDDR_A OUT 3",
+				"SPDIFOUT IN 1", "FRDDR_B OUT 3",
+				"SPDIFOUT IN 2", "FRDDR_C OUT 3";
+
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
+			sound-dai = <&spdifout>;
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
 };
 
 &cec_AO {
@@ -163,6 +254,10 @@ &cecb_AO {
 	hdmi-phandle = <&hdmi_tx>;
 };
 
+&clkc_audio {
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
@@ -203,6 +298,18 @@ &ethmac {
 	phy-mode = "rmii";
 };
 
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
 &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
@@ -288,6 +395,28 @@ &sd_emmc_c {
 	vqmmc-supply = <&flash_1v8>;
 };
 
+&spdifout {
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
+
 &uart_AO {
 	status = "okay";
 	pinctrl-0 = <&uart_ao_a_pins>;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
