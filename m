Return-Path: <SRS0=xGFd=SM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F382C10F11
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2019 06:14:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D5D420850
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2019 06:14:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eD9cKLyo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D5D420850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xPcvOYmY8KovnI9uuk21FMgwLMFfsogGYVSPzyhOy28=; b=eD9cKLyoN7ST6n
	IM5v78l/Q+t6tA0AjsE0sOwlAC5uC8/oezZWL7AbtR2s9uwmhpw03L6uTO+roSvRk4yiLfVYOX7tQ
	7+HAKRIFbLkc40WVgaX4ElfiZP0BKQlQCR9g+tkyMIWsriBDTC6svmfiRHgWRt3UGuKMUwqbpSte2
	c98BsWT1Fh9jReFxHy7cm28J/2Q48dWH5IvpOAyKjksKcG9sHadLNGq7quIlDtL73p+BT+colL1Tv
	WDIYLAGT5uhe8Wrt2p5BXS5Te6Ew8Bl2MbLrQhLKj628z9FIEOaNAGPNRAc3Y06TzuBRAI+CdJnBG
	Y1OqaOxT/T9Re/u30q7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hE6V5-0001Az-Bf; Wed, 10 Apr 2019 06:14:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hE6Uw-0000yF-5a; Wed, 10 Apr 2019 06:14:15 +0000
X-UUID: a065b1e2db7542c19629054e48f191b4-20190409
X-UUID: a065b1e2db7542c19629054e48f191b4-20190409
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1681973044; Tue, 09 Apr 2019 22:13:18 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 9 Apr 2019 23:13:17 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 10 Apr 2019 14:13:14 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 10 Apr 2019 14:13:12 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [v2 PATCH 4/4] phy: phy-meson-gxl-usb2: get optional clock by
 devm_clk_get_optional()
Date: Wed, 10 Apr 2019 14:13:06 +0800
Message-ID: <9f04a619e8a2cc44f5b1fe299a08f237f069d56d.1554874961.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <a8539bcf66065380069676fbea99a51254309803.1554874961.git.chunfeng.yun@mediatek.com>
References: <a8539bcf66065380069676fbea99a51254309803.1554874961.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_231414_212252_BDB7FB2D 
X-CRM114-Status: GOOD (  10.42  )
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
Cc: David Brown <david.brown@linaro.org>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Masami Hiramatsu <masami.hiramatsu@linaro.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Motoya Tanigawa <tanigawa.motoya@socionext.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Andy
 Gross <andy.gross@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-msm@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Use devm_clk_get_optional() to get optional clock

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
v2: add Acked-by Martin Blumenstingl
---
 drivers/phy/amlogic/phy-meson-gxl-usb2.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
index 148ef0bdb9c1..4cbee412f2b0 100644
--- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
@@ -261,14 +261,9 @@ static int phy_meson_gxl_usb2_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
-	priv->clk = devm_clk_get(dev, "phy");
-	if (IS_ERR(priv->clk)) {
-		ret = PTR_ERR(priv->clk);
-		if (ret == -ENOENT)
-			priv->clk = NULL;
-		else
-			return ret;
-	}
+	priv->clk = devm_clk_get_optional(dev, "phy");
+	if (IS_ERR(priv->clk))
+		return PTR_ERR(priv->clk);
 
 	priv->reset = devm_reset_control_get_optional_shared(dev, "phy");
 	if (IS_ERR(priv->reset))
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
