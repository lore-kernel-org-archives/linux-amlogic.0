Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A98C4727E
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 03:31:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38FAA21D20
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 03:31:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e7rDZXxN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p4dZ3wY1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38FAA21D20
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sUNtfDjgLcoj0iD4vVfSh66x3rscRRFcET4Uz7KCwKA=; b=e7rDZXxNi4umY/agZXMMLMBkD
	ug39KYM01ZwGYpjjZDoWngHLuYi0zsIrhyyEbBNObAppdUo+6v/4FYHlX3NZUAGG9s0TtD5UPJ0jf
	KTJAFtf9c1I0ueHpGom1ur8rItWGWv/9XPPTP56BBzaGTgZK0pXYm1XITqcC2zTXeFHOtM1PSHJRb
	RSwNc9vBGfeRxl23N9U7QKskZp2KZNfDlPKKsxSZx/avwEw2QzrgpWLSPUJPY7t8fPZBXy/32NCsQ
	mTTTryGgXsUxiAvGSsxGeq5UDpjY57AB373CKSxEkAXkbd1rhOo873k+rSASnBpBav+zDOXNTsvTC
	ddz8mLhOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLeS3-0000N6-Ey; Fri, 25 Sep 2020 03:31:15 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLeRr-0000IH-D5; Fri, 25 Sep 2020 03:31:04 +0000
Received: by mail-pf1-x444.google.com with SMTP id o20so1826681pfp.11;
 Thu, 24 Sep 2020 20:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nSaz4MqTuDEutLU7r90eZgbkIoIloYKwHEIwGniaOUE=;
 b=p4dZ3wY1+3U3OADTK1eiCunGeGuC5M2Pir6SNXQUNAwmVnHIRbBmjvJJEcwj/MQ7zy
 9yfZ1OAHRJPu2zTfoW1MVGlpu9wV/6mEbuiymQM7eU5xAtOyRg/041cN681X6K6BXDw1
 cM2AIhfec15vro6ioL4wXVdO4+vTgtcOSEQN345dlMM4MCW6IgLk9wEVARhctWwZ5nBG
 3JPhd2KdDDN2ULIsMk1YnUCMWjhD4YYCk9uIhcJ9MKUFerny/dykDVTlw7brFSb6Jh1z
 AZCpgT0gx6CfAMQJ1cpY+qIczcLm0Ci/NYD2kQghj9p9+GoBeuCgM7bkEx5FeHs5//MZ
 N4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nSaz4MqTuDEutLU7r90eZgbkIoIloYKwHEIwGniaOUE=;
 b=ipVmC5h5Ayv3gGTAlwYuoYi2JaPrfkEtue7GNmxApZyWjlUWp8Rri/H7Hnt+iPFoQD
 1I5s4UB522BzmNENvge77v1cezwZ3MjmacSC5qcXbgHaE4uWaylMXp/KBbtUxM3hiF7R
 9CfSN+WvwDcZpvJH0h9eOYvMpe/o1S8XhfyqCzssPZQiD0//R9pmGvPrpBlu69Pc6t9o
 8c8mgwcb8O8zZ5qmWRTL7ixIla7zk4hzT9S34UINhHjSBGB7Th3oiy2dYK2Uxy7hZNVl
 I6Q5VNrY29ClQXwkonyEkGBtbFMtENccAMVb29svPgvLq/H5Kefg6RUuq7w8wsF1+B+d
 PT7w==
X-Gm-Message-State: AOAM532fDOTHAHb7JAzkioZilQaSxiECUfsGS45Y9f/94UZPVs8U8wmv
 NDMMDDsELL3Bn9M1B6Y3lnE=
X-Google-Smtp-Source: ABdhPJwJChJg2OIZ6d58uvAiZLE9AJhn+xzsgErQmtOoAbRD31/UxYPWPv0Zi6On0/C11xoRU2sgSg==
X-Received: by 2002:a63:ff4e:: with SMTP id s14mr1769624pgk.137.1601004661436; 
 Thu, 24 Sep 2020 20:31:01 -0700 (PDT)
Received: from universe.lan (80.251.221.29.16clouds.com. [80.251.221.29])
 by smtp.gmail.com with ESMTPSA id o5sm571670pjs.13.2020.09.24.20.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 20:31:00 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Subject: [PATCH 3/8] arm64: dts: meson: update leds node on Khadas VIM3/VIM3L
 board meson-khadas-vim3
Date: Fri, 25 Sep 2020 11:30:12 +0800
Message-Id: <20200925033017.1790973-4-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200925033017.1790973-1-art@khadas.com>
References: <20200925033017.1790973-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_233103_469606_1E4B1C99 
X-CRM114-Status: GOOD (  11.16  )
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
Cc: devicetree@vger.kernel.org, gouwa@khadas.com,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

add aliases names led_white and led_red for white and red leds

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 73783692e30..7e137399257 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -12,6 +12,8 @@ / {
 	aliases {
 		serial0 = &uart_AO;
 		ethernet0 = &ethmac;
+		led_red = &led_red;
+		led_white = &led_white;
 	};
 
 	chosen {
@@ -39,13 +41,13 @@ button-function {
 	leds {
 		compatible = "gpio-leds";
 
-		led-white {
+		led_white: led-white {
 			label = "vim3:white:sys";
 			gpios = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
 		};
 
-		led-red {
+		led_red: led-red {
 			label = "vim3:red";
 			gpios = <&gpio_expander 5 GPIO_ACTIVE_HIGH>;
 		};
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
