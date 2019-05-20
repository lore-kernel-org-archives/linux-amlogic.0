Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB27FC04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:37:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81919213F2
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:37:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jvqn+JSt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZRfoMlzM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81919213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=66Xm9rj7zOgUbB1Fk8/Zze1mJRmiIKSv58YIgCl7Ybo=; b=Jvqn+JStu3Wr/s
	6tObVswHX10kjEImwqB5jgnHJbk71hu/LG7GW9woZ30MI4XoZ8Oih59lFEKmPRkAsmrCjSQdt6lBD
	BbM+R/kVO8o5btfWrLnQ5qiFztdiHzbY2+ib5nnSMOGDPqcVvzyHp/3d7xTQkH2UvcR+Pe4eZEeKt
	d1e1q5qpnsEunc28vzlEtNPvcdu1I4Lauf3jDzLmPPpDakGwQEzJvbta9YWauMTus7ijReM34oXfn
	ragOHOwkPksKj8an4guVrcrZu28Qz0DlBLvB9HUqFhWG3wfNKPZifPnkFSakkUBVYDP1Ls9Dkukb5
	xqyem/NezcDY3sthEjmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSjPS-0004uG-6y; Mon, 20 May 2019 14:37:02 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSjPI-0004iA-RC
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 14:36:54 +0000
Received: by mail-wr1-x444.google.com with SMTP id r7so14855047wrr.13
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 07:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4npsL1gYy3DFnvEepqLNlJ3V1RQHIdG7lq5wqMtTwM0=;
 b=ZRfoMlzMEhDw3sGXZxEs18iVoc5lXxuYdnqjiUL552hHvl5ayEwePUV/ntxl3EHA9/
 igU8mLm9/JFKs3iOuTeOvOdVGXdVR+sZH5LFf25ifq1bE4IpB6E08k7345p8TLG1otDL
 Hk0nlU7QUlGpBc8Bt7k8Fm4lCphc1g1XsD3uscsRO/8++4gBqnF6bmlNA3BDz22w2aa2
 aHPTwt9YN8Rc/9Ujl7EJA4POTcaUq+APg9ap5q1rWqtUZDYlrrRxgjv9Lb+Jmu1SVfHL
 A7bDta7ZN1JG/bkFLy+xMUizuCEATNztLoihLU659lDE5kBr0fs5aWo1cRRknisoqnQj
 lGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4npsL1gYy3DFnvEepqLNlJ3V1RQHIdG7lq5wqMtTwM0=;
 b=kyg9xj96x2slJglv9odHUiaF3HTJXe68t0CzgW2C+t1kPIISD3CsVXg2tt3J/rOt0Z
 mZZsKORFCBAbHW5tiKxSg5O1CQRQERvBZ4PJlow3oSJLL0O7lX5B4qrI2R7Yg7cZ+siP
 TOSJF8ICLqcIqB0alMl9bH/sDqtgxxPFRuJlI068Sf4EJYQCHfiwaJ4Xt/Byg/3SF0CD
 vqwfECvF/KU29xBHzQrZlcf0vbO4CkKqmcw4TPNpQipU5c/3gNLAlGI7DlIWEalAojkb
 MQvWkv58xVP81GLoJYey4cPSeXf5TVqmCKJralYuQW8lWouS8XXRzjxAuXqYdcqDkoT9
 dsqg==
X-Gm-Message-State: APjAAAU4K6e6WVKkzRpojQwjcYjoFzx1ZZ1Ozd/AgOFDNoEkXLlOGIGC
 Ix/+4Wd/fZwGlcdnxkVljgGEpe0brxRUng==
X-Google-Smtp-Source: APXvYqxKsltkR7WZxpYrM3u00RJA0YEAGaWz0c/nIe/fO+ZdbSL3eXm1IP7pth6VLC2j2O/fPC247Q==
X-Received: by 2002:a05:6000:43:: with SMTP id
 k3mr45874502wrx.234.1558363011204; 
 Mon, 20 May 2019 07:36:51 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a10sm20518729wrm.94.2019.05.20.07.36.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 07:36:50 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: ulf.hansson@linaro.org
Subject: [PATCH 1/2] mmc: meson-gx-mmc: update with SPDX Licence identifier
Date: Mon, 20 May 2019 16:36:46 +0200
Message-Id: <20190520143647.2503-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520143647.2503-1-narmstrong@baylibre.com>
References: <20190520143647.2503-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_073652_880189_6270254A 
X-CRM114-Status: GOOD (  12.62  )
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
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index c5a8af4ca76b..e27e272b54d5 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -1,22 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Amlogic SD/eMMC driver for the GX/S905 family SoCs
  *
  * Copyright (c) 2016 BayLibre, SAS.
  * Author: Kevin Hilman <khilman@baylibre.com>
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
  */
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
