Return-Path: <SRS0=V5Bc=SZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50358C282DD
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:03:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F7E720843
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:03:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MkoWdpD1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1WC11RfA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F7E720843
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qBtOo+Ufmu61mFD4U4T2JHqxnf77jLzspRVwz5TNMaw=; b=MkoWdpD10JElDS
	g2+qCPP28qhOE6J08kH2kEuz6KYfmVCHcBEp7vV/H5Py34GPfntit+QaPAOCyY53SrMeYOQSIxcGv
	OvXwHNAuOyqH4VjHe5QBaMfG5czQV8O5B8LB+jj13zqjiVoqybPl2vOq3eS1rexBTAsw1O44BLrmR
	FZqL8AFGm80RYgAMhe9bWWwg3BijX8rBmXe9w+BMtHcPxAAiLoceqw7/U/IER2XcImFBw/TaVfOGM
	iq1fZGTAf7ItZLXPgk9EBwrCRzOgVPQcnvDekoOZgFbr2nxpbha8bhK3Bzofj0yTQ9L03PTLCOwvo
	VjyKFPzOV2sqVp/f0QTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIrKN-0005on-2W; Tue, 23 Apr 2019 09:02:59 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIrKG-0005eN-3c
 for linux-amlogic@lists.infradead.org; Tue, 23 Apr 2019 09:02:55 +0000
Received: by mail-wm1-x343.google.com with SMTP id q16so17657594wmj.3
 for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2019 02:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lh/dg7Ph5gI3fwf6VslQBt0/ChaA/QQP0d5LUMjUu4Y=;
 b=1WC11RfAdc5GecWwsQU6yS8A+VNYwgWVMmL0MClvtzid3hmQvVtPUjHyJsiGJ2Xff9
 02WF36bW9tXM0GBMaZ+z0J3m116oKKreE8xdneCNqHBxr9CjABLDhUbc3J9AOhpoSIBs
 N02AwmWUiSmCeCU152QswI6kIDtqsvVThEbqrbHiPdaAOcrSy9gU44K9KxPIr8BObyfg
 z+xaQqIuGsvLC3hXnKKf7d30LDBEt4kE9TERhppVHZxupuq4eVq4G0FMDL0EewmI1gdF
 Z41N24f3zDhBcByx214ftOkS7jAOt0r2cviAzqbbcbbdOhZu6IrEaeFURU4+hiUxMNtA
 f7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lh/dg7Ph5gI3fwf6VslQBt0/ChaA/QQP0d5LUMjUu4Y=;
 b=Cs2cLJm6QZ/ejlUnHDEFps6PUoh9zwi+NcIMCangrBMw2nhSGcgRCvyi88OkZ4Assc
 wdE/M0aETqkPpwb7xjUrBJhl1A/ozuG701Ra6M0/+RLkIHwiLLbvnQIXy3khjt2GWihY
 w9CC7qrrq3lUm++/M+m09iBWKZNvir2Q42f6P/hDUrBkd4BeUE3mLM6tM6wEZTP/0EHX
 Iq3m7+VH18H+rpdz3RssWhtm+0RBBKAlo7l3ijV/vJ2e2dyp1fd2sv4Z7gw77eBjC8ul
 67ko9EUdGuURH8Zl7UXh4YpHx1Wz6fD8C4dr5Xkv0QhH7jRFgJspyKTNyXKI9BTj7Bfs
 WPtw==
X-Gm-Message-State: APjAAAWOSBQLMztajolbIEewArucepFstw80hgRE7LRYedyw8h1itNPR
 l9gd5XI3NrZCBJ7Y/LhFHdiM8KV4Ppw=
X-Google-Smtp-Source: APXvYqze6CIxZJgB35Vu4qp8N/8FwJB3NGJfMNlkaHj8DAKAdlAxTXUPR5lTiWXqYtiT64X3cDX0hg==
X-Received: by 2002:a1c:4302:: with SMTP id q2mr1458598wma.28.1556010170616;
 Tue, 23 Apr 2019 02:02:50 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z23sm12361894wma.0.2019.04.23.02.02.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Apr 2019 02:02:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 4/7] mmc: meson-gx: disable HS400
Date: Tue, 23 Apr 2019 11:02:32 +0200
Message-Id: <20190423090235.17244-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190423090235.17244-1-jbrunet@baylibre.com>
References: <20190423090235.17244-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_020252_642309_4A042104 
X-CRM114-Status: GOOD (  12.81  )
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
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

At the moment, all our attempts to enable HS400 on Amlogic chipsets have
been unsuccessful or unreliable. Until we can figure out how to enable this
mode safely and reliably, let's force it off.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 3df50b53f834..118f09da8dfb 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -823,10 +823,6 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 	if (meson_mmc_timing_is_ddr(ios))
 		val |= CFG_DDR;
 
-	val &= ~CFG_CHK_DS;
-	if (ios->timing == MMC_TIMING_MMC_HS400)
-		val |= CFG_CHK_DS;
-
 	err = meson_mmc_clk_set(host, ios);
 	if (err)
 		dev_err(host->dev, "Failed to set clock: %d\n,", err);
@@ -1339,6 +1335,13 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	mmc->max_segs = SD_EMMC_DESC_BUF_LEN / sizeof(struct sd_emmc_desc);
 	mmc->max_seg_size = mmc->max_req_size;
 
+	/*
+	 * At the moment, we don't know how to reliably enable HS400.
+	 * From the different datasheets, it is not even clear if this mode
+	 * is officially supported by any of the SoCs
+	 */
+	mmc->caps2 &= ~MMC_CAP2_HS400;
+
 	/* data bounce buffer */
 	host->bounce_buf_size = mmc->max_req_size;
 	host->bounce_buf =
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
