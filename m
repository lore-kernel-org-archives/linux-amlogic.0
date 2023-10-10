Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14289CD68E4
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Oct 2023 03:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ztRjlwk9ZEEOF7hZAMncNKYS56AIRuAGxTTKFOK/KB4=; b=HQv9249Vk8iNSe
	yHpOEIsA3eqa5tT4iEPTgl6cV8DbNYi6AxoOGK9n+YhrDrTu6n6YsB2xWyaX0ooQnFyarWFLwpoVo
	Aose/+MiysW1Vu9fs4CX7yEkERWJ963OLXv/GpzeVAw1I5XxwbGVR3+t1MyQlnR8o6muoPJ2mGVFE
	wVLn0TnMq61fMz+cZZ0pkB6FGoS3O3MNBL/cUj5g4NKriQKrHpu0wRkpzAtZfNP5Dz75pAoT8hoKH
	/WY2y8lvCc9c/lVETHXcDF5H0l3Zt9ZamW4UEuBCttmhND/qW/JrhuUblNnLSnId51LVj9qVFnZuH
	Y80zX6R6fuKRh2+LbfbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq3Mv-00CDUd-10;
	Tue, 10 Oct 2023 03:25:13 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq3Mr-00CDSL-2a;
	Tue, 10 Oct 2023 03:25:11 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-692eed30152so3820316b3a.1;
        Mon, 09 Oct 2023 20:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696908302; x=1697513102; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+t8tXe6ccmmDxngyTtST79lozTn11v8rTEVF91HUREg=;
        b=J3f9T2pTBJb+dwxA9/evxHlOkBP2D3LH6qaVMbOEHoY7YI8FreeviTd6NlzP3yF6GV
         QuQfjM4R+JcmcFoA9HEGlrcWJKpL8TnpAvJBwu2xqjsvD2IL6DibDD7GUv0MXEQN/73v
         A5Mz7Z4Y9ISnrE/EKWIi4wRh0YcK7U6a7Y6XL3/JhbKJAbr0NBBboMZIro8Apn6bxB4a
         /AqtY4rIrVmKNPy6qiJFHIxbqs72neiFyJr1Dd+n0zmZnmXETzVIP9pgCtLsztVyUKTw
         Rmtkja7jDF7Ha2g8SfLrSr6IjfhLwPnWg65OuVlvFifSPdTS8tPwE8pFB8H5WPRGM7kO
         ICAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696908302; x=1697513102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+t8tXe6ccmmDxngyTtST79lozTn11v8rTEVF91HUREg=;
        b=NgKMzXPSY9woNuOkGiJW56cL7OmJHz5pSVJukNwfGeexacXb+5QwB6wD3t4t2sVU7c
         rQ2pWGDC5i7838EOh3pQvzKrR6E4Mh6REtcfP2tHOBDlNlbKIT7Ki06k/ByBqf6zxLWK
         zBrabKP4tQM7zl9QDOfGX/Ij12s045kBElSj4dAlaId0jfi5KIpPlrtuJa2yujMtQCxW
         daUv09S50mFBlakfA+dfZxzdXJZCPK5e4W1m19QhV6cGDS6TULOkUEQJKg8EsW+g4UI0
         VoU4WJQFl+MUP4oHJ+zZ7BgR6Hk2cRlwac0cTjgjCETVHZJrdZxLcZqG8/zBk6i/w+aB
         t0bw==
X-Gm-Message-State: AOJu0Ywj61KtIS0QjPhFoG3lyCd7AN3SAd30AdEMxg6r+jB0UUTxKkvO
	2o7Md2VkFrEacpcAU7RJ210=
X-Google-Smtp-Source: AGHT+IEL8ecO+HWvFjZFChLjSmGujXLE1GhBRWwD35P3NWAIekKYEDrLkkZ+63uXO2us0bKMFodICQ==
X-Received: by 2002:a05:6a21:3294:b0:16b:8572:5a4a with SMTP id yt20-20020a056a21329400b0016b85725a4amr10166460pzb.61.1696908301825;
        Mon, 09 Oct 2023 20:25:01 -0700 (PDT)
Received: from localhost.localdomain ([49.205.243.94])
        by smtp.gmail.com with ESMTPSA id c16-20020a62e810000000b00690f662a1cbsm7053851pfi.0.2023.10.09.20.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 20:25:01 -0700 (PDT)
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
Subject: [PATCH v1] arm64: dts: amlogic: Used onboard usb hub reset on odroid n2
Date: Tue, 10 Oct 2023 08:54:43 +0530
Message-ID: <20231010032446.3194-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_202509_857461_79901467 
X-CRM114-Status: GOOD (  16.56  )
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
