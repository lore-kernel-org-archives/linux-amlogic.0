Return-Path: <SRS0=cow0=5P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95467C43331
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2020 22:12:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63193206CC
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2020 22:12:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ChDwrwV/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="O2VkcrLo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63193206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=90JEGjqcoqTVa8R4fjBRkRffmKQooJhYb7NCwClnEJs=; b=ChDwrwV/9FO+nw
	uVCqt+iKW/OoMnhDseraSL9AjCDSkHvx1Oai6AGbnOtp6r7I3DwKjE4mpF71bl4pyh9A9wACJzYOr
	cqCHx28DrpikfaGVd8SeqJ7CwSXh23+ONknjGqL9MGH6Y4TpbBH6IoMhPuOpqOottW7Duy+OO1BYD
	OqQpoIuwaGh1Ie4sN2RAUeR6ERRLohyFmvPybvAe25g6v6iXLK8biiuY3C1tgauq7GZrxz62R1XiO
	ZKR4NnlR5AHxJxS/3gOQXos/4d6JoBnWM8qmgPf7wwdv3IWS4wyJg0FJtj1IuVYtdOphPX7Zx6Hs7
	wuNz3NO/dosz0LVJSJzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJ2dw-0002jA-Mg; Mon, 30 Mar 2020 22:12:28 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJ2d3-0001kd-IG; Mon, 30 Mar 2020 22:11:35 +0000
Received: by mail-wm1-x341.google.com with SMTP id t128so500816wma.0;
 Mon, 30 Mar 2020 15:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rH18uADPcvY9iN4ZlqKSVAo4EwI8zrMKYS+ddwe06gM=;
 b=O2VkcrLoK9at2xeoNDR0dKr6GCXJ6GvgAIt8d5J00iWaeidqCAgYA/Ecvmzx7KpyPk
 iY1iMNaGQDy8uz5sxfZ/Kpuz9DSKPPj9ViKBS4lc0d1Oz5X1qMtEeIV/MNqjgG2CoaXv
 umHsW1zY/2z+M2ELF1oj5boUhcs1Koxg9hjF+ASA/LHYFXUlgH7LFXRqX/YHma5fdRMi
 Ls6kcDu9tq92JUWxW2Xdd78Q/DDCyRG+Oj+jmR9j7X8R8eIRQhbAiz6IZn2ECqJq2zFV
 54l5hYPtp8ork5A5rJEeXBKUdtVG+FuDrOJl+mibehlFUSKKiT9qngF9ejLc3puUy0yp
 Tz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rH18uADPcvY9iN4ZlqKSVAo4EwI8zrMKYS+ddwe06gM=;
 b=dALfcbXQJQWN/fcHXA1HrF/WJopxE99cBHNXjljYOXIUyGVTbyUccS3OIjq3U7bK4y
 HJWYmEjp7vlegzYzRY181Vhkl6gzY2TGufRY3xxmk5mAM8Y3kJWrI6Y1JhzuA2Wlwa5G
 V82mtzWi58pr/Kq+0wBtTaXTyTvf1KrZIVXZkJllN3U9jcnooeOD0KcSIjIVMzUwj+XR
 9Uli5foGFdqGO+3+xmwb8SpoprQYdAM1DQWRd8pzGJoC53sMJvTIAstim3qW9STFJZEq
 eXkFY3li/hq+pMAlk4iWYPTXwAhHYJENrUQWD9SQAlsNQ7gdhaJ4PPYqLto6HhpRALk8
 4Opw==
X-Gm-Message-State: ANhLgQ2bQLb0hX0V4+X71qQSUzZNdViNAmktCkp9qsIz2LIeet6CW8he
 pTnBA+NXtHziIF5rPn9CDSJQ/1ax
X-Google-Smtp-Source: ADFU+vv/JR5vRCpxN4sqzSkYjKWLWQFcPK5nZzBQVW0eC/j4OvXq+vgaLQoqul21ksctM5TC0GQyXg==
X-Received: by 2002:a1c:e904:: with SMTP id q4mr234551wmc.84.1585606291646;
 Mon, 30 Mar 2020 15:11:31 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13710ED00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3710:ed00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id b187sm1260509wmc.14.2020.03.30.15.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 15:11:31 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com,
 jbrunet@baylibre.com, narmstrong@baylibre.com
Subject: [RFC v1 3/5] arm64: dts: amlogic: meson-gx: add the Mali-450 OPP
 table and use DVFS
Date: Tue, 31 Mar 2020 00:11:02 +0200
Message-Id: <20200330221104.3163788-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200330221104.3163788-1-martin.blumenstingl@googlemail.com>
References: <20200330221104.3163788-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_151133_720293_08A8974E 
X-CRM114-Status: GOOD (  14.65  )
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
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the OPP table for the Mali-450 GPU and drop the hardcoded initial
clock configuration. This enables GPU DVFS and thus saves power when the
GPU is not in use while still being able switch to a higher clock on
demand.

While here, make most of meson-gxl-mali re-usable to reduce the amount
of duplicate code between GXBB and GXL. This is more important now as we
don't want to duplicate the GPU OPP table.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../boot/dts/amlogic/meson-gx-mali450.dtsi    | 61 +++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi   | 51 ++++------------
 .../boot/dts/amlogic/meson-gxl-mali.dtsi      | 46 +++-----------
 3 files changed, 81 insertions(+), 77 deletions(-)
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
index 0cb40326b0d3..e43b330129c7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include "meson-gx.dtsi"
+#include "meson-gx-mali450.dtsi"
 #include <dt-bindings/gpio/meson-gxbb-gpio.h>
 #include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
 #include <dt-bindings/clock/gxbb-clkc.h>
@@ -241,46 +242,6 @@ mux {
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
@@ -362,6 +323,16 @@ &i2c_C {
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
-- 
2.26.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
