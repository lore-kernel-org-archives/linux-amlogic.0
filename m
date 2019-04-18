Return-Path: <SRS0=/MY2=SU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 665FFC282DD
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 12:28:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EB0F2083D
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 12:28:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t2fnjtPE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hL8n26ae"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EB0F2083D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BRp+NmpB5VXa9WEmrka6xVTJDhwklAjA9Lc1YquEEE8=; b=t2fnjtPE0NkfBr
	uas8bvNE+6Odb0WxG+OnSuAWiscqKZSOAv/lmLn1vEW+UxI5k99ZceXbl1fRW2Ehty9VpCZZUuDRW
	cQ9oDOcVmfM2IBSEaauz2xXKYj/eIt2MZRRRin7+9qSUkh2XxbhRzySZTlb748VePg+qzvs4LtuBV
	jnDHVDZ0MV/BLkz92/XRO6hxYCIHJdTGL9jg/Mpr29UX3gUjRTTzgGyvwxwKPARPE/L2zOfUQRnvC
	fkWpM1WJZ5X1bRjsbIZlkXyK6T/I/4I3l4snHFcUDmcwtHbOMbkHPTn4y53o/uOIGXC2OK+6CDIvW
	yLRpdF1zcTqd7H3AUbpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH69k-0001xU-Kd; Thu, 18 Apr 2019 12:28:44 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH68Y-0000QS-AR
 for linux-amlogic@lists.infradead.org; Thu, 18 Apr 2019 12:27:35 +0000
Received: by mail-wm1-x341.google.com with SMTP id o25so2535813wmf.5
 for <linux-amlogic@lists.infradead.org>; Thu, 18 Apr 2019 05:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r/KHPhCyo/i9fFtJl8kxXo82v7RLLCe/0uJM5mRwBhY=;
 b=hL8n26ae1xCfJvBWjrzOctGEIPekWegTBkl5uOX35rLmcoHt1irSDvQJkvrCLQ8j40
 65YEGT/N2xcFHZf6iuAZihJKg4XDIKgj0cQfl+bKmVkQ9ompUjvd9Q7sCYD9UQtGklt/
 iDayy7lw42GxBdGDCo+tN03cNG/3fLbkH7hMU7+BMZ709j4DPcByDQ1Zw6Wx2COgtsnm
 o9F2VkCBt6dhZ+ztzyF0UAI2Hg4VWvpEWSlv7pQPUK8f+qle2vAxkQwSkHv2y2pGvVXn
 oD9RljWkxlbztXh6c0o2Pn8kKAoOw+xpS5lWZu00Sb9HCu5ingwR7u/EKCk2qV8MwDF4
 BT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r/KHPhCyo/i9fFtJl8kxXo82v7RLLCe/0uJM5mRwBhY=;
 b=GksX02LBsgV5IseIobQDH6XdfOeSWbXhRQPjLXTZhtjUeBRvRBsfbFoGupm2YUxVB2
 NEpaDGUtf4Yg7xCyqyiMobSVhEyVLccaKycb6lN3rYMVM3C8v2/+IU614NPBdTs1ZPGD
 Dydo4IZ72JIl6SgbtxcUp8oC2ZJHMJ8VwXZEaHb8z1T69xRYsRvZA3BQsG1+6sVVswGP
 AUNlM3kti3Iv+A5Lmr2wAeII7bIbGpcWyZjmHMB5WcaL82lsezRVVK5/Z3Q9+uX91Wyn
 pyzNHjJiVVuucD3pqYqnXvSMjBhrekmlmGErTCe4hpGZ8VX+emt/iQWaa9npmmQAWh/j
 1a0w==
X-Gm-Message-State: APjAAAVuWXJh4Dw8AUcXwH02vox20b3PlRxJR/f3+4JOjGvZhTWSIbKZ
 sw1CSCAtnQvdIjMI7NTUSjRdyw==
X-Google-Smtp-Source: APXvYqxOpX5NV1u66JQhM1CG5NcRPdKkJdr/2ZYZnOFWEjEYnUr0nPt9jqFxGhq3eoGM2q2Sn8D5yw==
X-Received: by 2002:a7b:c3d7:: with SMTP id t23mr2875088wmj.62.1555590448565; 
 Thu, 18 Apr 2019 05:27:28 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z14sm1510110wro.81.2019.04.18.05.27.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 18 Apr 2019 05:27:27 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 4/6] arm64: dts: meson: fix mmc v2 chips max frequencies
Date: Thu, 18 Apr 2019 14:27:12 +0200
Message-Id: <20190418122714.30805-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190418122714.30805-1-jbrunet@baylibre.com>
References: <20190418122714.30805-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_052730_530676_66E603CA 
X-CRM114-Status: GOOD (  10.27  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

According the datasheets, emmc v2 chips (gxbb and gxl) don't support
more that 100Mhz in UHS-1 SD modes and HS in SDIO.

Align the max-frequency to 100MHz for UHS-1 and 50MHz for HS

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi          | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts         | 5 ++---
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts       | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi             | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi         | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi            | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts         | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts  | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi        | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts        | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts          | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts           | 4 ++--
 13 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
index 016641a41694..a9b778571cf5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
@@ -164,7 +164,7 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	max-frequency = <100000000>;
+	max-frequency = <50000000>;
 
 	non-removable;
 	disable-wp;
@@ -184,7 +184,7 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	max-frequency = <100000000>;
+	max-frequency = <50000000>;
 	disable-wp;
 
 	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index ade2ee09ae96..be81f8958717 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -273,7 +273,7 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	max-frequency = <200000000>;
+	max-frequency = <50000000>;
 
 	non-removable;
 	disable-wp;
@@ -301,8 +301,7 @@
 	sd-uhs-sdr12;
 	sd-uhs-sdr25;
 	sd-uhs-sdr50;
-	sd-uhs-sdr104;
-	max-frequency = <200000000>;
+	max-frequency = <100000000>;
 	disable-wp;
 
 	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
index 25105ac96d55..3c54f26eef15 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
@@ -235,7 +235,7 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	max-frequency = <100000000>;
+	max-frequency = <50000000>;
 	disable-wp;
 
 	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
index 0be0f2a5d2fe..e8f925871edf 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
@@ -165,7 +165,7 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	max-frequency = <100000000>;
+	max-frequency = <50000000>;
 
 	non-removable;
 	disable-wp;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index ad4d50bd9d77..623bcb6594b1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -126,7 +126,7 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	max-frequency = <100000000>;
+	max-frequency = <50000000>;
 
 	non-removable;
 	disable-wp;
@@ -151,7 +151,7 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	max-frequency = <100000000>;
+	max-frequency = <50000000>;
 	disable-wp;
 
 	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
index 2d2db783c44c..b0d74ab619b0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
@@ -183,7 +183,7 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	max-frequency = <100000000>;
+	max-frequency = <50000000>;
 
 	non-removable;
 	disable-wp;
@@ -208,7 +208,7 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	max-frequency = <100000000>;
+	max-frequency = <50000000>;
 	disable-wp;
 
 	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
index 70433e023fda..3a1484e5b8e1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
@@ -160,7 +160,7 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	max-frequency = <100000000>;
+	max-frequency = <50000000>;
 
 	non-removable;
 	disable-wp;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index b0f22cdb586c..4b8ce738e213 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -237,7 +237,7 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	max-frequency = <100000000>;
+	max-frequency = <50000000>;
 	disable-wp;
 
 	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
index 9cbdb85fb591..26907ac82930 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
@@ -180,7 +180,7 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	max-frequency = <100000000>;
+	max-frequency = <50000000>;
 	disable-wp;
 
 	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
index bc811a2faf42..e3c16f50814b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
@@ -114,7 +114,7 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	max-frequency = <100000000>;
+	max-frequency = <50000000>;
 
 	non-removable;
 	disable-wp;
@@ -134,7 +134,7 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	max-frequency = <100000000>;
+	max-frequency = <50000000>;
 	disable-wp;
 
 	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 3f086ed7de05..27beb813015b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -329,7 +329,7 @@
 	#size-cells = <0>;
 
 	bus-width = <4>;
-	max-frequency = <100000000>;
+	max-frequency = <50000000>;
 
 	non-removable;
 	disable-wp;
@@ -353,7 +353,7 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	max-frequency = <100000000>;
+	max-frequency = <50000000>;
 	disable-wp;
 
 	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
index 25f3b6b14043..96fdb1856b7b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
@@ -144,7 +144,7 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	max-frequency = <100000000>;
+	max-frequency = <50000000>;
 	disable-wp;
 
 	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
index 7fa20a8ede17..3d499675c9a8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
@@ -143,7 +143,7 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	max-frequency = <100000000>;
+	max-frequency = <50000000>;
 
 	non-removable;
 	disable-wp;
@@ -167,7 +167,7 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	max-frequency = <100000000>;
+	max-frequency = <50000000>;
 	disable-wp;
 
 	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
