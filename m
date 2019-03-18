Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0296DC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:01:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C64CB2070D
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:01:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A++VYUA2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0Nd48Q2D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C64CB2070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4GU0lSKxFINy4eAbj66C2lHGcH5yhA8Tk3NUYuOyQfA=; b=A++VYUA2+pHT5B
	r4UySnjNS+tf7TsiYh9DyX68CLD3Gw4SDQm3T8Uz7AGsEQWzQe9ACfPDuZ5oVWXr6BfB44hd++ouY
	GkRnLyBNhraY0VIwrB/EJqfl/TmYs3a/RCQHBPhfaWSUwYjZQ/RfQHNw8aZWrCLQe4vyp8YVNcbjr
	5lR1mz/Df6et+dRjgUx3waPOo8gb1MO1MKJQlj8guaiTUTlnyHg2o0Im/XiWZwzRYWKXm+ohWUB5q
	4SaFQZhwfossa1V2+yw8Y8gpftCoiD2KMQLDBFDp2qBDyZFiB7/nA+88JY+8kl0YbPgieOenBjmqS
	0xEcmbkTB2hFhDIv8CVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5p4s-0007EE-B1; Mon, 18 Mar 2019 10:01:06 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5p2u-0003g1-3g
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 09:59:20 +0000
Received: by mail-wr1-x443.google.com with SMTP id y15so16270958wro.4
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 02:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VjVBkKsTPRU/Q2eEbXFlLg5kFo5cEHjROJ7k0lYdBTE=;
 b=0Nd48Q2DZOWGKmW6OW1yTxm2aw4rIPbyuIFcDQE91ZJNwI8qsZP0JyweVN/WGi3uMo
 UcbYO6qUzlHiCmoGWYNA3AkPep0/bAjcPDLOwyCH6VmStAT5a0620eWllujGc6eolWVM
 9dnGS/4AgJn9AsJs28oTA1AtuYv1PNxYD/yazV2wMqrmNT9OCKMuGsROA6mIT8XkB5Sp
 RZtKpEMV7Ldo4r69JztYU8jpLoiLu6d2MUyreeQ6Rj2EeDzrF9BVHPvqUskw3pibT5M4
 uJwN/aq6tT/ooRnAqsJJuQ41NHWC4wyTAoYovD6riAmd0Kw+MEVt6tBRvM1coDH6yQYm
 WTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VjVBkKsTPRU/Q2eEbXFlLg5kFo5cEHjROJ7k0lYdBTE=;
 b=cvazPTlUqB98pr0Nzmwd1XUSghLcZ7xfblFnSYt1pvJrAH1PVSqdFworaoDy4QZ5FL
 K0hhgDvniLuNXOyNjPQrtvS2E+43d9lwMDIUdywB9NG+nPUj6vFKFyWZEbiP3XW77uXz
 REpSORVtosGNwU779iE2XWUa6qukRMht2ys2brgojRUB4WDmaMglMAO3qpwM3flc5vPB
 DzZGukjgJTdf81KRhCjLIpPA81COueZmztV/+7bMZE3qZntQMn6VQ6/Kauwb1jbtNJ2t
 ImZaj4AtMoMLeRw18Nfk7JYQaOUG2WsKbNYossfEFH5+FBkmfZ/VnIVfxSY3ZjeaWFi7
 e/rQ==
X-Gm-Message-State: APjAAAV27482iI1qdv9E+9h5lBHFxHxH85qhLPeYTeUxXPjfxqtTA4PS
 Rzewl2Re3lPZG8ETvkI1jpyO9eXbhvTW4w==
X-Google-Smtp-Source: APXvYqygEds8OM/Uu3G+2DFWP+jb/8sLRUfA0eTXcpWrTRmfAGHH4feF9X/2x97pubDm1W/5bO+bxA==
X-Received: by 2002:adf:e487:: with SMTP id i7mr11071619wrm.202.1552903142703; 
 Mon, 18 Mar 2019 02:59:02 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g8sm5459034wro.77.2019.03.18.02.59.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 02:59:02 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 8/8] arm64: dts: meson: g12a: Add mali-g31 gpu node
Date: Mon, 18 Mar 2019 10:58:51 +0100
Message-Id: <20190318095851.4062-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318095851.4062-1-narmstrong@baylibre.com>
References: <20190318095851.4062-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_025904_490210_C775C569 
X-CRM114-Status: GOOD (  10.44  )
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
index ce681aef8d5b..05f0f06f89a5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -421,6 +421,33 @@
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
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
