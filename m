Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B69C636CD
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Feb 2023 12:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r+eEoNnadUz3zKUO/CbBlwP/yWE9C7wNP6at8RVLn+E=; b=CCLpOwHpX+DjGI
	TXVkLKb9qbxX5R9VdJYi4c3e486jyfbvwXNSMs1z4vdxUMQecJxEiHGBq7FIdz9++sjTk7i2pDDR+
	ZzNu+jJVK5myKaH0Rm5mIlYJxfyDUeEAlJslRw6u6j2zEfxCA3bdCAjTKNU3YK6AiLGAKFXzg7ZCj
	7qcgnWeF20B8hsf2KHTF79ez0pTCruz+vAiP+iAJ1zmYz0rPeMla3OzFA5r2entIbF1KX1j5ZwVrn
	kwcLMl+i9j4NMVoyUxNzvdkvGfz5GJoud8seQyMGoA88InU27VUwRxBV+PrTgNQCfI/GgQL5liF3m
	37NZT42kSHBrZ9wu1wKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQSWE-005gSC-Fj; Fri, 10 Feb 2023 12:28:46 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQSVw-005gI8-RC; Fri, 10 Feb 2023 12:28:30 +0000
Received: by mail-wr1-x431.google.com with SMTP id by3so3599039wrb.10;
        Fri, 10 Feb 2023 04:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96shaXIQtfSOpk1V2rzXl80X1bE5l20ZAqgUNK1DbvU=;
        b=RE/Wr27m9sEApv2s1qrJJM+eayomNFEo2RBl1PPDJP/TtxoFTGk/vOZuq/UuQ9mbLn
         vrTnandG9q62o+Su9jWdKwqY8MCX1PwwlgpnMz4DHlfvuA8VQTI7ha8vE7r14A0pu38D
         w0Xyhgh3KyR4QM5vjQ6Qayy4Jb/trLyjV0fSS03XVTGjmBHoZPgDccJKRlTK8e7Hlhyt
         e9b47bWYpGg3SQQ18aZyBt/BgSPt1D3nDpAB2kbGhp2nux5vPUpnhcvAFFaQYLRs0jkY
         68keMPReixiEN4z2hjWy4AIeMR2LtbPlrA/YwYQs7Sz/rPDb7nCWySC0ecTPLr6rQqRm
         aOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=96shaXIQtfSOpk1V2rzXl80X1bE5l20ZAqgUNK1DbvU=;
        b=53pwf1l2+gssTPcex6PEL1v1aAK8oNSBIzE9NSlBBf6P+enyxKOCr02qwnoDmeOtpn
         uAFnn9rcpIrAYSDLQwiX9eQBxMP6iq6EX1S65PsKBBRj0dWUcun/cWz6PgF/3k5zAL5c
         zOk/CMMI2uPZUbMd6ffFMPgFHDMHcFxfiz2Q2C6UiIpaCYKDeFlfpP8BeyoAGfwXPca1
         Xd92M5C4lJCRPZKqLbn9YgTqnlbqGXK5EEHw6Qoa5UOWiKI997AQjsDuhhVzPPzQhFAm
         bzQmCekcdQYkHfMrNoGcGgYvbsku7wKBiUbk9pLdGhX8PHSw3a++nMrX8BONPfH1pSNZ
         ZMLg==
X-Gm-Message-State: AO0yUKVbjaxGWHkQiIfuTeHFgb3+n/jb0uSwsQ6k+8ZdZtYOSPnYp647
	AMNKGPSjuE6X6iLnCBj9KnU=
X-Google-Smtp-Source: AK7set+t0+m6XIrOzmtRzoIAnUN/GgzwO1HROtUPFwytx/bCrcDytT0e7JqMLb9G+nqozFSXrVjohQ==
X-Received: by 2002:adf:f212:0:b0:2c3:f250:f217 with SMTP id p18-20020adff212000000b002c3f250f217mr14814903wro.1.1676032106485;
        Fri, 10 Feb 2023 04:28:26 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id i8-20020a5d4388000000b002c5493a17efsm1540989wrq.25.2023.02.10.04.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 04:28:25 -0800 (PST)
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
Subject: [PATCH 1/3] arm64: dts: meson: gxbb-kii-pro: sort and tidy the dts
Date: Fri, 10 Feb 2023 12:28:15 +0000
Message-Id: <20230210122817.1027765-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230210122817.1027765-1-christianshewitt@gmail.com>
References: <20230210122817.1027765-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_042828_899988_16F7F004 
X-CRM114-Status: GOOD (  10.46  )
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
