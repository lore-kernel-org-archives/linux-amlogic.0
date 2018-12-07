Return-Path: <SRS0=njkK=OQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA99FC07E85
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Dec 2018 10:53:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E7D020892
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Dec 2018 10:53:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sFGjDlli";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="m/xjIQul"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E7D020892
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d4h6+yWVjVZHrxvovgpP7i8hRaPEsQemSBdQXZMU09k=; b=sFGjDlli16tke8
	Q3n2NFYfFATmrCwVitZyPqiCeJYASqvvi7MKVB/g0HzXkQqDMESANJ2IiByv2jmPKKbWSfeL0Efir
	T6iTbS1DQIQjSFXGm3IxMIhidtvDirazxLhm74lisi/77e/M47MkCJHxaeVcAz8VtnVutx53vnzkv
	axLvi0H5XS4EEr2cjbE2q8ujDlrWWAbPUCaeje2nnpp/s/gIrGLcw9dXL4UgfonLDbA1gH6OZY3yn
	PpNWzrycnfEHEAGgKloNVOb6dOaDPluTccgWHrx4GRXdcrEMrAo1G1LFsr1RBzmnrmBgWV3unfDqp
	7TPe5uiPKkUAQkI8OT4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVDky-0007WV-GV; Fri, 07 Dec 2018 10:53:16 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVDkY-0006y1-0b
 for linux-amlogic@lists.infradead.org; Fri, 07 Dec 2018 10:52:51 +0000
Received: by mail-wr1-x443.google.com with SMTP id u3so3378102wrs.3
 for <linux-amlogic@lists.infradead.org>; Fri, 07 Dec 2018 02:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6va9uCpYQugXPSPBSUpN4XAYRxV90Vj9sDt46ZNv9ts=;
 b=m/xjIQul5bLIpHPVnJh8BrKkQ+u5UclD6qHu2ItZoXL74vA2ev5euMuA9dvp8QDUgl
 Aa+O4demh3SmZ3IgbvdMeFMUPlLR5wML1NiO+wz8e0T6DZ69OZCDYW64zInSRj1pY33e
 zf5UCVouqP6pA22G0j10AVN5fXzCOM0GBfmbG0AMuI9Rx1rwQGbxCACEWAnTgpjXpEdz
 jGg/e/r5ypO5ig+y9D6bPAEfbouvLYERqelvoF8wIMRp+SPmW6ldVQ1ydT0zsNrKn84P
 xGTFpIqG54vrILtJTzA/uUPFDFN8byflbhv9Qw1gAS2MrcI1r80c7CjlA2VWzLZqN3Vc
 13xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6va9uCpYQugXPSPBSUpN4XAYRxV90Vj9sDt46ZNv9ts=;
 b=pVl84W2rrJeaKxpMvERRk11siYy4DU0XBUIik3nRxaEAty2fFrvK4ogJlnYhP9Qo/1
 QF5A1PQ9pv9AIBy/eqwu9Waimn7Fk2f2/Uo5xvdaWZNP/tTrkt/4BEPflNtv0Kk8sS0J
 oWbszLj8twL+lwlLJcsWDZLMuN/JK75gcVMROP7kXQUAlTKdSoPw9G4xdhmo2jaw/juj
 ealsrZ1j4OGaH3gqXaYiyijaD7GfCYxXDLZ4UyzdD/XrlBFzLIvimNUQ8jhRm9+VCOvE
 3Zai3qNoKbbYFWgcGR1jFHMk03kZBhJXPRAGrtOQ072nbC8d/0aa/iKMsEmKBJuwqLoo
 mTjg==
X-Gm-Message-State: AA+aEWai0oNpgM6XYjSzZqheX7+Yfe32XE/URz/6+NUDczKJkvC5LkYr
 Z5Hhu6U4uk3iUutI1/P9prn4ow==
X-Google-Smtp-Source: AFSGD/W+6e8OTSkktO6mTygdCjZITLqRjnvxbt2LNkQV1c7hs+Xf5Z7xrMnV9GoZIVHHN7lYWQD+cA==
X-Received: by 2002:adf:ce02:: with SMTP id p2mr1499958wrn.185.1544179957940; 
 Fri, 07 Dec 2018 02:52:37 -0800 (PST)
Received: from xps.home ([2a00:23c4:f7a1:ce00:800d:14be:d1d:88c5])
 by smtp.gmail.com with ESMTPSA id v187sm1234684wme.0.2018.12.07.02.52.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Dec 2018 02:52:37 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, martin.blumenstingl@googlemail.com,
 ingrassia@epigenesys.com
Subject: [PATCH v2 2/2] arm: dts: meson: Fix IRQ trigger type for macirq
Date: Fri,  7 Dec 2018 10:52:31 +0000
Message-Id: <20181207105231.25593-3-ccaione@baylibre.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181207105231.25593-1-ccaione@baylibre.com>
References: <20181207105231.25593-1-ccaione@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_025250_051894_3041E7FD 
X-CRM114-Status: GOOD (  13.53  )
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
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

A long running stress test on a custom board shipping an AXG SoCs and a
Realtek RTL8211F PHY revealed that after a few hours the connection
speed would drop drastically, from ~1000Mbps to ~3Mbps. At the same time
the 'macirq' (eth0) IRQ would stop being triggered at all and as
consequence the GMAC IRQs never ACKed.

After a painful investigation the problem seemed to be due to a wrong
defined IRQ type for the GMAC IRQ that should be LEVEL_HIGH instead of
EDGE_RISING.

The change in the macirq IRQ type also solved another long standing
issue affecting this SoC/PHY where EEE was causing the network
connection to die after stressing it with iperf3 (even though much
sooner). It's now possible to remove the 'eee-broken-1000t' quirk as
well.

Fixes: 9c15795a4f96 ("ARM: dts: meson8b-odroidc1: ethernet support")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm/boot/dts/meson.dtsi           | 2 +-
 arch/arm/boot/dts/meson8b-odroidc1.dts | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index 0d9faf1a51ea..a86b89086334 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -263,7 +263,7 @@
 			compatible = "amlogic,meson6-dwmac", "snps,dwmac";
 			reg = <0xc9410000 0x10000
 			       0xc1108108 0x4>;
-			interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 58669abda259..a951a6632d0c 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -221,7 +221,6 @@
 		/* Realtek RTL8211F (0x001cc916) */
 		eth_phy: ethernet-phy@0 {
 			reg = <0>;
-			eee-broken-1000t;
 			interrupt-parent = <&gpio_intc>;
 			/* GPIOH_3 */
 			interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
