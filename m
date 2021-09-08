Return-Path: <SRS0=23Bv=N6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2DDC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Sep 2021 07:19:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C94A610E9
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Sep 2021 07:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C94A610E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PPXJ9dbrB6A39ECFASziKKsSoar8Bu97TVOEm4vAPnU=; b=V6qrD1KHi11e+o
	ohx2IL5TY5WlUWpR9axWxMkdXClPzvap2M6fhWMjjE1/++IfqJk7yZtoV9PwJCiMBGjyhTycGadRY
	qg1L8uH5OtJ6YJiyiobdBUuSbJKolvgKkmaL+wpX1tzRtUP1x2TtLw76qD2gq8WQcN4nbtwwjeBRa
	lFmskmDJ5KZBMkWr/oqe/gbo6+7WozP3TsY1eI2N5mAXgR5eRg4Ix/o7aRi1jqejLSOlJSkjNjyax
	cVYzsx7TfmjAbnz6t8PA7Hmcduw7xgLtI0zWIbC8T02BhA5yB7Dvlx7nFiK4khMggGQenHpwRpDVh
	yF/9ukfkX6gcwefU7c5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNrs7-005otd-2K; Wed, 08 Sep 2021 07:19:51 +0000
Received: from mx21.baidu.com ([220.181.3.85] helo=baidu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNroH-005my6-Jx; Wed, 08 Sep 2021 07:15:55 +0000
Received: from BJHW-Mail-Ex03.internal.baidu.com (unknown [10.127.64.13])
 by Forcepoint Email with ESMTPS id 9D41A94C91E73A467384;
 Wed,  8 Sep 2021 15:15:51 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex03.internal.baidu.com (10.127.64.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 8 Sep 2021 15:15:51 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 8 Sep 2021 15:15:50 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] soc: amlogic: canvas: Make use of the helper function
 devm_platform_ioremap_resource()
Date: Wed, 8 Sep 2021 15:15:42 +0800
Message-ID: <20210908071544.603-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex11.internal.baidu.com (10.127.64.34) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_001553_860537_BFBD94C6 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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
 drivers/soc/amlogic/meson-canvas.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/amlogic/meson-canvas.c b/drivers/soc/amlogic/meson-canvas.c
index d0329ad170d1..383b0cfc584e 100644
--- a/drivers/soc/amlogic/meson-canvas.c
+++ b/drivers/soc/amlogic/meson-canvas.c
@@ -168,7 +168,6 @@ EXPORT_SYMBOL_GPL(meson_canvas_free);
 
 static int meson_canvas_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct meson_canvas *canvas;
 	struct device *dev = &pdev->dev;
 
@@ -176,8 +175,7 @@ static int meson_canvas_probe(struct platform_device *pdev)
 	if (!canvas)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	canvas->reg_base = devm_ioremap_resource(dev, res);
+	canvas->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(canvas->reg_base))
 		return PTR_ERR(canvas->reg_base);
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
