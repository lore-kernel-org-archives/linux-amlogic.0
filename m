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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26DA7C07542
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 May 2019 19:02:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2E3520851
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 May 2019 19:02:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XhsPwyP8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="DFZwmXQ/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2E3520851
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IdkO1IC5sBmdBThRArmjZYQH6oa8ZD1RwqW3g4bnVn8=; b=XhsPwyP8JdKgOF
	FPPOMdyYoINdtbHPScc55bNl5PcX+zPtNeLYf5Wq5URaiB05kNftrqprTR+jmGntvZO4O8JHPbxgt
	eClTCwmsa+titLV6Pt1FIX/cecpYzW7xK7+GSDVDyVZSLBHMR+ZR3SPb2WUcgyT0CrZeFYAOP4qLt
	1MgTzGCUySvPOaBnSjA2gi8gOOS6xypRk9PVzU8VBlPcMUIu+my9rvxmnKeUVyUfCWokL9q0eVzLQ
	fkhYXdUyumEAWfnYbVqtpoIbkkC46iro/qbzXSn+cF/JJZd/EVh1y6QogWc+YhPFaj7LfcPw5lyyn
	xcH+SxJYq4bcJyZqTQPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUbwF-00025E-8N; Sat, 25 May 2019 19:02:39 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUbvq-0001Vw-OI; Sat, 25 May 2019 19:02:16 +0000
Received: by mail-wm1-x343.google.com with SMTP id i3so12384034wml.4;
 Sat, 25 May 2019 12:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hY4EIUIoxiYvaBszmOR28DF6dFcPx/awzYZQzheAKOs=;
 b=DFZwmXQ/WZsUQ8790l/6LLAUvVGJsQLtKP+hM/Tx6KqV4CvLbK0CftcSe3GvzigTpv
 qYDRqflxgNvukMWNLI9E+gp9qdoy8kuo2DgpBv6cJT+kfQTCgksyj25VtKWsFnEC64R9
 TIoZFTYPmUbZ2eDirtgK8RdeDQ1XLxitqvXKWS7z817uW+x5stjJpaQuHF3tBt6fgovj
 DnMXNCz7Y8YovDM+vmJA1EGss2MleIi8qPTPhL8oFsQKvQkW3+ycu21EgY3lswrtmz9u
 ngBHsDAYK+/6XqLjEOZtKqpT1z3LWF+2Uc+K9H/LJirb06BPJ4cVkhq0JF962OjwoHyp
 rLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hY4EIUIoxiYvaBszmOR28DF6dFcPx/awzYZQzheAKOs=;
 b=Fp2TyxfvcjuT2rlYxJLsgRBrwMJkNGNVlENIBv/F1a4lAYRUCpqcIcBJyze4KHlow3
 +BiXtnivFGKdI/KYVxa6RGQKP5B+0rrzpKYlkbMDH3WDV1B0+9NAu1wDtMsuh8DSYmbo
 k0c8B2eIDqq0qeKzkfT/neQcebybPQNs5Pnr6gVRXz4nt1Q47ZSztet98eiLV1EGoRoL
 1Q3dTFxyLdu8gz2OfJ2qZsUcoN54EJj9TdgzwTWIMk0SJ5MLhy64m7RcB8E07tIfUlPG
 P4dfk3eO6HBv9bDShWlMgvGG7MCwOEg8xYye1sdvQzXj18JDyU3wKMcF8MNGSo0Sia22
 ylhg==
X-Gm-Message-State: APjAAAUAQF6EW8aseZU00qpXPO6Hh7l32w8GxcEXS+0nBaSyxOfhS/vA
 UB1X5vVg/8IWUtj9sIKzAqQTsfHa
X-Google-Smtp-Source: APXvYqzmjBfdzJH/hUQysMgtf43ZkY9RhyN22HEKGjOHDwOy9AMBulBsqjRe0cWrYmkC5ZBKrC4zmg==
X-Received: by 2002:a1c:3287:: with SMTP id y129mr4303123wmy.153.1558810933099; 
 Sat, 25 May 2019 12:02:13 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA4007CB8841254CD64FD.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:7cb8:8412:54cd:64fd])
 by smtp.googlemail.com with ESMTPSA id f2sm6870426wme.12.2019.05.25.12.02.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 May 2019 12:02:12 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 3/4] ARM: dts: meson8b: odroidc1: add the VDDEE regulator
Date: Sat, 25 May 2019 21:02:03 +0200
Message-Id: <20190525190204.7897-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190525190204.7897-1-martin.blumenstingl@googlemail.com>
References: <20190525190204.7897-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190525_120214_788178_DE5B82E5 
X-CRM114-Status: GOOD (  13.16  )
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
 arch/arm/boot/dts/meson8b-odroidc1.dts | 27 +++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index f3ad9397f670..893a3aa5ec36 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -194,6 +194,23 @@
 		vin-supply = <&p5v0>;
 	};
 
+	vddee: regulator-vcck {
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
@@ -315,6 +332,10 @@
 	pinctrl-names = "default";
 };
 
+&mali {
+	mali-supply = <&vddee>;
+};
+
 &saradc {
 	status = "okay";
 	vref-supply = <&vcc_1v8>;
@@ -347,10 +368,10 @@
 
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
