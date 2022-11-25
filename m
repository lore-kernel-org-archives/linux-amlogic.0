Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE07C43217
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 14:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YAawMxwFGCm6qdKVEaztthHUfg1W9jjUnBfRA1boTks=; b=KAAM270zFNc586
	wLpKg1LEmQQ0yRnyUTLoYW1W+VNTN3UhqTUGgk50vRse+YVVO2fKBg4G/azD0+Am/LaNdys3PBKcd
	XnbJUG0OezSBUffEnCVj/bTNUs5LzWPapybaZkU8US5/y8QE8lglxuE1zrinpAt81afK7wMXw5jC/
	9JNpmiO1jvvT3WGHmoT9zsHqBmMaW9KggRNMT2LbvlIybRNNmcboKKnfNigXpAih8lbtlW43Sf2G3
	CkSAX6OGHF98kwL2iOkTH4UnBzCdtVSl+/DKJWuU6/3A66+8xVVgewrBOZ1z+Mj5TBCsvJ474W1rl
	Vn+phIc/PRqdJ9b1Ga3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZuP-00H8oh-Tr; Fri, 25 Nov 2022 14:42:29 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZtL-00H8LR-LI
	for linux-amlogic@lists.infradead.org; Fri, 25 Nov 2022 14:41:25 +0000
Received: by mail-lf1-x135.google.com with SMTP id g7so7206928lfv.5
        for <linux-amlogic@lists.infradead.org>; Fri, 25 Nov 2022 06:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JYPGPhbKSDD4Yi3yKcSWtqL4ohr93TEPpG/GOA7tSMs=;
        b=zCxrDg4KzZC+Q++QDQvHJsB9LqFNwiu+Lu8BJUSHO1CL6NruP6KeKeWVVG5N2Ba1yF
         0eBnn8mHCpKBNAbfSUy65JiYOVO6PHJc+N/zqlq641+hzXA1BwLbKBDhZ4Ih/jGHi6nE
         qS2M6qXusvBlVrvERbCLxfj33hDbLu26Jv75GejqIrSDMuLODpaBzebKSSYyxXSV0PZt
         kPVDnMvUEqkX3Mb6AHjLjfjAulx1pkWsv7z+TZUN0igSa+7dcDqhO5yHt2Ov3J5aEp59
         XekZcDDHDzGHFvYAAzfEN643JeKnhIc173hJhg3R9MvHCa23YRx5X9GtY7ovHA/ASf8Y
         rnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JYPGPhbKSDD4Yi3yKcSWtqL4ohr93TEPpG/GOA7tSMs=;
        b=3+iq2+VAmPWtWA7phddvWl9g1folwlq2YI+tHZXxcuKYmhMw9cJZekPTtKnJStIP0V
         Z7cVNubtADNm5RnF0W3iJBLRqD+tvQbVebzpFdxvElwnU7Ng5sNXneGMyuD4aHzWdEno
         5P7kTmaYdluCQlTtqXYQkYc3/HNxhfv6L+b25iG24YjVC1oTIHUOfoJp1rsbyzsM5/a+
         9v/IfntC7hlN74L8hPnf3dCE8qseK7fN564EOUAIqk89f3bRHtsCrX8XwYRHJUxTAEa5
         uU+Dq2Ouw0q4HNt12ZQX1snPJvvD97QYaLt8LgEoSVVS8FMbs+dpI3mJixEB4ahURo8x
         np5Q==
X-Gm-Message-State: ANoB5plJt5FgZTzyaeSkNTydbsfk8RyvVmwtoZzsKZqTymlzT4ivIpa4
	/GSg40wD63u2Pm6bdXzqp359vw==
X-Google-Smtp-Source: AA0mqf7psPSJLNiKBUVKlkpJa5oB0/UKp3ZhlM5uP2H+JThneQXMxRTa4AB5zQyEQ32XmPqYxl8xVw==
X-Received: by 2002:a19:4319:0:b0:499:b108:947e with SMTP id q25-20020a194319000000b00499b108947emr12557043lfa.143.1669387282048;
        Fri, 25 Nov 2022 06:41:22 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s11-20020a056512314b00b004b0317a1035sm548617lfi.109.2022.11.25.06.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 06:41:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: meson: align LED node names with dtschema
Date: Fri, 25 Nov 2022 15:41:20 +0100
Message-Id: <20221125144120.476933-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_064123_719711_800A76B7 
X-CRM114-Status: GOOD (  10.40  )
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

The node names should be generic and DT schema expects certain pattern:

  meson8-minix-neo-x8.dtb: gpio-leds: 'blue' does not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/meson8-minix-neo-x8.dts | 2 +-
 arch/arm/boot/dts/meson8b-ec100.dts       | 2 +-
 arch/arm/boot/dts/meson8b-odroidc1.dts    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/meson8-minix-neo-x8.dts b/arch/arm/boot/dts/meson8-minix-neo-x8.dts
index 56ea875c418c..c6d1c5a8a3bf 100644
--- a/arch/arm/boot/dts/meson8-minix-neo-x8.dts
+++ b/arch/arm/boot/dts/meson8-minix-neo-x8.dts
@@ -27,7 +27,7 @@ memory {
 	gpio-leds {
 		compatible = "gpio-leds";
 
-		blue {
+		led-blue {
 			label = "x8:blue:power";
 			gpios = <&gpio_ao GPIO_TEST_N GPIO_ACTIVE_HIGH>;
 		};
diff --git a/arch/arm/boot/dts/meson8b-ec100.dts b/arch/arm/boot/dts/meson8b-ec100.dts
index 77d4beeb8010..3da47349eaaf 100644
--- a/arch/arm/boot/dts/meson8b-ec100.dts
+++ b/arch/arm/boot/dts/meson8b-ec100.dts
@@ -73,7 +73,7 @@ gpio-poweroff {
 	leds {
 		compatible = "gpio-leds";
 
-		power {
+		led-power {
 			label = "ec100:red:power";
 			/*
 			 * Needs to go LOW (together with the poweroff GPIO)
diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 04356bc639fa..73cdfe855689 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -34,7 +34,7 @@ emmc_pwrseq: emmc-pwrseq {
 
 	leds {
 		compatible = "gpio-leds";
-		blue {
+		led-blue {
 			label = "c1:blue:alive";
 			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
