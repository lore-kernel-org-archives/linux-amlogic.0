Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B93C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:39:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C025320859
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:39:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N+HJ7A4V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jIrDDMHo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C025320859
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KvaB10x6qNwsKtJWS9Hf7ZI+QiU7UqAYpX9UFp5v2ac=; b=N+HJ7A4V+0uABq
	EsXT1vJoDa/W1VgXjpoGqatKMq2MWKUSOp80Px2Purz3XfPJBIwHRNT8TiEcH+OHEJPaGgk9356uJ
	uGyIqkU2puBNRAXMErsfEc0wQ9NKvrNGYhMCsjRbV0ZhkC4IAQbfXgzWkOpC+d99p2DcQaAtjdXCM
	INEq8bFAzFrxhZg+t63cHg4s0bQrpmjSeQIoHZPzBpBbwOcb8C+i5sYY619RxL/bEg+JgCcHxoZQY
	lcrp6dpLN7xQuNmyHzSFb4PUe2ke2adUF0Gcfa6m/b4VBiXxeVQ+8gRYXbuytHOy8CGLpOMaE1XLa
	+4LOIEI7fJ+e1yEW1ong==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVFqv-0003Ga-Ll; Mon, 27 May 2019 13:39:49 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVFqE-0002Jb-EN
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 13:39:13 +0000
Received: by mail-wm1-x344.google.com with SMTP id t5so15896545wmh.3
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 06:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dbnPVZJdWtdW6tki127dTtfmRwOqmvHfy23+LkQb2Hs=;
 b=jIrDDMHo45dOxUysVUWAOWMx9POubMEMDRyo9ld3jzWON5ikccg0fLSuP67/TgXdxx
 nuzmBxFXMQmp/mJlrVBo86dxs2e39dRoY8wbI7hJba6xpfHg2E/Tt61SS74hLbdYlUqg
 yT9Qhrqib7GOPmDe1jrH4pLMLcz/+3fySVhKNFNeUWgMHCrC1uSWLvbk3tVnd+0HEVeu
 DGvpoqlS5uLsrPqa83RKev/WrTjuAkBhVEjG/ym9N6dRe6NMU4yaWhsEDCTp+c90kUZE
 vgGR+y2TsC5/C6CtDVaUqCRxxET0jUvAGqTSB7d0DCEY8irPlfb57EzQE3cWO38nEOsf
 BG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dbnPVZJdWtdW6tki127dTtfmRwOqmvHfy23+LkQb2Hs=;
 b=ly5DSas9W2YIFbvwl+X7nKhxtJzxiSKuROAOwd8XJlRq7BB3l5g1eDKsbqyG8PJLrL
 kFMPk3RSsnaE3p6MD8EibN4HXoIYP2jgTTE/mW5H3fV3+fC4FSe+i8ZihUooEos8Z45f
 5KTy4FLc1D2cBhHGiU1IddWNBi8spUG7jRJ91NZTWtw60e+W3UA6kLZPVcmFhs7GTJ1Q
 yNPCb+Sf6Oj3pDM7DpDU1YA0WxkCNf0tWd2FXKI1FMCTxl/GFHSLb5PUl648f/1kGR8M
 XT9NjLOZeqjB6KP2ildivRu5XWIoC44yhnunSucYdcg0PgX4gj2g5zg9bSqQn7FxvEdT
 bxJg==
X-Gm-Message-State: APjAAAWkul6YC4QKtCrAtAMn0disl2I6XDPBHrulF9pG/s0BBRa9vhS+
 JLci4N2oQ26NZYbn3u5WW8QD8Q==
X-Google-Smtp-Source: APXvYqzu/VyF4LKbha2tnybdY20KZTdmVmXFpgEjqI4mkRxeUlHAo8gv63uF381WPDgmS0a+TpG4FQ==
X-Received: by 2002:a1c:9c8c:: with SMTP id f134mr10192683wme.95.1558964344265; 
 Mon, 27 May 2019 06:39:04 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a124sm7838335wmh.3.2019.05.27.06.39.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 06:39:03 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 04/10] ARM: dts: meson8-minix-neo-x8: update with SPDX
 Licence identifier
Date: Mon, 27 May 2019 15:38:51 +0200
Message-Id: <20190527133857.30108-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527133857.30108-1-narmstrong@baylibre.com>
References: <20190527133857.30108-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_063906_873648_DE530455 
X-CRM114-Status: GOOD (  17.12  )
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
 arch/arm/boot/dts/meson8-minix-neo-x8.dts | 39 +----------------------
 1 file changed, 1 insertion(+), 38 deletions(-)

diff --git a/arch/arm/boot/dts/meson8-minix-neo-x8.dts b/arch/arm/boot/dts/meson8-minix-neo-x8.dts
index 8686abd5de7f..61ec929ab86e 100644
--- a/arch/arm/boot/dts/meson8-minix-neo-x8.dts
+++ b/arch/arm/boot/dts/meson8-minix-neo-x8.dts
@@ -1,43 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright 2014 Beniamino Galvani <b.galvani@gmail.com>
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
