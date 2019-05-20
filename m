Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DB8C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:39:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56922216B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:39:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kycCsRsh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="k4NzsdZW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56922216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wjka65k12fA27yAwYf/JHy9foHtUoSWSzG4Rtrl0vAw=; b=kycCsRshy2cLdL
	kYaSVvX2zcsSemHOLfKEfnL0uE8kQRnJJu8OxwOGqBqR1cTCzBG0mWdUFXVLjDemvhdmgm6iOA9y1
	QHAJUrGA5TMAyU0lyEsQsIYYxtgD/lAkBonnFa5jHWyzLnWhMfXgUSKcIfl5czkooA958W2EYNWne
	FIa/6luDV/d4zZY6zU11zt3hSkFufnaUaEVIM4Y7Nv6HpJwLZ7ysHl326qghhdj8FKWlhIrA+ivrG
	JeFGH+zWC+hIFP7jd0yWuo1UxqaWvxvc7t+3EIgfEqhLT9iTWbJPmumrVebjQDZxVbn3/n6CXe94A
	j6hIQXMjUcFKxll8B+wA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSjRP-0007QH-54; Mon, 20 May 2019 14:39:03 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSjQf-0006LR-GY
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 14:38:22 +0000
Received: by mail-wr1-x443.google.com with SMTP id b18so14852161wrq.12
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 07:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l9U9UFxewhzgfdgHobwlemQkQvapoJUzpG7DyO7HNN0=;
 b=k4NzsdZWw7F3mbMtriap8qmSsAr/E5Fom1fD7BsuJEUZ5gEsCldI4enocXYFcNvnlL
 MxBWCCmDp2GcUiDKY6jjA40Lz+/63YhXoJLO/1Cs7YAU1KvvAizLFmrekcdREQPFjSN7
 KPezATZpwdkAUy0fPHxrD294tpuUYUCzp8EIdsN0uvegUsQtnt/32P0ESrmZxrVZfaHX
 FGxwrQ/dtu46WZUhTWgWFs2wJaYBo7a5+qcR28oUosOoZU/KsSJBgNp+9QFby9Y4bLQJ
 GvYj1DqkWymR+OOZ9KGRRZBrC4s3bU64R0OKHJh6hLqMOY+gcdakF/p5rO/TDtkCYwII
 wMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l9U9UFxewhzgfdgHobwlemQkQvapoJUzpG7DyO7HNN0=;
 b=Sin16QJcXuEJFNQ8Z9aYupiiR6OlI0GQUl/mWDThNM8CKy+h5U2586j2UYd99iPwed
 ttZMgaNA55oRMWlF2jHIYf5YfvxCzBnzaieGNQj2+lhP3xxpLU3dxnTsB4n7vbTEMJg+
 tFchaQ5Kg7jdrYynMjaZh2QhPNdL66+/4NcwbmYV+8YCI5IQY9DC0whJgiLVirdMf1T2
 B+AxOeszM0nWLf1zb5nTArlBSu4bI2VLSpipgImWXla8kD6hSyqmdxKsOAaym/y58Syp
 MA7IPtXb68GExAZQsX7IRBolLvvfJSIIl0+xuLbDHDZFr/VLdRRz8qys0X0z7AUcnBTw
 6gOA==
X-Gm-Message-State: APjAAAU1m/Lz6fhjlwFYUTvZiftur9XzQYP00H6zBKEgQ0yfcBdrlphX
 6x7YqOZ6nDMO80S37REvLQPlcg==
X-Google-Smtp-Source: APXvYqxhH4U5Wn9b4ZaRUOkvitSAEMC4SBP5q+SbWgFqVIcYcMlMhG5xdnJZXUxqMdLgouERAcWGhw==
X-Received: by 2002:a05:6000:10c7:: with SMTP id
 b7mr14036103wrx.288.1558363095957; 
 Mon, 20 May 2019 07:38:15 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y4sm12505976wmj.20.2019.05.20.07.38.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 07:38:15 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 01/10] ARM: dts: meson: update with SPDX Licence identifier
Date: Mon, 20 May 2019 16:38:03 +0200
Message-Id: <20190520143812.2801-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520143812.2801-1-narmstrong@baylibre.com>
References: <20190520143812.2801-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_073818_167975_8996627F 
X-CRM114-Status: GOOD (  16.48  )
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
 arch/arm/boot/dts/meson.dtsi | 44 +-----------------------------------
 1 file changed, 1 insertion(+), 43 deletions(-)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index 8841783aceec..6e59894bc6c6 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -1,48 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0 OR X11
 /*
  * Copyright 2014 Carlo Caione <carlo@caione.org>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This library is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This library is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this library; if not, write to the Free
- *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
- *     MA 02110-1301 USA
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
  */
 
 #include <dt-bindings/interrupt-controller/irq.h>
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
