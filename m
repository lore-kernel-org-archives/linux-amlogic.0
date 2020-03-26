Return-Path: <SRS0=29RQ=5L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249DBC43331
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 17:03:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC1D320714
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 17:03:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q6T+BIsJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QtmXMsPq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC1D320714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PeNRxkZUc4cBZbXOoJcpbzP93nTY89AsTJdxTHi0fRE=; b=q6T+BIsJo6lBCd
	eeBmNCF/V0a2xg6ws3azVE724GfIKRD1OOWrUEguZ+B2Rd5Pf6Ysa1V/knAzsZwWkr8I60HxkdAfU
	x7zVod00Giyj5HHomYnGHrnPQxU7vzZ4zdsBEYXoc7+Jnp06Tln4qhCGOSCqzzeUarfBwLv8HOMG0
	+DI/NKz2sae+3THo+OlMxjo37DzOw9B9kENG5Zlum0SKk/Gb/dwHefWSkqcd4UAK3bII9Zk/KFna9
	LCFr55frxjWrcmntdyQHdvn5vTHcVQ/DTlr/d83CRfyGYnkf+rvsG9RA+t73NikbApXiKZ5tPzRW2
	DunMRt5HXvbn8mXHbjww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHVuS-0007m2-Ft; Thu, 26 Mar 2020 17:03:12 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHVrZ-0004xr-EU
 for linux-amlogic@lists.infradead.org; Thu, 26 Mar 2020 17:00:22 +0000
Received: by mail-wr1-x442.google.com with SMTP id h9so8703831wrc.8
 for <linux-amlogic@lists.infradead.org>; Thu, 26 Mar 2020 10:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zryuZLQ80XQVZcSL3tiT6ek26OYg3D/sEMlLWr1o424=;
 b=QtmXMsPqJIULD2XCKvKCkeUpNRBVvGeOKuB5kcSnWgXjHfNmr8YKT9F/zlap+WqORl
 AjhQC167GvqpLKLNkHm8SWA1Lf5+GdvcmPSvgDw380OS9/zB0dRAQ2D4yi6YTe+mQYdw
 zkyU70Vtq/Q/eK4EY8Y+kVU43lqNeD/fX5WeuLFVpwI+ffbfceTnFAVEwcR5a+zrecet
 eLeu0Zy/GeXVtz072gZAgOdf3xlxwAjkNQNakl7lZ4Z7UpxvTTdy5PMbhwjwvKxK8b3e
 EGbf1MofiHM0B3uY5Ju6B2fXXizKuCuz4ntuhUNxM+5s7KwZF1+8glGpKcnFqAI1HW+9
 W39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zryuZLQ80XQVZcSL3tiT6ek26OYg3D/sEMlLWr1o424=;
 b=J2A5alxB3WmBXx4fCuTUaHoE8izaQ7ji01rpxklYI2n8aSuruCe1PAwONMSLqrR63S
 9wmilrSV1rfhplUiLEljiK7/BeXfq4vlhC80D3B1+4RPNfD6R7WloDcLQX0kgmCdTqiw
 HOVAX3C/kP/2WjZDHEnmTjf/zfsmFuG1jwWHz6eRsNPVBtAxvl2ad9bUM7AQUnrtVYZ+
 SfBSH3ZfJ+EB6bymWpT/vLoQSaB5YQWmw6HeAbN3RNqgRDK0P2yJ0v6Tvstu2CD/65qa
 aeeGMIxlcSaUzXcRVGXlhmuoVfc+ZTz2qQQATBJd2vnvhpoO0/ng0+jZk2ctb4HhqRS/
 zyOg==
X-Gm-Message-State: ANhLgQ3hMBRJFZPWUjqlj2eFkgNx8JQ0pR5P14PJBM0+HGOpXY/2IUZI
 vF8zYoWBX1drcre4yr8qfNHiBw==
X-Google-Smtp-Source: ADFU+vsok1rHN36i3DlVfSVbOsXCYpbRdSNlwTVHsKMj9H6PDIOgGhs26vYDSG/hnEZIGyFn0mKkIQ==
X-Received: by 2002:adf:fa8d:: with SMTP id h13mr10283231wrr.155.1585242010689; 
 Thu, 26 Mar 2020 10:00:10 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id r15sm4609823wra.19.2020.03.26.10.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 10:00:10 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: meson: fix leds subnodes name
Date: Thu, 26 Mar 2020 17:59:58 +0100
Message-Id: <20200326165958.19274-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200326165958.19274-1-narmstrong@baylibre.com>
References: <20200326165958.19274-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_100013_988986_2F5BF4B7 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fix the leds subnode names to match (^led-[0-9a-f]$|led)

It fixes:
meson-g12b-a311d-khadas-vim3.dt.yaml: leds: 'red', 'white' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
meson-g12b-s922x-khadas-vim3.dt.yaml: leds: 'red', 'white' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
meson-g12b-odroid-n2.dt.yaml: leds: 'blue' does not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
meson-gxbb-nanopi-k2.dt.yaml: leds: 'stat' does not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
meson-gxbb-nexbox-a95x.dt.yaml: leds: 'blue' does not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
meson-gxbb-odroidc2.dt.yaml: leds: 'blue' does not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
meson-gxbb-vega-s95-pro.dt.yaml: leds: 'blue' does not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
meson-gxbb-vega-s95-meta.dt.yaml: leds: 'blue' does not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
meson-gxbb-vega-s95-telos.dt.yaml: leds: 'blue' does not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
meson-gxbb-wetek-hub.dt.yaml: leds: 'system' does not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
meson-gxbb-wetek-play2.dt.yaml: leds: 'ethernet', 'system', 'wifi' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
meson-gxl-s905x-libretech-cc.dt.yaml: leds: 'blue', 'system' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
meson-gxl-s905d-libretech-pc.dt.yaml: leds: 'blue', 'green' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
meson-gxm-rbox-pro.dt.yaml: leds: 'blue', 'red' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
meson-gxm-s912-libretech-pc.dt.yaml: leds: 'blue', 'green' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
meson-sm1-sei610.dt.yaml: leds: 'bluetooth' does not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
meson-sm1-khadas-vim3l.dt.yaml: leds: 'red', 'white' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi       | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts         | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts       | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts          | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi         | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts       | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi            | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts           | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi           | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts             | 2 +-
 11 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
index 248b018c83d5..b1da36fdeac6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
@@ -96,14 +96,14 @@
 	leds {
 		compatible = "gpio-leds";
 
-		green {
+		led-green {
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_DISK_ACTIVITY;
 			gpios = <&gpio_ao GPIOAO_9 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "disk-activity";
 		};
 
-		blue {
+		led-blue {
 			color = <LED_COLOR_ID_BLUE>;
 			function = LED_FUNCTION_STATUS;
 			gpios = <&gpio GPIODV_28 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index d6ca684e0e61..7be3e354093b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -29,7 +29,7 @@
 	leds {
 		compatible = "gpio-leds";
 
-		stat {
+		led-stat {
 			label = "nanopi-k2:blue:stat";
 			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_HIGH>;
 			default-state = "on";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
index 65ec7dea828c..67d901ed2fa3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
@@ -31,7 +31,7 @@
 
 	leds {
 		compatible = "gpio-leds";
-		blue {
+		led-blue {
 			label = "a95x:system-status";
 			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index b46ef985bb44..70fcfb7b0683 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -49,7 +49,7 @@
 
 	leds {
 		compatible = "gpio-leds";
-		blue {
+		led-blue {
 			label = "c2:blue:alive";
 			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index 45cb83625951..222ee8069cfa 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -20,7 +20,7 @@
 	leds {
 		compatible = "gpio-leds";
 
-		blue {
+		led-blue {
 			label = "vega-s95:blue:on";
 			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_HIGH>;
 			default-state = "on";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
index 1d32d1f6d032..2ab8a3d10079 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
@@ -14,13 +14,13 @@
 	model = "WeTek Play 2";
 
 	leds {
-		wifi {
+		led-wifi {
 			label = "wetek-play:wifi-status";
 			gpios = <&gpio GPIODV_26 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
 
-		ethernet {
+		led-ethernet {
 			label = "wetek-play:ethernet-status";
 			gpios = <&gpio GPIODV_27 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
index dee51cf95223..d6133af09d64 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
@@ -25,7 +25,7 @@
 	leds {
 		compatible = "gpio-leds";
 
-		system {
+		led-system {
 			label = "wetek-play:system-status";
 			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_HIGH>;
 			default-state = "on";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index e8348b2728db..a4a71c13891b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -54,14 +54,14 @@
 	leds {
 		compatible = "gpio-leds";
 
-		system {
+		led-system {
 			label = "librecomputer:system-status";
 			gpios = <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
 			default-state = "on";
 			panic-indicator;
 		};
 
-		blue {
+		led-blue {
 			label = "librecomputer:blue";
 			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
index 420a88e9a195..c89c9f846fb1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
@@ -36,13 +36,13 @@
 	leds {
 		compatible = "gpio-leds";
 
-		blue {
+		led-blue {
 			label = "rbox-pro:blue:on";
 			gpios = <&gpio_ao GPIOAO_9 GPIO_ACTIVE_HIGH>;
 			default-state = "on";
 		};
 
-		red {
+		led-red {
 			label = "rbox-pro:red:standby";
 			gpios = <&gpio GPIODV_28 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 094ecf2222bb..1ef1e3672b96 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -39,13 +39,13 @@
 	leds {
 		compatible = "gpio-leds";
 
-		white {
+		led-white {
 			label = "vim3:white:sys";
 			gpios = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
 		};
 
-		red {
+		led-red {
 			label = "vim3:red";
 			gpios = <&gpio_expander 5 GPIO_ACTIVE_LOW>;
 		};
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 71cc730a4913..eb26da8f9cbd 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -104,7 +104,7 @@
 	leds {
 		compatible = "gpio-leds";
 
-		bluetooth {
+		led-bluetooth {
 			label = "sei610:blue:bt";
 			gpios = <&gpio GPIOC_7 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
 			default-state = "off";
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
