Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3E5C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:15:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AF4920870
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:15:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AsNFkkPh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="unWjUbO6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AF4920870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E6TN6ZRV0JYRp3YM1behxZu1k4Xto40WcwqwguFAl/c=; b=AsNFkkPhRMS52J
	8KUO8tAaXANqcHFsuIlCMU2DSauDRJ3IFbfLVNZ/i7pfoJe03ApVYDSBrkZhnOdMAvFHiiduUxZ+J
	GeGGtJf0X2EYImOzz+W+UDxN1RFArLYbDob8HcwRpPLXyUczPn54b46+3XCZYL/JkzReq9d02CXdk
	FB83Cm/M2A/78logUMh66KcKbiTGNWUNaC0V2tIh8QiKBR4cMhp+JWkDNnrkqFD2VyaG7JtPfe/NT
	vOmw9bB8ezPoGKZZiB4HzsEqJmJDjE+HTslB7H0PzEp145N75FiG2bTPV3fESpBGwq9RVcqNUDCW8
	K7X2yyVawhVZc3NzpdBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8Mdt-0002q2-PS; Mon, 25 Mar 2019 10:15:45 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8MdB-0000k8-5Q
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 10:15:09 +0000
Received: by mail-wr1-x444.google.com with SMTP id y13so9417786wrd.3
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 03:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eoab4q66SflsReoALbDgKiwEnwXi2XyBPYUBOHzp7t4=;
 b=unWjUbO6Ch2azEZc1/BUGuIJ+na9DBHks1DS8GwWQ51NyxdemjvbXVxyCybM3PnakQ
 4QYXOGQMQtW2EPekXAkW0dT1/YNNwP0SoaVIesX6POMy452VERFF4/Fw0aYdVUv+l0jK
 95+WtExEX3n6P347bN0lF8SlDA94VmuU3TSyAR4ATJrZJY9e3vJe0BUocidw2iJR6bOA
 kkrwxBY2NS8HqcDEyeLGBGxinBDC+6B8eyUBfE4C1DTBJ4rRjkmSxtpX04W7g+1T3THv
 LPlrsjIMwAhxCRq/PQZCkkJnQpbCDxoWxB1uFW3ZfvA9bmTo3iMsOFQ2GlX7mRrlwljJ
 4eBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eoab4q66SflsReoALbDgKiwEnwXi2XyBPYUBOHzp7t4=;
 b=RHcFV577gJ+17jwMYa31amSUUaFxZT+N3U8ziNNxEHZVT4RXVySuoZT0k0RqCxJ55h
 o6mPMbsHZEGlf/EzN66qaX32vJY/AttCzsp5dCRU4HkPr+75NPBGfAN8E5zwM/LKO/R3
 5wP1CzAHJ7ToibdMi/K3ycNx91rshUvmDLPMUD/DbXbgBG/QaeWtJelUBU0ReQ6MnEV1
 wuhKWmssFe7lbntBrFURfRa5+PgB4vxhUHtmMJ/Y0NL/anxL1euBPDP/UC1VotDoj9lQ
 BWQIYoeCgubVz/KqCkPDMU8TPeflvCQAlwqYJAHtJiIxGlOoUMZB48RAgf6z6lnjbHqs
 NzcA==
X-Gm-Message-State: APjAAAU7cd6XHv3j4ff8spHZinoB/oYqJ7pDaOgrHoedd8ZhC6gfhF8U
 mS8XDqvE8xhgVYuXKBI5X+31wQ==
X-Google-Smtp-Source: APXvYqxkiZKmgF6aN+zHudSL0A7vUghhhzuSPZ6F7zd3zPZQwakOVlt++fn7s0EgmJs5W6hGjUsrWA==
X-Received: by 2002:adf:f101:: with SMTP id r1mr4984471wro.251.1553508898985; 
 Mon, 25 Mar 2019 03:14:58 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v14sm20049484wrr.20.2019.03.25.03.14.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 03:14:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v3 3/6] arm64: dts: meson-g12a-sei510: Add ADC Key and BT
 support
Date: Mon, 25 Mar 2019 11:14:50 +0100
Message-Id: <20190325101453.3009-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325101453.3009-1-narmstrong@baylibre.com>
References: <20190325101453.3009-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_031501_806352_210CF464 
X-CRM114-Status: GOOD (  10.44  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for the :
- ADC Touch key
- Bluetooth Module on UART A

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../boot/dts/amlogic/meson-g12a-sei510.dts    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index 43d57e20294a..ebdad5a192f1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -7,6 +7,7 @@
 
 #include "meson-g12a.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/meson-g12a-gpio.h>
 
 / {
@@ -17,6 +18,19 @@
 		serial0 = &uart_AO;
 	};
 
+	adc_keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+
+		button-onoff {
+			label = "On/Off";
+			linux,code = <KEY_POWER>;
+			press-threshold-microvolt = <1700000>;
+		};
+	};
+
 	ao_5v: regulator-ao_5v {
 		compatible = "regulator-fixed";
 		regulator-name = "AO_5V";
@@ -87,7 +101,23 @@
 		vin-supply = <&vddao_3v3>;
 		regulator-always-on;
 	};
+};
+
+&saradc {
+	status = "okay";
+	vref-supply = <&vddio_ao1v8>;
+};
+
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
 
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &uart_AO {
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
