Return-Path: <SRS0=qynV=NI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947D9C4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Aug 2021 04:17:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C22960F14
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Aug 2021 04:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C22960F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTXmBx3XaFZGwQtiqAPZ9kdUQZyETZ54Jj4UMQEyOY8=; b=ac2k9COiCOaT7q
	syVjB8cxhqu8BPhEwBVMtin3wFBDoR2e7CevAuncRCAxrk5x3wWEm5mtx+KlBv2k4gHAoSsXisXLA
	9LX1btUwD9E1DPbnDwItZFs9eoQyS83351BcOMXltGqtFvPzQ/CggGSKFEhsJ5h5l8gEm+sNjUMD6
	lx+pnZxKAXPEi2OOzi95ytlUwJig843yhzmDfQgCOdeSrj5i3SyAe7OEOOkbrygkkZEsRyjQNfU4V
	4eWx6/yom5h5lEN0wHePUnntrzIM1WHvH6l7Fc0c6qN7NAF2K6evdvwKl1IyvTmDe63NMHKHiU5jU
	Oadgg7pIaDSD9pkEa4wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFqXs-00155v-VF; Tue, 17 Aug 2021 04:17:48 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFqXe-00152X-Oa; Tue, 17 Aug 2021 04:17:36 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso2776673pjh.5; 
 Mon, 16 Aug 2021 21:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aFbf5MZvdHne2nfZzSqkqs09pAcRMOYPxHTfv7PVwSk=;
 b=gIdDzzrbItxf9RBdIOJGtF1f1VKiW5B81efUiKJIM5vqEKjS7oaj8l2DsTlGL6NhFS
 pN/dDl8WnWH/0KBbCXmvvTm2SddGx/fi9o4bYMqTNuBg9Ok76Q6NlhRXy+SeVZZjWyYj
 ljxtinJfGm1kAVJfWKWy7PsHuLQNAwKxD6ao0wignJAajpAehmE6Yzb0CdrjH75Bd6GS
 D6UQhDQ2Dz+/zTz1ANlr8RcyT9oA4J2vRwP7MEeGOGiA1go4rEy2kpcCJXjzdh1A/Qwt
 +dc+xZVLYZ40/Y1RAreCe+c2Yr/kMk2vQoql/JX3TYrqGDzpO9Dv/YWUWb7+mTBsaJ3b
 12rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aFbf5MZvdHne2nfZzSqkqs09pAcRMOYPxHTfv7PVwSk=;
 b=AZWB4lU2Mao+KZpsuPRIYzMssFPjAchIsEKbnjhLUTw/NqqxJ0GjCPZFzWMIXETG1p
 8f1j5EOVNNmZPQ2obYULFHB8hnHylhn3GrB1cENaFN3IcFq03oUEF5nf6VRQOcLifXFK
 ToUhK7dQnGYi2Dyd59D4nHaB/uSJzDGVfDgXh81yi3DGAprfDcqdh2N5ejoWd7AZZZZx
 MFoBbM9QIpQ1xbsP7zGQ6uruig6kdog9xUYp8V/k7vzA3KImBPE7FP7xqsQMh8mRfbrJ
 xx2B//NhcWrOTYMBwb73hLB+JWKV8/mxwKe31SpDTVPSxxOT+TR5R1KLCoj8sCnFONyO
 J+Cg==
X-Gm-Message-State: AOAM530clSVEtYqzQb/b7mm3hT1gG6xXJywXMuvAGgtPvGkOIjyf1Jc4
 +LKqvYT+3KUJoEjs8UppyQSVhWQUpphgXw==
X-Google-Smtp-Source: ABdhPJwUmgJHOYZGmqb7CZ/IPnyklBdcoU5GSH6oVqioOWLbpzvI57uFAQR+YepvUxw6cA9JFgqcEA==
X-Received: by 2002:a17:90a:9308:: with SMTP id
 p8mr1457358pjo.119.1629173853769; 
 Mon, 16 Aug 2021 21:17:33 -0700 (PDT)
Received: from archl-on1.. ([103.51.72.143])
 by smtp.gmail.com with ESMTPSA id g11sm705676pfo.166.2021.08.16.21.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 21:17:33 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Brian Kim <brian.kim@hardkernel.com>
Subject: [PATCHv3 1/6] ARM: dts: meson8b: odroidc1: Add usb phy power node
Date: Tue, 17 Aug 2021 09:45:35 +0530
Message-Id: <20210817041548.1276-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817041548.1276-1-linux.amoon@gmail.com>
References: <20210817041548.1276-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_211734_843307_06936E78 
X-CRM114-Status: GOOD (  13.18  )
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

Add missing usb phy power node for usb node fix below warning.
P5V0 regulator supply input voltage range to USB host controller.
As described in the C1+ schematics, GPIO GPIOAO_5 is used to
enable input power to USB ports, set it to Active Low.

[    1.260772] dwc2 c90c0000.usb: Looking up vbus-supply from device tree
[    1.260784] dwc2 c90c0000.usb: Looking up vbus-supply property in
		mode /soc/usb@c90c0000 failed

Fixes: 2eb79a4d15ff (ARM: dts: meson: enabling the USB Host
		controller on Odroid-C1/C1+ board)

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
V2 > changes gpio polarity ACTIVE_HIGH to ACTIVE_LOW.
     Fix the source power from phy-supply to vbus-supply.

[1] https://lore.kernel.org/linux-devicetree/20210716103651.1455-2-linux.amoon@gmail.com/

V1 > Fix the Input GPIO polarity from HIGH to LOW.

previous version
[0] https://patchwork.kernel.org/project/linux-amlogic/patch/20190113181808.5768-1-linux.amoon@gmail.com

changes fix the vbus-suppy to phy-supply, drop enable usb0

    USB_PWR                       2    1      0 unknown  5000mV     0mA  5000mV  5000mV
       phy-c1108820.phy.0-phy     2                                 0mA     0mV     0mV
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index c440ef94e082..30ec6a7f20c7 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -32,6 +32,23 @@ emmc_pwrseq: emmc-pwrseq {
 		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
 	};
 
+	usb_pwr_en: regulator-usb-pwr-en {
+		compatible = "regulator-fixed";
+
+		regulator-name = "USB_OTG_PWR";
+
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		/*
+		 * signal name from schematics: USB_POWER - P5V0
+		 */
+		vin-supply = <&p5v0>;
+		/*
+		 * signal name from schematics: PWREN - GPIOAO.BIT5
+		 */
+		gpios = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_LOW>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		blue {
@@ -119,7 +136,6 @@ vcc_3v3: regulator-vcc-3v3 {
 		regulator-name = "VCC3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-
 		vin-supply = <&p5v0>;
 	};
 
@@ -382,4 +398,5 @@ &usb1_phy {
 
 &usb1 {
 	status = "okay";
+	vbus-supply = <&usb_pwr_en>;
 };
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
