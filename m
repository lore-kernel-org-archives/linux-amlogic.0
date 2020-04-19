Return-Path: <SRS0=x2rd=6D=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E64EDC38A29
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Apr 2020 05:40:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAECD20753
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Apr 2020 05:40:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oDekwr0X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzhDfIBc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAECD20753
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Wh710dDrfYPYjpv957WAVuj9p44HZFvNUPdYDP3mJ0I=; b=oDekwr0X5abQQiLdDhcOPQFGfI
	3bIcYtP6XO//hdDKnTLq4M7Bc8TqUuTP+xMqP20ZAaGDgn+Kn1f8aOkYkEf2PLR9pV3Zx8VFPnanI
	5flO/aY/cF4yyR7gn19pXV0cFjCiN2ZAbaxcZnKV8Ojrgg9kfZBPunt2TRmrkw3TGHSTTq4uwiSB5
	6yQsQte4FxoxPpkvg5b63qc45yOM9noqXOu7ZDyka4rBGmhxd6FU+wTfAChrRCyu4virYB3K8ODJq
	pn+OncCNXKhQ/F/WnkArimdQB0Lkn5W2LOx1NN1mZqNU350kJGexVA4PvV1FfdjWPDIM1s6tPdycF
	Aff4pO9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQ2h7-0000lw-Qf; Sun, 19 Apr 2020 05:40:41 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQ2f6-0004rJ-Ax; Sun, 19 Apr 2020 05:38:38 +0000
Received: by mail-lf1-x141.google.com with SMTP id 198so5205894lfo.7;
 Sat, 18 Apr 2020 22:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yYC0sRuA/TYJuw5oAwEPc/sM406ZLPi+JH8RytrM9Xo=;
 b=NzhDfIBcxQ9+BGr6tDprN7zGw5HKY4gX+mcL3G3z7uYLtCZtNHXP9yA348ho+833z1
 MwScwF7kHs438Yxx5LMQFkFMaMqDMIHYCJdee1HhclVCseFjPvmnH7InR2iC/jEjMOVf
 /sL8xEkdFho9mrF86Dl6WVxT0u7EqRtwgzSfkQkZt4xkscKomcn4B07b2N7XdDKsX2YJ
 20Ge+29mpe2DuFU5KchFkLsduui0eQ7upSinWBV3Y7tmvq+J0sgq32uDj8/RMxXxakmi
 xUp8ebHfDdp0hbBByacSwl2DWAdu5OZODSANMi1z9tquYKMTI3MZCUh0C+dmPC3Kg7ll
 JRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=yYC0sRuA/TYJuw5oAwEPc/sM406ZLPi+JH8RytrM9Xo=;
 b=CYzR6iLI+CaNdx5n3mXYo6tPbR9iRkTTJsJ6+Zvu4M0v0CYpqeQLd+/MmY0cbndwxE
 py4FJ0K80rYnuleCBMgrUzwA0AzIx3PmXUNk4Oal90WbjWSCp1qfAWj2aOlLic+hzYUI
 h66CDz5se1i+AMg8Kz+RtRPlSx/tBaaYvV3xFw8yGSFe8Yoq0U43EvzI9SuaDjLy4f+3
 zg8FSdKzVIALAuBe6NZoLXHq5NrEjidCiwI9AoyPZ19QS6/p4zQuImrjzFS4DOkhbbB2
 geXFeEjis5ONifOPHx+kgkrmH9fO9QN9U03Fp6DyXEPH1BVl2wyhIw9C3SZDv0kzo0uv
 Vt+A==
X-Gm-Message-State: AGi0PublhIdVLio1DnG70p0bespxkVgKVWd+95BZA49P/vioQmrhwEau
 WC6hZC5401QXh9trUFj9xjw=
X-Google-Smtp-Source: APiQypJbGGSWUEbOeScJQPCu106dBdxhVhIfm+Fd+KW3uFwOL76qntlb4xO1N90B/fl+AQPJErEfbg==
X-Received: by 2002:a19:d3:: with SMTP id 202mr6530212lfa.24.1587274714755;
 Sat, 18 Apr 2020 22:38:34 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id r23sm20416619ljh.34.2020.04.18.22.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 22:38:34 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: meson: convert x96max to hdmi dtsi
Date: Sun, 19 Apr 2020 05:38:15 +0000
Message-Id: <20200419053815.15731-6-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200419053815.15731-1-christianshewitt@gmail.com>
References: <20200419053815.15731-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200418_223836_472340_FC3DDB03 
X-CRM114-Status: GOOD (  11.69  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Simplify the X96-max dts by using meson-g12-audio-hdmi.dtsi

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 131 +-----------------
 1 file changed, 1 insertion(+), 130 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 1b07c8c06eac..3ede72fc8f53 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -6,9 +6,9 @@
 /dts-v1/;
 
 #include "meson-g12a.dtsi"
+#include "meson-g12-audio-hdmi-spdif.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/gpio/meson-g12a-gpio.h>
-#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
 
 / {
 	compatible = "amediatech,x96-max", "amlogic,g12a";
@@ -19,13 +19,6 @@
 		ethernet0 = &ethmac;
 	};
 
-	spdif_dit: audio-codec-1 {
-		#sound-dai-cells = <0>;
-		compatible = "linux,spdif-dit";
-		status = "okay";
-		sound-name-prefix = "DIT";
-	};
-
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -148,86 +141,6 @@
 		regulator-always-on;
 	};
 
-	sound {
-		compatible = "amlogic,axg-sound-card";
-		model = "G12A-X96-MAX";
-		audio-aux-devs = <&tdmout_b>;
-		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
-				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
-				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
-				"TDM_B Playback", "TDMOUT_B OUT",
-				"SPDIFOUT IN 0", "FRDDR_A OUT 3",
-				"SPDIFOUT IN 1", "FRDDR_B OUT 3",
-				"SPDIFOUT IN 2", "FRDDR_C OUT 3";
-
-		assigned-clocks = <&clkc CLKID_MPLL2>,
-				  <&clkc CLKID_MPLL0>,
-				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
-		assigned-clock-rates = <294912000>,
-				       <270950400>,
-				       <393216000>;
-		status = "okay";
-
-		dai-link-0 {
-			sound-dai = <&frddr_a>;
-		};
-
-		dai-link-1 {
-			sound-dai = <&frddr_b>;
-		};
-
-		dai-link-2 {
-			sound-dai = <&frddr_c>;
-		};
-
-		/* 8ch hdmi interface */
-		dai-link-3 {
-			sound-dai = <&tdmif_b>;
-			dai-format = "i2s";
-			dai-tdm-slot-tx-mask-0 = <1 1>;
-			dai-tdm-slot-tx-mask-1 = <1 1>;
-			dai-tdm-slot-tx-mask-2 = <1 1>;
-			dai-tdm-slot-tx-mask-3 = <1 1>;
-			mclk-fs = <256>;
-
-			codec {
-				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
-			};
-		};
-
-		/* spdif hdmi or toslink interface */
-		dai-link-4 {
-			sound-dai = <&spdifout>;
-
-			codec-0 {
-				sound-dai = <&spdif_dit>;
-			};
-
-			codec-1 {
-				sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_A>;
-			};
-		};
-
-		/* spdif hdmi interface */
-		dai-link-5 {
-			sound-dai = <&spdifout_b>;
-
-			codec {
-				sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_B>;
-			};
-		};
-
-		/* hdmi glue */
-		dai-link-6 {
-			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
-
-			codec {
-				sound-dai = <&hdmi_tx>;
-			};
-		};
-	};
-
 	wifi32k: wifi32k {
 		compatible = "pwm-clock";
 		#clock-cells = <0>;
@@ -236,10 +149,6 @@
 	};
 };
 
-&arb {
-	status = "okay";
-};
-
 &cec_AO {
 	pinctrl-0 = <&cec_ao_a_h_pins>;
 	pinctrl-names = "default";
@@ -254,10 +163,6 @@
 	hdmi-phandle = <&hdmi_tx>;
 };
 
-&clkc_audio {
-	status = "okay";
-};
-
 &cpu0 {
 	cpu-supply = <&vddcpu>;
 	operating-points-v2 = <&cpu_opp_table>;
@@ -292,18 +197,6 @@
 	};
 };
 
-&frddr_a {
-	status = "okay";
-};
-
-&frddr_b {
-	status = "okay";
-};
-
-&frddr_c {
-	status = "okay";
-};
-
 &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
@@ -457,25 +350,3 @@
 	vmmc-supply = <&vcc_3v3>;
 	vqmmc-supply = <&flash_1v8>;
 };
-
-&spdifout {
-	pinctrl-0 = <&spdif_out_h_pins>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-&spdifout_b {
-	status = "okay";
-};
-
-&tdmif_b {
-	status = "okay";
-};
-
-&tdmout_b {
-	status = "okay";
-};
-
-&tohdmitx {
-	status = "okay";
-};
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
