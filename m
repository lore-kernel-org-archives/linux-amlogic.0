Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AAF5C04E87
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:39:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30157216B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:39:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZXDksGj/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oRVC9sOV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30157216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+/ZkVv5Gz4+1lydQ1tFfbnDTUo/l4adt0ZJ4MY7Q2SA=; b=ZXDksGj/ynb0pL
	z4nHL8Te9U5Drw5S3lhFLNbeCOHfQATBCKK3QDaK8tXE9ck4H548V/eGfnH9MAZqbnWPb4J1V+SqI
	5QoLRc8xi3oY/tcS+1q/2zRB/GaV4hguavSdiAqPsW4US1aYXIn4SddkegscPXnnVNpq+siD0LDFn
	xphDKsfVvXXfYef3x/zyy+iLjeSYTB5+ZAqAeqOEZAlqoFqcs1QB0RyHpg4FGte6jejDH0OSqG6A5
	kg0S11BZO1XhdnTtP1FsF50wQTrEcYSyJcd+Jx8uZ3Ye8t8y6qN6R2mcUrdtlkBpml9NYN+QkeqQV
	xHeC38hJqAj2u/Rx2OYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSjS2-0008GN-8W; Mon, 20 May 2019 14:39:42 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSjQi-0006Qm-Aj
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 14:38:27 +0000
Received: by mail-wr1-x442.google.com with SMTP id h4so14910593wre.7
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 07:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZVqgXqCRLzgJjndvfbSssXq9sPi6rcSDzSBDfSWDhDc=;
 b=oRVC9sOVqaJJ7/VIvGdz/yOhmhMuouO38MVvt9FsMEigfB4u6TYFZsxNCzy/tT7QxZ
 BH5gtZkLsm6GOm7m6uA5mZUwbR0hX3M+nuU8dMVFqLgx+7ZgxSjJhBlY0VIEH0U3o/hz
 +ogf7v6+8tA4eU6oW2zhlcO1Niz72Txg3u7NOb6B5/9ZurmxWE6YlHkzSpMdVU4H5wet
 mnPY1SbOcXHiQguasq+UYd8rqSYOvRGkQHxaeFQOahtAQaxIyAbIF2i44eP/cmi7oFTh
 skkZ6eL8D2lD5YVvsU3NMDKGESXCV1aHo8CMFBoLVSWjB/ri+FhpEaLLPJkLPn+EJkBz
 Op1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZVqgXqCRLzgJjndvfbSssXq9sPi6rcSDzSBDfSWDhDc=;
 b=iM0eP13vpql2WRmR/45X9eTXYVq8Nk+Fcl1n2dD3afV+9bGSKaz1+GZSPIFy8SuQ7p
 SDTuonTYdkdGGlakMF2O6DyVJkzuFRNJepe3/xqVDygRYDxCUsIIiScaC3ynNKpfOkus
 EPvtefc23wimgi6CBl60+nzwFjwAQKmahlRPifRYSonaVWUFLgWvpZdgcs6TvIjF+Pe/
 GPyb1rZ6i1XcPxvrBojSvqtvxmsNAEeKvWw4fY85r3xe8/+l/gBuQGn/YQgV/F8BbyCG
 Z0CS7fOZYhnTEyWp3lvwUu1dAacseav35g0OP2tu8B4Ib2n+qVvuprdNAYpcNznxh+ER
 e44A==
X-Gm-Message-State: APjAAAV2gXr1BeNhDLHQE3rlqOMAKk39PPMxubvmquN4pFezN+1o+Lef
 5AIkZKvpacklF2Di+NGxAI3szn1GAxs1sg==
X-Google-Smtp-Source: APXvYqxn7weDR9r3Q5lHk0WD6puAQO2W9ig2A6lM4Zo14uhc1ETk74//4DY3cTMY1DYzaw61XQ7UVQ==
X-Received: by 2002:a5d:40ca:: with SMTP id b10mr6653651wrq.10.1558363098881; 
 Mon, 20 May 2019 07:38:18 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y4sm12505976wmj.20.2019.05.20.07.38.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 07:38:18 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 05/10] ARM: dts: meson8: update with SPDX Licence identifier
Date: Mon, 20 May 2019 16:38:07 +0200
Message-Id: <20190520143812.2801-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520143812.2801-1-narmstrong@baylibre.com>
References: <20190520143812.2801-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_073820_589017_E8B55003 
X-CRM114-Status: GOOD (  16.71  )
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
 arch/arm/boot/dts/meson8.dtsi | 42 +----------------------------------
 1 file changed, 1 insertion(+), 41 deletions(-)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 7ef442462ea4..fd8d57d0a3af 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -1,46 +1,6 @@
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
- *     You should have received a copy of the GNU General Public License
- *     along with this program. If not, see <http://www.gnu.org/licenses/>.
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
 
 #include <dt-bindings/clock/meson8b-clkc.h>
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
