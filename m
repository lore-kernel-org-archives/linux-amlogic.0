Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92383EB64DC
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jun 2023 01:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vfjc7JX80OvD6ZfDq1tAmzlzxNAye2WAMznNWD/Rwoo=; b=uExhywQCHSxmkX
	8rah0igZcm6NcKc+Ls2QQJoMtg04SE9pTPT0tkZX4mo3RzSIl+wSoZK7WYnOfFIa5EnM8eQemBiuV
	IGhCVwpD7NQygOeMFsxPtiAJ6/0NEMV6etwk+YdI+a301bbEOzm98uJpac49/pDS0Y8rd0IEMptTd
	fZNBUIuwhw7oskZWxvqYlXyfJzhQYvwbRSGTTuGfVpr1lX3mc1IvCNizieNkSmsMGEnzaOHQMOykn
	LqzDMgTjUuUm5bXitqwdHrDKeJY+c0owMkBaAvvZHKyeMUOCz1ML3rMTnGoC4BpTY0CCNWcwCQTIo
	6/y0wHbslGebcxKmosMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEggk-00HGMq-1x;
	Thu, 29 Jun 2023 01:43:14 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEggb-00HGKC-0U;
	Thu, 29 Jun 2023 01:43:06 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3a36b30aa7bso129404b6e.3;
        Wed, 28 Jun 2023 18:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688002984; x=1690594984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQVTjdj6R0O33JrX4xkaOPdKxSIQjrzX3EEzQH2s0Vk=;
        b=pDKRiJJlgBe4sN/3o6EQ4K9yZzpGzSdILGCbYh8Wahba1JD6GZg9xrJXIKE8uf/m0V
         syrNcXnmM6QxZOFXwLLP9rua0hXLTYfI3I9RRNPKG0WtTfF10MYGN+FvrRAPuGqo+0Mp
         AUQssIg9pSb/0r5NMGrxKLVpW0CNnWbJ93gKFdvFoTW7ZCFR7yZ+5X9e0oxlD+lvg1/A
         xbTRDXGLR7thD/NoPgZOETtiHpNfwg2UTJasOGG9wVDU4r9A0YEHXkfobC+YcwegO4V/
         BKpi61OUOW/eRaZfiZvocW0BBS+M877/5WvNag3J7P2rsuRT/HNsK05DuR0PeszTbJXy
         ltMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688002984; x=1690594984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQVTjdj6R0O33JrX4xkaOPdKxSIQjrzX3EEzQH2s0Vk=;
        b=R3Q9mqkjDataQkKmGMFf0ZO2XCQ30GPDMCrp2qLLmOuxAGpfob/arhThFZ0DFuCD9U
         rHxg9HC51ZPDwdv9TxCBoJzbUXyjYq7I2VW27xXCdbcEC5ms1H6Zhk24tYMw6hw/Tvnp
         CEEaiwU6QbHQQNQabFHgoypNKYwNq+DWvcOVLz6ohCUTKaefxFIUZMo2p8u2lom1JJcq
         Ucs6g3ju/e3DWuvFaYruLjKwl8lG52iIjZ806DR+IQMHs9ai+Oc+f0sYMybL+ezV669+
         0t0VkLQU5azh7kcLSbiWb5MWxb9wpIpKBWJSxyy8/H7kzJjVyktJ09dvR3u8Cc8fev5n
         6STw==
X-Gm-Message-State: AC+VfDzQFtNF10fMdSElB6cDbErRfK6X6WIdd4Yq0E0DDvkuBDGSEooN
	Ox81Elmij2uL6/xhqqdR42M=
X-Google-Smtp-Source: ACHHUZ6SRDH4l7iQxdbln7GcYeMzKcfDOXKin1gI7C/kNxF6648WRZ7CSVOC4XaL6RZHdly0u+DI0Q==
X-Received: by 2002:a05:6808:1691:b0:3a0:492f:b05f with SMTP id bb17-20020a056808169100b003a0492fb05fmr24378831oib.58.1688002983602;
        Wed, 28 Jun 2023 18:43:03 -0700 (PDT)
Received: from anyang.. ([106.250.177.234])
        by smtp.googlemail.com with ESMTPSA id m7-20020a17090a414700b00262d368b220sm7707123pjg.40.2023.06.28.18.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 18:43:03 -0700 (PDT)
From: Dongjin Kim <tobetter@gmail.com>
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
Subject: [PATCH 2/2] arm64: dts: meson-g12b: reorder device aliases
Date: Thu, 29 Jun 2023 10:42:52 +0900
Message-Id: <20230629014253.2007625-2-tobetter@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230629014253.2007625-1-tobetter@gmail.com>
References: <20230629014253.2007625-1-tobetter@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_184305_191475_D9B872B8 
X-CRM114-Status: GOOD (  11.04  )
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

This patch is simply to reoder the device aliases.

Signed-off-by: Dongjin Kim <tobetter@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts          | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts            | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts         | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi   | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi       | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi         | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi           | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index 4fb31c2ba31c..1e98ca09af4e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -29,8 +29,8 @@ button-onoff {
 	};
 
 	aliases {
-		serial0 = &uart_AO;
 		ethernet0 = &ethmac;
+		serial0 = &uart_AO;
 	};
 
 	mono_dac: audio-codec-0 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index 4b5d11e56364..826a490fa3e6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -14,8 +14,8 @@ / {
 	model = "Amlogic Meson G12A U200 Development Board";
 
 	aliases {
-		serial0 = &uart_AO;
 		ethernet0 = &ethmac;
+		serial0 = &uart_AO;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index b2bb94981838..ddaa51efb8dc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -15,8 +15,8 @@ / {
 	model = "Shenzhen Amediatech Technology Co., Ltd X96 Max";
 
 	aliases {
-		serial0 = &uart_AO;
 		ethernet0 = &ethmac;
+		serial0 = &uart_AO;
 	};
 
 	spdif_dit: audio-codec-1 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
index 97e522921b06..b4a38b2eeaaf 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
@@ -8,8 +8,8 @@
 
 / {
 	aliases {
-		serial0 = &uart_AO;
 		rtc1 = &vrtc;
+		serial0 = &uart_AO;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
index 83709787eb91..23c262ce16aa 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
@@ -12,9 +12,9 @@
 
 / {
 	aliases {
-		serial0 = &uart_AO;
 		ethernet0 = &ethmac;
 		rtc1 = &vrtc;
+		serial0 = &uart_AO;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
index 29d642e746d4..4bcbda5df867 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
@@ -17,8 +17,8 @@ / {
 	model = "Hardkernel ODROID-GO-Ultra";
 
 	aliases {
-		serial0 = &uart_AO;
 		rtc0 = &vrtc;
+		serial0 = &uart_AO;
 	};
 
 	adc-joystick-left {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
index 9e12a34b2840..707c1c560d30 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
@@ -11,9 +11,9 @@
 
 / {
 	aliases {
-		serial0 = &uart_AO;
 		ethernet0 = &ethmac;
 		rtc1 = &vrtc;
+		serial0 = &uart_AO;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
index b40d2c1002c9..a9b95f328620 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
@@ -14,8 +14,8 @@
 
 / {
 	aliases {
-		serial0 = &uart_AO;
 		ethernet0 = &ethmac;
+		serial0 = &uart_AO;
 	};
 
 	chosen {
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
