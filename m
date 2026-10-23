Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DE3606A31A
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Oct 2026 08:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R2DFhGAS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pcy4XlWQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LRwbfHNfbArNb+uDI2D1P8/SiYj4mz5d8+JayLe5P1M=; b=R2DFhGAS6Cuh3UWIopcJIAsdBZ
	ACa86mQU2CsQIn842U1OUS0PWy4NzeNCE01LOocHn5p27tIEK1bhpN/hnqHvQmCs9uhB1q0jVZulB
	yznnjHNXHXkGctDnXUO/58JR8JbqqA9NMpWb1V/JN0qF9yiKyfB8WIQteXRPKGpqts/Bs2nLWjJmK
	La/KI4eGbWooqunD75ngXXKtYVG/bR8pfbc8p4JnhttJzfw1dlwkxEDIh38O7K6PWYfoEvX7/Vbny
	yZpEyRFz0Qz7W68zAh4NJWAV/8V2EpiLOTy2HXU6h4ay8LEuQnAutxwtGDtXRM+NjyXx5l5k5cmIY
	XtoX4Q7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAza-0000000FxJt-2yOs;
	Fri, 23 Oct 2026 08:51:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAzZ-0000000FxJk-3edQ
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Oct 2026 08:51:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4740D43CE7;
	Fri, 23 Oct 2026 08:51:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792745473;
	b=X8qT3qMWzBSXoCPvLHx3p7Gh79wgvrnWn7wg6RqbjW7JnMcs9xAskFAKmdzMDFArc0nR
	 VUVNrkq5qsJrdmGGjj4+fRK4sIdnXIWTGfGaDAXsObQESvb+jD/qu9DJWX8OGoLkZNgNC
	 CCOEppo4qM9HkbSJMTZeM9ajc+hZZlP3pm3Tm4iskdM+h7wwNpFplm8sCcLh7PCjY0hYT
	 GxL7/FRyJ0LCcVkWIeRMkKIAdbgPLiP9cc4oGVn63P+1peK5E0IFhuKCCAaC/OC2vg9oG
	 ecX0clCNBVTY2bfPwvhljztwwRrCdQHOWRvXNxDn3ZxIQqFlB5/cAcAPiA44Ie87uKQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792745473;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=88wzN4diUU9+UTf3Daw4rfPfjSRtk2wAWuM00ZkEaww=;
	b=qWTyQCV+W0mHeXS5oNP1TIJ90ANYuUPTHiO2Pc45t3eySAyXOa9AXF7l5lL18mDQwGGE
	 5DTMnBalLL17LRyCdZWKHbpORhlktg6hiueZQFcsbCcjS4idFBDUitze+mMcBS2EkPHYr
	 7qnr4DVUrD5uqzjrZgG0rddr132QVAOUm8wkD8VXUwYnmemZH2as4lnYCmFg5QlL/pLoR
	 nlfrEw/PUvk2249E8me9xd5lv99cb3Pken1zFrov3m3IO9HP/yJJI2vxwdIx6wMAKWIG0
	 FPDJI4UX1nqwEnm6XOtLN/CK7slsXI5tiO8ctSoegFDzYSysACGlcTlQ8e7B0MKHa5Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B6D811F01825;
	Fri, 23 Oct 2026 08:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792745473;
	bh=88wzN4diUU9+UTf3Daw4rfPfjSRtk2wAWuM00ZkEaww=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Pcy4XlWQAGsp+WDc8z5oHK9mxyj0A7D1ORuhLlDZLvk0oHlOHylP/7YfJbpd1s/zS
	 0x0Rmg3OETlXv6dEGnDz0ZxYd8XCrCsbXm86jnfj1150Hm3tw4z4LlDcy4ofhtyfKf
	 CoZrws9zST1FpV0TqaMXKOJuUB2iT2YN3jsM4igmFAA/PIx7s+W+e5mlUx0nwqj3SU
	 +Ac7pcgl1EtKKZjaiR5CVaO6S0bm900OarcEItB7o7WlJ2uP0d3MTLcLyjNsT6naQD
	 ko9jUkwgrEb8atACOBLdJLouGFhS3aakaU6x3ZHy1nNHV5v9ZkrCSelR5q/TY4Vjv7
	 oBco+BflWDAKQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D41284442F;
	Fri, 23 Oct 2026 08:51:11 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 23 Oct 2026 08:50:56 +0000
Subject: [PATCH] dmaengine: amlogic: fix workqueque not free when probe
 failed
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261023-fix-a9-dma-wq-v1-1-b414de837e6e@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAO8f22oC/x2MQQqAIBAAvxJ7bkGNivpKdLDcrT1kpVBB+Pek4
 8DMvBApCEXoixcCXRJl9xl0WcC8Wr8QissMRplGK1Mhy4O2Q7dZvE9sNRPXyjF3E+TmCJSF/ze
 MKX0oPnP1XwAAAA==
X-Change-ID: 20261023-fix-a9-dma-wq-71fef50dff9b
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792745469; l=1430;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=a34YHjJv3kRrPIxLkFWemJns1CaLpsW5MhyikgyybBs=;
 b=QCRqlQC2+0xlvnJkgx367+S7w90kOB7yOCm56pMEQxvQD0+gfGwAahN9MRoK2W7IlDKsEWWX/
 ZlkU+oToRVLB0nm+c2c/Or5rM4MP6aHEyzjfg3I8WJVozpPRuDZLaE/
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

when probe failed, workqueue not free. Convert the driver to use
devm_alloc_ordered_workqueue() for allocating the workqueue. This
ties the workqueue lifetime to the device and removes the need for
explicitly destroying it in the remove callback.

Fixes: b84b5197e344 ("dmaengine: amlogic: Add general DMA driver for A9")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Fix workqueque not free when probe failed.
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

---
base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
change-id: 20261023-fix-a9-dma-wq-71fef50dff9b

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
