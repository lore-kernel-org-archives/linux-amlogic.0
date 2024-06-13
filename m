Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C88BC27C75
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2024 12:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8t2R+kKCWnr0dhm8OBTBh9z04m9mdnvxB+BjsC8mQ4M=; b=LLW7feeSudDGvr
	Kbyg4Iet6JtnhMjZRBLclDlNChhmhwUKoitJzJ/VkjEjHX8CseKqy4ESI9jPLTE5Evbv4YSdO/bkP
	IjUq24gytuaqV8qxHGSN4SI1goY/NZ6QKJunSRE3PKecOrQZthV3JRnjsGR+cKgjoY2WbE5vq7gzx
	1yg2XnVOLxrJHHTieVxBwp20C88vYv4xnKS9MAcG/sLvg3GxBGiy1sYsrcbf0+tsb1zE4CQRgdaK8
	FO0qE6ytTX6d2fgdUB3M6xu+0P0meRafi9/M29jbE3qk6YzF8/+7yvsxqnZOHjWOSyfXzyS5wX3O7
	OeX3xinEt9LD/xdsQg5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHjbQ-0000000GVsg-2jsA;
	Thu, 13 Jun 2024 12:30:52 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHjbM-0000000GVpy-3AI3;
	Thu, 13 Jun 2024 12:30:50 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-6e41550ae5bso699209a12.3;
        Thu, 13 Jun 2024 05:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718281843; x=1718886643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyhnGzVIyoi/gHkvqNPaXXARC68ta1GMz1dJjxYfDu8=;
        b=C/S1nhNAauf4CnC2kzjP/0UEQjEQJ/0KsU2/3dTKRCY5OIbG4sKbmYh6TriLUThNII
         +WPOOuW4FzXEgmKw9hPEUeNVx8rpamvLYXrMSfo5OSKswwXslJzeIn7rqgi9hsw4vGMf
         4aapRbr9hvkqIeUOkJFR+/BPXIJsNNN/+XckIQ56d6kmm1jWM/3vMeo9CrHO1jK+QLCW
         6oLFLt37niMf4S1mx85mo1Ai34troNnksR+f1GrvieRjwg+t6iw2KORSZ5Cc15E7Uo8t
         fVoSJt5udLr526EIWmt35suCUSCetzoX556ohDy6UmsT6UXNenh6THUDwA6CZlbV/V/K
         kHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718281843; x=1718886643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dyhnGzVIyoi/gHkvqNPaXXARC68ta1GMz1dJjxYfDu8=;
        b=PIJWe50hGB9iXwTHuTYZ94/DxdiVCJBmBy9/3V8btgR6N+r8On1GgwmJGSgdc38um9
         CtxRy+wUfU9odOhG++8EHs0upjsUi5XXxggJ2EBfxRg0yC/JxkmFB++eNDpFi1qazv0x
         9JfsrEFGT6EnT720VFPKQyAyiCovJkNUw8bL43ZLrqRAgr/DXUfY3kOMzRr1rKK8CjDn
         mjNDVtPGq3L0MMl3KfAx+ux7r4SakynM1uVjXCy59zDMwEsvdw9Qt7WYCqSX+oBdSb9j
         eLqGArNOfldlVu6FVLUp4Z1wz38K/m7KeZ8vgs3jCnBwXjeIT8pRFlbTzl6md/x1eMUV
         x33A==
X-Forwarded-Encrypted: i=1; AJvYcCW1jMqmxsVEnow18iEekZBy07JOI11HDMnTDJOyCSnlG3rDcuw68qBJHvBWOiDdvmspQ8Ylmx4T7H17oy/HfPfwCXI3xnBiaK/taNSvPwH/DtlfP5HSqeRNxPmk0yhJJtuhqXDaC6XRJigtiGAGCKEVXZByVZXXTw==
X-Gm-Message-State: AOJu0YwgJn7Aq14pdVPyp3tGHv7VQ5FhWQxPlp88m3QiRxJIEKKsU6E4
	o2rHWj91UN3ZgcCZoVjTaEy889x0i/J4OEzsPQ7KUKTTKR3wu+NKyNREHg==
X-Google-Smtp-Source: AGHT+IG6Z9yGmBryZSy9wuMGay0o8aAhEaBmtbG5TCCILeJYBrSp7Dsjp60aC/QXOhsntZ/hKwlaQA==
X-Received: by 2002:a05:6a20:2444:b0:1b8:a2ca:3b6d with SMTP id adf61e73a8af0-1b8a9c08c68mr5240212637.37.1718281842629;
        Thu, 13 Jun 2024 05:30:42 -0700 (PDT)
Received: from localhost.localdomain ([113.30.217.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fedf59299fsm875459a12.55.2024.06.13.05.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 05:30:42 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: [PATCH v7 2/2] arm64: dts: amlogic: Used onboard usb hub reset on odroid n2
Date: Thu, 13 Jun 2024 18:00:15 +0530
Message-ID: <20240613123020.43500-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240613123020.43500-1-linux.amoon@gmail.com>
References: <20240613123020.43500-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_053048_820396_1720EEB6 
X-CRM114-Status: GOOD (  15.95  )
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
v7:none
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
index d80dd9a3da31..86eb81112232 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -31,6 +31,30 @@ hub_5v: regulator-hub-5v {
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
2.44.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
