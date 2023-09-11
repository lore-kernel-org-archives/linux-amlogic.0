Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D63EE801F
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 15:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rO6fVt5/lMf+TCC+cOeqCAvrmofHnwQ1vIu4hMchYIo=; b=5BgaLSukjihAUI
	aoaPuR1uoTEmtyFqzHjEUXAMj41j+eoF9taXXO4G0wexQIFPvxrH//jKTMf1OCuXzxf6vSaHtMGTl
	vnPawj8SThXdOuBhimJ6O6BVH2BALAJXucabvkx6Od+ZjSRb68FVQ1yZVrX8uVjbuqQgrNTRKSEzx
	7mxKM0yQTrIoRgaMK643xK22Ci3wWBsbU9y2gc9Lv49XvfSp3b1HaSIuj4UKY94qiFo+fLhvaVovQ
	/6hYClwX4ZimNqHoYKirHl7rZgRpqnRjA8gzNqJS296sMoRbwKVANwXRQUkyykimWZcCH8w7YKHKJ
	ba4u+Uk/uQA/2gEXIIyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfj6x-000vhu-1o;
	Mon, 11 Sep 2023 15:46:03 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfj6s-000veE-0Q
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 15:45:59 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-403004a96eeso25257175e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Sep 2023 08:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694447157; x=1695051957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSIzaGY4JTGWQViW6JO82zhUaR3rfht5CJdLlOs6lcQ=;
        b=lrfyWCy/eT0UYUkQFE5X+iuDF19kIB8AKe19MkaX3jDMuKMBnuPGEjLIc5qy5FX9VG
         ScLS5XTAaV6j7pmKmlLRK6Tw+poaIjWG4RD6HxcnGq8qu5S1LMKpb9DtiS+2zmgubsHm
         qQZ6JmAXNyccR9VM9V6GTL2S8itnVS8e3uPavHZYHUGyTC9siKZzmN49nJahlKfpJJa8
         yImZnTa6RBAw0nT5/I7W3wJUH6kG5Gu2PnMVgSDYs31p1v3PzfET1Zla4AkA74nUKJp0
         ZdlyUPQ3aoWHDnHwr9DPjddpJ3CmTmP4tG+jH1EHT+4FKGsR73fEmdXnr45ZNM3yvp+/
         odyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694447157; x=1695051957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cSIzaGY4JTGWQViW6JO82zhUaR3rfht5CJdLlOs6lcQ=;
        b=mZOPup87F5RxNVR5O/i1NtbcAEQZ6Ckwut0Dgy3FKejIwnDUUAficZ5Y6LWQrW4GM1
         /sjK5pv+Rtua67EAyx2TjV3trfOLm4Kp4r6lfq16FD1IHQKSZaYUByEVlcBtqD51gFVs
         awQt4pDB/7cM62ZgdOnKzHUln1jklTjm82rEWvgKdsQ8IvGaibc9E4rNahruNiJuMMWf
         Nu041sE1JPe+asIgE8fnTAungIZQNxkOyKRl4CTVxb295ZYI09ORMdorSegZgdMqdVbr
         kkue2/PDV9LeRVJSlaR08MCn4vSy8p2uslSn3AFbMiZCPr/HPMWwUy6epC1YC1PBxkzH
         g6dw==
X-Gm-Message-State: AOJu0YxPHPCp5F0jPG/glkRjOrUyLmyyIWMGXwFnZ7/NOAT9V87E8qBO
	Ob1kDyUqZq1cgyKaQclY7QPqKA==
X-Google-Smtp-Source: AGHT+IGhLPBA7FSbST65jTdBOh+qXxiGny/m9t3mksHt37rJQNayJyIdmGOMbsoTZtN+Egf8qMpPjA==
X-Received: by 2002:a05:600c:204c:b0:401:23fc:1f92 with SMTP id p12-20020a05600c204c00b0040123fc1f92mr8964501wmg.25.1694447156746;
        Mon, 11 Sep 2023 08:45:56 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:55be:8f7e:5f59:7ed1])
        by smtp.googlemail.com with ESMTPSA id q12-20020a05600c040c00b003fe539b83f2sm13616255wmb.42.2023.09.11.08.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 08:45:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 5/5] arm64: dts: meson: u200: add onboard devices
Date: Mon, 11 Sep 2023 17:45:41 +0200
Message-Id: <20230911154541.471484-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230911154541.471484-1-jbrunet@baylibre.com>
References: <20230911154541.471484-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_084558_187456_DAE9CFAA 
X-CRM114-Status: GOOD (  12.98  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add missing audio devices found on the u200 PCB. This includes
* Lineout connected to the internal DAC
* SPDIF input connected to a coaxial socket
* TDM input decoders allowing output loopback
* TDM A and B output encoders and interfaces

TDM A and B link format is set by the related external codec.
Internal audio DAC can hook to any TDM output.

This change does not include support necessary the optional the speaker and
PDM Mic headers

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-u200.dts      | 228 +++++++++++++++++-
 1 file changed, 218 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index da66e2e1dffb..9abe37b5b227 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/gpio/meson-g12a-gpio.h>
 #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
+#include <dt-bindings/sound/meson-g12a-toacodec.h>
 
 / {
 	compatible = "amlogic,u200", "amlogic,g12a";
@@ -19,6 +20,22 @@ aliases {
 		ethernet0 = &ethmac;
 	};
 
+	dioo2133: audio-amplifier-0 {
+		#sound-dai-cells = <0>;
+		compatible = "simple-audio-amplifier";
+		status = "okay";
+		enable-gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_HIGH>;
+		VCC-supply = <&vcc_5v>;
+		sound-name-prefix = "10U2";
+	};
+
+	spdif_dir: audio-codec-0 {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dir";
+		status = "okay";
+		sound-name-prefix = "DIR";
+	};
+
 	spdif_dit: audio-codec-1 {
 		#sound-dai-cells = <0>;
 		compatible = "linux,spdif-dit";
@@ -159,17 +176,71 @@ vddcpu: regulator-vddcpu {
 	sound {
 		compatible = "amlogic,axg-sound-card";
 		model = "U200";
-		audio-aux-devs = <&tdmout_c>;
-		audio-routing = "TDMOUT_C IN 0", "FRDDR_A OUT 2",
+		audio-widgets = "Line", "Lineout";
+		audio-aux-devs = <&tdmout_a>, <&tdmout_b>, <&tdmout_c>,
+				 <&tdmin_a>, <&tdmin_b>, <&tdmin_c>,
+				 <&tdmin_lb>, <&dioo2133>;
+		audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
+				"TDMOUT_A IN 1", "FRDDR_B OUT 0",
+				"TDMOUT_A IN 2", "FRDDR_C OUT 0",
+				"TDM_A Playback", "TDMOUT_A OUT",
+				"TDMOUT_B IN 0", "FRDDR_A OUT 1",
+				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
+				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
+				"TDM_B Playback", "TDMOUT_B OUT",
+				"TDMOUT_C IN 0", "FRDDR_A OUT 2",
 				"TDMOUT_C IN 1", "FRDDR_B OUT 2",
 				"TDMOUT_C IN 2", "FRDDR_C OUT 2",
-				"TDM_B Playback", "TDMOUT_B OUT",
+				"TDM_C Playback", "TDMOUT_C OUT",
 				"SPDIFOUT IN 0", "FRDDR_A OUT 3",
 				"SPDIFOUT IN 1", "FRDDR_B OUT 3",
 				"SPDIFOUT IN 2", "FRDDR_C OUT 3",
 				"SPDIFOUT_B IN 0", "FRDDR_A OUT 4",
 				"SPDIFOUT_B IN 1", "FRDDR_B OUT 4",
-				"SPDIFOUT_B IN 2", "FRDDR_C OUT 4";
+				"SPDIFOUT_B IN 2", "FRDDR_C OUT 4",
+				"TDMIN_A IN 0", "TDM_A Capture",
+				"TDMIN_A IN 1", "TDM_B Capture",
+				"TDMIN_A IN 2", "TDM_C Capture",
+				"TDMIN_A IN 3", "TDM_A Loopback",
+				"TDMIN_A IN 4", "TDM_B Loopback",
+				"TDMIN_A IN 5", "TDM_C Loopback",
+				"TDMIN_B IN 0", "TDM_A Capture",
+				"TDMIN_B IN 1", "TDM_B Capture",
+				"TDMIN_B IN 2", "TDM_C Capture",
+				"TDMIN_B IN 3", "TDM_A Loopback",
+				"TDMIN_B IN 4", "TDM_B Loopback",
+				"TDMIN_B IN 5", "TDM_C Loopback",
+				"TDMIN_C IN 0", "TDM_A Capture",
+				"TDMIN_C IN 1", "TDM_B Capture",
+				"TDMIN_C IN 2", "TDM_C Capture",
+				"TDMIN_C IN 3", "TDM_A Loopback",
+				"TDMIN_C IN 4", "TDM_B Loopback",
+				"TDMIN_C IN 5", "TDM_C Loopback",
+				"TDMIN_LB IN 3", "TDM_A Capture",
+				"TDMIN_LB IN 4", "TDM_B Capture",
+				"TDMIN_LB IN 5", "TDM_C Capture",
+				"TDMIN_LB IN 0", "TDM_A Loopback",
+				"TDMIN_LB IN 1", "TDM_B Loopback",
+				"TDMIN_LB IN 2", "TDM_C Loopback",
+				"TODDR_A IN 0", "TDMIN_A OUT",
+				"TODDR_B IN 0", "TDMIN_A OUT",
+				"TODDR_C IN 0", "TDMIN_A OUT",
+				"TODDR_A IN 1", "TDMIN_B OUT",
+				"TODDR_B IN 1", "TDMIN_B OUT",
+				"TODDR_C IN 1", "TDMIN_B OUT",
+				"TODDR_A IN 2", "TDMIN_C OUT",
+				"TODDR_B IN 2", "TDMIN_C OUT",
+				"TODDR_C IN 2", "TDMIN_C OUT",
+				"TODDR_A IN 3", "SPDIFIN Capture",
+				"TODDR_B IN 3", "SPDIFIN Capture",
+				"TODDR_C IN 3", "SPDIFIN Capture",
+				"TODDR_A IN 6", "TDMIN_LB OUT",
+				"TODDR_B IN 6", "TDMIN_LB OUT",
+				"TODDR_C IN 6", "TDMIN_LB OUT",
+				"10U2 INL", "ACODEC LOLP",
+				"10U2 INR", "ACODEC LORP",
+				"Lineout", "10U2 OUTL",
+				"Lineout", "10U2 OUTR";
 
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
@@ -191,8 +262,52 @@ dai-link-2 {
 			sound-dai = <&frddr_c>;
 		};
 
-		/* 8ch hdmi interface */
 		dai-link-3 {
+			sound-dai = <&toddr_a>;
+		};
+
+		dai-link-4 {
+			sound-dai = <&toddr_b>;
+		};
+
+		dai-link-5 {
+			sound-dai = <&toddr_c>;
+		};
+
+		/* Connected to the WIFI/BT chip */
+		dai-link-6 {
+			sound-dai = <&tdmif_a>;
+			dai-format = "dsp_a";
+			dai-tdm-slot-tx-mask-0 = <1 1>;
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&toacodec TOACODEC_IN_A>;
+			};
+
+			codec-1 {
+				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_A>;
+			};
+		};
+
+		/* Connected to the onboard AD82584F DAC */
+		dai-link-7 {
+			sound-dai = <&tdmif_b>;
+			dai-format = "i2s";
+			dai-tdm-slot-tx-mask-0 = <1 1>;
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&toacodec TOACODEC_IN_B>;
+			};
+
+			codec-1 {
+				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
+			};
+		};
+
+		/* 8ch HDMI interface */
+		dai-link-8 {
 			sound-dai = <&tdmif_c>;
 			dai-format = "i2s";
 			dai-tdm-slot-tx-mask-0 = <1 1>;
@@ -201,13 +316,17 @@ dai-link-3 {
 			dai-tdm-slot-tx-mask-3 = <1 1>;
 			mclk-fs = <256>;
 
-			codec {
+			codec-0 {
+				sound-dai = <&toacodec TOACODEC_IN_C>;
+			};
+
+			codec-1 {
 				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_C>;
 			};
 		};
 
-		/* spdif hdmi or toslink interface */
-		dai-link-4 {
+		/* spdif hdmi and coax output */
+		dai-link-9 {
 			sound-dai = <&spdifout>;
 
 			codec-0 {
@@ -220,7 +339,7 @@ codec-1 {
 		};
 
 		/* spdif hdmi interface */
-		dai-link-5 {
+		dai-link-10 {
 			sound-dai = <&spdifout_b>;
 
 			codec {
@@ -229,16 +348,38 @@ codec {
 		};
 
 		/* hdmi glue */
-		dai-link-6 {
+		dai-link-11 {
 			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
 
 			codec {
 				sound-dai = <&hdmi_tx>;
 			};
 		};
+
+		/* internal codec glue */
+		dai-link-12 {
+			sound-dai = <&toacodec TOACODEC_OUT>;
+
+			codec {
+				sound-dai = <&acodec>;
+			};
+		};
+
+		/* spdif coax input */
+		dai-link-13 {
+			sound-dai = <&spdifin>;
+
+			codec {
+				sound-dai = <&spdif_dir>;
+			};
+		};
 	};
 };
 
+&acodec {
+	status = "okay";
+};
+
 &arb {
 	status = "okay";
 };
@@ -402,6 +543,12 @@ &sd_emmc_c {
 	vqmmc-supply = <&flash_1v8>;
 };
 
+&spdifin {
+	pinctrl-0 = <&spdif_in_h_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &spdifout {
 	pinctrl-0 = <&spdif_ao_out_pins>;
 	pinctrl-names = "default";
@@ -412,14 +559,75 @@ &spdifout_b {
 	status = "okay";
 };
 
+&tdmif_a {
+	pinctrl-0 = <&tdm_a_fs_pins>, <&tdm_a_sclk_pins>, <&tdm_a_dout0_pins> ;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&tdmif_b {
+	pinctrl-0 = <&mclk0_a_pins>, <&tdm_b_fs_pins>, <&tdm_b_sclk_pins>,
+		    <&tdm_b_dout0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	assigned-clocks = <&clkc_audio AUD_CLKID_TDM_MCLK_PAD0>,
+			  <&clkc_audio AUD_CLKID_TDM_SCLK_PAD1>,
+			  <&clkc_audio AUD_CLKID_TDM_LRCLK_PAD1>;
+	assigned-clock-parents = <&clkc_audio AUD_CLKID_MST_B_MCLK>,
+				 <&clkc_audio AUD_CLKID_MST_B_SCLK>,
+				 <&clkc_audio AUD_CLKID_MST_B_LRCLK>;
+	assigned-clock-rates = <0>, <0>, <0>;
+};
+
 &tdmif_c {
 	status = "okay";
 };
 
+&tdmin_a {
+	status = "okay";
+};
+
+&tdmin_b {
+	status = "okay";
+};
+
+&tdmin_c {
+	status = "okay";
+};
+
+&tdmin_lb {
+	status = "okay";
+};
+
+&tdmout_a {
+	status = "okay";
+};
+
+&tdmout_b {
+	status = "okay";
+};
+
 &tdmout_c {
 	status = "okay";
 };
 
+&toacodec {
+	status = "okay";
+};
+
+&toddr_a {
+	status = "okay";
+};
+
+&toddr_b {
+	status = "okay";
+};
+
+&toddr_c {
+	status = "okay";
+};
+
 &tohdmitx {
 	status = "okay";
 };
-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
