Return-Path: <SRS0=7wMw=JG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7394C433ED
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Apr 2021 11:03:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DE35610D0
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Apr 2021 11:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DE35610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LGoRGC0v7s+ePu/p32/NTQzfxtgPUAAjSjMx23YjPEg=; b=jJ5+zjy/4zopxTx/rBO6T0ysA5
	S4BENOmHv35I2MB2NfCawulwjgrt3EuLPWDkLmaFf30FX0g6pqdpxgYDhuT7nZF9Oe57NsG6HPol1
	dCsCogw8ZgxiIkKo9NhVNAj8YYOVkxCNsr9EU2u5rGG1q8DsAd6WX3UnyFkcYuu4BHBcepH79H5An
	a2XQCH3C3z6SoirFNolsPDMTkipFeAYThnF6vfbiQPXGr63y79n0U/KE6gW8e4bGlC4ppzDwJx9DD
	l8I7C4y57jjzVLRTWIfrHPjGosMs1Q2S9812MOE9QU2swF8BskiUK11vRMCbxcLyXt2bC3I4SNi7+
	oL1WZgkg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUouz-000Wbk-5s; Fri, 09 Apr 2021 11:03:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUoun-000WaV-Et; Fri, 09 Apr 2021 11:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=mYo8Ua7Hbg1ntn2lA1y6Twc2iUGThxdBKkGu7ZrI+NU=; b=2jQbPE2ktA7dK5z5pzOnJgCPG9
 T0cQah/2YYWF+KOQYZm8VT9FiZsQp528LLLdWYzOamj2ke7NZaCLrGx2rjgZC2fxXbhX6UIGrk5oM
 TmY+VdMMva8sqh6i9tOdJz5AxzJFpFrzfqZeW/bq8snO3iljMi4qzBVeAM6v2R3tVgUUqYPC652M+
 t6+yvYegwhVoV+dywguZk223YOKTRrg+QfkwL9oEAQmhdt4/Nu12tkABP0i6cG25uLYclIbS4Q8BI
 VHrQnfb995cdeMrZui3JRId2tV6g9aXTE8wtHQn22y5yJV9P2hDhKAFtfrbMYDFT+1pXkDW1sBl2R
 zY6wK0RA==;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUouj-004NFq-S4; Fri, 09 Apr 2021 11:03:04 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FGwCV52WWz9xjG;
 Fri,  9 Apr 2021 19:00:38 +0800 (CST)
Received: from DESKTOP-EFRLNPK.china.huawei.com (10.174.176.196) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Fri, 9 Apr 2021 19:02:43 +0800
From: Qiheng Lin <linqiheng@huawei.com>
To: <linqiheng@huawei.com>, Kevin Hilman <khilman@baylibre.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] soc: amlogic: meson-clk-measure: remove redundant
 dev_err call in meson_msr_probe()
Date: Fri, 9 Apr 2021 19:02:43 +0800
Message-ID: <20210409110243.41-1-linqiheng@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.174.176.196]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_040302_096727_9F58C877 
X-CRM114-Status: UNSURE (   7.50  )
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

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
---
 drivers/soc/amlogic/meson-clk-measure.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index e1957476a006..6dd190270123 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -626,10 +626,8 @@ static int meson_msr_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(base)) {
-		dev_err(&pdev->dev, "io resource mapping failed\n");
+	if (IS_ERR(base))
 		return PTR_ERR(base);
-	}
 
 	priv->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 					     &meson_clk_msr_regmap_config);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
