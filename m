Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A27C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:39:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D97BE216B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:39:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="em8obEJi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kVZUlP82"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D97BE216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6C0jRUqIxpbGN2va1aNKi2jmQl8n1PUUboZ+59o6bwI=; b=em8obEJixfsgn8
	0ky5m2F22I9TlTahxzMZW5F1xVrcMsLOLOOKDGo06gRad78h0uPv4rXfrNn+PXwpYuHyX8OJ3oVJy
	tX5iVp3/oTbPV2iJcMDRKdbHvDFenoKDYFJsTgr52LLAEz4195XF7UUaoNiWj9h5fDn1Z9SkgfDvC
	iZ1D/Tx4jzzyq8bw8LblWw572bDqlt6UdrlnH3FbDBhWqZm9px1aLXLZlUKEz7GKiX1g3h00xXljH
	O0M9b3CIwHQZ/ZDEI8LfVB9cN0RcxSyvVu329FJ5LSHnnr+4D4lAx6a7D0fRu0BhqPwdampDmQ0qt
	C9QCsa9WNfXs0uLP5cGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSjRy-0008Ba-1Y; Mon, 20 May 2019 14:39:38 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSjQi-0006PD-11
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 14:38:27 +0000
Received: by mail-wr1-x442.google.com with SMTP id w8so14917764wrl.6
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 07:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZjBhuWUBVlc7dSbIXQ9In2EP/rViqYs/vCz1OGKxCCo=;
 b=kVZUlP82EkRSrN6VcYSVwKkCxt7PQ+zs5bUwr53RfYDV8HJjP8vQeRIVC6cGuccADJ
 waEJK9ExJy1eXBNoALtXkEN7prV90JuQVLK5scVl3Q069iV720hh5xzXYvuFMkAoSisY
 dQzR/WvbC32ZkTFNbzgPGrpdw88bl5qHequC/Sa200KSqJZHjyGulR8gL+v4A2nb/aQR
 v7tS1uUrzJOF7f5TFRV0NnOGUwyAl0YW7zd6g0Mn/ub0kZtikmcyig7X4gHdehPpQ9Pi
 fRZ1ZX1GMHwWds7s2Zx7Dxq1lOAXVd4Ym+QY1HAJ8YrqMQMnnLoCpIGWD+breSORZlUz
 6Ikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZjBhuWUBVlc7dSbIXQ9In2EP/rViqYs/vCz1OGKxCCo=;
 b=BIGEUcYOBDdqThNcSK9bVDvlt8xDcRHIcUlgZy3c4HrtrcIunPlQoL1kWbxyxxhO5H
 KY87Kjh7qsXPCNF5EE8qKsbgpfDor91+aJaHyC7NkyI75M1zODwILyRAuGJvZU5t2WGp
 FVzf/2EaaJluYt2k5vkDNBxa6CCW0cGOCYNKOrXZ/Wcy59mu3CKc8pRDbbmCSozLna9i
 ykR+I6abWsCRL3ZhtOPYT8qr3BVzfOxAr9lCYT1sBsJNm0+lfYZesrNi7A0CMkCapeEf
 n5037aDsx/IHwhaBtAucIKWNpljbnXxX43c9Y+jELfFghAaT64v5iihYpUVQ04rXl8So
 UYWw==
X-Gm-Message-State: APjAAAVQpq0gN9saj9rXZJuWrCXfcUBgPi3Eu0NtVx5rFdG2LTM89fH3
 XfB3HKdVjI/AIK5LZXocFTL4yw==
X-Google-Smtp-Source: APXvYqwXaHdBxpngufWJn9Ad2Me+6dkJb3DeeqhmezZE29Zs8eIpl6gaJ/UafZXChQA7a+09VlyOHA==
X-Received: by 2002:adf:f3ca:: with SMTP id g10mr21281688wrp.249.1558363098166; 
 Mon, 20 May 2019 07:38:18 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y4sm12505976wmj.20.2019.05.20.07.38.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 07:38:17 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 04/10] ARM: dts: meson8-minix-neo-x8: update with SPDX Licence
 identifier
Date: Mon, 20 May 2019 16:38:06 +0200
Message-Id: <20190520143812.2801-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520143812.2801-1-narmstrong@baylibre.com>
References: <20190520143812.2801-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_073820_495729_AD10DA71 
X-CRM114-Status: GOOD (  16.26  )
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
 arch/arm/boot/dts/meson8-minix-neo-x8.dts | 39 +----------------------
 1 file changed, 1 insertion(+), 38 deletions(-)

diff --git a/arch/arm/boot/dts/meson8-minix-neo-x8.dts b/arch/arm/boot/dts/meson8-minix-neo-x8.dts
index 8686abd5de7f..2e669455a12d 100644
--- a/arch/arm/boot/dts/meson8-minix-neo-x8.dts
+++ b/arch/arm/boot/dts/meson8-minix-neo-x8.dts
@@ -1,43 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0 OR X11
 /*
  * Copyright 2014 Beniamino Galvani <b.galvani@gmail.com>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This library is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This library is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
  */
 
 /dts-v1/;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
