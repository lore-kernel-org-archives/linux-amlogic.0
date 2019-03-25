Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4235C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:04:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7630520811
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:04:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fgr8tbe0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Fxrp6R8h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7630520811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H7tClXBCElGXgHK3kuXFxY7aDO2DXsAWQQ2dopt9GqM=; b=fgr8tbe06E7OAA
	WeHLk/HESDwvsvzQ7uzk7T6YfqpOs8dxABuv68il07OElBYn2VcqDmh6nwJsfLUDkGIllNb3+iP2M
	/OAwDK2VUHe6STDrYWZWFjH0rwmcQDyFK0SVX4r8hFZkRVW9vchuc2nzEzVbUm9mWFCnStrJYHcGt
	8xNHXC5+cNFEdz5KAnD+/d9OR/RGoDa4pNk3pXomuaW1qMjoD8t7L2+tLhL6wIHWOw/ELBalz4ohI
	Q21SA0cImAr9Pw77TLo4KKi45Mo1pjZZU7AZfoBugURhJUkewCyLjYQWN2BP55V3o+sCna1F0LJSJ
	zsw8kyUFPF10h6SSzSFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8MT5-00019i-Fl; Mon, 25 Mar 2019 10:04:35 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8MSJ-0000Bc-74
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 10:03:56 +0000
Received: by mail-wr1-x442.google.com with SMTP id w10so9356554wrm.4
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 03:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rj9dXO0PSj4zIwHhB+C8+xFo6dIfbTEEVH7yM8XGRx0=;
 b=Fxrp6R8h+NKPanlYEVS38S/Unml0hg3ZHiP5CaA1fDrXqH3pXJaw/FBJ6jgu1P91pG
 1WEjOkcERfhTNiR0A2r8nkQpEc02BP8AaDn673PxQyjzXNNaCOhhc7nRMcfeC4yC00RI
 eUBd69ABkGT6DRagLlq2jDzBkqN9gFsaUVhBKMsKq+ymKMdyQodoctMu27o76SXZysLU
 ur4Off/qD4xu+D564EI9xbMLMWUmZNf9c3XqDyjtjhOZQpC4THpR+oeH02jXavHnm0N1
 tyZgL/R9ShGdS9BD5CgL2wTttBUHA/Pozlf7MUGYa6oURrqcnXSp++pPaHN+h3/bz1X5
 fj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rj9dXO0PSj4zIwHhB+C8+xFo6dIfbTEEVH7yM8XGRx0=;
 b=TWY5PRILzk6rKjB+38m11DjTFCWJu0Nw0GM6eH6e/8WBP7bjYmbd/EXfL6ovX8TxfS
 C7u7s8APdaqjO001x5CLzoIaFIoiUvHl1cMc2BfpLcMqxmbdVgpL1ZP+WkIkh6WTni1G
 v5ZFXCCL68pp3RP7JMqYEbqosB7TvVLz1LUnE5nzhB5z48dnUkLwy3ZHxJlxIVtPF2Y4
 RKvCqy4DErQXTkHMDteuJJH/+ZciVKzi0UoYNIQArogjfxLyJQUULFU75ETYf9ja6LNO
 +rwrRNeqyn6DrQy3lSFXgeiF7tXLOeqQLFDR3ACy9Tb/EczI7KG7ZslmrzINlgsXPPne
 I7Ig==
X-Gm-Message-State: APjAAAWjlkM/yRWy8MZKPgHpY9hHz9XZvxcIGTOFb/9z4Sz4WJJyyI6a
 iP+UiVoIXHB6242rS9D6QzBwew==
X-Google-Smtp-Source: APXvYqy04QdQFMmsanhWv+DXKuDLHOz2aBSfy9CCzE/uLnHyaXZeC4TZPvMUcevf9kSZusb/dSr8GQ==
X-Received: by 2002:adf:eb89:: with SMTP id t9mr14473811wrn.21.1553508225262; 
 Mon, 25 Mar 2019 03:03:45 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g12sm11581215wrw.40.2019.03.25.03.03.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 03:03:44 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v3 3/3] arm64: dts: meson: g12a: Add mali-g31 gpu node
Date: Mon, 25 Mar 2019 11:03:39 +0100
Message-Id: <20190325100339.749-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325100339.749-1-narmstrong@baylibre.com>
References: <20190325100339.749-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_030348_083256_4B26CD25 
X-CRM114-Status: GOOD (  10.62  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch adds the ARM Mali G31 GPU node.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 27 +++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index a9cd91f033f2..c762e2309b2b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -433,6 +433,33 @@
 				snps,quirk-frame-length-adjustment;
 			};
 		};
+
+		mali: gpu@ffe40000 {
+			compatible = "amlogic,meson-g12a-mali", "arm,mali-bifrost";
+			reg = <0x0 0xffe40000 0x0 0x40000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "gpu", "mmu", "job";
+			clocks = <&clkc CLKID_MALI>;
+			resets = <&reset RESET_DVALIN_CAPB3>, <&reset RESET_DVALIN>;
+
+			/*
+			 * Mali clocking is provided by two identical clock paths
+			 * MALI_0 and MALI_1 muxed to a single clock by a glitch
+			 * free mux to safely change frequency while running.
+			 */
+			assigned-clocks = <&clkc CLKID_MALI_0_SEL>,
+					  <&clkc CLKID_MALI_0>,
+					  <&clkc CLKID_MALI>; /* Glitch free mux */
+			assigned-clock-parents = <&clkc CLKID_FCLK_DIV2P5>,
+						 <0>, /* Do Nothing */
+						 <&clkc CLKID_MALI_0>;
+			assigned-clock-rates = <0>, /* Do Nothing */
+					       <800000000>,
+					       <0>; /* Do Nothing */
+		};
 	};
 
 	timer {
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
