Return-Path: <SRS0=x061=OP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2467CC65BAF
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Dec 2018 15:19:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E94C520700
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Dec 2018 15:19:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iSwS3Kjd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="c+bM7IaW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E94C520700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BvFUV4JUybr8vE1dOuX/tpcJfF6dcuKTxCxL/71R+bk=; b=iSwS3KjdP5AvRA
	2AhBJjs7tS4qLiwre99sisWk1q5jwNyFIsIfPfjONkk0eKNR6hjhLRv+aV0s5I3i2GYY3onYQtmqN
	88zZ3sWc9n5NjVkWyY41TQ7jDKNYLXlN2bJ2p7BdO+d1yZSq8Qkyx/jcpMYXJOOwxrZ9BRFX5zoiI
	nOqYy9y1xd3hcgaTjXydP6csiyx738tH9meMjIz1y7bqmanxFa7F8obpbwynRr2NUQwAXXgyRp4bw
	nqz+U9HuJvYebU8PKPO1sQOrrSDeU0BXXNfI2clVOGdd0N+jVwMOv6bbG1E8z0UgVu0fgGGr9yDCC
	MsCyBl//wDQBxYseYnDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUvQZ-0008Kn-Qd; Thu, 06 Dec 2018 15:18:59 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUvQS-00089k-94
 for linux-amlogic@lists.infradead.org; Thu, 06 Dec 2018 15:18:58 +0000
Received: by mail-wm1-x342.google.com with SMTP id a18so1462395wmj.1
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Dec 2018 07:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y7CGHPuU0cKd8uxanXCkssfy7HoOVVH2fzqpoBO3MJk=;
 b=c+bM7IaWZi1H/3FYMQILbAyq3SkhW7Uih01O/P0gAfzhOuiZ5bnjA7L7I8NlwiHI/h
 H3OzC5LtUaJ3Tt+AqTqgP6zvsv3H3STi6sCHOoc3iiUkw9VJrjD4nw/ljk7rlFdYfZPZ
 n9lPPlK5rN0Rt2KtNVt7DMayET1i97tQKB+A5OnowPY5mN2MIKF5C1RarI4cDEb+fwkb
 IkTZ+bGtP7E5G0DsA5fVu/lPbzIQ+6aL4I1rL7Nn9MWo8aAK30cScv/o+rlOFACB4wVa
 8Gbqh2mm58L1zsQhs1IgVCxGbY17DH2CUdB7UUG5H4rwVYbzRKmnjuPV8alx7YokJN9m
 wi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y7CGHPuU0cKd8uxanXCkssfy7HoOVVH2fzqpoBO3MJk=;
 b=eJgqyoloLdn7rdiv3g//Y9/rWphsvZpvJBw9KBJdGFe4tZ9XdxmOu5S6G82JQVVa0E
 nT2s0/Gl4+T5ZT0GKIayRaQ84Gz4nJLEhVYNYTX/3c9li4RiAtoFiaZaC8PxblBH/YjM
 CnICkjw7arfbPcO6o19zmpWHDdNdZQP68w3FIuB6wQdIyTvT3gnSW6HFTOTa1xKEXicw
 Qvqt1TuCQQoPfSM4uCVI1V6QqU72K1zdPlKLPDi1i1sRbdiOmli9mYM6PjNGFtIdceZh
 Ate8MGfc0+/9GJOZJXhJYqwiPUu77NZjJbYo4HxdkEkWPe7om7L3ZAzqzllfk5e0Ohwc
 zrJQ==
X-Gm-Message-State: AA+aEWYCUml4BbEl+5Ql3/dcIGtVTHBAENd0wA7JxO6a9vS5idj5UpF/
 ILhpZ+b42I/DuTCeE+Y6O2/6tg==
X-Google-Smtp-Source: AFSGD/Xv9y5Gp69PrLbFCQosYzPu0t940Sru5qC/QjA70Z1iyheNfOgkmA5JlbjaAS+UP/JrjTlFjw==
X-Received: by 2002:a7b:c1d7:: with SMTP id a23mr19076799wmj.48.1544109519103; 
 Thu, 06 Dec 2018 07:18:39 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id j33sm939652wre.91.2018.12.06.07.18.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Dec 2018 07:18:38 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Carlo Caione <carlo@caione.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/4] mmc: meson-gx: remove useless lock
Date: Thu,  6 Dec 2018 16:18:26 +0100
Message-Id: <20181206151828.24417-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181206151828.24417-1-jbrunet@baylibre.com>
References: <20181206151828.24417-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_071852_574957_0B4AC0C7 
X-CRM114-Status: GOOD (  10.77  )
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

The spinlock is only used within the irq handler so it does not
seem very useful.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index fcb5d693c897..5cc31e434ca1 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -26,7 +26,6 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/ioport.h>
-#include <linux/spinlock.h>
 #include <linux/dma-mapping.h>
 #include <linux/mmc/host.h>
 #include <linux/mmc/mmc.h>
@@ -159,7 +158,6 @@ struct meson_host {
 	struct	mmc_host	*mmc;
 	struct	mmc_command	*cmd;
 
-	spinlock_t lock;
 	void __iomem *regs;
 	struct clk *core_clk;
 	struct clk *mmc_clk;
@@ -1040,8 +1038,6 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 	if (WARN_ON(!host) || WARN_ON(!host->cmd))
 		return IRQ_NONE;
 
-	spin_lock(&host->lock);
-
 	cmd = host->cmd;
 	data = cmd->data;
 	cmd->error = 0;
@@ -1091,7 +1087,6 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 	if (ret == IRQ_HANDLED)
 		meson_mmc_request_done(host->mmc, cmd->mrq);
 
-	spin_unlock(&host->lock);
 	return ret;
 }
 
@@ -1244,8 +1239,6 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	host->dev = &pdev->dev;
 	dev_set_drvdata(&pdev->dev, host);
 
-	spin_lock_init(&host->lock);
-
 	/* Get regulators and the supported OCR mask */
 	host->vqmmc_enabled = false;
 	ret = mmc_regulator_get_supply(mmc);
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
