Return-Path: <SRS0=dEj7=FA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7079C56202
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2020 14:16:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C65020679
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2020 14:16:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M6sadIkQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="htizOl7v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C65020679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pZQ3nYZ5vZH7Q5BJXbUEOsYjbgnc+OY93kaoslhAEYo=; b=M6sadIkQ8vE8KqXRgB4nvsHEY
	WUXOyUksCvfdQ/Yd01lqUy32GnwYXz2Cb21q/yoC5qd1jqWlNO25t0Y7sGTEiU6w4LU8OQ5zS42xc
	cQOQAos2M3U0OQHtVaFzh+JdTQv5jrxLLS8oBnHAFnjh0d5VRdlKIlLahYz2OWYWm3gRBW75qh34W
	CZNrgodZHpP0Xa6Rmk6qHLn3frL+eWxnt8btwaWfLgl6UQPCB5ow8U8YSFlQg/REkqD1VFSA71VDs
	er2WZcwSThDLLYVhMnFHfWn2RF/uzFwW6k7tzgpXQnkcs/O53WMraoZY/G/S9c8mK0LiCd3riOprM
	diX28kdsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiI4D-0000n7-S6; Thu, 26 Nov 2020 14:16:13 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiI47-0000kG-Da
 for linux-amlogic@lists.infradead.org; Thu, 26 Nov 2020 14:16:08 +0000
Received: by mail-wr1-x441.google.com with SMTP id e7so2306957wrv.6
 for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2020 06:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KBjcN4mFZs97LIMNRwXyk/FuZp47lAZQ6VC4MRI2zF8=;
 b=htizOl7v4ehnzI03MkBzd/10tRkGIW8okJkiBVASAK9yFchj/lRdywBhDo5M+J7fBE
 8FB8G+ZbSyH5XHiET9GlaTid00PEun7FKmPo4Iapv1SPIqrM7D9wC+NwCz7EIVd9x+Cm
 G0KFsN3M779XYrNDcrRgJhEa3mys4HJyyQP63P4ZnoHikd+0/cnld++5n3amgKGZJgYD
 B0habab18SeoRLxiS/VUTqqAUYv/8BBvETlyWzV4pQLUVLhBU4ozfsbCBGF6icZK4BuL
 4J9nOL2TxxhNbUROOvQEvVCOYw5na/OVh34DKE0HbsqGfC4ZICOpT6Nklrd16HJ82iJE
 xhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KBjcN4mFZs97LIMNRwXyk/FuZp47lAZQ6VC4MRI2zF8=;
 b=TCQMMXoF5roYBRn40Xcs5df+pYTyKJVCLG31Sosy0K2tcoqzRV2j52tM3zZVahx/5p
 2DzYPc9ZRqqsFgefTCKEsM+dB+uliT1ArIjp5pbfP70OaMgqHr0FpvOcehQsNi4X3a6x
 AqpqdoZ/h9u5euS8MmhisrRlno2wIprCAt8FLIA0humtnX97wtHn2K1pPrAaCFA4E5mC
 tUrqkan5elxYXqkSRuRl48KShhLqT8CFbAUaIEyPxgcn93dLZdTzLl1PlAXFLDLuQbx5
 gqFTxGON0cwOS25K57waQvfmDOQpQGvfxNF18isRUEPTMabpE23C3wQlUGxYSHA/ZXfZ
 ucIw==
X-Gm-Message-State: AOAM530OWoOfYMZanBSQT9/Le3tH0Dy5KK/XMbm3d5OqfgXFsRPqDT65
 kWA5TiCQbwbItHq/E3dN6uhAQQ==
X-Google-Smtp-Source: ABdhPJwG49zdXnBJbddYYrxB7AXe25CRpTHBMInjdcCy2QlZh2YETPr8H2tAHE0X46kbNdlg3SLbmQ==
X-Received: by 2002:adf:f143:: with SMTP id y3mr4175165wro.138.1606400166326; 
 Thu, 26 Nov 2020 06:16:06 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:193b:ad82:52ad:936c])
 by smtp.gmail.com with ESMTPSA id q16sm9286079wrn.13.2020.11.26.06.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 06:16:05 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH v2 1/2] dt-bindings: clk: g12a-clkc: add DSI Pixel clock
 bindings
Date: Thu, 26 Nov 2020 15:15:59 +0100
Message-Id: <20201126141600.2084586-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126141600.2084586-1-narmstrong@baylibre.com>
References: <20201126141600.2084586-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_091607_524837_D7F78825 
X-CRM114-Status: GOOD (  12.09  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the MIPI DSI Host Pixel Clock bindings.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/clock/g12a-clkc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 40d49940d8a8..a93b58c5e18e 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -147,5 +147,7 @@
 #define CLKID_SPICC1_SCLK			261
 #define CLKID_NNA_AXI_CLK			264
 #define CLKID_NNA_CORE_CLK			267
+#define CLKID_MIPI_DSI_PXCLK_SEL		269
+#define CLKID_MIPI_DSI_PXCLK			270
 
 #endif /* __G12A_CLKC_H */
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
