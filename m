Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5603BC2D0E4
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 15:21:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C716B2245A
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 15:21:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rMgEQhyw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="n/pMuteV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C716B2245A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/UMB5lDv86IsNhfYTUQHyM416VSyA7LDOw8auxIWedM=; b=rMgEQhywYKC9Io0g5HBaIG4OJ
	IJVoz17nHwAfxf1G9WizSpNdwnvSE14/t2m3hH/oWnRG4lX4UOIBfoi8wRqsAYFLkyIeBNKf/0r4Y
	BtvKRU1FVGOlIbYLICqHZJBontA0UD1XDLaxqLjeH5i1dOGLQHVQSRNKwBmYDIsreCXgcr4ibca6N
	wkZIlZFQCAnWFYHCLzbD82nGDcggzIgjRnqWQwtOFQUr/cHh5f3y5dPL6hRMrW4UpoR5EkhFrmzv1
	f6fuzxidltM3y/JYqXCPKgu8WVUhN9oRVyyBlVsp3m789QeyO2d2/dXx9XwKmb2FQF6QwwUb+aSBG
	tnGrPtlYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg8ET-0004Hk-Pg; Fri, 20 Nov 2020 15:21:53 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg8EF-0004DV-4Z
 for linux-amlogic@lists.infradead.org; Fri, 20 Nov 2020 15:21:40 +0000
Received: by mail-wm1-x342.google.com with SMTP id a65so10140880wme.1
 for <linux-amlogic@lists.infradead.org>; Fri, 20 Nov 2020 07:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2IvsaRxlkYaeGWO/XxLo0cfwTuBt8jqtHYtt1Lx83QU=;
 b=n/pMuteVeHKykxWI2lEN0TRBOQ6ovm1raNNcPAFBwcqTfjnSdvg+bchGqVWcVB5YbC
 kJ2swqbQTQ8WFJgWJ0b73gRr6mUkCXhvSMOPszqsytGEALQRuHwjvtdz2vYKL/oLiYMj
 Set3jDoAE5bs4+zxPan7AvweVcoFnc1cm9WC+lM+Yr2SNcezK7lG1MaECUiyIt1hwUjj
 aAoJrUx5e1A45jjK/EEjEdrWdQChXlrsc+PnYh47MD0gJGfAPnf8HpzcYtfzhddGKrkf
 0N3oGYxd4VQ83dn6Pe9XcEkXAzN3PwhTM4NzkkykSZsvMIYKAtlcIAkdsGBD+PNpsrLE
 6aNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2IvsaRxlkYaeGWO/XxLo0cfwTuBt8jqtHYtt1Lx83QU=;
 b=G9rqOuk4BT0MT86fc5zO8OtHNRFMpFK2cp79j4cEsJTVBo6jqbD+iwPdGoXiWHp8zN
 BNBnM+paQj81SAFnj6uleoWO0yB5a206f83uEOrBd/j/zTnmn2uYTEkIICntrzaFHAio
 O3+6Gw6Iz2ysnBJAo5tXQlk4Qo59pZGYfDixvq8ViyxamvB8DSQwF7HsQDJt3Y6+keqL
 5l1VYAHrchANlavbIN0oqclDQaBfw+fpXooRrYajQXYKsr5lSLbeFiY+iJTJ3eGZVyYn
 Xi+5eITvcIa2/fDSWXAF9cXIW1w+9UHWmAkRd8or43nV+Mje0ZSS21+DjzqGlZDbFsXF
 sNJQ==
X-Gm-Message-State: AOAM533zcJEzO2uL/DkbMTgHspOqVDObOsB54X6qO+FOPUl3cZq41iQp
 dhWx6rwDxbnucNm/PeL+0vdLQg==
X-Google-Smtp-Source: ABdhPJzmbNpSp/WrsvW76hP3Zm8gdpqSmlrivsFnrRZ1fWnnF6WYbhJ+LXtWLcMxtrkwfrtJwnV2mA==
X-Received: by 2002:a1c:1b12:: with SMTP id b18mr10454975wmb.119.1605885697955; 
 Fri, 20 Nov 2020 07:21:37 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:419f:dca4:d17a:66a7])
 by smtp.gmail.com with ESMTPSA id j71sm4773757wmj.10.2020.11.20.07.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:21:37 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 2/2] arm64: dts: meson-axg: add MIPI DSI PHY nodes
Date: Fri, 20 Nov 2020 16:21:31 +0100
Message-Id: <20201120152131.3918814-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120152131.3918814-1-narmstrong@baylibre.com>
References: <20201120152131.3918814-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_102139_250475_85736446 
X-CRM114-Status: GOOD (  11.90  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the nodes for :
- MIPI DSI+PCIe analog phy
- MIPI D-PHY

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 288667699ec0..d811708f8f67 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1159,6 +1159,12 @@ pwrc: power-controller {
 							       <250000000>,
 							       <0>; /* Do Nothing */
 				};
+
+				mipi_pcie_analog_dphy: phy {
+					compatible = "amlogic,axg-mipi-pcie-analog-phy";
+					#phy-cells = <0>;
+					status = "disabled";
+				};
 			};
 		};
 
@@ -1171,6 +1177,19 @@ mailbox: mailbox@ff63c404 {
 			#mbox-cells = <1>;
 		};
 
+		mipi_dphy: phy@ff640000 {
+			compatible = "amlogic,axg-mipi-dphy";
+			reg = <0x0 0xff640000 0x0 0x100>;
+			clocks = <&clkc CLKID_MIPI_DSI_PHY>;
+			clock-names = "pclk";
+			resets = <&reset RESET_MIPI_PHY>;
+			reset-names = "phy";
+			phys = <&mipi_pcie_analog_dphy>;
+			phy-names = "analog";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		audio: bus@ff642000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xff642000 0x0 0x2000>;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
