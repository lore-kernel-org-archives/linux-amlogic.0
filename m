Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB7DC636CD
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Feb 2023 17:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0yg9TLYhYbr+w3He50Yo9ubkDX/vyl2suFUg4hb3jTs=; b=ANVAZLXQJ1IKSh
	m73QGa+8bLyOdkxH1aIVGiECE+w52MEBOBuahIWbsmh8BOA0T3NGEWErfZfVMeHv75wwvymf4/KKt
	2uWKzRwXCqLcj6Eq5VLdl52iI2SsKMP2NAE3YCYRyL6rrW8QHprOCmyaQzA89ZXDVwtlfYCNKEMVx
	YB6dEXCc3VTZap9Z1QteZsJanLQM0eXpBWaq3ERdCux6XqFfDVR9INpR17nqG8Xcoix/MiPoUszY2
	14Wds5I0rqaeyI3Vk3RGHVE+mc9l7/d9LaPnVRutP4m/ViW19EALRxKPVGSBNpf/439HMcR8YFk5H
	aCMRSj1A4YodGumni+iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQWsF-006fmU-Sa; Fri, 10 Feb 2023 17:07:47 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQWs1-006ffW-5a; Fri, 10 Feb 2023 17:07:34 +0000
Received: by mail-wm1-x32b.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so4533258wmb.5;
        Fri, 10 Feb 2023 09:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQNrZmksDBpl4fmmiFb/Stn0EUPB7bOOM5pqSh2sIdg=;
        b=K9+H+FQocIzMfZNKuklGWbpmfIcSkcfMPgfV0R+lz+Xq5Zr/VzEMBzwPaDjn+RHItO
         mBO/P/eoJeGODqHez1//UwZE4iHERL7pojFNnX0oNpvD3dy7jvpwcNI9dzxggsJcrs8A
         oaMxACDl+TqxvKbWFhlcommwAr3468rgaqK7hT1jlsa3TUvtJCfGOqa5yUbyo7P9qCqc
         uaZBj4sq/UqtiwsStybxxUYVbJ3bprbmpeDz1e1NG+TbwC9poYsGRQQKHtqgNUMrOC2C
         f585SPkuIXTnIz7ybtmHNpEeKAg/4N12wZYS5jk0zSVQ88/hL4RTqjFV3RX+Te+skeTY
         xpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQNrZmksDBpl4fmmiFb/Stn0EUPB7bOOM5pqSh2sIdg=;
        b=2QFT1RWadQ0BAb0YyUIhPlIw/7WICszvnY7fkeZns8JcRcVcOFhSSxMv4PXdCPAAmf
         yRuviEoZkbkhYQ+7wCAGVTCcMsBOog5CqHpvpn7lrDGy5Xl5SdNmAwf6habFk/jzlyL0
         y45ZXjM0/c2IpX1shWqaWkJgrm8B/I+VIkqwvN0qL9hVxeTrY3qXSJyU4LG/Hdbh6het
         KV2BnQJGRPn2jrzLjnFyl4ZEQSpgEjOMx7RoO3qA1ZpdRZ/grmcAS25BgScaXi4uizVt
         6RM1Wcdg8Sc6YOwicqmBcoQgW1mEYF075Gz31jARbSYl4uSQAol4zSaoc5z5sJi5QMaI
         g1ew==
X-Gm-Message-State: AO0yUKVPsACbWjYrLa70uXK3SDVZgMnFGkvQMc8oeN4V6ewnUV3h89Yk
	yYLmplVnMDS9bicLupLpOwg=
X-Google-Smtp-Source: AK7set8wwkdbVXURn6jECfIMn3SjAyn9dmGh59TJ91ZHx7A4gZB2kwBJkZGIHLfQu+3nOzwuBUzHGA==
X-Received: by 2002:a05:600c:308a:b0:3dc:43a0:83bb with SMTP id g10-20020a05600c308a00b003dc43a083bbmr13629846wmn.3.1676048849132;
        Fri, 10 Feb 2023 09:07:29 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id x7-20020a05600c188700b003cffd3c3d6csm5351531wmp.12.2023.02.10.09.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 09:07:28 -0800 (PST)
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
Subject: [PATCH v2 1/3] arm64: dts: meson: gxbb-kii-pro: sort and tidy the dts
Date: Fri, 10 Feb 2023 17:07:19 +0000
Message-Id: <20230210170721.1285914-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230210170721.1285914-1-christianshewitt@gmail.com>
References: <20230210170721.1285914-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_090733_244205_5FCFA3CF 
X-CRM114-Status: GOOD (  10.40  )
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
 .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 32 ++++++++-----------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
index 6d8cc00fedc7..9bfdb54d912a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -6,21 +6,22 @@
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
 
 	leds {
 		compatible = "gpio-leds";
+
 		status {
 			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 			color = <LED_COLOR_ID_RED>;
 			function = LED_FUNCTION_STATUS;
+			default-state = "off";
 		};
 	};
 
@@ -34,24 +35,8 @@ button-reset {
 			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
 		};
 	};
-
-};
-
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
 };
 
-
-
 &ethmac {
 	status = "okay";
 	pinctrl-0 = <&eth_rmii_pins>;
@@ -78,3 +63,14 @@ eth_phy0: ethernet-phy@0 {
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
