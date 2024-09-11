Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457F8EE499F
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Sep 2024 12:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4jBj4KF16tY1ulwn06XJFvfvKcf2uxUVZZVKR1fKZxM=; b=DQ3SsK908OFK+z
	8ncIP2ES0xtP71zv1Wd1FYbsaCf6D6/FFWnrRnRe5OKa0TZyZOdLbyqsMjiPI3EnAKQgVnxlVkJPU
	h53L/CLlobyr2TXOqx/TAnwehejbldqIRN4Wr7ET4Mye3M115S205zDA+lKUeBOyObu1Z5bDOWkdU
	Xx16j4traf977DQrgz/6d12grEFhUQjvzp9TO1W5iIEtoQ8mMs2Ah8W4bo13roIqR+K10vaX1yZib
	uUuNz7y3Y9HRULnPP48yDVUU3iZfiRqxvB2830uOgIXvw9SzsGezBixOYe7N7x0e1oFshcq9nF+Hb
	TOyXBpgJlr2yiA87TvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soMRb-00000009T6p-3jxT;
	Wed, 11 Sep 2024 12:27:35 +0000
Received: from cmccmta2.chinamobile.com ([111.22.67.135])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soMIm-00000009RMo-3RkZ
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Sep 2024 12:18:31 +0000
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee766e18a89dd7-1fddd;
	Wed, 11 Sep 2024 20:18:20 +0800 (CST)
X-RM-TRANSID: 2ee766e18a89dd7-1fddd
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee166e18a70e4f-cb9c7;
	Wed, 11 Sep 2024 20:18:19 +0800 (CST)
X-RM-TRANSID: 2ee166e18a70e4f-cb9c7
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: clabbe@baylibre.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH] crypto: amlogic - Remove redundant assignment and error messages
Date: Wed, 11 Sep 2024 20:17:51 +0800
Message-Id: <20240911121751.1900-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_051829_405215_3211DDCA 
X-CRM114-Status: UNSURE (   8.82  )
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

In the function meson_crypto_probe, devm_platform_ioremap_resource()
have already contains error message, so remove the
redundant assignment and error messages.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index f54ab0d0b..6fe248620 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -240,11 +240,9 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, mc);
 
 	mc->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(mc->base)) {
-		err = PTR_ERR(mc->base);
-		dev_err(&pdev->dev, "Cannot request MMIO err=%d\n", err);
-		return err;
-	}
+	if (IS_ERR(mc->base))
+		return PTR_ERR(mc->base);
+
 	mc->busclk = devm_clk_get(&pdev->dev, "blkmv");
 	if (IS_ERR(mc->busclk)) {
 		err = PTR_ERR(mc->busclk);
-- 
2.33.0




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
