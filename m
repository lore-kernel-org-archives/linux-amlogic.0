Return-Path: <SRS0=r/fn=PS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B9DC43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 22:52:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EC99206B6
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 22:52:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tRkQjiCU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EC99206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MEc59dDoNEoopEA/Xwz5hqu2cXfzFKFIij6rh28e7Vk=; b=tRkQjiCUtXMKfa
	0yoc2Q6B/qryH90LTKNFyqpSSl2APRWMG0m/3nPflZNKQIgtPwM+DC8HTYUcyhXocUDCsGw80zcdk
	MmJjCPXalvvmtZ7r5bv65kkfoCf3bWiWU1l0qjSdwiG1EZXKn6cq7EFY53Rg8p0gFpa/A3F/NZoGL
	uPCla2Cqz5KYonU2xHu7t9CWBOofjElysbF62htYJqQx6h7mDDtgnRmUVyz97a5+jbScLfCUYEp6o
	m4D8a7COWSoxD6skqDChnuXbW+UJZz8awHuZCc9hFqXzRMtFxUd3FAaKR4nPpPqzNdtzKGxWWK6s9
	gr24Bal5eguMJP4tfjAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghjBm-0005AE-C5; Thu, 10 Jan 2019 22:52:38 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghjBi-00059P-LO
 for linux-amlogic@lists.infradead.org; Thu, 10 Jan 2019 22:52:36 +0000
Received: from localhost (unknown [88.190.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7F141200003;
 Thu, 10 Jan 2019 22:52:26 +0000 (UTC)
From: Remi Pommarel <repk@triplefau.lt>
To: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2] mmc: meson-gx: Free irq in release() callback
Date: Fri, 11 Jan 2019 00:01:35 +0100
Message-Id: <20190110230135.19555-1-repk@triplefau.lt>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_145234_970928_CF06F621 
X-CRM114-Status: GOOD (  11.17  )
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
Cc: Elie Roudninski <xademax@gmail.com>, linux-amlogic@lists.infradead.org,
 Remi Pommarel <repk@triplefau.lt>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Because the irq was requested through device managed resources API
(devm_request_threaded_irq()) it was freed after meson_mmc_remove()
completion, thus after mmc_free_host() has reclaimed meson_host memory.
As this irq is IRQF_SHARED, while using CONFIG_DEBUG_SHIRQ, its handler
get called by free_irq(). So meson_mmc_irq() was called after the
meson_host memory reclamation and was using invalid memory.

We ended up with the following scenario:
device_release_driver()
	meson_mmc_remove()
		mmc_free_host() /* Freeing host memory */
	...
	devres_release_all()
		devm_irq_release()
			__free_irq()
				meson_mmc_irq() /* Uses freed memory */

To avoid this, the irq is released in meson_mmc_remove() and in
mseon_mmc_probe() error path before mmc_free_host() gets called.

This fixes https://marc.info/?l=linux-mmc&m=154707415208716.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
Changes since v1:
- Fix it also in the error handling of probe callback
---
 drivers/mmc/host/meson-gx-mmc.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index c2690c1a50ff..f115d7c63ffe 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -179,6 +179,8 @@ struct meson_host {
 	struct sd_emmc_desc *descs;
 	dma_addr_t descs_dma_addr;
 
+	int irq;
+
 	bool vqmmc_enabled;
 };
 
@@ -1231,7 +1233,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct meson_host *host;
 	struct mmc_host *mmc;
-	int ret, irq;
+	int ret;
 
 	mmc = mmc_alloc_host(sizeof(struct meson_host), &pdev->dev);
 	if (!mmc)
@@ -1276,8 +1278,8 @@ static int meson_mmc_probe(struct platform_device *pdev)
 		goto free_host;
 	}
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
+	host->irq = platform_get_irq(pdev, 0);
+	if (host->irq <= 0) {
 		dev_err(&pdev->dev, "failed to get interrupt resource.\n");
 		ret = -EINVAL;
 		goto free_host;
@@ -1331,9 +1333,8 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	writel(IRQ_CRC_ERR | IRQ_TIMEOUTS | IRQ_END_OF_CHAIN,
 	       host->regs + SD_EMMC_IRQ_EN);
 
-	ret = devm_request_threaded_irq(&pdev->dev, irq, meson_mmc_irq,
-					meson_mmc_irq_thread, IRQF_SHARED,
-					NULL, host);
+	ret = request_threaded_irq(host->irq, meson_mmc_irq,
+			meson_mmc_irq_thread, IRQF_SHARED, NULL, host);
 	if (ret)
 		goto err_init_clk;
 
@@ -1351,7 +1352,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	if (host->bounce_buf == NULL) {
 		dev_err(host->dev, "Unable to map allocate DMA bounce buffer.\n");
 		ret = -ENOMEM;
-		goto err_init_clk;
+		goto err_free_irq;
 	}
 
 	host->descs = dma_alloc_coherent(host->dev, SD_EMMC_DESC_BUF_LEN,
@@ -1370,6 +1371,8 @@ static int meson_mmc_probe(struct platform_device *pdev)
 err_bounce_buf:
 	dma_free_coherent(host->dev, host->bounce_buf_size,
 			  host->bounce_buf, host->bounce_dma_addr);
+err_free_irq:
+	free_irq(host->irq, host);
 err_init_clk:
 	clk_disable_unprepare(host->mmc_clk);
 err_core_clk:
@@ -1387,6 +1390,7 @@ static int meson_mmc_remove(struct platform_device *pdev)
 
 	/* disable interrupts */
 	writel(0, host->regs + SD_EMMC_IRQ_EN);
+	free_irq(host->irq, host);
 
 	dma_free_coherent(host->dev, SD_EMMC_DESC_BUF_LEN,
 			  host->descs, host->descs_dma_addr);
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
