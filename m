Return-Path: <SRS0=RDff=ST=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8FCC282DA
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Apr 2019 20:44:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9611B2183E
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Apr 2019 20:44:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KshuuSJe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bLeAeSCD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9611B2183E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8phG6ya/ULKnYaQ6QrZTDFsdpDA3QnMOijsM9MFXEqo=; b=KshuuSJeifXNGT
	BK3CrjvzYSaPViW+AlC/tIrNfTasZqyRjeXT/Q8iTepmJ+KXUMnAuQZM9MhQOicSE5le9KGevfbzQ
	QIk1yiOpY4FbVQ0q+r1yGh1O/b4itJ0XsrfVV6dS86fr6BkaXEMk3OmE7qHamBdZa4Y4jbdG0TV1u
	hy1mwFtg28cp5Uh8LHjvyGng1pqukeGlSSkp52CG3l/qbnAkTpEAK82fgKuIaQsyK0uaKpg8EWxsy
	DxqfNEV88wIxNF+TeLEMqqKy0DECnbqq6lqTq2WGRBCQQUOakYTXs5N/iptQKF+JimcL7dAVx+qKR
	ltFa1+M20btVz9BdNHYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGrPs-0002UO-3W; Wed, 17 Apr 2019 20:44:24 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGrPj-0002HB-Pl
 for linux-amlogic@lists.infradead.org; Wed, 17 Apr 2019 20:44:19 +0000
Received: by mail-wr1-x441.google.com with SMTP id g3so70943wrx.9
 for <linux-amlogic@lists.infradead.org>; Wed, 17 Apr 2019 13:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kvQGbdki4sfylBEdmd2o1C+/gcCUzEF0u1B6+PlWzsU=;
 b=bLeAeSCDxjpzrqXrv63QkEP25CJLiFdCj0ISKvgqRrZ9LVlY9tFQsZT4R/yaVUFpTG
 XdX+JevCLjw0pz7aKTQNt/ICoNO41sh7qOD7w7WA4h9eXCiofyfBTVmYI5mLAQW4Q8K7
 hyIj+/2rvzv93aTsA3DCorfA7DB84hjwNDPchMl6oSWSdFZ7i6iXmwBMzsz9Om/qG1hE
 YznUjxVW14Gjz96SEja5nvVXIrivlMjcGKiFFbxdikHEV9kHMQRm0x2SZuui+uaefRY3
 KbyWI+oc1t4hjwbgj06WJvxhvOutgbStm1qHePI/KWLeKA+j5fZF/KhzGbK4ziTv+szd
 Ly/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kvQGbdki4sfylBEdmd2o1C+/gcCUzEF0u1B6+PlWzsU=;
 b=KEujkmcZvvBCC9DgTduU2IwgluMwLptGziYuL+HNEbKZi+uvwUKVkumx9LsnIPwBau
 mFUl8DbJOcsIxlyZDwuETbXnlfyU4fGUThja1yKWe7ov1CSRdNp9Z7s6Ny2E60Di30jy
 9zOtqcIqMsySw9zJNmI3MwTy74uICC+Z4zQLvgyw8URQdoXd9RjHsTUJXYm+MZyL9cap
 179qpTBF+J9mtoyyjXAnl+ccHxuUiKtF3Z8eNEzwC+Wwrf44oUi5WL8uQXS0W62FL7bX
 RzeK9EKzbe8T+FzhAsKbhic4oxmat7JrMRrpQaXfAvdN9JUTAvTxMxitMlMpl6D00DHf
 r18Q==
X-Gm-Message-State: APjAAAWcGLjrACPX6r1GOEiHRNWJhv7elmgn8XoiigoU9X99KWtXREpA
 mthtNjZrsQYTTsRSnxqSWVKgyw==
X-Google-Smtp-Source: APXvYqyprh0ZW5E545GdWfcqPk/iGY2Yw8mg5p/NcxaMUorxGhXmA4Ss4jPG5NUlwzXiyn4CaYbhrA==
X-Received: by 2002:a5d:6682:: with SMTP id l2mr7849875wru.33.1555533852505;
 Wed, 17 Apr 2019 13:44:12 -0700 (PDT)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id c20sm98716866wre.28.2019.04.17.13.44.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 17 Apr 2019 13:44:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 5/7] mmc: meson-gx: avoid clock glitch when switching to DDR
 modes
Date: Wed, 17 Apr 2019 22:43:53 +0200
Message-Id: <20190417204355.469-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190417204355.469-1-jbrunet@baylibre.com>
References: <20190417204355.469-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_134415_994164_9412022C 
X-CRM114-Status: GOOD (  16.85  )
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

Activating DDR in the Amlogic mmc controller, among other things, will
divide the output clock by 2. So by activating it with clock on, we are
creating a glitch on the output.

Instead, let's deal with DDR when the clock output is off, when setting
the clock.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 72 +++++++++++++++++++--------------
 1 file changed, 42 insertions(+), 30 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 118f09da8dfb..f77b9327a590 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -169,6 +169,7 @@ struct meson_host {
 	struct clk *rx_clk;
 	struct clk *tx_clk;
 	unsigned long req_rate;
+	bool ddr;
 
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pins_default;
@@ -384,16 +385,6 @@ static void meson_mmc_post_req(struct mmc_host *mmc, struct mmc_request *mrq,
 			     mmc_get_dma_dir(data));
 }
 
-static bool meson_mmc_timing_is_ddr(struct mmc_ios *ios)
-{
-	if (ios->timing == MMC_TIMING_MMC_DDR52 ||
-	    ios->timing == MMC_TIMING_UHS_DDR50 ||
-	    ios->timing == MMC_TIMING_MMC_HS400)
-		return true;
-
-	return false;
-}
-
 /*
  * Gating the clock on this controller is tricky.  It seems the mmc clock
  * is also used by the controller.  It may crash during some operation if the
@@ -430,36 +421,41 @@ static void meson_mmc_clk_ungate(struct meson_host *host)
 	writel(cfg, host->regs + SD_EMMC_CFG);
 }
 
-static int meson_mmc_clk_set(struct meson_host *host, struct mmc_ios *ios)
+static int meson_mmc_clk_set(struct meson_host *host, unsigned long rate,
+			     bool ddr)
 {
 	struct mmc_host *mmc = host->mmc;
-	unsigned long rate = ios->clock;
 	int ret;
 	u32 cfg;
 
-	/* DDR modes require higher module clock */
-	if (meson_mmc_timing_is_ddr(ios))
-		rate <<= 1;
-
 	/* Same request - bail-out */
-	if (host->req_rate == rate)
+	if (host->ddr == ddr && host->req_rate == rate)
 		return 0;
 
 	/* stop clock */
 	meson_mmc_clk_gate(host);
 	host->req_rate = 0;
+	mmc->actual_clock = 0;
 
-	if (!rate) {
-		mmc->actual_clock = 0;
-		/* return with clock being stopped */
+	/* return with clock being stopped */
+	if (!rate)
 		return 0;
-	}
 
 	/* Stop the clock during rate change to avoid glitches */
 	cfg = readl(host->regs + SD_EMMC_CFG);
 	cfg |= CFG_STOP_CLOCK;
 	writel(cfg, host->regs + SD_EMMC_CFG);
 
+	if (ddr) {
+		/* DDR modes require higher module clock */
+		rate <<= 1;
+		cfg |= CFG_DDR;
+	} else {
+		cfg &= ~CFG_DDR;
+	}
+	writel(cfg, host->regs + SD_EMMC_CFG);
+	host->ddr = ddr;
+
 	ret = clk_set_rate(host->mmc_clk, rate);
 	if (ret) {
 		dev_err(host->dev, "Unable to set cfg_div_clk to %lu. ret=%d\n",
@@ -471,12 +467,14 @@ static int meson_mmc_clk_set(struct meson_host *host, struct mmc_ios *ios)
 	mmc->actual_clock = clk_get_rate(host->mmc_clk);
 
 	/* We should report the real output frequency of the controller */
-	if (meson_mmc_timing_is_ddr(ios))
+	if (ddr) {
+		host->req_rate >>= 1;
 		mmc->actual_clock >>= 1;
+	}
 
 	dev_dbg(host->dev, "clk rate: %u Hz\n", mmc->actual_clock);
-	if (ios->clock != mmc->actual_clock)
-		dev_dbg(host->dev, "requested rate was %u\n", ios->clock);
+	if (rate != mmc->actual_clock)
+		dev_dbg(host->dev, "requested rate was %lu\n", rate);
 
 	/* (re)start clock */
 	meson_mmc_clk_ungate(host);
@@ -750,6 +748,25 @@ static int meson_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
 	return meson_mmc_clk_phase_tuning(mmc, opcode, host->rx_clk);
 }
 
+static int meson_mmc_prepare_ios_clock(struct meson_host *host,
+				       struct mmc_ios *ios)
+{
+	bool ddr;
+
+	switch (ios->timing) {
+	case MMC_TIMING_MMC_DDR52:
+	case MMC_TIMING_UHS_DDR50:
+		ddr = true;
+		break;
+
+	default:
+		ddr = false;
+		break;
+	}
+
+	return meson_mmc_clk_set(host, ios->clock, ddr);
+}
+
 static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 {
 	struct meson_host *host = mmc_priv(mmc);
@@ -819,15 +836,10 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 	val &= ~CFG_BUS_WIDTH_MASK;
 	val |= FIELD_PREP(CFG_BUS_WIDTH_MASK, bus_width);
 
-	val &= ~CFG_DDR;
-	if (meson_mmc_timing_is_ddr(ios))
-		val |= CFG_DDR;
-
-	err = meson_mmc_clk_set(host, ios);
+	err = meson_mmc_prepare_ios_clock(host, ios);
 	if (err)
 		dev_err(host->dev, "Failed to set clock: %d\n,", err);
 
-	writel(val, host->regs + SD_EMMC_CFG);
 	dev_dbg(host->dev, "SD_EMMC_CFG:  0x%08x\n", val);
 }
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
