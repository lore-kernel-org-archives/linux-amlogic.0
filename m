Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD915C32793
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 04:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LI24Q3iHhcZnLot3cTB4+AbGKbXLgjfsMQvCdPk+kCs=; b=Xfo0fsO6v+v9xY
	nAVmFZUh47QQDrLY3uaFhkxIoBWFdq4xUqGTwi8qDs023M5P+gZ4BZayBlV847OmzEVRDYO1aH1zN
	WWs7wDo2aJQmgneDc83x22JVLcvP4DAxxDKVN1jJakMsd7096qkCTYnTKIEpOHTYWnHDLVC5dLM8B
	+fRObLKbwYi/zfpDcugdbpsilLo4C0bpXWpm/DKoFeU/1fdrR+sQzTPq4oa/9P75f562qNGSdGbva
	j17WO2w+EmJgguKu3FO7Jcm37HljAggLtIRrKl/Zk5yhT0uzS6FzscL3XNS7F2Aug0XUJ5SQ8PGe0
	ATrCYVxgdyRF0g1qmDng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI0Jd-00Gsuh-Nz; Wed, 18 Jan 2023 04:44:49 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI0Jb-00Gstb-Ts; Wed, 18 Jan 2023 04:44:49 +0000
Received: by mail-pf1-x429.google.com with SMTP id c26so20822613pfp.10;
        Tue, 17 Jan 2023 20:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOZIHycE9J4e+QjHg9b0KwNQ3/76PPTpjk62HfVA/Y0=;
        b=OJuw6le0pCCAULCnT1UzwWJNBacWJkKrbd/NOWxdmdIpKeNJl+KuBpxAJU0lhgAj82
         Az+VloMvKZMSNoSLxnVhk0DnG82GaMNSnGvd7WyDZFNrY1sElMr5KZaaiT7JcbZzBEDI
         BGHaYwe2DPyRcLPpqGXdFJvu+ZPTxePpFogNXwsxAn9IhdhFkC2n/t8WejM1zSa79t7p
         9EPwmUdf0/xonjMwlTmZ/g6pAEYB1xHEHMyW2tvhOqpKVDBGnhqA5smuD4jW/MGOC1Yl
         RqWf8pGAckns4JS/9KHOacHQpNFuF1Q8/5dMzzYP1qQQLeTMzv6qfQ3KljxZViULmBcJ
         Brbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOZIHycE9J4e+QjHg9b0KwNQ3/76PPTpjk62HfVA/Y0=;
        b=OrXHpZ/va64TIcjc4cb2xUWTmyEvuLiLd9nfwWSdjT5ne20+ea2swSVkMnIs53/CDp
         JD6iOkkdRkReY7sDFYi2z6eFv9+WJAj7Np97ggI6dc3YJy8QI0vO8edVEDjEVWt4wS/q
         VVSsl1qi6sWcI6lkI7vOQUgGgCqc+E5Unv+d2oOeTT+LMP8EXQiXRedjlUHvbaWEwlZQ
         OxP50puBm7/Hsa1rBHxxlqnrwlHSrncJOgH+KiXFIFHwqXoGwW+LHwtHC5rr+SxYR2kq
         62dsHyKhsGtVWIe+B53iJaVHHiEWHntcf2LIYK2jc6bdGARX4ZpshT7DBpjo7GMSZpgD
         bi4w==
X-Gm-Message-State: AFqh2kpu2zHxFZy2z9DE6fWuKBiyduZC6MRCg+h+9lCwpeS3uaVcfv0z
	wk8W/xnJFLaEe/93g6/N/SA=
X-Google-Smtp-Source: AMrXdXvtjMCHbEKdsAUmKaxlXp3Tsvme02JBcCymuXFPHvzlJDaW/HcLu3W2EYIjcknflJ+yFESyFg==
X-Received: by 2002:aa7:9a12:0:b0:587:25ea:4fcb with SMTP id w18-20020aa79a12000000b0058725ea4fcbmr4641059pfj.19.1674017085950;
        Tue, 17 Jan 2023 20:44:45 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id i1-20020a056a00004100b00581a156b920sm8682770pfk.132.2023.01.17.20.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 20:44:45 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org,
	Matthias Kaehlcke <mka@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Johan Hovold <johan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/9] ARM: dts: amlogic: Used onboard usb hub reset to enable usb hub
Date: Wed, 18 Jan 2023 04:44:10 +0000
Message-Id: <20230118044418.875-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118044418.875-1-linux.amoon@gmail.com>
References: <20230118044418.875-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_204447_984318_408A1DC1 
X-CRM114-Status: GOOD (  16.66  )
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

On Odroid c1 previously use gpio-hog to reset the usb hub,
switch to used on board usb hub reset to enable the usb hub
and enable power to usb hub.

Add usb hub regulator as per the schematic.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v2 - drop the vendor name from compatible string.
   - move the hub node to USB controller node.
   - drop the usb_otg_pwr since it only liked to OTG port
     and link p5v0 to the vdd-supply.
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 04356bc639fa..d1f9ce4742a8 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -281,19 +281,6 @@ &gpio_ao {
 			  "J7 Header Pin 6", "J7 Header Pin 5",
 			  "J7 Header Pin 7", "HDMI_CEC",
 			  "SYS_LED", "", "";
-
-	/*
-	 * WARNING: The USB Hub on the Odroid-C1/C1+ needs a reset signal
-	 * to be turned high in order to be detected by the USB Controller.
-	 * This signal should be handled by a USB specific power sequence
-	 * in order to reset the Hub when USB bus is powered down.
-	 */
-	usb-hub {
-		gpio-hog;
-		gpios = <GPIOAO_4 GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "usb-hub-reset";
-	};
 };
 
 &ir_receiver {
@@ -381,5 +368,16 @@ &usb1_phy {
 };
 
 &usb1 {
+	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
+
+	hub@1 {
+		/* Genesys Logic GL852G usb hub */
+		compatible = "usb5e3,610";
+		reg = <1>;
+		vdd-supply = <&p5v0>;
+		reset-gpio = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_LOW>;
+	};
 };
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
