Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842DCC05027
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Feb 2023 08:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=euiuFigthQdL7JUWP0d1XIwzHLXo7xpyO0wmdvOgNQI=; b=bSaZcgl8dIDcDP
	5WB6xnnI9mhAxW/w24z4jSiQpHbdvOA6YWIiT7PUoDINAhmo0Wgn5r2X3XkUKn/4GB2mRgBSEIhk+
	xAxA6OeE1QTa4VPLCuKNbygYLCqk+DT/eJbTYFIDq0sHWquPRZrRaDh+WweW6HPTgyMPdW0hzRppu
	wZqWT42pyYsEDle6nOkfL237XNVvnuqGJM4mLGP+K1ZmhyS9fhaN9s4BVO5zc3VYhMRFxdSkUYXjC
	cuZl5kwsdga3d4P5S6WhsexkahHPY5ZVcIs9yQ6fMWGRKTlksmsmCgOuMhpbjr0VZUzMHftj4jF38
	1FJPQxKc3lcW7CNlJ8Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSwAJ-00DJad-45; Fri, 17 Feb 2023 08:32:23 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSwAF-00DJK5-Kd; Fri, 17 Feb 2023 08:32:21 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R381e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0Vbs.8lH_1676622607;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0Vbs.8lH_1676622607)
          by smtp.aliyun-inc.com;
          Fri, 17 Feb 2023 16:30:08 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: ulf.hansson@linaro.org
Cc: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH -next] mmc: meson-gx: Use devm_platform_get_and_ioremap_resource()
Date: Fri, 17 Feb 2023 16:30:05 +0800
Message-Id: <20230217083005.128668-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_003220_053352_A7158AAC 
X-CRM114-Status: UNSURE (   7.95  )
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

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 079c52dbeca6..a5a9a19a9a42 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -1204,8 +1204,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "device reset failed\n");
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	host->regs = devm_ioremap_resource(&pdev->dev, res);
+	host->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(host->regs))
 		return PTR_ERR(host->regs);
 
-- 
2.20.1.7.g153144c


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
