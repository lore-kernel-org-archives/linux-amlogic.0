Return-Path: <SRS0=EyLh=XQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FD5C4360D
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Sep 2019 15:14:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 538162086A
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Sep 2019 15:14:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jX2xcG7i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="jljvR6u4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 538162086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vbnl7G3t/eEQz9ubnyv6rdZYJd7lUMHQAifUDzOqIyE=; b=jX2xcG7iw0Tyva
	PE1qLLG9yQboOymiphAF104umyQKx5zkjc7lieswObNGoVecAqx5Bh9TjyXNxzUAX8jLtxA2axltl
	EPkRQDstTcnsUCPsHwFLRSoO1Rxin8ymcrqRD7PWu1kW09QaZLQ6NbhJBkXgKQ8BOAjPBid+hgV1s
	slPpSOgg5t6a8ZpMOEbMK+ByeGn+qZ+ioepTW2dK6ZGJPaDkeuIjf6GMLvZ2+d9A9uDgoAtYz90gf
	M3A+ruGQCu480KoQtii80ARwzfF1A2eMw3NdrJ1NnqNceEuYa1Xj4ylnRNmsr+3DzJxSdcumV0Jrf
	OBOmnqJNkIaI6jrqXtMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBh5p-00008Y-3I; Sat, 21 Sep 2019 15:14:37 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBh47-0007BA-Me; Sat, 21 Sep 2019 15:12:53 +0000
Received: by mail-wm1-x343.google.com with SMTP id p7so5377599wmp.4;
 Sat, 21 Sep 2019 08:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FLfO/KxjQrMiblT1/Pl6tSGizwnToQmABBG15vNjp4k=;
 b=jljvR6u41lhZC97d2nOVlCbfA7sN8ysHuicakSGltcm1A/jN6XBxvO6B5GkgHODJKA
 yXAX31bnNYB8VtlG4K9eb4Mws3TF0IGpNDp25bcs2O9rd+7JPXqkL1C++vpQRzjqb+zK
 Bme5zHxKn8yzbyf2jRdUgr07bYQVFhxLYiEAH+HgRLI5hRVPIl84qiIRWHkUH5tTIc5M
 g/AtumzOFJKBBx+2eushGZGzuGGoi9tPcP6qZEnv7XKR5kECRTMFZANwWvIzQJbSNSE3
 NyAA2ga1zp72/vEvNpL0lfDQ8jxIzTN5HsCkdIIxyM9D/r5BQtUKiun82/Fd6x7tUBcf
 FwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FLfO/KxjQrMiblT1/Pl6tSGizwnToQmABBG15vNjp4k=;
 b=p/3SiJAdbuNe9+bxaJnajm6nh1U4/Y9VbnILbJVHKkqX54TGuSKniubaifegRfWMd8
 JRrD20gDeoMr18hX7Xdmc+vwy/ehI+VQ1L9cdGpTcPPujl+MUtSY40s5iWRE92zxTzi7
 0CfFfYYyGeOo2gvYfTkyObXCX1Whof+2+eiCNV502fEXEvMtDTi4WtGIuRYNwfUPC4DA
 chSUfJWB2R0fxUmmYxdM5GZ/4ywETWDPqkcB3G39Scjgxf54QVHQBWOrs6dJ2Ki0Hxn3
 ZWGRiuSSQGM64JH/gD99SuTE1hZAeZcb0PhxRWiVfbrvxbzMZkdLjfYaq32nxNV+K6e7
 +abQ==
X-Gm-Message-State: APjAAAXgdYfAsRcffvFhmFDp0H8qLM7i00EztDkBeaiWg5oUn5knLRXK
 MUhQjk5mLh5FSgQpEiA5Lrk=
X-Google-Smtp-Source: APXvYqwGCh09uYfuqvcZSmO+ibjdhqjWpzqPVLsWsMzl+s68SPOO6wbK8vMNCkEcHCNrmx4ZVEv9bA==
X-Received: by 2002:a1c:4946:: with SMTP id w67mr7291151wma.131.1569078770337; 
 Sat, 21 Sep 2019 08:12:50 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133CE0B0028BAA8C744A6F562.dip0.t-ipconnect.de.
 [2003:f1:33ce:b00:28ba:a8c7:44a6:f562])
 by smtp.googlemail.com with ESMTPSA id
 y186sm10712491wmb.41.2019.09.21.08.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2019 08:12:49 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com, robh+dt@kernel.org,
 mark.rutland@arm.com, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com
Subject: [PATCH 5/5] ARM: dts: meson: provide the XTAL clock using a
 fixed-clock
Date: Sat, 21 Sep 2019 17:12:23 +0200
Message-Id: <20190921151223.768842-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190921151223.768842-1-martin.blumenstingl@googlemail.com>
References: <20190921151223.768842-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190921_081251_980459_16E588ED 
X-CRM114-Status: GOOD (  13.12  )
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
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The clock controller driver has provided the XTAL clock so far. This
does not match how the hardware actually works because the XTAL clock is
an actual crystal which is mounted on the PCB.

Add the "xtal" clock to meson.dtsi and replace all references to the
clock controller's CLKID_XTAL with the new xtal clock node.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson.dtsi           |  7 +++++++
 arch/arm/boot/dts/meson6.dtsi          |  7 -------
 arch/arm/boot/dts/meson8.dtsi          | 15 ++++++++-------
 arch/arm/boot/dts/meson8b-ec100.dts    |  2 +-
 arch/arm/boot/dts/meson8b-mxq.dts      |  2 +-
 arch/arm/boot/dts/meson8b-odroidc1.dts |  2 +-
 arch/arm/boot/dts/meson8b.dtsi         | 15 ++++++++-------
 7 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index c4447f6c8b2c..5d198309058a 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -282,4 +282,11 @@
 			};
 		};
 	};
+
+	xtal: xtal-clk {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "xtal";
+		#clock-cells = <0>;
+	};
 }; /* end of / */
diff --git a/arch/arm/boot/dts/meson6.dtsi b/arch/arm/boot/dts/meson6.dtsi
index 2d31b7ce3f8c..4716030a48d0 100644
--- a/arch/arm/boot/dts/meson6.dtsi
+++ b/arch/arm/boot/dts/meson6.dtsi
@@ -36,13 +36,6 @@
 		ranges = <0x0 0xd0000000 0x40000>;
 	};
 
-	xtal: xtal-clk {
-		compatible = "fixed-clock";
-		clock-frequency = <24000000>;
-		clock-output-names = "xtal";
-		#clock-cells = <0>;
-	};
-
 	clk81: clk@0 {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 5a7e3e5caebe..4f59a4c8f036 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -455,6 +455,8 @@
 &hhi {
 	clkc: clock-controller {
 		compatible = "amlogic,meson8-clkc";
+		clocks = <&xtal>;
+		clock-names = "xtal";
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 	};
@@ -529,8 +531,7 @@
 
 &saradc {
 	compatible = "amlogic,meson8-saradc", "amlogic,meson-saradc";
-	clocks = <&clkc CLKID_XTAL>,
-		<&clkc CLKID_SAR_ADC>;
+	clocks = <&xtal>, <&clkc CLKID_SAR_ADC>;
 	clock-names = "clkin", "core";
 	amlogic,hhi-sysctrl = <&hhi>;
 	nvmem-cells = <&temperature_calib>;
@@ -548,31 +549,31 @@
 };
 
 &timer_abcde {
-	clocks = <&clkc CLKID_XTAL>, <&clkc CLKID_CLK81>;
+	clocks = <&xtal>, <&clkc CLKID_CLK81>;
 	clock-names = "xtal", "pclk";
 };
 
 &uart_AO {
 	compatible = "amlogic,meson8-uart", "amlogic,meson-uart";
-	clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_XTAL>, <&clkc CLKID_CLK81>;
+	clocks = <&clkc CLKID_CLK81>, <&xtal>, <&clkc CLKID_CLK81>;
 	clock-names = "baud", "xtal", "pclk";
 };
 
 &uart_A {
 	compatible = "amlogic,meson8-uart", "amlogic,meson-uart";
-	clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_XTAL>, <&clkc CLKID_UART0>;
+	clocks = <&clkc CLKID_CLK81>, <&xtal>, <&clkc CLKID_UART0>;
 	clock-names = "baud", "xtal", "pclk";
 };
 
 &uart_B {
 	compatible = "amlogic,meson8-uart", "amlogic,meson-uart";
-	clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_XTAL>, <&clkc CLKID_UART1>;
+	clocks = <&clkc CLKID_CLK81>, <&xtal>, <&clkc CLKID_UART1>;
 	clock-names = "baud", "xtal", "pclk";
 };
 
 &uart_C {
 	compatible = "amlogic,meson8-uart", "amlogic,meson-uart";
-	clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_XTAL>, <&clkc CLKID_UART2>;
+	clocks = <&clkc CLKID_CLK81>, <&xtal>, <&clkc CLKID_UART2>;
 	clock-names = "baud", "xtal", "pclk";
 };
 
diff --git a/arch/arm/boot/dts/meson8b-ec100.dts b/arch/arm/boot/dts/meson8b-ec100.dts
index bed1dfef1985..163a200d5a7b 100644
--- a/arch/arm/boot/dts/meson8b-ec100.dts
+++ b/arch/arm/boot/dts/meson8b-ec100.dts
@@ -377,7 +377,7 @@
 	status = "okay";
 	pinctrl-0 = <&pwm_c1_pins>, <&pwm_d_pins>;
 	pinctrl-names = "default";
-	clocks = <&clkc CLKID_XTAL>, <&clkc CLKID_XTAL>;
+	clocks = <&xtal>, <&xtal>;
 	clock-names = "clkin0", "clkin1";
 };
 
diff --git a/arch/arm/boot/dts/meson8b-mxq.dts b/arch/arm/boot/dts/meson8b-mxq.dts
index 6e39ad52e42d..33037ef62d0a 100644
--- a/arch/arm/boot/dts/meson8b-mxq.dts
+++ b/arch/arm/boot/dts/meson8b-mxq.dts
@@ -165,7 +165,7 @@
 	status = "okay";
 	pinctrl-0 = <&pwm_c1_pins>, <&pwm_d_pins>;
 	pinctrl-names = "default";
-	clocks = <&clkc CLKID_XTAL>, <&clkc CLKID_XTAL>;
+	clocks = <&xtal>, <&xtal>;
 	clock-names = "clkin0", "clkin1";
 };
 
diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index a24eccc354b9..a2a47804fc4a 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -340,7 +340,7 @@
 	status = "okay";
 	pinctrl-0 = <&pwm_c1_pins>, <&pwm_d_pins>;
 	pinctrl-names = "default";
-	clocks = <&clkc CLKID_XTAL>, <&clkc CLKID_XTAL>;
+	clocks = <&xtal>, <&xtal>;
 	clock-names = "clkin0", "clkin1";
 };
 
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 099bf8e711c9..1934666ff60f 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -434,6 +434,8 @@
 &hhi {
 	clkc: clock-controller {
 		compatible = "amlogic,meson8-clkc";
+		clocks = <&xtal>;
+		clock-names = "xtal";
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 	};
@@ -508,8 +510,7 @@
 
 &saradc {
 	compatible = "amlogic,meson8b-saradc", "amlogic,meson-saradc";
-	clocks = <&clkc CLKID_XTAL>,
-		<&clkc CLKID_SAR_ADC>;
+	clocks = <&xtal>, <&clkc CLKID_SAR_ADC>;
 	clock-names = "clkin", "core";
 	amlogic,hhi-sysctrl = <&hhi>;
 	nvmem-cells = <&temperature_calib>;
@@ -523,31 +524,31 @@
 };
 
 &timer_abcde {
-	clocks = <&clkc CLKID_XTAL>, <&clkc CLKID_CLK81>;
+	clocks = <&xtal>, <&clkc CLKID_CLK81>;
 	clock-names = "xtal", "pclk";
 };
 
 &uart_AO {
 	compatible = "amlogic,meson8b-uart", "amlogic,meson-uart";
-	clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_XTAL>, <&clkc CLKID_CLK81>;
+	clocks = <&clkc CLKID_CLK81>, <&xtal>, <&clkc CLKID_CLK81>;
 	clock-names = "baud", "xtal", "pclk";
 };
 
 &uart_A {
 	compatible = "amlogic,meson8b-uart", "amlogic,meson-uart";
-	clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_XTAL>, <&clkc CLKID_UART0>;
+	clocks = <&clkc CLKID_CLK81>, <&xtal>, <&clkc CLKID_UART0>;
 	clock-names = "baud", "xtal", "pclk";
 };
 
 &uart_B {
 	compatible = "amlogic,meson8b-uart", "amlogic,meson-uart";
-	clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_XTAL>, <&clkc CLKID_UART1>;
+	clocks = <&clkc CLKID_CLK81>, <&xtal>, <&clkc CLKID_UART1>;
 	clock-names = "baud", "xtal", "pclk";
 };
 
 &uart_C {
 	compatible = "amlogic,meson8b-uart", "amlogic,meson-uart";
-	clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_XTAL>, <&clkc CLKID_UART2>;
+	clocks = <&clkc CLKID_CLK81>, <&xtal>, <&clkc CLKID_UART2>;
 	clock-names = "baud", "xtal", "pclk";
 };
 
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
