Return-Path: <SRS0=RDff=ST=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8955EC282DD
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Apr 2019 20:44:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 570752186A
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Apr 2019 20:44:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QaeYngX+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1FR1Pacd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 570752186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZCEOZocmVwW7Fo8dTE6YFf+q9ZerUqg+XxRRKvdIos=; b=QaeYngX+85dnw2
	gKinX4/NXDMGGx7Tc7u2pyoWJ8tRiq3xj5bFksCFvFAL+vskrIAUP/as/QDTxBaVFXBVb6qWA6eH4
	inkIQn32NGRfIYoQGxlUlQ28En9eOkNdEyWio2GA6JrUEk3SHY+2pLEQ4ITwKIQGT437Yi25UJoin
	ccsTZOncszjkXPVNoCE1UqapxL3aQ7INjUvQIToUAQWqXsLO9Y7e5CvG7R2GnFvXIzejCgQlKLR4+
	SYCdB8IcaYfwTK+6Av/MCFayePCwmMyxk49QOSInCaXDu/IblKIAUonskOreyNjm158ethR+rMsbZ
	JXY8l/q6Mx2HaDT+xZEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGrPl-0002Jf-4n; Wed, 17 Apr 2019 20:44:17 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGrPe-0002FH-2R
 for linux-amlogic@lists.infradead.org; Wed, 17 Apr 2019 20:44:12 +0000
Received: by mail-wr1-x443.google.com with SMTP id w18so58568wrv.11
 for <linux-amlogic@lists.infradead.org>; Wed, 17 Apr 2019 13:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w1pW48pbPFvZbhJkwoKxPVapl0Fl2yGEGKo5zLNjkdw=;
 b=1FR1PacdQ8mXv9C6T5DTFoe3CVzRscWQE+uxrgdsEaoShIulc95xQsIdTtKd4DRjVh
 YfDkUPGVLcUqjHjGOxa2185xMmiynn9EtcSKFTrdsFr6nGbkxA8kwjSdoxpFe52SameY
 kuP+Dd1oiemB0n54v87R6G8RsmvOaFmlk7jJ06iI2/zEbwJfEW1nB769d5Iak0qDoA3x
 uSiYL/84ZjyJl9rwuRAnUm0CsKshLzCJDmk36XpZXkvzEM1pVF8640JGfYPfk1UwwC/z
 aBzawWLceIRetZFlOX31z98w4/Z79krvDvlVF+GGx30O1svCVNDyBvP2BfJ9suZ2Yk/r
 YNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w1pW48pbPFvZbhJkwoKxPVapl0Fl2yGEGKo5zLNjkdw=;
 b=nwfEp5YRSa513cU0DdAD3z04sd0nHip+NZEu1ufOtb7xuiyanETJO91MJoZxWzx3HT
 PTGJMuoHDk+Soah7+LpUBTSZhf9bTFLhJ4KI0Gp6bAs+N1HY/0QgA03v+SFZd4/JU5cR
 Vc6LNXeU/pSmkiNFo6lJYuPtf95xK84Y8uvFMOP8o7N97yIPqOSq0ow7s+6l/VQwG50k
 D2UKfOIXA3qS8SMhHQFQGUD3kqgROmiFC9c2eaX49LOIcA0KVl/4OSOkOb+FkbnhEtp2
 5Jm0F8LEwCMHerAODIiFvMp/WsQ/LmI5ZW/+6+aWmwU5K0qlXB8QfQFvrRUibGh86NVI
 OwhQ==
X-Gm-Message-State: APjAAAULSLN6gcH7MIqbFXUOqdNOlPtVbv9ARTGC3iC54nB8C2ZcBv++
 u9JfbPAlITjw77I5Z6I+xasUmQ==
X-Google-Smtp-Source: APXvYqwOyBI7s6NDYfn2VcQR5FZQWq1it2JvaM9jhBEKRlph/3LQeQNCx7QJSL/ufohtL9AfyEKTdw==
X-Received: by 2002:adf:fe4d:: with SMTP id m13mr61038475wrs.267.1555533848824; 
 Wed, 17 Apr 2019 13:44:08 -0700 (PDT)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id c20sm98716866wre.28.2019.04.17.13.44.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 17 Apr 2019 13:44:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/7] mmc: meson-gx: ack only raised irq
Date: Wed, 17 Apr 2019 22:43:50 +0200
Message-Id: <20190417204355.469-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190417204355.469-1-jbrunet@baylibre.com>
References: <20190417204355.469-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_134410_106545_B969678D 
X-CRM114-Status: GOOD (  12.27  )
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
