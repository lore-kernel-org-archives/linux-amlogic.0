Return-Path: <SRS0=eCnW=ET=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908D1C2D0E4
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2020 00:06:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8598207BB
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2020 00:06:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Je/H39y3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="niMmvWPE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8598207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnsYIEVHkCjmZWDo6UHXOhQZud10qA2/R43mxjQIrUc=; b=Je/H39y3xHB8L9H49FmG9nBPbu
	jpViMhzkWzOm7R0EAHVm37dejyMMt2btg/BO846hu0PFB38vjrPoqQPykTjyRdNuRRlmgfLaI2BrB
	X687iny+1sLhxk0XO4iETjhQyFjsMBshcS83eI0eSmuHX0Ma+q1W6B6QbOpP2Bcg7plUI6EseBAfA
	BgyCdh7/K/Sim1y/BBNQznSTSfUi9oqW/F2p7jM7oMl6DNmOA+/ybQhegE36+0CTIR3bjcbTbCThq
	TnXcokjljd+RozN0RrV42aYV+6FeMgpE1L/ac6CYRfs2nMgSWAPgQTxySNa6Tn4JG+TV/JrRbgROO
	knbwyBNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdMbs-0000a5-Dt; Fri, 13 Nov 2020 00:06:36 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdMbq-0000ZZ-K0
 for linux-amlogic@lists.infradead.org; Fri, 13 Nov 2020 00:06:35 +0000
Received: by mail-wr1-x442.google.com with SMTP id d12so7829163wrr.13
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Nov 2020 16:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZVUOLs2+wec7oUYLZkwPoiWAkG2vGu94t71XbGuqA0A=;
 b=niMmvWPEl0fnMO6tMTcfpoR9YBUgH9zZ+Dt+igR122IRwmctAz3bKbFzybFAGY4KTn
 rBgHRqd+5WTm1+K4iHBPxBXjNjxewOhhq3oGz6A12hEUj5QytNgYQc7zZZPTM937L6b9
 lEOGfiE06I38tAMZxkJMGCb0D7EryshByXQUhSVfAo2CFCgwzcJh909decva2s/PSriB
 MkdMo50zmMS/bWfNuECwrXRWxamjBQJ/f7EM+wzu0BCr/N5nOHvprUi2hKLOvG4PZ6ie
 bXk+lvywpWHOm1vL/5Y2ZAF9yEdl4HAxALCaKk/gg6n+JLKgWdBegvdV+Fj9yjwIlyJV
 xcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZVUOLs2+wec7oUYLZkwPoiWAkG2vGu94t71XbGuqA0A=;
 b=gEaB3J3XTflZnatmr/1vb9qdsaADLNUqVGIo/H8BF3oYCabCNz7ECmHgTjCrijAtDV
 A0RUZEKhTSOzzhrOGPTGi2Jj10e1xoWSCXhPmxxvXqL2elbeUcaXV5Rb+djCP12adahh
 qTTLJNpNORcKRq7nZLD7m7cAFgjJz+uWvKPEO4m+nY10vyinXaISXyg2+CIDbNQShK/t
 bOvNCQz3cx+TcSRMBS8f3dThbaKixtb4HAhncBqkGXY7wdXY+iMiGxQp6lEwRsHu1Jgl
 oi51P3YBAIf1pAEOYGiC2ZX/JamOqueZHeyhZ6jWUCAGOKw2pvOcxQ5vhFcMUV6zjXpC
 WWBw==
X-Gm-Message-State: AOAM530akYdTjU2RROIlunBvOO0SLW0Zv3X23NBxSsJFatCstLmdQa8t
 dsK2CRpsRmrBOYzqrR9BqXI/kQ==
X-Google-Smtp-Source: ABdhPJz5fA46WACqLV9OOTCsKZrq/SjPVyoU2kKp5ypsUk30uRkroMV0nCS3uH3iuH+sVFpdC+luNA==
X-Received: by 2002:adf:f083:: with SMTP id n3mr2382435wro.391.1605225993485; 
 Thu, 12 Nov 2020 16:06:33 -0800 (PST)
Received: from localhost.localdomain ([2001:861:3a84:7260:5d3c:83d5:8524:33ca])
 by smtp.googlemail.com with ESMTPSA id t11sm2010114wrm.8.2020.11.12.16.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 16:06:33 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 2/3] usb: dwc3: meson-g12a: fix shared reset control use
Date: Fri, 13 Nov 2020 01:05:07 +0100
Message-Id: <20201113000508.14702-3-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201113000508.14702-1-aouledameur@baylibre.com>
References: <20201113000508.14702-1-aouledameur@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_190634_683712_A71B3E2A 
X-CRM114-Status: GOOD (  16.42  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

reset_control_(de)assert() calls are called on a shared reset line when
reset_control_reset has been used. This is not allowed by the reset
framework.

Use reset_control_rearm() call in suspend() and remove() as a way to state
that the resource is no longer used, hence the shared reset line
may be triggered again by other devices. Use reset_control_rearm() also in
case probe fails after reset() has been called.

reset_control_rearm() keeps use of triggered_count sane in the reset
framework, use of reset_control_reset() on shared reset line should be
balanced with reset_control_rearm().

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reported-by: Jerome Brunet <jbrunet@baylibre.com>
---
Important:
Please DO NOT merge before this patch [0] is merged, it adds 
reset_control_rearm() call to the reset framework API.

[0] https://lore.kernel.org/lkml/20201112230043.28987-1-aouledameur@baylib
re.com/

 drivers/usb/dwc3/dwc3-meson-g12a.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 417e05381b5d..3fec8f591c93 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -750,7 +750,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 
 	ret = dwc3_meson_g12a_get_phys(priv);
 	if (ret)
-		goto err_disable_clks;
+		goto err_rearm;
 
 	ret = priv->drvdata->setup_regmaps(priv, base);
 	if (ret)
@@ -759,7 +759,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 	if (priv->vbus) {
 		ret = regulator_enable(priv->vbus);
 		if (ret)
-			goto err_disable_clks;
+			goto err_rearm;
 	}
 
 	/* Get dr_mode */
@@ -772,13 +772,13 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 
 	ret = priv->drvdata->usb_init(priv);
 	if (ret)
-		goto err_disable_clks;
+		goto err_rearm;
 
 	/* Init PHYs */
 	for (i = 0 ; i < PHY_COUNT ; ++i) {
 		ret = phy_init(priv->phys[i]);
 		if (ret)
-			goto err_disable_clks;
+			goto err_rearm;
 	}
 
 	/* Set PHY Power */
@@ -816,6 +816,9 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 	for (i = 0 ; i < PHY_COUNT ; ++i)
 		phy_exit(priv->phys[i]);
 
+err_rearm:
+	reset_control_rearm(priv->reset);
+
 err_disable_clks:
 	clk_bulk_disable_unprepare(priv->drvdata->num_clks,
 				   priv->drvdata->clks);
@@ -843,6 +846,8 @@ static int dwc3_meson_g12a_remove(struct platform_device *pdev)
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);
 
+	reset_control_rearm(priv->reset);
+
 	clk_bulk_disable_unprepare(priv->drvdata->num_clks,
 				   priv->drvdata->clks);
 
@@ -883,7 +888,7 @@ static int __maybe_unused dwc3_meson_g12a_suspend(struct device *dev)
 		phy_exit(priv->phys[i]);
 	}
 
-	reset_control_assert(priv->reset);
+	reset_control_rearm(priv->reset);
 
 	return 0;
 }
@@ -893,7 +898,9 @@ static int __maybe_unused dwc3_meson_g12a_resume(struct device *dev)
 	struct dwc3_meson_g12a *priv = dev_get_drvdata(dev);
 	int i, ret;
 
-	reset_control_deassert(priv->reset);
+	ret = reset_control_reset(priv->reset);
+	if (ret)
+		return ret;
 
 	ret = priv->drvdata->usb_init(priv);
 	if (ret)
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
