Return-Path: <SRS0=pqGQ=YC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF75ECE58D
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Oct 2019 08:30:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B1822133F
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Oct 2019 08:30:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SIUdFy8D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DY1/Tvh+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B1822133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3kB7l0Ds8VU1F7zWk226I8zqg0kbFduSsT1yV2DWuGo=; b=SIUdFy8Drcn7Lo
	vVMqXod0tTTSflQHyJti80FGPq1H85l5nneHncyvk4RHl+et9/j6YjjhnQAsflQfGgTqF76O0rOvP
	saFQvaWNGtKKxlpDlk5wEn5BGr9eAiRwWYpM5/i4IslKUILhHOJdCikPfzDIdCgVteZuV7PG+Lfos
	bYloHrWnjy6FxNY7G/Mg9Zu713X9/629p3pSN65kpryt0/GqMbpve/pxEas6BdcNJeZeJZ7p8NDc2
	KHGkZdoFd03MU36n2Ui+3hXBmdQchAT6dzmc5J3kcxTvydqWQBeIpaMDybj240K2SPLG1amJAq/+e
	LpBW4gKHT8Pp2IdJx6og==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iI7MZ-0007xV-SJ; Wed, 09 Oct 2019 08:30:27 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iI7JY-00048N-L4
 for linux-amlogic@lists.infradead.org; Wed, 09 Oct 2019 08:27:23 +0000
Received: by mail-wr1-x444.google.com with SMTP id q9so1656964wrm.8
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Oct 2019 01:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lyFGOMvzJRvRLnrXurGxaQ0Nu5Wk4ufrAp+cP234a3A=;
 b=DY1/Tvh+4xaSWIl+/gKrEzXLZTPyAFTQGizikCgRfR540tVvs7OAWKjS2gsrs2DY6W
 FPaZYzH+pBx/h63dCDgDY+E/XG1gPcvjkLfHQLqU1wXUjS0/TBnRGIFIV0NoT3PlPhon
 GYdUKbSE4q886nCK/vp1pRZwVgi2fkGG/7Bssm0bHWP/GQ6nk3hDGEUwwsTvYmr4P2ir
 7pHLEnwjssNQQtqlFz37iclAHymiA6HUIX2Hxu4W9Ye5Win2D7Lvc0rEUR5LXzgeqvb3
 dK/RH5a2UX0lfG5V2CR7doiYWffBTOLi7vRPvfdDApyw/XFFxMFo5PtWTxNfOYNZ0/BE
 kROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lyFGOMvzJRvRLnrXurGxaQ0Nu5Wk4ufrAp+cP234a3A=;
 b=PRhFtf5aAOB54SkWzjb/vkoTHrVf9rIIW3xRPpDPHlYFcS/qg9HEUO6ExHTxJnT6km
 XY3m2NVyPiOSIEedK/5fTE654H893cZgEyJCd1e8h8iCWdKB+dTGuhtTl4kZiFSEjoRG
 puqHLKoMXHc5QWw3iNHUxXeQ60DwF+HvmpXU2smEKTivTvfvEYBij/jKmh9wmCDH2+/s
 tNJkQJ7KL34cLVuCXyDitPMLF9xvNQSXUBOv7ZLD1R3RKAVLE5IN6LczWEqjn5+4Gr7m
 lXCnJzehJEQ1QhtVN0wgZzoKfgAigKn+mXdOHvA0uviKozN10FQTrvULZ3GcmTSBP1xe
 B/ug==
X-Gm-Message-State: APjAAAXfq5vbGqIELfm2AwzkDnQ4zop2DT5wkdzoRJl6dRLDAY+Bvsg9
 oFgBXgPqRkEJhglFwpGSo8BYOQ==
X-Google-Smtp-Source: APXvYqw/bM83RnLh+j3aVWasZ8XbgV4OG1pkdT4nSZIv7horM5uQb/MwHMlszSgYDzw9mzSGmG+Ybg==
X-Received: by 2002:a5d:6984:: with SMTP id g4mr1827568wru.43.1570609639322;
 Wed, 09 Oct 2019 01:27:19 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id r18sm2545364wme.48.2019.10.09.01.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 01:27:18 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/2] arm64: dts: meson: sei610: enable audio
Date: Wed,  9 Oct 2019 10:27:08 +0200
Message-Id: <20191009082708.6337-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191009082708.6337-1-jbrunet@baylibre.com>
References: <20191009082708.6337-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191009_012720_719539_CA4E1442 
X-CRM114-Status: GOOD (  11.09  )
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

Add and enable the audio devices on the sei610.

The new FRDDR/TODDR D of the SM1 have been left out on purpose. The
plaftorm has 2 possible playback interfaces and 3 possible capture
interfaces. 3 pcm interfaces for each direction is enough.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../boot/dts/amlogic/meson-sm1-sei610.dts     | 205 ++++++++++++++++++
 1 file changed, 205 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 1d627f7f47b2..5bd07469766b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/meson-g12a-gpio.h>
+#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
 
 / {
 	compatible = "seirobotics,sei610", "amlogic,sm1";
@@ -19,6 +20,22 @@
 		ethernet0 = &ethmac;
 	};
 
+	mono_dac: audio-codec-0 {
+		compatible = "maxim,max98357a";
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "U16";
+		sdmode-gpios = <&gpio GPIOX_8 GPIO_ACTIVE_HIGH>;
+	};
+
+	dmics: audio-codec-1 {
+		#sound-dai-cells = <0>;
+		compatible = "dmic-codec";
+		num-channels = <2>;
+		wakeup-delay-ms = <50>;
+		status = "okay";
+		sound-name-prefix = "MIC";
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -179,6 +196,120 @@
 		clock-names = "ext_clock";
 	};
 
+	sound {
+		compatible = "amlogic,axg-sound-card";
+		model = "SM1-SEI610";
+		audio-aux-devs = <&tdmout_a>, <&tdmout_b>,
+				 <&tdmin_a>, <&tdmin_b>;
+		audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
+				"TDMOUT_A IN 1", "FRDDR_B OUT 0",
+				"TDMOUT_A IN 2", "FRDDR_C OUT 0",
+				"TDM_A Playback", "TDMOUT_A OUT",
+				"TDMOUT_B IN 0", "FRDDR_A OUT 1",
+				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
+				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
+				"TDM_B Playback", "TDMOUT_B OUT",
+				"TODDR_A IN 4", "PDM Capture",
+				"TODDR_B IN 4", "PDM Capture",
+				"TODDR_C IN 4", "PDM Capture",
+				"TDMIN_A IN 0", "TDM_A Capture",
+				"TDMIN_A IN 3", "TDM_A Loopback",
+				"TDMIN_B IN 0", "TDM_A Capture",
+				"TDMIN_B IN 3", "TDM_A Loopback",
+				"TDMIN_A IN 1", "TDM_B Capture",
+				"TDMIN_A IN 4", "TDM_B Loopback",
+				"TDMIN_B IN 1", "TDM_B Capture",
+				"TDMIN_B IN 4", "TDM_B Loopback",
+				"TODDR_A IN 0", "TDMIN_A OUT",
+				"TODDR_B IN 0", "TDMIN_A OUT",
+				"TODDR_C IN 0", "TDMIN_A OUT",
+				"TODDR_A IN 1", "TDMIN_B OUT",
+				"TODDR_B IN 1", "TDMIN_B OUT",
+				"TODDR_C IN 1", "TDMIN_B OUT";
+
+		assigned-clocks = <&clkc CLKID_MPLL2>,
+				  <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+		status = "okay";
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
+		dai-link-3 {
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
+		/* internal speaker interface */
+		dai-link-6 {
+			sound-dai = <&tdmif_a>;
+			dai-format = "i2s";
+			dai-tdm-slot-tx-mask-0 = <1 1>;
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&mono_dac>;
+			};
+
+			codec-1 {
+				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_A>;
+			};
+		};
+
+		/* 8ch hdmi interface */
+		dai-link-7 {
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
+		/* internal digital mics */
+		dai-link-8 {
+			sound-dai = <&pdm>;
+
+			codec {
+				sound-dai = <&dmics>;
+			};
+		};
+
+		/* hdmi glue */
+		dai-link-9 {
+			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
+
+			codec {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+	};
+
 	wifi32k: wifi32k {
 		compatible = "pwm-clock";
 		#clock-cells = <0>;
@@ -187,6 +318,10 @@
 	};
 };
 
+&arb {
+	status = "okay";
+};
+
 &cec_AO {
 	pinctrl-0 = <&cec_ao_a_h_pins>;
 	pinctrl-names = "default";
@@ -201,6 +336,10 @@
 	hdmi-phandle = <&hdmi_tx>;
 };
 
+&clkc_audio {
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
@@ -235,6 +374,18 @@
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
@@ -259,6 +410,12 @@
 	pinctrl-names = "default";
 };
 
+&pdm {
+	pinctrl-0 = <&pdm_din0_z_pins>, <&pdm_dclk_z_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &pwm_AO_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_ao_a_pins>;
@@ -356,6 +513,54 @@
 	vqmmc-supply = <&emmc_1v8>;
 };
 
+&tdmif_a {
+	pinctrl-0 = <&tdm_a_dout0_pins>, <&tdm_a_fs_pins>, <&tdm_a_sclk_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	assigned-clocks = <&clkc_audio AUD_CLKID_TDM_SCLK_PAD0>,
+			  <&clkc_audio AUD_CLKID_TDM_LRCLK_PAD0>;
+	assigned-clock-parents = <&clkc_audio AUD_CLKID_MST_A_SCLK>,
+				 <&clkc_audio AUD_CLKID_MST_A_LRCLK>;
+	assigned-clock-rates = <0>, <0>;
+};
+
+&tdmif_b {
+	status = "okay";
+};
+
+&tdmin_a {
+	status = "okay";
+};
+
+&tdmin_b {
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
+&tohdmitx {
+	status = "okay";
+};
+
 &uart_A {
 	status = "okay";
 	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
