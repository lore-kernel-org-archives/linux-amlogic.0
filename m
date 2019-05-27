Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217CCC04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 12:43:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAE142075E
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 12:43:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PJDAQIHt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iB8+5DWC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAE142075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6aDrYr7g7j5Q8OfH3m3bMuOxMPivA0urZY4mEJcDPmU=; b=PJDAQIHtDShzYL
	QE4LgfEl6arQ1dHahqNbdfFenyvl2pVRi68K0gyWZw3vrHk8jB/Jof/tnAN1pxWWOoezxd5bqH7x4
	znwiuODmsU6DKjr+FNXDFBkmOJPzsDCCA7xB97Kt4z73s3YTfKbp80wG9ihMYE+bw4j/74xa3PSAk
	Qz0O9kMOm8m8xXlFBkQsHEQUMiHMoaSlWMiSmiBlvMr5YoFoPAHoHP+WsIxqZUHs0IWUMleB0mBo2
	kbQQwvuLlkUstlk1/ulsJhvWKsq0+0MoQ3636T4Z+MwpAr/Gu5crM8iHoiZC3NajbR/BdylT4WVcm
	M3KVYelEjAurKNdynrGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVEyQ-0001Df-Fw; Mon, 27 May 2019 12:43:30 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVEyA-0000qr-Ap
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 12:43:18 +0000
Received: by mail-wm1-x343.google.com with SMTP id 7so15711680wmo.2
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 05:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EKFZPGKH5eGeLYYAtGCHsBSOPOjgodgPICLgkLIkvVM=;
 b=iB8+5DWCZC8jbgq5YM8DCbSOJJwcr+GQNlJVIM1Xm9Kgl3QzC6aIjYYNFonvI2etoE
 leQAh+sLaZW7zdKvONvUvItZZ60iVf9ZXxEta0ZS9OG1WKKsbQsXGC4ExCD+i2tCQMp/
 8AuePwV/jFczhXlAgu2fKf5WXeDUnccIUFzyCLpexhBb/pQlG6Y3sKsyxFK+4Cn0Z1WL
 B2J3/mX/QNUQ1dO8cQFy5j/EUFn5Ki8UGCxIcff3Nim0hADk88GN1zlOwJr1Lu2bJpzp
 hGt1t86hYoAqbIHEQbBtGLzYIqhyJIh0YDg2bOzT97HEHdvNu1+tGFQB3cZZDaj0TX6U
 Xoxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EKFZPGKH5eGeLYYAtGCHsBSOPOjgodgPICLgkLIkvVM=;
 b=OzwxVEQd9MDmU6V6Bwe1OBQgAm5hWwPz4cT0EBZGJmSInfwXM4AZ0jTea+GXw+ZCEQ
 thE+Y7VVhf3LKLmQeb7zRVg5ZfctdL5ZAZdONIKM3+LSM9CdDPR6/lMV/6ETyX33E91Q
 IdWAt/zywbCGqseuqpq96ZD7icJp/UnJGFfe8ZXBiYMUyNDovoB8Qw+NWVfKHSe5xneI
 r+YWDBtlzpdpmEvlkszSFawfzG57aLh6z3BodHeLMJR3+ft0+oMkjhERqCVoJLgEgEGw
 kRe//F+IbuSZJfa3qdcTGvgHoFNnjTFOcuYlzWUvusY5UxsedRd01Hj61UnO1A0P0sPa
 ppTA==
X-Gm-Message-State: APjAAAXcF3qLyk26lbw6spKwfzzDPTBqcWsNJrMM0TfMsNAQ7YyUTmjY
 9k1qSzPna9XpH7uMSBuXlsmqEA==
X-Google-Smtp-Source: APXvYqzYFEfc+CAVT++3JgstGEGREHo3wv0+racX6ysjjaApP/NjpSOwnYG+6p8cWmXzewoznDOQ/w==
X-Received: by 2002:a1c:7e08:: with SMTP id z8mr9087883wmc.36.1558960992583;
 Mon, 27 May 2019 05:43:12 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c14sm11494930wrt.45.2019.05.27.05.43.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 05:43:11 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: ulf.hansson@linaro.org,
	khilman@baylibre.com
Subject: [PATCH v2 2/3] mmc: meson-gx: add dram-access-quirk
Date: Mon, 27 May 2019 14:43:06 +0200
Message-Id: <20190527124307.32075-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527124307.32075-1-narmstrong@baylibre.com>
References: <20190527124307.32075-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_054314_448384_E2C8E3C7 
X-CRM114-Status: GOOD (  20.27  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guillaume La Roque <glaroque@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On the Amlogic G12A SoC family, (only) the SDIO controller fails to access
the data from DRAM, leading to a broken controller.

But each MMC controller has 1,5KiB of SRAM after the registers, that can
be used as bounce buffer to avoid direct DRAM access from the integrated
DMAs (this SRAM may be used by the boot ROM when DRAM is not yet initialized).

The quirk is to disable the chained descriptor for this controller, and
use this SRAM memory zone as buffer for the bounce buffer fallback mode.

The performance hit hasn't been evaluated, but the fix has been tested
using a WiFi AP6398S SDIO module, and the iperf3 Bandwidth measurement gave
55.2 Mbits/sec over a 63 Hours long test, with the SDIO ios set as High-Speed
at 50MHz clock. It gave 170 Mbits/sec as SDR104 and 200MHz clock.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Guillaume La Roque <glaroque@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 70 ++++++++++++++++++++++++++-------
 1 file changed, 55 insertions(+), 15 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index c5a8af4ca76b..bcf1789d26b6 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -129,6 +129,9 @@
 #define SD_EMMC_TXD 0x94
 #define SD_EMMC_LAST_REG SD_EMMC_TXD
 
+#define SD_EMMC_SRAM_DATA_BUF_LEN 1536
+#define SD_EMMC_SRAM_DATA_BUF_OFF 0x200
+
 #define SD_EMMC_CFG_BLK_SIZE 512 /* internal buffer max: 512 bytes */
 #define SD_EMMC_CFG_RESP_TIMEOUT 256 /* in clock cycles */
 #define SD_EMMC_CMD_TIMEOUT 1024 /* in ms */
@@ -168,6 +171,8 @@ struct meson_host {
 	unsigned long req_rate;
 	bool ddr;
 
+	bool dram_access_quirk;
+
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pins_default;
 	struct pinctrl_state *pins_clk_gate;
@@ -232,11 +237,20 @@ static struct mmc_command *meson_mmc_get_next_command(struct mmc_command *cmd)
 static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
 					struct mmc_request *mrq)
 {
+	struct meson_host *host = mmc_priv(mmc);
 	struct mmc_data *data = mrq->data;
 	struct scatterlist *sg;
 	int i;
 	bool use_desc_chain_mode = true;
 
+	/*
+	 * When Controller DMA cannot directly access DDR memory, disable
+	 * support for Chain Mode to directly use the internal SRAM using
+	 * the bounce buffer mode.
+	 */
+	if (host->dram_access_quirk)
+		return;
+
 	/*
 	 * Broken SDIO with AP6255-based WiFi on Khadas VIM Pro has been
 	 * reported. For some strange reason this occurs in descriptor
@@ -1049,6 +1063,10 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	host->dev = &pdev->dev;
 	dev_set_drvdata(&pdev->dev, host);
 
+	/* The G12A SDIO Controller needs an SRAM bounce buffer */
+	host->dram_access_quirk = device_property_read_bool(&pdev->dev,
+					"amlogic,dram-access-quirk");
+
 	/* Get regulators and the supported OCR mask */
 	host->vqmmc_enabled = false;
 	ret = mmc_regulator_get_supply(mmc);
@@ -1146,9 +1164,16 @@ static int meson_mmc_probe(struct platform_device *pdev)
 		goto err_init_clk;
 
 	mmc->caps |= MMC_CAP_CMD23;
-	mmc->max_blk_count = CMD_CFG_LENGTH_MASK;
+	if (host->dram_access_quirk) {
+		/* Limit to the available sram memory */
+		mmc->max_segs = SD_EMMC_SRAM_DATA_BUF_LEN / mmc->max_blk_size;
+		mmc->max_blk_count = mmc->max_segs;
+	} else {
+		mmc->max_blk_count = CMD_CFG_LENGTH_MASK;
+		mmc->max_segs = SD_EMMC_DESC_BUF_LEN /
+				sizeof(struct sd_emmc_desc);
+	}
 	mmc->max_req_size = mmc->max_blk_count * mmc->max_blk_size;
-	mmc->max_segs = SD_EMMC_DESC_BUF_LEN / sizeof(struct sd_emmc_desc);
 	mmc->max_seg_size = mmc->max_req_size;
 
 	/*
@@ -1158,15 +1183,27 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	 */
 	mmc->caps2 &= ~MMC_CAP2_HS400;
 
-	/* data bounce buffer */
-	host->bounce_buf_size = mmc->max_req_size;
-	host->bounce_buf =
-		dma_alloc_coherent(host->dev, host->bounce_buf_size,
-				   &host->bounce_dma_addr, GFP_KERNEL);
-	if (host->bounce_buf == NULL) {
-		dev_err(host->dev, "Unable to map allocate DMA bounce buffer.\n");
-		ret = -ENOMEM;
-		goto err_free_irq;
+	if (host->dram_access_quirk) {
+		/*
+		 * The MMC Controller embeds 1,5KiB of internal SRAM
+		 * that can be used to be used as bounce buffer.
+		 * In the case of the G12A SDIO controller, use these
+		 * instead of the DDR memory
+		 */
+		host->bounce_buf_size = SD_EMMC_SRAM_DATA_BUF_LEN;
+		host->bounce_buf = host->regs + SD_EMMC_SRAM_DATA_BUF_OFF;
+		host->bounce_dma_addr = res->start + SD_EMMC_SRAM_DATA_BUF_OFF;
+	} else {
+		/* data bounce buffer */
+		host->bounce_buf_size = mmc->max_req_size;
+		host->bounce_buf =
+			dma_alloc_coherent(host->dev, host->bounce_buf_size,
+					   &host->bounce_dma_addr, GFP_KERNEL);
+		if (host->bounce_buf == NULL) {
+			dev_err(host->dev, "Unable to map allocate DMA bounce buffer.\n");
+			ret = -ENOMEM;
+			goto err_free_irq;
+		}
 	}
 
 	host->descs = dma_alloc_coherent(host->dev, SD_EMMC_DESC_BUF_LEN,
@@ -1183,8 +1220,9 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	return 0;
 
 err_bounce_buf:
-	dma_free_coherent(host->dev, host->bounce_buf_size,
-			  host->bounce_buf, host->bounce_dma_addr);
+	if (!host->dram_access_quirk)
+		dma_free_coherent(host->dev, host->bounce_buf_size,
+				  host->bounce_buf, host->bounce_dma_addr);
 err_free_irq:
 	free_irq(host->irq, host);
 err_init_clk:
@@ -1208,8 +1246,10 @@ static int meson_mmc_remove(struct platform_device *pdev)
 
 	dma_free_coherent(host->dev, SD_EMMC_DESC_BUF_LEN,
 			  host->descs, host->descs_dma_addr);
-	dma_free_coherent(host->dev, host->bounce_buf_size,
-			  host->bounce_buf, host->bounce_dma_addr);
+
+	if (!host->dram_access_quirk)
+		dma_free_coherent(host->dev, host->bounce_buf_size,
+				  host->bounce_buf, host->bounce_dma_addr);
 
 	clk_disable_unprepare(host->mmc_clk);
 	clk_disable_unprepare(host->core_clk);
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
