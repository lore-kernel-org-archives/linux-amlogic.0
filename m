Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C8FC04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:39:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2372216B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:39:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dxbaRLcD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LxgGhVu8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2372216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AqtocCLlaVElK+aWeYi28uqX7LsoLkcx5lxdimZxqNI=; b=dxbaRLcDnXwXKe
	FNez6ORtFGqqh5iABZQx6OY3+sY+p+ad8TOFp1fPEkXJT3xlNnhv3uh69PZLGIhijgQAikqBnyZ8/
	onQc5VDW9FxzcoqUaAMsdDjBDBAvUJKwjYrjRcx1kg3q7EEPNj3hZyFX+KqWzLGCgyhMf3WeQ6zy+
	fIFkxQtv+8BtDWOa1C4AJyPzzP+OUapxV+AUgM4No7ZqXRALbW2WklgrvgUo7Ol+YSo7Qu1NvLMag
	kBy0Ry1wGRPUiWM/H6v2kVeodmSofXzRkzO5aiHzKVMO9NJzRVus0rdBs3rRn4FqKSEVuz65q7Uld
	/a8+unF+tKO+fERfH+kw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSjRN-0007Oh-FC; Mon, 20 May 2019 14:39:01 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSjQg-0006NN-My
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 14:38:23 +0000
Received: by mail-wm1-x341.google.com with SMTP id q15so13316110wmj.0
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 07:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gsXRVF+Q4Xl1eJydcYQleu4f8bJRfycH0peR8dxLr58=;
 b=LxgGhVu87BajYbSzmXi0IzSAiHiTAYKHLacnLWWV7vXsrDMMNhNEDTbyA84BeXaYIk
 ec/9sfy4kZ6Cw0rtYk8QKvGQnSMOlY2IWAbVGrZ10rY++c+xzDjUDtTb0uYihYzh3Ir6
 T5YcwqIS21nZgaIl0J1zc41HhzAWyCApOBXpchVLeSScvGqYikxymiUUtxTDnBpTtLL6
 ohZt7Loy1JE2i3X8uKjvCj/OK4OLMdI1TG2PeRCHYEdULKhe6t6XiNCNIFTm16kcQDbz
 svNnyMHCquBY3JcHr4OeoyQICrvktG0FjlrrbCY1kYb1kbLrmmF7iZ7aG63widp0XvUD
 zxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gsXRVF+Q4Xl1eJydcYQleu4f8bJRfycH0peR8dxLr58=;
 b=c5KhheOI1gowkFLaDNrHIzfwYSWOM8HUQUBs9lfQEf1BIIH7/L6JKNt0BePhSBI4Ft
 9JNmo/3QcG/Y50/7iOM55+sQ3UDFh+A6aSXd3DfUmfc9uqvg5wXv8AHOxalvfs/oAxQM
 QmYr0TJ6BVL/tWqPsF5g8JsCrr/A1FF8mVEklIAaKoaeGTk31TbhK38Ve/bRvsRKykDz
 ET+g3rBmYzveU1kA/HVJ/00/uz/4SQZsjLRWHGJDOYFrF96q6itc0TDAOAqeKY3GdrDE
 eEdD8bCKhuyDgLFONw7u/O8V42ta/2gM4EvyWynhpr+RUNtnP/NphIV7GD2CAfMWqzoc
 oTvg==
X-Gm-Message-State: APjAAAUtZ/Alv9w0SOwdownigX9tfIQlXGNj/SaTE7e0qKUVf24Hk+zS
 NnWyB/SCERCsBPvdPZgIQyf0Pw==
X-Google-Smtp-Source: APXvYqweBWN2ESfxa4/+dEXt37jaGm0QmgzGH5jH9Agalj8dDA35BL5pOixdonfwJ0DfZHMLhn+f9A==
X-Received: by 2002:a1c:b782:: with SMTP id h124mr2889396wmf.20.1558363096676; 
 Mon, 20 May 2019 07:38:16 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y4sm12505976wmj.20.2019.05.20.07.38.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 07:38:16 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 02/10] ARM: dts: meson6-atv1200: update with SPDX Licence
 identifier
Date: Mon, 20 May 2019 16:38:04 +0200
Message-Id: <20190520143812.2801-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520143812.2801-1-narmstrong@baylibre.com>
References: <20190520143812.2801-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_073818_883200_BFBEFECD 
X-CRM114-Status: GOOD (  16.43  )
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
 arch/arm/boot/dts/meson6-atv1200.dts | 44 +---------------------------
 1 file changed, 1 insertion(+), 43 deletions(-)

diff --git a/arch/arm/boot/dts/meson6-atv1200.dts b/arch/arm/boot/dts/meson6-atv1200.dts
index 997e69c5963e..4d2a37da0161 100644
--- a/arch/arm/boot/dts/meson6-atv1200.dts
+++ b/arch/arm/boot/dts/meson6-atv1200.dts
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
 
 /dts-v1/;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
