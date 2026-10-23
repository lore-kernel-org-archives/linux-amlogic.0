Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0F5606A31A
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Oct 2026 02:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b6UxKQkq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=J3ANBp7s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=618TNm1j2E6SfkJ7TJbUPYRkr6iUf0Z/YEr3/OMdidY=; b=b6UxKQkqTeZiFs14BzDbnIxzw4
	Xw9oNYM1GwklaKgYSwbaPZcoX3Krae91wqWY7KCaGgILbWSc87bglfsRKPIDbVXefg0NjTFuxYHN3
	ZVyW5MRdWje56G7YnvlsdGiHQAjQEVRJRAoZCVmVi2UoT4NcKje55rvea00UwaBPX3Pg9uyUUwX/e
	rf6KAmZWtOAp8eoxveeF2KNohypOr5DfXIHosoC7Q48tPkZY8JDOw0WnlUKcqler/FYY6rgWUQ0AB
	QkL40mZIbVVt8ieIbcUw0z9oEi+/+5JIDsxE0VM5O02FKt3x9FpCwbX3ejMuWbxdWajKf/8OAvZrY
	MZcVgXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKR9D-0000000HL6T-1uee;
	Sat, 24 Oct 2026 02:06:15 +0000
Received: from smtp-69.smtpout.orange.fr ([80.12.242.69] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKR99-0000000HL64-1KGR
	for linux-amlogic@lists.infradead.org;
	Sat, 24 Oct 2026 02:06:13 +0000
Received: from fedora.home ([10.65.86.60])
	by smtp.orange.fr with ESMTP
	id KLJuxVbOJopfeKLJuxoe9x; Fri, 23 Oct 2026 21:52:54 +0200
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e])
	by smtp.orange.fr with ESMTPSA
	id KLJtxn1dYYWtEKLJtxZQMp; Fri, 23 Oct 2026 21:52:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1792785174;
	bh=2m4IKtQlnVrJI7NkWlXuPkFhNiQqmS45ouu3Fbw8/CI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=J3ANBp7sl/Dl5dkq6MOWlU6Kns62suUnR3EyqF7/ceWuGlTV/5beUyZ3CHZWT68wR
	 wOj/1I0TAbQ5sbdz65qvjbLvE3OQkF+mAxnjwcCWyMx1VqPMQ01LxQWvyy7W0O9tf5
	 vpgKj/gUidSYfM/4YE54GKamJe72utqoX/husS4YTvK5rPXEiJAfofGwZXqGzr5GxS
	 JMFz8s3ngydirGYFyQ68y/TpFNy3wFWZx68XT/nQNAaf0k0T6l5RVccwJ8+Cwg2mPV
	 WwSTg5IQwUD9o2ryJ4mWIoUqBFfbvG7lQCcBrKMW1S2BAVkIIR5ZTgEVUrYISPqb77
	 ZpoyUSMYgkGHQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 23 Oct 2026 21:52:54 +0200
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
Subject: [PATCH] dmaengine: amlogic: Fix an error handling path in aml_dma_probe()
Date: Fri, 23 Oct 2026 21:52:50 +0200
Message-ID: <93183551770e260aff993bb4cf1ce5ba8dc1e732.1792785154.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_190611_799415_4FE97312 
X-CRM114-Status: GOOD (  10.56  )
X-Spam-Score: -2.1 (--)
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

if an error occurs after the alloc_ordered_workqueue() call, the
corresponding memory is never released.

Use the managed version instead, as already done by most functions in the
probe and simplify the remove function accordingly.

This avoids the leak.

Fixes: b84b5197e344 ("dmaengine: amlogic: Add general DMA driver for A9")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
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
