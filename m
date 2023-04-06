Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D757C76196
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Apr 2023 15:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GIGLry+hn8l4vgniZRpywo5vCRSdyj29DJ6H0w8gPRU=; b=v7IathynRqM8eo
	ozPeBgnNhi6m9iQ0WdgPnuWIanaZkvagEAO/mA5kq20JjtThnjfLBEAr7YzSl1NTuhn46YgpO+cMx
	DFlhGJFZ3Z2R8BPDlnFb5BcFvVdXvXsefzubWoajDBuEzUCqqdSBZ6QCyisYdBpR0nY6d7aDrjT45
	lLE7Vlc0Fs7g7SBpfQ4TlFx55pGek7qBJNexegj3thwHsWe/eApZs9VCmeE8bAdK/r3AR/oq06JNB
	7LADys7DdH/1B3mxhw1Fvcc9zsueWuoaL/5d8kAZqhsxyfgI/JpqAInQ5DixL1arB8XTXsu38iHEA
	YNy36kEUFjiEDUGLLQ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkRKD-007lzW-03;
	Thu, 06 Apr 2023 15:14:57 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkRKA-007lwv-0Y;
	Thu, 06 Apr 2023 15:14:55 +0000
Received: by mail-wm1-f42.google.com with SMTP id j18-20020a05600c1c1200b003ee5157346cso25722723wms.1;
        Thu, 06 Apr 2023 08:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680794086; x=1683386086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKATmeJF+Xd6RfEgdIKd/kdycc50pAq48rMDI6zu3z4=;
        b=49URMzK7zp9+rqDqOF2Aei/pUyMS5XfIdsbvq8/N8O2MzTlDjWhwHtx9H+XrVMVVvI
         rJLeBnZJ/P+M+IblisObl3mEF2QmNTqIDsYAaEeJlGR/H4V1WKcJpU49RgUU3curxuCN
         6wgnhYbfh8lqPDlpc4TP5d1jNVCdWy+i8T90Pvs/eytYso+3QQF9GXpnb69UMWSyZWaA
         zQvroVuyIS3a1X+zkq8WQCLzk/zvw5VYVA6H3FeADvQ4QhiBvvGzD4ZHpZIm4ti6+dT0
         i2XgX8tADBsiouu03TQkkBW6qKaepvL1ttmkgxitMNBqA78T+50YMCydr+pNs+mHMj+v
         9uNQ==
X-Gm-Message-State: AAQBX9fZYO6vn9WNNNqEqPnrYXifSXfEvr03qmTqJDk77bBxvApDQyLk
	04d0femVov8msC7WwlOW2Vo=
X-Google-Smtp-Source: AKy350YOU24o0+DjVUVccG/oqlcWRmAeru9w+HwMxOWGCplLCkcR3X6veQF5xP1/2B5vxx8vQzUciA==
X-Received: by 2002:a7b:c850:0:b0:3ef:6ea4:a675 with SMTP id c16-20020a7bc850000000b003ef6ea4a675mr7787556wml.36.1680794086552;
        Thu, 06 Apr 2023 08:14:46 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id fj12-20020a05600c0c8c00b003ef67848a21sm5560213wmb.13.2023.04.06.08.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 08:14:46 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	martin.blumenstingl@googlemail.com,
	narmstrong@baylibre.com,
	stefan@agner.ch,
	Lucas Tanure <tanure@linux.com>
Subject: [PATCH 2/2] of: fdt: Allow the kernel to mark nomap regions received from fdt
Date: Thu,  6 Apr 2023 16:14:29 +0100
Message-Id: <20230406151429.524591-3-tanure@linux.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406151429.524591-1-tanure@linux.com>
References: <20230406151429.524591-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_081454_209573_3B01D921 
X-CRM114-Status: GOOD (  16.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Reserved regions can be described in FDT and device trees, but FDT doesn't
provide the related flags, like nomap.
So allow the kernel to mark regions where the base and size received from
the device tree are the same as the base and region on FDT.
Here we trust that the device tree has a more updated description of the
region than the one received from FDT.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/of/fdt.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index d1a68b6d03b3..754a7ea4f45c 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -482,11 +482,13 @@ static int __init early_init_dt_reserve_memory(phys_addr_t base,
 	if (nomap) {
 		/*
 		 * If the memory is already reserved (by another region), we
-		 * should not allow it to be marked nomap, but don't worry
-		 * if the region isn't memory as it won't be mapped.
+		 * should not allow it to be marked nomap, unless is the exact same region
+		 * (same base and size), which the kernel knows better and should be allowed to mark
+		 *  it as nomap.
+		 * But don't worry if the region isn't memory as it won't be mapped.
 		 */
-		if (memblock_overlaps_region(&memblock.memory, base, size) &&
-		    memblock_is_region_reserved(base, size))
+		if (memblock_overlaps_region(&memblock.memory, base, size) == MEMBLOCK_OVERLAPS &&
+		    memblock_is_region_reserved(base, size) == MEMBLOCK_OVERLAPS)
 			return -EBUSY;
 
 		return memblock_mark_nomap(base, size);
-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
