Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEDCCC04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:39:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87DB520859
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:39:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ljSB0R3n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Q+l/PHhG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87DB520859
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TEW8iQzldp94EyBNAX/s24sO+0+XVPa3Zxin3A/1rXc=; b=ljSB0R3nCt3xDe
	Z1PxNFi1ud7h7cbmquVwWRfTB37eP59Ci27ZC+KGTsRmo6oBedP86TML8Gv3QJkGVAcwA9I6UTAvS
	ShSp6W+Np4InPOFdXUMcWn3E6gTc68uUxnonZyeZy/K+Pq3VeM47Gj0eS26AXxxr/ZR/w2Swh8WbA
	EV/StLcx54C4nJE0oqvbRLaf4DkVWxmL3eRL+a7u3uxCM7S1Ram3f/rvm+FksC7oQcBW1onDIuNsW
	3aRV3p+PlgLYe4gbvAhLoFeXMK3jizaMtOeSKnAS8sS+EI2bsen6lPo1QTEwB4S3U8gW5j2FxMaox
	rBWxvC6pfDvD4idlQiTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVFqZ-0002iL-EK; Mon, 27 May 2019 13:39:27 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVFqC-0002FM-Pn
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 13:39:10 +0000
Received: by mail-wm1-x344.google.com with SMTP id i3so16194081wml.4
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 06:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rXvaj3vUDYa9PEjMxbjGSAemm+pe/cxaMoF6H3fQNUY=;
 b=Q+l/PHhGVu51hTqZYdAfAdFQSOivF3m2nfu/Y1lh6dSmHYVjPpAtM9SppJmt36DwiS
 8e+PHIw8Hd1PNm4RtvY3Q8VQnLCVCzFu7Q7C3qaD3UCvI43VAhlw/YgOx+FyK9C8z9ZG
 tEajQcG1cPZ3cgfc4lCGbI3SfxBm+9kOgxvWrwp4CLqMDycJ9w6hMpLF3ki9Oy6sjdFR
 MtPRxPUafv20m4UZNN6pYh2n4jTPODTNe6PFv9kdiP2x7016xNsTa1emET1RlM7QvWFt
 S1R1+xBQYar0c9TjabnpI/uf2N+qr7k38vBef+DFHUa7EBRqtlREf4tBuPKHZaBDJzFf
 pfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rXvaj3vUDYa9PEjMxbjGSAemm+pe/cxaMoF6H3fQNUY=;
 b=k7kTln3f51svX8+tLNsdPOrFXLi1rhhyAeoggjIx35M1Whua+gzQf4bEeqedCfrfHF
 fgKsOkUWDvTXJs23bieW/dehFnNjXmGcFdH8vdBErINXk9zJa/AwQqh0tCq7X0oLmevv
 xE/D7HYeAw5sPEJp4E7Eocz1M4q91DRmaCd6X7vH5MzAW/Wmfi4numoIMRU1Y6CxKsyx
 +AMspi6uptQj5aYWFKry51O906k3TzbaFPcpWqAwWB5NIDb4ga61ntq/+3KV6XC5wrX3
 RUjujXgOi8ndoq02eflxP0HqfeqxAlDxcGGeAsuFQn4y/TkhlrxbxOVntO20NzaUGToP
 LYbA==
X-Gm-Message-State: APjAAAWz90UMtAZvZA/SYkWnhEP2Wgh7A7Cp0KxUEBMS8c8ltYYEThim
 X+qmIpQ+KNDzrmq1qVXjapnOug==
X-Google-Smtp-Source: APXvYqxE4aKHzOrcgMiwac+ZfptW5NzdYTrUzpPpU/O+y1MWCV9kobFuWkgBeYF0aTGmeExPm8e1Vw==
X-Received: by 2002:a7b:c442:: with SMTP id l2mr10420507wmi.50.1558964342824; 
 Mon, 27 May 2019 06:39:02 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a124sm7838335wmh.3.2019.05.27.06.39.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 06:39:02 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 02/10] ARM: dts: meson6-atv1200: update with SPDX Licence
 identifier
Date: Mon, 27 May 2019 15:38:49 +0200
Message-Id: <20190527133857.30108-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527133857.30108-1-narmstrong@baylibre.com>
References: <20190527133857.30108-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_063905_125968_DD16FC17 
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
 arch/arm/boot/dts/meson6-atv1200.dts | 44 +---------------------------
 1 file changed, 1 insertion(+), 43 deletions(-)

diff --git a/arch/arm/boot/dts/meson6-atv1200.dts b/arch/arm/boot/dts/meson6-atv1200.dts
index 997e69c5963e..98e1c94c0261 100644
--- a/arch/arm/boot/dts/meson6-atv1200.dts
+++ b/arch/arm/boot/dts/meson6-atv1200.dts
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
 
 /dts-v1/;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
