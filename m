Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3049BC04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:38:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0512216B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:38:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qomIHi9P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="n4ucZluq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0512216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9hNi/a0CoaCdK8oBd1a5jlLgFjeDYAHxq4BoNyRl5A=; b=qomIHi9P0fqQfs
	Eo9mYaMmpKlJTFi0MGbF1c7iGyNj7CDjBCcz0JMwazC6e6yd5O4QJ1OlpqXsgeNJTRccYwfY4RHC5
	/Ilm3qaKwIldCD8AV3qlZ/euNDsD+CHXUuOPBwsh9rgAB6MFCLzvdY3EhjDjBg/M6vswi0ztXFN8+
	JUf0UgsaJsjc+jRDLCv56KcELyyLmVGvHdM1f0iaS5XDu6NRq+76e2E5xqsS3Yy9bdf4d6R5xGT9T
	Vc8SmOxeB3+H3AApUS7pt7L1HelnhyxEoRY7q5xrBEXETO1IS0PSibXVK6JjOiQSVjEZRtlmuBxU9
	FVxGFIXqsn/pSccRfCSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSjQO-00063c-KJ; Mon, 20 May 2019 14:38:00 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSjQ0-0005cv-Sj
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 14:37:44 +0000
Received: by mail-wr1-x441.google.com with SMTP id e15so14911496wrs.4
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 07:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3QDibyFNEaQBAlcOcZglPf5uEDCypT1ErrGWYL3AuN8=;
 b=n4ucZluqd7Rn9USs5AaNQcjkyWV/7ZvhsEaiHXgqDmJDwmsOYW+Tc8gHioUBrggmSL
 4251XCulu6Dw79ci++0dkIlexw5Crd+G++jWvULCjL/uVcD8e9jNBpsOUcdUMMVds3sx
 vnx01w7hms6aoV0BX3+IL4XZK63zWrBq5zjMBjceXB5fS8ZAX0FDZ/SRvZ5j73c4Q2nJ
 z85NWcT8a6kDaM1hOu6ePfpyASuAKKkSRxl3ZdcqHNUywqo6cQobptZh6s8yPmCV2Ibj
 UBlo338Kt2yB4L5sRKE75tiJadZcXXRvvF3aaL2QwxetkGb8S90tDFJMAaGbBbMbyF69
 RsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3QDibyFNEaQBAlcOcZglPf5uEDCypT1ErrGWYL3AuN8=;
 b=fgOL/bjl5X1ElF1MHKf6QS7WQcSwKSqvvYFKedAPv9p2BUfwtMP0He2v3vkQmkqDLf
 65HeGIQVyRYmme3veqMEKSAxL4pCutbZGucy8p/78As9gYm+LJ2SewHKQqTuOYCDvCWJ
 c2bptM8UDVQcwteiWX2KtLZc2HK455+12XdL/mIIO7xdmaQrNBPIlMpRV4hL4fMSzuFQ
 iucjX4slIJWpfgsYCaE8diYzHsFD+4l6h8cJPAZRceTlRKCDli8vlAhReuqQw4StUId9
 4t3eptPoAUPYZU+Q/nr2f/TDNnu1IN2aeVu/1hEWf3iroov9+RZbrxDl9bqD6k26Z3sF
 Cz3g==
X-Gm-Message-State: APjAAAX0187FhgE/1KivcrhD3NWMxlQaHQMMvQuHYrlJ3zcGyDH4pB3l
 eV0Zsvrwj8hRq8kR/Tw/6tl1xg==
X-Google-Smtp-Source: APXvYqxmDYEY1Ff/PypAXqIIxFM6K9hf2q4tW4sAGg5SIB2c/1YEMr3YhzaRmZW/7u5KKCEoKW757Q==
X-Received: by 2002:adf:8184:: with SMTP id 4mr48432770wra.27.1558363055370;
 Mon, 20 May 2019 07:37:35 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id b136sm19076204wmg.1.2019.05.20.07.37.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 07:37:34 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: srinivas.kandagatla@linaro.org
Subject: [PATCH 1/2] nvmem: meson-efuse: update with SPDX Licence identifier
Date: Mon, 20 May 2019 16:37:31 +0200
Message-Id: <20190520143732.2701-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520143732.2701-1-narmstrong@baylibre.com>
References: <20190520143732.2701-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_073737_066783_098E0060 
X-CRM114-Status: GOOD (  12.05  )
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
 drivers/nvmem/meson-efuse.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
index 99372768446b..9f928fa9964f 100644
--- a/drivers/nvmem/meson-efuse.c
+++ b/drivers/nvmem/meson-efuse.c
@@ -1,17 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Amlogic Meson GX eFuse Driver
  *
  * Copyright (c) 2016 Endless Computers, Inc.
  * Author: Carlo Caione <carlo@endlessm.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
- * more details.
  */
 
 #include <linux/clk.h>
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
