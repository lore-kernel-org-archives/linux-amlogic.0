Return-Path: <SRS0=23Bv=N6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE6BC433FE
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Sep 2021 07:14:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C01A61168
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Sep 2021 07:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C01A61168
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DfCVOkLOBb9qcVnpQPzQt8hchpqSKO2Eqkzz9TffLU8=; b=PB8RKdfu9TIlZA
	g5n+zI9353GmW9ZlzUFaiY2mBa7y10zbHtMqEAohwn9zwk7s7P4D4Hy9F5GbUUUF38xZSO/Ufbxjm
	9lN/S3dfwbcoedV92w2pqgqx1thRbWfymsftsGSswNA/XCddv8YLWsEYMgsyuyj3v9GVkYwhy06pK
	q6VREBeqiq6Znd3UrMLYiV8DY7MTt5dFrQrYjg6vakgrskOUbOooUA/8fTOyGSlKni3j2DcID4eMI
	vaeBGFlz18kTDikC8sEq0tM+ualyRVRkCdQCd7T0uughF5niVs9VSwaGLPEMZ5g3QO8UW2HSuqI+3
	z50nwgkrHA48tvAbF3vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNrnC-005mLu-G5; Wed, 08 Sep 2021 07:14:46 +0000
Received: from mx21.baidu.com ([220.181.3.85] helo=baidu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNrkL-005kUN-Ae; Wed, 08 Sep 2021 07:11:50 +0000
Received: from BC-Mail-Ex27.internal.baidu.com (unknown [172.31.51.21])
 by Forcepoint Email with ESMTPS id 6A44F5619AF682181CA5;
 Wed,  8 Sep 2021 15:11:48 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex27.internal.baidu.com (172.31.51.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 8 Sep 2021 15:11:48 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 8 Sep 2021 15:11:47 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, Florian Fainelli
 <f.fainelli@gmail.com>, <bcm-kernel-feedback-list@broadcom.com>, Li Yang
 <leoyang.li@nxp.com>, Krzysztof Halasa <khalasa@piap.pl>, Matthias Brugger
 <matthias.bgg@gmail.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, Nishanth Menon <nm@ti.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-mediatek@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-tegra@vger.kernel.org>
Subject: [PATCH] soc: sunxi_sram: Make use of the helper function
 devm_platform_ioremap_resource()
Date: Wed, 8 Sep 2021 15:11:16 +0800
Message-ID: <20210908071123.348-6-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210908071123.348-1-caihuoqing@baidu.com>
References: <20210908071123.348-1-caihuoqing@baidu.com>
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex11.internal.baidu.com (10.127.64.34) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_001149_611946_C1641978 
X-CRM114-Status: GOOD (  11.14  )
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
 drivers/soc/sunxi/sunxi_sram.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 42833e33a96c..a8f3876963a0 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -331,7 +331,6 @@ static struct regmap_config sunxi_sram_emac_clock_regmap = {
 
 static int sunxi_sram_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct dentry *d;
 	struct regmap *emac_clock;
 	const struct sunxi_sramc_variant *variant;
@@ -342,8 +341,7 @@ static int sunxi_sram_probe(struct platform_device *pdev)
 	if (!variant)
 		return -EINVAL;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
