Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DEEC54E76
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Nov 2023 02:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RIQv9rM/9as2L2o2JeAAH/K0gI61lBCtcoYeXmHfm8Q=; b=R664Ow3fHWZ98l
	EDVirnpiVhhKnjF4ZpPc/SfVhagzBWtHUeU9kLYzF8X/5aeslMS4BZrgP1wVkEWhnRuoYKfHcnzBX
	2ihCsJz3PlHfcGt0iZ3fMnCHeVaVyW2Z6/LYRNE2IQjLfOI3y17E1nKag/MrBBgkz7r3QFUKccL88
	yoz6lUCbiLzUPI5LRkDT72uJ30WwFrwCyNAgtwTPb5XuxXVViYB0CAykVdWViP/tW1e6pu95i7dai
	fFEaDkSYsWCtxYVMjdcWNR9B4eWucby9KqTdojchFALx/k5mjiUIJTLUYkLj5q20veFdMil1I+Ac6
	b9Ii2+9gCZbMOXzmB84g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4Xee-009QJG-0c;
	Sun, 19 Nov 2023 02:35:24 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4XeZ-009QIi-30;
	Sun, 19 Nov 2023 02:35:21 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1cc68c1fac2so29336585ad.0;
        Sat, 18 Nov 2023 18:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700361318; x=1700966118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5I2bEA6cqofY2I8eKS0KNcDRLfU1oI5gxtSXCZkpuPA=;
        b=d+XdS5/ByF10VZyZ3GOHLoJ5ZwvK4nLtldRGw5R8s1snu2v8yryjLA30m3eAD+3uAh
         l98f7ti51rsLS//cW/SG2u5iN8POgk0aGoLsfKgi4NcjIP4L3oyltQik1hJ2mJFzxNu6
         AUiHxhI9sUXUvbWM7RLZVvIP6EtMj7N4i1xSPaUQG5XOJy1DpCiBWVqipSYDtbFcP1D7
         h7r0OGHbw9zMUWMbNUXyh0g1v6VYiqIbSrovB/AgYKskSiWT0R30hgTPeYUmVLsXXgX8
         rn7B1VW9S/Ik21eZJicebaUeu9Wa+r9w4QnI2sx63q5/NQ393cHT2R0IwaryIqBHnVGq
         8b+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700361318; x=1700966118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5I2bEA6cqofY2I8eKS0KNcDRLfU1oI5gxtSXCZkpuPA=;
        b=Ug9rbUFqOQeytYjYPI1txzsK4pcGMwi8oKF7wMdPzLe8ji1/kJGdZlbY8GPIi5vpCM
         +cnNpflKkJUZhsHoqEArb4nUnRpwA4jeEkctfFAMj0dIvEXdlmPgvSg3f1iWyEMzICkW
         y8wjFT6EvM+hqpHKFYSb4T+ec/UzObTbGst+ahntKvJNkpnexAkhX0FCs3zkEJhuh0vR
         +i/C77JA3mLeyz633DJwvKrwFiB40VfHx/DYjVp+7DWz/vmpgWDY7RnR8Kf49/jenYcj
         QS5/3vGNBrys9evcdT2d8Uc7iwgLl2VoDu5hHcYbYb4NH2bizwBtIMJKqVqigcfRjGkB
         9quw==
X-Gm-Message-State: AOJu0YzCCgh2DFzgqgEe87Li126TwD5K/pjFY12rEqi7pcfM+zFvzxaZ
	OrNRfUPQb6CXCSJPCAZll6o=
X-Google-Smtp-Source: AGHT+IGvoNLZuLcgqp0tI86VONJQTmNikMKIsL2RDRu2+46Ky5lZx1dlKINhrxjnbjUZs+SPLvMGvw==
X-Received: by 2002:a17:902:ec02:b0:1cc:4467:a563 with SMTP id l2-20020a170902ec0200b001cc4467a563mr4361440pld.3.1700361317659;
        Sat, 18 Nov 2023 18:35:17 -0800 (PST)
Received: from localhost.localdomain ([49.205.245.83])
        by smtp.gmail.com with ESMTPSA id j8-20020a170902da8800b001cf53cd1508sm1526207plx.67.2023.11.18.18.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 18:35:17 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Anand Moon <linux.amoon@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: amlogic: Used onboard usb hub reset on odroid n2
Date: Sun, 19 Nov 2023 08:04:51 +0530
Message-ID: <20231119023454.1591-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231119023454.1591-1-linux.amoon@gmail.com>
References: <20231119023454.1591-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231118_183519_990568_A15FB2F5 
X-CRM114-Status: GOOD (  15.66  )
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
v3: none
v2: none
v1: none
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
