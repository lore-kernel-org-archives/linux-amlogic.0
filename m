Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 259D1C07542
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:39:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F361C20859
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:39:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Il2qNlWF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eVukzGrx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F361C20859
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2uUKUcdYrcJxQ6H5ySioFROfqQ3isjk/z6uki8Js7Kg=; b=Il2qNlWFZ//kbd
	Jq8OBvmUoCVrX7aUHf0C7ZkBky0VVIymd4kaJYpvBPErpbkPsSq1kIO4Ra28Vylz6Xj4LysEA/CpX
	YuMn6Mkwo493x33nD7/2T0bzSwemm7IImT8qUJznUAIjGPfMGfmlDBhdkkTN0g5CIVJ5ynU2P4xWo
	12NzJYnr+1HPfUQHFr0ATddbXb8YHxuFmwe4TDS6wh0svIG112YiE5y4Sh11+nLEFf92akT9fFIcg
	XIkrQNwRfixaSS/L/ZPEweFTrNcNQf7PXunM0+Q0+MYJLRP1mz4pVkr6zT5HTM+q3TRtyseEgdNfK
	GGhTfupZ75p5VLmEZUaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVFqX-0002fv-LE; Mon, 27 May 2019 13:39:25 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVFqD-0002GN-3V
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 13:39:10 +0000
Received: by mail-wm1-x344.google.com with SMTP id f10so8777486wmb.1
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 06:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y2pg5paT/NJchnflVcngAWtfEGRymEZdlataY0CHUZw=;
 b=eVukzGrxWUEJgBgKeB+1eaDG/bMmY2r8B155esC2L2uBBIKAo4AGvBo5xUUeF8LMYS
 uaxxzHGyuHkQLCwuIfb0Dh8kPvTa7sqzffPgnzYJmgJQHfNzARkmeFjxdBgssUHUXPLF
 AzQlKLk011U4caTcLLoCClButslRe00h4mxreHxgIuoLSdJot76DA6bY/sQqfMC96yKH
 OCfh5MSvHcELZ5UeCAgObU/PWBnoghR+Xyv/iBByuvIWyQiQ0S1k8yTP6ORhOgOMv+aZ
 wEgMRjnZYlpQCEuQYva9qcoJbjOkw0M6JG7dSGBBzTwTmUAzfK9KJZz6LgTOuBiTFHpP
 oD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y2pg5paT/NJchnflVcngAWtfEGRymEZdlataY0CHUZw=;
 b=FfZ0FxkqNURHQkedZnlWO7G9PjZ14xbRsAwp79wlnvGk5Qc047Pv8YkNF8z7NlAen6
 DLwhSIQ7Ytrr9dDh3eT49gb+4x7eYwLu+KksC3DN8azNSXGcsHX+KDBrZ10v31yYWJi+
 +tLPdehHE3Q4CyiFh/1u6icK8RTceJOEWHFNx8DneqEwMyPc7kfWaxBOFyZQ/ZgECyKm
 wGBgv6t912Zy/bpyCG5EAenM/C9fBvB8mgBHxh7AnWzOy5JC4qIIJ9NrOompkEhgMZ0r
 sG4VG7NqPJT5M7KrTd8nBRGajj+XyppugVgK1WLFaJ738M5QKy1A40Fz+uGB41mXK3Bf
 kG4A==
X-Gm-Message-State: APjAAAW2p1e8A6uiI1ifTema/NeYW3K/Cr+bj0NppG9eLWaYsRL0jLgN
 tKwj2ewq7V0mjT5N+XvAiWzKuO4O7OSkrw==
X-Google-Smtp-Source: APXvYqxn8322bf6sVLBtVz4d2LHcCB4QKIBLtHdJ4g/LP8MtYxyRXjJOanxd6XGYP3q1hJDkydzK1Q==
X-Received: by 2002:a7b:c549:: with SMTP id j9mr26129097wmk.114.1558964343555; 
 Mon, 27 May 2019 06:39:03 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a124sm7838335wmh.3.2019.05.27.06.39.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 06:39:03 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 03/10] ARM: dts: meson6: update with SPDX Licence identifier
Date: Mon, 27 May 2019 15:38:50 +0200
Message-Id: <20190527133857.30108-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527133857.30108-1-narmstrong@baylibre.com>
References: <20190527133857.30108-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_063905_300969_A1333572 
X-CRM114-Status: GOOD (  17.34  )
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

While the text specifies "of the GPL or the X11 license" the actual
license text matches the MIT license as specified at [0]

[0] https://spdx.org/licenses/MIT.html

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/boot/dts/meson6.dtsi | 44 +----------------------------------
 1 file changed, 1 insertion(+), 43 deletions(-)

diff --git a/arch/arm/boot/dts/meson6.dtsi b/arch/arm/boot/dts/meson6.dtsi
index 65585255910a..2d31b7ce3f8c 100644
--- a/arch/arm/boot/dts/meson6.dtsi
+++ b/arch/arm/boot/dts/meson6.dtsi
@@ -1,48 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
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
 
 #include "meson.dtsi"
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
