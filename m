Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54D3CC6B03
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Oct 2026 03:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LPOl/Lfcz16NpaQRZ0pQ1qFgb1eHGTHu6vdYZABS0z4=; b=sCmL3Hddni6Jq1
	PZYhJiBq9UMPqGlXmkBi9FjqwBy7StMDkRUtfi9DXMYZm0w19aoi+vyY43Ay8ejJCpD8cObIWpFy1
	UpU4HKwfNfLi8ulvfF8EplCWLYaDxZcdZV72nwuqGqfUJN6+lRIizB82Cm3wf3q+022qCGP5jmmod
	/Ze+MjLL3ZI7vXQi1eMIhmQuZvsFOlQO9lydI0SZcaXfy3F5zEvdQ2UUdiLLZRyM8K6Ww7hlXJik3
	Q80whFo35EIdkKAl+ZX3LHXbDUjSjQJC/wWnbyUn9//l5OFCvP3xsItetaaR2Mphcz94XUUtRmQGd
	2Uv79sku3dL9idoQZkkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGT6v-0000000Broi-0jTs;
	Tue, 13 Oct 2026 03:23:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGT6t-0000000BroQ-2oFx
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Oct 2026 03:23:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 15245403D1;
	Tue, 13 Oct 2026 03:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6D77C2BCC7;
	Tue, 13 Oct 2026 03:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791861806;
	bh=K+j8dwpPG35a0Usc6U/QaOJKVFbDLgR7XlxGxVx6O6I=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=eZrmd7AEuOtBXIiaAP19y1x1marNskQcpKoGoTt+tOu8Ym0Jr0jMwVIG18GEhuFIH
	 kQwPrPQU6qR2Ue6MUJrG5khBB9h3hDQJHFByTCEdyZJcxUfVovaniWwtKAKlkBhJSM
	 uqFSbQUcEbzGWyIWlHYKu1Kyh+A8gv+LmS8KC+0ZfoUdWaPDZl+y55MCBR5dFTIuhF
	 0scVG6DqnrYEtoCZ1Rz0vqFtL9Qtskjw6DroYLS1XzX+12Ot0ktqUbHMmdjCtuXLgP
	 DRKx568C3Fv1e3v8HK4uUSJWqDqrJ8bT7OnxsmnCDux5vSlcy2XJTSOh0hXePAyOIv
	 CbOE5riqym+fA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3517CC6B09;
	Tue, 13 Oct 2026 03:23:26 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 13 Oct 2026 03:21:11 +0000
Subject: [PATCH v2] dmaengine: amlogic: Fix little-endian variable
 operations issue
MIME-Version: 1.0
Message-Id: <20261013-fix-a9-dma-v2-1-860146b2ef57@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAKajzWoC/22Myw6CMBBFf4XM2jF9aEVX/odhUdoBJhFKWtNoS
 P/dytrluTfnbJAoMiW4NRtEypw4LBXUoQE32WUkZF8ZlFBGCqlw4DfaK/rZ4qmnCxnZW3PWUIU
 1Un332KOrPHF6hfjZ21n+1r+ZLFGi8q0Woh00aXW38zOM7I4uzNCVUr5HiWJypgAAAA==
X-Change-ID: 20261012-fix-a9-dma-4be7e61ba653
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791861804; l=1372;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=OZigb4en2c93sg6DmkSHlPZQyczro7uHkaw6ZWL3yJI=;
 b=Opkm9CijTWMJQVlrV4DIhfX6pYsuf2M4OAlshy3Enz6HJKjzfIBIJ62flw8Gc8SXal7Xj+5BH
 r8xHqf/gSxqAri6a9j3i1w8NAOZ3F+NxWD62J5HERDOspwkr0wl1iJy
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

In dma_async_tx_descriptor function,fix the situation where the operation
processing of the little-endian variable requires corresponding conversion.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610060235.PuCxWQdk-lkp@intel.com/
Fixes: b84b5197e344 ("dmaengine: amlogic: Add general DMA driver for A9")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Fix the operation little-endian variable issue.
---
Changes in v2:
- Simplify processing and rename subject to 'dmaengine', suggested by Frank.
- Link to v1: https://lore.kernel.org/r/20261012-fix-a9-dma-v1-1-2d83008f3e32@amlogic.com
---
 drivers/dma/amlogic-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/amlogic-dma.c b/drivers/dma/amlogic-dma.c
index 78ee2337ae71..dbd23d29397d 100644
--- a/drivers/dma/amlogic-dma.c
+++ b/drivers/dma/amlogic-dma.c
@@ -321,7 +321,7 @@ static struct dma_async_tx_descriptor *aml_dma_prep_slave_sg
 
 	/* the last sg set eoc flag */
 	sg_link--;
-	sg_link->ctl |= LINK_EOC;
+	sg_link->ctl |= cpu_to_le32(LINK_EOC);
 
 	return vchan_tx_prep(&aml_chan->vchan, &aml_desc->vd, flags);
 }

---
base-commit: 42c31fec1ca76b8b5f7759def122d418dff2cd4b
change-id: 20261012-fix-a9-dma-4be7e61ba653

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
