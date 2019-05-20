Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF55EC04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:35:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5FDC216FD
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:35:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ja5wXJ89";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WOQGo5E3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5FDC216FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fI2fmdYBUxpVIu/pGzgXCSun+LhhoHGpSlHHo4koklE=; b=ja5wXJ89M6u6OH
	AbfpOQkJL0Ty8ahDfGrfH3IThAjSOE7lBIVCohTajLbw7HAUAxalu2HA8n3r2/9DvcIAgg1RnnNk0
	ZkgFTCtNdK7enkAJ5iiwKRQ+7ANPNTZWecqkD1FuLHOnhybVqe2GCcEFD3KULRa6P8dAtVAHCNmil
	PvRRyhObLgN63utaRMVo7Svb8ZviZUjnbg+KsWPoh2RWnjPQLMRWu3qKiMPhxBDzgcAceHfj8CN0Z
	6zUaPqJFmsJRQWYPysHc/+5HsNnDat3hfkD8eANGPkIuYl2nQqqHE9rxYrJsMbdtKId4toX5zN830
	TedO2PQaev5YvKgB/A8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSjNZ-0001zU-Jq; Mon, 20 May 2019 14:35:05 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSjNT-0001ic-EL
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 14:35:01 +0000
Received: by mail-wm1-x341.google.com with SMTP id 15so9253711wmg.5
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 07:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jL8EOSTC/B97Q4hYmRDMBEhteRV4Llk3yLW6XJX3YpI=;
 b=WOQGo5E3cBke6q8UgR21NkLOtOUFmM9cJSAy8j0HGje6MfYqcjKkfQ6zQhG+HrG6yP
 tVTmu021qWNJ0EP6J/uvHe/UnTsSzLi58ScfYOr8hRnQr1aEligQKbtbWPPuK0zd66MP
 OgqWP2IGRpvc7D6/qBR6k95C6yNMuUtOYM9cBWSH6Lrj4MFrDPneMgbYJIvK6/rXx1S/
 ZB6nb4s0sRBxmATJZi2b+oG+T3TB9sJTG0jbi0xUo12BwK8Lz/Ze/0t4jJLf1yn5CICi
 ClQSm0KVnlq8x/QxBtZ6K4ZNrpSOiB7b3gvmL0sd4Xg7uOjpyms8cGcVg+5y/SmlEesx
 R40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jL8EOSTC/B97Q4hYmRDMBEhteRV4Llk3yLW6XJX3YpI=;
 b=hAvSi4OeJsD1JoaU4BoAHdc1ACVYH/OhY6jBocSX7UYCmHjslwPWSvqF1X+tLeNOZL
 2wB/t5fU/mMoHjY7+guvDqoTThHGNRT3w1LaeGnmoMywXIPi1MkoaCIaBZeUSgcoAKN4
 NZDYcaVci7utTEKH7qKnr45HSCcIq3ov1Aqwa1PaY4AiqHsiCS4SB/r4ioMp8aoXNOm5
 VzCX/6ciPL9aTafum2hQGTbkMQMzMfYcIKASOUY4Mgi4f0uOxpvZZPK5e+8OrkUqhhW4
 lAIeo0US+EL1AAW8Vs4Fg+ozbhE5qX78c7fRxfHWLUQCJY5grzcKStqrO7DCH6YUw4xd
 Ij/g==
X-Gm-Message-State: APjAAAUaW2R88PmpvEgjfiMoj31SSo/6VfU9KEvH3U71MBgKs9s3ka5s
 zRIxCgUEGLqf9WDPztYgblOT5A==
X-Google-Smtp-Source: APXvYqxZ3+v/oE9giWxGxEusI5X93pq9x7W3ufJ2uNkz5Lh5e9NxuHzhkG+fIq3auPMxo0dZb4l8gw==
X-Received: by 2002:a7b:cd0e:: with SMTP id f14mr28896695wmj.127.1558362897942; 
 Mon, 20 May 2019 07:34:57 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c2sm12756186wrr.13.2019.05.20.07.34.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 07:34:57 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: davem@davemloft.net
Subject: [PATCH net-next 2/2] net: stmmac: dwmac-meson8b: update with SPDX
 Licence identifier
Date: Mon, 20 May 2019 16:34:50 +0200
Message-Id: <20190520143450.2143-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520143450.2143-1-narmstrong@baylibre.com>
References: <20190520143450.2143-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_073459_477909_3FC0BB6B 
X-CRM114-Status: GOOD (  10.38  )
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
Cc: netdev@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index c5979569fd60..c06295ec1ef0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -1,14 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Amlogic Meson8b, Meson8m2 and GXBB DWMAC glue layer
  *
  * Copyright (C) 2016 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <linux/clk.h>
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
