Return-Path: <SRS0=xGFd=SM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A3CC10F11
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2019 06:14:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0752E20850
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2019 06:14:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Otqw49ks"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0752E20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Um8ADoKbEQxxrOQ8eAKd0PSzfmHBl/ot/bnzmD3qTtw=; b=Otqw49ksQ50ery
	O8sIyvX4c/EIra4lHE5Hr5o/OGojmhsqxqSyICGx2zN1b864sg6gLNfrgpEHQDhy8/tJaJtyIJSlr
	I7QtcEcnZpVlpkrsctpsd37UdzxryvmHuSLUO6jVxrXZ16BHKtK3TfnPUsQ8KM2wTLpqJwl+tidKb
	c08PtuMmw8wZsQQi24HpiMQc7+VJ8kbFgixBGHFCy00wp9AN3WBpedb5V0f4IQvIS2Cwcj0FjIuHG
	+bpjOc1zfbvHn5G6r/0IoH6GNvv6qbXpEziCNImDlwo0+h2R3I18IqpoTj5L2f0W2qdnpYnHm+p3Y
	aE2RKrKmQbaNE29QaA2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hE6VB-0001JI-5Z; Wed, 10 Apr 2019 06:14:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hE6Uw-00010C-5a; Wed, 10 Apr 2019 06:14:16 +0000
X-UUID: baf4497acbd7469c9f8e4d659868c801-20190409
X-UUID: baf4497acbd7469c9f8e4d659868c801-20190409
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 882636484; Tue, 09 Apr 2019 22:13:15 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 9 Apr 2019 23:13:14 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 10 Apr 2019 14:13:10 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 10 Apr 2019 14:13:09 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [v2 PATCH 2/4] phy: qcom-qusb2: get optional clock by
 devm_clk_get_optional()
Date: Wed, 10 Apr 2019 14:13:04 +0800
Message-ID: <50f5c2410bb86691329e5cb4d7ec38d1811fff33.1554874961.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <a8539bcf66065380069676fbea99a51254309803.1554874961.git.chunfeng.yun@mediatek.com>
References: <a8539bcf66065380069676fbea99a51254309803.1554874961.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_231414_210304_38F23D85 
X-CRM114-Status: GOOD (  10.96  )
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
 Gross <andy.gross@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Vivek
 Gautam <vivek.gautam@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Use devm_clk_get_optional() to get optional clock

Cc: Andy Gross <andy.gross@linaro.org>
Cc: David Brown <david.brown@linaro.org>
Cc: Vivek Gautam <vivek.gautam@codeaurora.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 8fd7ce139772..1cbf1d6f28ce 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -822,14 +822,9 @@ static int qusb2_phy_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	qphy->iface_clk = devm_clk_get(dev, "iface");
-	if (IS_ERR(qphy->iface_clk)) {
-		ret = PTR_ERR(qphy->iface_clk);
-		if (ret == -EPROBE_DEFER)
-			return ret;
-		qphy->iface_clk = NULL;
-		dev_dbg(dev, "failed to get iface clk, %d\n", ret);
-	}
+	qphy->iface_clk = devm_clk_get_optional(dev, "iface");
+	if (IS_ERR(qphy->iface_clk))
+		return PTR_ERR(qphy->iface_clk);
 
 	qphy->phy_reset = devm_reset_control_get_by_index(&pdev->dev, 0);
 	if (IS_ERR(qphy->phy_reset)) {
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
