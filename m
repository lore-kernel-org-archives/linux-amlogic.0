Return-Path: <SRS0=xGFd=SM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6C1C282CE
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2019 06:13:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ECC220850
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2019 06:13:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tK+2h372"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ECC220850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s0vnysejY7VD20zOPbI0GyuYmRS2ylPDnBNCZ/0CnQk=; b=tK+2h372t9jfXc
	cAV0VjuETaV2NaAFr89rb44C5kOcZKTiiBqMkQsoKdYJTsly/6/SRJS1v5DG89Zoug8jTQSvrCj0w
	ba28hQN1Osu5eUOMizwboCSprfHiI1fnjAgqv2ChUri5GPOO0N36RqhN+o1g1T4sch2G4eRnyp8Xt
	wEXTCsGwNQDzWsvt2R0ggGVm+51CnfugHNcRiZXGJaHw5Ax9H0Bk+G6eZ4gElpDwAx6dvhFmWcad5
	P6S22uOLS21CrOw7FBOd7OdulGM6MclYxgKTPqmKhfLv2vl6gBFbHdWQix/QAGoDdr85DI40m6BlN
	PqCS9onu624vGFVTHCTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hE6UJ-00009X-Ca; Wed, 10 Apr 2019 06:13:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hE6U7-0008N4-F5; Wed, 10 Apr 2019 06:13:25 +0000
X-UUID: d37b50e646024a4bba68dc39ec2399c2-20190409
X-UUID: d37b50e646024a4bba68dc39ec2399c2-20190409
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1273169556; Tue, 09 Apr 2019 22:13:13 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 9 Apr 2019 23:13:12 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 10 Apr 2019 14:13:09 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 10 Apr 2019 14:13:08 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [v2 PATCH 1/4] phy: phy-mtk-tphy: get optional clock by
 devm_clk_get_optional()
Date: Wed, 10 Apr 2019 14:13:03 +0800
Message-ID: <a8539bcf66065380069676fbea99a51254309803.1554874961.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_231323_507356_97DFD774 
X-CRM114-Status: GOOD (  10.13  )
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

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 5b6a470ca145..cb2ed3b25068 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -1103,13 +1103,9 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 	}
 
 	/* it's deprecated, make it optional for backward compatibility */
-	tphy->u3phya_ref = devm_clk_get(dev, "u3phya_ref");
-	if (IS_ERR(tphy->u3phya_ref)) {
-		if (PTR_ERR(tphy->u3phya_ref) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
-		tphy->u3phya_ref = NULL;
-	}
+	tphy->u3phya_ref = devm_clk_get_optional(dev, "u3phya_ref");
+	if (IS_ERR(tphy->u3phya_ref))
+		return PTR_ERR(tphy->u3phya_ref);
 
 	tphy->src_ref_clk = U3P_REF_CLK;
 	tphy->src_coef = U3P_SLEW_RATE_COEF;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
