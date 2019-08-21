Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 306D5C3A59E
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 14:00:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03B19206BA
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 14:00:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fAZwiB6p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03B19206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LnJYmJ28OFyw2LnKNTaAjRqjkaDaSA/XWdVdnQ2SzOU=; b=fAZwiB6pWDMD4Y
	F5helCODm1ks+fDEiesTEXpJUE135V9EtEoijjagOiFkO8jUuf3PSRI7/FO37+6bRoQDMHKVGbEur
	h2jM78vX7TTdXJ63WEjg3KPDYrSFvVUmSoqlTasXhuXuDqjYXo0C2UVFa4JrAVJ2S/CfyASMz1KRX
	VVugNAQaeArPwzhL/Bk2w0akP895NEgNCMw7OynnCjtjHfTTTOi/N/Xriv8H4MFjGGHHPZKS5S0xp
	Nhq1UaeQVZJw0R/Xq98Nel+lYalmglWpcRVo+SMyxPwdxczv32YWxF4ZmWJRuo6rsRuA8EvEPRZwE
	L3VtMBg/OIXV2/912R0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0RAM-00043L-II; Wed, 21 Aug 2019 14:00:46 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0R6y-0007TZ-Ou; Wed, 21 Aug 2019 13:57:18 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id F20E6172C2CEA7DC6A97;
 Wed, 21 Aug 2019 21:57:13 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Wed, 21 Aug 2019
 21:57:05 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <davem@davemloft.net>, <peppe.cavallaro@st.com>,
 <alexandre.torgue@st.com>, <joabreu@synopsys.com>, <khilman@baylibre.com>,
 <mcoquelin.stm32@gmail.com>
Subject: [PATCH net-next] net: stmmac: dwc-qos: use
 devm_platform_ioremap_resource() to simplify code
Date: Wed, 21 Aug 2019 21:57:01 +0800
Message-ID: <20190821135701.46780-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_065717_186679_96EE3303 
X-CRM114-Status: UNSURE (   7.94  )
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
Cc: netdev@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index f2197b0..dd9967a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -418,7 +418,6 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
 	const struct dwc_eth_dwmac_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
-	struct resource *res;
 	void *priv;
 	int ret;
 
@@ -435,8 +434,7 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
 		return stmmac_res.irq;
 	stmmac_res.wol_irq = stmmac_res.irq;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	stmmac_res.addr = devm_ioremap_resource(&pdev->dev, res);
+	stmmac_res.addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(stmmac_res.addr))
 		return PTR_ERR(stmmac_res.addr);
 
-- 
2.7.4



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
