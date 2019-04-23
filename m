Return-Path: <SRS0=V5Bc=SZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7456C10F14
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:03:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6D2420843
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:03:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AFSiyctG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EYXX0DSB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6D2420843
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZAa4URMz+D4oWYHRNTs/Ct86hpFG98/Y9UXhNwOZxJk=; b=AFSiyctGx2t9wf
	IKIfwLqqA2luBkUI36hkU6z8jTegTvOVR5Ac3/K0GrLgGfdGDBJhZ/Fo/YQ0BY56PF1qpaqaSXjuZ
	Y8w/tgD2UuAa8ocKBBUM6MY8hveXd/gZasfT4G70rZ1eIEl0svWHtXqfAfH9WRADCe1iiwap4Z4dS
	hvyT23rI0A7CYSfuqfHOjnXIour7tr4L5a+gj6DSGbS/SwS+5TZKoGZhheU70xwYy2pP2CHymo9TA
	QTybCkn4gv2zEH1Uwv9X4ntqNaje9CaiIim4EjMui/hPfS4UaP9Hwpno07tiaDtq4o9uGcci0eAWB
	cMUjbS3paODO9gXbUTZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIrKQ-0005sk-4W; Tue, 23 Apr 2019 09:03:02 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIrKH-0005fb-Cf
 for linux-amlogic@lists.infradead.org; Tue, 23 Apr 2019 09:02:58 +0000
Received: by mail-wr1-x441.google.com with SMTP id a9so1578817wrp.6
 for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2019 02:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7O3wIgqarfFHawq5yu8xhv0dh+R+qxDhpOLDHXRq0pw=;
 b=EYXX0DSB5uuxcp29aYUMyf76vuVTa5lzw+kKasn1gcmLgWBtCrDk0cSDcZxW/55KU2
 XHKRJ8jLLxXRxyxmpi53+rkruleKq+q3ETmvvTrLgeSFPu3naAY+qm7PgJzXGsD5FBb4
 1Rx5XqaTuLY9vZKEcUNn7l8q1Sfxx7T9c487vN702ySJKtfkvWV+DOuOmB0fAz1mzUSY
 9dNGhVdXFsuFkCqn5U473kwRsiSOXTHcrzzb005cZ6yM5S0D9swNfiHl/6LPjui+SxBx
 ltunbGnn7TvgMx6z8bvBicacKIwgZRdDZIq0WjSjr7YssZQZ6I/ayD1gikaEB+itIIJK
 h//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7O3wIgqarfFHawq5yu8xhv0dh+R+qxDhpOLDHXRq0pw=;
 b=r64otaVADsOMXYudICZdD513Fvlv/GFLDjRApM6IZ6zeQpgGqzY+o2WcLIk3jEsLow
 6Z0Sm0zoTqAefaebD/iFYs2RPrv9wmgDRiErJnsp7uiqvHbqDdqVv27iCdsHdytsKoVZ
 +iWb5ycGNf5rjsIs8loKhLVwMX8LJzN7IJ/gzQmjjkPGn3n+bMmXUsVnm851TuP27ew4
 0c4AYgRQziRxEde7tuV39ICypcjoy5m3X2AWz9spYLZRLlOS/gNuttH5PDylijhpTsXf
 HliUuYD5wBjSl7p5MeTXhv1rL79Vr/tS1ispgPzfeUezwAtqfGLL0rj7hY3RyWAX5IZP
 j9+g==
X-Gm-Message-State: APjAAAUZ6G9zQVXV+Y9nzdfCj8aQCPxCTjCy3ZibUCG/3yAs7/8zWTAl
 TcJpB55eoL1fkQ4rjb5qzgYPxA==
X-Google-Smtp-Source: APXvYqzXKd8cz20msKyq13va4Yaq6GtYUIWQIC7nm/qbp7zfzmZQUQWBpeHtIG1GyP4ARz8vREwZPQ==
X-Received: by 2002:adf:eb87:: with SMTP id t7mr17162388wrn.39.1556010171982; 
 Tue, 23 Apr 2019 02:02:51 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z23sm12361894wma.0.2019.04.23.02.02.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Apr 2019 02:02:50 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 5/7] mmc: meson-gx: avoid clock glitch when switching to
 DDR modes
Date: Tue, 23 Apr 2019 11:02:33 +0200
Message-Id: <20190423090235.17244-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190423090235.17244-1-jbrunet@baylibre.com>
References: <20190423090235.17244-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_020253_806603_35DA27AF 
X-CRM114-Status: GOOD (  16.87  )
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
 drivers/mmc/host/meson-gx-mmc.c | 73 +++++++++++++++++++--------------
 1 file changed, 43 insertions(+), 30 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 118f09da8dfb..0454021c9ff5 100644
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
@@ -818,16 +835,12 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 	val = readl(host->regs + SD_EMMC_CFG);
 	val &= ~CFG_BUS_WIDTH_MASK;
 	val |= FIELD_PREP(CFG_BUS_WIDTH_MASK, bus_width);
+	writel(val, host->regs + SD_EMMC_CFG);
 
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
