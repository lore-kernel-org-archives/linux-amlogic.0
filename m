Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2860360A3834
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Nov 2026 21:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lso4XkpO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ctjkI+d2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=i3u0agzOJ3xGzowtpZViRCo1lsE/t/BPzgDYghRD+qg=; b=lso4XkpOGYHAbnKXWprU/wCOYU
	0jUaKxaRekZM/YRs5drEK+1GIUpx+hNDCM6P8/hUa4th7DNs5NDdzz71FwKECz1NdYexJZmiu4vze
	fQlmw9vTpjs+FQG/8UuVBVWTZjSvHGyrin8HI/xOwqgtp2q0x9otQ5aLjKsuCr14EbrKbqmy9vTFg
	I22HgnWBDtiAS8lobuIOTlLri6erQZYBHkJ7SuzY+y2wZ6G8lf/M7h6Gh5Gc9i29V3BEU5jn3QVY6
	8kjZX1kHbnZTovSWQR8qETUh397VVpaEeZMr7SgN0T5IkCcuhAc6l0eQA7LtO8lbcPz10AxfmLwI7
	HcEBLtVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGHD-00000007rxh-2yM8;
	Wed, 11 Nov 2026 21:54:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGHC-00000007rwP-05gc
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Nov 2026 21:54:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D4D6635AC;
	Wed, 11 Nov 2026 21:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A211F00A05;
	Wed, 11 Nov 2026 21:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794434081;
	bh=q645S7MuLxtm0KXEpUvH/1fxmD22ftRK+Tq/SnA/0bc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ctjkI+d2kHy1vY4LJPUexzsoO3/W30OnbdRDxZBFGqtlp61gsF+RCZB7YrNWZkV87
	 XP1+wZ25F7cbVo/6jna/9pRD2hNmuNjKyexW4AQgK1j7d1/ian2Dh+mevzQNMuAVn4
	 r4m94tcm/RVlz0ONFRr63MA+6mrLoq1+gIqntiVWeqEU2UKiiqDDhQVBc4sltlKDH8
	 Nzl2J/L6wAe4TzhdmXGAPYD6rDy99T8rlCiUsj6OEIiRfyWTj3OINzxGykeZDXfWb+
	 XkDrgao/Ch1hj7cG/LFtJBVinQuiY+hdQGssoERkl/T4gReeQ4nzBg0HzoXLigRmKa
	 ZsZt589PlMMBQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-amlogic@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 05/10] dmaengine: amlogic: Destroy free_wq after devres DMA device unregistration
Date: Wed, 11 Nov 2026 21:52:43 +0000
Message-ID: <20261111215349.1983909-6-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261111215349.1983909-1-lee@kernel.org>
References: <20261111215349.1983909-1-lee@kernel.org>
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
2.56.0.567.gdb80ae8cd5-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
