Return-Path: <SRS0=x061=OP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9631C65BAF
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Dec 2018 15:18:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A28120700
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Dec 2018 15:18:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fdlpkaUC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="acMyHwrt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A28120700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=igdGioWgLuBc3nhFc/2B6fiO8Zn9dAFwGy/jEzgOt5s=; b=fdlpkaUC9oDAdY
	Uf8BWQowsJ8DVSYCqKnuSd20mNODwwWo8d7sRT+ebdLPKV0flr45aCk/UvpHBYmpqEjxlsXE54m2y
	JIfaVvB9PEcImLOlNWsPcztDhogDBteYMUdriaOtoeOsSFvWgCneYPjb4He363qwLxneQYGF8yOVs
	HrVMZpRfZiCP3jTsL4FA/9+pl+y+PvlprTebdgMFadg5Eds2pLKCFFk1q1FkldSTq4Cg2ZIGSA+je
	UjgjqIKKBKO3J0jHsidFP2ZEEIBxKnv755ola7Rml+vOJUWC1FweQRWe4PsWfpcO48xeuZZO7jGi8
	iKaulMrplnSOn8QNlmfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUvQR-0008Ce-Iu; Thu, 06 Dec 2018 15:18:51 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUvQO-00089i-3h
 for linux-amlogic@lists.infradead.org; Thu, 06 Dec 2018 15:18:50 +0000
Received: by mail-wr1-x443.google.com with SMTP id p4so852981wrt.7
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Dec 2018 07:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IQ1pNjxAYQJEy/wzhy8LaXlzyI+EffZDKMSvsOZcQ9o=;
 b=acMyHwrt8WgUGbImx9XBPcsSw2WvrcbkjNowHm4RCMrQJ7XXJZ9LcOpXwNKXzOoXB+
 QsQd2L97Ag48Goc5hiLqAq4RoklHafsgH26vd19mbEdTDx/sD1J5yb2UXZzhjl79pNQU
 Vawqbb1mvm6KUoh+nFgzlbgppYUIW7Bo0pOqNtyZSBBI1p9VmAzEkgOn6f9NdYDO3DWb
 VR5PqVvPcgZUVbTT1nVfSBolvwRzQm2UYbpfmCVtog01V4Hxc2WJL5ROpb3oKmM5ju1u
 8iZse5p76cdHWXAMkM0VV0VPqL1UYWk819PXPt7XxQZ31VTHoHLM/UF05srG9VNBmuLC
 dE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IQ1pNjxAYQJEy/wzhy8LaXlzyI+EffZDKMSvsOZcQ9o=;
 b=JtTmpSjLuLRRFjN7LAT7+6efpQQGSmAVvf/HLEyhnOiQBNwr8W35RkCw7cdekHxuhV
 4iLsMxtJ3+4S4tUNJT/perYMtuM+3PTFiVfbJedymL51TEANxanO4wc2S6KUVB3uSmmT
 eoSRJzkDcuw2B+cnmIJ36vaMUbhjMWnt4+OjnrN9lYcaHcgS6hsux8u8NaYQkFWbDm4R
 8pmkivs5GLCoP30LqIWzobjih3suxasY7KocW77W0QodpUrl5emcaCEYMKdpdPf1271B
 WRMjsiEOxGGG8l6qFX0xo10CulINuggz05Mu5kgK2jI1FIFGyGwMywt3tj+7kRchOhrz
 7y2g==
X-Gm-Message-State: AA+aEWZc9ZEMMNiHG0GHGojgVfbQksEg4jkv4a5bvlsZmtqTC4lTcunm
 p6V1y1GOn86VdWs3opyW0m3d3A==
X-Google-Smtp-Source: AFSGD/U8nu1DsCPYsh2NpH8OPun8NLHb8LoJrqrEDBbNcqDltn6ibXdObfZSfShbSLcVoun+L/F78w==
X-Received: by 2002:adf:ce86:: with SMTP id r6mr27113095wrn.257.1544109517755; 
 Thu, 06 Dec 2018 07:18:37 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id j33sm939652wre.91.2018.12.06.07.18.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Dec 2018 07:18:37 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Carlo Caione <carlo@caione.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/4] mmc: meson-gx: make sure the descriptor is stopped on
 errors
Date: Thu,  6 Dec 2018 16:18:25 +0100
Message-Id: <20181206151828.24417-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181206151828.24417-1-jbrunet@baylibre.com>
References: <20181206151828.24417-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_071848_158369_0FF821C0 
X-CRM114-Status: GOOD (  17.76  )
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

On errors, if we don't stop the descriptor chain, it may continue to
run and raise IRQ after we have called mmc_request_done(). This is bad
because we won't be able to get cmd anymore and properly deal with the
IRQ.

This patch makes sure the descriptor chain is stopped before
calling mmc_request_done()

Fixes: 79ed05e329c3 ("mmc: meson-gx: add support for descriptor chain mode")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 73 ++++++++++++++++++++++++++++-----
 1 file changed, 63 insertions(+), 10 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index c201c378537e..fcb5d693c897 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -21,6 +21,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
@@ -90,9 +91,11 @@
 #define   CFG_CLK_ALWAYS_ON BIT(18)
 #define   CFG_CHK_DS BIT(20)
 #define   CFG_AUTO_CLK BIT(23)
+#define   CFG_ERR_ABORT BIT(27)
 
 #define SD_EMMC_STATUS 0x48
 #define   STATUS_BUSY BIT(31)
+#define   STATUS_DESC_BUSY BIT(30)
 #define   STATUS_DATI GENMASK(23, 16)
 
 #define SD_EMMC_IRQ_EN 0x4c
@@ -928,6 +931,7 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
 
 	cmd_cfg |= FIELD_PREP(CMD_CFG_CMD_INDEX_MASK, cmd->opcode);
 	cmd_cfg |= CMD_CFG_OWNER;  /* owned by CPU */
+	cmd_cfg |= CMD_CFG_ERROR; /* stop in case of error */
 
 	meson_mmc_set_response_bits(cmd, &cmd_cfg);
 
@@ -1022,6 +1026,17 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 	u32 irq_en, status, raw_status;
 	irqreturn_t ret = IRQ_NONE;
 
+	irq_en = readl(host->regs + SD_EMMC_IRQ_EN);
+	raw_status = readl(host->regs + SD_EMMC_STATUS);
+	status = raw_status & irq_en;
+
+	if (!status) {
+		dev_dbg(host->dev,
+			"Unexpected IRQ! irq_en 0x%08x - status 0x%08x\n",
+			 irq_en, raw_status);
+		return IRQ_NONE;
+	}
+
 	if (WARN_ON(!host) || WARN_ON(!host->cmd))
 		return IRQ_NONE;
 
@@ -1029,22 +1044,18 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 
 	cmd = host->cmd;
 	data = cmd->data;
-	irq_en = readl(host->regs + SD_EMMC_IRQ_EN);
-	raw_status = readl(host->regs + SD_EMMC_STATUS);
-	status = raw_status & irq_en;
-
 	cmd->error = 0;
 	if (status & IRQ_CRC_ERR) {
 		dev_dbg(host->dev, "CRC Error - status 0x%08x\n", status);
 		cmd->error = -EILSEQ;
-		ret = IRQ_HANDLED;
+		ret = IRQ_WAKE_THREAD;
 		goto out;
 	}
 
 	if (status & IRQ_TIMEOUTS) {
 		dev_dbg(host->dev, "Timeout - status 0x%08x\n", status);
 		cmd->error = -ETIMEDOUT;
-		ret = IRQ_HANDLED;
+		ret = IRQ_WAKE_THREAD;
 		goto out;
 	}
 
@@ -1069,17 +1080,49 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 	/* ack all enabled interrupts */
 	writel(irq_en, host->regs + SD_EMMC_STATUS);
 
+	if (cmd->error) {
+		/* Stop desc in case of errors */
+		u32 start = readl(host->regs + SD_EMMC_START);
+
+		start &= ~START_DESC_BUSY;
+		writel(start, host->regs + SD_EMMC_START);
+	}
+
 	if (ret == IRQ_HANDLED)
 		meson_mmc_request_done(host->mmc, cmd->mrq);
-	else if (ret == IRQ_NONE)
-		dev_warn(host->dev,
-			 "Unexpected IRQ! status=0x%08x, irq_en=0x%08x\n",
-			 raw_status, irq_en);
 
 	spin_unlock(&host->lock);
 	return ret;
 }
 
+static int meson_mmc_wait_desc_stop(struct meson_host *host)
+{
+	int loop;
+	u32 status;
+
+	/*
+	 * It may sometimes take a while for it to actually halt. Here, we
+	 * are giving it 5ms to comply
+	 *
+	 * If we don't confirm the descriptor is stopped, it might raise new
+	 * IRQs after we have called mmc_request_done() which is bad.
+	 */
+	for (loop = 50; loop; loop--) {
+		status = readl(host->regs + SD_EMMC_STATUS);
+		if (status & (STATUS_BUSY | STATUS_DESC_BUSY))
+			udelay(100);
+		else
+			break;
+	}
+
+	if (status & (STATUS_BUSY | STATUS_DESC_BUSY)) {
+		dev_err(host->dev, "Timed out waiting for host to stop\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
 static irqreturn_t meson_mmc_irq_thread(int irq, void *dev_id)
 {
 	struct meson_host *host = dev_id;
@@ -1090,6 +1133,13 @@ static irqreturn_t meson_mmc_irq_thread(int irq, void *dev_id)
 	if (WARN_ON(!cmd))
 		return IRQ_NONE;
 
+	if (cmd->error) {
+		meson_mmc_wait_desc_stop(host);
+		meson_mmc_request_done(host->mmc, cmd->mrq);
+
+		return IRQ_HANDLED;
+	}
+
 	data = cmd->data;
 	if (meson_mmc_bounce_buf_read(data)) {
 		xfer_bytes = data->blksz * data->blocks;
@@ -1130,6 +1180,9 @@ static void meson_mmc_cfg_init(struct meson_host *host)
 	cfg |= FIELD_PREP(CFG_RC_CC_MASK, ilog2(SD_EMMC_CFG_CMD_GAP));
 	cfg |= FIELD_PREP(CFG_BLK_LEN_MASK, ilog2(SD_EMMC_CFG_BLK_SIZE));
 
+	/* abort chain on R/W errors */
+	cfg |= CFG_ERR_ABORT;
+
 	writel(cfg, host->regs + SD_EMMC_CFG);
 }
 
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
