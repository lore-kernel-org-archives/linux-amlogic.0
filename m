Return-Path: <SRS0=JCZT=UJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22386C282DD
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2019 12:49:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB71A207E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2019 12:49:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TrM+oGCw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vPytJ7dJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB71A207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T7l8JCliIuJ1p+XekaX5Ho0btWwvyVzhSU+D6B11oKI=; b=TrM+oGCwZJiACs
	Bml4GZ965pQw9bPGUl/FvWDcW1EGFEcXiNAD+hJdCy/vrM0uTRzz0YVhj6v4YQN2WTIGMx6rpHZWQ
	ozQoOuJ7+uanvyvY8bko9yMfopAitZpdggND63kmuCh+34spT6WSLveoK9dI72fRsjhnDFnauHjLQ
	WO8TUY3HGm6Ry3IhYki5EUgiiP2K1eG56XdR/bcCRP04ZUvVlnBDESTT2iLexgEoI+L+Kw8nv0Fg2
	2f0FNxo5t3QHEaPFbWmy2gUgUz4CIpNMc5aqTKwu+kqAowdNozuWZU9+0ujMu7DxI8NJutr5cyp2E
	5aUaKCUH+jhj5IfRUtPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1haJkB-0007ME-RT; Mon, 10 Jun 2019 12:49:47 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1haJk4-0007Fn-I9
 for linux-amlogic@lists.infradead.org; Mon, 10 Jun 2019 12:49:42 +0000
Received: by mail-wr1-x444.google.com with SMTP id r18so9039909wrm.10
 for <linux-amlogic@lists.infradead.org>; Mon, 10 Jun 2019 05:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=paZ5pWp7Tw9Kqpu3mv/pxtbEqmzU7N+ABWaMNMy3HrM=;
 b=vPytJ7dJXkP1fOwjeKYjBWk81r/Ejltc5k1ajCYbmyhnSp6Xzx9aL+/KnPEHvv843o
 sjRZrvswUUZoTRSosIwhd6otjZoHVxoSUX9/4DkilztMtX+cJm1m3LIxQ/MEAPvK/k71
 DyFrJBXiqtmBGr3yuiBjks4cVBPJnvj5bsR5h3pE55neZbUPHMogJhmLmFj8/0HEG+kE
 xNTFydhLuO7A/8lOI7ZK3KSHjydcKiWn7uqHsQnV1r/YhKte5xkxWPL9XnTyug2Ae5eE
 a+v87M/TIuZRvWOWlwZgXiVY6Y1uphLRVvZhOEGOt688wKX2E62XTu6UU6KbAN/LGHRb
 CSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=paZ5pWp7Tw9Kqpu3mv/pxtbEqmzU7N+ABWaMNMy3HrM=;
 b=oVjkjtB5SFyXVobOrRYQivCiufPpaJkbGtguX3nX7Xtc7obMwXVpLLRh6HzJRwHvnu
 lkIaUUMXncChkorUPKVeFl/GJVcGlEBSBU8Fp5/ubarYVWIyEhj8eBDK5e0QSOFalmAb
 CqYJXN0Y2ZSBsTO9dFyY7Xpd7x7ON9YrDqkffAp7LExQ+vu+bHk62bjLCHUxZYLKVvNR
 IRdnV44fLGEMIwX008K8u86r6x9yW/Pyw9802Y+FeQ+jNnlwWMeCJlYFqyD14y4cERB0
 jz4j+2LMoX8o8PjIFXGtXnvySXTYUhbtLmHJyl0ijPgxwCSjfmqASSQgyLfhl30hLMCQ
 mpng==
X-Gm-Message-State: APjAAAW33FLxnzrUYvaYB6OJ6YUKc60aWgQwMpLUQMP7cfZZdN9jNbJc
 6bmrZgDGpWm/JyfI3iSnaobSlA==
X-Google-Smtp-Source: APXvYqw3xovslR/1IsJwGC2mxhAa5CikdWZnlwoZKEOVXpgVqn2wnhmDPTd/DUL87e+yhezi7pr04g==
X-Received: by 2002:adf:9023:: with SMTP id h32mr45385160wrh.95.1560170977216; 
 Mon, 10 Jun 2019 05:49:37 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id v24sm7550504wmj.26.2019.06.10.05.49.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 05:49:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] arm64: dts: meson: g12a: sort sdio nodes correctly
Date: Mon, 10 Jun 2019 14:49:31 +0200
Message-Id: <20190610124931.17422-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190610_054940_820400_C0517327 
X-CRM114-Status: UNSURE (   8.86  )
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
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fix sdio node order in the soc device tree

Fixes: a1737347250e ("arm64: dts: meson: g12a: add SDIO controller")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 73 ++++++++++-----------
 1 file changed, 36 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 6aec4cf87350..0642e0a6c605 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -843,6 +843,29 @@
 						};
 					};
 
+					sdio_pins: sdio {
+						mux {
+							groups = "sdio_d0",
+								 "sdio_d1",
+								 "sdio_d2",
+								 "sdio_d3",
+								 "sdio_clk",
+								 "sdio_cmd";
+							function = "sdio";
+							bias-disable;
+							drive-strength-microamp = <4000>;
+						};
+					};
+
+					sdio_clk_gate_pins: sdio_clk_gate {
+						mux {
+							groups = "GPIOX_4";
+							function = "gpio_periphs";
+							bias-pull-down;
+							drive-strength-microamp = <4000>;
+						};
+					};
+
 					spdif_in_a10_pins: spdif-in-a10 {
 						mux {
 							groups = "spdif_in_a10";
@@ -1326,30 +1349,6 @@
 						};
 					};
 
-					sdio_pins: sdio {
-						mux {
-							groups = "sdio_d0",
-								 "sdio_d1",
-								 "sdio_d2",
-								 "sdio_d3",
-								 "sdio_cmd",
-								 "sdio_clk";
-							function = "sdio";
-							bias-disable;
-							drive-strength-microamp = <4000>;
-						};
-					};
-
-					sdio_clk_gate_pins: sdio_clk_gate {
-						mux {
-							groups = "GPIOX_4";
-							function = "gpio_periphs";
-							bias-pull-down;
-							drive-strength-microamp = <4000>;
-						};
-					};
-
-
 					uart_a_pins: uart-a {
 						mux {
 							groups = "uart_a_tx",
@@ -2316,6 +2315,19 @@
 			};
 		};
 
+		sd_emmc_a: sd@ffe03000 {
+			compatible = "amlogic,meson-axg-mmc";
+			reg = <0x0 0xffe03000 0x0 0x800>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
+			status = "disabled";
+			clocks = <&clkc CLKID_SD_EMMC_A>,
+				 <&clkc CLKID_SD_EMMC_A_CLK0>,
+				 <&clkc CLKID_FCLK_DIV2>;
+			clock-names = "core", "clkin0", "clkin1";
+			resets = <&reset RESET_SD_EMMC_A>;
+			amlogic,dram-access-quirk;
+		};
+
 		sd_emmc_b: sd@ffe05000 {
 			compatible = "amlogic,meson-axg-mmc";
 			reg = <0x0 0xffe05000 0x0 0x800>;
@@ -2340,19 +2352,6 @@
 			resets = <&reset RESET_SD_EMMC_C>;
 		};
 
-		sd_emmc_a: sd@ffe03000 {
-			compatible = "amlogic,meson-axg-mmc";
-			reg = <0x0 0xffe03000 0x0 0x800>;
-			interrupts = <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
-			status = "disabled";
-			clocks = <&clkc CLKID_SD_EMMC_A>,
-				 <&clkc CLKID_SD_EMMC_A_CLK0>,
-				 <&clkc CLKID_FCLK_DIV2>;
-			clock-names = "core", "clkin0", "clkin1";
-			resets = <&reset RESET_SD_EMMC_A>;
-			amlogic,dram-access-quirk;
-		};
-
 		usb: usb@ffe09000 {
 			status = "disabled";
 			compatible = "amlogic,meson-g12a-usb-ctrl";
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
