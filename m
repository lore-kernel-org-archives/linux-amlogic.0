Return-Path: <SRS0=PfKa=NX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D29EC432BE
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Sep 2021 05:54:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29DB160F92
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Sep 2021 05:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 29DB160F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3QBqI7NOGxHuKJhcSQB1FzKpzR4kn65cNW9+ihrhyxY=; b=RcD3jRh6sg5Lnt
	wXzy+c8xlhpLl5+4k9xnfBB2p2VYH9hruoE8OP4GOdre7Sxn1nJkMSP5Qy1PZBkYvInidZVm4d7y9
	kboNTf8LynwBZ1L79rzOyVV/5ZiVuv1vkxImFaX/PkvpZuDHKWXf6DAirsMlS5y/1waVpHZJ86/DI
	uvrZw6LuD+C+6cVbOeKpecG/7l2leuAGLaEAv0+PTzoyagaSkvx5F4kZyvwrDwIBPIBWcTTrf3Qhi
	5ZIV4SH++VJaFPPOX/oZlROD0RZEcsx5R09ARYM3DM+KL1ahdGObbo4uAlHdFbYspFbPCCH5fz1+0
	m/8BWGHG9wTVzg9horCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLJCr-0040bp-7A; Wed, 01 Sep 2021 05:54:41 +0000
Received: from mx21.baidu.com ([220.181.3.85] helo=baidu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLJAK-003zkw-88; Wed, 01 Sep 2021 05:52:12 +0000
Received: from BJHW-MAIL-EX04.internal.baidu.com (unknown [10.127.64.14])
 by Forcepoint Email with ESMTPS id 4258482CCF91A08B4800;
 Wed,  1 Sep 2021 13:52:01 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-MAIL-EX04.internal.baidu.com (10.127.64.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:52:01 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:52:00 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Neil Armstrong <narmstrong@baylibre.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <linux-media@vger.kernel.org>,
 <linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: meson: ge2d: Make use of the helper function
 devm_platform_ioremap_resource()
Date: Wed, 1 Sep 2021 13:51:54 +0800
Message-ID: <20210901055154.6829-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex11.internal.baidu.com (10.127.64.34) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_225205_445224_8983EC56 
X-CRM114-Status: GOOD (  10.00  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
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

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/media/platform/meson/ge2d/ge2d.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/meson/ge2d/ge2d.c b/drivers/media/platform/meson/ge2d/ge2d.c
index 9b1e973e78da..ccda18e5a377 100644
--- a/drivers/media/platform/meson/ge2d/ge2d.c
+++ b/drivers/media/platform/meson/ge2d/ge2d.c
@@ -922,7 +922,6 @@ static int ge2d_probe(struct platform_device *pdev)
 	struct reset_control *rst;
 	struct video_device *vfd;
 	struct meson_ge2d *ge2d;
-	struct resource *res;
 	void __iomem *regs;
 	int ret = 0;
 	int irq;
@@ -937,8 +936,7 @@ static int ge2d_probe(struct platform_device *pdev)
 	ge2d->dev = &pdev->dev;
 	mutex_init(&ge2d->mutex);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	regs = devm_ioremap_resource(ge2d->dev, res);
+	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
