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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72022C7618B
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jul 2019 12:14:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 361292086D
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jul 2019 12:14:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TSX8fUJU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="bOyXsaOD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 361292086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=soVIUcZLhSMYm6u49qko7OVexLsAQYwm8CZ22R9Mz0o=; b=TSX8fUJUcAY8sV
	wpxOrEqAodRW7TsGwvJKiAerHjPySPs7nJa4hKjoMRH5GdUHNvz3rH79gwGNdiTlvYZ4SrKxdzT8l
	FAd32Lmbhj8TJtysNdy0EhYJAp/+O3qThnWgmtylZdeehQtkZGwOqdV8fOzib+D/IwQkFuxpJldnd
	ir97fhEV+DEabVg1htduEG6IuIqoU+fSHbD3NP4O+ATOfvAo47ZNRy26vzrmbGWtXY4W0lMsjpt1B
	OuoMz0EOA+Q9TQXpxpa5RaZK8qzYYyDBV6dOnYOy+YZk7vjbM+8InT6wFH/iEggMsODStpf3iIEfb
	0cr2Zaqeev6P6kU47RHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrLaH-0002JU-4l; Sat, 27 Jul 2019 12:13:57 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrLZV-0001Dv-Ee; Sat, 27 Jul 2019 12:13:10 +0000
Received: by mail-wm1-x341.google.com with SMTP id l2so49692276wmg.0;
 Sat, 27 Jul 2019 05:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M5VJ77HzSYMyOnNSU34/RgfTpL1VyZ0UT5tc7uiCpts=;
 b=bOyXsaODj+oGFDXnUUVuZUhUfBLQL2o2uw0ObAXJqabol6/LNMKy8PQiUMWDezAeCm
 nKDX37UApFaq3ykUpHVBNKpdBHdVxNdepU+1Kz+PAc9IyUonr7WqJ/WjaPFFp9cjZFfr
 yiF2qlYqsHcSyPsCYJFFGLl2QmtMnP7PDb7yoSq/RBvOAlyrcAvHOvgIaq7eUwXnz/lr
 FlTlDq/5INFPHfh1mo0p+hBWYKge9eD8+6TuZ4CoCQALMq3GbE6/gkzAIyfucXPeanSn
 tQk6BFgv1mrjIAdChmyHzQTLqH/Hzs5e1spOAfENPe1+UCYPF318Ee3AagW4taHmsnWr
 18xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M5VJ77HzSYMyOnNSU34/RgfTpL1VyZ0UT5tc7uiCpts=;
 b=qh5fyeUR5k5AW+97P+rgSDms9Woa5swSHv2n5ApysBi+lQeH3Ch6ZsVPRKkAEkgtis
 aBcyTPjvnZUEjocnTxrKNSrcxMY0drJIcR/WSJfIjfigpNkjROXy7VuMTfiGUWfpGa//
 A5Wb4m4HHyRy9t4JcenrRZ9zYnxe+n73PeE2SQyvugCiO2rUCBEQgfkliRGn2cViJdFQ
 VY8SX2gO7vmzUKJHC59vsF11CCzmCr3aQ1vjtWPCKaOXns0fEVjzpsRPs/1bxkOVf/OL
 GgPquhkpuzdLCr+JoujHmVl4L9md/JWWNw1zw5WQ7nUIcGKG9QUgn4E2Xhkk+0i2OF/H
 gliw==
X-Gm-Message-State: APjAAAUzSNQGY+j6GjIN1grP5vOJlN5psooMGRQvS+Q+lLWXEYIEemBU
 WYw47eu2Qyw8dM3OyYFflY8mGT8u
X-Google-Smtp-Source: APXvYqxbZtZTQGMBIkUPVU7HbCAa3FLI7lq62O0oi2gTvqH7vtlDPfKNmRXpqxz193SKwUhMWl7l/g==
X-Received: by 2002:a1c:544d:: with SMTP id p13mr93863021wmi.78.1564229586042; 
 Sat, 27 Jul 2019 05:13:06 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C65C00B418D0F4A25A19EC.dip0.t-ipconnect.de.
 [2003:f1:33c6:5c00:b418:d0f4:a25a:19ec])
 by smtp.googlemail.com with ESMTPSA id
 o26sm111786569wro.53.2019.07.27.05.13.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 27 Jul 2019 05:13:05 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH v2 3/4] ARM: dts: meson8b: odroidc1: add the VDDEE regulator
Date: Sat, 27 Jul 2019 14:12:56 +0200
Message-Id: <20190727121257.18017-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190727121257.18017-1-martin.blumenstingl@googlemail.com>
References: <20190727121257.18017-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190727_051309_497946_6D10706C 
X-CRM114-Status: GOOD (  12.14  )
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
 arch/arm/boot/dts/meson8b-odroidc1.dts | 27 +++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 86c4614e0a38..90f66dc45115 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -154,6 +154,23 @@
 		vin-supply = <&p5v0>;
 	};
 
+	vddee: regulator-vddee {
+		/* Monolithic Power Systems MP2161 */
+		compatible = "pwm-regulator";
+
+		regulator-name = "VDDEE";
+		regulator-min-microvolt = <860000>;
+		regulator-max-microvolt = <1140000>;
+
+		vin-supply = <&p5v0>;
+
+		pwms = <&pwm_cd 1 12218 0>;
+		pwm-dutycycle-range = <91 0>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	vdd_rtc: regulator-vdd-rtc {
 		/*
 		 * Torex Semiconductor XC6215 configured for a fixed output of
@@ -276,6 +293,10 @@
 	pinctrl-names = "default";
 };
 
+&mali {
+	mali-supply = <&vddee>;
+};
+
 &saradc {
 	status = "okay";
 	vref-supply = <&vcc_1v8>;
@@ -308,10 +329,10 @@
 
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
