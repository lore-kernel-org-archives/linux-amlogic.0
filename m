Return-Path: <SRS0=V5Bc=SZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA44C282E1
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:03:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6D9221738
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:03:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jpjv8/vn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pZVAggBK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6D9221738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h1NCb+CqRsZB6L3GorjCeaHJZOOd4E+P8k0cW8LG7S8=; b=Jpjv8/vnEDuvtM
	+qcCvtaDj9I7apOUqNGewGlgzauCXafr1mR0tuakzQ7S2nqYIUJfvC09bnXjzOoa7srfVS7/BXO+R
	kVEZXLR9LoR7auL1IZ9dlcyXJB6rEfulhANDCk2BPywzfV9H9A2Soj17mWBqG0xBjgv8E4hQPx4UA
	Ngpt2YTEeD9mRGH3d1T5rankel1JNsHa1HHeJDCy6wel+Dm+gXOQ73qxEMP73tJdP7IGbtb0RRLGz
	RCvO2Pl0hQ6wl4KgvY8Pb0EFbgjYEgh8DAOUpejG5GQmOm43KWQkSzrh7GpQ8KTGC9fg5V6zw5U8U
	iFCGyGMFvhtaBXZhQqHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIrKR-0005u8-LB; Tue, 23 Apr 2019 09:03:03 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIrKJ-0005jF-UH
 for linux-amlogic@lists.infradead.org; Tue, 23 Apr 2019 09:02:59 +0000
Received: by mail-wr1-x442.google.com with SMTP id a9so1578978wrp.6
 for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2019 02:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a2NNf2UNkHCYlSEUhojNPJKAy7RIBEN/uvTpac68Irc=;
 b=pZVAggBKomrDwwXwIFYC88tNJkpD/Elg6lpOxD5sDMZvV6+ahObnJ+VVsAxt/lwutS
 ljrx4Xpze05TLTBdcwoEXSm27XmhxjSYafhKfc+SDicqyvlw02SGRPGc6FORBPzvoXwY
 GAPcIdb3Z3b3HE7m4xr+a2HSnufoatwh86T8T6PaZRN2gMEaMEYHsgJ9jw+AsQS4er3J
 J5VDSCDTgNKOXWESciIjO8ozYcjg17xIx+gXKaULdRwb6rS7MeeBUQzNRICz3cJN/Vkp
 wD3oL65hUoxMItGoTk141UR2SEF65tzO04gxrNc2aGjmVTYaWzpnXykWMaQGAlX39xbK
 xaaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a2NNf2UNkHCYlSEUhojNPJKAy7RIBEN/uvTpac68Irc=;
 b=RwS2w+C1Y25ydY1XEefOWQvooEMQITCQFKE/SGNR5OFbqW22RvCfe3jv7shIynlPGL
 O6dKMU1OSgPqEyG8RMktrYC2oO0TSIj90NtnrY+CpFPWivF11GujYFi2lCZMeADkkoPM
 a+rgqKfx2FHnnPMnark2iGqtT5jDh/MfGeu0YhZQxwlcvbcb7iyGYO2EhQ1MSaEqac5r
 kc5aXInXxwfAGotU8ch9NFaVe+BTQs8xA1FwmqI/EOT/0i2CRiYJS9I5t4KBB74iQwZ6
 AhPruc3Lqjim9BoDl9xJKtqrasAI57oI1x7xo8IqF9vYhKsm9q44sQVOdQluqnPUHgvR
 lFQA==
X-Gm-Message-State: APjAAAXH0IieIZieFxqbCOJzzPMdICkS2lSQYPI7RC1z4uXISAoMumjU
 CjQqeXxdnYKjcNPjdusxqwhR4A==
X-Google-Smtp-Source: APXvYqwuEHaORS0lZc6AUyjPoowqJzkOgx1MnMxERqqnnDZGe7u/yVmP8XqW7kasziXr5wL+BCZhuQ==
X-Received: by 2002:a5d:5346:: with SMTP id t6mr17432415wrv.59.1556010174449; 
 Tue, 23 Apr 2019 02:02:54 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z23sm12361894wma.0.2019.04.23.02.02.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Apr 2019 02:02:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 7/7] mmc: meson-gx: add signal resampling tuning
Date: Tue, 23 Apr 2019 11:02:35 +0200
Message-Id: <20190423090235.17244-8-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190423090235.17244-1-jbrunet@baylibre.com>
References: <20190423090235.17244-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_020256_288413_4D8A45B1 
X-CRM114-Status: GOOD (  14.12  )
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
index acdc5520d02c..c5a8af4ca76b 100644
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
@@ -574,6 +639,7 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 	val |= FIELD_PREP(CFG_BUS_WIDTH_MASK, bus_width);
 	writel(val, host->regs + SD_EMMC_CFG);
 
+	meson_mmc_check_resampling(host, ios);
 	err = meson_mmc_prepare_ios_clock(host, ios);
 	if (err)
 		dev_err(host->dev, "Failed to set clock: %d\n,", err);
@@ -963,6 +1029,7 @@ static const struct mmc_host_ops meson_mmc_ops = {
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
