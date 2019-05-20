Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D955C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:39:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62EC8216B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:39:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pKvmfVWH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oHqucEjA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62EC8216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UCvvhhoF7zyYyf52Ix12ArcgS68teQud6Vb4Hjmn5po=; b=pKvmfVWHbapG3s
	TuaZktmP/u+y8cFCTmE0yqbM2IQ+vv6336mtsvo2HfSoW21yMcIKUal72u3A7UPdWwOM8u96+as8M
	/HojRuv7qbFk18XQEA1ol48ytk4V+iPTyysAGg6JDgqXpDq5/zEbMb6i98UVn2x/eyI1X6yxvXiNM
	/GaRwRwM9rjCj98ccbKwFyvcSkCG094SxFJ8OXY7K9WLL63yhkhzvHNPEfQyR/wrRj2gvqE4WUMuM
	UO3vI13SGsKJz+feFdW+zqcCEztbW7FARklTp4BH7L+us51rD5v6dAFVV/2lGrztqicic80C1ZMSY
	o4/GWW+90oYfAyTKfGgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSjS6-0008Mv-IH; Mon, 20 May 2019 14:39:46 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSjQj-0006Ti-VF
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 14:38:33 +0000
Received: by mail-wm1-x343.google.com with SMTP id x64so13556429wmb.5
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 07:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D3XiPRAq3iONjbh9isT60h9K+swEUyZx5NpuH8isn+A=;
 b=oHqucEjAN5rGyDvitqgZd0LC8uSMCUjDrBRZN2eJPKviS1qb9uPEv++ZVXEvl7uVo1
 C4S0D9mxbt9VPrRp9qMMgJc12026O9sLj3WAe+hy+o8pRy3LW/NEbK2iXRgptHeE9skm
 WDJ0eGi9vzd4WIozt6kxY8UHLa9B6j3+dTYCG1Rg9GLJAEcwwP0IXKb4MGvNEBzeTL1L
 m+lPjSS9K3DB2q/MGNe25uAFshy7uEQCRHtJwnJdZueBrnmit7SDxq/J0dYbhiQvGee7
 MJ5+z2o1GySyloJCHQC6ADThHznMW7XvT52Uy5sxAxCAOrQxfnQvq3KAC4sjkJquWBj7
 MkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D3XiPRAq3iONjbh9isT60h9K+swEUyZx5NpuH8isn+A=;
 b=CaapvHagA8fQFHF6J8ORgXQwvI3n/4PhLckCSCCiidJWsEtrS4Feb7FG9LEBrOkwsJ
 pR8Li++n6zFkp3YzsVCElLZyLPujSZEPzcNpjMO3rzEOBtxNMbnt4DSjpew4tNcS5yMw
 hWNh4t++UwN5U+/6oZBU+0VQ7EKudoreUCffmUHH+dnq6hjZ1/LNpE5Gg1s3NMie7x04
 HA3ginGjnDffCP/vDglby3o8Z1TMe5oDlRKtTETvPsb2EfR07+BzuZli3SNWQ1q2R1Ej
 UZ3k3H7EXu7o7Hl5+epnCcw7uXRCxAAvrQ3CnJdZfccNpjO2U0GxWnGLg4ofuZIEOta0
 TeEg==
X-Gm-Message-State: APjAAAVsVBLIevXZPYsH1GSld//jDKSW1OjpOE78opRtXXCAtquv62rL
 KqPm6p3pcTatsdokY7C9mihXYQ==
X-Google-Smtp-Source: APXvYqwveN2FjHNtP87z7oiJEE63JF4b4KLW1YKfeunSUmvfE+GgGL+YeURbB/vCkk+m+o4sZZmsHg==
X-Received: by 2002:a1c:c016:: with SMTP id q22mr35830816wmf.6.1558363100320; 
 Mon, 20 May 2019 07:38:20 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y4sm12505976wmj.20.2019.05.20.07.38.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 07:38:19 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 07/10] ARM: dts: meson8b-odroidc1: update with SPDX Licence
 identifier
Date: Mon, 20 May 2019 16:38:09 +0200
Message-Id: <20190520143812.2801-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520143812.2801-1-narmstrong@baylibre.com>
References: <20190520143812.2801-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_073822_631133_B0380579 
X-CRM114-Status: GOOD (  17.02  )
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
 arch/arm/boot/dts/meson8b-odroidc1.dts | 42 +-------------------------
 1 file changed, 1 insertion(+), 41 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index f3ad9397f670..27bfad138f87 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -1,47 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0 OR X11
 /*
  * Copyright 2015 Endless Mobile, Inc.
  * Author: Carlo Caione <carlo@endlessm.com>
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
 
 /dts-v1/;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
