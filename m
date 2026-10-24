Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3B7606A31A
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Oct 2026 09:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XTryBmbF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=gzixjNik;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=CchQwBVI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8F1r3uZdef/TcrCluBxvB0bemUSpHsStMXKuDOjHAUQ=; b=XTryBmbF4fX200BgYw+tjQXnK7
	t1TuBYxtrJT5w57VfNrVNoVcccbofCinAZ8/tBq4i9ntcZBnrTXrdlQ7DYFn2GXm6k+hmv3GDmBz1
	dORciSH6+Y40UsKuMJsGqm0UzkQxIKsau+avGIWRdwfm2r8HlAuLU+t4X2syG98LbU4n53YDCqtmH
	agvfK0DACqPFulsn6u6k6J556hNy+eQRczvq/5pfvvF9OXfVKsuaOBr+sSMBQmVk/374SA9is8NJe
	tJ08utfy4bs+ygQU6SlzR7v/EwrVAZis93JSD8TexrAV6fbt+qhtgdb2uDx1vH1sGaZNUhmQtnQA5
	gkRnBaHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKXpY-000000002JG-2dTl;
	Sat, 24 Oct 2026 09:14:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKXpY-000000002J2-1Jla
	for linux-amlogic@bombadil.infradead.org;
	Sat, 24 Oct 2026 09:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=QWkn/xlVHRiRHb499IBZuW+PIveJv2lg7thsC4TJ6eg=; b=gzixjNikeIKUQ4QbeLdST8TbLS
	9DQAbBac1DEmtLS0WjOmsga3lImooc5XWilNIDyF9AnOVF1hM3jW5pALFraWz8dzfctPfL7QPZuN6
	zZ6whAij5w94RKAI8Jkjzq1vbaxBic9sWHMp6EG0jAY1mJhH6eSEbLt7HHPVbOF5f1u8QJt5c3D7Z
	Iie3vfFHhjgLAgHmc8v1EgvQ0t0jWmKDbdK/TpNQLy3pdVonHkwmWB363RdMxz9BFqhMNzvdYWtmr
	9ZiOhgZ29/uBbtMimYMsOGGCHD1vR9wRKQpoq0s+9+oQzksO3dRbVuWRv8flhgTczWHhBoD3JWxMF
	G/XFlIAg==;
Received: from smtp-15.smtpout.orange.fr ([80.12.242.15] helo=smtp.smtpout.orange.fr)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKXpT-0000000Bf80-3g2G
	for linux-amlogic@lists.infradead.org;
	Sat, 24 Oct 2026 09:14:22 +0000
Received: from fedora.home ([10.64.95.100])
	by smtp.orange.fr with ESMTP
	id KXgjxjzKohc5VKXgjxqGgU; Sat, 24 Oct 2026 11:05:17 +0200
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e])
	by smtp.orange.fr with ESMTPSA
	id KXghxPvvNkwI8KXghxaElh; Sat, 24 Oct 2026 11:05:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1792832717;
	bh=QWkn/xlVHRiRHb499IBZuW+PIveJv2lg7thsC4TJ6eg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=CchQwBVI0N6no9inzOgf1a18hq7H1IK9SKCyFxFx/6P+8EIL7aL7z6FRFVbkZNdoh
	 HVEGzh+YabO/yoV8q6ryMwmY4Kaq0UyiKCGU36J9XlQpO+UzpPavB9vv/S7HVUJjSt
	 eq+xd4iKC3kdOIdvu5q53e6V3w328Jm4nmH0T8sNyWN9wru6QQ5dyHBoPKV2LnaVWO
	 53U8eQ7btsL/h8Sd2X6tOT9nF6e5hEScfRp77awMLSUJDTWFMW0i8YTkiAWoDJbKGT
	 g6EDL4OiSs+Hr1945IIQF1UPxhN0bK9GOAJPrg6tvRR9wQazxrdK9Hkp+zvx5f/gu/
	 Wv82SZbbvRqVg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 24 Oct 2026 11:05:17 +0200
X-ME-IP: 2a01:cb10:785:b00:26fb:aefb:6cd2:db0e
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-amlogic@lists.infradead.org,
	dmaengine@vger.kernel.org
Subject: [PATCH v2] dmaengine: amlogic: Fix missing destroy_workqueue() at error path in aml_dma_probe()
Date: Sat, 24 Oct 2026 11:05:13 +0200
Message-ID: <13a835b1770e360af7991bb4c91ce52a8d01e331.1792785154.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_101420_347475_BAAC85FE 
X-CRM114-Status: GOOD (  11.82  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If an error occurs after the alloc_ordered_workqueue() call, the
corresponding memory is never released.

Use the managed version instead, as already done by most functions in the
probe and simplify the remove function accordingly.

This avoids the leak.

Fixes: b84b5197e344 ("dmaengine: amlogic: Add general DMA driver for A9")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

Changes in v2:
  - update the subject   [Franck Li]

v1: https://lore.kernel.org/lkml/93183551770e260aff993bb4cf1ce5ba8dc1e732.1792785154.git.christophe.jaillet@wanadoo.fr/
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
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
