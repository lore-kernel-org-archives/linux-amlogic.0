Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA18DC04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:40:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ED6B216B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:40:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l5b1YX9H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bdsY8zm8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9ED6B216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pkQl1N8ILGdPq9KZyyTqj3QY4YhbUz2IAOMu5fRKZcQ=; b=l5b1YX9HNHBJKW
	9wEWx4pmU2affBzwjuFvQfsy80xtfFIv++rjDsQ9TA7g49Tjbh0EU1naNrNJnlbdQ8nQLLGnOb9B1
	AA5pJpnUFUyI7MjSp7Sp8Z7x1HlZFbuHmVd/v1DCE7Zt81SU2g39yovDqCO/MdEvL9UStzlpkf5Os
	pHWOI4hyatsxtMzWyxFfmId76HDMqlHb3Egig9a0y4C6Rghk2XjF4AjfnVg3m6mYhvS5KoQA6c+Fg
	dC8l0MDgWXNUGQQTd7I1q8yp8FuIFWvrYlJ0hu+44mKINq0VpcNbIMqjylXiApHDZSpXzcFtLvpGO
	2aV8VEPFRx2whAr6+ozg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSjSQ-0000T6-Ch; Mon, 20 May 2019 14:40:06 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSjQm-0006Wl-1r
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 14:38:38 +0000
Received: by mail-wr1-x443.google.com with SMTP id r7so14861111wrr.13
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 07:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dvB2+EbZJAEiPxI5LMXTznof0qGaQVfAy18zyWtxPt0=;
 b=bdsY8zm8d9QrdoAErzkY6w5y5GhDLd+0CM0NghfSuvmTM9QjpQxPbHHyfyvQ8nK0FL
 i/5jXsplJdCFJSss1I7KvNwT9hfFKGCILpDqGemMvH4xnUy1lZVvi8spd/dIAXGDU0iL
 9Hu5/S7UJd0Q1VsUkyXgP0uRWSqGXL6AzzPYlSL/1Xm5mkSfDflDAqhuLM7Kh026i7hz
 jAJ0Is5haokKQbWyOGtPLA1jb5O7fH++Tn2kffKk7iuYW6dGenvh5rhvfeeJR+5wU1fZ
 wEV5a+eMNVz6DkQkFaIn0r/bmANWHz6Y9Y1dv7pe/bQOnSdyom6qDqM+JaWTvu4i4BXV
 OVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dvB2+EbZJAEiPxI5LMXTznof0qGaQVfAy18zyWtxPt0=;
 b=SkONpTmBF9oR3zW/2wcg9eycm0n+UmTRwiYpa/LFLUBLq+knO6T6OP02nR+HeRjHpR
 tcKBB9ZnBNgjK86oY0tgKazEkkBACiWu0WQIXXAXpaZm4OHTLu/CFtWAjJLDUVumehu3
 3cbDMV5sfxrMVuMO7TER2xq7HSZ7gg4LEtxbrwT5T5j4MpZDi1vh3X6BOGJHTSPAWLsZ
 zVLI0TYlPjbXUfEy7zQBwaDV4++VlfjPAYJxOoBjvpIxmHGtHZLa/xRktqPjiM78eafd
 8juX1IgExZ8NwANfAC57r5A890nQxmLJNzXhbbkwOXcOW2b2381y/4wSmYDfYkFyHxSb
 zhjg==
X-Gm-Message-State: APjAAAVLiGrfYNYqwixjITctibS9okDklfTi7fKS+twhSOh5FVewtHB7
 bkmR3ISAo13HUQ6je0sP7LOW1Q==
X-Google-Smtp-Source: APXvYqx5B6BX/GzQuGkYQP0Ny5r5a+UZNfs1rZNVD0lELNHvTd7wSCDsCUOigyVIJta2FxsByvsvPQ==
X-Received: by 2002:adf:f643:: with SMTP id x3mr7807032wrp.320.1558363102613; 
 Mon, 20 May 2019 07:38:22 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y4sm12505976wmj.20.2019.05.20.07.38.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 07:38:21 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 10/10] ARM: mach-meson: update with SPDX Licence identifier
Date: Mon, 20 May 2019 16:38:12 +0200
Message-Id: <20190520143812.2801-11-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520143812.2801-1-narmstrong@baylibre.com>
References: <20190520143812.2801-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_073824_396864_F54EF70C 
X-CRM114-Status: GOOD (  11.97  )
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
 arch/arm/mach-meson/meson.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/arm/mach-meson/meson.c b/arch/arm/mach-meson/meson.c
index c8d99df32f9b..04ae414d88c9 100644
--- a/arch/arm/mach-meson/meson.c
+++ b/arch/arm/mach-meson/meson.c
@@ -1,16 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright (C) 2014 Carlo Caione <carlo@caione.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
  */
 
 #include <linux/of_platform.h>
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
