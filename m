Return-Path: <SRS0=WuYP=CR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEF1C43461
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 15:19:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9C6020738
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 15:19:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AL5RNpyI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wDOiidQ2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9C6020738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=19YGkhovvHk7MaCHcn8U7uMnGQ4xM+I/eAjoiFai7BQ=; b=AL5RNpyIWgjDX75PVrYCWWxdv
	yZZlH+UKsrHIMp+aJFN3+z4yH7Wvbv+z5QiHN1+XiDUpCjK1X4kIST5UaMivjLQkJYcsC+p4iRfpq
	/GUARRA+GH9k5Z/FPs0FqLzac/xVK78SwC++/RUT0WmAlEr9Egd2365AW2G19zD+zyWS/Hxksslt6
	O9WADj9PN/yYf5v+JP2lh7dUxiPG14JCFiwxjsnNO1yo3CJklWvoiRQQXGChfe7PuLDF0LDnIHCk3
	4qfvn8vsKXTCjcik0xoe3dHldbWEq7UwuLnRolMt39PlzwilmaEhA+z5h4Y+zdnds1ibpZ1UL3Xk0
	CWA5flsWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFfP5-0001cE-Fs; Tue, 08 Sep 2020 15:19:27 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFfOe-0001PO-I0
 for linux-amlogic@lists.infradead.org; Tue, 08 Sep 2020 15:19:01 +0000
Received: by mail-wr1-x441.google.com with SMTP id a17so19519430wrn.6
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Sep 2020 08:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3z8ewx/ZRDSN9alYRV1GNbpM8nlpU8ozO9MS5G5Yh6E=;
 b=wDOiidQ2OMXWHXErJkSC//k9rNMkPjKCsh0kCoDcDQ7I4wBdVBmw/53WjBfmc0S/zF
 z4+bOBwfdB8CG/d120sIqdXklHCLwSYlSIsddndpa6bQPyUsudOnAWIy7HJ3r5dQJqUr
 sfCrz+fpUMMCk6ymbFmsi65sR17m7gOVYc6J7EIfwrROdKShHKqA7kPwc6qfFCoIKQcm
 zbhPZJjteaQq6e7RKBO1qIBR4l/Ff78YdM9SDoXiRPNCsBwiPgv+2i/YhAq2NBbSoTzy
 b8v3s9TzVTGmhE6Tp1CEtFAu4+Znw3cdD45XPKL/uP80PpXi+CI7AJIL1C4MNSs9Crik
 p2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3z8ewx/ZRDSN9alYRV1GNbpM8nlpU8ozO9MS5G5Yh6E=;
 b=Y4RC1o7n68XvjEkgO0N4NRMntaoXdIEph49Y0qpndik7+Nlz8T0hCGIeaKDwRHBSEF
 O0fk/wzEqqu01VQrEx57bFu/MeKRZNNHWuuYccdXO/Oc7aree8sKxym2TgbaS3DFlygX
 7Fu6WLgpdw/eJtzLWC7Fi24XQ+SqqSBC85Z0fSW5NGa91vxuSakZn5xhGWlVbOqG35mU
 rJVBypyIa1wnxi2innZuInIftxxLE9pxPXMDzShmpCJY0cxizTlaWfkZcdffNvGMEsia
 T3820h4Y1VH33QeUyk9572fZzOs4tM2bzDVYbD9F9WOKfiQTb6W284y3+1hiUn27IDlC
 WkWQ==
X-Gm-Message-State: AOAM530jOUHx+Ozt/dI8oyVHDOG5/mF9CYN5i5w9ZSM+mpQGDVTfZ7fI
 HXeaaHSC9WX+WUCUQPlW67n73A==
X-Google-Smtp-Source: ABdhPJw9PhMfql/HCXy219kI4xjVlQ2JDvbSsD9uFg37fWGjczy3ofVC8EMawYpaXn0CvZsQro+EIQ==
X-Received: by 2002:adf:ec0a:: with SMTP id x10mr128489wrn.47.1599578339377;
 Tue, 08 Sep 2020 08:18:59 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id d25sm10004886wra.25.2020.09.08.08.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 08:18:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com
Subject: [PATCH 1/5] iommu/io-pgtable-arm: Add BROKEN_NS quirk to disable
 shareability on ARM LPAE
Date: Tue,  8 Sep 2020 17:18:49 +0200
Message-Id: <20200908151853.4837-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200908151853.4837-1-narmstrong@baylibre.com>
References: <20200908151853.4837-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_111900_644437_B688492A 
X-CRM114-Status: GOOD (  15.90  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The coherency integration of the IOMMU in the Mali-G52 found in the Amlogic G12B SoCs
is broken and leads to constant and random faults from the IOMMU.

Disabling shareability completely fixes the issue.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/iommu/io-pgtable-arm.c | 7 ++++---
 include/linux/io-pgtable.h     | 4 ++++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index dc7bcf858b6d..d2d48dc86556 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -440,7 +440,9 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
 				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
 	}
 
-	if (prot & IOMMU_CACHE)
+	if (data->iop.cfg.quirks & IO_PGTABLE_QUIRK_ARM_BROKEN_SH)
+		pte |= ARM_LPAE_PTE_SH_NS;
+	else if (prot & IOMMU_CACHE)
 		pte |= ARM_LPAE_PTE_SH_IS;
 	else
 		pte |= ARM_LPAE_PTE_SH_OS;
@@ -1005,8 +1007,7 @@ arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
 {
 	struct arm_lpae_io_pgtable *data;
 
-	/* No quirks for Mali (hopefully) */
-	if (cfg->quirks)
+	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_BROKEN_SH))
 		return NULL;
 
 	if (cfg->ias > 48 || cfg->oas > 40)
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 23285ba645db..efb9c8f20909 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -86,6 +86,9 @@ struct io_pgtable_cfg {
 	 *
 	 * IO_PGTABLE_QUIRK_ARM_TTBR1: (ARM LPAE format) Configure the table
 	 *	for use in the upper half of a split address space.
+	 *
+	 * IO_PGTABLE_QUIRK_ARM_BROKEN_SH: (ARM LPAE format) Disables shareability
+	 *	when coherency integration is broken.
 	 */
 	#define IO_PGTABLE_QUIRK_ARM_NS		BIT(0)
 	#define IO_PGTABLE_QUIRK_NO_PERMS	BIT(1)
@@ -93,6 +96,7 @@ struct io_pgtable_cfg {
 	#define IO_PGTABLE_QUIRK_ARM_MTK_EXT	BIT(3)
 	#define IO_PGTABLE_QUIRK_NON_STRICT	BIT(4)
 	#define IO_PGTABLE_QUIRK_ARM_TTBR1	BIT(5)
+	#define IO_PGTABLE_QUIRK_ARM_BROKEN_SH	BIT(6)
 	unsigned long			quirks;
 	unsigned long			pgsize_bitmap;
 	unsigned int			ias;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
