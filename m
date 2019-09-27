Return-Path: <SRS0=3dzI=XW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD55C47404
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 12:49:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5E4F21906
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 12:49:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DXui6rLw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TBFVKH5Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5E4F21906
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DZ97qaHZ7G4YyeSBoaKjDldpFJCeod2CfEDOO8tQJrY=; b=DXui6rLwmX/XjOy+jr2ZF4ayGv
	ivB+RHiE2POzveKuBhU4mY5fNJIU6ZKV9sXXdAFdR8aQ8ZL7LXkEQpAYWCggHcM16rCz+WH0M+tAy
	Bpbp4f8rjPvqT4myWiQhOEjqMz+Cmf9Af4B9lnBY21PHLu9yIDGzNJQMN7IbUrWR/1vjPxT2DkUKS
	o85w1X87vWvRdFkN/GlQQTMMJJ3i4CevdICu54G5V19LnRoVFo3Qo4QB0HGHx3vfgXTj2/TmTepBE
	RBcrTX1aWvXb5OTaRQZ5xkxaFcZGDmwWg1+qnWRn/Kf45doN0BaT8tkD1n57TnKdiT+mo8z1ynXdP
	JlwydbSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDpgs-0003Sl-Ie; Fri, 27 Sep 2019 12:49:42 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDpfD-0001mP-L0
 for linux-amlogic@lists.infradead.org; Fri, 27 Sep 2019 12:48:05 +0000
Received: by mail-wm1-x342.google.com with SMTP id y21so6059248wmi.0
 for <linux-amlogic@lists.infradead.org>; Fri, 27 Sep 2019 05:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bn1Yyb+y0E2XtXZ6uMo4FglNk7nmGiqm3716bVhGUbI=;
 b=TBFVKH5YnYvKA9k1HqNOyb4I1T+oWcWdHhJRSBtV9wwOVZ5C3tmEprLSZTFy95dklG
 PK18glTyiG2OLppG25CnthxfwOgn1+eMOq06qOPBKqMv0EKzmkPGcL72VSN5nNYc+/QG
 1zpr+6ig4pOgDO2o9UnbytLFiSfRXIQMgtxhzb5PkrRyJiXpj1RRc1w4HhPkTVzQvSbD
 Ebafoo+4n3fBAbZkFCnnBFsQwzQbmtMydnWPqZrJGIHZdSOMF13dBfb0/Mc+ZJzmTka3
 DPNH0As/KnevUP5xyQzGCFuFExWjTaVghLVzUZ6Cg8Umaht3wSjys2umd7GB3CEeLe+P
 s3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bn1Yyb+y0E2XtXZ6uMo4FglNk7nmGiqm3716bVhGUbI=;
 b=Uhsi1dGujW0+yoXmj2BU1TAcpGhZTHCl1XEqkdPSwWkJBooNd0O1u7wP0DmVb0O3cr
 8cYZgnQ/pN+VeVFrSADKX8MLiydyhi0VvO3jDEdY+5IKW4alZIpzylY8MON2V8uZObsO
 2yDbLKGksJ2phnNTNCXfKU424TItgSZMUp0SyZHUonjS4CHboTRDUJblFnc0Ie1/A9/A
 54K2ORojUSbpDNsktEgkNrwMGpLXgqQ9guA4pX+7duU6c19k4RAeRVmWP478rLmmVMtN
 WKsGxC+GOecsfp9kK3aNJ5YJYq/MHPJYbRJKqJE8B4PsNy9BsnppbUmFIVupwVgtkn6U
 AmYw==
X-Gm-Message-State: APjAAAVrEL2kMfo4SPDK1ktO/9QWG8gm3UE6a2qDdE3x84c+zrow+grz
 dJ3MYnlk2uVGXdtJSkgA8UzRFg==
X-Google-Smtp-Source: APXvYqzONHqQTp17JYyHcHd/xTyac0p1PEyddhQfBKG1GprkNkRFMjyKJXvJEMfLSGAZ0KkaJxBoyw==
X-Received: by 2002:a1c:4b10:: with SMTP id y16mr6853354wma.54.1569588478368; 
 Fri, 27 Sep 2019 05:47:58 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h9sm2985564wrv.30.2019.09.27.05.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 05:47:57 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: amit.kucheria@linaro.org, rui.zhang@intel.com, edubezval@gmail.com,
 daniel.lezcano@linaro.org
Subject: [PATCH v5 5/7] arm64: dts: amlogic: g12a: add missing cooling info
Date: Fri, 27 Sep 2019 14:47:47 +0200
Message-Id: <20190927124750.12467-7-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190927124750.12467-1-glaroque@baylibre.com>
References: <20190927124750.12467-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_054759_721578_F4068C9F 
X-CRM114-Status: UNSURE (   8.25  )
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
