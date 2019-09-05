Return-Path: <SRS0=+PkE=XA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E95C3A5AA
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 13:00:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 586A821BE5
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 13:00:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bMhv1Yxt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="J68FFBG3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 586A821BE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qDtuzF6x/PYvOTedDeokfncMttDHmZF6ExGuIIHNgzY=; b=bMhv1YxthkNtKd
	vMqzOJj73AVgr7OcM1L80dz6ODEijMTdrhxIir8MBGvHHOrTjy/fFoRFZaO8aiLoTReuMVnHHd1v4
	Ng5T7lybBiIv6+E9+pgXauehLdTTlTVkidaiye5vqW8P/LXU5Nzp1FeKl5g1QtIrUgC8Y3duhKgD9
	DEfwLdlB2rm8B50NT90T7QDMIaMYYydF0yjS0Kdcm/J1j0LzfuW3I2lOXEG2/BFPNflv3bzx3apDA
	AG15MMqMjKUYS9mJNgDvpX9/fDIbUigO0ZUPwGvp8tzyjdBb3c5f3vGBahillULaYy66Bv/P4kWmP
	KGzf5FIsf2TYCkexWAIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5rN3-0006fS-FQ; Thu, 05 Sep 2019 13:00:17 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5rMw-0006V8-1V
 for linux-amlogic@lists.infradead.org; Thu, 05 Sep 2019 13:00:12 +0000
Received: by mail-wm1-x342.google.com with SMTP id n10so2938472wmj.0
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2019 06:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tg72AFDU3yC+NJbASKmdxgrvf6ZY3trkfmLrWIR27V8=;
 b=J68FFBG3xtdSsAANLDUzsD8pmZ39OZwDjBn4N19X9eo8RLiWVdwqflkeuiOd1L5TD0
 DUIJBzTZJbjQG18PLrfcY2DWBNwwriao93+I2b7FLiH6vVy4d/erGabZ8iDYQS+9CGew
 1lYE5FeWEj3s0rDQRmxBvSD6C3YN1IfZK3HB8Lp2onuVRn55TFb85+w98Ru2oxwOvvzO
 /U5Ga83Sm5HKS8nYw4ceW27hHQbeyW5u+RlkVlghT7r61Q5mlf2+jp0zMzdtI6w+2/Dj
 Y0uN45K9j6W3SrciJP3OvbyFyl/PwacmmvDqywBfUtkKgbHFxUkq5BKRSnxNEjfPfYAA
 vwRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tg72AFDU3yC+NJbASKmdxgrvf6ZY3trkfmLrWIR27V8=;
 b=GECZFPNSa7QQ3mStRUNFeVObJeCm4vXsdq+aaG5jgkmXrxTiHGSuxZe+BeFDZlDqrR
 X3het845i69ljQk3B4n1zeh9mD9Up6xRGfazE4K/rcUzbN3PWvPqqgmUYaaWG4/KTFvu
 xlAOYMAOSOF6nhmIe7ASSvDe4HX0YXTl5LITt4O+oHCTWgfaoORRZnMiS5vxyzMcvCbI
 op4DEKRxaYJjtOQJFIyJViYv2O7zARFRLI1/3G/w+TiGp2ijiTnxWv8Ls3mP3riThtYG
 yN7zJtxCbCCZgYO9Y0GdVvAI4Zfu/gZmAZisGQozcjWxYC/ouJBaTjjciI68sgif8qAa
 B6aQ==
X-Gm-Message-State: APjAAAX/q9u1OmeXnpSxOf+BVex1Yly6almIh9jvJilYnEUp99wAaLsp
 sUogkZHE8QWbstId4jcR4X8OAQ==
X-Google-Smtp-Source: APXvYqyzXnhfpuEMfaEKET08J54DUJhO9QjVCL9Ltg2/OrabtUG2aT61TWiGw04H/emfRgJuJhFyNQ==
X-Received: by 2002:a1c:9a94:: with SMTP id c142mr2827918wme.172.1567688407897; 
 Thu, 05 Sep 2019 06:00:07 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z189sm3727903wmc.25.2019.09.05.06.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 06:00:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 5/5] arm64: dts: meson: g12: move audio bus out of g12-common
Date: Thu,  5 Sep 2019 14:59:56 +0200
Message-Id: <20190905125956.4384-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190905125956.4384-1-jbrunet@baylibre.com>
References: <20190905125956.4384-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_060010_297838_E7819A79 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

The base address of the audio bus and pdm device are different
between the g12 and sm1 SoC families. Overwriting the reg property
only would leave with confusing node names on the sm1.

Move the audio related devices to the g12 dtsi. The appropriate nodes
will be created for the sm1 later on.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12-common.dtsi    | 320 -----------------
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi    | 324 ++++++++++++++++++
 2 files changed, 324 insertions(+), 320 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 0ee8a369c547..95e9cf405fe9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -5,13 +5,10 @@
 
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/clock/axg-audio-clkc.h>
 #include <dt-bindings/clock/g12a-clkc.h>
 #include <dt-bindings/clock/g12a-aoclkc.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
-#include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
-#include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
 #include <dt-bindings/reset/amlogic,meson-g12a-reset.h>
 
 / {
@@ -19,39 +16,6 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	tdmif_a: audio-controller-0 {
-		compatible = "amlogic,axg-tdm-iface";
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "TDM_A";
-		clocks = <&clkc_audio AUD_CLKID_MST_A_MCLK>,
-			 <&clkc_audio AUD_CLKID_MST_A_SCLK>,
-			 <&clkc_audio AUD_CLKID_MST_A_LRCLK>;
-		clock-names = "mclk", "sclk", "lrclk";
-		status = "disabled";
-	};
-
-	tdmif_b: audio-controller-1 {
-		compatible = "amlogic,axg-tdm-iface";
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "TDM_B";
-		clocks = <&clkc_audio AUD_CLKID_MST_B_MCLK>,
-			 <&clkc_audio AUD_CLKID_MST_B_SCLK>,
-			 <&clkc_audio AUD_CLKID_MST_B_LRCLK>;
-		clock-names = "mclk", "sclk", "lrclk";
-		status = "disabled";
-	};
-
-	tdmif_c: audio-controller-2 {
-		compatible = "amlogic,axg-tdm-iface";
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "TDM_C";
-		clocks = <&clkc_audio AUD_CLKID_MST_C_MCLK>,
-			 <&clkc_audio AUD_CLKID_MST_C_SCLK>,
-			 <&clkc_audio AUD_CLKID_MST_C_LRCLK>;
-		clock-names = "mclk", "sclk", "lrclk";
-		status = "disabled";
-	};
-
 	efuse: efuse {
 		compatible = "amlogic,meson-gxbb-efuse";
 		clocks = <&clkc CLKID_EFUSE>;
@@ -1457,290 +1421,6 @@
 				};
 			};
 
-			pdm: audio-controller@40000 {
-				compatible = "amlogic,g12a-pdm",
-					     "amlogic,axg-pdm";
-				reg = <0x0 0x40000 0x0 0x34>;
-				#sound-dai-cells = <0>;
-				sound-name-prefix = "PDM";
-				clocks = <&clkc_audio AUD_CLKID_PDM>,
-					 <&clkc_audio AUD_CLKID_PDM_DCLK>,
-					 <&clkc_audio AUD_CLKID_PDM_SYSCLK>;
-				clock-names = "pclk", "dclk", "sysclk";
-				status = "disabled";
-			};
-
-			audio: bus@42000 {
-				compatible = "simple-bus";
-				reg = <0x0 0x42000 0x0 0x2000>;
-				#address-cells = <2>;
-				#size-cells = <2>;
-				ranges = <0x0 0x0 0x0 0x42000 0x0 0x2000>;
-
-				clkc_audio: clock-controller@0 {
-					status = "disabled";
-					compatible = "amlogic,g12a-audio-clkc";
-					reg = <0x0 0x0 0x0 0xb4>;
-					#clock-cells = <1>;
-					#reset-cells = <1>;
-
-					clocks = <&clkc CLKID_AUDIO>,
-						 <&clkc CLKID_MPLL0>,
-						 <&clkc CLKID_MPLL1>,
-						 <&clkc CLKID_MPLL2>,
-						 <&clkc CLKID_MPLL3>,
-						 <&clkc CLKID_HIFI_PLL>,
-						 <&clkc CLKID_FCLK_DIV3>,
-						 <&clkc CLKID_FCLK_DIV4>,
-						 <&clkc CLKID_GP0_PLL>;
-					clock-names = "pclk",
-						      "mst_in0",
-						      "mst_in1",
-						      "mst_in2",
-						      "mst_in3",
-						      "mst_in4",
-						      "mst_in5",
-						      "mst_in6",
-						      "mst_in7";
-
-					resets = <&reset RESET_AUDIO>;
-				};
-
-				toddr_a: audio-controller@100 {
-					compatible = "amlogic,g12a-toddr",
-						     "amlogic,axg-toddr";
-					reg = <0x0 0x100 0x0 0x2c>;
-					#sound-dai-cells = <0>;
-					sound-name-prefix = "TODDR_A";
-					interrupts = <GIC_SPI 148 IRQ_TYPE_EDGE_RISING>;
-					clocks = <&clkc_audio AUD_CLKID_TODDR_A>;
-					resets = <&arb AXG_ARB_TODDR_A>;
-					status = "disabled";
-				};
-
-				toddr_b: audio-controller@140 {
-					compatible = "amlogic,g12a-toddr",
-						     "amlogic,axg-toddr";
-					reg = <0x0 0x140 0x0 0x2c>;
-					#sound-dai-cells = <0>;
-					sound-name-prefix = "TODDR_B";
-					interrupts = <GIC_SPI 149 IRQ_TYPE_EDGE_RISING>;
-					clocks = <&clkc_audio AUD_CLKID_TODDR_B>;
-					resets = <&arb AXG_ARB_TODDR_B>;
-					status = "disabled";
-				};
-
-				toddr_c: audio-controller@180 {
-					compatible = "amlogic,g12a-toddr",
-						     "amlogic,axg-toddr";
-					reg = <0x0 0x180 0x0 0x2c>;
-					#sound-dai-cells = <0>;
-					sound-name-prefix = "TODDR_C";
-					interrupts = <GIC_SPI 150 IRQ_TYPE_EDGE_RISING>;
-					clocks = <&clkc_audio AUD_CLKID_TODDR_C>;
-					resets = <&arb AXG_ARB_TODDR_C>;
-					status = "disabled";
-				};
-
-				frddr_a: audio-controller@1c0 {
-					compatible = "amlogic,g12a-frddr",
-						     "amlogic,axg-frddr";
-					reg = <0x0 0x1c0 0x0 0x2c>;
-					#sound-dai-cells = <0>;
-					sound-name-prefix = "FRDDR_A";
-					interrupts = <GIC_SPI 152 IRQ_TYPE_EDGE_RISING>;
-					clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
-					resets = <&arb AXG_ARB_FRDDR_A>;
-					status = "disabled";
-				};
-
-				frddr_b: audio-controller@200 {
-					compatible = "amlogic,g12a-frddr",
-						     "amlogic,axg-frddr";
-					reg = <0x0 0x200 0x0 0x2c>;
-					#sound-dai-cells = <0>;
-					sound-name-prefix = "FRDDR_B";
-					interrupts = <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>;
-					clocks = <&clkc_audio AUD_CLKID_FRDDR_B>;
-					resets = <&arb AXG_ARB_FRDDR_B>;
-					status = "disabled";
-				};
-
-				frddr_c: audio-controller@240 {
-					compatible = "amlogic,g12a-frddr",
-						     "amlogic,axg-frddr";
-					reg = <0x0 0x240 0x0 0x2c>;
-					#sound-dai-cells = <0>;
-					sound-name-prefix = "FRDDR_C";
-					interrupts = <GIC_SPI 154 IRQ_TYPE_EDGE_RISING>;
-					clocks = <&clkc_audio AUD_CLKID_FRDDR_C>;
-					resets = <&arb AXG_ARB_FRDDR_C>;
-					status = "disabled";
-				};
-
-				arb: reset-controller@280 {
-					status = "disabled";
-					compatible = "amlogic,meson-axg-audio-arb";
-					reg = <0x0 0x280 0x0 0x4>;
-					#reset-cells = <1>;
-					clocks = <&clkc_audio AUD_CLKID_DDR_ARB>;
-				};
-
-				tdmin_a: audio-controller@300 {
-					compatible = "amlogic,g12a-tdmin",
-						     "amlogic,axg-tdmin";
-					reg = <0x0 0x300 0x0 0x40>;
-					sound-name-prefix = "TDMIN_A";
-					resets = <&clkc_audio AUD_RESET_TDMIN_A>;
-					clocks = <&clkc_audio AUD_CLKID_TDMIN_A>,
-						 <&clkc_audio AUD_CLKID_TDMIN_A_SCLK>,
-						 <&clkc_audio AUD_CLKID_TDMIN_A_SCLK_SEL>,
-						 <&clkc_audio AUD_CLKID_TDMIN_A_LRCLK>,
-						 <&clkc_audio AUD_CLKID_TDMIN_A_LRCLK>;
-					clock-names = "pclk", "sclk", "sclk_sel",
-						      "lrclk", "lrclk_sel";
-					status = "disabled";
-				};
-
-				tdmin_b: audio-controller@340 {
-					compatible = "amlogic,g12a-tdmin",
-						     "amlogic,axg-tdmin";
-					reg = <0x0 0x340 0x0 0x40>;
-					sound-name-prefix = "TDMIN_B";
-					resets = <&clkc_audio AUD_RESET_TDMIN_B>;
-					clocks = <&clkc_audio AUD_CLKID_TDMIN_B>,
-						 <&clkc_audio AUD_CLKID_TDMIN_B_SCLK>,
-						 <&clkc_audio AUD_CLKID_TDMIN_B_SCLK_SEL>,
-						 <&clkc_audio AUD_CLKID_TDMIN_B_LRCLK>,
-						 <&clkc_audio AUD_CLKID_TDMIN_B_LRCLK>;
-					clock-names = "pclk", "sclk", "sclk_sel",
-						      "lrclk", "lrclk_sel";
-					status = "disabled";
-				};
-
-				tdmin_c: audio-controller@380 {
-					compatible = "amlogic,g12a-tdmin",
-						     "amlogic,axg-tdmin";
-					reg = <0x0 0x380 0x0 0x40>;
-					sound-name-prefix = "TDMIN_C";
-					resets = <&clkc_audio AUD_RESET_TDMIN_C>;
-					clocks = <&clkc_audio AUD_CLKID_TDMIN_C>,
-						 <&clkc_audio AUD_CLKID_TDMIN_C_SCLK>,
-						 <&clkc_audio AUD_CLKID_TDMIN_C_SCLK_SEL>,
-						 <&clkc_audio AUD_CLKID_TDMIN_C_LRCLK>,
-						 <&clkc_audio AUD_CLKID_TDMIN_C_LRCLK>;
-					clock-names = "pclk", "sclk", "sclk_sel",
-						      "lrclk", "lrclk_sel";
-					status = "disabled";
-				};
-
-				tdmin_lb: audio-controller@3c0 {
-					compatible = "amlogic,g12a-tdmin",
-						     "amlogic,axg-tdmin";
-					reg = <0x0 0x3c0 0x0 0x40>;
-					sound-name-prefix = "TDMIN_LB";
-					resets = <&clkc_audio AUD_RESET_TDMIN_LB>;
-					clocks = <&clkc_audio AUD_CLKID_TDMIN_LB>,
-						 <&clkc_audio AUD_CLKID_TDMIN_LB_SCLK>,
-						 <&clkc_audio AUD_CLKID_TDMIN_LB_SCLK_SEL>,
-						 <&clkc_audio AUD_CLKID_TDMIN_LB_LRCLK>,
-						 <&clkc_audio AUD_CLKID_TDMIN_LB_LRCLK>;
-					clock-names = "pclk", "sclk", "sclk_sel",
-						      "lrclk", "lrclk_sel";
-					status = "disabled";
-				};
-
-				spdifin: audio-controller@400 {
-					compatible = "amlogic,g12a-spdifin",
-						     "amlogic,axg-spdifin";
-					reg = <0x0 0x400 0x0 0x30>;
-					#sound-dai-cells = <0>;
-					sound-name-prefix = "SPDIFIN";
-					interrupts = <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
-					clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
-						 <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
-					clock-names = "pclk", "refclk";
-					status = "disabled";
-				};
-
-				spdifout: audio-controller@480 {
-					compatible = "amlogic,g12a-spdifout",
-						     "amlogic,axg-spdifout";
-					reg = <0x0 0x480 0x0 0x50>;
-					#sound-dai-cells = <0>;
-					sound-name-prefix = "SPDIFOUT";
-					clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
-						 <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
-					clock-names = "pclk", "mclk";
-					status = "disabled";
-				};
-
-				tdmout_a: audio-controller@500 {
-					compatible = "amlogic,g12a-tdmout";
-					reg = <0x0 0x500 0x0 0x40>;
-					sound-name-prefix = "TDMOUT_A";
-					resets = <&clkc_audio AUD_RESET_TDMOUT_A>;
-					clocks = <&clkc_audio AUD_CLKID_TDMOUT_A>,
-						 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK>,
-						 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK_SEL>,
-						 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>,
-						 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>;
-					clock-names = "pclk", "sclk", "sclk_sel",
-						      "lrclk", "lrclk_sel";
-					status = "disabled";
-				};
-
-				tdmout_b: audio-controller@540 {
-					compatible = "amlogic,g12a-tdmout";
-					reg = <0x0 0x540 0x0 0x40>;
-					sound-name-prefix = "TDMOUT_B";
-					resets = <&clkc_audio AUD_RESET_TDMOUT_B>;
-					clocks = <&clkc_audio AUD_CLKID_TDMOUT_B>,
-						 <&clkc_audio AUD_CLKID_TDMOUT_B_SCLK>,
-						 <&clkc_audio AUD_CLKID_TDMOUT_B_SCLK_SEL>,
-						 <&clkc_audio AUD_CLKID_TDMOUT_B_LRCLK>,
-						 <&clkc_audio AUD_CLKID_TDMOUT_B_LRCLK>;
-					clock-names = "pclk", "sclk", "sclk_sel",
-						      "lrclk", "lrclk_sel";
-					status = "disabled";
-				};
-
-				tdmout_c: audio-controller@580 {
-					compatible = "amlogic,g12a-tdmout";
-					reg = <0x0 0x580 0x0 0x40>;
-					sound-name-prefix = "TDMOUT_C";
-					resets = <&clkc_audio AUD_RESET_TDMOUT_C>;
-					clocks = <&clkc_audio AUD_CLKID_TDMOUT_C>,
-						 <&clkc_audio AUD_CLKID_TDMOUT_C_SCLK>,
-						 <&clkc_audio AUD_CLKID_TDMOUT_C_SCLK_SEL>,
-						 <&clkc_audio AUD_CLKID_TDMOUT_C_LRCLK>,
-						 <&clkc_audio AUD_CLKID_TDMOUT_C_LRCLK>;
-					clock-names = "pclk", "sclk", "sclk_sel",
-						      "lrclk", "lrclk_sel";
-					status = "disabled";
-				};
-
-				spdifout_b: audio-controller@680 {
-					compatible = "amlogic,g12a-spdifout",
-						     "amlogic,axg-spdifout";
-					reg = <0x0 0x680 0x0 0x50>;
-					#sound-dai-cells = <0>;
-					sound-name-prefix = "SPDIFOUT_B";
-					clocks = <&clkc_audio AUD_CLKID_SPDIFOUT_B>,
-						 <&clkc_audio AUD_CLKID_SPDIFOUT_B_CLK>;
-					clock-names = "pclk", "mclk";
-					status = "disabled";
-				};
-
-				tohdmitx: audio-controller@744 {
-					compatible = "amlogic,g12a-tohdmitx";
-					reg = <0x0 0x744 0x0 0x4>;
-					#sound-dai-cells = <1>;
-					sound-name-prefix = "TOHDMITX";
-					status = "disabled";
-				};
-			};
-
 			usb3_pcie_phy: phy@46000 {
 				compatible = "amlogic,g12a-usb3-pcie-phy";
 				reg = <0x0 0x46000 0x0 0x2000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
index ac5833781611..0d9df29994f3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
@@ -5,7 +5,331 @@
  */
 
 #include "meson-g12-common.dtsi"
+#include <dt-bindings/clock/axg-audio-clkc.h>
 #include <dt-bindings/power/meson-g12a-power.h>
+#include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
+#include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
+
+/ {
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
+};
+
+&apb {
+	pdm: audio-controller@40000 {
+		compatible = "amlogic,g12a-pdm",
+			     "amlogic,axg-pdm";
+		reg = <0x0 0x40000 0x0 0x34>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "PDM";
+		clocks = <&clkc_audio AUD_CLKID_PDM>,
+			 <&clkc_audio AUD_CLKID_PDM_DCLK>,
+			 <&clkc_audio AUD_CLKID_PDM_SYSCLK>;
+		clock-names = "pclk", "dclk", "sysclk";
+		status = "disabled";
+	};
+
+	audio: bus@42000 {
+		compatible = "simple-bus";
+		reg = <0x0 0x42000 0x0 0x2000>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x42000 0x0 0x2000>;
+
+		clkc_audio: clock-controller@0 {
+			status = "disabled";
+			compatible = "amlogic,g12a-audio-clkc";
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
+				 <&clkc CLKID_GP0_PLL>;
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
+			compatible = "amlogic,g12a-toddr",
+				     "amlogic,axg-toddr";
+			reg = <0x0 0x100 0x0 0x2c>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "TODDR_A";
+			interrupts = <GIC_SPI 148 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_audio AUD_CLKID_TODDR_A>;
+			resets = <&arb AXG_ARB_TODDR_A>;
+			status = "disabled";
+		};
+
+		toddr_b: audio-controller@140 {
+			compatible = "amlogic,g12a-toddr",
+				     "amlogic,axg-toddr";
+			reg = <0x0 0x140 0x0 0x2c>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "TODDR_B";
+			interrupts = <GIC_SPI 149 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_audio AUD_CLKID_TODDR_B>;
+			resets = <&arb AXG_ARB_TODDR_B>;
+			status = "disabled";
+		};
+
+		toddr_c: audio-controller@180 {
+			compatible = "amlogic,g12a-toddr",
+				     "amlogic,axg-toddr";
+			reg = <0x0 0x180 0x0 0x2c>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "TODDR_C";
+			interrupts = <GIC_SPI 150 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_audio AUD_CLKID_TODDR_C>;
+			resets = <&arb AXG_ARB_TODDR_C>;
+			status = "disabled";
+		};
+
+		frddr_a: audio-controller@1c0 {
+			compatible = "amlogic,g12a-frddr",
+				     "amlogic,axg-frddr";
+			reg = <0x0 0x1c0 0x0 0x2c>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "FRDDR_A";
+			interrupts = <GIC_SPI 152 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
+			resets = <&arb AXG_ARB_FRDDR_A>;
+			status = "disabled";
+		};
+
+		frddr_b: audio-controller@200 {
+			compatible = "amlogic,g12a-frddr",
+				     "amlogic,axg-frddr";
+			reg = <0x0 0x200 0x0 0x2c>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "FRDDR_B";
+			interrupts = <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_audio AUD_CLKID_FRDDR_B>;
+			resets = <&arb AXG_ARB_FRDDR_B>;
+			status = "disabled";
+		};
+
+		frddr_c: audio-controller@240 {
+			compatible = "amlogic,g12a-frddr",
+				     "amlogic,axg-frddr";
+			reg = <0x0 0x240 0x0 0x2c>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "FRDDR_C";
+			interrupts = <GIC_SPI 154 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_audio AUD_CLKID_FRDDR_C>;
+			resets = <&arb AXG_ARB_FRDDR_C>;
+			status = "disabled";
+		};
+
+		arb: reset-controller@280 {
+			status = "disabled";
+			compatible = "amlogic,meson-axg-audio-arb";
+			reg = <0x0 0x280 0x0 0x4>;
+			#reset-cells = <1>;
+			clocks = <&clkc_audio AUD_CLKID_DDR_ARB>;
+		};
+
+		tdmin_a: audio-controller@300 {
+			compatible = "amlogic,g12a-tdmin",
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
+			compatible = "amlogic,g12a-tdmin",
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
+			compatible = "amlogic,g12a-tdmin",
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
+			compatible = "amlogic,g12a-tdmin",
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
+		spdifin: audio-controller@400 {
+			compatible = "amlogic,g12a-spdifin",
+				     "amlogic,axg-spdifin";
+			reg = <0x0 0x400 0x0 0x30>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SPDIFIN";
+			interrupts = <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
+				 <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
+			clock-names = "pclk", "refclk";
+			status = "disabled";
+		};
+
+		spdifout: audio-controller@480 {
+			compatible = "amlogic,g12a-spdifout",
+				     "amlogic,axg-spdifout";
+			reg = <0x0 0x480 0x0 0x50>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SPDIFOUT";
+			clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
+				 <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
+			clock-names = "pclk", "mclk";
+			status = "disabled";
+		};
+
+		tdmout_a: audio-controller@500 {
+			compatible = "amlogic,g12a-tdmout";
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
+			compatible = "amlogic,g12a-tdmout";
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
+			compatible = "amlogic,g12a-tdmout";
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
+		spdifout_b: audio-controller@680 {
+			compatible = "amlogic,g12a-spdifout",
+				     "amlogic,axg-spdifout";
+			reg = <0x0 0x680 0x0 0x50>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "SPDIFOUT_B";
+			clocks = <&clkc_audio AUD_CLKID_SPDIFOUT_B>,
+				 <&clkc_audio AUD_CLKID_SPDIFOUT_B_CLK>;
+			clock-names = "pclk", "mclk";
+			status = "disabled";
+		};
+
+		tohdmitx: audio-controller@744 {
+			compatible = "amlogic,g12a-tohdmitx";
+			reg = <0x0 0x744 0x0 0x4>;
+			#sound-dai-cells = <1>;
+			sound-name-prefix = "TOHDMITX";
+			status = "disabled";
+		};
+	};
+};
 
 &ethmac {
 	power-domains = <&pwrc PWRC_G12A_ETH_ID>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
