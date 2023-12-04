Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177E0C4167B
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Dec 2023 14:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bfrZwV2+onusbVu3Ce978lwR+xtB7jnOJHj2S7QyDzc=; b=15tocDWmr/kvtl
	/N0nwm1IiG5JVCW4s/2tE4plDm/H9EWOfxN/zqln/q8ccbJD8X6QqALnSA3bUN2BVYBzDy5s5/qU6
	LG76sYpqtB1LAGM3nX55IMOoqOKIlrQbptzUtAZb0RVZlkXuGy/xAQYXJMqIUOFvmsD1pnfkhwzn0
	0UzwP47ahtcxiB4Q5XpyXoV60jebbvU5B9tvmWK/nAfbJjkiAPmfc+QbKlP9HuRQSWU/PnSsrXk3r
	saCcwBZpdKrDHxuRHJNrrhuPiR+7MFMom5mnGrjeemUlq/GChZSFZMMX6kyTvtcv8TrlkR6oDYqJf
	Ow4hYzeSDmoRFNfIUwSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAABv-004pZ3-1w;
	Mon, 04 Dec 2023 14:44:59 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAABs-004pVq-0p;
	Mon, 04 Dec 2023 14:44:57 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1cfabcbda7bso21291665ad.0;
        Mon, 04 Dec 2023 06:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701701093; x=1702305893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr+hGVgKYHho74r9Sx7X0qX3CfwxBFy5+SbXUpW0SOc=;
        b=BI5LhKcMic6WCTIyDNpmC1MrJJj4s91JUmLOSF2SkIE4KRipWqw9yGalxUupg0r7Cr
         8PpRd9G7PETopdTsQNiDtORjNaeMOolw/tEvaRqSS6wIvbYTsrsfW8Q9fTUghL6ghonN
         xfnJwPVFulsIra3tpZUBWA+DNt1/MS1q/pUnPrEFM0Tnp3IVd3GcaG3gGy62D4KuZPIW
         HyHPV0mrZC3dFIvFfp37gweWSyj9u5XteKzT7ghzG5tjj4ki3sMrZUrQ+8OKwYRXts/d
         Os/vlZUKRCT12mR5U8AT6GajLSGXK/PDU8z/L08ohkCzMnX7kVCpSa2pLhU0RphRU1zA
         /cKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701701093; x=1702305893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mr+hGVgKYHho74r9Sx7X0qX3CfwxBFy5+SbXUpW0SOc=;
        b=gsn/nhSPGfY7qfSzTlYPUxv8LvdTFXH9rK893Nm8xntUuawajFPm/voAmi/L8yrI9Z
         YuzJ/Yfm2i++I/b2CmS7Y87PegQNDjDqe9Qsmh3ZMVHuBySN268Hpaxey9k4BFfO8ycl
         QnHamTj2QwsBMVJua6yg3q4zB1TqTzKlkEoMkmDmPC+0eaen7pmA+6+iTh+tIMmD3xC7
         l7mStHogApxUpN8iFqTO4z4afjPkqWdweppkIYsvCnyMqzDWP4d83MEPUa8SMM/98QWV
         MhGL5b/plXIURPlAjwLffBv7nB8o/c6D+dEB1OZbgXe7mNKIYeHzyC6OqJrFtJVMnJVy
         Zv8A==
X-Gm-Message-State: AOJu0YzhzhFM2MEuGiTYpIPmdOwOAHudSp9HtWbjFtvGhdDaEo14Zs1/
	bK/SSPYCWUv3pFORUBq/58ZKxGvNbCHBiA==
X-Google-Smtp-Source: AGHT+IHGfqxKkWM24FH6lMaewZHVoejZM4kN49I5j0/eGqPj4SfnwIrxljFk/WuUSR53XiDmDqdXbw==
X-Received: by 2002:a17:902:dac8:b0:1d0:700b:3f78 with SMTP id q8-20020a170902dac800b001d0700b3f78mr4602429plx.50.1701701093156;
        Mon, 04 Dec 2023 06:44:53 -0800 (PST)
Received: from localhost.localdomain ([49.205.242.26])
        by smtp.gmail.com with ESMTPSA id l6-20020a170902d34600b001cfb99d8b82sm6446815plk.136.2023.12.04.06.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 06:44:52 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Anand Moon <linux.amoon@gmail.com>,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/2] arm64: dts: amlogic: Used onboard usb hub reset on odroid n2
Date: Mon,  4 Dec 2023 20:14:26 +0530
Message-ID: <20231204144429.45197-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204144429.45197-1-linux.amoon@gmail.com>
References: <20231204144429.45197-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_064456_293331_1FA8F6FD 
X-CRM114-Status: GOOD (  16.56  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Odroid n2/n2+ previously use gpio-hog to reset the usb hub,
switch to used on-board usb hub reset to enable the usb hub
and enable power to hub.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
V6:none
V5:none
V4:none
V3:none
V2:none
V1:none
---
 .../dts/amlogic/meson-g12b-odroid-n2.dtsi     | 36 ++++++++++++-------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 91c9769fda20..9e671444eca6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -31,6 +31,30 @@ hub_5v: regulator-hub_5v {
 		enable-active-high;
 	};
 
+	/* USB hub supports both USB 2.0 and USB 3.0 root hub */
+	usb-hub {
+		dr_mode = "host";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* 2.0 hub on port 1 */
+		hub_2_0: hub@1 {
+			compatible = "usb5e3,610";
+			reg = <1>;
+			peer-hub = <&hub_3_0>;
+			vdd-supply = <&usb_pwr_en>;
+		};
+
+		/* 3.0 hub on port 4 */
+		hub_3_0: hub@2 {
+			compatible = "usb5e3,620";
+			reg = <2>;
+			peer-hub = <&hub_2_0>;
+			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+			vdd-supply = <&vcc_5v>;
+		};
+	};
+
 	sound {
 		compatible = "amlogic,axg-sound-card";
 		model = "ODROID-N2";
@@ -234,18 +258,6 @@ &gpio {
 		"PIN_3",  /* GPIOX_17 */
 		"PIN_5",  /* GPIOX_18 */
 		"PIN_36"; /* GPIOX_19 */
-	/*
-	 * WARNING: The USB Hub on the Odroid-N2 needs a reset signal
-	 * to be turned high in order to be detected by the USB Controller
-	 * This signal should be handled by a USB specific power sequence
-	 * in order to reset the Hub when USB bus is powered down.
-	 */
-	usb-hub-hog {
-		gpio-hog;
-		gpios = <GPIOH_4 GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "usb-hub-reset";
-	};
 };
 
 &i2c3 {
-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
