Return-Path: <SRS0=BjI6=TK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0729C04A6B
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 15:53:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 721F420881
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 15:53:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sfanWxvH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="AgQ7ISjc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 721F420881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GAYq0sd6XvjwflYkXH5ixZeOaauXqvmsmRJnJ67gCKU=; b=sfanWxvHGDTiJF
	cTATUdtt1jSEjMTyNHQZOsQdX353BSujG07bJlYEJ++/vm5CjAGO522BMBTYh2bhTvn1NckC1jnji
	ud7TKnQrdVqP4nX777UzEKLVIYlE/Ob73Q+kuFhfLNBr2P47qgWdae1uD7uewHJHrkspFGOy7thuU
	d06tAwWwYaCxubqlSkyhONbVu7O7uVm1/dEq1AXqu+ZdqEXMJXvZMwm03okU/IKj8W0pPzRJXMLh2
	FxFJsLWVebSZNcsoyhhRW8qm+F3DBIh5q1dNwWSfAA2CzmgCMMe1/NtcPqEIYnwBb+OMm/YrrTP3Z
	+guKIkOp8KcTnX8zoBAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hP7q6-0008WS-Dg; Fri, 10 May 2019 15:53:38 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP7q3-0008U4-5x
 for linux-amlogic@lists.infradead.org; Fri, 10 May 2019 15:53:36 +0000
Received: by mail-wr1-x442.google.com with SMTP id v11so8493445wru.5
 for <linux-amlogic@lists.infradead.org>; Fri, 10 May 2019 08:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o/ZrOKrVBiCPmSKNzKkVtl6ee0CJpkJsgmldCOTIdwo=;
 b=AgQ7ISjcLMgxyeSNtilo9vaG226u/TyFK085WpRbybJu93anjOumklGMP++48zV6wz
 4FI/78ShZkC5z26GPsWzhch6CjlZKcZfQ8CAVRGjK624SyJlhPWjmSMRcb6iJ4WLxOKu
 sgwrR2WWtmnm42nw6iDsAbSB3PFyMYUIXfqnZsaikAf3DaQTRLbBhcYc7WeT+gtscOrD
 rnd/+rDltSJyCM9Hh9KP268I/GVppUxmHa8DBcbnsYVnLyqH10XtAbQyQW55qsSUtuce
 EbIFE+YDbuqUzGL5volDIAl91chm5apGQon07CKClUk97CMKR4RQodmM/29hhhTcPzkK
 +Szg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o/ZrOKrVBiCPmSKNzKkVtl6ee0CJpkJsgmldCOTIdwo=;
 b=L5O3p05ZIxdmn3mCKkJj5RQySWm0pAIogD1ReR2MuuTeTG5+GD+H5EfdBsbQ7nVFS6
 POs6+HxfpepH2fCrvdk5cG4XFqaqtVn7LD1Bfyhb2rfZqzifkeC/KG6uuWi5niD/GbXb
 RnxLFGrfkCy/u0Naeo6SExEAECtTxebcBqmSUyGslNWT+5eq+lJ5O0g0UfCgJjOCDRt1
 mL2R7iaOAOjfUSPr6ZKVhS2Cw+XBBFDRYOAK+/V/5sVxcNJ4VWw8zQjwo0vrnEvzxLBw
 o4UDCglToje0I0S5rwv248XJ4C9whFtFlIoy8JsUTCdjO8bkg10eDMy8+EmDuQEH4C45
 AYtg==
X-Gm-Message-State: APjAAAWh9ZLs6/+zFJ50gOHlVbZ/lO4axdjftaa6HivtyzrCdwWqAty0
 4WPIhOdapa3fHMbG0eu2eYX0xA==
X-Google-Smtp-Source: APXvYqwrXeX4zkdcF+luK5aZ8i5L32YJZSkhlWj5pwMryd3fLogSEAt2LHeSq6RuguZbssX+EVNPHw==
X-Received: by 2002:a5d:668f:: with SMTP id l15mr7959140wru.125.1557503612459; 
 Fri, 10 May 2019 08:53:32 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id u14sm5333860wrn.30.2019.05.10.08.53.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 May 2019 08:53:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/2] arm64: dts: meson: u200: consistently order nodes
Date: Fri, 10 May 2019 17:53:27 +0200
Message-Id: <20190510155327.5759-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190510155327.5759-1-jbrunet@baylibre.com>
References: <20190510155327.5759-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190510_085335_218994_13E31F82 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Like order boards, order nodes by address then node names then aliases.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-u200.dts      | 50 ++++++++++---------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index e91201809abf..7cc3e2d6a4f1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -16,13 +16,10 @@
 	aliases {
 		serial0 = &uart_AO;
 	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
-	memory@0 {
-		device_type = "memory";
-		reg = <0x0 0x0 0x0 0x40000000>;
-	};
 
 	cvbs-connector {
 		compatible = "composite-video-connector";
@@ -34,15 +31,6 @@
 		};
 	};
 
-	flash_1v8: regulator-flash_1v8 {
-		compatible = "regulator-fixed";
-		regulator-name = "FLASH_1V8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		vin-supply = <&vcc_3v3>;
-		regulator-always-on;
-	};
-
 	hdmi-connector {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -54,6 +42,20 @@
 		};
 	};
 
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x40000000>;
+	};
+
+	flash_1v8: regulator-flash_1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "FLASH_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3>;
+		regulator-always-on;
+	};
+
 	main_12v: regulator-main_12v {
 		compatible = "regulator-fixed";
 		regulator-name = "12V";
@@ -62,6 +64,17 @@
 		regulator-always-on;
 	};
 
+	usb_pwr_en: regulator-usb_pwr_en {
+		compatible = "regulator-fixed";
+		regulator-name = "USB_PWR_EN";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_5v>;
+
+		gpio = <&gpio GPIOH_6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	vcc_1v8: regulator-vcc_1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_1V8";
@@ -92,17 +105,6 @@
 		enable-active-high;
 	};
 
-	usb_pwr_en: regulator-usb_pwr_en {
-		compatible = "regulator-fixed";
-		regulator-name = "USB_PWR_EN";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vcc_5v>;
-
-		gpio = <&gpio GPIOH_6 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
 	vddao_1v8: regulator-vddao_1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_1V8";
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
