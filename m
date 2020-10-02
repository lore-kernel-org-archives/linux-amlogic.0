Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB49C4363C
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 16:49:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 630A520719
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 16:49:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KCIpwfH4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EdjwouQl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 630A520719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sBIXt18ipxtgZ52X/N5y/K7Zxzll0IRxow7Ov7OA5lc=; b=KCIpwfH4j4wfjxACZEpIXE7oS1
	WWgjQr13qefffnEIqAl4pIptTG5CesZOrJ1ZhhLUvjMns/qIbvlIjVMCfDIw6dBSqi9UJ8Of9zBZC
	BwWpttjqIXYrA1/+oDgsgzsB6CR6KaztreSY4lBzTZxUE73G22XyIb/iJSbpj/Gj+yJzbj6VbrKzD
	651+U30aCVq3HtVqE91dUkrYgph1x5EkgVSvl8FW5ypFBMuQaGkKqHJydErC9Ln+kn6oWSKtAbt30
	+HT2FTtq5EXfwa/vzZSFAdMPg5CV4pw2E9xK/XSSCTZvDRY+UnCAOZJhWWpY2zAEDKVyBq3V/SnhG
	bAehBBOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOOFa-0001DA-IY; Fri, 02 Oct 2020 16:49:42 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOOFW-0001CE-Cp
 for linux-amlogic@lists.infradead.org; Fri, 02 Oct 2020 16:49:40 +0000
Received: by mail-ej1-x643.google.com with SMTP id qp15so2905621ejb.3
 for <linux-amlogic@lists.infradead.org>; Fri, 02 Oct 2020 09:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jt0mTKD7biJvR9C/s8GFzCkzqMneNgtMalWKvcqcZ30=;
 b=EdjwouQlpw+idcJObMj1jPU1XGKGGQ0BEVqaE7YHdOSPuhnSOUbNgFMamRCgjLp/0q
 H44qtdpsxizB7fJjt3tx7nr24WboyDOF5FTSPnmlMU4kH8JDOKH2gw+i8sEJ+zPKb0gM
 JgN+3UndIwmk96JBb3avGZ2zk+iGphGgWbERjPJWWjpSkl45bq5Jb3ZJiuqv2Czx3Wz6
 WWcfOHD/W0plTO7SW3ZxLg8T8lkwzC3FXlG6h7MhCcZfpjzNUUGBgnR6I/2TjdDVHEBO
 Zqp6rV7udmQnZ0BuoYxqW2q8sZdb0EEE3MvLXx4qLjLtNfcl8fiOGW17JgrKroxGeWb7
 jnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jt0mTKD7biJvR9C/s8GFzCkzqMneNgtMalWKvcqcZ30=;
 b=RzGAMBqcI/qhTNhHS/rwUpSaVu/rtbgKpm8Or9S4DVcEMVgUXg6lCxt5nyk3aQ5B7y
 EgfjcM5F6VzndsQc82iMbQYZFLAemN3hjCxmEkKjD0WNb43aBNr4QaQ2cHlOb8DcmrPM
 D4AX6BJXc6mOJ7KszBd/7qKDiuGANGa1z7dN9n9FyUEcpuTNU1webBiyIvV11XhpH/NV
 kU/w6xtruXs2n1YNSoCUb95DvM+CqFng22ImNP0IuJHxNlfwt9Ct+VPgoxhUZYC5cVih
 NBr0mUBgvPJX9uwZU0eLAPRavfzrY/W1iShrEdq4QHk+YfSs0jgN0mFDYOmkKArhDrrz
 SyTA==
X-Gm-Message-State: AOAM533SW7eG/cyNwT94qH3H8b5Hi742hQGXUhSqPaFk/tVmrG16kjdh
 qvQIPq1KrPTcdZwdHECIaDfsUA==
X-Google-Smtp-Source: ABdhPJzYKdYeTdWqSU8vWwnYGHuNNzK8lAmxh4xAjC4EFgh1Og8vu0MicZjCYnSgGajWJjpOHDvogA==
X-Received: by 2002:a17:906:1dd0:: with SMTP id
 v16mr3135410ejh.309.1601657376897; 
 Fri, 02 Oct 2020 09:49:36 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id r27sm1586429edx.33.2020.10.02.09.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 09:49:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH] mmc: meson-gx: remove IRQF_ONESHOT
Date: Fri,  2 Oct 2020 18:49:15 +0200
Message-Id: <20201002164915.938217-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_124938_540133_129B20E4 
X-CRM114-Status: GOOD (  21.06  )
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
Cc: Kevin Hilman <khilman@baylibre.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Brad Harper <bjharper@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

IRQF_ONESHOT was added to this driver to make sure the irq was not enabled
again until the thread part of the irq had finished doing its job.

Doing so upsets RT because, under RT, the hardirq part of the irq handler
is not migrated to a thread if the irq is claimed with IRQF_ONESHOT.
In this case, it has been reported to eventually trigger a deadlock with
the led subsystem.

Preventing RT from doing this migration was certainly not the intent, the
description of IRQF_ONESHOT does not really reflect this constraint:

 > IRQF_ONESHOT - Interrupt is not reenabled after the hardirq handler finished.
 >              Used by threaded interrupts which need to keep the
 >              irq line disabled until the threaded handler has been run.

This is exactly what this driver was trying to acheive so I'm still a bit
confused whether this is a driver or an RT issue.

Anyway, this can be solved driver side by manually disabling the IRQs
instead of the relying on the IRQF_ONESHOT. IRQF_ONESHOT may then be removed
while still making sure the irq won't trigger until the threaded part of
the handler is done.

Fixes: eb4d81127746 ("mmc: meson-gx: correct irq flag")
Reported-by: Brad Harper <bjharper@gmail.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 47 ++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 18 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 08a3b1c05acb..effc356db904 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -101,8 +101,7 @@
 #define   IRQ_RESP_STATUS BIT(14)
 #define   IRQ_SDIO BIT(15)
 #define   IRQ_EN_MASK \
-	(IRQ_CRC_ERR | IRQ_TIMEOUTS | IRQ_END_OF_CHAIN | IRQ_RESP_STATUS |\
-	 IRQ_SDIO)
+	(IRQ_CRC_ERR | IRQ_TIMEOUTS | IRQ_END_OF_CHAIN)
 
 #define SD_EMMC_CMD_CFG 0x50
 #define SD_EMMC_CMD_ARG 0x54
@@ -170,6 +169,7 @@ struct meson_host {
 	dma_addr_t descs_dma_addr;
 
 	int irq;
+	u32 irq_en;
 
 	bool vqmmc_enabled;
 };
@@ -842,22 +842,24 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 	struct meson_host *host = dev_id;
 	struct mmc_command *cmd;
 	struct mmc_data *data;
-	u32 irq_en, status, raw_status;
+	u32  status, raw_status;
 	irqreturn_t ret = IRQ_NONE;
 
-	irq_en = readl(host->regs + SD_EMMC_IRQ_EN);
+	/* Disable irqs */
+	writel(0, host->regs + SD_EMMC_IRQ_EN);
+
 	raw_status = readl(host->regs + SD_EMMC_STATUS);
-	status = raw_status & irq_en;
+	status = raw_status & host->irq_en;
 
 	if (!status) {
 		dev_dbg(host->dev,
 			"Unexpected IRQ! irq_en 0x%08x - status 0x%08x\n",
-			 irq_en, raw_status);
-		return IRQ_NONE;
+			 host->irq_en, raw_status);
+		goto none;
 	}
 
 	if (WARN_ON(!host) || WARN_ON(!host->cmd))
-		return IRQ_NONE;
+		goto none;
 
 	/* ack all raised interrupts */
 	writel(status, host->regs + SD_EMMC_STATUS);
@@ -908,6 +910,11 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 	if (ret == IRQ_HANDLED)
 		meson_mmc_request_done(host->mmc, cmd->mrq);
 
+none:
+	/* Enable the irq again if the thread will not run */
+	if (ret != IRQ_WAKE_THREAD)
+		writel(host->irq_en, host->regs + SD_EMMC_IRQ_EN);
+
 	return ret;
 }
 
@@ -934,15 +941,17 @@ static irqreturn_t meson_mmc_irq_thread(int irq, void *dev_id)
 	struct mmc_command *next_cmd, *cmd = host->cmd;
 	struct mmc_data *data;
 	unsigned int xfer_bytes;
+	int ret = IRQ_HANDLED;
 
-	if (WARN_ON(!cmd))
-		return IRQ_NONE;
+	if (WARN_ON(!cmd)) {
+		ret = IRQ_NONE;
+		goto out;
+	}
 
 	if (cmd->error) {
 		meson_mmc_wait_desc_stop(host);
 		meson_mmc_request_done(host->mmc, cmd->mrq);
-
-		return IRQ_HANDLED;
+		goto out;
 	}
 
 	data = cmd->data;
@@ -959,7 +968,10 @@ static irqreturn_t meson_mmc_irq_thread(int irq, void *dev_id)
 	else
 		meson_mmc_request_done(host->mmc, cmd->mrq);
 
-	return IRQ_HANDLED;
+out:
+	/* Re-enable the irqs */
+	writel(host->irq_en, host->regs + SD_EMMC_IRQ_EN);
+	return ret;
 }
 
 /*
@@ -1133,13 +1145,12 @@ static int meson_mmc_probe(struct platform_device *pdev)
 
 	/* clear, ack and enable interrupts */
 	writel(0, host->regs + SD_EMMC_IRQ_EN);
-	writel(IRQ_CRC_ERR | IRQ_TIMEOUTS | IRQ_END_OF_CHAIN,
-	       host->regs + SD_EMMC_STATUS);
-	writel(IRQ_CRC_ERR | IRQ_TIMEOUTS | IRQ_END_OF_CHAIN,
-	       host->regs + SD_EMMC_IRQ_EN);
+	host->irq_en = IRQ_EN_MASK;
+	writel(host->irq_en, host->regs + SD_EMMC_STATUS);
+	writel(host->irq_en, host->regs + SD_EMMC_IRQ_EN);
 
 	ret = request_threaded_irq(host->irq, meson_mmc_irq,
-				   meson_mmc_irq_thread, IRQF_ONESHOT,
+				   meson_mmc_irq_thread, 0,
 				   dev_name(&pdev->dev), host);
 	if (ret)
 		goto err_init_clk;
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
