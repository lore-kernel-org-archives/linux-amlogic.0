Return-Path: <SRS0=/MY2=SU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4CD0C282DD
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 12:28:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A09CA2083D
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 12:28:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UfCMBLTi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gQit15oC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A09CA2083D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6a5lTfqk1UczPg0Gr0+Xlr68stMhfOutP/O0US1QdFQ=; b=UfCMBLTiJZNMCF
	c8uzXIsFoP6jdFctexsLf2JNC3k8Eu3EbVOA5TeGlFv2MrmGH7eYng26vbUx/llBqwjncXyB4iWZI
	iAQjRrCk3p817zvk4CGM+KSIKpOUfCXBxncX8TLSKvijrPLO0pwSoOFfTDt0ABp0OCMG5Yxgvr+Ao
	qsAzfuzNQRnL0nPWpjganXuMC/4i3ObXTEd3NdAPFQUr97sj5OtrrGb/IrVQYDhh6NFv6zl4gx/y4
	HG7gelrlmX3nMlRaCpq2y31V8bQ2aMQTO51FuVxiaxHsXEWmnuqB38IzcrHelDZLF5y0ItUI6RgxI
	JtMYMncwvkMz3ccDH/Lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH69L-0001Td-B8; Thu, 18 Apr 2019 12:28:19 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH68X-0000Pi-B8
 for linux-amlogic@lists.infradead.org; Thu, 18 Apr 2019 12:27:34 +0000
Received: by mail-wm1-x342.google.com with SMTP id q16so2551915wmj.3
 for <linux-amlogic@lists.infradead.org>; Thu, 18 Apr 2019 05:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LXGEYk4K+okXhUn64svYw/ZBNWm7+B5TLkuBGuWEQmA=;
 b=gQit15oCYCC9aWPcHOhHKKq+TSn9uItSjSTA6OObWkDQ6MEBWHd/m1QPoG256ZkGoz
 Frt5mO6C0+knz97SDHm74ZizOfUjqLyji7x6a2zQHFbGMflOfyEMNzZdmMT66+xK9wxW
 CbdHcTwoY/YjAzRM0u4zjbJgSUdZn0Yfqf7ANivLUQSkH0es9QZLtusveCVpJaEEAwhu
 QGrG+S6nJL8pR5dn2JLiJZ0eK241KEMpkWz9VS+KsRk8bUhQQrGaqGFI7mENdMoD23ei
 M6vPmeO5txu4izoVyUEp9MxeUh2cY+dQs+7nT36UTqNSZ8NfZIWlPr3IchNpoYCEG5qN
 Uw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LXGEYk4K+okXhUn64svYw/ZBNWm7+B5TLkuBGuWEQmA=;
 b=RhrgBmDfG5Hs90E+3YOWKtBX9pQ3CfGU2jEK8JH5Gj3ZAks1ux1806xdUiPosDuzgf
 M163RNS0cHUBSDxjtBS0Wtn5av8BRL0lnnlNebsEUw5uD3jgp8rGen99ah8+6f4DQaWo
 Sq22RtKTD+xFJ84OwvBxCr0O/sOQp2gFomdQJqNCDwVp9DEw5ynX4LtfQSVPaOEM1cly
 9SR1fgsQth0csvjHobVFuOBYJ5PJycSxGFwe9RPRcfqe6jQvIxKGs8ZKa5rZp9+Z++jU
 ItTqc2JeUh6dcXGXRbDRaxyXsLez/NFopflm6+kid+2OSQosUHuDucx9RVDU7JbGHbXH
 oPJA==
X-Gm-Message-State: APjAAAWqu2t6hahCMEpunMo6SM9s/Xoc17C4/ItT/iUxIuUYqqONRtlf
 h58CHOLCRY5x09R05xEO7MLPzQ==
X-Google-Smtp-Source: APXvYqwtakNaqLOOMAKuhZh+uKmy0xZsJBRCTHmeLiRCf6P5QShKy9weKWWCDyem162jB3wg2OpF+A==
X-Received: by 2002:a1c:e185:: with SMTP id y127mr3135773wmg.76.1555590447577; 
 Thu, 18 Apr 2019 05:27:27 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z14sm1510110wro.81.2019.04.18.05.27.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 18 Apr 2019 05:27:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 3/6] arm64: dts: meson: fix mmc pin bias
Date: Thu, 18 Apr 2019 14:27:11 +0200
Message-Id: <20190418122714.30805-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190418122714.30805-1-jbrunet@baylibre.com>
References: <20190418122714.30805-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_052729_583834_37FD57B4 
X-CRM114-Status: GOOD (  10.91  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Clk pin does not require bias, data strobe should be pulled low.
The rest of the pin (data and cmd) are pulled up.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../arm64/boot/dts/amlogic/meson-axg-s400.dts |  4 +--
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    | 31 ++++++++++++----
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi   | 35 +++++++++++++------
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    | 35 +++++++++++++------
 4 files changed, 76 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 75fe1a2c49d0..4cd2d5951822 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -482,8 +482,8 @@
 
 /* emmc storage */
 &sd_emmc_c {
-	status = "disabled";
-	pinctrl-0 = <&emmc_pins>;
+	status = "okay";
+	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
 	pinctrl-1 = <&emmc_clk_gate_pins>;
 	pinctrl-names = "default", "clk-gate";
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 34704fecf756..38169c85e91f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -299,7 +299,7 @@
 				};
 
 				emmc_pins: emmc {
-					mux {
+					mux-0 {
 						groups = "emmc_nand_d0",
 							 "emmc_nand_d1",
 							 "emmc_nand_d2",
@@ -308,14 +308,26 @@
 							 "emmc_nand_d5",
 							 "emmc_nand_d6",
 							 "emmc_nand_d7",
-							 "emmc_clk",
-							 "emmc_cmd",
-							 "emmc_ds";
+							 "emmc_cmd";
+						function = "emmc";
+						bias-pull-up;
+					};
+
+					mux-1 {
+						groups = "emmc_clk";
 						function = "emmc";
 						bias-disable;
 					};
 				};
 
+				emmc_ds_pins: emmc_ds {
+					mux {
+						groups = "emmc_ds";
+						function = "emmc";
+						bias-pull-down;
+					};
+				};
+
 				emmc_clk_gate_pins: emmc_clk_gate {
 					mux {
 						groups = "BOOT_8";
@@ -559,13 +571,18 @@
 				};
 
 				sdio_pins: sdio {
-					mux {
+					mux-0 {
 						groups = "sdio_d0",
 							 "sdio_d1",
 							 "sdio_d2",
 							 "sdio_d3",
-							 "sdio_cmd",
-							 "sdio_clk";
+							 "sdio_cmd";
+						function = "sdio";
+						bias-pull-up;
+					};
+
+					mux-1 {
+						groups = "sdio_clk";
 						function = "sdio";
 						bias-disable;
 					};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index a60d3652beee..f734faaf7b78 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -381,10 +381,15 @@
 		};
 
 		emmc_pins: emmc {
-			mux {
+			mux-0 {
 				groups = "emmc_nand_d07",
-				       "emmc_cmd",
-				       "emmc_clk";
+				       "emmc_cmd";
+				function = "emmc";
+				bias-pull-up;
+			};
+
+			mux-1 {
+				groups = "emmc_clk";
 				function = "emmc";
 				bias-disable;
 			};
@@ -394,7 +399,7 @@
 			mux {
 				groups = "emmc_ds";
 				function = "emmc";
-				bias-disable;
+				bias-pull-down;
 			};
 		};
 
@@ -436,13 +441,18 @@
 		};
 
 		sdcard_pins: sdcard {
-			mux {
+			mux-0 {
 				groups = "sdcard_d0",
 				       "sdcard_d1",
 				       "sdcard_d2",
 				       "sdcard_d3",
-				       "sdcard_cmd",
-				       "sdcard_clk";
+				       "sdcard_cmd";
+				function = "sdcard";
+				bias-pull-up;
+			};
+
+			mux-1 {
+				groups = "sdcard_clk";
 				function = "sdcard";
 				bias-disable;
 			};
@@ -457,13 +467,18 @@
 		};
 
 		sdio_pins: sdio {
-			mux {
+			mux-0 {
 				groups = "sdio_d0",
 				       "sdio_d1",
 				       "sdio_d2",
 				       "sdio_d3",
-				       "sdio_cmd",
-				       "sdio_clk";
+				       "sdio_cmd";
+				function = "sdio";
+				bias-pull-up;
+			};
+
+			mux-1 {
+				groups = "sdio_clk";
 				function = "sdio";
 				bias-disable;
 			};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 3093ae421b17..c959456bacc6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -326,10 +326,15 @@
 		};
 
 		emmc_pins: emmc {
-			mux {
+			mux-0 {
 				groups = "emmc_nand_d07",
-				       "emmc_cmd",
-				       "emmc_clk";
+				       "emmc_cmd";
+				function = "emmc";
+				bias-pull-up;
+			};
+
+			mux-1 {
+				groups = "emmc_clk";
 				function = "emmc";
 				bias-disable;
 			};
@@ -339,7 +344,7 @@
 			mux {
 				groups = "emmc_ds";
 				function = "emmc";
-				bias-disable;
+				bias-pull-down;
 			};
 		};
 
@@ -381,13 +386,18 @@
 		};
 
 		sdcard_pins: sdcard {
-			mux {
+			mux-0 {
 				groups = "sdcard_d0",
 				       "sdcard_d1",
 				       "sdcard_d2",
 				       "sdcard_d3",
-				       "sdcard_cmd",
-				       "sdcard_clk";
+				       "sdcard_cmd";
+				function = "sdcard";
+				bias-pull-up;
+			};
+
+			mux-1 {
+				groups = "sdcard_clk";
 				function = "sdcard";
 				bias-disable;
 			};
@@ -402,13 +412,18 @@
 		};
 
 		sdio_pins: sdio {
-			mux {
+			mux-0 {
 				groups = "sdio_d0",
 				       "sdio_d1",
 				       "sdio_d2",
 				       "sdio_d3",
-				       "sdio_cmd",
-				       "sdio_clk";
+				       "sdio_cmd";
+				function = "sdio";
+				bias-pull-up;
+			};
+
+			mux-1 {
+				groups = "sdio_clk";
 				function = "sdio";
 				bias-disable;
 			};
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
