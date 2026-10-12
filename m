Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E96ECA9EC5
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Oct 2026 08:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fb3eUGgrgEFHmY1lvNwRLPH4SJeoI7+X3Cmct2gYECg=; b=Jnx69F/3WRPsGZ
	1QKGuVdPs6ahWNrnkO7jpds7xE5IqK9MNzw2xjZDd5erpwSpCsQCW9Xt+ZPAK02CxAuqV7BT2oJN/
	iUG2HJ/odiAzuKMlnvUgsdGtVahlv371fSFoiaqi/N5BfMs2w1WL7pBrMrR4YMRX6Vs3wEcEdJn2y
	LOBjNCjGlfWGjuexG1zrJ4ubohssTpw7Ss7gJyjt1ib2iljme7sj9ontpW2UjRbPOk0CbHQZbsjMI
	IL5xtf3/n2nG9jxVa7zPZvRmLOt+OOJmfoCXrNrqkqOC0BlvHd0Dby8ll57xqe0MrFw8uEL9na7Dd
	mtJpDuBSG5S3t/0pnvQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAxY-00000009skr-3Bns;
	Mon, 12 Oct 2026 08:00:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAxU-00000009skR-2w1i
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Oct 2026 08:00:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A787413AF;
	Mon, 12 Oct 2026 08:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E53C8C2BCF4;
	Mon, 12 Oct 2026 08:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791792032;
	bh=5EEOw38mea9xb3fj1kLycZgwAtj5BNQt6FxpnmmIBMI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=fpJ0m4aF8vCgc51IsuVJHu1SsLapZvZsF0eTvHu+qAvRGD7T/iPDYw0xLdYZKkhs4
	 BowDKDK6Cwv/AhX2SYNgcKsoYQTt9dWeu3mWnqUEMNXwCLp6NbLZHl0EgbLaAqayXY
	 D5OdCGMC8xPIzpnjxJRZIFvLviT4J0r9nmENuizaTrNzD+9ohR3wF+uyeH7p6NCL7/
	 vTWycDpSkXzQoiDMItxlDg4dUwwVsJLwYeU1hKNAxQBp+2Ok2u+DmgHvWpypZ/GTHO
	 K/oJS8eBWvnnrrz2SdG8+CKDCrOTwaRTYzXQxZz0EjsbvszMPK7PCCIivFy1SYzLcl
	 pFI6/eXxtdXNg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C557ACA9ED2;
	Mon, 12 Oct 2026 08:00:31 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 12 Oct 2026 08:00:20 +0000
Subject: [PATCH] dma: amlogic: Fix little-endian variable operations issue
MIME-Version: 1.0
Message-Id: <20261012-fix-a9-dma-v1-1-2d83008f3e32@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAJOTzGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0Mj3bTMCt1ES92U3ERdk6RU81Qzw6REM1NjJaCGgqJUoCzYsOjY2lo
 A/v73G1wAAAA=
X-Change-ID: 20261012-fix-a9-dma-4be7e61ba653
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791792030; l=1209;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=MGtI9iPeIcfHpSdg3DM67l61qmbOpdtXMG6n3gxJRnU=;
 b=A+XdZzGpsG4iQCPdlMLMiPVu8hZGhXnsVB8XSC0u4KWuu7ga0GROb4VG5ZTLNWDfhZwbHUBoC
 BjLSaoVldXKDFRgl7yrxa1fKWbIR/FNBG73mbpSEC2brRf31LP/Nu1v
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
 drivers/dma/amlogic-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/amlogic-dma.c b/drivers/dma/amlogic-dma.c
index 78ee2337ae71..bbf5ae5ac705 100644
--- a/drivers/dma/amlogic-dma.c
+++ b/drivers/dma/amlogic-dma.c
@@ -321,7 +321,7 @@ static struct dma_async_tx_descriptor *aml_dma_prep_slave_sg
 
 	/* the last sg set eoc flag */
 	sg_link--;
-	sg_link->ctl |= LINK_EOC;
+	sg_link->ctl = cpu_to_le32(le32_to_cpu(sg_link->ctl) | LINK_EOC);
 
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
