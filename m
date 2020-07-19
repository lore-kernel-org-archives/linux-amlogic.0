Return-Path: <SRS0=UX1O=A6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD6CC433E5
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Jul 2020 17:37:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10FC721744
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Jul 2020 17:37:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gvqvxgPQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="IK+RzV5I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10FC721744
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rJl8IDq3g/BwrgO3tTshlQoWT/veY6r7BvTE9pr+3XQ=; b=gvqvxgPQE3PKzPGfCAptSMtdG
	RrbBkU/Q4wg6XwCv1OuereerK0gyMmh/Wl2YurjVAysyeUp1hLGwycscCnu2dfQxmASl5viKXo/aw
	2iJnvMAf/czR8BRKFFl4RXq8+p7UkhP6AchpZD6fviaR9AWc5F5lCqzwOd0LnyXboeETh75tf0a5q
	wT6jkew/t2qqER7TNHEAe+q9CEvWOzLRoKVUiqjkhPiQiM0VsL923NGKdDC6bGyY4gToCLTUXQnmd
	DY+hcE33YI7JrC0710YMjzJfKoakZoVVkI1VQ9Ual2D2MgT3uygkEbu9YnFWMCwB3zS+5bHTeljo4
	65pPumM8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxDFu-0007rr-4o; Sun, 19 Jul 2020 17:37:42 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxDFn-0007p2-NG; Sun, 19 Jul 2020 17:37:37 +0000
Received: by mail-ed1-x544.google.com with SMTP id bm28so11235433edb.2;
 Sun, 19 Jul 2020 10:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lAW1Qae0CyLvhh+q3wM7wC790jTbPHe/4pG7T+psggs=;
 b=IK+RzV5IyWwzLPW70hr2B/uxcbio5Q8qpRlPSG2uEVB3TFAKPYAiqBJIBtJxBOi7vB
 rcq3mzY0Lcwev1egOSFku0YH0kfwEyLnyYKynHyWhubuyAVc5VDcAwDVKyiOtvkXrR8Z
 vlJw16RTh4bkX+3Hb7CXvJxfhnYg/jFRi0CYffSiOZ592wMX0iOufAAmf7ngI2hchGAq
 SjJ58ILYtNutOrCN7BKsBLR3D3R26Qd2P31xkL/4umVVXYmEjOeKbZ4x8CqlRfZw2Ak+
 vc45McOoVDsweLg2fBQ2bu77LMdUMpv4oCpQpPZgQDwq8p8xiQPFLhNKOnkxgooz2Cz/
 r1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lAW1Qae0CyLvhh+q3wM7wC790jTbPHe/4pG7T+psggs=;
 b=fhjLnGpm+IalHKyVR0EPnxN0BG297ZarL4jQpXAk+6mtkkzmdPYubpANJsBYFnCcZG
 Vt4e5whp322CcKN5r2hRDgtC6uj6TaEEOlWgcODWNANUH9jz+P/VxTwevMjFexJfi5tr
 BH0YqhpOGEUdPqaeQntBBApfh8xZqlQYbMPLrIEhNpddIu0nueQRPSyGP+XxtvN0vwsm
 VVUl3hzsSC/MGaQgWESMvlLWmZG7mUp/saYd1kMkpFSqyXMfLThHdzqyURsStjPkzQst
 pgEi38M8ESNvA7IvHdeZuRniaDCiD31Lkk7w/yghlUr0pvKOG5U4nUCZrVzbwjlR357J
 Cf/g==
X-Gm-Message-State: AOAM530aRgFu/sZILofeXX2frNEhRsKSv+p7kgnCAHG1eBgm0Qif0M5H
 ZBQ/aS4zcgIexoIpBDxInYkYxencz4g=
X-Google-Smtp-Source: ABdhPJx750pvQkIx1JP2Ci7UxQV2hMzH1BGePwFkuJbUB6X7surMcCN7jaSV4BvZV7khm/U0kMXs7Q==
X-Received: by 2002:aa7:db4b:: with SMTP id n11mr18704183edt.137.1595180253277; 
 Sun, 19 Jul 2020 10:37:33 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f13716be00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3716:be00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id
 bc23sm13563208edb.90.2020.07.19.10.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 10:37:32 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH v2 1/3] arm64: dts: amlogic: meson-gx: add the Mali-450 OPP
 table and use DVFS
Date: Sun, 19 Jul 2020 19:32:11 +0200
Message-Id: <20200719173213.639540-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200719173213.639540-1-martin.blumenstingl@googlemail.com>
References: <20200719173213.639540-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200719_133735_794367_484F9F37 
X-CRM114-Status: GOOD (  19.21  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the OPP table for the Mali-450 GPU and drop the hardcoded initial
clock configuration. This enables GPU DVFS and thus saves power when the
GPU is not in use while still being able switch to a higher clock on
demand.

Set the GP0_PLL clock to 744MHz (which is the only frequency which
cannot be derived from the FCLK dividers) as the clock driver avoids
setting the parent clock rates so the MPLL clocks aren't changed (as
these are reserved for audio). The only exception to this is the GXL
S805X package because the 744MHz OPP isn't working correctly there.

While here, make most of meson-gxl-mali re-usable to reduce the amount
of duplicate code between GXBB and GXL. This is more important now as we
don't want to duplicate the GPU OPP table.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../boot/dts/amlogic/meson-gx-mali450.dtsi    | 61 +++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi   | 51 ++++------------
 .../boot/dts/amlogic/meson-gxl-mali.dtsi      | 46 +++-----------
 .../boot/dts/amlogic/meson-gxl-s805x.dtsi     | 17 +++---
 4 files changed, 89 insertions(+), 86 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gx-mali450.dtsi

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-mali450.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-mali450.dtsi
new file mode 100644
index 000000000000..f9771b51c852
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-mali450.dtsi
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2017 BayLibre SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+/ {
+	gpu_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-125000000 {
+			opp-hz = /bits/ 64 <125000000>;
+			opp-microvolt = <950000>;
+		};
+		opp-250000000 {
+			opp-hz = /bits/ 64 <250000000>;
+			opp-microvolt = <950000>;
+		};
+		opp-285714285 {
+			opp-hz = /bits/ 64 <285714285>;
+			opp-microvolt = <950000>;
+		};
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <950000>;
+		};
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <950000>;
+		};
+		opp-666666666 {
+			opp-hz = /bits/ 64 <666666666>;
+			opp-microvolt = <950000>;
+		};
+		opp-744000000 {
+			opp-hz = /bits/ 64 <744000000>;
+			opp-microvolt = <950000>;
+		};
+	};
+};
+
+&apb {
+	mali: gpu@c0000 {
+		compatible = "arm,mali-450";
+		reg = <0x0 0xc0000 0x0 0x40000>;
+		interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "gp", "gpmmu", "pp", "pmu",
+			"pp0", "ppmmu0", "pp1", "ppmmu1",
+			"pp2", "ppmmu2";
+		operating-points-v2 = <&gpu_opp_table>;
+	};
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index ea50dd434887..7c029f552a23 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include "meson-gx.dtsi"
+#include "meson-gx-mali450.dtsi"
 #include <dt-bindings/gpio/meson-gxbb-gpio.h>
 #include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
 #include <dt-bindings/clock/gxbb-clkc.h>
@@ -264,46 +265,6 @@ mux {
 	};
 };
 
-&apb {
-	mali: gpu@c0000 {
-		compatible = "amlogic,meson-gxbb-mali", "arm,mali-450";
-		reg = <0x0 0xc0000 0x0 0x40000>;
-		interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "gp", "gpmmu", "pp", "pmu",
-			"pp0", "ppmmu0", "pp1", "ppmmu1",
-			"pp2", "ppmmu2";
-		clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_MALI>;
-		clock-names = "bus", "core";
-
-		/*
-		 * Mali clocking is provided by two identical clock paths
-		 * MALI_0 and MALI_1 muxed to a single clock by a glitch
-		 * free mux to safely change frequency while running.
-		 */
-		assigned-clocks = <&clkc CLKID_GP0_PLL>,
-				  <&clkc CLKID_MALI_0_SEL>,
-				  <&clkc CLKID_MALI_0>,
-				  <&clkc CLKID_MALI>; /* Glitch free mux */
-		assigned-clock-parents = <0>, /* Do Nothing */
-					 <&clkc CLKID_GP0_PLL>,
-					 <0>, /* Do Nothing */
-					 <&clkc CLKID_MALI_0>;
-		assigned-clock-rates = <744000000>,
-				       <0>, /* Do Nothing */
-				       <744000000>,
-				       <0>; /* Do Nothing */
-	};
-};
-
 &cbus {
 	spifc: spi@8c80 {
 		compatible = "amlogic,meson-gxbb-spifc";
@@ -386,6 +347,16 @@ &i2c_C {
 	clocks = <&clkc CLKID_I2C>;
 };
 
+&mali {
+	compatible = "amlogic,meson-gxbb-mali", "arm,mali-450";
+
+	clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_MALI>;
+	clock-names = "bus", "core";
+
+	assigned-clocks = <&clkc CLKID_GP0_PLL>;
+	assigned-clock-rates = <744000000>;
+};
+
 &periphs {
 	pinctrl_periphs: pinctrl@4b0 {
 		compatible = "amlogic,meson-gxbb-periphs-pinctrl";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-mali.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-mali.dtsi
index 6aaafff674f9..478e755cc87c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-mali.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-mali.dtsi
@@ -4,42 +4,14 @@
  * Author: Neil Armstrong <narmstrong@baylibre.com>
  */
 
-&apb {
-	mali: gpu@c0000 {
-		compatible = "amlogic,meson-gxl-mali", "arm,mali-450";
-		reg = <0x0 0xc0000 0x0 0x40000>;
-		interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "gp", "gpmmu", "pp", "pmu",
-			"pp0", "ppmmu0", "pp1", "ppmmu1",
-			"pp2", "ppmmu2";
-		clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_MALI>;
-		clock-names = "bus", "core";
+#include "meson-gx-mali450.dtsi"
 
-		/*
-		 * Mali clocking is provided by two identical clock paths
-		 * MALI_0 and MALI_1 muxed to a single clock by a glitch
-		 * free mux to safely change frequency while running.
-		 */
-		assigned-clocks = <&clkc CLKID_GP0_PLL>,
-				  <&clkc CLKID_MALI_0_SEL>,
-				  <&clkc CLKID_MALI_0>,
-				  <&clkc CLKID_MALI>; /* Glitch free mux */
-		assigned-clock-parents = <0>, /* Do Nothing */
-					 <&clkc CLKID_GP0_PLL>,
-					 <0>, /* Do Nothing */
-					 <&clkc CLKID_MALI_0>;
-		assigned-clock-rates = <744000000>,
-				       <0>, /* Do Nothing */
-				       <744000000>,
-				       <0>; /* Do Nothing */
-	};
+&mali {
+	compatible = "amlogic,meson-gxl-mali", "arm,mali-450";
+
+	clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_MALI>;
+	clock-names = "bus", "core";
+
+	assigned-clocks = <&clkc CLKID_GP0_PLL>;
+	assigned-clock-rates = <744000000>;
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x.dtsi
index f9d705648426..29975849822c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x.dtsi
@@ -11,14 +11,13 @@ / {
 };
 
 /* The S805X Package doesn't seem to handle the 744MHz OPP correctly */
+&gpu_opp_table {
+	opp-744000000 {
+		status = "disabled";
+	};
+};
+
 &mali {
-	assigned-clocks = <&clkc CLKID_MALI_0_SEL>,
-			  <&clkc CLKID_MALI_0>,
-			  <&clkc CLKID_MALI>; /* Glitch free mux */
-	assigned-clock-parents = <&clkc CLKID_FCLK_DIV3>,
-				 <0>, /* Do Nothing */
-				 <&clkc CLKID_MALI_0>;
-	assigned-clock-rates = <0>, /* Do Nothing */
-			       <666666666>,
-			       <0>; /* Do Nothing */
+	/delete-property/ assigned-clocks;
+	/delete-property/ assigned-clock-rates;
 };
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
