Return-Path: <SRS0=3nIP=FZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382E5C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Dec 2020 18:13:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4FA522D08
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Dec 2020 18:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4FA522D08
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vRDoedb0rOoVasB7iMQ33MtTincy53IzSBVqDaWAsTU=; b=vQOdtxqWT8ZcyrIq17XKrVVO4
	s5PVCrl9TQZrQ0tG+baNK9mkxG6xoh8Zp+r/aiGMyzbu6y34Qlc7CzuYFxahmvrhtedubzfpEgojy
	h6Tru1bzccG+nFH2NP9Sqtkl0bErw8prFiuxDSE6BQJzW7MLK4RyESei8KKPoaywpff9/K2C/pqEU
	82L6E/qscuTr/gZsAwgVEfKoAT0Yg5tqIoknrBxBj1bdzM5P0MHtA/rtNf4no/FStcBNnTdTy9FgZ
	3N8o/dtvoXolK+wKHJDOmrYLW9lS2zZKGiAUhPeHvJxOyzEEfmtuYSLEr22dPHhoOKWg9uhHwA2qx
	DGFB5lWyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krPgs-0001v0-3p; Mon, 21 Dec 2020 18:13:50 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krPgk-0001rd-65; Mon, 21 Dec 2020 18:13:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id x22so10710547wmc.5;
 Mon, 21 Dec 2020 10:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zBG38fqf3nkMjryFRLlDYpQKv2p+mxjnCoJD3PtsF7E=;
 b=pyq3hcgB3dqgN6x6iV8m3tKTuu97ztx1JRM8yRKUY3g7PoBWX+j7RZznGGHPZL8YNq
 FtMPrxMV525KDwWzwG5uS2fGNchjwIg6tNEa9NEVGf8Y2es+GQJ3N7BwvjmjxGhmkM8c
 D/c1FKPsHfTNHbX3LS8dEZnOMp7cVxrwO8nbXMdpjub5Cj8w9JXHKf28pyjro59UywH7
 xKy3Qq6XIkXJVQKS84Vm6lBC3KM5YegQVuln3UYlWEMQ3pKfmAnSs0PFRwAMhjoRIgJ8
 sHsETo1+4kwmuU1jNdUlbCPY8H0RDOFH/JmrWUk8zcLgx993sOTlGMBRe7ICvf4rRgAg
 LuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zBG38fqf3nkMjryFRLlDYpQKv2p+mxjnCoJD3PtsF7E=;
 b=gtuEl65XT3ZniKIEn54d+pcgBpoRjGBbk7NRe57t/AVwvyOELaa0wj0WAWgEMQGYzl
 kaKPH4R2BXWSYAWNW5n7YH9k+DUzXfhyugqjULDofS3I54CUW6jMo6S+jhPXPGMwWzQ/
 DFNvfVUXjBNGadGzRRBQvR0JLVu8uptfrp2htsox+8vp2ei4K/XeV9siO40meHTeT8Z8
 mOvQ7j7otvoyAlL+ZPPMYXQ2saLm9gfpi8zEYjxGH4RxOT9rK9/7MwyApiyL8zVi+k7Y
 PzJEtAWu1Ho8zB0XloTV/Vant39gjm3puF3HqaFR4HWKutkCrjn/hOG+lA7IxFRNS/9F
 uStw==
X-Gm-Message-State: AOAM532dFXZZsGCJCsO4Nx0OeHOKrughdaN4RG6KvLQGHcJPJOXCct85
 Jbzixw8OQgJvSta9TlqaTY6fjBqkM4o=
X-Google-Smtp-Source: ABdhPJwS7jYu0jsAngYbml49mXApBSnIpKpO60xi05KFbIF1ikmaTorH5qXetfn0BLYr0yTfuS8sqA==
X-Received: by 2002:a1c:1bcc:: with SMTP id
 b195mr18075018wmb.131.1608574418715; 
 Mon, 21 Dec 2020 10:13:38 -0800 (PST)
Received: from localhost.localdomain
 (p200300f137019000428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3701:9000:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id m11sm23434936wmi.16.2020.12.21.10.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 10:13:38 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 1/5] ARM: dts: meson: move iio-hwmon for the SoC temperature
 to meson.dtsi
Date: Mon, 21 Dec 2020 19:13:02 +0100
Message-Id: <20201221181306.904272-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221181306.904272-1-martin.blumenstingl@googlemail.com>
References: <20201221181306.904272-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_131342_276183_1F2D40B7 
X-CRM114-Status: GOOD (  14.74  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The SoC temperature can be retrieved from ADC channel 8 on all 32-bit
SoCs (Meson6, Meson8, Meson8b and Meson8m2). Move the iio-hwmon instance
to meson.dtsi instead of duplicating it in all board.dts.
If the temperature sensor calibration data is missing for a board then
iio-hwmon will simply not probe.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson.dtsi              | 5 +++++
 arch/arm/boot/dts/meson8b-ec100.dts       | 5 -----
 arch/arm/boot/dts/meson8b-mxq.dts         | 5 -----
 arch/arm/boot/dts/meson8b-odroidc1.dts    | 5 -----
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts | 5 -----
 5 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index 7649dd1e0b9e..5f074f7aa1a2 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -11,6 +11,11 @@ / {
 	#size-cells = <1>;
 	interrupt-parent = <&gic>;
 
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&saradc 8>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/meson8b-ec100.dts b/arch/arm/boot/dts/meson8b-ec100.dts
index ed06102a4014..8e48ccc6b634 100644
--- a/arch/arm/boot/dts/meson8b-ec100.dts
+++ b/arch/arm/boot/dts/meson8b-ec100.dts
@@ -70,11 +70,6 @@ gpio-poweroff {
 		timeout-ms = <20000>;
 	};
 
-	iio-hwmon {
-		compatible = "iio-hwmon";
-		io-channels = <&saradc 8>;
-	};
-
 	leds {
 		compatible = "gpio-leds";
 
diff --git a/arch/arm/boot/dts/meson8b-mxq.dts b/arch/arm/boot/dts/meson8b-mxq.dts
index 33037ef62d0a..f3937d55472d 100644
--- a/arch/arm/boot/dts/meson8b-mxq.dts
+++ b/arch/arm/boot/dts/meson8b-mxq.dts
@@ -27,11 +27,6 @@ memory {
 		reg = <0x40000000 0x40000000>;
 	};
 
-	iio-hwmon {
-		compatible = "iio-hwmon";
-		io-channels = <&saradc 8>;
-	};
-
 	vcck: regulator-vcck {
 		compatible = "pwm-regulator";
 
diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 5963566dbcc9..c440ef94e082 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -85,11 +85,6 @@ tf_io: gpio-regulator-tf_io {
 			  1800000 1>;
 	};
 
-	iio-hwmon {
-		compatible = "iio-hwmon";
-		io-channels = <&saradc 8>;
-	};
-
 	rtc32k_xtal: rtc32k-xtal-clk {
 		/* X3 in the schematics */
 		compatible = "fixed-clock";
diff --git a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
index 8f4eb1ed4581..fa6d55f1cfb9 100644
--- a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
+++ b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
@@ -45,11 +45,6 @@ button-function {
 		};
 	};
 
-	iio-hwmon {
-		compatible = "iio-hwmon";
-		io-channels = <&saradc 8>;
-	};
-
 	vcc_3v3: regulator-vcc3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC3V3";
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
