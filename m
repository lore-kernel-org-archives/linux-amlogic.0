Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF579C27C76
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 14:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=olYv6M6bLrtRZLVcn2GKLXtCfS1iI2DjJuXTcMC6RGY=; b=Cckgwzx1rZYcGt
	E412DEXa9htbZFuu7h2DWn6usw7LSIF2mXQ5/tC/A+nNkiXO15tTZrrIw3g+XpNKwPKQ0vvHiIg5I
	pPFLoj6DBQdkonrqJNxae3gV3XRJIwYwzvVARQQOEGh0FIEAcvz0NLf3N8NlbM5SWo+6l0TsRPPBV
	l4Vvt7a4N/CG6ICAtnMx2+QJ2gLy9ZjOmpbTDV7FuPUhTkskkIL8jwt3L3Qkq+E2+PHvr1G8t4eas
	7+trcqKifv38f1sbDcrClluFE2mV602pujd7AqdXGBUqMRKxVxBbQlA4s9YC6QIrZtUIAzLsfiVCQ
	nx5hSVQEAzT3hjb0oxnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgrf-007ZLV-Pt; Wed, 25 Jan 2023 14:35:03 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgrH-007Z9D-7o; Wed, 25 Jan 2023 14:34:40 +0000
Received: by mail-pl1-x634.google.com with SMTP id a18so5491113plm.2;
        Wed, 25 Jan 2023 06:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uUEIUXRT9q9lHy3kc8AWUGd4aWNpn7Eo0QlIhJUhEE=;
        b=bbLfdOAYTTbyGy3Pjn2l/V+nZL0/zc7m7ILa4+blFmAhwL0yBtgJevoY97wMdAyHWx
         KAXNp1M4yjLcZT0x+EFujMqyCCIPgTxyKKtQLnzNKaq6pntp6UBHqosiUJRrsHk2OhsV
         sdmRSmrhNNC3qeACPMKFtC8PRmrft/M/1DnB8MNqtIacKcaJojZEFwOqCzXbzj6D4B8D
         dlSSLltt3F998561RLYxPqPgPR02HWJv3M7Ui3XpSKTlNFpUqMSr1agbwAm8up2kI5B/
         4OLjsIgs9XP+RMYMkJAPK1Pay/bfVgEfXHxjbsxeYVjK/Vbl3wAD4H+lAHwjJwenKV0o
         E++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uUEIUXRT9q9lHy3kc8AWUGd4aWNpn7Eo0QlIhJUhEE=;
        b=nXSkx9+MRdjwrAkxssz0eI6BYOfxYuSmw5RSUxz6aKLPUtSM+isr1fwr/1l1gDjNsX
         iBRDUv0DUCQWAj8BhK9HjXe7VPYMdMcu3g6VpcMKSlf8x/y9tLNUurO8t2qjo1DmfGOz
         3s60qWSe66e9VI6BJXXnEHmYblVedZ6/2isuCZVSYocpUguuqZiwvrydFCqMu/ESCgSP
         JYQNxaSHxMgX60KrVBkwMTAVHUWoBK50gKeCNbBmEvFh0mM86OtpQKW/YbE83uUmMjz9
         3ZrwwMFNS1kIsl7hNROUq9vcVlXvsexd+ioJfAxxsZWy+ekXcczAXMX3SkLxR4XbQw9u
         e+mw==
X-Gm-Message-State: AFqh2ko54cU64sdy77yruu8hUuKA7FQ1toKKhILfLYHefGpX1c0fqALt
	M1b0J+DwW27gbivcQ1QLRkw=
X-Google-Smtp-Source: AMrXdXuPaax7cW0zR8SleapPgK1Xc3MqA2CnRHvd6tNBi5TlrQ1FsAi02NbRNP6wV+CScodvylHOjA==
X-Received: by 2002:a17:90a:160f:b0:228:5b99:3b45 with SMTP id n15-20020a17090a160f00b002285b993b45mr34241546pja.7.1674657278370;
        Wed, 25 Jan 2023 06:34:38 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id c2-20020a17090a1d0200b0022c033f501asm1671465pjd.41.2023.01.25.06.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:34:37 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND linux-next v4.1 3/4] arm64: dts: meson: move usb-hub node under dwc3 node on Odroid C4
Date: Wed, 25 Jan 2023 14:34:02 +0000
Message-Id: <20230125143404.1424-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230125143404.1424-1-linux.amoon@gmail.com>
References: <20230125143404.1424-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_063439_303311_9077F90E 
X-CRM114-Status: GOOD (  14.02  )
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

Move the usb-hub node under dwc3 node and drop superfluous
dr_mode as it is the default in meson-g12-common.dtsi.

Fixes: 71593b2020b3 ("arm64: dts: amlogic: Used onboard usb hub reset on odroid c4")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 41 +++++++++----------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
index d04768a66bfe..a988015dd2d5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
@@ -26,30 +26,29 @@ led-blue {
 	sound {
 		model = "ODROID-C4";
 	};
+};
 
+&dwc3 {
 	/* USB hub supports both USB 2.0 and USB 3.0 root hub */
-	usb-hub {
-		dr_mode = "host";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		/* 2.0 hub on port 1 */
-		hub_2_0: hub@1 {
-			compatible = "usb2109,2817";
-			reg = <1>;
-			peer-hub = <&hub_3_0>;
-			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
-			vdd-supply = <&vcc_5v>;
-		};
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* 2.0 hub on port 1 */
+	hub_2_0: hub@1 {
+		compatible = "usb2109,2817";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&vcc_5v>;
+	};
 
-		/* 3.1 hub on port 4 */
-		hub_3_0: hub@2 {
-			compatible = "usb2109,817";
-			reg = <2>;
-			peer-hub = <&hub_2_0>;
-			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
-			vdd-supply = <&vcc_5v>;
-		};
+	/* 3.1 hub on port 4 */
+	hub_3_0: hub@2 {
+		compatible = "usb2109,817";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&vcc_5v>;
 	};
 };
 
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
