Return-Path: <SRS0=3dzI=XW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95827C4360C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 12:49:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68F6E2146E
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 12:49:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PiEXtVX+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="K9an5A5G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68F6E2146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DZ97qaHZ7G4YyeSBoaKjDldpFJCeod2CfEDOO8tQJrY=; b=PiEXtVX+qRFCy3s+FuoSEWVYbW
	3H8kZ3UI1R9Qj2QjzZ2gyrQZIifv5wze4hn1zl3GqMZ8icjRIqz/+D3cA4q7lOKdDv+Kl5ifj2HjQ
	r0TxqQ04nB3qg5FrZNHFDPTs3ZaJYyncF++thYtTXiE/AlxPs4PlQZFyQ5ivVvznNM/QWrNntrZsx
	uB0nGeh/6F5/z4EwQAzqc4iqFqMUVP0o1NMSeJd2k1LmbXQ7tNcSZtDOVqUuH5bvmjJs/T5pcmE1D
	eZZEmV2/AvhV3RisXl1VKRodJ+/cs6/jVjpLYqCGHE8LQ5sNZGuk1YNeJPg3tAqi2EWHMkbcKs/Gu
	opLj+60Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDpgg-0003DQ-IP; Fri, 27 Sep 2019 12:49:30 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDpfC-0001lu-JA
 for linux-amlogic@lists.infradead.org; Fri, 27 Sep 2019 12:48:04 +0000
Received: by mail-wm1-x342.google.com with SMTP id r19so6456514wmh.2
 for <linux-amlogic@lists.infradead.org>; Fri, 27 Sep 2019 05:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bn1Yyb+y0E2XtXZ6uMo4FglNk7nmGiqm3716bVhGUbI=;
 b=K9an5A5Gt5DdTP1cbKeOnKPTzPSiEKvpVGCm8o+7tsv9wzJAzXCZQBkX6JTSgHJ3Iy
 DPThePWfO71M0t+mxHEuEsRhkwldfeXD1BaL8mC/W6JKaUnbKMuInIXBTEV7efhLceyo
 58mKE6MqQ+fKAbEq0Qvoms8kWyqEzkdaSC7bjdiQnDtU9bdL9J1j6uB5mt4V0z5BjJSp
 mZnYJHg65mnQCBv67lKtmfTJsFQG0JL9F8DRFVW8T6IOiVEDmEkHNSVeaOS1pdwSnRD0
 TDWHkBhhgCdux/1r1YwrjhbyufN74ljk8VlruZdl4fsfZGa/EazKqD6ZS/P+FkEPJfQ+
 5/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bn1Yyb+y0E2XtXZ6uMo4FglNk7nmGiqm3716bVhGUbI=;
 b=SJ13sMC8zpOt4k4+ejT9cxo1bX7MYc6x7Wwe6ytrgo4DPyL8to2sd+GiYM0nu7a1cZ
 f5HPkD93BNJoxWErb/tNvDtQcUy7lm/INwh1+zOC1O4cYIC0y2IUtpkYbbaZA6dN+Fj/
 M9VUkOO4jdOLtAxDhbI9uFPKMiIuu2On9h5yGfn1kPeNfiNzgQZ1saWwNoOQHa02av3t
 RG+iffBuwrGq7iMUIM2eAQmIMPKbi0MfHtrhaSoGB8peo46Io8461GJresVXFzSJ9P0L
 IUVEAtrhWoPysHaT61LXXvrJNwVO3QXITc+5QgWVrvwaZNBvWkVH/TO517iHGSn7dAYs
 dGbQ==
X-Gm-Message-State: APjAAAViax4mr/IONI5Yl1pOrLOPihEW166iq8CmDBSBu5NFvLNjZwNw
 pVz/Y0EBaTyK03WkjZLyI9MBxA==
X-Google-Smtp-Source: APXvYqyPHf/pDWgxGEyU6SfHL1TSMLHW+AfoTa4Fd6D5uufSUoyA3g3A7r6lbvJjccaS5BMtCqLChw==
X-Received: by 2002:a1c:4945:: with SMTP id w66mr6962094wma.40.1569588477438; 
 Fri, 27 Sep 2019 05:47:57 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h9sm2985564wrv.30.2019.09.27.05.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 05:47:56 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: amit.kucheria@linaro.org, rui.zhang@intel.com, edubezval@gmail.com,
 daniel.lezcano@linaro.org
Subject: [PATCH v5 5/7] arm64: dts: amlogic: g12a: add cooling properties
Date: Fri, 27 Sep 2019 14:47:46 +0200
Message-Id: <20190927124750.12467-6-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190927124750.12467-1-glaroque@baylibre.com>
References: <20190927124750.12467-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_054758_671141_9ADAED32 
X-CRM114-Status: UNSURE (   8.36  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add missing #colling-cells field for G12A SoC
Add cooling-map for passive and hot trip point

Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 733a9d46fc4b..3ab6497548ca 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -18,6 +18,7 @@
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
@@ -26,6 +27,7 @@
 			reg = <0x0 0x1>;
 			enable-method = "psci";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@2 {
@@ -34,6 +36,7 @@
 			reg = <0x0 0x2>;
 			enable-method = "psci";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@3 {
@@ -42,6 +45,7 @@
 			reg = <0x0 0x3>;
 			enable-method = "psci";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		l2: l2-cache0 {
@@ -113,3 +117,23 @@
 &sd_emmc_a {
 	amlogic,dram-access-quirk;
 };
+
+&cpu_thermal {
+	cooling-maps {
+		map0 {
+			trip = <&cpu_passive>;
+			cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+
+		map1 {
+			trip = <&cpu_hot>;
+			cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
