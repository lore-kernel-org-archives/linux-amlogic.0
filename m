Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32380C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:42:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 030DE204EC
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:42:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wyu7067h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZWCIeJeJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 030DE204EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9SVwVSFeeJ4O6kNH5n2RAboavmI2i9TelQup5iXe88w=; b=Wyu7067hZze016
	fQvG/1gBZRN61BxAyIFZzB7qXIVP6HzcmmRbsy+fUfv1bnab7iu/BbxoncP+8s660+kRSfdUDRbey
	y/3LKA6ah0ldXrMG9XudRrXwIGGvtLEu4HmLKrCcJB3GnE76BM/xNgoAzRwzx+f00kYqbsfhQP2M6
	Alf7U/lBdA/Q4hSy83isaKhYx2KIGNwa66pQW2pXUp3S2FUjhKTX65DRUCyYNGsp2AuBacG8mqdYc
	VXEutYp8/NkQwxJm6qez3Ei9e3B0GCXAjSAFNt1l0arjS2g2Pr0nSdSU9VY6tQ5bMUkOYBmUfNdfa
	tuG/sum+kXma1YRrx9+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVFtC-0006wI-2Z; Mon, 27 May 2019 13:42:10 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVFqJ-0002S0-VH
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 13:39:17 +0000
Received: by mail-wr1-x443.google.com with SMTP id l17so8582373wrm.10
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 06:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6ultmkYjgWhJ/xZHGxkX6N7CA7j/pBGMWJYUycDlyOs=;
 b=ZWCIeJeJ5bbe3QYU5MHYCmvgdOx1CvzmjJ1SIJ+/EfRaQthknG2V3UFeEgwDV42KiD
 ff4floiGIvqL50CVQGqrsv3olYmlrE9/51PBX7UYPNLMjIM3NJ+qWUXUi5LsohTIg6Z+
 yGUKXHKhJw9prtsh8Ke1/bKpxWKdakHKTN+iwno6zEjcmCk/Lrd+Xvme8n/xqqlfNxfp
 ISAAWiimOCHcv1UCmcsfiLCfUMQUZu/vGC14lsyF6Jpgy72LnNb3XrNDIdUbXvkv89S8
 9YbS2dWln5pw869bY5Jeb0YsttYTTBw9ejIyQDiajuEiwQP4lj4nSXvXndViRYBY6PYx
 bXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ultmkYjgWhJ/xZHGxkX6N7CA7j/pBGMWJYUycDlyOs=;
 b=plCifgm86cdJvZgbmzYR38XTM8KnQ0i6T7JZ9qt4lLvAhXz3HQcqsU0diuDUnRdXgp
 lkLBAVMa5yZN7JTRF1/AjH62xJ5lcwREOBC9xPGEg9EowfyK3Y01LeIsqAEuqr64wNTP
 WzBQrpFq5tjPdZ7RNPusQ0pKoC3+B0FwCc1cluIZrUg6P47z10V5O//cKUWvUWVSGnhL
 Uf7x0OLUhoJuLr6CIgUDl9GxFIYdkH68qaCGTTzreEZSNgI7gPdX/9JUNiOJYefyqtIM
 HWSyhKQIxLUrART4Vi///91yuhwAAfLKQr5u4zkxyA8M5Fq2196WX/dV3CBzvv0aVUun
 5a7w==
X-Gm-Message-State: APjAAAV/idYslOS2YFx0Squ4R+pgrQopKBIeRPOA0pOlLdxuzeUunMOw
 egC0LnyMBBDEyiAjeHJ/3sW+ag==
X-Google-Smtp-Source: APXvYqx24uqW1qXuZFPiiToIbx1locFeLMf7EvNsEfe3TjVzFZkOove/54wDfLTO4gRyDSMZlztdgA==
X-Received: by 2002:adf:e301:: with SMTP id b1mr10932162wrj.304.1558964350293; 
 Mon, 27 May 2019 06:39:10 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a124sm7838335wmh.3.2019.05.27.06.39.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 06:39:09 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 09/10] ARM: debug: meson.S: update with SPDX Licence
 identifier
Date: Mon, 27 May 2019 15:38:56 +0200
Message-Id: <20190527133857.30108-10-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527133857.30108-1-narmstrong@baylibre.com>
References: <20190527133857.30108-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_063912_184264_6426E031 
X-CRM114-Status: GOOD (  10.66  )
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
 arch/arm/include/debug/meson.S | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/include/debug/meson.S b/arch/arm/include/debug/meson.S
index 1bae99bf6f11..df158693a327 100644
--- a/arch/arm/include/debug/meson.S
+++ b/arch/arm/include/debug/meson.S
@@ -1,10 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2014 Carlo Caione
  * Carlo Caione <carlo@caione.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #define MESON_AO_UART_WFIFO		0x0
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
