Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4488DC04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:04:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D7EA216B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:04:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fo/I+mKI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ze4d8D2u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D7EA216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UNm1/v1jPHCS/z6uVB662VnFeo2ua3FYVRKQGESdA4E=; b=Fo/I+mKIagqSvS
	lB7aQSRS1fhF0NHgOMV6vu9C1fAx5MeaVS10aCbYLF3Rwj7i6pOdv1KduI0fGFoydyibrpOp1REQL
	Zlp9tXSQ8u1bvoDfjNkicOGBbJrMfQQLOqVFP4r+0bdXRAaXTNif7I/QUiuQQ7adlK7tj/MyCbqnT
	XMo6OV50C4OSpProO9Fe+UNjSgJBJRKVSqC/NYQHBgw5K4B2GEMlMsLjsJ462qv75gy6RgWMJ5kDh
	aa7tSgZBn1uq1B66j42g2F8k+TRoHbkO9CWIJz1a3sJCtKjMUwAUtgDWt0qrpWf0ZtgH4TKObso5L
	5UYjizSZq7/4Az/bXd4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSitP-0002sV-Ed; Mon, 20 May 2019 14:03:55 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSitH-0002lX-Gv
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 14:03:48 +0000
Received: by mail-wr1-x443.google.com with SMTP id h4so14766701wre.7
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 07:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cF0K4L8IFyt0+npCv+nWw+tKu23CAdmttAOFwktWaxI=;
 b=ze4d8D2uXvGMxOxR01bwm1YogLCVWYOJq0Jf2Vip/qog0Nbrf/1dqaj8YjuJWp9olk
 4nwg+kLlBqesT9srjiDvGEh7Z2ibNod1qCM0EmMxCRdZFYKpg0YsD65d4cRdl3FeUume
 fX8sGCdRwlatBale2V+RaHJJKQTqN+m9osMvO9dkZStg5cJD29VswcNZwRpMFziFPRBY
 /nkYJcl6n6mAgvfEiGeGdNDZxbdCzMRd43F6DleTA6+sLDAGXTeiYZW0HsGcfZGzXPfN
 JMvGlgf1JzulyCF5TAr40vsV9w3sZZLsEVfJJvgiPeX3NoyFQ3bzFvd6j0nkxJJJ0C//
 x/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cF0K4L8IFyt0+npCv+nWw+tKu23CAdmttAOFwktWaxI=;
 b=NYaVyBwdKFjLe9FYlDS19yyfX6vLZFMHan4IZs4Mh0SrfZFp2X07WgoLvdOFu/1ATO
 lQPRbAvPsr+p8LAxg+1rOy7cps5ZpQevqckH7naWkHxHR9pOaK7/UvhWTUp8K5qVi4uW
 y6zoNdNoFwOlxBUl84iCxnTRC2HYzCbFXYj1B6B6MiLC4i8gCduEVvJwoIQJtLgozwnc
 t5OAjj0dbEcqKK02c6ClYpQH3sdosfaBxWvTp4y7QdIxqGGmcKWMdjTJVYBY9anzI1b4
 z5O3hR+3a8btBMqisUueIJX1aT/SHB757bdwi2O48CZcUpEPaiLTE+mRZ8xBIDzWZi1x
 ATRw==
X-Gm-Message-State: APjAAAVI61re5dpiSFU7pJ2PzimrajNaxtosWpoQaM/R2PP5sx4JQCfK
 vj+kE4+9yOuaNt64Lf5fEyo42A==
X-Google-Smtp-Source: APXvYqyLfHunGtz7iQDXkgCWa8G285wjhmipCjPg2pvdogZ/30BdgiGfT3HEUmBIyRB1mcfglKOuXQ==
X-Received: by 2002:adf:dcc4:: with SMTP id x4mr20656573wrm.107.1558361026012; 
 Mon, 20 May 2019 07:03:46 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c131sm18134032wma.31.2019.05.20.07.03.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 07:03:45 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: mchehab@kernel.org
Subject: [PATCH] media: rc: meson-ir: update with SPDX Licence identifier
Date: Mon, 20 May 2019 16:03:43 +0200
Message-Id: <20190520140343.29971-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_070347_561431_8F670279 
X-CRM114-Status: UNSURE (   9.76  )
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
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/media/rc/meson-ir.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 9914c83fecb9..02914da8cce5 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -1,14 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Driver for Amlogic Meson IR remote receiver
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
 
 #include <linux/device.h>
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
