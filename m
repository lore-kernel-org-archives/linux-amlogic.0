Return-Path: <SRS0=pqGQ=YC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC3EC47404
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Oct 2019 08:30:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AFA221721
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Oct 2019 08:30:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bpsle5Gp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="a89xlL0v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AFA221721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H50EI4TzJgOtGhE0+mnslIBtXOUn3gFBcWHSu62tUVM=; b=bpsle5GpVJfYLO
	x20f8Gccli3KKdvGch8OJP0h4ChGYQAIWsI5qAXamotLaD5ukY4eeXOSclLtMXsMa4JkN8T+qugoE
	1abeAwan/1zVpf30F8bZNY+R3nmfG6IsSIFUfkvLTakl3qu0PGH7AvUMMCwbZfgbVeAumlpYZ/Jdr
	Tu17g6CQg0Qp4WeyxI8sO3qxo3hcOXEIHcmCVEktFzHXCUdys1fkyp7wm+PcUYt9hSlpVSysgI5cg
	c5kgrR7llUEFRNHJl73p47CFB4WRTTnjA0cJIQE0Xs/C6CErJkbOA5nL1X7sILmlcfa1NaarxQ68a
	PfTpgj727RdmbwvONWGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iI7Md-00080J-Qn; Wed, 09 Oct 2019 08:30:31 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iI7JX-00046c-Sm
 for linux-amlogic@lists.infradead.org; Wed, 09 Oct 2019 08:27:22 +0000
Received: by mail-wr1-x444.google.com with SMTP id h4so1664998wrv.7
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Oct 2019 01:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OvCw6z/vD55XX2spmZ24RkopBr+oUCW2x7UwFTnjrck=;
 b=a89xlL0vi7kpulWa1LhqRRXRgOMcNMdfnsDhHzdCoSLq6lDOUrRjkN8gANfSpSS/u+
 wCVRauLU+lF12Ip7GHuzGLR7N2gD8bI+QlW0zUyx3tfXW6LFj+cuCKEUvB7xNL0OkLc3
 JFiN/RPychNhz/4dXa/ooe3hoZ9u+9UwFEhWIfLlgQERk1KLypUdVYxz3WpHjHXeaD8q
 YZ4guabhSUA6VlEUrxxjOtIBF/cVs8jlT4QTGq82NTEAD/7Gu0SeTVE6iow8WVjxsVqI
 UpnfQju2i771SrSNIQxzYPlu6CKKg5pcejJibwtXC89egMDiaryf9iJCAU+ql0G05lof
 2hSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OvCw6z/vD55XX2spmZ24RkopBr+oUCW2x7UwFTnjrck=;
 b=BbJdDfrLaHhqTUA62ZBijTIKQTzwfSaXIFaDTa299Gbulb3XHt5Td+8qh3PYzo7Ch2
 ewHmeCakZU+Yw1cBbRwdwzKuRxKMufydkCBS0W/UEZ3LAnZM/+R5IZGKbefK/OqkeVls
 Z0vhfoVzT3Jajbt5gxSM5FkQ92fk1EGiGvSfDr2wFZR8nJ742RMnElcwOWoDD1A9i6T+
 O14CdObke1cB9ijoYoiw8E9TqF3duyqtk3ObzpkM4zGqvdYDz/SJBCpd2nfnqrYPCSY3
 rmNc3M7rGIvSST69q+6OFypN0it7HmbSlPyVGwNnEHZVuqevgMcwMQEzIVO1ifzdQVhF
 fa7Q==
X-Gm-Message-State: APjAAAWS12wXsGDuufGcUdi3THqxUMwPmTT3lCmdU5PdsW3bNviCNCGQ
 bQHPOmdyg7tRh8TQGKRAAdZ+pw==
X-Google-Smtp-Source: APXvYqwNjGuqTmgNfxe4UkAcNv7Fn8HEx6K4twWrqC/kHPFgLuwokpSLR1JjR/Iu+rRHZQicorqS2w==
X-Received: by 2002:a5d:52c6:: with SMTP id r6mr1959391wrv.141.1570609638115; 
 Wed, 09 Oct 2019 01:27:18 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id r18sm2545364wme.48.2019.10.09.01.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 01:27:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] arm64: dts: meson: sm1: add audio devices
Date: Wed,  9 Oct 2019 10:27:07 +0200
Message-Id: <20191009082708.6337-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191009082708.6337-1-jbrunet@baylibre.com>
References: <20191009082708.6337-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191009_012719_946895_C4B39FE6 
X-CRM114-Status: GOOD (  10.15  )
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

Add the audio devices found on the SM1 SoC family. Only the spdif output
and input are missing. These are not supported yet since no platform is
available to them.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 327 +++++++++++++++++++++
 1 file changed, 327 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index f89d744c9648..7894a5458dbc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -5,11 +5,47 @@
  */
 
 #include "meson-g12-common.dtsi"
+#include <dt-bindings/clock/axg-audio-clkc.h>
 #include <dt-bindings/power/meson-sm1-power.h>
+#include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
+#include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
 
 / {
 	compatible = "amlogic,sm1";
 
+	tdmif_a: audio-controller-0 {
+		compatible = "amlogic,axg-tdm-iface";
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TDM_A";
+		clocks = <&clkc_audio AUD_CLKID_MST_A_MCLK>,
+			 <&clkc_audio AUD_CLKID_MST_A_SCLK>,
+			 <&clkc_audio AUD_CLKID_MST_A_LRCLK>;
+		clock-names = "mclk", "sclk", "lrclk";
+		status = "disabled";
+	};
+
+	tdmif_b: audio-controller-1 {
+		compatible = "amlogic,axg-tdm-iface";
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TDM_B";
+		clocks = <&clkc_audio AUD_CLKID_MST_B_MCLK>,
+			 <&clkc_audio AUD_CLKID_MST_B_SCLK>,
+			 <&clkc_audio AUD_CLKID_MST_B_LRCLK>;
+		clock-names = "mclk", "sclk", "lrclk";
+		status = "disabled";
+	};
+
+	tdmif_c: audio-controller-2 {
+		compatible = "amlogic,axg-tdm-iface";
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TDM_C";
+		clocks = <&clkc_audio AUD_CLKID_MST_C_MCLK>,
+			 <&clkc_audio AUD_CLKID_MST_C_SCLK>,
+			 <&clkc_audio AUD_CLKID_MST_C_LRCLK>;
+		clock-names = "mclk", "sclk", "lrclk";
+		status = "disabled";
+	};
+
 	cpus {
 		#address-cells = <0x2>;
 		#size-cells = <0x0>;
@@ -117,6 +153,297 @@
 	};
 };
 
+&apb {
+	audio: bus@60000 {
+		compatible = "simple-bus";
+		reg = <0x0 0x60000 0x0 0x1000>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x60000 0x0 0x1000>;
+
+		clkc_audio: clock-controller@0 {
+			status = "disabled";
+			compatible = "amlogic,sm1-audio-clkc";
+			reg = <0x0 0x0 0x0 0xb4>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+
+			clocks = <&clkc CLKID_AUDIO>,
+				 <&clkc CLKID_MPLL0>,
+				 <&clkc CLKID_MPLL1>,
+				 <&clkc CLKID_MPLL2>,
+				 <&clkc CLKID_MPLL3>,
+				 <&clkc CLKID_HIFI_PLL>,
+				 <&clkc CLKID_FCLK_DIV3>,
+				 <&clkc CLKID_FCLK_DIV4>,
+				 <&clkc CLKID_FCLK_DIV5>;
+			clock-names = "pclk",
+				      "mst_in0",
+				      "mst_in1",
+				      "mst_in2",
+				      "mst_in3",
+				      "mst_in4",
+				      "mst_in5",
+				      "mst_in6",
+				      "mst_in7";
+
+			resets = <&reset RESET_AUDIO>;
+		};
+
+		toddr_a: audio-controller@100 {
+			compatible = "amlogic,sm1-toddr",
+				     "amlogic,axg-toddr";
+			reg = <0x0 0x100 0x0 0x2c>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "TODDR_A";
+			interrupts = <GIC_SPI 148 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_audio AUD_CLKID_TODDR_A>;
+			resets = <&arb AXG_ARB_TODDR_A>,
+				 <&clkc_audio AUD_RESET_TODDR_A>;
+			reset-names = "arb", "rst";
+			status = "disabled";
+		};
+
+		toddr_b: audio-controller@140 {
+			compatible = "amlogic,sm1-toddr",
+				     "amlogic,axg-toddr";
+			reg = <0x0 0x140 0x0 0x2c>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "TODDR_B";
+			interrupts = <GIC_SPI 149 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_audio AUD_CLKID_TODDR_B>;
+			resets = <&arb AXG_ARB_TODDR_B>,
+				 <&clkc_audio AUD_RESET_TODDR_B>;
+			reset-names = "arb", "rst";
+			status = "disabled";
+		};
+
+		toddr_c: audio-controller@180 {
+			compatible = "amlogic,sm1-toddr",
+				     "amlogic,axg-toddr";
+			reg = <0x0 0x180 0x0 0x2c>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "TODDR_C";
+			interrupts = <GIC_SPI 150 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_audio AUD_CLKID_TODDR_C>;
+			resets = <&arb AXG_ARB_TODDR_C>,
+				 <&clkc_audio AUD_RESET_TODDR_C>;
+			reset-names = "arb", "rst";
+			status = "disabled";
+		};
+
+		frddr_a: audio-controller@1c0 {
+			compatible = "amlogic,sm1-frddr",
+				     "amlogic,axg-frddr";
+			reg = <0x0 0x1c0 0x0 0x2c>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "FRDDR_A";
+			interrupts = <GIC_SPI 152 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
+			resets = <&arb AXG_ARB_FRDDR_A>,
+				 <&clkc_audio AUD_RESET_FRDDR_A>;
+			reset-names = "arb", "rst";
+			status = "disabled";
+		};
+
+		frddr_b: audio-controller@200 {
+			compatible = "amlogic,sm1-frddr",
+				     "amlogic,axg-frddr";
+			reg = <0x0 0x200 0x0 0x2c>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "FRDDR_B";
+			interrupts = <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_audio AUD_CLKID_FRDDR_B>;
+			resets = <&arb AXG_ARB_FRDDR_B>,
+				 <&clkc_audio AUD_RESET_FRDDR_B>;
+			reset-names = "arb", "rst";
+			status = "disabled";
+		};
+
+		frddr_c: audio-controller@240 {
+			compatible = "amlogic,sm1-frddr",
+				     "amlogic,axg-frddr";
+			reg = <0x0 0x240 0x0 0x2c>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "FRDDR_C";
+			interrupts = <GIC_SPI 154 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_audio AUD_CLKID_FRDDR_C>;
+			resets = <&arb AXG_ARB_FRDDR_C>,
+				 <&clkc_audio AUD_RESET_FRDDR_C>;
+			reset-names = "arb", "rst";
+			status = "disabled";
+		};
+
+		arb: reset-controller@280 {
+			status = "disabled";
+			compatible = "amlogic,meson-sm1-audio-arb";
+			reg = <0x0 0x280 0x0 0x4>;
+			#reset-cells = <1>;
+			clocks = <&clkc_audio AUD_CLKID_DDR_ARB>;
+		};
+
+		tdmin_a: audio-controller@300 {
+			compatible = "amlogic,sm1-tdmin",
+				     "amlogic,axg-tdmin";
+			reg = <0x0 0x300 0x0 0x40>;
+			sound-name-prefix = "TDMIN_A";
+			resets = <&clkc_audio AUD_RESET_TDMIN_A>;
+			clocks = <&clkc_audio AUD_CLKID_TDMIN_A>,
+				 <&clkc_audio AUD_CLKID_TDMIN_A_SCLK>,
+				 <&clkc_audio AUD_CLKID_TDMIN_A_SCLK_SEL>,
+				 <&clkc_audio AUD_CLKID_TDMIN_A_LRCLK>,
+				 <&clkc_audio AUD_CLKID_TDMIN_A_LRCLK>;
+			clock-names = "pclk", "sclk", "sclk_sel",
+				      "lrclk", "lrclk_sel";
+			status = "disabled";
+		};
+
+		tdmin_b: audio-controller@340 {
+			compatible = "amlogic,sm1-tdmin",
+				     "amlogic,axg-tdmin";
+			reg = <0x0 0x340 0x0 0x40>;
+			sound-name-prefix = "TDMIN_B";
+			resets = <&clkc_audio AUD_RESET_TDMIN_B>;
+			clocks = <&clkc_audio AUD_CLKID_TDMIN_B>,
+				 <&clkc_audio AUD_CLKID_TDMIN_B_SCLK>,
+				 <&clkc_audio AUD_CLKID_TDMIN_B_SCLK_SEL>,
+				 <&clkc_audio AUD_CLKID_TDMIN_B_LRCLK>,
+				 <&clkc_audio AUD_CLKID_TDMIN_B_LRCLK>;
+			clock-names = "pclk", "sclk", "sclk_sel",
+				      "lrclk", "lrclk_sel";
+			status = "disabled";
+		};
+
+		tdmin_c: audio-controller@380 {
+			compatible = "amlogic,sm1-tdmin",
+				     "amlogic,axg-tdmin";
+			reg = <0x0 0x380 0x0 0x40>;
+			sound-name-prefix = "TDMIN_C";
+			resets = <&clkc_audio AUD_RESET_TDMIN_C>;
+			clocks = <&clkc_audio AUD_CLKID_TDMIN_C>,
+				 <&clkc_audio AUD_CLKID_TDMIN_C_SCLK>,
+				 <&clkc_audio AUD_CLKID_TDMIN_C_SCLK_SEL>,
+				 <&clkc_audio AUD_CLKID_TDMIN_C_LRCLK>,
+				 <&clkc_audio AUD_CLKID_TDMIN_C_LRCLK>;
+			clock-names = "pclk", "sclk", "sclk_sel",
+				      "lrclk", "lrclk_sel";
+			status = "disabled";
+		};
+
+		tdmin_lb: audio-controller@3c0 {
+			compatible = "amlogic,sm1-tdmin",
+				     "amlogic,axg-tdmin";
+			reg = <0x0 0x3c0 0x0 0x40>;
+			sound-name-prefix = "TDMIN_LB";
+			resets = <&clkc_audio AUD_RESET_TDMIN_LB>;
+			clocks = <&clkc_audio AUD_CLKID_TDMIN_LB>,
+				 <&clkc_audio AUD_CLKID_TDMIN_LB_SCLK>,
+				 <&clkc_audio AUD_CLKID_TDMIN_LB_SCLK_SEL>,
+				 <&clkc_audio AUD_CLKID_TDMIN_LB_LRCLK>,
+				 <&clkc_audio AUD_CLKID_TDMIN_LB_LRCLK>;
+			clock-names = "pclk", "sclk", "sclk_sel",
+				      "lrclk", "lrclk_sel";
+			status = "disabled";
+		};
+
+		tdmout_a: audio-controller@500 {
+			compatible = "amlogic,sm1-tdmout";
+			reg = <0x0 0x500 0x0 0x40>;
+			sound-name-prefix = "TDMOUT_A";
+			resets = <&clkc_audio AUD_RESET_TDMOUT_A>;
+			clocks = <&clkc_audio AUD_CLKID_TDMOUT_A>,
+				 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK>,
+				 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK_SEL>,
+				 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>,
+				 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>;
+			clock-names = "pclk", "sclk", "sclk_sel",
+				      "lrclk", "lrclk_sel";
+			status = "disabled";
+		};
+
+		tdmout_b: audio-controller@540 {
+			compatible = "amlogic,sm1-tdmout";
+			reg = <0x0 0x540 0x0 0x40>;
+			sound-name-prefix = "TDMOUT_B";
+			resets = <&clkc_audio AUD_RESET_TDMOUT_B>;
+			clocks = <&clkc_audio AUD_CLKID_TDMOUT_B>,
+				 <&clkc_audio AUD_CLKID_TDMOUT_B_SCLK>,
+				 <&clkc_audio AUD_CLKID_TDMOUT_B_SCLK_SEL>,
+				 <&clkc_audio AUD_CLKID_TDMOUT_B_LRCLK>,
+				 <&clkc_audio AUD_CLKID_TDMOUT_B_LRCLK>;
+			clock-names = "pclk", "sclk", "sclk_sel",
+				      "lrclk", "lrclk_sel";
+			status = "disabled";
+		};
+
+		tdmout_c: audio-controller@580 {
+			compatible = "amlogic,sm1-tdmout";
+			reg = <0x0 0x580 0x0 0x40>;
+			sound-name-prefix = "TDMOUT_C";
+			resets = <&clkc_audio AUD_RESET_TDMOUT_C>;
+			clocks = <&clkc_audio AUD_CLKID_TDMOUT_C>,
+				 <&clkc_audio AUD_CLKID_TDMOUT_C_SCLK>,
+				 <&clkc_audio AUD_CLKID_TDMOUT_C_SCLK_SEL>,
+				 <&clkc_audio AUD_CLKID_TDMOUT_C_LRCLK>,
+				 <&clkc_audio AUD_CLKID_TDMOUT_C_LRCLK>;
+			clock-names = "pclk", "sclk", "sclk_sel",
+				      "lrclk", "lrclk_sel";
+			status = "disabled";
+		};
+
+		tohdmitx: audio-controller@744 {
+			compatible = "amlogic,sm1-tohdmitx",
+				     "amlogic,g12a-tohdmitx";
+			reg = <0x0 0x744 0x0 0x4>;
+			#sound-dai-cells = <1>;
+			sound-name-prefix = "TOHDMITX";
+			resets = <&clkc_audio AUD_RESET_TOHDMITX>;
+			status = "disabled";
+		};
+
+		toddr_d: audio-controller@840 {
+			compatible = "amlogic,sm1-toddr",
+				     "amlogic,axg-toddr";
+			reg = <0x0 0x840 0x0 0x2c>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "TODDR_D";
+			interrupts = <GIC_SPI 49 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_audio AUD_CLKID_TODDR_D>;
+			resets = <&arb AXG_ARB_TODDR_D>,
+				 <&clkc_audio AUD_RESET_TODDR_D>;
+			reset-names = "arb", "rst";
+			status = "disabled";
+		};
+
+		frddr_d: audio-controller@880 {
+			 compatible = "amlogic,sm1-frddr",
+				      "amlogic,axg-frddr";
+			reg = <0x0 0x880 0x0 0x2c>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "FRDDR_D";
+			interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_audio AUD_CLKID_FRDDR_D>;
+			resets = <&arb AXG_ARB_FRDDR_D>,
+				 <&clkc_audio AUD_RESET_FRDDR_D>;
+			reset-names = "arb", "rst";
+			status = "disabled";
+		};
+	};
+
+	pdm: audio-controller@61000 {
+		compatible = "amlogic,sm1-pdm",
+			     "amlogic,axg-pdm";
+		reg = <0x0 0x61000 0x0 0x34>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "PDM";
+		clocks = <&clkc_audio AUD_CLKID_PDM>,
+			 <&clkc_audio AUD_CLKID_PDM_DCLK>,
+			 <&clkc_audio AUD_CLKID_PDM_SYSCLK>;
+		clock-names = "pclk", "dclk", "sysclk";
+		status = "disabled";
+	};
+};
+
 &cecb_AO {
 	compatible = "amlogic,meson-sm1-ao-cec";
 };
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
