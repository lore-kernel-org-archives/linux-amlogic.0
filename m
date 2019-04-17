Return-Path: <SRS0=RDff=ST=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58277C282DD
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Apr 2019 20:44:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2472C217FA
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Apr 2019 20:44:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pp7zR2JX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="warLkyBW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2472C217FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bWctgr1YpzRUQlHqgEErGB5AQxX1fkSYjFH6czId1co=; b=Pp7zR2JXA03l0E
	ofqH1VCQCbMs1TT+qT7/nEVwzgJ1VFv4MTOAP2fRFRYnDy+3oFBHGHK8qIE8/yhgttmun/WWM2SRq
	gaFVcU4CoZp+CKeZNFUi5hnxOqKOAzcA6n+jEkVM0+yDS3MRccwSJ+G+VumKoBfIInonaLWNP3phw
	SCBmXaKRa9HdJLvG1Cv35d3OscmTf8tSNabnj0sC8BZRVKEup1pRltvgze6VKv1bShan3I+gJJXQW
	eYimJA3Qsg/h9FWTws7K1jmOO9Mj9OaE03CO+3P0HthkHv4Sy6rNFUpZi8ZEvy1ByCEMGklsTdIIj
	hvQB3/EahO4hMaj3ulcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGrPu-0002XR-CI; Wed, 17 Apr 2019 20:44:26 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGrPk-0002I9-G6
 for linux-amlogic@lists.infradead.org; Wed, 17 Apr 2019 20:44:23 +0000
Received: by mail-wr1-x441.google.com with SMTP id o12so111579wrn.2
 for <linux-amlogic@lists.infradead.org>; Wed, 17 Apr 2019 13:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2PG4RVUDpV3B0qjRGkkQWtaaCze4HgvXH3Z70Qm9O/U=;
 b=warLkyBWdpYp4KCSIryoCoiZ8g33ebunoaq+b324HnCWykVlBGG9uLeJFnplM4RNvu
 MQgIbQM/u8eXQjMn8bmy825OKBYcmspvxnC1G0Uc0DEd6vCKR/yfpdXyDdQpaHdYjx62
 otT8hh2K210mgQItR8iQwaLCqKrhOrgLezEZGM5Gr6Maz38CSwoi1q5R91LiYXKqIm2b
 pBy8P6l+FveatazYFV/RkNtmPF7GLssnnVDowUjoTuiIpJM/er/KRT7aJYfSSEKU/tV0
 /uV3DgSs0ckqP9ndEejdlFA0iBDq7mmNzZ2J5ZCIGQhvOt39cecFNBFFklIjdqR3qXRP
 qMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2PG4RVUDpV3B0qjRGkkQWtaaCze4HgvXH3Z70Qm9O/U=;
 b=Vlim6H6qNS1OXM+dXpaID0n/SXy4tgfu55kgVdWX/IaR6oe2AK6wQlvHek6EfIkT7Y
 w4mqHu38Ws6X/zW+HItNA7D7i2ZTrVDnJBkUYL2YZdVZZwv2FOEI+yYNaNyPTD6lVNzF
 aBW5+bSI1iBUw9loCe5M8fKZvQH2jwAcX17xeuWO9dMC7LNbSF8XV5Y+5NIwaX+jRblE
 Jj1557w+nOCQCyNM+2bNFh8DbBeakzx1wAIEwiZoFXxVlY8Y+JcKLNlZ7Nci3ZI5gF1H
 NRYXL+/V/3Ev0ZIEDzWzs4RVBi/H1AUsKINQSPQSqX72XORlVr/ffMiznDSwlicKtci+
 XwLQ==
X-Gm-Message-State: APjAAAW/RGIsX1fGo/V2nIsumJDmT3m7J084Z5ZaC8xCWsyUJR9V7iYD
 GWFjqM2d/OHmbCIKmoRGU1pwlw==
X-Google-Smtp-Source: APXvYqxWlpqAumpKjW2+jOTflWWSx/sRI5APF8FOagYO+eqhKWjTteRqxvgudgS6a/W2cl5NA9witw==
X-Received: by 2002:adf:ed8f:: with SMTP id c15mr35201960wro.144.1555533855185; 
 Wed, 17 Apr 2019 13:44:15 -0700 (PDT)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id c20sm98716866wre.28.2019.04.17.13.44.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 17 Apr 2019 13:44:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 7/7] mmc: meson-gx: add signal resampling tuning
Date: Wed, 17 Apr 2019 22:43:55 +0200
Message-Id: <20190417204355.469-8-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190417204355.469-1-jbrunet@baylibre.com>
References: <20190417204355.469-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_134416_805767_8B1D34E5 
X-CRM114-Status: GOOD (  14.03  )
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

Use signal resampling tuning for the UHS and HS200 modes.
Instead of trying to get the *best* resampling setting with complex
window calculation, we just stop on the first working setting.

If the tuning setting later proves unstable, we will just continue the
tuning where we left it.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 73 +++++++++++++++++++++++++++++++--
 1 file changed, 70 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 50b03c167435..207c65b3ddf1 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -488,6 +488,61 @@ static int meson_mmc_clk_init(struct meson_host *host)
 	return clk_prepare_enable(host->mmc_clk);
 }
 
+static void meson_mmc_disable_resampling(struct meson_host *host)
+{
+	unsigned int val = readl(host->regs + host->data->adjust);
+
+	val &= ~ADJUST_ADJ_EN;
+	writel(val, host->regs + host->data->adjust);
+}
+
+static void meson_mmc_reset_resampling(struct meson_host *host)
+{
+	unsigned int val;
+
+	meson_mmc_disable_resampling(host);
+
+	val = readl(host->regs + host->data->adjust);
+	val &= ~ADJUST_ADJ_DELAY_MASK;
+	writel(val, host->regs + host->data->adjust);
+}
+
+static int meson_mmc_resampling_tuning(struct mmc_host *mmc, u32 opcode)
+{
+	struct meson_host *host = mmc_priv(mmc);
+	unsigned int val, dly, max_dly, i;
+	int ret;
+
+	/* Resampling is done using the source clock */
+	max_dly = DIV_ROUND_UP(clk_get_rate(host->mux_clk),
+			       clk_get_rate(host->mmc_clk));
+
+	val = readl(host->regs + host->data->adjust);
+	val |= ADJUST_ADJ_EN;
+	writel(val, host->regs + host->data->adjust);
+
+	if (mmc->doing_retune)
+		dly = FIELD_GET(ADJUST_ADJ_DELAY_MASK, val) + 1;
+	else
+		dly = 0;
+
+	for (i = 0; i < max_dly; i++) {
+		val &= ~ADJUST_ADJ_DELAY_MASK;
+		val |= FIELD_PREP(ADJUST_ADJ_DELAY_MASK, (dly + i) % max_dly);
+		writel(val, host->regs + host->data->adjust);
+
+		ret = mmc_send_tuning(mmc, opcode, NULL);
+		if (!ret) {
+			dev_dbg(mmc_dev(mmc), "resampling delay: %u\n",
+				(dly + i) % max_dly);
+			return 0;
+		}
+	}
+
+	meson_mmc_reset_resampling(host);
+	return -EIO;
+}
+
 static int meson_mmc_prepare_ios_clock(struct meson_host *host,
 				       struct mmc_ios *ios)
 {
@@ -507,6 +562,19 @@ static int meson_mmc_prepare_ios_clock(struct meson_host *host,
 	return meson_mmc_clk_set(host, ios->clock, ddr);
 }
 
+static void meson_mmc_check_resampling(struct meson_host *host,
+				       struct mmc_ios *ios)
+{
+	switch (ios->timing) {
+	case MMC_TIMING_LEGACY:
+	case MMC_TIMING_MMC_HS:
+	case MMC_TIMING_SD_HS:
+	case MMC_TIMING_MMC_DDR52:
+		meson_mmc_disable_resampling(host);
+		break;
+	}
+}
+
 static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 {
 	struct meson_host *host = mmc_priv(mmc);
@@ -533,9 +601,6 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 		if (!IS_ERR(mmc->supply.vmmc))
 			mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, ios->vdd);
 
-		/* disable signal resampling */
-		writel(0, host->regs + host->data->adjust);
-
 		break;
 
 	case MMC_POWER_ON:
@@ -573,6 +638,7 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 	val &= ~CFG_BUS_WIDTH_MASK;
 	val |= FIELD_PREP(CFG_BUS_WIDTH_MASK, bus_width);
 
+	meson_mmc_check_resampling(host, ios);
 	err = meson_mmc_prepare_ios_clock(host, ios);
 	if (err)
 		dev_err(host->dev, "Failed to set clock: %d\n,", err);
@@ -962,6 +1028,7 @@ static const struct mmc_host_ops meson_mmc_ops = {
 	.get_cd         = meson_mmc_get_cd,
 	.pre_req	= meson_mmc_pre_req,
 	.post_req	= meson_mmc_post_req,
+	.execute_tuning = meson_mmc_resampling_tuning,
 	.card_busy	= meson_mmc_card_busy,
 	.start_signal_voltage_switch = meson_mmc_voltage_switch,
 };
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
