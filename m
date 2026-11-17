Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D641606A32F
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2026 16:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ai29F/h7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cMuQJ9FK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cdrt7Jk3wjOZEst0O5nDnX1ho5lQfFBb3vDRYP7Eq8A=; b=ai29F/h7/gWtla7OtSbyYofTz4
	0RcfvbQKx1RFKm8KgqSjkp3XzIP6U6XUAypx++DOVMfp5jKMBdBJkn0nZ+QopdwdlMa8cq5zoY7eg
	hW5E13HgT36EaVqQxElMXY6QqPxI++ald+snBeNUpJ+QfQjxOcmR1GCjJy07qkJ8344NLALURaM0j
	0CUzNXHxv+nmN3FeA6L/GvrbGBUmvPTroI43vqYM4azHRCcNJz8VqYCXrFHNXirx0y5U6A5NmZyZQ
	nnROG5w5DyceLPUq5AMztqh5xEkA+k/jPlE/mP/9A+AwRaHnfrwhxvPAr0W/7zRSCQy5iUWTsKRmR
	60t8m5NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMD5-00000006RrB-07NI;
	Tue, 17 Nov 2026 16:39:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMD3-00000006RqY-3FkR
	for linux-amlogic@lists.infradead.org;
	Tue, 17 Nov 2026 16:39:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD13261920;
	Tue, 17 Nov 2026 16:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5151F000C4;
	Tue, 17 Nov 2026 16:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794933543;
	bh=Pfmnvxj9CbfQ1DpBEMDbGnnfXt+Q39t2/T0T0Pu6Ftc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cMuQJ9FK1PHznyu4NZPRUAJ4VOHdcaqMcn2LHbIAcspA0Jn+nJyNCZ0gTsLKwf8jX
	 4ll6OimP/Cx450xqbmlmw7SiXpEyRzzU2PZ/oUjKybiqRG/GzjIVOWX4r328I0lEOk
	 tUoTDGkaFL3kjuJrpi/tyANJvtivxjA0ySxUP4g2SC9vG/M5CoPLn10OzYdXhByYKW
	 taU8JTxpwGudZGRLlmTZP3fzgJHi1V3251d9OwSztxyJL38KXbbJtZCQnkr+QRjLID
	 YFqoP5jhB7iASLudc4UgwxZMTdnjPwHCvXTlVMy7BrlUUidZbkvPDBgP1kD3PzUZbH
	 PSWlDY739hPow==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-amlogic@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 06/11] dmaengine: amlogic: Destroy free_wq after devres DMA device unregistration
Date: Tue, 17 Nov 2026 16:37:07 +0000
Message-ID: <20261117163809.622249-7-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
In-Reply-To: <20261117163809.622249-1-lee@kernel.org>
References: <20261117163809.622249-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

aml_dma_probe() registers the DMA device with
dmaenginem_async_device_register(), so dma_async_device_unregister() is
deferred until devres release after aml_dma_remove() returns.  However,
aml_dma_remove() destroys aml_dma->free_wq directly, causing
aml_dma_free_desc() to queue work onto a destroyed workqueue when
channels and descriptors are released during devres teardown, and early
error returns in aml_dma_probe() also leak aml_dma->free_wq.

Allocate aml_dma->free_wq with devm_alloc_ordered_workqueue() so it is
destroyed on probe failure and after dmaenginem_async_device_register()
unwinds on removal.

Fixes: b84b5197e344 ("dmaengine: amlogic: Add general DMA driver for A9")
Closes: https://sashiko.dev/#/bug/linux-c216084a-f89a-48d5-bdea-584522d1bdda
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---

v1 => v2: No changes

 drivers/dma/amlogic-dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/amlogic-dma.c b/drivers/dma/amlogic-dma.c
index 684121d13fca..791bd82743d3 100644
--- a/drivers/dma/amlogic-dma.c
+++ b/drivers/dma/amlogic-dma.c
@@ -620,7 +620,7 @@ static int aml_dma_probe(struct platform_device *pdev)
 	if (!aml_dma)
 		return -ENOMEM;
 
-	aml_dma->free_wq = alloc_ordered_workqueue("aml_dma_free", 0);
+	aml_dma->free_wq = devm_alloc_ordered_workqueue(&pdev->dev, "aml_dma_free", 0);
 	if (!aml_dma->free_wq)
 		return -ENOMEM;
 
@@ -712,7 +712,6 @@ static void aml_dma_remove(struct platform_device *pdev)
 		if (aml_chan)
 			tasklet_kill(&aml_chan->vchan.task);
 	}
-	destroy_workqueue(aml_dma->free_wq);
 }
 
 static const struct of_device_id aml_dma_ids[] = {
-- 
2.56.0.679.gc527c65306-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
