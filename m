Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5439CD98F3
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Oct 2023 05:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qo1VGVIbpgTJNc3dMz16jbSA7hIvBMC3mKVgrKiYJxU=; b=byh3S+bgsnu3mi
	7whepjTJvuMsakFE8EK/OZ+TyFwKcd8JclPddDGsAsHOO+FeGGNECr8hY8lMEyeA2aKuLUSTI1QAR
	wjHORKW8g31mFaXWwOsMdArp7CFxRnm5MeGo3+YbBNGwZv/GRMqRh67/s7xL9jguV9EVQmWJXAECL
	S1RglMjynayAV4spiGqWgWKKBf+h2vhnphPfAsZaVQBUKxB6wG37UCU4EO5dP6m4DA01KfaIF5RNu
	kOe2SAZpY6bVUIMgQ4ZEhdfggRPc3WwhmT0wwUGvwB6bMWt+CYc2bd5C2tqFX8fDvm6nHf25g9WU1
	b75AtzQmY/iCKogIZcBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqRWD-00Ep64-1o;
	Wed, 11 Oct 2023 05:12:25 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqRW9-00Ep4W-2D;
	Wed, 11 Oct 2023 05:12:22 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c737d61a00so51432005ad.3;
        Tue, 10 Oct 2023 22:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697001138; x=1697605938; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nigg6NOWWCn0hZudaM7Yq7CsxNtYAT49L0IXth0E2/M=;
        b=LJyBeoLwfFjBjeQIaAfqPDGEBp+1LucbljfrqnwENRF1tGu7+3qYbqemaY0gToCUvv
         4C4Xqt3nh2QxyHqoFOVu6zXZ3AP3Db4aNyYjI5YWkETVj9eZhu+DPbqrHhoQn6gtTfLB
         JCfNLadozxCe9bxOtpOMcRDOI1MpnWXVKqy8v8FL5289+ssz4QghTOyvvO5p1VR9qir+
         sg8DE5qcuI4h5mzC25O7yJkotMNL1F3dXrrL1wwx6ZWAXTgFuKMNgF8lbRmos+sEbnlF
         wCyaGt9fhRlq13nuk8C3qOkG8KnH8WBiyO6nd5J8rq+UDIB4tpKKopcAEQ/mBsZopPn1
         vTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697001138; x=1697605938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nigg6NOWWCn0hZudaM7Yq7CsxNtYAT49L0IXth0E2/M=;
        b=TSdzp5qGHiCcv74AL5HV9y7UGj393scRLBSye3gisD1WNMX4W0SVs2BfNI/eZ4DETz
         jztGt+nioApKeUaMCE+zNR4XzXK+Y/NiBAXilQnRSEgXlhlE5EwPBZphLqHs/rAny2dE
         JQQexbWJ2yKA/Jm07w0UKKo5VGMH7pb+Sy5rNM24vgjettyGSNc08wVNg+uM3X4A3+Y0
         tmOXkwYANtAD1x3KdCH722fe7CCGi1MRDmRPXj2YrRoffDP+BZFnmsp3yQmJC28wb+SV
         93hV1VcCOHc9hSuce9ydVOYc76wBWHlRvToeIlMuS+OtGOXDDQ/kX5Ka2WusmRMCIRtt
         mrHQ==
X-Gm-Message-State: AOJu0YxUJdnT+41K9f9PhmiL0vbRHufZgRRGRCjGunZXPFu8+U55sspq
	i2v/Qd9DKjxGy4bg7sTHo4A=
X-Google-Smtp-Source: AGHT+IF3hPtVKNWgsn+MppgNKK1gYtLzV1soJc7B8Z4A5P2rhn/x3scK7LQNx53no261s3rHWSCI0Q==
X-Received: by 2002:a17:902:e749:b0:1b8:76ce:9d91 with SMTP id p9-20020a170902e74900b001b876ce9d91mr26018626plf.1.1697001138105;
        Tue, 10 Oct 2023 22:12:18 -0700 (PDT)
Received: from localhost.localdomain ([49.205.243.94])
        by smtp.gmail.com with ESMTPSA id u13-20020a170902e5cd00b001c5dea67c26sm12777083plf.233.2023.10.10.22.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 22:12:17 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: amlogic: Used onboard usb hub reset on odroid n2
Date: Wed, 11 Oct 2023 10:41:49 +0530
Message-ID: <20231011051152.133257-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011051152.133257-1-linux.amoon@gmail.com>
References: <20231011051152.133257-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_221221_723702_FF92B7BB 
X-CRM114-Status: GOOD (  16.91  )
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
v2 no change.
---
 .../dts/amlogic/meson-g12b-odroid-n2.dtsi     | 36 ++++++++++++-------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 91c9769fda20..9e671444eca6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -31,6 +31,30 @@ hub_5v: regulator-hub_5v {
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
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
