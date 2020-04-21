Return-Path: <SRS0=oV4S=6F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF3CDC2BA19
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2020 08:04:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A228720679
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2020 08:04:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TzGz6U/j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="masfNwGS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A228720679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dfYqjfvgeC4aaGdS8j2CZ9umlo/N4p5f81HVKY+NIwY=; b=TzGz6U/jng/yTL
	xxYfWZcRpHk0PoRUk3Kaurz++pUPt/Wo8WvhxarXG9qsAFtKHE65n7K2N1s6NcUbyifJdzuYUjaWT
	NCXllZP02Aw99DdVGa91hTk35Soh6NT6BuYkJbBN9wgmjqQYHz1t9i62CBQ4nE3qL7YAo6O3jyC6t
	WsYgbDaO0drQHpnTUSwkAca0CmkPPnaSPUf59tuylXq0fexRwrz2Q2AVLd8pRIdbErG+wJkHGgbYt
	gc+S4XVTIYJsS87n0E8idNqw2G3DK5yAkgdb7p39WZKzqsuH76e0gOxExYYlKhrq9rw315Rh5gvq/
	NeThFeKE67UXTK/m5PTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQnsn-0003nr-9A; Tue, 21 Apr 2020 08:03:53 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQnqI-0001FR-QM
 for linux-amlogic@lists.infradead.org; Tue, 21 Apr 2020 08:01:20 +0000
Received: by mail-wm1-x341.google.com with SMTP id 188so2471466wmc.2
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Apr 2020 01:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=exntrZVDrpNC4LfoF62zE8ED3Dungiic5pvW3+dqcrE=;
 b=masfNwGS8IZQ2541J1dwhk8GqCR2J55vlrTQssHEbTO9xZSvKw4jZzjNLJV4v1DYeg
 ubBwEzmaUyKD/nAjdgA2nIZ319L0eXWUFqw/8EGufNzLxABbA23/YIVLCBbCfBHqn1h1
 I8SnrdHtfrIDDG340w1zg/i66dRkz3EJ3pQzdTFMN65wwpFiUkRb6Mpfim9Dcx+6InWS
 hT8QIS2zrVKTrr9+5cLP7YFB2d0W2BN9mko24jNiwAw1B7b9/521qmpA/S+8J7fcAhDK
 SNd1tyts0TZBlubdtb8U1OEkIt8DMPHul1Lmd+0eiBGcfKaIooeFH0AiLWhFp+u2O3U6
 Yw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=exntrZVDrpNC4LfoF62zE8ED3Dungiic5pvW3+dqcrE=;
 b=DZzQXdsOQGqiQqSPJJwoG7nx5orbYSZTHMnAgm4JiTpO63ej/Nk40QuLQlqKM6kQcE
 QDndNAL2neBjWIiGYCBLkGmYS2GOwouIubAmms6k5s5Fm7j04I1kjNCNncBExRwZNMV8
 CD/kHZ1Xda/4TQrf6h9FaLVRo+CX8Frkhoe8yzletKTJicjtaOWVm/0KYXB7y0EAFc8m
 GUu4ACPBrm7tChEnltFB36TaPLI/m+6CRT1iPUY68Ocf8p9Djiw26uM2Y+woVsaMf+4v
 Hu30X11gxElrT9TOBkDtcPqn82BN+SxbgYCsoOIxcSjGM+V46dVR5EAAABmXnuZ/bl/F
 Aq+A==
X-Gm-Message-State: AGi0PuYraPG1aiEggZ50tVvBBYsA281klayh+4KR2ZV8CSHKkX7tYp65
 FBsLfoyd1Gmoox2wj3f6WX1heA==
X-Google-Smtp-Source: APiQypI9h94l+CZXcEb1aZ/OgizCqV8es3Sa3eybeGWtzOeDjtlLjSkfJia1v7tSyR5sX8sej1M55w==
X-Received: by 2002:a1c:96c6:: with SMTP id y189mr3785930wmd.106.1587456077312; 
 Tue, 21 Apr 2020 01:01:17 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id
 x132sm2561552wmg.33.2020.04.21.01.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 01:01:16 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [RFC 7/8] arm64: dts: meson-sm1: add cpu thermal nodes
Date: Tue, 21 Apr 2020 10:01:01 +0200
Message-Id: <20200421080102.22796-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200421080102.22796-1-narmstrong@baylibre.com>
References: <20200421080102.22796-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_010118_919128_5965D9AE 
X-CRM114-Status: UNSURE (   9.48  )
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
Cc: linux-hwmon@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add thermal nodes for the Amlogic SM1 SoCs based on the G12A and G12B
thermal nodes.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index d4ec735fb1a5..71317f5aada1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -56,6 +56,7 @@
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
@@ -64,6 +65,7 @@
 			reg = <0x0 0x1>;
 			enable-method = "psci";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@2 {
@@ -72,6 +74,7 @@
 			reg = <0x0 0x2>;
 			enable-method = "psci";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@3 {
@@ -80,6 +83,7 @@
 			reg = <0x0 0x3>;
 			enable-method = "psci";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		l2: l2-cache0 {
@@ -466,6 +470,26 @@
 	compatible = "amlogic,sm1-clkc";
 };
 
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
+
 &ethmac {
 	power-domains = <&pwrc PWRC_SM1_ETH_ID>;
 };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
