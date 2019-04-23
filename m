Return-Path: <SRS0=V5Bc=SZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC69C282E3
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:02:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B5A520674
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:02:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bQKbg26G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0CRtXmBu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B5A520674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZCEOZocmVwW7Fo8dTE6YFf+q9ZerUqg+XxRRKvdIos=; b=bQKbg26GdyBama
	9woA2JqKjGmSr8VktitT0WkNUbYyRHbRF6CRBJt92a5ANBYKL1j4twThCcIMZf1gIvHi1nMPEOPB0
	8mobuc03bo9DPs5+1txiaRDEuYx8zPNsoK/6YVn33EnkFZ4HBGwsePpz/1oTWbYKaReUbh0WyrALY
	QmCXd47l6GJqrB83xiRO4C2Y5hYeWwEVqkYvffccHhseEnboFK3hk+JkaLbtE+iI/bNnz1a+L09DS
	O9YZB+V/jINNvA6eqkh9rrxU18sD4y3CciImt3VFL6Fuod8s2OGSFPSLuQjAw/tc3hfev6j9kX+VH
	6j5fpKvx+RUk0zBlfp2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIrKH-0005gN-Cn; Tue, 23 Apr 2019 09:02:53 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIrKC-0005cE-Fc
 for linux-amlogic@lists.infradead.org; Tue, 23 Apr 2019 09:02:49 +0000
Received: by mail-wm1-x344.google.com with SMTP id z24so17908205wmi.5
 for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2019 02:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w1pW48pbPFvZbhJkwoKxPVapl0Fl2yGEGKo5zLNjkdw=;
 b=0CRtXmBu8o8LrKmAYE/sKRtheqjZAWj3UgypeINdpuSrpGNjH3EQKerJ+HyxR/+FTG
 Zp5uBMcs29yn/DaNQUqyYDg/IkVtX4U/o7gddZfA9w/7rS6uCFRnJ2s2ubM8u30AGIi2
 clgE2Gwb8zHddinILtYdLIce/IiGEU68JPc2mZVYXnsPx1kwuNJDWDfDmWdh9Qqy/hdV
 F3617T0lI1T+MlUHawgS2qHBdqSYcIX8t9GSHuQNXtmDqF1dp328G+t/YcxMGZ1pDlvG
 Ac4kyDTTAugznAgDZXTKGRnVqxV1RPTHDaxU4CK5ZCNg6LPpLcxISp8yVsyv//Dz+hYE
 RRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w1pW48pbPFvZbhJkwoKxPVapl0Fl2yGEGKo5zLNjkdw=;
 b=oRa78Qd2NcB/MGCEp9Wv4kPPi5As9gyUHtsn1ONrNchZo5lRb9VuVFPEZIXxPvJS0f
 Ih164lWRvRXejTlEqqhLNp4s7I7ouMDu59lVJVu2UMdUcXH2IfhhY28bHG6zmL9YsBAN
 XJkW+SSlBMXYphYaoS07jN/lk6sNi/rSoo7ej8bhdfjL4vB9/j4qn6s/KvmZKMn/gM5U
 fcM/07vhaLQX1jCLv8ybtsjenKSeJzWTwIDarFOMUOVdpEwHGR2csWvzpDWB/jP0Ob6o
 kEqx3MmEq5qeQw+9x1mjlFcAx9PuaBXWvtknHrKpun+yqHjb0adYN0QQE9XVDj8cIX3p
 qGPg==
X-Gm-Message-State: APjAAAVb4K/ZXO0WpTD9qcvVkHhyJxLMU9WGOaPbr8qANh5AZRuYHPLo
 iFt9i4AUVXu6x8HwCjejnRmo8w==
X-Google-Smtp-Source: APXvYqzzCOMdrBdPKyxxoS08iD+SgVF4LB7GCWsEcXJzhUb9nTV15PQBVCPQPfVbUfx6P2sVdCaUtQ==
X-Received: by 2002:a7b:c1cf:: with SMTP id a15mr1556030wmj.44.1556010166990; 
 Tue, 23 Apr 2019 02:02:46 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z23sm12361894wma.0.2019.04.23.02.02.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Apr 2019 02:02:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 2/7] mmc: meson-gx: ack only raised irq
Date: Tue, 23 Apr 2019 11:02:30 +0200
Message-Id: <20190423090235.17244-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190423090235.17244-1-jbrunet@baylibre.com>
References: <20190423090235.17244-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_020248_515312_95B1BECD 
X-CRM114-Status: GOOD (  12.26  )
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
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is merely a clean up. It makes sense to only ack raised irqs
instead of acking everything all the time.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 2deeacc051b1..8b690ecde4c5 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -1082,9 +1082,6 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 	}
 
 out:
-	/* ack all enabled interrupts */
-	writel(irq_en, host->regs + SD_EMMC_STATUS);
-
 	if (cmd->error) {
 		/* Stop desc in case of errors */
 		u32 start = readl(host->regs + SD_EMMC_START);
@@ -1096,6 +1093,9 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 	if (ret == IRQ_HANDLED)
 		meson_mmc_request_done(host->mmc, cmd->mrq);
 
+	/* ack all raised interrupts */
+	writel(status, host->regs + SD_EMMC_STATUS);
+
 	return ret;
 }
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
