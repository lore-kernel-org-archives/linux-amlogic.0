Return-Path: <SRS0=0gED=DF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1956C2D0A8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 16:15:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72AF620809
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 16:15:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N7+SBmhL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KntFXjgD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72AF620809
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ppyDd9iT3VpV7hhHtctsY6raYrmCNMO+ew8/aXT2+ho=; b=N7+SBmhLbC94n11IcgRf6txum
	ijEySw/ECoXG8H29RiErNiGpJxH5juaUs2pSS21OQOjjujqHBCyqkcvsfjUKCpf+Kjitotbwa6FRN
	s6sUiPyPxVsgor8YAjY2Bs2Zjndo7T5PVMy6VQe3974R7JRCa5YrFYRqrB23YZboWlU3tzRJdcLXu
	6f9lwkyqUQ+JBorA30W9naFddiZOGDlMqEu5n/OnWsuxCXEq/LQNrLWYzZy9VvCd06dvO+0eRYGkE
	WHetwBsrlOrseQEsIFnanL9yaDjS/Ig8nJeVj3Y0ytXlg1/s2KJTUnKmt/zJCoH5wIudBauIXBFM3
	NfHGVtRsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMvnj-0004hE-JL; Mon, 28 Sep 2020 16:14:55 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMvnD-0004W6-Kb
 for linux-amlogic@lists.infradead.org; Mon, 28 Sep 2020 16:14:30 +0000
Received: by mail-wm1-x341.google.com with SMTP id d4so1718950wmd.5
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Sep 2020 09:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ablR3knQp8V4Xus5gSWFEPKLooYQFHbeiNIFj+RtYYY=;
 b=KntFXjgD2m18dkgK66tvFC4NL+CIMRmAh9CUk377MLEQ/WTyC1lyFWb7bkzcD4vIK+
 uBNUqPJCtqMBM38BUEpYIgutrA3ErU+xmV8KzMl5TgOGSFRmF/PNwxHEaaW4j2Kv+LBN
 kNER1mcLg++pXJQBJxr7/8TVEPMvBQRW3kvy1zHLpLWke4ZOZWuFCozTFh4/4IE878T3
 ddOqHQf64ToPzd1wOg0dFyjPNw52jEryzRshdnVg3iWCmGd1jPUtrFvPz8R1SpFTaZ58
 UEvfHtZtRutCXIYnvWbzzTp9W9XmxYkChJ70SAXII4eFeSeyualRe1oar1mmql5yV2Dz
 jQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ablR3knQp8V4Xus5gSWFEPKLooYQFHbeiNIFj+RtYYY=;
 b=NTVQVXq8z5lz4TNSqXq10zRZVZUaSeXFnh7s/tptZmULDmDHUvPx+4Il7V95oQFDbc
 YrTk9khlLw3O8H3OeGTElTLaGN99DjRw2yT7NLQ12ng5dqcP2Uzlxwx8mtrB4ZdJQu3F
 8aEs0BL0O8QWxI6GCihMxAAhU+jP51oRmLuHzyDK2EOsdby4xiQ8CbRnljSFK3YKaJ8z
 Aody3e96mVv6ufZ0LAhwQ67vRsCLe1oZz4Kkm9b6lNKp/cY5Nt6pjBLMgVN2HEdbSF1F
 AdeR0Lwd4eNARpbZvQtquk2VNnyz6k80J+Tjj4nt0w35PizSafnQIbpZAFHsFEf2j716
 61mw==
X-Gm-Message-State: AOAM530Lvx2TKsjvgpeiu8ewGsIKSd7FDSRRDTzkjFKCj6wono+nsMsf
 FI8H5v/pGO+nZI4m8K//s6eEow==
X-Google-Smtp-Source: ABdhPJysuvPAxMmaEYUNYctclsXfDWSH9kSRmm+jOZyFHfsdftrc8VmKXkmBX+B1Zm9Y9XBuyoy2gw==
X-Received: by 2002:a7b:c095:: with SMTP id r21mr2527408wmh.133.1601309662206; 
 Mon, 28 Sep 2020 09:14:22 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:19c2:a71d:5af8:dbf6])
 by smtp.gmail.com with ESMTPSA id n4sm2004867wrp.61.2020.09.28.09.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 09:14:21 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil-cisco@xs4all.nl,
	khilman@baylibre.com
Subject: [PATCH 4/4] arm64: dts: meson-axg: add GE2D node
Date: Mon, 28 Sep 2020 18:14:11 +0200
Message-Id: <20200928161411.323581-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928161411.323581-1-narmstrong@baylibre.com>
References: <20200928161411.323581-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_121423_754435_587BCC0D 
X-CRM114-Status: GOOD (  12.39  )
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
Cc: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the node for the GE2D accelerator unit.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 4559f2173065..5cce5540cec0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1647,6 +1647,15 @@ dpi_out: endpoint {
 			};
 		};
 
+		ge2d: ge2d@ff940000 {
+			compatible = "amlogic,axg-ge2d";
+			reg = <0x0 0xff940000 0x0 0x10000>;
+			interrupts = <GIC_SPI 150 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc CLKID_VAPB>;
+			resets = <&reset RESET_GE2D>;
+			reset-names = "core";
+		};
+
 		gic: interrupt-controller@ffc01000 {
 			compatible = "arm,gic-400";
 			reg = <0x0 0xffc01000 0 0x1000>,
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
