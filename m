Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DF2C04E87
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:42:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B64392054F
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:42:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UkMYg3gi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GL1kPF/z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B64392054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TzDsXPUNu5s4K2JTKUaQfX2Y8JVzLyGrdkYXCG1lDJ0=; b=UkMYg3gildjQl/
	woYvkUOPkDPrCby6Px22sv1dSWueEAZN8nOQ8dBKvNvDIPyUtV8bHEypof8VMNEa7fannvCIGaRBA
	6tFBQm9gpZQyYD1kze8IE+tHkqM1mSfETMerHV1071pNf7kxNwR6ZktJU7dtlaPlaVse454Zc1Ab9
	nTzyOczPLMQoWimWa+wGkYbpo2NztTCHfbdbiVkSdYSih5mWcisfTTPssi7z+GORJ1HQgjMalPf67
	/CfTKzthmPVpGYGMGTtt7H+z38CTWb21R/cKZGC9f1Yf18KFvERLLVcIICaOPPYOxdAFAD54Cdm8Z
	QJvCWSdc8oa0aYndal8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSjUt-0004R4-Qy; Mon, 20 May 2019 14:42:39 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSjTi-0002qg-AD
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 14:41:35 +0000
Received: by mail-wr1-x444.google.com with SMTP id r7so14873096wrr.13
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 07:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eyDz/kU6Wjim2biRU2q8CqgWCCB8KF6iAcPXPEhI4iE=;
 b=GL1kPF/zUzZXKB5Un27WiEJQ0HNwcqqnlgkMiO94zM4OnjMJI1m+TNzvxK4Yn+Gx/8
 5O8+gBuLemwUJVEipgg/GahnWgcjh0WLtWb0wr61aGUmUtQopw70+M3+d5YBam07vBvP
 ooVf8RaJCsspmSiwvNglwLoisdmIU4WgXxqjHO3jt/BzyV0M4bBrMlx7gLFStGfEPh8k
 FP6DpQyiBbQf80owDtMzoOOv0DRnv/0FMnhZUSG8Dn9+Dwucxn9Xotr9GoZ9AzOJ/Fte
 a7SJQMwvLQPrdlFVrmy02dW86PGusTvFGXn0n8frBI/zylHHeuBpPZG9eloWHuoydEm6
 8KPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eyDz/kU6Wjim2biRU2q8CqgWCCB8KF6iAcPXPEhI4iE=;
 b=RA8caSawuQg/XHP130JolLUdOIL02R9B94dCWUoCV45pAS6a1ZulBRUh5K85TOVdjz
 WAfZ4KV6PQQjFur0gbg8zFA8XR3fzKDU9PHigKTYPP4Gw1rNmI3UMQXCTFUYQAV2AdmN
 ezIXTF7DbwqD0mRSQk4d55XdnDuDpOc19mKDhNSYNuR4RXx1AaS0mNSdgQKKD2zfoUk6
 Oyq7cQlEJ2o9FSOPusydnbvuZxPR0WNN7qiKcDLeIO2/ZLW/Ob4wEoFPBFN/bn+vemLq
 atJT7p2JdXuIC5igYOdwltbMY2MlVsJFR/lNmHak703/pBMRm50s1+GJm906jyNv4jDj
 a4DA==
X-Gm-Message-State: APjAAAWTSqG84etmSy0YEW2z3DpWg1h1f1MnH1QUjmJ2TinNVAENH+hG
 CmV3KK00T2F/YnpfbpXRT1KHBg==
X-Google-Smtp-Source: APXvYqwNFE1d2hRxTr4yNHyu/Qt22C88efwwzfb2tPMpnZSFiu3ODusoG5pkwtkQFTWj5bADDe/gBw==
X-Received: by 2002:adf:ec8c:: with SMTP id z12mr36194064wrn.209.1558363284655; 
 Mon, 20 May 2019 07:41:24 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id w3sm6743679wrv.25.2019.05.20.07.41.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 07:41:23 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linus.walleij@linaro.org
Subject: [PATCH 5/5] dt-bindings: gpio: meson8b-gpio: update with SPDX Licence
 identifier
Date: Mon, 20 May 2019 16:41:08 +0200
Message-Id: <20190520144108.3787-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520144108.3787-1-narmstrong@baylibre.com>
References: <20190520144108.3787-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_074126_474367_BD0EBF1F 
X-CRM114-Status: GOOD (  10.72  )
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
Cc: linux-gpio@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/gpio/meson8b-gpio.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/dt-bindings/gpio/meson8b-gpio.h b/include/dt-bindings/gpio/meson8b-gpio.h
index bf0d76fa0e7b..e75d09b6087b 100644
--- a/include/dt-bindings/gpio/meson8b-gpio.h
+++ b/include/dt-bindings/gpio/meson8b-gpio.h
@@ -1,15 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * GPIO definitions for Amlogic Meson8b SoCs
  *
  * Copyright (C) 2015 Endless Mobile, Inc.
  * Author: Carlo Caione <carlo@endlessm.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef _DT_BINDINGS_MESON8B_GPIO_H
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
