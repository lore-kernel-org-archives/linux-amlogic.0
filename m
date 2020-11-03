Return-Path: <SRS0=c+5b=EJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD49CC388F2
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2020 03:48:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 957B121556
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2020 03:48:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y+RpwrNe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 957B121556
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z551YG1jhMacOmVno2qhJaLi8AjRhwt6ECFSV64TIFU=; b=Y+RpwrNeACwlCK2jHPHAUWQW5h
	PKfSHJYkKA6d1rH013+djT+YiDjHocKrcgAF2BBixLsdL4/aIWFa+2TvcPs7Ofrw3poC+Ba+kMOcJ
	hDU6Iw54+CBHfzoz4NTuc2InBiFemGXAQyqMWn7B5PTe6nfnJjgrUS8OfiRY72uKHAX/W8n4tO/By
	p2Hk7mIW+L4qjGW2V4NPBVDMv7wjxooDzDafZBYcK0Qh7/66MQl3PEuNBrSPE0/Hr3SLmRCNyIobF
	d17OGJrg4FzbWsnICm86c+HOEdl0dmriX/i8Q9hZjeRIYVzcMR66tM+0lJ6RTgujHy0IaNrZZncuC
	4R8c99JQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZnJD-0000LL-SN; Tue, 03 Nov 2020 03:48:35 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZnJ9-0000FG-8p; Tue, 03 Nov 2020 03:48:33 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CQG2v6hGCzhfcD;
 Tue,  3 Nov 2020 11:48:07 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Tue, 3 Nov 2020 11:48:08 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <ulf.hansson@linaro.org>, <khilman@baylibre.com>,
 <narmstrong@baylibre.com>, <jbrunet@baylibre.com>,
 <martin.blumenstingl@googlemail.com>, <linux-mmc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] mmc: meson-mx-sdio: replace spin_lock_irqsave by spin_lock in
 hard IRQ
Date: Tue, 3 Nov 2020 11:48:43 +0800
Message-ID: <1604375323-33556-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_224832_611109_6189862A 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The code has been in a irq-disabled context since it is hard IRQ. There
is no necessity to do it again.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/mmc/host/meson-mx-sdio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
index 1c5299c..d4a4891 100644
--- a/drivers/mmc/host/meson-mx-sdio.c
+++ b/drivers/mmc/host/meson-mx-sdio.c
@@ -418,10 +418,9 @@ static irqreturn_t meson_mx_mmc_irq(int irq, void *data)
 {
 	struct meson_mx_mmc_host *host = (void *) data;
 	u32 irqs, send;
-	unsigned long irqflags;
 	irqreturn_t ret;
 
-	spin_lock_irqsave(&host->irq_lock, irqflags);
+	spin_lock(&host->irq_lock);
 
 	irqs = readl(host->base + MESON_MX_SDIO_IRQS);
 	send = readl(host->base + MESON_MX_SDIO_SEND);
@@ -434,7 +433,7 @@ static irqreturn_t meson_mx_mmc_irq(int irq, void *data)
 	/* finally ACK all pending interrupts */
 	writel(irqs, host->base + MESON_MX_SDIO_IRQS);
 
-	spin_unlock_irqrestore(&host->irq_lock, irqflags);
+	spin_unlock(&host->irq_lock);
 
 	return ret;
 }
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
