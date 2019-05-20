Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF3BC04E87
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:36:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C1F0213F2
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:36:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PLLdplt7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GApKEWEd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C1F0213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08Y/INSY2miZ9r5f+RkTrYKo7uEADubJ8l6PUW984fA=; b=PLLdplt7zo8aJB
	Uj9tAMRML6FeOvLasIX5nRra7ivn9XdIu5JhTmajwB5ZNY98066YyRHAOEGXZwOrXseYgvjjtbkpf
	yujWphSQ8CtRqtR8hLXtEr/VQrb4HfayGki8RdQBbF+jqYyDYS816GnLReBzZovtOYST3/Dyz7IYv
	EXl33AExNs8wceX/CabkUbGLIL9SxDEZTl8CaJ7IBs4xon0s6UIMyQYFL3ZL/3Eq3Xdq2+S5bp211
	4bKyJlMpC8tSZkLvo5T05xi51uubcdtkG4kHsmCP6zjMVx/7qgFONfl0bzgsciZONjxBvMSWbQvAn
	NkBcGVB2Zs0Jt9fQwoDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSjOl-0004E8-Ng; Mon, 20 May 2019 14:36:19 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSjOQ-0003m0-Nx
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 14:36:03 +0000
Received: by mail-wm1-x341.google.com with SMTP id y3so13585191wmm.2
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 07:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c/IQIiBxQQceOQ1Fth2H/n6wt8SG358oGzAhtkipV64=;
 b=GApKEWEdPnbMaWzQa05Iq9QP1y91iTXaYPumr/5P89B1mfgAlLJ6NOI6iWJ0OIuhEM
 59M8j4XvcU5auApgPlcPlIrpAeUHzg4AzZQIFXBFOdRv1sShBhO2kDo+XyUKp2DWCb+i
 THsAfzL30A0LNUfSXUroeZS/KC5t99UMoCGNQHrFbg5IgGxUGe/bDXY6ORw/1EEBtujG
 zAlOnsdJnM0htJTkzGD+pDHrIwOEBmVsp4p18Bq7NMsDwnXUFMdJOFerr0feU0Wc6SYE
 6poc+5Vx7UyhZhqUWYxSga/buwo13xOpQpZqC8z1x1vInhq0awN4eyIMOYXdz2/Vklcm
 WG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c/IQIiBxQQceOQ1Fth2H/n6wt8SG358oGzAhtkipV64=;
 b=cwzPple+nJBBONae9BltN190G0/ATHxx4Khub4NaKYbM0jDzt8i17dA6KotBTn5c33
 7Y2aA/ABbINWEdOiQ6miEHgceyr6QLrfvUkgZF+ecAp5/uyu/PQP2AZ2OdNPuKU8X0g8
 Hmb2zowla5WUtGPgSsCX4NwBgisTExOfH5PMNpvhC6itvE7TWdMi5wDR904hLWcSdnH5
 Q2Z/bIf/T1mRIRheeM4Apyo5+xMYFbYJ9QZyx+ykeYTZUl+cCCqaooRA4WqqJrnchIFZ
 WolWagP4tfjoMfzBAbMkm8w2z7LcjMyrwT8LSVPsPBZ+X3ynsga5ynSDnoqP+Gsnouq4
 6URw==
X-Gm-Message-State: APjAAAUhZFZ1NAX7fRVf0HXv/DD1eJpsIBqyibucSotZK84sIlnHxiP2
 3KmyEYrrl/POid6zKlMlHIVD0gRb6nef8A==
X-Google-Smtp-Source: APXvYqwetj4Xy0Szkpqs0+6b88v6/86NBnhvTXRKC28fd1PYFkfi9fdcPWhg4U8BxtlCsQaiSSlFQQ==
X-Received: by 2002:a7b:ce84:: with SMTP id q4mr11888332wmj.41.1558362957248; 
 Mon, 20 May 2019 07:35:57 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j13sm14042591wru.78.2019.05.20.07.35.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 07:35:56 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com
Subject: [PATCH 2/2] phy: amlogic: phy-meson8b-usb2: update with SPDX Licence
 identifier
Date: Mon, 20 May 2019 16:35:51 +0200
Message-Id: <20190520143551.2330-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520143551.2330-1-narmstrong@baylibre.com>
References: <20190520143551.2330-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_073559_044035_5242C2B5 
X-CRM114-Status: GOOD (  10.76  )
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
 drivers/phy/amlogic/phy-meson8b-usb2.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index 9c01b7e19b06..5f17f10f4df9 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -1,14 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Meson8, Meson8b and GXBB USB2 PHY driver
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
