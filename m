Return-Path: <SRS0=5BKV=TY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2EAC28CBF
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 May 2019 14:03:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97FF12081C
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 May 2019 14:03:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cEYVgv3G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="AQ8NIukI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97FF12081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z3FaYW0PGyv8BviZDZjYlIxMmHvQzAxKRSqtuy057hE=; b=cEYVgv3Gyk53kR
	173h4J1qKRmglngbODiKnKt5dNUoXilJ9GMUaDkF2yn3hupNWB84hDEDvdlim7XzmdJ7ase9qkojE
	FmcLI7qM+6ay2CLwWE5GgiMDhHRXvh8ao4q4DHCnOKckQPlAVojNtIalZ6DZhUAoPiaprKsQ5KAQW
	sRsPdK4jq8SXIfXsn8hrXzjspBU7PvUeGgJAqt7+26jV6u74xGiptDGiYvNuTO29LQNNRzq8hGbxl
	V7VEmf8U3TtbV/cjXTwBF5T3dcdnDT5wyqvUImPkTKVfFMyj8yoFoG0F4k7j0qYV3EMwcAvsqxjc6
	ui75sMlqkfiL4wb5WVmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUAnC-0006W9-Gk; Fri, 24 May 2019 14:03:30 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUAn9-0006TV-90
 for linux-amlogic@lists.infradead.org; Fri, 24 May 2019 14:03:28 +0000
Received: by mail-wm1-x344.google.com with SMTP id v19so1288427wmh.0
 for <linux-amlogic@lists.infradead.org>; Fri, 24 May 2019 07:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G/bTQ/ecWQ5ps1+vCCtFklRZsUYqapfXdu2OlnxEmEY=;
 b=AQ8NIukI4NzDXN4WjG4QXdnvkku3PgVux0BOEKbQf+rTn8OcmysE8CLGZjx+yxLnnd
 DgMeEzLVukI6CTD5ss+PFrqntLse16+kZ49JmEDnA/Zotg70eiyGFhy9bYbA/Xq5Okge
 NF3uiVyxD5PaPCig4NVKKOBZV2KAMwgK9s8x0fEVOnuECqgZNOI9jl/m6V+8BD/w6Rzz
 3ZZNaQ96iYf/LrRZWph19CUyW7uq7jiRC7gndPszPtwTNcwqrCT7kl5vlFuDl0yAMzaz
 VPcaj1k0ouuCqWm6w1Xx7vsLoAE/j5Neir+RGucwyUMbKuc/NX+nH6uV/ZvAy+7uwcDI
 befw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G/bTQ/ecWQ5ps1+vCCtFklRZsUYqapfXdu2OlnxEmEY=;
 b=ZIL/gMGt6pjW+/B4OWz4JkCS10LfN81x1qQBy5O4Hpm+bKMdorsy8QFVGZ1OI7MI3M
 Qk5EoOsk2W9Kf1wyK9i5uZ5uUDN511DwgCHnT+lZq5XWRA65I8IXlMjao4RSv8Rv9RGp
 i3DsI/tykDrBaoMpvuquyupG792WO/1MZNOYUYUtxX32icoszngyIeDRtzPIKe1ZJZYv
 klGzi31r1Iz6XHfB1oDGdQO2vSe+rd87zCFIMMSn5nUX2M+X8ZgXNi1dU4VTBuZUqyFR
 tcln62blnOozTGUjtfE3mMrbxwdno51vN8IezI+1J8AtOsPQLeuSHvgiMTlHMpdRKiod
 gH5g==
X-Gm-Message-State: APjAAAVZuVJ9RFXIg0140Uwm/65R6RgFp5cMcJ7AJCkxCLQNxUiHxoux
 38qQ8H+6v+NeVZu6e9oDCfpynQ==
X-Google-Smtp-Source: APXvYqxJIGgLt2Dm15XiY/DujxFETKhcmXMGqehYiTZ84Pf1JDBLO1be3iiESfD8el8QJmlp6Av2kw==
X-Received: by 2002:a7b:c118:: with SMTP id w24mr23922wmi.158.1558706605414;
 Fri, 24 May 2019 07:03:25 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id t7sm2797114wrq.76.2019.05.24.07.03.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 May 2019 07:03:24 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/2] arm64: dts: meson: sei510: add sound card
Date: Fri, 24 May 2019 16:03:18 +0200
Message-Id: <20190524140318.17608-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524140318.17608-1-jbrunet@baylibre.com>
References: <20190524140318.17608-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190524_070327_316221_23B2B907 
X-CRM114-Status: GOOD (  12.98  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable the sound card on the sei510:
* TDM interface A is connected to an external DAC and a speaker installed
  on the device.
* HDMI is expected to use TDM B. It can also use TDM A but will be
  limited to 2 channels, as accepted by the external DAC.
* 2 Built in PDM mics through the PDM interface.
* Both TDM outputs may use HW loopback.

The internal DAC connected to audio jack will be added later on, when
driver support is added.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-sei510.dts    | 202 +++++++++++++++++-
 1 file changed, 201 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index c6d032ed9a8b..9275df73c9f0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/meson-g12a-gpio.h>
+#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
 
 / {
 	compatible = "seirobotics,sei510", "amlogic,g12a";
@@ -32,13 +33,22 @@
 		ethernet0 = &ethmac;
 	};
 
-	mono_dac: audio-codec {
+	mono_dac: audio-codec-0 {
 		compatible = "maxim,max98357a";
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "U16";
 		sdmode-gpios = <&gpio GPIOX_8 GPIO_ACTIVE_HIGH>;
 	};
 
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
@@ -135,6 +145,124 @@
 			no-map;
 		};
 	};
+
+	sound {
+		compatible = "amlogic,axg-sound-card";
+		model = "G12A-SEI510";
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
+			codec@0 {
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
+};
+
+&arb {
+	status = "okay";
 };
 
 &cec_AO {
@@ -151,6 +279,10 @@
 	hdmi-phandle = <&hdmi_tx>;
 };
 
+&clkc_audio {
+	status = "okay";
+};
+
 &cvbs_vdac_port {
 	cvbs_vdac_out: endpoint {
 		remote-endpoint = <&cvbs_connector_in>;
@@ -163,6 +295,18 @@
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
@@ -181,6 +325,14 @@
 	pinctrl-names = "default";
 };
 
+&pdm {
+	pinctrl-0 = <&pdm_din0_z_pins>, <&pdm_din1_z_pins>,
+		    <&pdm_din2_z_pins>, <&pdm_din3_z_pins>,
+		    <&pdm_dclk_z_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &saradc {
 	status = "okay";
 	vref-supply = <&vddio_ao1v8>;
@@ -223,6 +375,54 @@
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
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
