Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C9EC04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:01:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7216E216B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:01:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WOQMhZGd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0WoDOm7e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7216E216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/I9HjjgVdIgQZKTuyFPthSORzGgb7xldsQSfIJpsGa4=; b=WOQMhZGdyodc8L
	YDDa7ca9zHp2Ej9kAm54ckG71rxWQi3d4DrrKYmWcnd8F7AtU46qXCNmkjv7zbXgHFBQhxfNvPEnI
	niAdPJoIIYQFzLLm+8QTQUlN4Nfkq95LR6ouu2V7Go9C/+dnCmm/S/8its2WEoGH9aQDHfTFg+A45
	3WD2rmd2CO7aoZFQZmxPbPJlIrSCiR3Y5FlIF54Ulo6CoBGxd1Y5Uk+zGsccpKN1NEDg70pov3ZIb
	f8jJmsHE8lx6p+/6uokFeJVe9nnZDy3biEIOur86IH2GOBijBooQBeVFbyZOwPGZ6Z3R13UkuxGge
	vLoRIsRaOT35ORv4ZuLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSirM-0001v2-Gy; Mon, 20 May 2019 14:01:48 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSirC-0001jS-Qv
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 14:01:41 +0000
Received: by mail-wr1-x441.google.com with SMTP id w8so14764530wrl.6
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 07:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z4tnU+N/DU1N5SPy41/fi/miGaLy6d3wjz6icgaZVuI=;
 b=0WoDOm7eSUPpLoIkMOSusIKkzLWDQndtkVtMrGv8KeIPGtwW9IqpBlwAf//CG+IO9b
 q7aVWcfLGjukA/a5dBEMZ0iwfWK22jsX7ha+nyfdiYkjP4D2eMGlGeoIGa3bQ84wsKS8
 TMAnpVntCcP2PVlcvED5ml1PjmoIkaRBsiXxHt05BNDwFma0SSCOafqRpg9eXjLBlEll
 N1J0oUsHG58CHkYHl922OZ9xuT6FSEyUr/2/6pa8v6s2R7m4xoijYYVdnJ50lx1Jetwo
 DRW724JkkmwuowaoF6lh8n70DvlR4bqUPhpAETLXkg6GfrTq9Gr7o61SKJT3nq1cM9iE
 RjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z4tnU+N/DU1N5SPy41/fi/miGaLy6d3wjz6icgaZVuI=;
 b=DQRSX+YNE9ktZH8FjnyOx2saVeK+23KjtjxKlqHYzQE+mzVZ28ybuDwvD8DcKyhM1c
 vWObX9MqQYjbNiysUGtaoodxfSxf0wPEcEhXP1qZbIEwXCctVMkHbNFdVX7P8DiTRJYi
 5DNRgY/DZdh1ON0HvY2dkaHnpXDmZ9aJu60y4lyeCwtw3oDZUERtx1XMrb89LuPhZBGq
 gsWMqJ7Hj66FOP5QoA10+azHcIJBxUz3/NxXmqvsLOlGMKjkDtuDCjUMfZAVvTUkKX3w
 H+97dsTtFPSq3M1Gl64maQpmmBHjAUYq8dOqgnR+NbFg1mAWL1nfAqv8erQ1Qs6erKbt
 //CA==
X-Gm-Message-State: APjAAAX33/FUkA7fucRLOW0/c5VuN9w7ChOzKrjoaYLDm/5TPgxpR+cv
 NW+PxKgs5d3GHuB65keApcsvmg==
X-Google-Smtp-Source: APXvYqwEEdJHWNWT9tmdPHAERp5H+E+95z5naZ9rAlFKjxLflOoHQqlwBCMhp9NAPjMi8a5idFRzog==
X-Received: by 2002:a5d:448e:: with SMTP id j14mr26575282wrq.158.1558360897097; 
 Mon, 20 May 2019 07:01:37 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f10sm24622307wrg.24.2019.05.20.07.01.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 07:01:36 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: i2c-meson: update with SPDX Licence identifier
Date: Mon, 20 May 2019 16:01:33 +0200
Message-Id: <20190520140133.29230-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_070138_896007_0F8068F8 
X-CRM114-Status: UNSURE (   9.59  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/i2c/busses/i2c-meson.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index 90f5d0407d73..f530d9a0450b 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * I2C bus driver for Amlogic Meson SoCs
  *
  * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #include <linux/clk.h>
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
