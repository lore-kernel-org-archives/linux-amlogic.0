Return-Path: <SRS0=rMmM=SB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A022C43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Mar 2019 09:13:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F02802184C
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Mar 2019 09:13:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r3rHrafv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F02802184C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R6EFjKsHCUDrU6NKE65FfWizMkeX5aTdgdjV87B0Eqg=; b=r3rHrafv3oV71G
	bUE0EotqUXupBG9X1tTu/5EFMoDmTJ3KdpsfRNDJgi2hg4xkibYiocWNSLfP4sk+gHXOdihCYt36N
	eCmiKVc+JqUq1Nsfa7MOUm2IjyRe6VRTJKBrbep6vsCtiFkOhW5BIuVQf5tCcFWXBE2/HF/l47DOv
	R4j/4V2NH6/G5U4YuvzdEYh66nxS7FkkofEStpkqGBBquonl3F0VDmSRrmciJzpCx9AxyR80ie9WM
	EMJ7shD4wgbSMVqWSaAJjUqK4kgoppEgRFc+dPB430NQWbtSA2+817jaAZkFdNAWzVmX+Y9nGCBv3
	oG563hUgXmsDNT9hBMPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAA2z-0001KS-No; Sat, 30 Mar 2019 09:13:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAA2m-00016I-Lq; Sat, 30 Mar 2019 09:12:55 +0000
X-UUID: abe46bce44714aeabd08deeb4c783728-20190330
X-UUID: abe46bce44714aeabd08deeb4c783728-20190330
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1527704346; Sat, 30 Mar 2019 01:12:46 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 30 Mar 2019 02:12:45 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 30 Mar 2019 17:12:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 30 Mar 2019 17:12:43 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 2/4] phy: qcom-qusb2: get optional clock by
 devm_clk_get_optional()
Date: Sat, 30 Mar 2019 17:11:36 +0800
Message-ID: <50f5c2410bb86691329e5cb4d7ec38d1811fff33.1553914418.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <a8539bcf66065380069676fbea99a51254309803.1553914418.git.chunfeng.yun@mediatek.com>
References: <a8539bcf66065380069676fbea99a51254309803.1553914418.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_021252_724304_00A8B1DF 
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
Cc: David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Vivek
 Gautam <vivek.gautam@codeaurora.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-amlogic@lists.infradead.org, Andy
 Gross <andy.gross@linaro.org>, linux-arm-kernel@lists.infradead.org
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
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
