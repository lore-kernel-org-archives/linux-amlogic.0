Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D15BCC43461
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 23:51:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 396502078D
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 23:51:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="17i8/URK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 396502078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+EAw4ChJZ32H7t320UseKMxp9MURNBxLesEAHWmEtfE=; b=17i8/URK8ba830EeW2mQJxGcj
	+HMMgQ0w614BouI1rMrsphI5iOZ88xzeagaFSF8VQHhny+z2KZ6l0zJcJRiJLjufhaARM6w1/k1oL
	yIN0gjxNKWJGV+hCHDIhee+hCGSIQHlnUz1WKaZwRtjWSxdS89Nw56aJhjuvi6lA05DsxTMwM7rEK
	braNLMa9/cUZzjlAVfXxBXiflxa1f5fsQGNXSHy3MipLxFLpIhi5OH37LTn79yJatWawQGWIqXRBc
	H+GsyKolX7HSMVfVwaYAN2Ic5ZALxaKZSsAuKdY3YONF9Fze54y/w0l9WWE+S3ypEcx5yZKASSd08
	LSyNDgfYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIKjR-00044z-60; Tue, 15 Sep 2020 23:51:29 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIKjJ-00041N-V8; Tue, 15 Sep 2020 23:51:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DF331045;
 Tue, 15 Sep 2020 16:51:20 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8B6843F68F;
 Tue, 15 Sep 2020 16:51:18 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org, robh@kernel.org, tomeu.vizoso@collabora.com,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com,
 khilman@baylibre.com, narmstrong@baylibre.com, jbrunet@baylibre.com
Subject: [PATCH 1/3] iommu/io-pgtable-arm: Support coherency for Mali LPAE
Date: Wed, 16 Sep 2020 00:51:05 +0100
Message-Id: <d2a3ddb17b3270e268e2f1adf7682ea938823941.1600213517.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
In-Reply-To: <cover.1600213517.git.robin.murphy@arm.com>
References: <cover.1600213517.git.robin.murphy@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_195122_131554_046D78BE 
X-CRM114-Status: GOOD (  12.71  )
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
Cc: linux-amlogic@lists.infradead.org, iommu@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Midgard GPUs have ACE-Lite master interfaces which allows systems to
integrate them in an I/O-coherent manner. It seems that from the GPU's
viewpoint, the rest of the system is its outer shareable domain, and so
even when snoop signals are wired up, they are only emitted for outer
shareable accesses. As such, setting the TTBR_SHARE_OUTER bit does
indeed get coherent pagetable walks working nicely for the coherent
T620 in the Arm Juno SoC.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/io-pgtable-arm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index dc7bcf858b6d..e47012006dcc 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -440,7 +440,7 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
 				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
 	}
 
-	if (prot & IOMMU_CACHE)
+	if (prot & IOMMU_CACHE && data->iop.fmt != ARM_MALI_LPAE)
 		pte |= ARM_LPAE_PTE_SH_IS;
 	else
 		pte |= ARM_LPAE_PTE_SH_OS;
@@ -1049,6 +1049,9 @@ arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
 	cfg->arm_mali_lpae_cfg.transtab = virt_to_phys(data->pgd) |
 					  ARM_MALI_LPAE_TTBR_READ_INNER |
 					  ARM_MALI_LPAE_TTBR_ADRMODE_TABLE;
+	if (cfg->coherent_walk)
+		cfg->arm_mali_lpae_cfg.transtab |= ARM_MALI_LPAE_TTBR_SHARE_OUTER;
+
 	return &data->iop;
 
 out_free_data:
-- 
2.28.0.dirty


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
