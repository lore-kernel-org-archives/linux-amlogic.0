Return-Path: <SRS0=NajJ=V5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B91C433FF
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 07:55:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45C98214DA
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 07:55:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ehHtHuYF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IzvL6Fh8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45C98214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LP15NefEP/FYkQS2CLeznEo0uNrZlUrOvm12yHFlDSQ=; b=ehHtHuYFtivm5Y
	9DB47/065MXVbbhK8k78H1sKDuM76ya88o1OgKm/PaktankRdhnhPE3FHV6BQRNW8owczE0gl5zB6
	4oO86XMr4dfkTPXPLk70sVu38nRtVyFikgVaKWUwWu2JwEgp+hXJe8KgAPE7sjGkPlMyzvxpCJ6be
	79+o/ZRTqOWaCftoTkawCAa3rX294syy+YqY6zvbFgeHwRKYbftxcLCmxnf81yF3/NPyvLSEnZM3+
	9JaNotQgaWJxiHDfo6FQ78fVcILUuFXvEiStUkWc7O19rPVTg/1xfETfykPWv4naNPdlaIm9sfhCx
	OnCKTEHNlh4kwFlfa5+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht5vp-0002fO-14; Thu, 01 Aug 2019 07:55:25 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht5vS-0000xE-9A
 for linux-amlogic@lists.infradead.org; Thu, 01 Aug 2019 07:55:06 +0000
Received: by mail-wm1-x342.google.com with SMTP id h19so3011965wme.0
 for <linux-amlogic@lists.infradead.org>; Thu, 01 Aug 2019 00:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VDh+yTCqb2E9NnVNrkncEUqcUL07YA1bsORJMbcQ8lw=;
 b=IzvL6Fh8RsohbqMby4W0y9O0NYlulPkbH7/6/KE7ev/epMQUxqEMGoBNO7hasjRB01
 /HKKAZluufYjxDeMWVHHn/PBOC16QdfF8bFsHPAH/y0seF5aLbTFn3qY0xodZ77nucSY
 xYMW3sPy+9Q9CM6qMRRSINJH5EbEDk5vXnNhNZLhPlQpUwj+N7ffv9fojxS7O7dsAM1Q
 wmk7yQI6F4l8KrAM7trg2kTFx7sn9OQD/diXUgZ9QzkMHRXcqBM5bSemJqoYhaxQhj/7
 E9wFCTeeCCjgGVkitxS5ZV+i0H0VTV0ObPeyma9le55NMAyecpfvqWXsQP3FV+hdWzCM
 UtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VDh+yTCqb2E9NnVNrkncEUqcUL07YA1bsORJMbcQ8lw=;
 b=mBgNM/1TWZn3rx6vQOBhHEXFLdBrZtYpXJKlyJ6AQ19HgNyb+ywHjtHlzldqoseYWX
 gBRUE8WXdj75L3W+t0CeqlxeatfRPq1UB2ATbJnp+Sffs7Pt3CsuRy9JHJ6Gkhw80trr
 zjyLhISD9EKy/YCpz3bCqVd5sf/qIAYKhecYbD5o+thTAR3lD6Na559gWCKeDyuSUpEO
 VpMy//Ju45UGACs8uJu6oigpReE9+5A4gEdRz4XkJB1kpk4srjeePceICm0l2wu0bvo+
 WePf/tdRHkkPdNjNB+7v7KrCAdW0ZBvTdrKbIHFUD0O0qWD7I6QomcWdZ979kUap2vpc
 cqKw==
X-Gm-Message-State: APjAAAXRrJh5yp5jJgetYTYeL3TZlJBtfSrn17UJ8CNLIL8JRM/g1/gW
 FCpBtPDcw13x0gyVchFQJ57m1g==
X-Google-Smtp-Source: APXvYqzGk38l6yq4GXNCBAzayn9dzPlX9QGyiHIVNo8jdmjDHvCA/27f71y7td8ETAlQCK68vOhRjA==
X-Received: by 2002:a7b:ce01:: with SMTP id m1mr34128533wmc.1.1564646100811;
 Thu, 01 Aug 2019 00:55:00 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y12sm64199221wrm.79.2019.08.01.00.55.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 00:55:00 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: p.zabel@pengutronix.de
Subject: [PATCH 1/3] reset: reset-meson: update with SPDX Licence identifier
Date: Thu,  1 Aug 2019 09:54:52 +0200
Message-Id: <20190801075454.23547-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190801075454.23547-1-narmstrong@baylibre.com>
References: <20190801075454.23547-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_005502_342900_B48ED823 
X-CRM114-Status: GOOD (  16.08  )
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
 drivers/reset/reset-meson.c | 51 +------------------------------------
 1 file changed, 1 insertion(+), 50 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 5242e0679df7..7d05d766e1ea 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -1,58 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
 /*
  * Amlogic Meson Reset Controller driver
  *
- * This file is provided under a dual BSD/GPLv2 license.  When using or
- * redistributing this file, you may do so under either license.
- *
- * GPL LICENSE SUMMARY
- *
- * Copyright (c) 2016 BayLibre, SAS.
- * Author: Neil Armstrong <narmstrong@baylibre.com>
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
  * Copyright (c) 2016 BayLibre, SAS.
  * Author: Neil Armstrong <narmstrong@baylibre.com>
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
 #include <linux/err.h>
 #include <linux/init.h>
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
