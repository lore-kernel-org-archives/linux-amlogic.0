Return-Path: <SRS0=NajJ=V5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0942CC19759
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 07:55:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB70A206A2
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 07:55:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qvmeTw3y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kk4EI62G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB70A206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PU0ekeic6qrjiz+uLmBrkm2fKeA2Bw1wndHpYar7qvo=; b=qvmeTw3yn72egy
	wdPvCuggdV0IhOUpmzRNSVoKjcMvxA75a7mUTyzrt+u/NaTH1nZ1h31SH81Zt/GaLChTtLfudy0bi
	4SRAg2xMDBJO0hjLKIiAO7CRgPID8DK5eEGUBXQEOBQ+PGk/i3P9/0gLVckZ+OomGodPYkdXpnvre
	WuKOyjMtxfvWLitlQd/1IXivoB/BL9G4xoGwZLpm3pSnnqfHQAuFQYa4QOINAgChPVi4lgpkxv0HY
	bXrz+E86RRWaTC0iLxVHTmjOxLREWNHV21QQ3IkVkPiNfYXg1CyJaE88WhOOtyIpvl1hNzPKk9uxi
	x+E/zLl3OfnknC1HieKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht5vm-0002cZ-NS; Thu, 01 Aug 2019 07:55:22 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht5vT-00010b-1G
 for linux-amlogic@lists.infradead.org; Thu, 01 Aug 2019 07:55:06 +0000
Received: by mail-wm1-x343.google.com with SMTP id x15so63566855wmj.3
 for <linux-amlogic@lists.infradead.org>; Thu, 01 Aug 2019 00:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e2WiU/DsLe1wMNodqzZLwpA1aNczN5SEyIJEg5xWVGI=;
 b=kk4EI62G9gnoZqd97Z0u+DSm5SF9LFtmVoaZYg15h2QPorIngSPSqD+Npc3qeC0Da1
 eGOmkbCRmOYxun5Mj9FlyliH0lzbmVCCGsIDdYSKYou3lebc/3Wlk2+N93/+3mR0ogRa
 iBwn/rcDy2MKfCbEVAJe7cwGPs587ieLtDMax2zYs+DatDFsbBhBqoGnnfPhmAwxHlzm
 5dpGUoGnX77XJcDZRZPblQaQ/1kqCf9281rApakQNjJlDwfNUmzkLrb2XZHonlbgbdp/
 NQpl0PAbjp0BqZfMq5lB/PHJH0xG3FpBP/K5jG1CeiEvHzZWtzY/1FzczcmbmekYKDUG
 cDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e2WiU/DsLe1wMNodqzZLwpA1aNczN5SEyIJEg5xWVGI=;
 b=VgrUXRvYTxSLqwdcg0I0ifgINjnMxN3cNqY+yZ0aTs1M92MQZmumxFeB56btA1+u4l
 bPd3bJMcKhN4ijbTRWc1KFTvw4J4d2r1Nh/vCCWD2WdF5Cua65viRhQNQTP5JzjI4yy3
 6qheHPhrG77owYbwwkkS3wkbEf3xZsK670QlMrtpqRv1NHycvVV/ANYoA27y0iYxtXdL
 1ZlqODoWbsALLoPBBRn7ULt1/YZoShh91sWwRTHIk7SH/dnMF3CpaAuoyb/0rmw+kq2i
 JZVlNRUn6Cbp0suY3TKIKL9x4zg2NmLCreHUElAgwBPwyoEBaslrXfr5oH2pwtasT45S
 7arg==
X-Gm-Message-State: APjAAAUdQyyVHx0dVTZ4K2WxKOyw8/wqfLC4SIVJFkWafFE8PZt/od7l
 C+0dKGmMPAeU+RaLVQEVvngKxg==
X-Google-Smtp-Source: APXvYqyIkpvceBqFHAuhL6SK/XlbkFXZgpPhOoIlOhD+7y54rr6VzOLrLtQGkX0yCQiCqFHg5dmNFg==
X-Received: by 2002:a1c:7a02:: with SMTP id v2mr114218798wmc.159.1564646101566; 
 Thu, 01 Aug 2019 00:55:01 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y12sm64199221wrm.79.2019.08.01.00.55.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 00:55:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: p.zabel@pengutronix.de
Subject: [PATCH 2/3] dt-bindings: reset: amlogic,
 meson-gxbb-reset: update with SPDX Licence identifier
Date: Thu,  1 Aug 2019 09:54:53 +0200
Message-Id: <20190801075454.23547-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190801075454.23547-1-narmstrong@baylibre.com>
References: <20190801075454.23547-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_005503_090671_3215AF68 
X-CRM114-Status: GOOD (  16.30  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../reset/amlogic,meson-gxbb-reset.h          | 51 +------------------
 1 file changed, 1 insertion(+), 50 deletions(-)

diff --git a/include/dt-bindings/reset/amlogic,meson-gxbb-reset.h b/include/dt-bindings/reset/amlogic,meson-gxbb-reset.h
index 524d6077ac1b..ea5058618863 100644
--- a/include/dt-bindings/reset/amlogic,meson-gxbb-reset.h
+++ b/include/dt-bindings/reset/amlogic,meson-gxbb-reset.h
@@ -1,56 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
 /*
- * This file is provided under a dual BSD/GPLv2 license.  When using or
- * redistributing this file, you may do so under either license.
- *
- * GPL LICENSE SUMMARY
- *
  * Copyright (c) 2016 BayLibre, SAS.
  * Author: Neil Armstrong <narmstrong@baylibre.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, see <http://www.gnu.org/licenses/>.
- * The full GNU General Public License is included in this distribution
- * in the file called COPYING.
- *
- * BSD LICENSE
- *
- * Copyright (c) 2016 BayLibre, SAS.
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- *
- *   * Redistributions of source code must retain the above copyright
- *     notice, this list of conditions and the following disclaimer.
- *   * Redistributions in binary form must reproduce the above copyright
- *     notice, this list of conditions and the following disclaimer in
- *     the documentation and/or other materials provided with the
- *     distribution.
- *   * Neither the name of Intel Corporation nor the names of its
- *     contributors may be used to endorse or promote products derived
- *     from this software without specific prior written permission.
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
- * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 #ifndef _DT_BINDINGS_AMLOGIC_MESON_GXBB_RESET_H
 #define _DT_BINDINGS_AMLOGIC_MESON_GXBB_RESET_H
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
