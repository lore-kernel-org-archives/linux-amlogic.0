Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98820CE7A81
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Sep 2023 13:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=99K6KBEBt8xbrXSF80yylOEFADRQIm33Cn/bLuxze54=; b=wiTS+H05DcHhe3
	smxQnVkE16sSF6EV3DPXioyWy+/XRvXAfWL/Cb6ejUwmBOPmK9RueMnZ5auNtalMAwUbdhN662YdJ
	fE8OHDYvExRJ9juNTCFOnWDxk/bbhD8wUlt6Qy+HBAFWA13ePPzAXgtXGxj8IntWsmOAsL0kaJmrt
	bybXb9cFRMdXP7ueep40V1K+pvH2UxH51Gt7QOvrslhTyf4RquDB5/UNn6db8jCefWEGpbbXNYgtk
	BOxBTdz0ioHahP8gdzQpTAKZZQ40BjorcCkRNr5ifr36Ao31TxtZ9TQYRYtLSpzzVsykn2wQPppgY
	FtmCZTlP9ghZmi69xasQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkm1w-00EOMX-1q;
	Mon, 25 Sep 2023 13:53:44 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkm1t-00EOM0-1W
	for linux-amlogic@lists.infradead.org;
	Mon, 25 Sep 2023 13:53:43 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-405524e6769so25360165e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Sep 2023 06:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695650017; x=1696254817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fEyyBOiumqlPrTY/pNDi/jSPRVb77LUtZxDS6rWVxtM=;
        b=u6HEldi37+tXMI5ThRkVo/8vuAOhOCi5ldAckjw1SLzwvQ3opF+ee726SYO7WUFV1e
         e5katoH5BRYjv64bRCVBTW7AID10pkRoIJgnJgTCGZD4G861abqIqoIHrl0q90kjO9Fj
         cevYVy8UZAfkJ/fBWd19DJSIBS0QCZf2yvKvuQy4rZIzg1tuaqvM4V17igEzS8ziEm8+
         XZJLRE+vQjG1sBY3l3YeWArcfbHIpTSd32ldzZFxlCM+IZGUFanxLpLt81Pzl68cCcQN
         BMcXm4bPUMGnks0C6gRbTQDkvmDIrYvy0yBEGBUSkoI8+Cc9wiCrYY2fFAh/xderIy5P
         pUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695650017; x=1696254817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEyyBOiumqlPrTY/pNDi/jSPRVb77LUtZxDS6rWVxtM=;
        b=SgY8Hew7GOgswpL/EljPh5rMh/kB5DUI4Q+2xPkKuwBQHkworNdd0/qMtZtcaqooS6
         86fgUg9ATu/bA0f6KUdkWnWO275zCUyagYsqKwSNfUTKj2KGWa+/oFt4zYMQvVucCRxy
         7EEX+f0X0USwcNEh9PuVpqSH3bmZxF7YwAxoXIOk3Z4Z9ZgJTnHV0TdUdynAeI7oII59
         8xluflHDAg+vnD6DWmJP9WWGIeHodNB+EyQ2KyHjxVscs+5jzCX4dtwG39N6CkKKUjNx
         c0lm4ccysb/Wwrrw1PtXus7Ee4iawUlsAv8M0N5U7tnEcWIrbnk5ea/JHQ8BqkzU498q
         sAcg==
X-Gm-Message-State: AOJu0YyzrNxLpi85vo5Su1JDiPgIPwmIS0K2ssmVskHEWpY+SU+Qd0Ud
	3hmAbg3obwO6cOkxqllwvy6eeA==
X-Google-Smtp-Source: AGHT+IGFzUj08pHjRNoUk/5V7szaTjs5BgBSaCQCfPcY3wT4ugjofFmWzBmIPF/q1gq35Asy4Wf/6w==
X-Received: by 2002:a7b:c8cb:0:b0:405:251f:8455 with SMTP id f11-20020a7bc8cb000000b00405251f8455mr7644308wml.7.1695650017304;
        Mon, 25 Sep 2023 06:53:37 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:38f4:d5ca:ab87:c1bc])
        by smtp.googlemail.com with ESMTPSA id v11-20020a5d610b000000b0031435731dfasm11889903wrt.35.2023.09.25.06.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 06:53:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] arm64: dts: meson: g12: name spdifout consistently
Date: Mon, 25 Sep 2023 15:53:26 +0200
Message-Id: <20230925135326.1689396-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_065341_530829_8864AC77 
X-CRM114-Status: GOOD (  13.87  )
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

g12 and sm1 are fairly similar when it comes to audio.
Both have 2 spdif outputs. While the 2nd output is named "spdifout_b" for
both, the 1st one is named 'spdifout' for g12 and 'spdifout_a' for sm1.

Use 'spdifout_a' for both instead.

This change does not fix any particular problem. The intent is just to make
it easier to have a common card definitions for platform designs using both
SoC families, when spdifout is used.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi           |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts      | 10 +++++-----
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts   | 10 +++++-----
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts    | 10 +++++-----
 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts | 10 +++++-----
 5 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
index eb442aaf57e4..e732df3f3114 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
@@ -268,12 +268,12 @@ spdifin: audio-controller@400 {
 			status = "disabled";
 		};
 
-		spdifout: audio-controller@480 {
+		spdifout_a: audio-controller@480 {
 			compatible = "amlogic,g12a-spdifout",
 				     "amlogic,axg-spdifout";
 			reg = <0x0 0x480 0x0 0x50>;
 			#sound-dai-cells = <0>;
-			sound-name-prefix = "SPDIFOUT";
+			sound-name-prefix = "SPDIFOUT_A";
 			clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
 				 <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
 			clock-names = "pclk", "mclk";
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index 7310e192efe7..8355ddd7e9ae 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -189,9 +189,9 @@ sound {
 				"TDMOUT_C IN 1", "FRDDR_B OUT 2",
 				"TDMOUT_C IN 2", "FRDDR_C OUT 2",
 				"TDM_C Playback", "TDMOUT_C OUT",
-				"SPDIFOUT IN 0", "FRDDR_A OUT 3",
-				"SPDIFOUT IN 1", "FRDDR_B OUT 3",
-				"SPDIFOUT IN 2", "FRDDR_C OUT 3",
+				"SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
+				"SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
+				"SPDIFOUT_A IN 2", "FRDDR_C OUT 3",
 				"SPDIFOUT_B IN 0", "FRDDR_A OUT 4",
 				"SPDIFOUT_B IN 1", "FRDDR_B OUT 4",
 				"SPDIFOUT_B IN 2", "FRDDR_C OUT 4",
@@ -324,7 +324,7 @@ codec-1 {
 
 		/* spdif hdmi and coax output */
 		dai-link-9 {
-			sound-dai = <&spdifout>;
+			sound-dai = <&spdifout_a>;
 
 			codec-0 {
 				sound-dai = <&spdif_dit>;
@@ -546,7 +546,7 @@ &spdifin {
 	status = "okay";
 };
 
-&spdifout {
+&spdifout_a {
 	pinctrl-0 = <&spdif_ao_out_pins>;
 	pinctrl-names = "default";
 	status = "okay";
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 7ca904f5acbb..4969a76460fa 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -155,9 +155,9 @@ sound {
 				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
 				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
 				"TDM_B Playback", "TDMOUT_B OUT",
-				"SPDIFOUT IN 0", "FRDDR_A OUT 3",
-				"SPDIFOUT IN 1", "FRDDR_B OUT 3",
-				"SPDIFOUT IN 2", "FRDDR_C OUT 3";
+				"SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
+				"SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
+				"SPDIFOUT_A IN 2", "FRDDR_C OUT 3";
 
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
@@ -196,7 +196,7 @@ codec {
 
 		/* spdif hdmi or toslink interface */
 		dai-link-4 {
-			sound-dai = <&spdifout>;
+			sound-dai = <&spdifout_a>;
 
 			codec-0 {
 				sound-dai = <&spdif_dit>;
@@ -456,7 +456,7 @@ &sd_emmc_c {
 	vqmmc-supply = <&flash_1v8>;
 };
 
-&spdifout {
+&spdifout_a {
 	pinctrl-0 = <&spdif_out_h_pins>;
 	pinctrl-names = "default";
 	status = "okay";
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
index 3e826095e792..8fc2e143cb54 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
@@ -34,9 +34,9 @@ sound {
 				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
 				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
 				"TDM_B Playback", "TDMOUT_B OUT",
-				"SPDIFOUT IN 0", "FRDDR_A OUT 3",
-				"SPDIFOUT IN 1", "FRDDR_B OUT 3",
-				"SPDIFOUT IN 2", "FRDDR_C OUT 3";
+				"SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
+				"SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
+				"SPDIFOUT_A IN 2", "FRDDR_C OUT 3";
 
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
@@ -75,7 +75,7 @@ codec {
 
 		/* spdif hdmi or toslink interface */
 		dai-link-4 {
-			sound-dai = <&spdifout>;
+			sound-dai = <&spdifout_a>;
 
 			codec-0 {
 				sound-dai = <&spdif_dit>;
@@ -139,7 +139,7 @@ rtc: rtc@51 {
 	};
 };
 
-&spdifout {
+&spdifout_a {
 	pinctrl-0 = <&spdif_out_h_pins>;
 	pinctrl-names = "default";
 	status = "okay";
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
index 098a3af6d381..ce548b373296 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
@@ -29,9 +29,9 @@ sound {
 				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
 				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
 				"TDM_B Playback", "TDMOUT_B OUT",
-				"SPDIFOUT IN 0", "FRDDR_A OUT 3",
-				"SPDIFOUT IN 1", "FRDDR_B OUT 3",
-				"SPDIFOUT IN 2", "FRDDR_C OUT 3";
+				"SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
+				"SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
+				"SPDIFOUT_A IN 2", "FRDDR_C OUT 3";
 
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
@@ -70,7 +70,7 @@ codec {
 
 		/* spdif hdmi or toslink interface */
 		dai-link-4 {
-			sound-dai = <&spdifout>;
+			sound-dai = <&spdifout_a>;
 
 			codec-0 {
 				sound-dai = <&spdif_dit>;
@@ -125,7 +125,7 @@ &ir {
 	linux,rc-map-name = "rc-khadas";
 };
 
-&spdifout {
+&spdifout_a {
 	pinctrl-0 = <&spdif_out_h_pins>;
 	pinctrl-names = "default";
 	status = "okay";
-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
