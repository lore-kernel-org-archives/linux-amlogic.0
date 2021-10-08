Return-Path: <SRS0=yw6d=O4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21005C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Oct 2021 09:29:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5D5860FDC
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Oct 2021 09:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5D5860FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o1pRFqJpmW4Inb6EzUFOFz/WUZQpUIa6viSM3PZ2wNU=; b=CrWmnCb9iMpDbL
	LubqKTxBhunkouZgm1lVGd1dSnPDkWCcOrtNIlfpUQFhfctjOQCvtJhIc2hB0yV+KDTeMAbLNCqm+
	73yl+j2YV/GtLggqrn8HsgFxv+3Qmi9lcSzpCdO9ccbIwMXf4eLCZtZ4GF9+Z7hhPc90gdFsm8Sjg
	BCPXUcfobGUZbECsUSyLEN0qttwKK08cuJsvXOurYnNYYCbbUBKUTyw/65RYvsJFXc1Dh16hl+eC7
	y5wkBA1sbxbGlyu4qjuVVK8KD5ty2v5UqrRFIkXMFGryEXpWf2CqVVFTy7xdQqJFYt7baRlr7SpjY
	GS3g11gPO+1G/zkGURGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYmCE-002Bqp-EC; Fri, 08 Oct 2021 09:29:42 +0000
Received: from mx22.baidu.com ([220.181.50.185] helo=baidu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYmBf-002Ba1-3r; Fri, 08 Oct 2021 09:29:10 +0000
Received: from BJHW-Mail-Ex11.internal.baidu.com (unknown [10.127.64.34])
 by Forcepoint Email with ESMTPS id 01DB11B09D55DF7346B2;
 Fri,  8 Oct 2021 17:28:59 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex11.internal.baidu.com (10.127.64.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Fri, 8 Oct 2021 17:28:58 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Fri, 8 Oct 2021 17:28:57 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron
 <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 "NXP Linux Team" <linux-imx@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>,
 "Neil Armstrong" <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Andy Gross
 <agross@kernel.org>, "Bjorn Andersson" <bjorn.andersson@linaro.org>, Heiko
 Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
Subject: [PATCH v4 1/9] iio: adc: ab8500-gpadc: Make use of the helper
 function dev_err_probe()
Date: Fri, 8 Oct 2021 17:28:49 +0800
Message-ID: <20211008092858.495-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex14.internal.baidu.com (172.31.51.54) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_022907_379427_AA3B4153 
X-CRM114-Status: GOOD (  10.71  )
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

When possible use dev_err_probe help to properly deal with the
PROBE_DEFER error, the benefit is that DEFER issue will be logged
in the devices_deferred debugfs file.
Using dev_err_probe() can reduce code size, and the error value
gets printed.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
v1->v2: Remove the separate line of PTR_ERR().
v2: Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

v2->v3: Handle platform_get_irq_byname() that returns -EPROBE_DEFER.

 drivers/iio/adc/ab8500-gpadc.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/adc/ab8500-gpadc.c b/drivers/iio/adc/ab8500-gpadc.c
index 7b5212ba5501..4c46a201d4ef 100644
--- a/drivers/iio/adc/ab8500-gpadc.c
+++ b/drivers/iio/adc/ab8500-gpadc.c
@@ -1103,17 +1103,15 @@ static int ab8500_gpadc_probe(struct platform_device *pdev)
 		return ret;
 
 	gpadc->irq_sw = platform_get_irq_byname(pdev, "SW_CONV_END");
-	if (gpadc->irq_sw < 0) {
-		dev_err(dev, "failed to get platform sw_conv_end irq\n");
-		return gpadc->irq_sw;
-	}
+	if (gpadc->irq_sw < 0)
+		return dev_err_probe(dev, gpadc->irq_sw,
+				     "failed to get platform sw_conv_end irq\n");
 
 	if (is_ab8500(gpadc->ab8500)) {
 		gpadc->irq_hw = platform_get_irq_byname(pdev, "HW_CONV_END");
-		if (gpadc->irq_hw < 0) {
-			dev_err(dev, "failed to get platform hw_conv_end irq\n");
-			return gpadc->irq_hw;
-		}
+		if (gpadc->irq_hw < 0)
+			return dev_err_probe(dev, gpadc->irq_hw,
+					     "failed to get platform hw_conv_end irq\n");
 	} else {
 		gpadc->irq_hw = 0;
 	}
@@ -1146,11 +1144,9 @@ static int ab8500_gpadc_probe(struct platform_device *pdev)
 
 	/* The VTVout LDO used to power the AB8500 GPADC */
 	gpadc->vddadc = devm_regulator_get(dev, "vddadc");
-	if (IS_ERR(gpadc->vddadc)) {
-		ret = PTR_ERR(gpadc->vddadc);
-		dev_err(dev, "failed to get vddadc\n");
-		return ret;
-	}
+	if (IS_ERR(gpadc->vddadc))
+		return dev_err_probe(dev, PTR_ERR(gpadc->vddadc),
+				     "failed to get vddadc\n");
 
 	ret = regulator_enable(gpadc->vddadc);
 	if (ret) {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
