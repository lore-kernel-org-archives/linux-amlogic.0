Return-Path: <SRS0=rMmM=SB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08540C43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Mar 2019 09:13:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD1662184C
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Mar 2019 09:13:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eNYPBpiW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD1662184C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2i5WUcKQJ3Ik6W05WPyF4LzLUinTZ/K5p3A+f8d1wBo=; b=eNYPBpiW7wx+3U
	bbkGTnH4BIdC/JRLeKjkjzTG6qUBoXZsG1n/jpFWJKRxNwcvpKhBlDcfSwPrZm37IIpslQHtXWerA
	iDTWbdAu511PkgTLFT9UgJ12J9If54GUAO5Wbp37y/2RYdzSd64Y5jjxxqFb8ACzTYgkKnZZ1WFxX
	RZ3SuPv3fmKmgonVELTUnphEBbBc6gV/j95biwSgY1ohwgSHjtV8sb++IiDBXuw/fSooKvkZBD3He
	3opX+Jh+QhK9SNVvXjU13ESr37ZayQE6KYXeE5gTNppy5JKIGSDpV66Pqb8hv2YjoBsIieprudp1J
	DMl92L9wujbizVoFovvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAA3J-0001lx-CW; Sat, 30 Mar 2019 09:13:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAA2n-00016L-DF; Sat, 30 Mar 2019 09:12:56 +0000
X-UUID: 5fdf6df355ce4957a4c358a6fca9746a-20190330
X-UUID: 5fdf6df355ce4957a4c358a6fca9746a-20190330
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 796642188; Sat, 30 Mar 2019 01:12:48 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 30 Mar 2019 02:12:47 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 30 Mar 2019 17:12:44 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 30 Mar 2019 17:12:44 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 3/4] phy: socionext: get optional clock by
 devm_clk_get_optional()
Date: Sat, 30 Mar 2019 17:11:37 +0800
Message-ID: <f3370a0619d40c40676ed029cc04a3ed1c12b991.1553914418.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <a8539bcf66065380069676fbea99a51254309803.1553914418.git.chunfeng.yun@mediatek.com>
References: <a8539bcf66065380069676fbea99a51254309803.1553914418.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_021253_449715_AF6D8691 
X-CRM114-Status: UNSURE (   8.95  )
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
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Use devm_clk_get_optional() to get optional clock

Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/socionext/phy-uniphier-usb3hs.c | 10 +++-------
 drivers/phy/socionext/phy-uniphier-usb3ss.c | 10 +++-------
 2 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/socionext/phy-uniphier-usb3hs.c b/drivers/phy/socionext/phy-uniphier-usb3hs.c
index b1b048be6166..50f379fc4e06 100644
--- a/drivers/phy/socionext/phy-uniphier-usb3hs.c
+++ b/drivers/phy/socionext/phy-uniphier-usb3hs.c
@@ -335,13 +335,9 @@ static int uniphier_u3hsphy_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->clk_parent))
 		return PTR_ERR(priv->clk_parent);
 
-	priv->clk_ext = devm_clk_get(dev, "phy-ext");
-	if (IS_ERR(priv->clk_ext)) {
-		if (PTR_ERR(priv->clk_ext) == -ENOENT)
-			priv->clk_ext = NULL;
-		else
-			return PTR_ERR(priv->clk_ext);
-	}
+	priv->clk_ext = devm_clk_get_optional(dev, "phy-ext");
+	if (IS_ERR(priv->clk_ext))
+		return PTR_ERR(priv->clk_ext);
 
 	priv->rst = devm_reset_control_get_shared(dev, "phy");
 	if (IS_ERR(priv->rst))
diff --git a/drivers/phy/socionext/phy-uniphier-usb3ss.c b/drivers/phy/socionext/phy-uniphier-usb3ss.c
index 4be95679c7d8..ec231e40ef2a 100644
--- a/drivers/phy/socionext/phy-uniphier-usb3ss.c
+++ b/drivers/phy/socionext/phy-uniphier-usb3ss.c
@@ -238,13 +238,9 @@ static int uniphier_u3ssphy_probe(struct platform_device *pdev)
 		if (IS_ERR(priv->clk))
 			return PTR_ERR(priv->clk);
 
-		priv->clk_ext = devm_clk_get(dev, "phy-ext");
-		if (IS_ERR(priv->clk_ext)) {
-			if (PTR_ERR(priv->clk_ext) == -ENOENT)
-				priv->clk_ext = NULL;
-			else
-				return PTR_ERR(priv->clk_ext);
-		}
+		priv->clk_ext = devm_clk_get_optional(dev, "phy-ext");
+		if (IS_ERR(priv->clk_ext))
+			return PTR_ERR(priv->clk_ext);
 
 		priv->rst = devm_reset_control_get_shared(dev, "phy");
 		if (IS_ERR(priv->rst))
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
