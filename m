Return-Path: <SRS0=ycqe=ON=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FF9C04EBF
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 16:05:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50C732081B
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 16:05:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SpGM8FQp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HumzKVYE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50C732081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xjlnN5vh/qadtw05fgEerLOqf5MubDsB3xYBc3pZidw=; b=SpGM8FQpPOEC51
	VKMn4Iyvg95QTWO+BUqOqUcn63ha7serSFCSotaUOZ581qTJ46UDzXTOoqDKvkourb60ghlbm7JUI
	ZzPdn2xCuc+5EDZ4nG43AG81QgPPl4s7/gX6v8XWmnXy4m8+LtGVrhCdsMRGfKypnuxS6Tc5gbxmr
	UNjUc3kuDkiado9NLfJtHAr9vWKkLnjFeXNPhryj5ZfeBzq6Bgmp3ExnaE4mTa2ZqjHDfsZU8zQcg
	PyPDNaw6hImYBiCgQWBKU+DHy1GhtpDQBcRzLik40B8FaoEpb7xxUhCyAK6QPJpJxB9SZJVL4cuRW
	T0WXQU4UCRToLDfaNOZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUDCc-0005gt-Tp; Tue, 04 Dec 2018 16:05:38 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUDCC-00040h-79
 for linux-amlogic@lists.infradead.org; Tue, 04 Dec 2018 16:05:15 +0000
Received: by mail-wm1-x343.google.com with SMTP id y185so9743120wmd.1
 for <linux-amlogic@lists.infradead.org>; Tue, 04 Dec 2018 08:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+mmyKSe8RhG6C5GdPFMiEIaydW42TIFAIaOelZC+wSA=;
 b=HumzKVYEoC0fGGjQvx2NsKH7NCK/dCpgjr9RncujA5A4uCuTmGCG5SNkHWdrUTMhbd
 Xu8ozAZAndJfTMry1rtH+urk7NJLuAOOPpNZJHGU/MhSCa7KOrmDrTiAnjXlcpbuSaLZ
 4vRtk/O8DatgDYrNSL3PS+NK/7IgSK0lFeO6n3vczYKR8ykOz1DzVirsi1G/zx1Pyfvf
 WbBbxQqdf9O0tesdvYPtXvr8bhHDP0u4wvcFAmmtQ7S5m+563zVeRtxON4WbIT5Ctfjx
 +Q/VsOrmGp14yofxfBKHmFoBudUN27D2xjkF2gvDaHcv/hyUZok1RumkAVEjOLdNe42Q
 QhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+mmyKSe8RhG6C5GdPFMiEIaydW42TIFAIaOelZC+wSA=;
 b=lA/w8IE0JArCqA3auKilsqxMeq8P5MK1vlZD4YgcCsrSeI0wxZc1Z/csGmxn77tPiB
 rKnWqQ1I79OT2gmnN4LYCCVtxoi++IP1s1VJpQDzBpFlasxPxmR8e+cAQj1niPUIRMXy
 eSa8uBT5VkSMWew45Eag+T/itbhweUB/pu/QuavuglRvovMxPYrJhloMyGHCKwEuszNg
 Xy6e/4TDxYfrCydxZ4Jk1Jzw9yFEv+FMKpfpom1zkJnyTAzZoopGMNg6Sqyn+LSGYgx9
 E9yl2qweyRMdzrjIC/6jIgo5/yrkCKJwzoJCDvzMLDRFA4hbNNddl2N/0a4ppLadtRzD
 Sy2g==
X-Gm-Message-State: AA+aEWbIFbLB1U9BgLfopwj/nov4j1yMvP0Rov2A84ESHwdnXo0wHLhq
 M2j/lrlgR1y0VmrFyOwKBFgCDA==
X-Google-Smtp-Source: AFSGD/U4iFmxXdG9k7sTnqG4xIIhyaa5DDwGNZi29MKqiZ46pRwpoIEJA2v/2CogcsYeGmE+K68MMw==
X-Received: by 2002:a1c:630a:: with SMTP id x10mr5313269wmb.63.1543939500496; 
 Tue, 04 Dec 2018 08:05:00 -0800 (PST)
Received: from xps.expressvpn ([2a00:23c4:f7a1:ce00:1581:6f5a:196:51f2])
 by smtp.gmail.com with ESMTPSA id k23sm5451585wmj.32.2018.12.04.08.04.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Dec 2018 08:04:59 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, martin.blumenstingl@googlemail.com
Subject: [PATCH 1/2] arm64: dts: meson: Fix IRQ trigger type for macirq
Date: Tue,  4 Dec 2018 16:04:46 +0000
Message-Id: <20181204160447.27869-2-ccaione@baylibre.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181204160447.27869-1-ccaione@baylibre.com>
References: <20181204160447.27869-1-ccaione@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_080512_293206_35E41C26 
X-CRM114-Status: GOOD (  11.99  )
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

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm/boot/dts/meson.dtsi               | 2 +-
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

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
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index df017dbd2e57..b1a42e99cb67 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -143,7 +143,7 @@
 			compatible = "amlogic,meson-axg-dwmac", "snps,dwmac";
 			reg = <0x0 0xff3f0000 0x0 0x10000
 			       0x0 0xff634540 0x0 0x8>;
-			interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
 			clocks = <&clkc CLKID_ETH>,
 				 <&clkc CLKID_FCLK_DIV2>,
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index f1e5cdbade5e..58e6bcaac1d8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -462,7 +462,7 @@
 			compatible = "amlogic,meson-gx-dwmac", "amlogic,meson-gxbb-dwmac", "snps,dwmac";
 			reg = <0x0 0xc9410000 0x0 0x10000
 			       0x0 0xc8834540 0x0 0x4>;
-			interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
 			status = "disabled";
 		};
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
