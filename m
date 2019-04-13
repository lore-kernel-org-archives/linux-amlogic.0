Return-Path: <SRS0=Clcc=SP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E1CC10F11
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 16:37:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66B68214D8
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 16:37:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xo1tKpck";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="r6QxrJ3R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66B68214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RrHlu2KTEtZBHgp0nwoRxLJfBsJskDMXN6xL3ZAMJno=; b=Xo1tKpckMmqVqb
	iF+H6SwlTHAXYoR1+59hnBNL6weaLhYFb/srnuZDZh8EkjL6C++p4jQuVPHhSbEGaSTLt6WY12+n3
	HjU/rZd/8iJi30BOWQpvxUWqeo5detxWeJXz9ev5oxdDN1aw3PmqoIBFmBX9B6Xm38QxTYlO/wVNb
	LmY6AgWyWjcWQSKOIn/RMUMP6c06lIlp2yzhdyADMB29DBWBCpTZlJaUueQQNWgFqThEuW6E7vUqe
	HciGSoRuRYQYwxxQVLK1eE8gry6FcN3KagpGQHHsTTvZOX/qsM5wWvk9KQB6uRQmgs/VEUPT3zyJy
	ty3XpMGZ2lf47tDg3UzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFLeX-0001yG-DA; Sat, 13 Apr 2019 16:37:17 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFLdx-0001Am-Gl; Sat, 13 Apr 2019 16:36:44 +0000
Received: by mail-wm1-x342.google.com with SMTP id h18so14569249wml.1;
 Sat, 13 Apr 2019 09:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kBXO1uZlskj4auakSoYtNTreOLcLzWrlcJFWLgQwR7A=;
 b=r6QxrJ3RXltfeqSjUG/3ikq36RJSQtldcfRD+Sf4NCMbkal3+xTwF2uWL6bGX4iOzw
 VR+XMb2JWqoqfoOLQJuQ8TbUX4G+WWFonRn16BWbg87dKQaebrCGFur+3IE+VrXrJZZG
 WWXADlAf+0p1O7SfPUsCSnkLT+PGVy1ypErRUjQDKXU45W7AIi7MGZ1mffFsPMc1Cjss
 xi5d06ydb8Rgl6IgMrxeLrhP/JzOH4nrS/N/EWH9ZcN9Cn1m0mG+vDq4aSXHH86U4jpM
 ZcsbfuFWAy/wD+lT9wmaNoRtbBWO/EBO9+WIB9nfjU2PUH7wvikMy06ySwmFaMkCwe3A
 4mTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kBXO1uZlskj4auakSoYtNTreOLcLzWrlcJFWLgQwR7A=;
 b=C2I0wLIqklJnLUomabKM9xW3E4pAFXndxNS9wjw/waWXaACNQ6uSOy++icpt0ZXfk2
 2Bh0RT/8yY92sk5jSfixIitgPc60dcLeiP7kix+eVHsZ3ygwrWwvnUrtues391NPU1Id
 nmhvRAWJi/v5JynsPq8w85xOsHu+FvwE/R9RWpk2U+cr9OW+kiMfFkqZB4QzYKMFKyAt
 Bwch0f4Rh6rzhzFIbnoa/8PCt2pPeVRML0+PnV+wWFKGY4MldoksRAaBX70K8D8jHf3/
 xe+AHbAd3PPvTaIq4sUiUg7tKCk7HkL7SGg5BfFhG6dDI7bKXMVTTaL1nUr1PsvzBsGY
 UJOQ==
X-Gm-Message-State: APjAAAUNP8dabAkYoo9SlbHHZn3bMngqii2/LquYIoKhYHJ7biQuQ9pY
 t1klzwtkV048F62YTXQEJfKDK/OO
X-Google-Smtp-Source: APXvYqwiMXRIGA3sRw1d5JsyiSyE4RLl25K8bEL529FrgTJ0lQCzV6Ja5TnQ9bMJY+b7wt18hxZO0w==
X-Received: by 2002:a1c:480b:: with SMTP id v11mr15222305wma.25.1555173399396; 
 Sat, 13 Apr 2019 09:36:39 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C8AD00714E418F6C82D049.dip0.t-ipconnect.de.
 [2003:f1:33c8:ad00:714e:418f:6c82:d049])
 by smtp.googlemail.com with ESMTPSA id j3sm106200069wre.51.2019.04.13.09.36.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 13 Apr 2019 09:36:38 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 3/3] ARM: dts: meson8b: odroid-c1: prepare support for the RTC
Date: Sat, 13 Apr 2019 18:34:23 +0200
Message-Id: <20190413163423.15149-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190413163423.15149-1-martin.blumenstingl@googlemail.com>
References: <20190413163423.15149-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_093641_831947_D0F981C2 
X-CRM114-Status: GOOD (  10.91  )
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
 jianxin.pan@amlogic.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ccaione@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Odroid-C1 has the 32.768 kHz oscillator (X3 in the schematics) which
is required for the RTC. A battery can be connected separately (to the
BT1 header) - then the "rtc" node can be enabled manually. By default
the RTC is disabled because the boards typically come without the RTC
battery.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 0157646e3a89..f3ad9397f670 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -124,6 +124,14 @@
 		io-channels = <&saradc 8>;
 	};
 
+	rtc32k_xtal: rtc32k-xtal-clk {
+		/* X3 in the schematics */
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		clock-output-names = "RTC32K";
+		#clock-cells = <0>;
+	};
+
 	vcc_1v8: regulator-vcc-1v8 {
 		/*
 		 * RICHTEK RT9179 configured for a fixed output voltage of
@@ -345,6 +353,12 @@
 	clock-names = "clkin0";
 };
 
+&rtc {
+	/* needs to be enabled manually when a battery is connected */
+	clocks = <&rtc32k_xtal>;
+	vdd-supply = <&vdd_rtc>;
+};
+
 &uart_AO {
 	status = "okay";
 	pinctrl-0 = <&uart_ao_a_pins>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
