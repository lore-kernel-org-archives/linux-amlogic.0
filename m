Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4432EC3A59E
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 13:52:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15DD822CF7
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 13:52:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PRhAeuKr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15DD822CF7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cQybzSjaDQGFD569gq7zKZ7N7qGIwXBuz6Ft7JoiRb8=; b=PRhAeuKr9nHO3n
	4ADUfqQ45KTkhvf8mvzsoJxkDnNLhe7KLXLXrXKnfXD2Dz3EKfDalSzYExm34slFaCOIZ5gnDzduZ
	XQtVP4t7Jmxn2+ZfsUUSp4i48VJvbV5FK1geAa0jLo5Q7aASFf5hv1mYPN+56mafxXQORfnzr1RJW
	rMEw5KDRhNiRUUFCPccnbRVCdMZGZ8C+pUwtM1uEmcXyTNVoeOquCxfeLX0ObR/UAaGBE8wCuxLTm
	Ihhf7NG0rJLvcGHmNWIuXwnhFI2A4QDTddEdIgvq5hOIwnj8WUvibQdEP71d6fNASc7f+H4f6TsO2
	8WwHzFxBnpy309eP2r5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0R1n-0002L2-Jl; Wed, 21 Aug 2019 13:51:55 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0R1k-0002KD-6u; Wed, 21 Aug 2019 13:51:54 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 022F8B2573DACA4DFC57;
 Wed, 21 Aug 2019 21:51:42 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Wed, 21 Aug 2019
 21:51:36 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <davem@davemloft.net>, <peppe.cavallaro@st.com>,
 <alexandre.torgue@st.com>, <joabreu@synopsys.com>, <khilman@baylibre.com>,
 <mcoquelin.stm32@gmail.com>
Subject: [PATCH net-next] net: stmmac: dwmac-meson8b: use
 devm_platform_ioremap_resource() to simplify code
Date: Wed, 21 Aug 2019 21:51:30 +0800
Message-ID: <20190821135130.68636-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_065153_241914_45C992C9 
X-CRM114-Status: UNSURE (   8.26  )
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 786ca4a..9cda29e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -308,7 +308,6 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
-	struct resource *res;
 	struct meson8b_dwmac *dwmac;
 	int ret;
 
@@ -332,8 +331,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 		ret = -EINVAL;
 		goto err_remove_config_dt;
 	}
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	dwmac->regs = devm_ioremap_resource(&pdev->dev, res);
+	dwmac->regs = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(dwmac->regs)) {
 		ret = PTR_ERR(dwmac->regs);
 		goto err_remove_config_dt;
-- 
2.7.4



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
