Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F3AC07542
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:41:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32DAB2081C
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:41:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uFicL7SW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VLPx/fvs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="di7iNvnu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32DAB2081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/yogUSIuqMKPkV6KwTQ6D0HZ+4AQSpIM/YZ6bMQgpHI=; b=uFicL7SWBoANAb
	7SEWRZ3rZy6xL8EQ8KWABviqPsLHExcCkwToV/jBT6U+aZbre0kdQuiKpuSUEwlsGfR5ADS2qWpWI
	xIAjxp0S1zaeDBAba0U+Ft6THDZplD/8/JWjvQXFZ8ywgkGeJ50IQsvb4Em9zQl4Qxo/NgE9dG2Qj
	h6U4GpS3A/3pSV9x5GK0Y+zVwNMPevFCvucvzFt83Zr4rQYQUdJgcNMBGPuC0xi82P37NWFem6MXy
	nqHNr0Wy5d1IlnEMhvhizEOrrdDjyQY9kd41JQg84yheI+hQOhzzUYyzh8NO8wttlb/CG8gzB9nQG
	qX9IGzpN6hMOkk3s1MvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVFsC-0005rG-Lp; Mon, 27 May 2019 13:41:08 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVFqT-0002Z6-13
 for linux-amlogic@bombadil.infradead.org; Mon, 27 May 2019 13:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=verJ2TtoOCB8JmW8F70UDjfoCp/cGBMV0EuzVh2W1as=; b=VLPx/fvsT7xxdNEbfwzPiMuT2S
 obnfbq9fmUYQTuFGWXFIMZnVkaaChsbHxYT7zW1JHoFaRrD+Pon29b+p/n0mpVpceY0ZLMNN2a44P
 c3fDSO8kVSF16Nr4bOIaTkH4jbDoIuDij6dxL5iQTTTMast16E5ub4cowocYbidzYqs0/Ds12zjIM
 0Dk0cPuciMYMBLAIoqCjRv6rjZzq4gMq/JeW4FBitccCWPEo9B4CEE1IfN+EMlarjoGXD42T9Ukl8
 8uDFJ7p68DHHgYGWb9CvDEr+Jr/mRlnJiA+oJa2raLlFBuKUZIIO/18fTyVY9zcKZ3yzftoas/LSt
 GLaUPQeg==;
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVFqM-0003Yz-Ds
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 13:39:19 +0000
Received: by mail-wm1-x343.google.com with SMTP id w9so9778730wmi.0
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 06:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=verJ2TtoOCB8JmW8F70UDjfoCp/cGBMV0EuzVh2W1as=;
 b=di7iNvnui7FhLrNe5R7wm7HudrjyzbQi94oSfDaZu4LWq8akC9LiUFa+RHumrQcLEA
 aOhH7queUJ9e0VbTh3LORPtzI+VWRq31fSwU0hCvOI554q1EXtLsxaWBRmo1x4ppmDDJ
 +EIncHx/MDk0NuxHkyPuaStxM7Xfps2rGWP2k1fzRoWucdDtkJkpH6l9GfqtHIL5DdLq
 XcImVYBi13I+SG39PDvZ8rfaxadr03MA/ZfHVK6LHCCmX2mpqy1TJZrchrtOCMx6K6JZ
 DoFLVeVGp8SpmASbDcXGj9Xba7xZIn76sb2s9BKmDFbxnIaVlbLABt57dYK7QzKaF4tV
 YCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=verJ2TtoOCB8JmW8F70UDjfoCp/cGBMV0EuzVh2W1as=;
 b=ht1IqZm/sirCO+QOW5FDaaZfJqJApfXbnsWRuVq1OTRKOxVoQmMQUKpataVf+/9s79
 cep2+B45INcqtptz6z9b9BSDQr4L0fctLFJ2B6jbYG+l0fzctQYzRySeKpiwqSfvRftR
 v00rQj1N4QzyRpadGKk1+xZeLQfEM2qNteuo89w+HJPEmwWi1lRzJ8I2BBnal9Vzle4i
 PypvrrrZPbX883PwZwtnIzvPADJL5mPqCDhcU/SzCBHLLyeTSeGFbBzvZVyzWeIuP1iU
 5zi7osEq4GxO986Wtt5rtB2MIS74qufUi8+Ue6Z2Pcv5WY2E7jsF2eSIAeFpelzsoRx1
 XcvA==
X-Gm-Message-State: APjAAAUgzhlRTdnxxKdAqh5xmk8HEU8rBCst7cvmZ6yTqq8ghONbFb2q
 kEY5gCMU0M6gSRJPE8NL/5WMgQ==
X-Google-Smtp-Source: APXvYqyd/kK2slKqdVMOm7do4U1lyX83rjJItaXdUFe1Fo2m7B4apmdNOOZfK2IQ34qBHCqw24Uajg==
X-Received: by 2002:a7b:c3c3:: with SMTP id t3mr27136443wmj.88.1558964349041; 
 Mon, 27 May 2019 06:39:09 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a124sm7838335wmh.3.2019.05.27.06.39.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 06:39:08 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 08/10] ARM: dts: meson8b: update with SPDX Licence
 identifier
Date: Mon, 27 May 2019 15:38:55 +0200
Message-Id: <20190527133857.30108-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527133857.30108-1-narmstrong@baylibre.com>
References: <20190527133857.30108-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_093914_483256_A65FF5E9 
X-CRM114-Status: GOOD (  18.36  )
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
 arch/arm/boot/dts/meson8b.dtsi | 42 +---------------------------------
 1 file changed, 1 insertion(+), 41 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 800cd65fc50a..6e48182962de 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
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
 
 #include <dt-bindings/clock/meson8b-clkc.h>
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
