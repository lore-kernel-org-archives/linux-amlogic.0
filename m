Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2A0C04E87
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:29:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4CD4213F2
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:29:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TXjtjvHe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="J0KpAxRV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4CD4213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BYH+9FEIIl3Ixbpc0WjZNPfLRtacKxYyGlM68k0ISuA=; b=TXjtjvHeK34Flc
	hGUmbNaAastpfEOD+4w1EQH13nLWXz7evxeY5jmUkgUDyyB50WQJVDFdUa1zlVVXPFrdqCT6FfbUj
	Iw8kHy/G3C9GsHoNeNNEa7Vl0Q4fArpD/CCYVW2dZNIeF32rJWJfuX/Y5xsgYRMKXYY9cqnRZp3KS
	R4Ztw71FU41kXRLstks1RFSwjjAi7l7uvMxHEAQB2Lm7UJ0EGoZzVTeFCghlEX6znhk1uBPAWauC5
	8QLGMuOWTU2lR/p59mrimBncY+2P5g/BjzMjTlt2j3EcVKbJLWmojxq3DmiFLx5Dh+50TKma5nqvR
	HN+c8OT8jU5AbNCmH0iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSjHa-0006lE-DG; Mon, 20 May 2019 14:28:54 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSjHX-0006ka-K0
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 14:28:53 +0000
Received: by mail-wm1-x342.google.com with SMTP id f204so13569207wme.0
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 07:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A12cpc+WUhF71aXBZdyNVOx5fCS+Vei2NjBPNK5Pnn0=;
 b=J0KpAxRV6c7LEUvGEfmWqd52V9FoX5XyChfLKAjO9N8Lask56HE52hii+peIuS/TvR
 qei9bPgkPegaYnLdBt7Q72ThAnNKXSbeBV1n9LXvau06nDyMUCJ/j8EtNF/S+HUx7GBz
 PTvBjkeL1IRYjM8OgtccAv6S8uIP1hVbY7A+2NsWYdwi4wVGCAwwwrDrGQZJhBrQxwup
 QEDg8v4UwJCMOBaSyvwqAII9qrGZmbPI3bHFUyRRS0ocV7f7hM4+SXFENg7PjYHKbJOo
 x+Bi8v6wgG6PAqedkhqyOw40xElslb52WKem7eJl4qhv5HhFSXKr+rImqWlxLdCObRog
 Kltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A12cpc+WUhF71aXBZdyNVOx5fCS+Vei2NjBPNK5Pnn0=;
 b=chg8TJtdw3U62Aw0zBZfdkGMdjlFSJIzJEElVZHaDyg9mpB5Sb/hT4pHKd0dBZTTOH
 tNd+BZDrK9IGddJomet6WBzP//gBPqVZJhm9/dYL01QwFcL++zdlbdY2p37hD8Vb++UZ
 6cJYIZDxzlOB2fFJUJDBFJBxrbDA/4nvWgvI1d7KtcygAh+WKECp5446zdbh2M0YvrU5
 tf5grMqeDocN8WAoj/iKbveaD01gQsjasR1MB0rYbcFxwVhqtFvCzodRaJVYlo7NnSJ4
 AavnTwroQXWQMVgfwsrHfaFJLhssMHW0NBVxa5L/8lqK+Sa32X0t4mY20mjUIZQiHOTA
 xEbA==
X-Gm-Message-State: APjAAAVkpRgph93LsmeIqvUoKctJWT0kwW3E9U3msX0VHAW1ycNZalM7
 +Phlr+y++TNz6HS+iFBLbqoaNQ==
X-Google-Smtp-Source: APXvYqyRQP9yJCxY65JkyqLPbCzFVGNKEaUa+r0HJCszmKWVUSyVt6zf/KCdViAxXMq2Oc6MPsJrnA==
X-Received: by 2002:a1c:700b:: with SMTP id l11mr5463602wmc.106.1558362530051; 
 Mon, 20 May 2019 07:28:50 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z74sm154843wmc.2.2019.05.20.07.28.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 07:28:49 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net
Subject: [PATCH] watchdog: meson_wdt: update with SPDX Licence identifier
Date: Mon, 20 May 2019 16:28:47 +0200
Message-Id: <20190520142847.442-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_072851_705910_7F1D3001 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/watchdog/meson_wdt.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/watchdog/meson_wdt.c b/drivers/watchdog/meson_wdt.c
index 01889cef81e1..3389f4c02603 100644
--- a/drivers/watchdog/meson_wdt.c
+++ b/drivers/watchdog/meson_wdt.c
@@ -1,12 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *      Meson Watchdog Driver
  *
  *      Copyright (c) 2014 Carlo Caione
- *
- *      This program is free software; you can redistribute it and/or
- *      modify it under the terms of the GNU General Public License
- *      as published by the Free Software Foundation; either version
- *      2 of the License, or (at your option) any later version.
  */
 
 #include <linux/clk.h>
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
