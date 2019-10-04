Return-Path: <SRS0=++Ji=X5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C1DC47404
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Oct 2019 09:03:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06050206C0
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Oct 2019 09:03:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dZ3fV9nZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HXhD6/b3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06050206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TcbncbG1WbU3D8ruAnnaW0tFBpHKnGwvs8IXb8UcyTo=; b=dZ3fV9nZaadWiKbgF/MTlRGD5L
	hyCnlNr+NH9jKjt5+/iaVE2jdweWgI9a0ZX3LGKl+gxH81mlHvlpA3tVn4pYR51aFOBhSWGnwIZ9M
	YtiCtsn7UD/g/kbX4yxEj1f1C6YjAf13K+wXtUDG+NPbg2d+Eui5efFJi5ovgApcBG97JG6nIKG/h
	DD4w+vn4Rc5t5BwIhlsSgsXFCD1EeD8w3aYNLzdqvl20+qOqcp6aAqs29q7SO3GY8e+V8xB14o/qK
	YVnEqgtY6VbgSUP8C2RSaLtOWag06i9LNm8GWuaO4HmMI2AA/E15UHNgWMxrFLb+uSct3Vqv3R4yj
	Z6vz/DeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGJVA-00034S-9i; Fri, 04 Oct 2019 09:03:52 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGJSn-0000jx-Jt
 for linux-amlogic@lists.infradead.org; Fri, 04 Oct 2019 09:01:27 +0000
Received: by mail-wm1-x344.google.com with SMTP id v17so5003990wml.4
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Oct 2019 02:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=d5p5TZdfu3c5JamI9H4kBW65H5B1r53e+p3e9L3D7UU=;
 b=HXhD6/b3g46QaTJ0rfpB3K4p1enaijiJaNjpzh3iqTrbojoWc322br0ZE4fu74y4Bo
 ew+dbCn+cRNR1RXAKjF8eA0cotL6IdqdbJ++nJBwfDLKWACSZ3F0ZBXVKSPw09uvYcdc
 f4ZEslZx17QSDT+8H3oagrvU77HvhR/zHaLyEEvZKo6BybCOPGXao9t/ilum3zkTO+n9
 k+mGhPRrcwz8ZbbFmCWUeKOZSbvBStSepye0eyQwOELYxOkUx4nKk79IVLuemlZx8t/6
 WlYbJbSwJmFDlL8mbjEPoAFtALBieInYnKeRslS4xZadxcvCgVmUaAVsTS4GPsc4hdcL
 lZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=d5p5TZdfu3c5JamI9H4kBW65H5B1r53e+p3e9L3D7UU=;
 b=opAYjjGlvdZfWMiqESXDCbswkg0TY9iVyQFKOw2KzR0bVRqT01dN4mklY2PI2Sx2mf
 5w8+z7+H6Ls4TAmmXmU71yJNKDQyMrugLuaP/SJL/dTCipz29XUctM6th59B82XZ3GA3
 jcmKyweh5C5FXgR5tgbw9ijQP2wYzdlCRISdbpVOvDK9we1icGkz5zCODQ2siYiN2ib6
 d5jTpESHz+SqRJR3FKj8gu6YHhE9vUYpb8SaGpQsdCamLUWJRikPNFgYxFDYg2uMYF9+
 p/TE1xJAbRUsuDPDkdWD/JSoU4oJaUCY5nB7ir2GR4H48B/DTQu8ieAT/O9mrFsGp085
 WDyQ==
X-Gm-Message-State: APjAAAXCCZX8NoTC4ZXeo6fGzZCrlvKZsCe980PhAHtMruTg2XmeNl6R
 iZD8JmZOWNRelMsElIqgV/Ywpg==
X-Google-Smtp-Source: APXvYqx6hT7Mt9IcrA0cYDoSMEivg/dkChQ3Dkjk4SFkHc0I5XcK4X1WIZJ1l19R9jm4yIxaNblaQg==
X-Received: by 2002:a7b:c156:: with SMTP id z22mr10530902wmi.142.1570179684267; 
 Fri, 04 Oct 2019 02:01:24 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v8sm7765170wra.79.2019.10.04.02.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 02:01:23 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: amit.kucheria@linaro.org, rui.zhang@intel.com, edubezval@gmail.com,
 daniel.lezcano@linaro.org
Subject: [PATCH v7 6/7] arm64: dts: amlogic: g12b: add cooling properties
Date: Fri,  4 Oct 2019 11:01:13 +0200
Message-Id: <20191004090114.30694-7-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004090114.30694-1-glaroque@baylibre.com>
References: <20191004090114.30694-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_020125_687950_6D402EE3 
X-CRM114-Status: UNSURE (   8.77  )
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

Add missing #colling-cells field for G12B SoC
Add cooling-map for passive and hot trip point

Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 29 +++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
index 98ae8a7c8b41..4bb89bce758f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
@@ -49,6 +49,7 @@
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
@@ -57,6 +58,7 @@
 			reg = <0x0 0x1>;
 			enable-method = "psci";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu100: cpu@100 {
@@ -65,6 +67,7 @@
 			reg = <0x0 0x100>;
 			enable-method = "psci";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu101: cpu@101 {
@@ -73,6 +76,7 @@
 			reg = <0x0 0x101>;
 			enable-method = "psci";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu102: cpu@102 {
@@ -81,6 +85,7 @@
 			reg = <0x0 0x102>;
 			enable-method = "psci";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu103: cpu@103 {
@@ -89,6 +94,7 @@
 			reg = <0x0 0x103>;
 			enable-method = "psci";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		l2: l2-cache0 {
@@ -219,3 +225,26 @@
 &sd_emmc_a {
 	amlogic,dram-access-quirk;
 };
+
+&cpu_thermal {
+	cooling-maps {
+		map0 {
+			trip = <&cpu_passive>;
+			cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu100 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu101 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu102 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu103 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+		map1 {
+			trip = <&cpu_hot>;
+			cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu100 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu101 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu102 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu103 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
