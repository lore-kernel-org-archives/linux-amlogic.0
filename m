Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3D6C3DA7C
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Dec 2022 10:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tdIMQuDL4pjsgJOamaCAdQtXCQ+oQP/sSjzIvOVHyOE=; b=sVc6e3y1WF93pa
	I/PksMTNWbXPDmgGexpz6bdM2DhFxxqjn5tS3a1tnndF0xkHiWwRtbE8b7dvAFguBtOzEO4YrtTaA
	mFjIeR4z3OcPoEXKs9yDFhdBwGZ0oer4WOmrc6L93BgtHZ+2Lvh2KrrV1Uh+ErqDxG0eyijyILPtx
	Cj7BY8RMqFNZwEhGuPYJZIVX4N7CbyvJU4h4QmhhsXWMlVXp5MCjNQXRnKorkT0LoGwprCLCt1UdT
	Dq5KfRejLiKVMDKjbF9KPrTwtpN0d0vERWF+LFOyY9+7Lt5ACuGNn5UM5HbTdc8QXljynwzdflhr7
	donE1jryjMPHxKMbZV1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATJK-003vN2-9P; Wed, 28 Dec 2022 10:05:22 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATJD-003vIf-Q8; Wed, 28 Dec 2022 10:05:19 +0000
Received: by mail-pj1-x1036.google.com with SMTP id h7-20020a17090aa88700b00225f3e4c992so7007969pjq.1;
        Wed, 28 Dec 2022 02:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3xQEZHxsyANIGoODmNVjsjeyx1NMMrnI1xGIfGuTuo=;
        b=XtS8+r1Iur/AdNm/wzdsGhQS7RnCEgs1MyY2YbZGgbt122+fsGuJSzc/j9KP6ezmnq
         nNS7MWWhdD5E9dJaL3kWWylVGgGB80K89KpXIgPznDXhJ8IGtliF2R9zHKuEoWYiwZfo
         YPxvDwJElMdaJcdM1g1dgxzPHZobHasK6JfkP6UHyVb2Q3DWYbatJWtJbJyMBOZHyISx
         d0m6UojgOIgAUY5GWaWRvK/GCUAPUQOsinBXphlSu6+PHwqHm83uGnNOvXBIpJRJXYn5
         b8rwswwSXJWMTtuQZ3LikoZtS3PCWUM5zvC0/rbhRtZCTW8RmujeyN3I7hvwzfguEGoA
         IcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3xQEZHxsyANIGoODmNVjsjeyx1NMMrnI1xGIfGuTuo=;
        b=NCIhsAcBaEyne/LYSHPQktijdkqogJML1tMy6SHLKUSq+qvbwb38Tn+h14mH8EmiYz
         EnnNVum8uj9BbptU4eJlP/dex/CtRODB2trq4rJYu1Frm/1nUI/uCr4qrvTt9G6I2cM7
         tbEV2Q/SXR+uBqSE4RlHSaG5cGj7tm1v45joVxOrZSCLlvjgaBaTsGyPyCmHLNymQs9A
         +r4UD4MqxZY0q2t1tr0bosKuRsT/7m5UbKDROyvR45avEKX9wGINNxUWag0Fs61uP7/U
         /pvG/holtHcD+6b31pmOTy29G/d/anIi2yvpwM9VzeSyzBOnyOGzYNxvyh1ockaD2+YU
         5qog==
X-Gm-Message-State: AFqh2krwwr/C336lxDDlW6bEeVw7mCUstTZ53hS8x9kSLFbrXpkYSv0r
	QgQbLC5MjQGn9hrxSS/Cr1A=
X-Google-Smtp-Source: AMrXdXtSp/7y+cp2k4LknDET+kk81AS3xXLr7aiUHAdtj0txF0OuGUiSqXLwarIXL4mlrjayblOkZw==
X-Received: by 2002:a17:902:ecc1:b0:192:760f:c35e with SMTP id a1-20020a170902ecc100b00192760fc35emr14421541plh.53.1672221914056;
        Wed, 28 Dec 2022 02:05:14 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.26])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019277df45a6sm5794915plb.53.2022.12.28.02.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 02:05:13 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 02/11] ARM: dts: amlogic: Used onboard usb hub reset to enable usb hub
Date: Wed, 28 Dec 2022 10:03:11 +0000
Message-Id: <20221228100321.15949-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228100321.15949-1-linux.amoon@gmail.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_020518_521511_F7A5C4EE 
X-CRM114-Status: GOOD (  15.29  )
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

On Odroid c1 previously use gpio-hog to reset the usb hub,
switch to used on board usb hub reset to enable the usb hub
and enable power to usb hub.

Add usb hub regulator as per the schematic.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 40 +++++++++++++++++---------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 04356bc639fa..3b29169aac43 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -185,6 +185,33 @@ vdd_rtc: regulator-vdd-rtc {
 
 		vin-supply = <&vcc_3v3>;
 	};
+
+	usb_otg_pwr: regulator-usb-pwrs {
+		compatible = "regulator-fixed";
+		regulator-name = "USB_OTG_PWR";
+
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		/* signal name from schematics: PWREN */
+		gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&p5v0>;
+	};
+
+	usb {
+		dr_mode = "host";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hub@1 {
+			/* Genesys Logic GL852G-OHG usb hub */
+			compatible = "genesys,usb5e3,610";
+			reg = <1>;
+			vdd-supply = <&usb_otg_pwr>;
+			reset-gpio = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_LOW>;
+		};
+	};
 };
 
 &cpu0 {
@@ -281,19 +308,6 @@ &gpio_ao {
 			  "J7 Header Pin 6", "J7 Header Pin 5",
 			  "J7 Header Pin 7", "HDMI_CEC",
 			  "SYS_LED", "", "";
-
-	/*
-	 * WARNING: The USB Hub on the Odroid-C1/C1+ needs a reset signal
-	 * to be turned high in order to be detected by the USB Controller.
-	 * This signal should be handled by a USB specific power sequence
-	 * in order to reset the Hub when USB bus is powered down.
-	 */
-	usb-hub {
-		gpio-hog;
-		gpios = <GPIOAO_4 GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "usb-hub-reset";
-	};
 };
 
 &ir_receiver {
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
