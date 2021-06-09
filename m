Return-Path: <SRS0=+B/b=LD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BFB3C48BCF
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jun 2021 16:20:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 196CD611AE
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jun 2021 16:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 196CD611AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zxv238QEJGfj3Rz3Z8h6I/JfJkf0MUc8DPJ2e9hu4P4=; b=X14yVOCCYYxe4Z
	ieI2omZ6ZU8YQ812ZbuqYsT1rS+NFxfsdEw0JmCWug7//dvhl/wv6dEY+ZaZpwEhNibgKofe5obip
	Qpj7551xZNAlwxhRGqiWJc92ri5oDlkfY9KaR/tYJSsws4TmnH6OOkB2YC1Zox9+PAiVZuE97Fifu
	T3QP6UyFxntiEMB1vuVIr1qa+RoCcNPrpSL30t8GcfiLAZEMenD8RZQCPbrW/StKWf6ywP+hVrPiw
	z+iBQNtxr+cmyJBr+SoxK098zJhziwdk7gVYUdm6JlMl0mIaJYewNefhJsR78pCgasYvWEwwGJI43
	iZaZdifd9cF6jIN19NIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr0wV-00EsLp-08; Wed, 09 Jun 2021 16:20:35 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqzj1-00ETbD-Gy
 for linux-amlogic@lists.infradead.org; Wed, 09 Jun 2021 15:02:37 +0000
Received: by mail-wr1-x436.google.com with SMTP id e11so15673932wrg.3
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Jun 2021 08:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jGd3vej9Xv7tCX6p/j+Wd3uODyXRg/QkcngJWQeZQgI=;
 b=nvNbpYzwgzprXt2lVilg7oqUHRgsaxvUww91B29smt15nzyo6S5HMxBrqovVy8bPBj
 DWKNOxNxhNO2VFI8J9svI1LC670J1s/jF/+qwoYsOWZcZ4YG8GVz3QvchU4R14c3YFNf
 twfchpTpkIlHBEyTYSGFwXsjepH+XRjUpjYXt8SavWvkoFcfQgANfM1MomcHZnnngcrH
 99yIE7TRm2AWLTAqguwNPUoFRZqLGsyvUXoIjeCr+2LxlPtzH+VaybSJmXUTIp93oOAn
 4LR4LOxBbLy6+xbLWQY6ypQzx+g/29H7ciQoUZfZad+hpWWQG5MHswn1Dsolz1GChsu5
 CKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jGd3vej9Xv7tCX6p/j+Wd3uODyXRg/QkcngJWQeZQgI=;
 b=UdRaOZUSitPDRJK6uQ3CayFbRvcV4VOA+ZuJ0HZ3xeGL1xXZy/aubdPTuSpcuM3ZR7
 /G5h2I36Spe8BC9dmPhE0Kkb27D5ay4szH/R0gOQDxu6u3YkSYL31pNknzwtfXx8XVcM
 l095b+GC/e6dUrIYsllVlQbijjBXlsc4CNXxWBFeVM6VhHpKtO5DRFd+GNVUQn22AzIs
 cr9OPxHB0jfqUlgzNM86eCahkjyqsmoI7LmyaUMx1w2hGvjbW41tQJPesdz26SNtPcaw
 /TcwE3JyFqfWLV05VQHw0LD/YyfJmGrpgNJILAH09kqhDAOFsGZ3DVZ/4octT2eOFBuk
 dzDA==
X-Gm-Message-State: AOAM531KGWUpB8ToYRRFc0Raxm2X16i+6MVDcVR+QqjLGTKm6qj0KzpH
 uR+CzZvObmp+bEjX46fqeJbELA==
X-Google-Smtp-Source: ABdhPJxWu17j56SdQHAq1gC6qDDkB0RefAVQcawdtMTmlPVSTjiFSvOxv8KUDy2bB/jOZo8YHjCkOQ==
X-Received: by 2002:adf:f1cb:: with SMTP id z11mr307424wro.2.1623250953997;
 Wed, 09 Jun 2021 08:02:33 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:f5b2:1a3b:b4d:517c])
 by smtp.gmail.com with ESMTPSA id o3sm266509wrc.0.2021.06.09.08.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 08:02:33 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: ulf.hansson@linaro.org,
	m.szyprowski@samsung.com
Cc: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-mmc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH] mmc: meson-gx: use memcpy_to/fromio for dram-access-quirk
Date: Wed,  9 Jun 2021 17:02:30 +0200
Message-Id: <20210609150230.9291-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_080235_605868_3751C048 
X-CRM114-Status: GOOD (  17.12  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

It has been reported that usage of memcpy() to/from an iomem mapping is invalid,
and a recent arm64 memcpy update [1] triggers a memory abort when dram-access-quirk
is used on the G12A/G12B platforms.

This adds a local sg_copy_to_buffer which makes usage of io versions of memcpy
when dram-access-quirk is enabled.

Fixes: acdc8e71d9bb ("mmc: meson-gx: add dram-access-quirk")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

[1] 285133040e6c ("arm64: Import latest memcpy()/memmove() implementation")
---
 drivers/mmc/host/meson-gx-mmc.c | 50 +++++++++++++++++++++++++++++----
 1 file changed, 45 insertions(+), 5 deletions(-)


Changes since RFC:
- moved iomem address to bounce_iomem_buf otherwise sparse screamed when feeding memcpy_to/fromio with non iomem pointer

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index b8b771b643cc..3e9b28f18c70 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -165,6 +165,7 @@ struct meson_host {
 
 	unsigned int bounce_buf_size;
 	void *bounce_buf;
+	void __iomem *bounce_iomem_buf;
 	dma_addr_t bounce_dma_addr;
 	struct sd_emmc_desc *descs;
 	dma_addr_t descs_dma_addr;
@@ -742,6 +743,47 @@ static void meson_mmc_desc_chain_transfer(struct mmc_host *mmc, u32 cmd_cfg)
 	writel(start, host->regs + SD_EMMC_START);
 }
 
+/* local sg copy to buffer version with _to/fromio usage for dram_access_quirk */
+static void meson_mmc_copy_buffer(struct meson_host *host, struct mmc_data *data,
+				  size_t buflen, bool to_buffer)
+{
+	unsigned int sg_flags = SG_MITER_ATOMIC;
+	struct scatterlist *sgl = data->sg;
+	unsigned int nents = data->sg_len;
+	struct sg_mapping_iter miter;
+	unsigned int offset = 0;
+
+	if (to_buffer)
+		sg_flags |= SG_MITER_FROM_SG;
+	else
+		sg_flags |= SG_MITER_TO_SG;
+
+	sg_miter_start(&miter, sgl, nents, sg_flags);
+
+	while ((offset < buflen) && sg_miter_next(&miter)) {
+		unsigned int len;
+
+		len = min(miter.length, buflen - offset);
+
+		/* When dram_access_quirk, the bounce buffer is a iomem mapping */
+		if (host->dram_access_quirk) {
+			if (to_buffer)
+				memcpy_toio(host->bounce_iomem_buf + offset, miter.addr, len);
+			else
+				memcpy_fromio(miter.addr, host->bounce_iomem_buf + offset, len);
+		} else {
+			if (to_buffer)
+				memcpy(host->bounce_buf + offset, miter.addr, len);
+			else
+				memcpy(miter.addr, host->bounce_buf + offset, len);
+		}
+
+		offset += len;
+	}
+
+	sg_miter_stop(&miter);
+}
+
 static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
 {
 	struct meson_host *host = mmc_priv(mmc);
@@ -785,8 +827,7 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
 		if (data->flags & MMC_DATA_WRITE) {
 			cmd_cfg |= CMD_CFG_DATA_WR;
 			WARN_ON(xfer_bytes > host->bounce_buf_size);
-			sg_copy_to_buffer(data->sg, data->sg_len,
-					  host->bounce_buf, xfer_bytes);
+			meson_mmc_copy_buffer(host, data, xfer_bytes, true);
 			dma_wmb();
 		}
 
@@ -955,8 +996,7 @@ static irqreturn_t meson_mmc_irq_thread(int irq, void *dev_id)
 	if (meson_mmc_bounce_buf_read(data)) {
 		xfer_bytes = data->blksz * data->blocks;
 		WARN_ON(xfer_bytes > host->bounce_buf_size);
-		sg_copy_from_buffer(data->sg, data->sg_len,
-				    host->bounce_buf, xfer_bytes);
+		meson_mmc_copy_buffer(host, data, xfer_bytes, false);
 	}
 
 	next_cmd = meson_mmc_get_next_command(cmd);
@@ -1176,7 +1216,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
 		 * instead of the DDR memory
 		 */
 		host->bounce_buf_size = SD_EMMC_SRAM_DATA_BUF_LEN;
-		host->bounce_buf = host->regs + SD_EMMC_SRAM_DATA_BUF_OFF;
+		host->bounce_iomem_buf = host->regs + SD_EMMC_SRAM_DATA_BUF_OFF;
 		host->bounce_dma_addr = res->start + SD_EMMC_SRAM_DATA_BUF_OFF;
 	} else {
 		/* data bounce buffer */
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
