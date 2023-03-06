Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B85FC61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 12:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0FgNqf8WAgyS0qzmpt1XI0DzumRHLTSpnbvfd9Ol4bk=; b=gslWTEbj0MFEqZ
	CZKVDvDvubRB1uJA437fyndFDPBgMM+vDTtmJZiosesSCwb/R4kJ8bnwg2fbW39YY5p2Raz+US4sh
	3+dY8TdO2IHaASVWMCFpGjGJVZglRQ/dyb8C79dJjpNljvusjgl/HZLINROKhGe8GS1JOEiOo6aPN
	fGEeEYCKMthel1Utsk6Iy36rIOgu8/gNjCBdewNHL3c0XPVetGCTddRwAA99Tja3kh2nNypxlxPXT
	XxvvZLCLscUnSgnM+CYogqes3mYKuSszYD9QtLV8UXOlT7VZOTUm+3QVa+zo6OapsfvAkGueSR7Ho
	qcWhy+t7k8iq4Nb8AIsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ9jM-00CdXi-Ic; Mon, 06 Mar 2023 12:14:16 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ9j7-00CdS2-J6; Mon, 06 Mar 2023 12:14:02 +0000
Received: by mail-wr1-x435.google.com with SMTP id l1so8529481wry.12;
        Mon, 06 Mar 2023 04:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678104839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S69/h6nKwoVosQbtsPPYLPT1mnoRPmUaC8JxTN48O5Q=;
        b=S95i+LmNw/puZMouSvSnWNrSP/xszWQqTztq5wkXbq4tfF0qMiVlDIrWG4jbYpe3lo
         S7G3a0ErCxlP8ObEtMp6+vA18ceffmMor8wWx6CfgLJSLIKLSckNmiTZr+Ie24oCPU2e
         F0//HXcY/CN+Jm0SsjdPpeR0a7+hekLa3MoBFvZ1C4/yz4hOVxUXyoZ2I/Zkg+Hp89eD
         rgbcaSqge3ig6eDGQYfTbDnWwaUlORuydKjgDwGRYSlUTvnzyxhQdC9RbgEz36E21eGS
         dvVBGACxjnk1shI4D86NLlTkIi5bGzlFNLUF5uK4Gv7kYPk4pHWkOeflVIoq5HVHX44M
         YkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678104839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S69/h6nKwoVosQbtsPPYLPT1mnoRPmUaC8JxTN48O5Q=;
        b=fHRoR8t1XPDdRV6X2pMBYAC6tlXhYWs+nYiCNlDT030PNMaKfLWc7iUwlwuYkpk54a
         GfytIrsA85kEf7WUjTZ/RAy6DCg5Sipsrui2oEjB86TQopyAY8aNKJ1hJide8jYnUpzS
         49CzirSt/jFNA++VNxCx/8sJiZbA+FjZFwirhxAW0hyBnwmUKBUdD7XutJ4tit/8OfFq
         2P68eXXR2wUr0LbxhHzYrcwBFMq7XTwpJKyEdBg1HmY0omThJYic880TBV5Gc+C3ZCWB
         NiYJKqXHUS+MJkuBtxbhfA+QjX+Zv/STdqbrOg1jcdY4yRzFyQ4TB5zN8TaZfhhYgrVa
         FACA==
X-Gm-Message-State: AO0yUKVxLsM2BXRk7sQdrcz56CxkPJvs6YnYaQ7Ji81o3oeqSKGAtp3t
	KmD8Q/jRmoqOLwa1LZWV5m0=
X-Google-Smtp-Source: AK7set+daYgIxZAzibZ8FSFcP7EutPd2r+olIldnKo9OBJGohjyJIyT8qApZpNIRA4VTc/UgENsLbA==
X-Received: by 2002:adf:fad1:0:b0:2c6:e7f6:49af with SMTP id a17-20020adffad1000000b002c6e7f649afmr6334270wrs.27.1678104838442;
        Mon, 06 Mar 2023 04:13:58 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id n10-20020a5d660a000000b002c70ce264bfsm9814798wru.76.2023.03.06.04.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 04:13:58 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] arm64: dts: meson: gxbb-kii-pro: sort and tidy the dts
Date: Mon,  6 Mar 2023 12:13:49 +0000
Message-Id: <20230306121351.1606360-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306121351.1606360-1-christianshewitt@gmail.com>
References: <20230306121351.1606360-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_041401_718833_ED762EAC 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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
Cc: Ferass El Hafidi <vitali64pmemail@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Alpha-sort the nodes, move the default line in the LED node to where it's
normally found, and remove excess spacing. No functional changes.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Ferass El Hafidi <vitali64pmemail@protonmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 31 ++++++++-----------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
index 5f2d4317ecfb..73ad0f5110f3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -6,10 +6,10 @@
 /dts-v1/;
 
 #include "meson-gxbb-p20x.dtsi"
-
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+
 / {
 	compatible = "videostrong,kii-pro", "amlogic,meson-gxbb";
 	model = "Videostrong KII Pro";
@@ -18,9 +18,9 @@ leds {
 		compatible = "gpio-leds";
 		led {
 			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 			color = <LED_COLOR_ID_RED>;
 			function = LED_FUNCTION_STATUS;
+			default-state = "off";
 		};
 	};
 
@@ -34,24 +34,8 @@ button-reset {
 			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
 		};
 	};
-
 };
 
-
-
-&uart_A {
-	status = "okay";
-	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
-	pinctrl-names = "default";
-	uart-has-rtscts;
-
-	bluetooth {
-		compatible = "brcm,bcm4335a0";
-	};
-};
-
-
-
 &ethmac {
 	status = "okay";
 	pinctrl-0 = <&eth_rmii_pins>;
@@ -78,3 +62,14 @@ eth_phy0: ethernet-phy@0 {
 &ir {
 	linux,rc-map-name = "rc-videostrong-kii-pro";
 };
+
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm4335a0";
+	};
+};
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
