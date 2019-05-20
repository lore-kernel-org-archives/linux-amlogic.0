Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCA0C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:40:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44F7E216B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:40:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YT4nNhtV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tpfLSV4c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44F7E216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9SVwVSFeeJ4O6kNH5n2RAboavmI2i9TelQup5iXe88w=; b=YT4nNhtV/D68Ac
	SuWwq4Rhm5B/WXLPvIr6kfIuQTa5hbWmxIIWz5M9/oc1WILmZMlCccTbTaZ+1pFACVQ0c9gxEBb4N
	N8gEyNLXgfU/5I+CNeu4VIrQeXaxC7fIr1DRsmHlMEZrlghKUZW07kL6wWifZuVid+jdMozP9Td9+
	aoISoIjho6qLau5MNh8QIwXUv1yKXiEwb/bRd1qbYGyKjFESMRLIJWfB0cJcoV7gwxJfZYRNYQjDI
	it2qKMywJB7P/GqSm4FVnCep1PKFCGLIxOiP9TE/VNBZfITJ23G0NHOL+BglbapS+GMcia8PsbQnr
	g4m5M4MukAN/k1estoLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSjSL-0000EQ-S0; Mon, 20 May 2019 14:40:01 +0000
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSjQl-0006Vd-Qt
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 14:38:37 +0000
Received: by mail-wr1-f68.google.com with SMTP id d9so1948382wrx.0
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 07:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6ultmkYjgWhJ/xZHGxkX6N7CA7j/pBGMWJYUycDlyOs=;
 b=tpfLSV4cgjiX4q7HAr6FjjL+4hAE1a2rIdc3QDNDMtisfhHt2noyz4xFmhQW9wMIcT
 l50KHhcRb71FeUBVlXyVxQCYFdvkDPl/kfkuYrA5b0+vUmIK/O68PldpZ8qWqoW+X4UQ
 SdZ2M0ZHnUFpzfRNvbA8r+zDRhj12eEucC+T1lJBnNBt0iava/+NyjaXOUYYHxvF4Ftk
 XDxTzXNGW3SIWGIbST69maQJDj8SAXLLlxZH1BMgizsyEJmFIKZ21i4Icxms+dy9GkWd
 M9d/JAfVc181/AzipqUiOqoI4qD8RlHPIRMhzAWtpg29FDAHRr3wkk93Px41z/CPXAoV
 L68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ultmkYjgWhJ/xZHGxkX6N7CA7j/pBGMWJYUycDlyOs=;
 b=sMis1RJXYs0hb9uVI1TPdllkJMl2uir8NGxpM0lKUAP7aQaWM7pqLBlXwy87hEBM7n
 46va9pxiFQeo6wZGXYz0QywMHUB6jLZ86S48Pa1VULmr8/AqXh+FAUed1bfTqEyR8z+q
 4Q/XH+Max2+6j2iuilOSJeVLGP+0NEFYIUIv0s/XNcaw1RgFxSb6YocxlJG4HveSeyuB
 2fsdBGsh+gUi0LUQGsA/f3fw+Wc3pp0/bL1A4FMoZCvp9V1CITb4eVBRNE8x0/REFSgl
 csWwums96V4b1PCE3YaEOR9CEw+Di7Bgh6bMrRcCW5CtlToMAENT9TOyuQUO1FYETttk
 sN8A==
X-Gm-Message-State: APjAAAXvntzoG30AgMPrYcKQVjcmpwjs77w1+gXR7sxLAHiuSQZUnFyu
 rhCZ7tRPiG/HatluB3Pkr482Og==
X-Google-Smtp-Source: APXvYqzWgIrW0/dCRvdB6eUhF/nw2Ad+krPVAseHdSHHJyhHJ7FSI12d8sKvnebQHv1xTL/p6YvoeQ==
X-Received: by 2002:adf:8b83:: with SMTP id o3mr38659791wra.278.1558363101749; 
 Mon, 20 May 2019 07:38:21 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y4sm12505976wmj.20.2019.05.20.07.38.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 07:38:21 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 09/10] ARM: debug: meson.S: update with SPDX Licence identifier
Date: Mon, 20 May 2019 16:38:11 +0200
Message-Id: <20190520143812.2801-10-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520143812.2801-1-narmstrong@baylibre.com>
References: <20190520143812.2801-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_073824_276071_A5A29864 
X-CRM114-Status: GOOD (  10.26  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/include/debug/meson.S | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/include/debug/meson.S b/arch/arm/include/debug/meson.S
index 1bae99bf6f11..df158693a327 100644
--- a/arch/arm/include/debug/meson.S
+++ b/arch/arm/include/debug/meson.S
@@ -1,10 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2014 Carlo Caione
  * Carlo Caione <carlo@caione.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #define MESON_AO_UART_WFIFO		0x0
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
