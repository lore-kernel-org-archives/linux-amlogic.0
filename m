Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D6ECCA47B
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jun 2022 11:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Xpj3ZpAREfT2wVvUh7KEYBB4bmPXuz+hBvKwDUAEG0=; b=mWs4R3vnpeebiz
	G5UDzu87X5ZR6foCOml1uTZOkeBWv14XdWVnhPdaTMZgZ892b4yJzObPI1muOSP7MNMRg/fBxxtUW
	kWMkBdUPHxIHDu6wcFBQRvRripoSl2fZRTxzwyzrFvvTlIWrY2vdXrtvEwSGWsivZa738XXhfBkoR
	sQa7RhDAaRVxOq2Q9t5EE5WFUQzseb+v/ipw+wjg9WPtT6DKr5CfNKWPuHLjNrVKle3/WIOJky9Pw
	yYXBfi+SOZjOVSyXc/AWpNRcy8JUotGQNu2l/5L3lWgl0P2b1zaFOfkMp75ViRruzhH2d6MLLYIJd
	4VgVP2LWzwfFkLPFfoMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGWz-001PVB-OI; Thu, 09 Jun 2022 11:40:53 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGVg-001Ony-U8
	for linux-amlogic@lists.infradead.org; Thu, 09 Jun 2022 11:39:35 +0000
Received: by mail-ej1-x62a.google.com with SMTP id gl15so33029443ejb.4
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Jun 2022 04:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=766FyUMB4XnY1SLKxJJqa2Xdrs65xVhwuFeKmL62QsE=;
        b=YiZ/to9BW3gq/r4YiLcIjhn+qZ8UdvY2FiUMuR4LTzpAbxFPXcIbKFFogvvemTEjmb
         8DWn0G7cKSV3QlLXluHZRHoehP4RZ4/La/3oqAEdUApn+9RNqA4yUDmc6yh3gXTgRUJb
         Tqrzk8rPJHUfKVnIeHKmpue0TatCn1zAUtBTUJuwbfdrVKt9qjLwgnxjGu+1EGhcDylG
         Vfua9s2/TVSjGoq3f2AYc7J6/l1k5I1OaP59FhFa0FWRhIyAoNjKmAONPlZmiWFQjuLh
         zmeDvy2nz1D2UqbF9szTEQ7acKZ99imvgQrYXp4xpQxFpEj5js5i3eBjiHOX78ZY3Bx3
         uFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=766FyUMB4XnY1SLKxJJqa2Xdrs65xVhwuFeKmL62QsE=;
        b=Gwla2vDI1rbI6RNnLXqIo22UOSx8/3MwfcYoLYteLta++f3a8+XuRB07V8VX/Elpbw
         slUEt78chw4vYXrLMkUVv/8mg5y+V3zUcC2oFczTfA6c5Skf9eoXFP+nT27iwj7a8BxM
         48SR8x6sEWWHZZqToLSgzrJEhuM8LLe3nw48RXMtuezWfUUVntksrwmyIEuE29gPSAfN
         o3+E6NKhJKe74TS2JR+/jZR4nwTkl413++TwDh1eibpiwz/LVyeLn1D7ZeY/vqBqqy3R
         4avkjhEv22FLkeIuS0gkhI08c5BNCzz+45PkUdx4TcLMMKzOOOBX0H1mh3Ar918yRbmZ
         ewdw==
X-Gm-Message-State: AOAM531P2Ql9YQmxTCqKFUpSjp3xEZH15gqnVlumFfq9jvd/5OyRW7q3
	pCDTjIHQExzzQq8QOKCx9goLHw==
X-Google-Smtp-Source: ABdhPJyEO1FWSvDxaLCW4XTIgv0lg+pYroYdvvUgXuq+IGEhWkOWA/2i8yXzX5Rz5j7281LR/r+V0w==
X-Received: by 2002:a17:906:dff9:b0:6ff:2f22:7d0 with SMTP id lc25-20020a170906dff900b006ff2f2207d0mr28109541ejc.198.1654774769212;
        Thu, 09 Jun 2022 04:39:29 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u14-20020aa7d54e000000b0042e21f8c412sm11898495edr.42.2022.06.09.04.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:39:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 07/48] arm64: dts: amlogic: correct gpio-keys properties
Date: Thu,  9 Jun 2022 13:39:09 +0200
Message-Id: <20220609113911.380368-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_043933_079291_E1DC617E 
X-CRM114-Status: UNSURE (   9.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

gpio-keys children do not use unit addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts           | 2 --
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts         | 2 --
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts            | 2 --
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts        | 4 +---
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts        | 4 +---
 .../arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts | 4 +---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts          | 4 +---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dts   | 4 +---
 arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts     | 4 +---
 arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts       | 4 +---
 arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts                | 4 +---
 arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts         | 2 --
 12 files changed, 8 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
index 6c7bfacbad78..1540ce47bc6e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
@@ -22,8 +22,6 @@ aliases {
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <100>;
 
 		power-button {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
index 707daf92787b..afe375fa83ca 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
@@ -21,8 +21,6 @@ aliases {
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <100>;
 
 		power-button {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
index e8394a8269ee..6d8cc00fedc7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -26,8 +26,6 @@ status {
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <20>;
 
 		button-reset {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
index f887bfb445fd..63137ce3cb9d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
@@ -42,11 +42,9 @@ led-blue {
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <100>;
 
-		button@0 {
+		button {
 			label = "reset";
 			linux,code = <KEY_RESTART>;
 			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
index 6eae692792ec..505ffcd8eb76 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
@@ -37,11 +37,9 @@ led-ethernet {
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <100>;
 
-		button@0 {
+		button {
 			label = "reset";
 			linux,code = <KEY_RESTART>;
 			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts
index c529b6c860a4..a4fa186f0458 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts
@@ -30,11 +30,9 @@ button-function {
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <100>;
 
-		button@0 {
+		button {
 			label = "power";
 			linux,code = <KEY_POWER>;
 			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
index b2ab05c22090..c1470416faad 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
@@ -30,11 +30,9 @@ button-function {
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <100>;
 
-		button@0 {
+		button {
 			label = "power";
 			linux,code = <KEY_POWER>;
 			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dts
index 4b0ff707e21b..595b49085074 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dts
@@ -16,11 +16,9 @@ / {
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <20>;
 
-		button@0 {
+		button {
 			label = "power";
 			linux,code = <KEY_POWER>;
 			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts
index ebebf344b715..f5b3424c0f61 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts
@@ -35,11 +35,9 @@ button-function {
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <100>;
 
-		button@0 {
+		button {
 			label = "power";
 			linux,code = <KEY_POWER>;
 			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts
index ea9f234d1fc7..b8ef3bd8b840 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts
@@ -41,11 +41,9 @@ button-function {
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <100>;
 
-		button@0 {
+		button {
 			label = "power";
 			linux,code = <KEY_POWER>;
 			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
index 8edbfe040805..d4858afa0e9c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
@@ -30,11 +30,9 @@ button-function {
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <100>;
 
-		button@0 {
+		button {
 			label = "power";
 			linux,code = <KEY_POWER>;
 			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts
index 1e7f77f9b533..f8c40340b9c5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts
@@ -45,8 +45,6 @@ button-update {
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <100>;
 
 		button-power {
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
