Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD786C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:05:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2AFD216B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:05:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iEqjvLY2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="t73dgU0G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2AFD216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=izsJBg1hfsd6Krf3hF74mwkjHNkiiwFSeClCKUdc/zI=; b=iEqjvLY2UDcFEG
	Ops6qsTb2CA8oeM13VW5WGMmdLO3qmZpa6IyUHgCacMI302N/WGuVRe4OoUT6fWnRfnfv+TVOKiDm
	1X5ZgwvECyUf/E6kV/kVgmuRCetKEQDt2sMYfep0ph9TEkl63Njs+Ai7EFJevGfpFxQ30eOfVq89r
	me5qxm2+xF6jP/1Cg44MvdOPQDLV5gCMJTXbTNH1RIbnAIKQRounZ89AtBUB6X2m4pLWNMQ5Al2SE
	qqk+q7X/HUSYw/UwmnoY4k29BDzyhSBAkWZhyK5DHlVU6IhIlQcE8ZcdzGQHxegjUq/w/19ty0IFE
	pLbPUS1xElgCDS31qOQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSiuc-00044j-G0; Mon, 20 May 2019 14:05:10 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSiuO-0003LR-P1
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 14:04:59 +0000
Received: by mail-wm1-x343.google.com with SMTP id x64so13431713wmb.5
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 07:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=txk5DrZL33dHOyu6S/hwbHrXibD4nPtpq1m/2A+Wxoo=;
 b=t73dgU0Gc247WTF7B1Vk9vORzWG22PieCyt/1IhbX0ojd/0VrZw4VEQEr7Rfcjh6/l
 ZD0G2DsREEckY4mBG0ythw/g61R1AK4iLUKci+a0R2JU8eaaEf4bGNyDtqYbtfmrRnop
 pBbxVtrzMZeoIHuBPDOqAu4qp0dBncZztbNkwLQnxhu3S59r4/V7nehwMmMJJ/JNgd1K
 8UfjICYJRWEr+I0zKj2VuNujr9ioMZSMSqudF5Of41Wp/Cd42cdFDib4qAoCc2xZbbSy
 6psPlnUKIMz0Pimomwu/DK/tMqUHFvQUKy8xKGwl3sEaSl/bKoldGbQPJ4xAwM0RCW9j
 KSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=txk5DrZL33dHOyu6S/hwbHrXibD4nPtpq1m/2A+Wxoo=;
 b=L3AAoXEiSIOXVhoMK60ppkRl57LwLqWHI8U8t9YNOjCzh551Mv03/FgGapBW6BE/EB
 eWmAj9im3pZmNbV/gPZJLGCDvWEuFiyAZscao1fInyxfm8AK8wG8dvHEHoUmnWrQjlvc
 b3zOqWagbSZJ7cVuTW44j0kDjkMaeg24Vb4knU4mNymPsYgYmy/lcqcZ5tYB9UBV/80e
 bQDHP7O2nWKG4u8tFFkE1VY0jUd7rvuoT8WAGZIRgsbDqmyiqwiSVxPCYZWnI633Mco9
 5LT3opgOkQAKB2KZCQ+ZAN95Wj5vD/YWR3rLlRkziwUAElRCf6XLsB4MK6s4qtOxg4UW
 Gsnw==
X-Gm-Message-State: APjAAAVfCehKmsk+qhoLwRCSy7XQ4vxFoVndgPaKl26Ej+nt98l2Ntmz
 G9RnPPlQoul2vpY6tctODPU90g==
X-Google-Smtp-Source: APXvYqwT6uVZjGxR/n5pqIYoJJgpdt5n9FK1oWxNGhWKEAx/4tWR4B+kGZw3mByDDBsWKa9cNp/B1g==
X-Received: by 2002:a7b:c844:: with SMTP id c4mr12089515wml.108.1558361095088; 
 Mon, 20 May 2019 07:04:55 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id w18sm13731201wru.15.2019.05.20.07.04.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 07:04:54 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: broonie@kernel.org
Subject: [PATCH] spi: spi-meson-spifc: update with SPDX Licence identifier
Date: Mon, 20 May 2019 16:04:52 +0200
Message-Id: <20190520140452.30167-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_070456_823025_0DF267DC 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/spi/spi-meson-spifc.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/spi/spi-meson-spifc.c b/drivers/spi/spi-meson-spifc.c
index 616566e793c6..20413def4cfb 100644
--- a/drivers/spi/spi-meson-spifc.c
+++ b/drivers/spi/spi-meson-spifc.c
@@ -1,14 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * Driver for Amlogic Meson SPI flash controller (SPIFC)
  *
  * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
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
