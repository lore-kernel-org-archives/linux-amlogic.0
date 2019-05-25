Return-Path: <SRS0=XJ9a=TZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16C6C07542
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 May 2019 19:02:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74A1D20851
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 May 2019 19:02:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fF6AO9OW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="KMnJSlAf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74A1D20851
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k0J4PgAEkmgcf1FZulnnT2cp/qJza0CxQX13eA7LXTs=; b=fF6AO9OWZJQrYw
	O32QsyMofux3U/vo7MBAKf/TernVn36b/QWBLfuKoy8uBvR08crpArEUmZWZ7BUBxaRBbqJnYM9st
	BJl2OMAEU+UfvCOtUyVYqv+gfGDO5FofMyp9ZKVvbzU+oRQmQgGH8+f2FeD8r/cfB9GIdeC7wMrth
	S+92vbS3pcsr5ndRx6V8kIaSrv+DFxa87GpcQD9iMqdYT5LIMXWU6Sb+PMdmFQpbiqAHzGXiO/aGB
	A38KoItvvjT0RdzU0Hw/7H8vPzSt2f6g8DpD9g0Tb8A80dw+yvS/TztedgBBVVQjIRawzqBs8szqU
	hgfrnoYIFry8hVk8LhVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUbwD-00022m-Bq; Sat, 25 May 2019 19:02:37 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUbvp-0001VS-Uw; Sat, 25 May 2019 19:02:15 +0000
Received: by mail-wr1-x444.google.com with SMTP id r7so12993825wrr.13;
 Sat, 25 May 2019 12:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hkt/Np1IRlTONH5ji7tqTfAwm8WEpSqR1gunLTp9R3E=;
 b=KMnJSlAfrtHVE6bAvSaTeQUHkXq8tF6jYakZK4zjQScDZc3QKks15L7mb+Ns/SVAka
 YkrjQkupgUS9S3Uzkz0KAuMAASnIINJS/CCnVociy3kPErHETBV2AE8suTQijp9hc/Lg
 BDBMWIUtrxBCHHbrCXuW5kSysGkh61CnuWpIG4zTY5cnviL0TveHQA3Xo21v8P//dxDi
 sDZ8H1DC72sGCh/J6bjE7xQPsBd3h+JmvgNt0fEzYaM2pOQ7DHwm/JoA6E9o9tfXvF7n
 5W8Cgt75fi0ux4rDNdbFg/E+Q5PrSMdzPiv5Nrif1L4FLAwT49Bdo0uPLFyV4+PlZVcA
 dwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hkt/Np1IRlTONH5ji7tqTfAwm8WEpSqR1gunLTp9R3E=;
 b=mnUNzEYGsb5k89xqxGFv+GJpsqGt1bE5MZ58Wbhw8Au+oE0S6mIj1S97zpTdOjkS1n
 mg7Gc1YFPcAO1t3Yy7rzAoMY9vgvZtwReC9m3cxdl13nUZ2+Q/277DhiKSAWJDglLERA
 YB5J9zx2oAEz5YREyP7ym78s31bF6OKdk7ZRAVOCwIiO93Bj3sb/DPvHzQMdD6Ts4ZSC
 NJrHMqgB4D4UK7aHY0K8dfy7VpTQWwIKDu6DGTTYHHrFU/sZ8pRvL4lCZj3kjjbS4yIj
 Vrw5xupCZYxHchZkDtKpiLE3/UJ23hjaWKqdzn8jHSuQwrxrJmUjk6naCoUiINlvfMy3
 9Xfg==
X-Gm-Message-State: APjAAAUtV4QkFkipICLhJYIhWBNy9VA/CTLoOKxjxV4+lHPP8CfJmNqh
 Dzlibll91BasgoKZoF6GOazdCR7z
X-Google-Smtp-Source: APXvYqw/Y4OHw3xenTNmXBR12kuloK8/8HdBN0u9xdKRZykPGp047t6EkSAFYhXJLYS+ZGKxiJpo0Q==
X-Received: by 2002:a5d:4e46:: with SMTP id r6mr68767055wrt.290.1558810932149; 
 Sat, 25 May 2019 12:02:12 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA4007CB8841254CD64FD.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:7cb8:8412:54cd:64fd])
 by smtp.googlemail.com with ESMTPSA id f2sm6870426wme.12.2019.05.25.12.02.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 May 2019 12:02:11 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 2/4] ARM: dts: meson8b: ec100: add the VDDEE regulator
Date: Sat, 25 May 2019 21:02:02 +0200
Message-Id: <20190525190204.7897-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190525190204.7897-1-martin.blumenstingl@googlemail.com>
References: <20190525190204.7897-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190525_120213_992130_13CB9E15 
X-CRM114-Status: GOOD (  13.54  )
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
index 9bf4249cb60d..61a1265064dc 100644
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
@@ -268,6 +289,10 @@
 	};
 };
 
+&mali {
+	mali-supply = <&vddee>;
+};
+
 &saradc {
 	status = "okay";
 	vref-supply = <&vcc_1v8>;
@@ -349,10 +374,10 @@
 
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
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
