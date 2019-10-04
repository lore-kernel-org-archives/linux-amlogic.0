Return-Path: <SRS0=++Ji=X5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3924AC47404
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Oct 2019 09:03:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE613207FF
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Oct 2019 09:03:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aOxnriv2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JfzUU/55"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE613207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jdHeGxAqHjj+JPqLOPFUs6UVPL1emPm06UUZkSzGm64=; b=aOxnriv2uyxEreK/0dhklL/4fR
	ox0cxtWwkwee1Y314P5YhgJLe638cjnSjFvMcA7OnvqXNhy5KuBxa5eKHVrZR5UOYmWQzmBGnTBs/
	zdC1mVDiYsyaYc7n+TY1rr+3A44s3h7jtudYmM4oDCxBKDsgq3NBSTnPw6MYsrZsR9sA6V8Bh+X9c
	vd9VSY23dLFbeWQBRQlaNb+xJXL3KkhyUvsM4uiGTgPXNubtzysPngSVwwAcQUI6yV7US+L4yZ0B/
	r7UBSxYQxt2BhoWbg5hoJjBKm5CEc3+QDd7Oq0+YWd2T29GGlfKO2EE2WWUNwQ6UE0Krv4Dkw1pZk
	2yLaCZvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGJUP-0002Nf-9W; Fri, 04 Oct 2019 09:03:05 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGJSm-0000iU-KA
 for linux-amlogic@lists.infradead.org; Fri, 04 Oct 2019 09:01:26 +0000
Received: by mail-wr1-x443.google.com with SMTP id v8so6171088wrt.2
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Oct 2019 02:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hhXs6wUTS9va5GBBPxgaGywhOz0cCImkUJC6MQ6iTnU=;
 b=JfzUU/55kQq5nD+ZLn3bLOI0F2/3jkG6qDmgUNVl1g7jdDYai2si2/JGxcZAIkjIvL
 wYoroINmrbRvQI8o02a5ng5aZPBf6AMNSCbIt2lxZMUdFy1aQewhJ6abmtICuikfg+TO
 rUr+Lml6iaUznsO5dMUSIoVB46b7426KBe3J12sx6HORU9Aqr8lsnU899mjeEXFX4bRr
 7Ww5+jvRb/Oev2fiMRcYrLfA1AFZbKN0VUdO8ssCPkS8qNACthwlVDV0R9gDcSjG2Tmn
 5XdCEsBflBo+3vnU87piw5PS0ihoDaUb9/JjfKErcxKBB6mLCPm9aNI8gPPYheqrby5B
 VRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hhXs6wUTS9va5GBBPxgaGywhOz0cCImkUJC6MQ6iTnU=;
 b=HHOCyMDycVGvYtFL/U14bh2/P7qnsNgpS8syFsqH4LGgbKh8irqssZ/PtyybSMmPAV
 AXtvYpefNsulzQUcMH0FikrRPRX3lKV710kg5MmPfCO4HGT8BHcVMi8yv7NobWF6sfZB
 XrbIGg41ivx+BpkDkCuehf31E2zxnM9CNXZAO6je8RPvff6Grd+3Ucsfwj73vnBS4Rwb
 Y44joDUYl8DMQPkGueoobf0lx8VBlMrv3y4pNjptw0gRN3d8CY2Mp/798F9jrvxyW3W0
 Xop5kcEVN8YTe1jR1fQqol5892b0166ovwMfQrVxiGJiZkmaSKR+dxCj8OQG3DwqkB4U
 Nzqw==
X-Gm-Message-State: APjAAAWVnQsdI0Mi4DBSv7wX5Irt+kdkhfTKQd3qGWatP7pTvMPlXFlK
 iadJew+LibrGhdEeTbUFrE9FUQ==
X-Google-Smtp-Source: APXvYqx3ANd3JSC4dmn8iEi+vP/O2TkbdGEiwSZ7uKVt38ptoDgZ9MC6kne/ujlpccqO7cuphtXGFg==
X-Received: by 2002:adf:e64e:: with SMTP id b14mr11388390wrn.16.1570179682980; 
 Fri, 04 Oct 2019 02:01:22 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v8sm7765170wra.79.2019.10.04.02.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 02:01:22 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: amit.kucheria@linaro.org, rui.zhang@intel.com, edubezval@gmail.com,
 daniel.lezcano@linaro.org
Subject: [PATCH v7 5/7] arm64: dts: amlogic: g12a: add cooling properties
Date: Fri,  4 Oct 2019 11:01:12 +0200
Message-Id: <20191004090114.30694-6-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004090114.30694-1-glaroque@baylibre.com>
References: <20191004090114.30694-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_020124_701357_794784A4 
X-CRM114-Status: UNSURE (   8.65  )
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
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
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
