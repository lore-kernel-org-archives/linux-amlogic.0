Return-Path: <SRS0=NajJ=V5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57AB5C433FF
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 07:55:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27B2A206A2
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 07:55:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rzG6eIpc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GVM7VG1f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27B2A206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3mFadSJZiEfu9xNN+5LNKpYC8LrGpBDQb6F9tdPl2DU=; b=rzG6eIpcanrrL4
	VP9zVXTqthHc5VnMJb428QXVbFZOntU1V9swdoZ2FFNY3eB+NxMjYb4ZehdmS+rbCLY0iXhyFSBwV
	UbqXeGbLcIjQADuvTWDmeVBaxNkNt98niQ4eagGT3ICGaGWFwVW66ZqOsyPB53UlxCTt0pNn872KB
	O6w9JzAhCkiGimG93QvkqDQWgremkUJvzK8HtI7wQDoqV5Q5b7oANXJP3S6l/M45HCd+vHISZCvh5
	BSXawYiUVzUAZBTE7pvUJtcy8b1/Zd66eqFyU5uhgwztUps73qUyLCiCYjj/RssrD0prxZuGRHkfZ
	TaICGu/EUzZuJAp+CeVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht5w7-000396-Dd; Thu, 01 Aug 2019 07:55:43 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht5vT-00017A-Km
 for linux-amlogic@lists.infradead.org; Thu, 01 Aug 2019 07:55:08 +0000
Received: by mail-wm1-x342.google.com with SMTP id u25so51890302wmc.4
 for <linux-amlogic@lists.infradead.org>; Thu, 01 Aug 2019 00:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S/U2vfr6KpQVUGk7LGivXBjTe3cQxbkb3JGHh9Y0Z5g=;
 b=GVM7VG1fhWn1thASAa3dEu1eaGoxMvUZKilOXRoZnyn5VPQTS8oN3mtNLX1TSuHFHu
 TLyEvanhuCJR7IlVKEusnMRkhmu8iA9hYUHH+HPeJgIw4s6CZdSGNQfA7i+CkFfkok86
 RORWtqYMWlgaBN0Zm/3weiXE28vfWRwS8Uf6WvUQ8ytDbv/240yNK1IFBoMArjiUyj2x
 pATmZz2YuFfYgItWgnafvVKgU80AMkIoiKJpb7Nies3ccLwGPEjhaxGrFBh3NaJDlZfD
 eXgQjsMyYZ5ZIlSObmFtLJOu+2REVIEOQl8bkjoiLdrpl7kXhBzlsvXfwrSJ4SkiyHbu
 rC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S/U2vfr6KpQVUGk7LGivXBjTe3cQxbkb3JGHh9Y0Z5g=;
 b=JUY3/PgY/+MuJCBLsspeN27AJFNQk6FiSQUZKoHi0J8wFFc5HTC8EVNYTgTxQ3wgv/
 oJPWfpyXKVY1SHj06EDVbD7xBiV0m1XLJ6yIp+VMPqpCzJIxXbk1s/4XrceqT1fOSWNf
 f3dzGE2cFDvtTkzKETNCb0nTbT+3alAYvVGZEQ/fSCtjeOukqyEiPSYFDONb33td4TvF
 /1r2EpQvPV+XD/nZSLsBllSKhLf12+k4DCz5c73l9ZoyoQkDzWg6QoeRD0a1ysUtn4DD
 EGvJsIYtaJWnGL3ZKMUYvBCeZElKk6nQutJG0RydXA4GsDte/fSPpjAMYeE+bk3kYgqW
 bJYg==
X-Gm-Message-State: APjAAAW1oge5zJnFeAvuizkPF7woAU2Ky9dwZmzAeWadrfmYS2tI8NUP
 qI3VfTFJPntd5i+gcVMkX+eRtA==
X-Google-Smtp-Source: APXvYqx63hzIPJbnoKcosXltEPLqar2N+McXWG9ADJG7p3a1qb2nNDFC3hnrT0W0g1JeoKNM6mhzmA==
X-Received: by 2002:a1c:1a87:: with SMTP id
 a129mr112944890wma.21.1564646102195; 
 Thu, 01 Aug 2019 00:55:02 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y12sm64199221wrm.79.2019.08.01.00.55.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 00:55:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: p.zabel@pengutronix.de
Subject: [PATCH 3/3] dt-bindings: reset: amlogic,
 meson8b-reset: update with SPDX Licence identifier
Date: Thu,  1 Aug 2019 09:54:54 +0200
Message-Id: <20190801075454.23547-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190801075454.23547-1-narmstrong@baylibre.com>
References: <20190801075454.23547-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_005503_684279_2BEEC400 
X-CRM114-Status: GOOD (  16.40  )
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
 .../dt-bindings/reset/amlogic,meson8b-reset.h | 51 +------------------
 1 file changed, 1 insertion(+), 50 deletions(-)

diff --git a/include/dt-bindings/reset/amlogic,meson8b-reset.h b/include/dt-bindings/reset/amlogic,meson8b-reset.h
index 614aff2c7aff..c614438bcbdb 100644
--- a/include/dt-bindings/reset/amlogic,meson8b-reset.h
+++ b/include/dt-bindings/reset/amlogic,meson8b-reset.h
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
 #ifndef _DT_BINDINGS_AMLOGIC_MESON8B_RESET_H
 #define _DT_BINDINGS_AMLOGIC_MESON8B_RESET_H
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
