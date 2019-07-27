Return-Path: <SRS0=e4TN=VY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADBAC7618B
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jul 2019 12:13:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E1512086D
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jul 2019 12:13:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n0jNAoWq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="EQ90Eqq2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E1512086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kmLZFaaVq/C7X29bx/W8peQTUXSnazyk/FjovKMMEZ0=; b=n0jNAoWqdQ41Jz
	clWh2NPWwT7CvwcLNP6yFa9MOuku/8dZOZgyjcW0fnt4FN4yLhN8Ah3O2X/2fqmP4t7cWjN5MTZgr
	bqAaRHuoQteh+9w5kt64z1C1kxh3hMqs7PBdpdzkaYiNj96cKuOrzNxsuCqJ6r7fpH0u7orGv9ib9
	O+93NX1Spb9BY70kc/UxCzqfV8BZ8aD2cCe1TuV9tytjhJyftwz0k1KkQjoEWyhcAmRAzAXysaI7M
	EkqRQSf1lkjJSimKeYObo0scpcaoyaL+DY12RVpYCDTxhbZARMQm0xk0yUfbe0X5IowM+3gTkc5qI
	xa1U/QEa0GcauTSrNn2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrLZw-0001nI-Cv; Sat, 27 Jul 2019 12:13:36 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrLZS-0001Dh-T0; Sat, 27 Jul 2019 12:13:08 +0000
Received: by mail-wm1-x343.google.com with SMTP id h19so39734670wme.0;
 Sat, 27 Jul 2019 05:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zjlCoClPn+D5FtsYbuSMIRYDvq5CiGUidcCupd7dJ90=;
 b=EQ90Eqq29nsB2bd9Ao/E9BDvc34M6m2OUORIMOGkQInOkxt8F+vZTze3ALhPN5U//z
 5qZBaZBl0IU8hJ2gVN9KoZUdQAJyXmclk/HW3+ofk3eSJ2D6fBbtiaHaSWVdCZ4Qi/Av
 l4RpXo7W6Sbnp0CXOPaTF5oB5lopksyqVTJRzoBhzMmyZURS2Nh2VIzThcxLAXao3rmr
 O3VCe4SngwbQ/Fu0F6YnPW+zpQ5iy2Pci0LOX5czlku5Bst/8Wx94aPop6LCYzYr6p2P
 dDVieoEWxHr+pTdw7DHK1YdGBtL2d/KywrovVKbCvqk/Xa1cuZAe4Rj1o8YXoSGjPDcf
 y2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zjlCoClPn+D5FtsYbuSMIRYDvq5CiGUidcCupd7dJ90=;
 b=t4CoBQ2L82cgYtnmGkeo1Y36aTKDmrXZNUFXj7PG8gBERcpvmzGcZL7r453Cp+80Vs
 +Mi5coeKQSsQmP7zQzaSh43TwITltvnQr1ygLcCZd3ory+EQYKtog7OwOlNw752A75Od
 BTZqCPP+pQ3xgMwsEXGqA4Ww6Ajw47m+ih/EmVFMz+CNS0ZmdngEGP29mQI+jnQ8L3g/
 Z1NkhOLYZUDhR2LC7hBFNQdo3eRMua9SEEthNJkWMKjR7ncSiabrZyQmYKsJm017J1z9
 aoD4jXy6IKn54vMgyaDPHg7g4tgzB+bbtNKIJRGsaNQ8acOIJHEks/9lXr29fc8rmzmU
 BHFA==
X-Gm-Message-State: APjAAAUx4GQuzOw7W1W1Hbq8rIlqCKZQd1NMvWvKm0aCOEusUCER3T1s
 i9YelfkuLZVbKYMlJTQGQLyHWTD3
X-Google-Smtp-Source: APXvYqy+qq3YOx5KKzeDY893qKSGWhvt8/1aA0TqVr6FY9sy46M3iJUKGQzpmPYsEiqOHSu6EZKLJw==
X-Received: by 2002:a1c:acc8:: with SMTP id
 v191mr92720425wme.177.1564229585104; 
 Sat, 27 Jul 2019 05:13:05 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C65C00B418D0F4A25A19EC.dip0.t-ipconnect.de.
 [2003:f1:33c6:5c00:b418:d0f4:a25a:19ec])
 by smtp.googlemail.com with ESMTPSA id
 o26sm111786569wro.53.2019.07.27.05.13.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 27 Jul 2019 05:13:04 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH v2 2/4] ARM: dts: meson8b: ec100: add the VDDEE regulator
Date: Sat, 27 Jul 2019 14:12:55 +0200
Message-Id: <20190727121257.18017-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190727121257.18017-1-martin.blumenstingl@googlemail.com>
References: <20190727121257.18017-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190727_051306_931049_D401F939 
X-CRM114-Status: GOOD (  12.63  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The VDDEE regulator is basically a copy of the VCCK regulator. VDDEE
supplies for example the Mali GPU and is controlled by PWM_D instead of
PWM_C.

Add the VDDEE PWM regulator and make it the supply of the Mali GPU.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b-ec100.dts | 31 ++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b-ec100.dts b/arch/arm/boot/dts/meson8b-ec100.dts
index 96d239d8334e..bed1dfef1985 100644
--- a/arch/arm/boot/dts/meson8b-ec100.dts
+++ b/arch/arm/boot/dts/meson8b-ec100.dts
@@ -219,6 +219,27 @@
 		 */
 		vin-supply = <&vcc_3v3>;
 	};
+
+	vddee: regulator-vddee {
+		/*
+		 * Silergy SY8089AAC-GP 2A continuous, 3A peak, 1MHz
+		 * Synchronous Step Down Regulator. Also called VDDAO
+		 * in a part of the schematics.
+		 */
+		compatible = "pwm-regulator";
+
+		regulator-name = "VDDEE";
+		regulator-min-microvolt = <860000>;
+		regulator-max-microvolt = <1140000>;
+
+		vin-supply = <&vcc_5v>;
+
+		pwms = <&pwm_cd 1 1148 0>;
+		pwm-dutycycle-range = <100 0>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &cpu0 {
@@ -269,6 +290,10 @@
 	};
 };
 
+&mali {
+	mali-supply = <&vddee>;
+};
+
 &saradc {
 	status = "okay";
 	vref-supply = <&vcc_1v8>;
@@ -350,10 +375,10 @@
 
 &pwm_cd {
 	status = "okay";
-	pinctrl-0 = <&pwm_c1_pins>;
+	pinctrl-0 = <&pwm_c1_pins>, <&pwm_d_pins>;
 	pinctrl-names = "default";
-	clocks = <&clkc CLKID_XTAL>;
-	clock-names = "clkin0";
+	clocks = <&clkc CLKID_XTAL>, <&clkc CLKID_XTAL>;
+	clock-names = "clkin0", "clkin1";
 };
 
 &rtc {
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
