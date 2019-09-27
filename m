Return-Path: <SRS0=3dzI=XW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86492C4360C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 18:45:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A15020872
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 18:45:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ex1aDPx+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="takF3d8T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A15020872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DZ97qaHZ7G4YyeSBoaKjDldpFJCeod2CfEDOO8tQJrY=; b=Ex1aDPx+7m4fggTXKnqhf/ylf2
	iecDOaEyx/uwBaOn35JxzY9wlf+CdY669Z15kF1vnhFFhuALvAiC6SovAoC00xSC6srQWMQBOi/qo
	TlBjcFYpLIWmTw7LC46InD+jbHv5fzAGvKxF7tSSKujVqI2mhpkPuncT8VBFePnx0ssqfBHcyaKAL
	UdWWdj50gA1x+dYC2Gz30nX/yHLnzyLFKWVYPu7IjgJr6hD/zEyQE46ZFAFvrBQXWmJE2JKPLzFXh
	8HbdMGHjRzqOrMJJBrzKewHuWrAl3PNabGo9oppjuOxWwxxQaBqPLYWT5FVmCn8F6LVblgc8Dk4GY
	L7j2mGIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDvFE-0003ld-UO; Fri, 27 Sep 2019 18:45:32 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDvDm-0000YZ-KE
 for linux-amlogic@lists.infradead.org; Fri, 27 Sep 2019 18:44:07 +0000
Received: by mail-wr1-x444.google.com with SMTP id v8so4344714wrt.2
 for <linux-amlogic@lists.infradead.org>; Fri, 27 Sep 2019 11:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bn1Yyb+y0E2XtXZ6uMo4FglNk7nmGiqm3716bVhGUbI=;
 b=takF3d8TQ23XIGxuLOV8EzoCgdq2Cx3gSbMfwoy8dm4JOeV1XPOcGDt36yHf/TI7T+
 FtbvWKEknxgAIutpiIolDXxparFuO4OfaK8AzTK97b0LKYe0SDv37m3nJ8nkhGqKqX+l
 ajQyWxbLHv32CSr7pUKgba6XKx+DcFNKw1+DFc6ufE+etxrYBfXlb+f4nP8LZ1bOapM/
 NC8bBmCjPgyuLG2UVTsEA2vzrupBytvvOiKvTboLnyCM6wxZJX1jMAWJU3qpS097AxuV
 yLpcWtGm7n+t1ZhZedjLWOVxe+aXapZhHwoYnea03QmYlH7hDqjSMG/eA+/c/ixE0Ogp
 3jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bn1Yyb+y0E2XtXZ6uMo4FglNk7nmGiqm3716bVhGUbI=;
 b=F1q/2e2YhkGjidD5wxBQBXzCodF7xLfsR+P6+4RAvdrZ5qJuzoQIxhxvHFT+foRbgZ
 AcYJhTWNIq3bxtscWgEKcEPNbsQGfHIEAzB1POKH9SKoIsI+Y9dm4nrZVxl9AOPJX+9r
 owv2/2MYe4bLUjZ6wx1gCAau0TvK8Pb8gB9AzUpfdsSPP0/piJo2LrJL+6SRYyXCbVMS
 t8X7i1NEHrfe6E8uRFV2MqNoft4t2ixuvDgORbuDIKvhSwo/l8ehh7c5wQexY5Z48CuW
 7KJb8Z5tQZbXBESx008hpy6ee2l80+xnggsm9yIl3riQGoZxjay6NjzUV8tiy6ltypTf
 so4Q==
X-Gm-Message-State: APjAAAWLPrhXmhykQtEVpOfhRRcjtMQp3qQL6MZkPys34aAtotUJnz7W
 h8QsLgtlXPPk3ePTabE10DV16A==
X-Google-Smtp-Source: APXvYqwwmzGMJt5+RoC/OswzZ5EMENUYAm3d/ZFwKGTbNtLuc52z5Dcy/qT1fzKqYHzwCMtLhVptNg==
X-Received: by 2002:adf:fe05:: with SMTP id n5mr4414380wrr.355.1569609841286; 
 Fri, 27 Sep 2019 11:44:01 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home
 ([2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca])
 by smtp.gmail.com with ESMTPSA id r13sm6246272wrn.0.2019.09.27.11.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 11:44:00 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: amit.kucheria@linaro.org, rui.zhang@intel.com, edubezval@gmail.com,
 daniel.lezcano@linaro.org
Subject: [PATCH v6 5/7] arm64: dts: amlogic: g12a: add cooling properties
Date: Fri, 27 Sep 2019 20:43:50 +0200
Message-Id: <20190927184352.28759-6-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190927184352.28759-1-glaroque@baylibre.com>
References: <20190927184352.28759-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_114402_746053_4861E7A7 
X-CRM114-Status: UNSURE (   7.99  )
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
