Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2CAC6FD1C
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 07:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ue9KdsWqLkE6sJSbO6G5EU7P9nK3lSCdR0MJV5KZIzE=; b=JbV/ZdkCtO2Hz+
	1emYZbekX2QgWCi6XvksvlFBCHEWmO/ZkW8NJ6OEGEsW/fJUi2GU594hpybzRDg2PlR282Aen+Wtv
	+Z/mbArrDaupbuU1sVZdMLEq6NcI+k45m069x7yaQoLk7PzgOUGhpybSGiMdcUOKlQXlkNBQshgUn
	Atr9AGPXVQtb/hDfC9eh5zwIPWzK97Fm+IPqo6Y8XNKaXcz0Pys8F/whh977Fct9ZxVdp+opZWmal
	6tpzzGWphFUlwPHiwXVeVjx6hF7sKyzG1SyTSN48XQRVErsvJslFglSnqnqAuVi0gCcsNh5tufMHh
	CWE+2YS6QOcbB316omkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfFUH-0017Fz-1p;
	Thu, 23 Mar 2023 07:35:53 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfFUD-0017Dd-39;
	Thu, 23 Mar 2023 07:35:52 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045192;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0VeTb.bu_1679556935;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VeTb.bu_1679556935)
          by smtp.aliyun-inc.com;
          Thu, 23 Mar 2023 15:35:36 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: neil.armstrong@linaro.org
Cc: khilman@baylibre.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH -next] phy: dphy: Use devm_platform_ioremap_resource()
Date: Thu, 23 Mar 2023 15:35:34 +0800
Message-Id: <20230323073534.75037-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_003550_206907_2780A056 
X-CRM114-Status: UNSURE (   8.85  )
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

According to commit 7945f929f1a7 ("drivers: provide
devm_platform_ioremap_resource()"), convert platform_get_resource(),
devm_ioremap_resource() to a single call to use
devm_platform_ioremap_resource(), as this is exactly what this function
does.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
index 32d1ff09befb..6e9af79e152c 100644
--- a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
+++ b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
@@ -335,7 +335,6 @@ static int phy_meson_axg_mipi_dphy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
-	struct resource *res;
 	struct phy_meson_axg_mipi_dphy_priv *priv;
 	struct phy *phy;
 	void __iomem *base;
@@ -348,8 +347,7 @@ static int phy_meson_axg_mipi_dphy_probe(struct platform_device *pdev)
 	priv->dev = dev;
 	platform_set_drvdata(pdev, priv);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.20.1.7.g153144c


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
