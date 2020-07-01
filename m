Return-Path: <SRS0=bxQo=AM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEBEC433E2
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Jul 2020 09:46:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E70502067D
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Jul 2020 09:46:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IRC9lSEV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HuiGKxnQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E70502067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zMKe1uwdUl7gN5b2KWXM2y2O7rhiiudRBuaEXuLs3Ls=; b=IRC9lSEV0ElPYxHMIZZbmXI5d
	rYkPGolfAPH2SHRwXJ64PGT790fFQSxaX+dTqPOfcGRHYGL1u6BsO9B5EOTWu0buCJR51De8yWtRr
	f5dEzsSOKk1GsT6LUlVpUfMi3sdh1+MaTPrckeakCFTcA/57rPDuBjcrXxL701Lynxy49eur6sQvQ
	nSjhV6huutw2lqPUgfSfn827D1TUjYsSqJX4tzD0ZYnJbiKCYkPFf5KzDmFCmhDVboIodPr7l5mpo
	pMgkCCTwolJe+K9QZIpm7EkepnqTl6SwoTIZQDhv4bTb2sDI5x/trbVuhKE3R/pPO9P3A1/NiBGS8
	AoWB2badg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqZJo-0003H3-0q; Wed, 01 Jul 2020 09:46:16 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqZJd-0003Be-II
 for linux-amlogic@lists.infradead.org; Wed, 01 Jul 2020 09:46:09 +0000
Received: by mail-wm1-x342.google.com with SMTP id f18so22527118wml.3
 for <linux-amlogic@lists.infradead.org>; Wed, 01 Jul 2020 02:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2LMkCbMP/fW3R0JY/uxUZEZ9R2osohzFUesMp17+pMA=;
 b=HuiGKxnQzZpLlRxThfRTnOhCSU//LCi/puShODTGZ46B+LoY9thZL2n/lyYruh84Xy
 FzX7LqEVPAhmNdR9GoZwEnl0PWHhtCLSGKm76GYKq0wrcAc0UMQRfpsIAZoK+ENSX97w
 L1h7/Ulp7uzTMNjxF2k6j+NOMBz0XgFVRS85qp0jjWtvuhBOUOJUC1ariSviTZTXoxt4
 ILIcPg4Ty5znQQ80vRwKVkTXul8z2PcHwyal3RDtEREF6bFb0JdM/m+M5fqn4wA+Cp/K
 6hYOqUEnSQJqxBOLNHwvKPskeMprusRmjAMlkjJvebIH4d1L6klHbgyg/dh3z3IURGaD
 RDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2LMkCbMP/fW3R0JY/uxUZEZ9R2osohzFUesMp17+pMA=;
 b=hqX3wh2q47HfQ5654aOAUxq0q24Tz6t360kYNVZ5EKwjuUhDAni9kJsbr6M7aoLajf
 oy6Djow4SWNMi/1OgI4Rtir7wdMq4BP5UU/ikLCSJQOtgc8Yo340tmroywXJFjaLGFj+
 iPXF13kpb9GxUKco4124OSsvzfOslOCWH4UnaMTSSoy+v+2ZkC/dnauN4DcdiJlN1W7X
 dPzCXXK6LIQ31Qwy7Y22OR9AKmfPP6tnXVE7WqJEOMYyx9ALcPzsryhT3jfr2TXo4OoW
 BZbvzFNl2dCK43wwU77JLVRCF97QAikWe+GKBupAxsiAWqZbBF/89fbXALRukXfUd8BT
 U7VQ==
X-Gm-Message-State: AOAM530FfNL3BUcXiFaPt7s2aV4C0gYXmBUEEQXl6tXbXwOjjXub1t65
 J/Kr/nvM1AENKjDIPF3HzPmZRg==
X-Google-Smtp-Source: ABdhPJzdxyb0nGawWBsr2xEb7LJdcuL1c2OsDnBTglQIDKTV8eA1yyQ0UVabx6iu+anzu0LLvTOukQ==
X-Received: by 2002:a7b:c7d2:: with SMTP id z18mr26629285wmk.149.1593596764449; 
 Wed, 01 Jul 2020 02:46:04 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id f13sm6270472wmb.33.2020.07.01.02.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 02:46:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/2] arm64: dts: meson: odroid-n2: add jack audio output
 support
Date: Wed,  1 Jul 2020 11:45:56 +0200
Message-Id: <20200701094556.194498-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200701094556.194498-1-jbrunet@baylibre.com>
References: <20200701094556.194498-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_054605_624265_EBE151BE 
X-CRM114-Status: GOOD (  11.47  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for audio on jack socket of the odroid-n2

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts | 79 +++++++++++++++++--
 1 file changed, 74 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index d4421ad164bd..34fffa6d859d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -9,6 +9,7 @@
 #include "meson-g12b-s922x.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/meson-g12a-gpio.h>
+#include <dt-bindings/sound/meson-g12a-toacodec.h>
 #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
 
 / {
@@ -20,6 +21,14 @@ aliases {
 		ethernet0 = &ethmac;
 	};
 
+	dioo2133: audio-amplifier-0 {
+		compatible = "simple-audio-amplifier";
+		enable-gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_HIGH>;
+		VCC-supply = <&vcc_5v>;
+		sound-name-prefix = "U19";
+		status = "okay";
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -209,16 +218,26 @@ hdmi_connector_in: endpoint {
 	sound {
 		compatible = "amlogic,axg-sound-card";
 		model = "G12B-ODROID-N2";
-		audio-aux-devs = <&tdmout_b>, <&tdmin_a>, <&tdmin_b>,
-				 <&tdmin_c>, <&tdmin_lb>;
+		audio-widgets = "Line", "Lineout";
+		audio-aux-devs = <&tdmout_b>, <&tdmout_c>, <&tdmin_a>,
+				 <&tdmin_b>, <&tdmin_c>, <&tdmin_lb>,
+				 <&dioo2133>;
 		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
 				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
 				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
 				"TDM_B Playback", "TDMOUT_B OUT",
+				"TDMOUT_C IN 0", "FRDDR_A OUT 2",
+				"TDMOUT_C IN 1", "FRDDR_B OUT 2",
+				"TDMOUT_C IN 2", "FRDDR_C OUT 2",
+				"TDM_C Playback", "TDMOUT_C OUT",
 				"TDMIN_A IN 4", "TDM_B Loopback",
 				"TDMIN_B IN 4", "TDM_B Loopback",
 				"TDMIN_C IN 4", "TDM_B Loopback",
 				"TDMIN_LB IN 1", "TDM_B Loopback",
+				"TDMIN_A IN 5", "TDM_C Loopback",
+				"TDMIN_B IN 5", "TDM_C Loopback",
+				"TDMIN_C IN 5", "TDM_C Loopback",
+				"TDMIN_LB IN 2", "TDM_C Loopback",
 				"TODDR_A IN 0", "TDMIN_A OUT",
 				"TODDR_B IN 0", "TDMIN_A OUT",
 				"TODDR_C IN 0", "TDMIN_A OUT",
@@ -230,7 +249,11 @@ sound {
 				"TODDR_C IN 2", "TDMIN_C OUT",
 				"TODDR_A IN 6", "TDMIN_LB OUT",
 				"TODDR_B IN 6", "TDMIN_LB OUT",
-				"TODDR_C IN 6", "TDMIN_LB OUT";
+				"TODDR_C IN 6", "TDMIN_LB OUT",
+				"U19 INL", "ACODEC LOLP",
+				"U19 INR", "ACODEC LORP",
+				"Lineout", "U19 OUTL",
+				"Lineout", "U19 OUTR";
 
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
@@ -275,22 +298,56 @@ dai-link-6 {
 			dai-tdm-slot-tx-mask-3 = <1 1>;
 			mclk-fs = <256>;
 
-			codec {
+			codec-0 {
 				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
 			};
+
+			codec-1 {
+				sound-dai = <&toacodec TOACODEC_IN_B>;
+			};
 		};
 
-		/* hdmi glue */
+		/* i2s jack output interface */
 		dai-link-7 {
+			sound-dai = <&tdmif_c>;
+			dai-format = "i2s";
+			dai-tdm-slot-tx-mask-0 = <1 1>;
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_C>;
+			};
+
+			codec-1 {
+				sound-dai = <&toacodec TOACODEC_IN_C>;
+			};
+		};
+
+		/* hdmi glue */
+		dai-link-8 {
 			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
 
 			codec {
 				sound-dai = <&hdmi_tx>;
 			};
 		};
+
+		/* acodec glue */
+		dai-link-9 {
+			sound-dai = <&toacodec TOACODEC_OUT>;
+
+			codec {
+				sound-dai = <&acodec>;
+			};
+		};
 	};
 };
 
+&acodec {
+	AVDD-supply = <&vddao_1v8>;
+	status = "okay";
+};
+
 &arb {
 	status = "okay";
 };
@@ -505,6 +562,10 @@ &tdmif_b {
 	status = "okay";
 };
 
+&tdmif_c {
+	status = "okay";
+};
+
 &tdmin_a {
 	status = "okay";
 };
@@ -525,6 +586,14 @@ &tdmout_b {
 	status = "okay";
 };
 
+&tdmout_c {
+	status = "okay";
+};
+
+&toacodec {
+	status = "okay";
+};
+
 &tohdmitx {
 	status = "okay";
 };
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
