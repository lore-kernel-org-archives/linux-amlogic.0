Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F789C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:40:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14A1920859
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:40:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O1v+BOyt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GwZ+2pxM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14A1920859
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sIRUrDFk9UecqvQpfJmUKr1rKNMEqPXfemoUm94VqFc=; b=O1v+BOyt8tJlje
	tAHf6psGykyhwn0+wuqHEC3vCIBg6t466/MZSY7IHFSf3JnPq8ZTjKIba4hjGvF6Lg1NUoRm7Usjw
	rs9ZLmcB+Wr2CzPwJPfth/v0gdOHjL18+nmNfu5YTf4e/tVG21M/2R96lFmUxq5UbK3zWyb1qUt5H
	6CLgRRLbflbkKm+VrXxbCTpAA8MeZkEE1eEnpgCvOyLfgwv2CdQw8kuIx3XXXlEP247tPKUDJlr3y
	18mZV0Bg+lx5pQ0ZdhS+YXrPCNEqEGRregcBvkWz6pDM3sUmKOZWGO54w34ji8ztgt1LlY4oSjSgn
	5t9ZF8CI52EswOiYFi6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVFrX-00054K-Ip; Mon, 27 May 2019 13:40:27 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVFqH-0002Oe-SQ
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 13:39:16 +0000
Received: by mail-wm1-x344.google.com with SMTP id d17so3035486wmb.3
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 06:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eOChpaEsOQLFv07SwDRnVxGpJlOXkRDlPY4sW9iIPa4=;
 b=GwZ+2pxMpQAjtt4cyGo2vJZxYSkmzjAIdxdbIgWq6MaN7THXApB04YGh6YYdtM8lpT
 nz6KJ1vSKqTmpDTANKwaDCleIek7Inve3a6rWWK4pRgDBIKd5kzSjkTvsRv6CWC1FcbU
 C51QePs+QvBrGKedh+bfmJJcIz/TlCD+G3/nBgRFEwT+cm+Fkbd9Kfr+x5MiuCTlsL1v
 I5na993FUbms1newegA2uqph28MPNOIlJ5gBgS7CgwJ2UPAwb7Ox+tV2sF+nf9GkglaK
 0HsFwfNxx67/eljpGuW4uqoMTqZNhUxcXXEj454QBji8dW0/zhqdt8fmWv/gpUdn9+P+
 OiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eOChpaEsOQLFv07SwDRnVxGpJlOXkRDlPY4sW9iIPa4=;
 b=XfOjzi1P/53+9Tptw0GVZ5k8IpCGyZVp8ziQ8JvieRrGpzollvHz22asjmYyGEASU8
 0jTHK2u8cbL0yvjiiOtJT5LxUroT2E/6dx+HdxHAKQVk266UbHAfc0MQSd3dyrw6vqoH
 Yxqigpk757fMOkIDWncRFAW9i9o3DCoRbKMrQtrwObE2NZuQRvrYapMo2vVaprYGbp6L
 Z50QgbfkCC+EaPLd+jZfzpidT9tw17Ss39TIHp84Pxv+7hfAOUQ1QrtPNcZcAFgd5VVN
 zEOK9Grh4VWrYm47Kxn8gDUGCGK3uz8yVsiM2QJWK3RZfU14emVeEL/QfQ9BvN/J/Fu4
 GsBQ==
X-Gm-Message-State: APjAAAUnRkje7GLOkkUGsFv62Pl4EhnAwfvlfES7Qh84FzHYGN/PRWN0
 zBulHQJaRtwSBXf3LkeBTfIrYw==
X-Google-Smtp-Source: APXvYqwi7sfSCd/vbnNO821w/TDC+t8BUGE4AWiH/oHHU4qt6i264xDT0IXdeP1lZo+hczzh2if5iA==
X-Received: by 2002:a1c:ed16:: with SMTP id l22mr10304860wmh.96.1558964348240; 
 Mon, 27 May 2019 06:39:08 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a124sm7838335wmh.3.2019.05.27.06.39.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 06:39:07 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 07/10] ARM: dts: meson8b-odroidc1: update with SPDX Licence
 identifier
Date: Mon, 27 May 2019 15:38:54 +0200
Message-Id: <20190527133857.30108-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527133857.30108-1-narmstrong@baylibre.com>
References: <20190527133857.30108-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_063910_039215_3DFBB207 
X-CRM114-Status: GOOD (  17.88  )
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
 arch/arm/boot/dts/meson8b-odroidc1.dts | 42 +-------------------------
 1 file changed, 1 insertion(+), 41 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index f3ad9397f670..018695b2b83a 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -1,47 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
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
