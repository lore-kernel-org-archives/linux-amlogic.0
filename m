Return-Path: <SRS0=+PkE=XA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92DBDC3A5AB
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 13:00:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D81A021BE5
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 13:00:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SIG+xQcW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SnuwT5mI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D81A021BE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WLIby0NnX7eSlRNbinR/WTUBXwYeZaWDHfm6jvtTM78=; b=SIG+xQcWeYt/ca
	+5X4d87adCytCWVV47cWZ1K70fINtmOioENfTM3LLPPkY/c0XQb4tL/hTEzCOMADDEWb0czvxV6Bh
	y6QSpypqS3GznXhF1chhY4aeNM5dIFKPVaga0u2at3aiKbs7kcEq1u2oejzLG+lusRkbUb+n3o58l
	uok7VapmgxFYCR7MO1tl9lilmfecrz0BgJoVlhVyW7lYMB/67t2b4re/lX+AX8t2yUp5LTuRik5nP
	PD47xIOmr6/Zoj0JY67rwJKtxY+xazMLuNHs/9sMCYxJaIStQbdJb7y2CkswaR81ymRVWNuG3EiAN
	RCIyqd0ycdH9Sm7TI1rQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5rMx-0006Xe-QA; Thu, 05 Sep 2019 13:00:11 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5rMt-0005zs-2m
 for linux-amlogic@lists.infradead.org; Thu, 05 Sep 2019 13:00:08 +0000
Received: by mail-wr1-x443.google.com with SMTP id q14so2658628wrm.9
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2019 06:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=to9nPxGvpAjI2vmBY6hiBkK0HN4KqohuKcK/qXqDNPY=;
 b=SnuwT5mIhn9C8R/kG87+eslWK4M08z27tnIDQ/toGWNx0ojS1cWn09AJM87Ul8otC7
 syKEujMS+EpLHYDEiwjuyN/zVqjk1XKNHnRjjFPN4NW+7Hy7872vp62w8rS/Q4JF3qkg
 rs98UZRdufTi7TKufZ9JeOQe450oKBOy4WUSlTUQcdNKLHTvUI86418VWK+TXUEx1z8P
 LlT1Wfexo1rLCmmkX8GIWWbLAOiv/YPzM7Zg4HEVtTLcYMkV7iMRt/AGmQMuxWQfs5TL
 ZdT0b4OU5F1WaXI7hc3EZ7lsKR3Tj50eg6jkJSMHVWQyLtuZR5BaxpMWMSpsNNgeyOIa
 SoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=to9nPxGvpAjI2vmBY6hiBkK0HN4KqohuKcK/qXqDNPY=;
 b=GfZMF0yNUOzL3uG7koYKxUXuplIzru0hhAEKf/5P15HeOSyRPvpSG5vfswjrh4eRYh
 2zDpH0AphdXcFFl5bvdqdIrlPPcVDnktWtbzHCkA5hG+RKgUiFPUEFs8C8Z5sj+gHRn5
 f/p0Y/2Yjg/CiyrPwbIT3d+k8MoUL+PjD0Q1JQZ/KIJrR5C95L1tEJVIBn0M1kaHECne
 j2yItZHYMUNAbsc9hp1CX9ZkvnmQlDkwtIjHtHNE2JiPmBaJqqg3eVtfAcTxjiG9MK0H
 s+JW1uVg2rKorT2qFyTcmAcmvPigNX9x2QgOrTd/GaBbqQKxUfEKDVJDfveIAwyyupe0
 pPrw==
X-Gm-Message-State: APjAAAXktIM+CjQgMFKiL6QpdJ4Tw9A64YauDeQSC08xwn2YOj8B48Wa
 H/I2jW/WFGSXF3uhrIKgglzKLADYvCTgAQ==
X-Google-Smtp-Source: APXvYqyWLZJ5ptNeLjAU/5Y4+RE4paQzv79ZLTG/PR8hFu5o1WDdkpKLnFc5q7mcqJc3J1ZSrLAgjA==
X-Received: by 2002:a05:6000:12d1:: with SMTP id
 l17mr2510949wrx.91.1567688405327; 
 Thu, 05 Sep 2019 06:00:05 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z189sm3727903wmc.25.2019.09.05.06.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 06:00:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/5] arm64: dts: meson: g12: fix audio fifo reg size
Date: Thu,  5 Sep 2019 14:59:53 +0200
Message-Id: <20190905125956.4384-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190905125956.4384-1-jbrunet@baylibre.com>
References: <20190905125956.4384-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_060007_138005_1F5E4402 
X-CRM114-Status: UNSURE (   7.43  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The register region size initially is too small to access all
the fifo registers.

Fixes: c59b7fe5aafd ("arm64: dts: meson: g12a: add audio fifos")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 3f39e020f74e..0ee8a369c547 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1509,7 +1509,7 @@
 				toddr_a: audio-controller@100 {
 					compatible = "amlogic,g12a-toddr",
 						     "amlogic,axg-toddr";
-					reg = <0x0 0x100 0x0 0x1c>;
+					reg = <0x0 0x100 0x0 0x2c>;
 					#sound-dai-cells = <0>;
 					sound-name-prefix = "TODDR_A";
 					interrupts = <GIC_SPI 148 IRQ_TYPE_EDGE_RISING>;
@@ -1521,7 +1521,7 @@
 				toddr_b: audio-controller@140 {
 					compatible = "amlogic,g12a-toddr",
 						     "amlogic,axg-toddr";
-					reg = <0x0 0x140 0x0 0x1c>;
+					reg = <0x0 0x140 0x0 0x2c>;
 					#sound-dai-cells = <0>;
 					sound-name-prefix = "TODDR_B";
 					interrupts = <GIC_SPI 149 IRQ_TYPE_EDGE_RISING>;
@@ -1533,7 +1533,7 @@
 				toddr_c: audio-controller@180 {
 					compatible = "amlogic,g12a-toddr",
 						     "amlogic,axg-toddr";
-					reg = <0x0 0x180 0x0 0x1c>;
+					reg = <0x0 0x180 0x0 0x2c>;
 					#sound-dai-cells = <0>;
 					sound-name-prefix = "TODDR_C";
 					interrupts = <GIC_SPI 150 IRQ_TYPE_EDGE_RISING>;
@@ -1545,7 +1545,7 @@
 				frddr_a: audio-controller@1c0 {
 					compatible = "amlogic,g12a-frddr",
 						     "amlogic,axg-frddr";
-					reg = <0x0 0x1c0 0x0 0x1c>;
+					reg = <0x0 0x1c0 0x0 0x2c>;
 					#sound-dai-cells = <0>;
 					sound-name-prefix = "FRDDR_A";
 					interrupts = <GIC_SPI 152 IRQ_TYPE_EDGE_RISING>;
@@ -1557,7 +1557,7 @@
 				frddr_b: audio-controller@200 {
 					compatible = "amlogic,g12a-frddr",
 						     "amlogic,axg-frddr";
-					reg = <0x0 0x200 0x0 0x1c>;
+					reg = <0x0 0x200 0x0 0x2c>;
 					#sound-dai-cells = <0>;
 					sound-name-prefix = "FRDDR_B";
 					interrupts = <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>;
@@ -1569,7 +1569,7 @@
 				frddr_c: audio-controller@240 {
 					compatible = "amlogic,g12a-frddr",
 						     "amlogic,axg-frddr";
-					reg = <0x0 0x240 0x0 0x1c>;
+					reg = <0x0 0x240 0x0 0x2c>;
 					#sound-dai-cells = <0>;
 					sound-name-prefix = "FRDDR_C";
 					interrupts = <GIC_SPI 154 IRQ_TYPE_EDGE_RISING>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
