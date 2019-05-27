Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C9FC04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:23:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA1CD2075E
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:23:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XCiHL4v2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rxyG/Xbx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA1CD2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=59WWT19i3R47ri7XpqJw8weCO1ht0Hu9321XStiOAUI=; b=XCiHL4v2uw6mMN
	eXN4p0SLeZjaS5yl/ywRCINzOehUTDmRr7y3ptwoOrFSHsPMwzPAfRSEF3oKvEcQIKogBR13MLRex
	qVYJJPaeLNQqXXNlQa5+2Qv6ZKP9L3Q78f0vZ5gA409jZMIKsW6t7Xk875ZSkqqPrzTUHuSvMtMK7
	5wUDth3+EM1YVM5f9ZRGZsUPBiu/KECWN4lOA+nOeDX1Ib1j2nCJrfVmrHfX53kETilHVQIeMJKOh
	2WC95srVY21XBzclXO1YA8VuPaFDDy/f6mtKmmlkVqrPPMNTYjTp8EmrKSQt1qb7+QvwU1IJLhP7e
	hUZUNq3Hte+59u+3ccsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVFar-0003P6-Af; Mon, 27 May 2019 13:23:13 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVFZo-0002AS-9J
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 13:22:14 +0000
Received: by mail-wr1-x442.google.com with SMTP id h1so2789342wro.4
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 06:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B15kJiNx0gB5GZgy154+cF2VY43Rpy+WChAQDJEB4z4=;
 b=rxyG/XbxOY9xO0y8sz7iyV/GR+qomMOMyrjb46om9LbLfzHg+biOdo3QrM6hV19Wye
 2RDnWMDDZXA2XaWC+ixE+k79juVBbkN9/GqFFk/x/Nyyr3G3l8ALH3meaEZAotFvrElm
 BPz7tcSanuoSSu60aB755pCVvWBjgcaxfQWa6kWkVk5Nffcn87IzYwzFZYZG9Pm1bU5j
 zdDsKtxX9Db3wfQTAPOE0KjSNjwhQzXlnDmBL4WOpgVJA3LUOWcscEeM3ooZUKWnfr4J
 b+aa7hPn5TEA9MxVjJk6ZTUeKFZx6AJn8AhKbnC9ij52i6wQdgCZ3yKUiVzyda02xbom
 dIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B15kJiNx0gB5GZgy154+cF2VY43Rpy+WChAQDJEB4z4=;
 b=pXVShABJZWy2Fu2ZahH96byu7Vw2Y2zUtDGnwZUJ16Can/sOO+4f3Mevve4h4Af4GO
 KOvNtInZI8ctLrXN0ms7k4NiSsF68u+WyptBe+ebKBtNsIg51S7h0dcdXqCUe7+o+ybZ
 Pr7Yk5nJWwW+bqqH9u8DESChQrWvamKoQzcIHIfvpt+6TV3Z+QfjlfQCiLaSvUAq2XKm
 LoW9Y9Ga6TJot7Z2DqOd/D2l2HB5rIyKsibjZojUr3ali9js5ZINW3qtnva68JK4Xoek
 7B9Al4eDuO9++IhUi1WSQF+oY9hddwXMOyLUL/lW07oA+lV3mS2w6BTa1L82rkKp2G5k
 LrVQ==
X-Gm-Message-State: APjAAAUCtzX47vWTGa5/uk+6wx1pAHfZL9IbkRjR3z9Rk0XUB2DYAdSA
 Le1Vopnb5jm149QAYV0bAV4Srg==
X-Google-Smtp-Source: APXvYqwNQZvfpu+TITjMJMn64RyU9BPmMPPPawWMAjqT5Dub5Vb5xePuM97dcekNw6lWKErVTVOkFA==
X-Received: by 2002:adf:e30d:: with SMTP id b13mr58410891wrj.246.1558963326793; 
 Mon, 27 May 2019 06:22:06 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id l12sm7019836wmj.22.2019.05.27.06.22.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 06:22:06 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 05/10] arm64: dts: meson-gxbb-vega-s95: fix regulators
Date: Mon, 27 May 2019 15:21:55 +0200
Message-Id: <20190527132200.17377-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527132200.17377-1-narmstrong@baylibre.com>
References: <20190527132200.17377-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_062208_631904_EAA16FB8 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, christianshewitt@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Align the regulator names with other GXBB SoCS for upcoming
SARADC support and SDIO/SDCard fixes.
Also fix how regulators are passed to MMC controllers & USB.

Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi | 34 ++++++++++++-------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index 623bcb6594b1..760730d4e87b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -28,10 +28,10 @@
 		};
 	};
 
-	usb_vbus: regulator-usb0-vbus {
+	usb_pwr: regulator-usb-pwrs {
 		compatible = "regulator-fixed";
 
-		regulator-name = "USB0_VBUS";
+		regulator-name = "USB_PWR";
 
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
@@ -40,18 +40,25 @@
 		enable-active-high;
 	};
 
-	vcc_3v3: regulator-vcc_3v3 {
+	vddio_boot: regulator-vddio_boot {
 		compatible = "regulator-fixed";
-		regulator-name = "VCC_3V3";
+		regulator-name = "VDDIO_BOOT";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	vddao_3v3: regulator-vddao_3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
 
-	vcc_1v8: regulator-vcc_1v8 {
+	vcc_3v3: regulator-vcc_3v3 {
 		compatible = "regulator-fixed";
-		regulator-name = "VCC_1V8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
+		regulator-name = "VCC_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
 	};
 
 	emmc_pwrseq: emmc-pwrseq {
@@ -133,8 +140,8 @@
 
 	mmc-pwrseq = <&sdio_pwrseq>;
 
-	vmmc-supply = <&vcc_3v3>;
-	vqmmc-supply = <&vcc_1v8>;
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddio_boot>;
 
 	brcmf: wifi@1 {
 		reg = <1>;
@@ -156,7 +163,8 @@
 
 	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
 
-	vmmc-supply = <&vcc_3v3>;
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vcc_3v3>;
 };
 
 /* eMMC */
@@ -176,7 +184,7 @@
 
 	mmc-pwrseq = <&emmc_pwrseq>;
 	vmmc-supply = <&vcc_3v3>;
-	vmmcq-sumpply = <&vcc_1v8>;
+	vqmmc-supply = <&vddio_boot>;
 };
 
 &uart_AO {
@@ -187,7 +195,7 @@
 
 &usb0_phy {
 	status = "okay";
-	phy-supply = <&usb_vbus>;
+	phy-supply = <&usb_pwr>;
 };
 
 &usb1_phy {
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
