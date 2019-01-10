Return-Path: <SRS0=r/fn=PS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB42C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 17:35:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 427A9208E3
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 17:35:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KNbj2JTl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 427A9208E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SERgCQ+1yGA4dJbmIHziqSbwddmtHVuupuoq4IGL2mA=; b=KNbj2JTl6j/ToZ
	FeBM3fOV71zri5lIR3iyJN7LILsYYwPK0xnNjkJ0Oh7GV6yKtzAlPByIUQkl6x0MsNM1mvh/s7gkb
	Zp2VkZpDkkXqiENnXhlyLa+R/SMLXrHwoZajXUhsled8WsGUAsR75FBmqkwB/+q7N8RGQiapsVKIV
	sPhOehgQTb21EwOcA6oA/82bEsDKx2sYf7/eLVDLYeHpH2qmiFBhxZ++P2B7p8ibZHj1Iq18o+e4w
	d/Y4pGsda5hTWonTDxqmbcg3qJKG//T69hqkAMbK99CiZ1mNy4CTdyMHC0eMYWEANp9hvUPNW57EC
	4I0NQ4VgbBQPPUZoZdxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gheEg-0008DG-HH; Thu, 10 Jan 2019 17:35:18 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gheE0-0006px-1C
 for linux-amlogic@lists.infradead.org; Thu, 10 Jan 2019 17:34:47 +0000
X-Originating-IP: 88.190.179.123
Received: from localhost (unknown [88.190.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E74D71C0007;
 Thu, 10 Jan 2019 17:34:24 +0000 (UTC)
From: Remi Pommarel <repk@triplefau.lt>
To: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] mmc: meson-gx: Free irq in release() callback
Date: Thu, 10 Jan 2019 18:43:37 +0100
Message-Id: <20190110174337.24660-1-repk@triplefau.lt>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_093436_676849_A9A8AB66 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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
 Remi Pommarel <repk@triplefau.lt>, linux-mmc@vger.kernel.org
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

To avoid this, the irq is released in meson_mmc_remove() before
mmc_free_host() gets called.

This fixes https://marc.info/?l=linux-mmc&m=154707415208716.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 drivers/mmc/host/meson-gx-mmc.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index c2690c1a50ff..412cfd16bf15 100644
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
+	ret = devm_request_threaded_irq(&pdev->dev, host->irq, meson_mmc_irq,
+			meson_mmc_irq_thread, IRQF_SHARED, NULL, host);
 	if (ret)
 		goto err_init_clk;
 
@@ -1387,6 +1388,7 @@ static int meson_mmc_remove(struct platform_device *pdev)
 
 	/* disable interrupts */
 	writel(0, host->regs + SD_EMMC_IRQ_EN);
+	devm_free_irq(host->dev, host->irq, host);
 
 	dma_free_coherent(host->dev, SD_EMMC_DESC_BUF_LEN,
 			  host->descs, host->descs_dma_addr);
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
