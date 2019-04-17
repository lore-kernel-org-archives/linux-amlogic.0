Return-Path: <SRS0=RDff=ST=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA1EC282DA
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Apr 2019 20:44:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B0612183E
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Apr 2019 20:44:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bRLVvqcd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1mPpeghD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B0612183E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qBtOo+Ufmu61mFD4U4T2JHqxnf77jLzspRVwz5TNMaw=; b=bRLVvqcdBYMill
	GauJYHM8jPfge/nAEX7C3JOaIqdQlguCzgcHKrqyknuy+wHugX5805gjPJLZYiXG8Xamd0w8tYv8C
	KgiqobNqdGkC6PPOqLObPuCca5NQdPa4rf9rEbmSeKhbTw//e6F5Tt+OksQHNEgF01JjeabJnTV6v
	cbYdiWZ+EVPFu1E9KLGSwWDZ6FU3gr5+wbuHvbLPJgyJEOcC8khhzfPweyedBwXk1QBGcRAtJx5x7
	NQAQg8NyFPfiPhZY8IrGNtr74FJ3NoeKxXods+CBxd06DYPKh76RYzXI8lJ6JSQMBsW02/1O5qax0
	ey4tIi2Ds9y2scVS3LIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGrPm-0002Ls-JU; Wed, 17 Apr 2019 20:44:18 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGrPg-0002GF-HI
 for linux-amlogic@lists.infradead.org; Wed, 17 Apr 2019 20:44:13 +0000
Received: by mail-wr1-x443.google.com with SMTP id k17so65665wrx.10
 for <linux-amlogic@lists.infradead.org>; Wed, 17 Apr 2019 13:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lh/dg7Ph5gI3fwf6VslQBt0/ChaA/QQP0d5LUMjUu4Y=;
 b=1mPpeghD3+pEqAmcuNDF7gqDFMo758uoBAud5UHWZIUDtRk8EjnSryUQy3VJHxY4MU
 FKz6W+RMZjKwMLDJgxlVOUSNX54BW4Ce1y6FcXZqfgiXH99tLHDoEfH5iK4lAAUXlao4
 2JDLy83rqkypIHa8CnAINKxYgU8w6FWfZIRRg8acw8dwGpYrRAtlFpDe9JwOUGm2OyJA
 qP0caZxUs0ivVIhNXdfXM50LKf9gan5hMB3RIYiowUH10Ubv94nQa7SQxG3AAAEvEVqw
 1x9jk61VkNsP+DKjek9Mds2fAVoyxjeOAIiObHA67mtw7wNfE2lLGJyJjS5YN1MwMegy
 PZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lh/dg7Ph5gI3fwf6VslQBt0/ChaA/QQP0d5LUMjUu4Y=;
 b=uUVavU5bmYIlrpE31MjA1RLi/D6BDkf89zOoolzlDqjkB6X9mk5VwfgyHRjew8FFBm
 Lxxsgr9N5MjIPmbjKSces24MOgMSxALNu8S6lPZ9+EDwlLNBHFD5/uDj3N9g8XtlGwl1
 rhYJKZrxFpMJwlUenGxKUgdPbmkWe6J/EAvtInRYtz8cSvnrj95aEG4rXU0DawQ6pzVi
 fQ/8N84fOhsSgOs1aMcTY4lT/ldhk9kt3/zXnG3sQlpQReMMSt7stKeUaHOKo1K4kMiW
 mp/liU9c7UfroS/cuWd/EkKWCjtxNbEWwKAnVeZg06tTerDCXqxesbW/EMMguXd5N9ek
 +UNA==
X-Gm-Message-State: APjAAAW1Mia6gmmW0UzQlb8MfFiZIXBKFZDZ9ZVefEhs3G2H2t/YOInj
 t1pWTI4uQPhpF3i7fNpFjEz05w==
X-Google-Smtp-Source: APXvYqxgXovl5BnoNoOEp4CmKK0ycCjwYYaDHc2FEDPp9FNNZMreUD7JhN81Sbr1WvTV9K7buaRB7Q==
X-Received: by 2002:a5d:6889:: with SMTP id h9mr34623582wru.12.1555533851257; 
 Wed, 17 Apr 2019 13:44:11 -0700 (PDT)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id c20sm98716866wre.28.2019.04.17.13.44.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 17 Apr 2019 13:44:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 4/7] mmc: meson-gx: disable HS400
Date: Wed, 17 Apr 2019 22:43:52 +0200
Message-Id: <20190417204355.469-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190417204355.469-1-jbrunet@baylibre.com>
References: <20190417204355.469-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_134412_572090_1700B395 
X-CRM114-Status: GOOD (  12.92  )
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
