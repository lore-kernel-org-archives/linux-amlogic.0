Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D69C7618D
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Apr 2023 15:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lQcCidl6xv+YoefpGQiIJ7dufvw+0eex7J9pthaQMd0=; b=GSiiqcSmQtgUdC
	GaQ+BKdEZ/wXgj/GqJwYvxHcqZQdZNXffmQ82ltRJJnsVXU26cbDK/YY4ti8rM+9oCTG4v3hvcIWb
	UcQ156UbS57xf3Au1LKOT46UeX+JKIUYjWm0B/4G/0Ww595pMkRwQutMgbJly63fXTTxV/3XRCJx0
	rCa53d6GQ6TZwdRvTovx89B7MzulZ/7YJzXlMRvlS0jqMaBrvVZgzBkpE+EQewuI/rFZAETlU+XsI
	edIlbqbMM7aE2LElXB5jPLPaWG5HYaWdOIZMUWxBe9IwdnLWAoW0V3H62xEQ2mxkUTu3UzQFlxe8t
	NfYJSV4pYKQSWOpbXOKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkRKE-007m0V-2Z;
	Thu, 06 Apr 2023 15:14:58 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkRKA-007lwr-0u;
	Thu, 06 Apr 2023 15:14:56 +0000
Received: by mail-wm1-f44.google.com with SMTP id n10-20020a05600c4f8a00b003ee93d2c914so25390590wmq.2;
        Thu, 06 Apr 2023 08:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680794086; x=1683386086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTGfYrqfzS07zpfH0JC+lthwHQN3E94OuA9UZu3JUac=;
        b=NwKQEeohXLc1GP7ovyTzEjPtnnps2+dhM9TjeZxDWI8Rv4Vdd24/jFuo5t72kogXOI
         +yZCP73fSswO8RqqAXhLjAYVMJ7O1vCnSDGrf9bO0CZyiPdqRxF5t1xdhuxP9EitNkYM
         Q8cO9yMpLK2Evux3lWcWQZJzNn+qdAcuV0hmvJUXsLoA7+EWGsW5bZ9jKeyr5MGnEXyF
         VhNkC8j4GbTVFLI+1nwqkiaUv2IRGymuIJKX1yZq1ss9XppGmsGw58CcLIZiM2WsOugM
         sm3s2kUkMc4lmJOLdXD7u0a+4hqKocjq4vFXDawXWH2j3DvagEO1SNzTZNfd2sjx2aiX
         UH9g==
X-Gm-Message-State: AAQBX9fxfifl3N//oxGpkQnPeZsSel4kB/vFu8hMd0b77tCS4NwlMTdg
	Dy9ph0rjrFilf3ECxUbgXxM=
X-Google-Smtp-Source: AKy350bioooJgfp2IytRIDWd0TtyTY5KBmKx4pJ+VtEwGO+IsLJWXioFGYateblkCLF62e/3sqxzDw==
X-Received: by 2002:a7b:c38a:0:b0:3ed:e715:1784 with SMTP id s10-20020a7bc38a000000b003ede7151784mr8689914wmj.15.1680794085640;
        Thu, 06 Apr 2023 08:14:45 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id fj12-20020a05600c0c8c00b003ef67848a21sm5560213wmb.13.2023.04.06.08.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 08:14:45 -0700 (PDT)
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
Subject: [PATCH 1/2] memblock: Differentiate regions overlap from both regions being the same
Date: Thu,  6 Apr 2023 16:14:28 +0100
Message-Id: <20230406151429.524591-2-tanure@linux.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406151429.524591-1-tanure@linux.com>
References: <20230406151429.524591-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_081454_319802_EEBB34AF 
X-CRM114-Status: GOOD (  17.45  )
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

Add support for memblock_addrs_overlap to return a different value when
both regions are exactly the same region, where base and size are equal
between the regions.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 include/linux/memblock.h | 18 +++++++++++++++---
 mm/memblock.c            | 37 ++++++++++++++++++++++++-------------
 2 files changed, 39 insertions(+), 16 deletions(-)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 50ad19662a32..c7ba8b01a637 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -49,6 +49,18 @@ enum memblock_flags {
 	MEMBLOCK_DRIVER_MANAGED = 0x8,	/* always detected via a driver */
 };
 
+/**
+ * enum memblock_overlap_type - result of comparison between two memory regions
+ * @MEMBLOCK_NO_OVERLAPS: there is no overlap between the two regions
+ * @MEMBLOCK_OVERLAPS: the two regions overlap each other, but are not the same
+ * @MEMBLOCK_EQUAL: both bases and sizes are equal, so the two regions are exactly the same
+ */
+enum memblock_overlap_type {
+	MEMBLOCK_NO_OVERLAPS,
+	MEMBLOCK_OVERLAPS,
+	MEMBLOCK_EQUAL,
+};
+
 /**
  * struct memblock_region - represents a memory region
  * @base: base address of the region
@@ -118,8 +130,8 @@ int memblock_reserve(phys_addr_t base, phys_addr_t size);
 int memblock_physmem_add(phys_addr_t base, phys_addr_t size);
 #endif
 void memblock_trim_memory(phys_addr_t align);
-bool memblock_overlaps_region(struct memblock_type *type,
-			      phys_addr_t base, phys_addr_t size);
+unsigned int memblock_overlaps_region(struct memblock_type *type,
+				      phys_addr_t base, phys_addr_t size);
 int memblock_mark_hotplug(phys_addr_t base, phys_addr_t size);
 int memblock_clear_hotplug(phys_addr_t base, phys_addr_t size);
 int memblock_mark_mirror(phys_addr_t base, phys_addr_t size);
@@ -486,7 +498,7 @@ bool memblock_is_memory(phys_addr_t addr);
 bool memblock_is_map_memory(phys_addr_t addr);
 bool memblock_is_region_memory(phys_addr_t base, phys_addr_t size);
 bool memblock_is_reserved(phys_addr_t addr);
-bool memblock_is_region_reserved(phys_addr_t base, phys_addr_t size);
+unsigned int memblock_is_region_reserved(phys_addr_t base, phys_addr_t size);
 
 void memblock_dump_all(void);
 
diff --git a/mm/memblock.c b/mm/memblock.c
index 25fd0626a9e7..948cc1bc3edf 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -175,24 +175,33 @@ static inline phys_addr_t memblock_cap_size(phys_addr_t base, phys_addr_t *size)
 /*
  * Address comparison utilities
  */
-static unsigned long __init_memblock memblock_addrs_overlap(phys_addr_t base1, phys_addr_t size1,
-				       phys_addr_t base2, phys_addr_t size2)
+static unsigned int __init_memblock memblock_addrs_overlap(phys_addr_t base1, phys_addr_t size1,
+							   phys_addr_t base2, phys_addr_t size2)
 {
-	return ((base1 < (base2 + size2)) && (base2 < (base1 + size1)));
+	if (base1 == base2 && size1 == size2)
+		return MEMBLOCK_EQUAL;
+
+	if ((base1 < (base2 + size2)) && (base2 < (base1 + size1)))
+		return MEMBLOCK_OVERLAPS;
+
+	return MEMBLOCK_NO_OVERLAPS;
 }
 
-bool __init_memblock memblock_overlaps_region(struct memblock_type *type,
-					phys_addr_t base, phys_addr_t size)
+unsigned int __init_memblock memblock_overlaps_region(struct memblock_type *type,
+						      phys_addr_t base, phys_addr_t size)
 {
-	unsigned long i;
+	unsigned long i, ret;
 
 	memblock_cap_size(base, &size);
 
-	for (i = 0; i < type->cnt; i++)
-		if (memblock_addrs_overlap(base, size, type->regions[i].base,
-					   type->regions[i].size))
-			break;
-	return i < type->cnt;
+	for (i = 0; i < type->cnt; i++) {
+		ret = memblock_addrs_overlap(base, size, type->regions[i].base,
+					     type->regions[i].size);
+		if (ret)
+			return ret;
+	}
+
+	return MEMBLOCK_NO_OVERLAPS;
 }
 
 /**
@@ -1857,9 +1866,11 @@ bool __init_memblock memblock_is_region_memory(phys_addr_t base, phys_addr_t siz
  * memory block.
  *
  * Return:
- * True if they intersect, false if not.
+ * MEMBLOCK_NO_OVERLAPS if there is no intersection,
+ * MEMBLOCK_OVERLAPS if they only intersect,
+ * MEMBLOCK_EQUAL if the region matches base and size to an reserved memory.
  */
-bool __init_memblock memblock_is_region_reserved(phys_addr_t base, phys_addr_t size)
+unsigned int __init_memblock memblock_is_region_reserved(phys_addr_t base, phys_addr_t size)
 {
 	return memblock_overlaps_region(&memblock.reserved, base, size);
 }
-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
