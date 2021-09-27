Return-Path: <SRS0=QVii=OR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11817C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Sep 2021 08:15:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FD6660EB4
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Sep 2021 08:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FD6660EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xYR9kmp1fvypzaBsni2m8G2B45nntOeEOt1kTjm8ILI=; b=nIvP9aLPb6T4JC
	bwQYF8DoQ5hs0rnRNkv1reR9MiREUWIbNPyLEqeYVe4PIAA+61EMVrycWgdLAD1UkWobAAz6Ai+qF
	lx7+T1zvINV7KVxDp2MjGpZ1jZOjq96Tx1GmxX6HlCuI/+5Mc1Cj7gOCg/uIpBAaZu1fALFVGyhC1
	rt5KjcNA26WY2JkxGKkroM1b3d5IQS/H/Sjpw9MYgMZUsUJkSrAXkqPEGOrt0FfUDM1ZSKcWHtpdD
	/xss/JCuZNXHOVWgLa0m44yFgUD2G8qg0hWMdhieTo2XxRwrjBq84FQxs/EXNwep7UCB4WyupnNII
	ECxNlrM42s3c+CDIS5xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUln7-001vj3-Tj; Mon, 27 Sep 2021 08:15:13 +0000
Received: from mx22.baidu.com ([220.181.50.185] helo=baidu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUlmk-001va3-8e; Mon, 27 Sep 2021 08:14:51 +0000
Received: from BC-Mail-Ex03.internal.baidu.com (unknown [172.31.51.43])
 by Forcepoint Email with ESMTPS id F1FA295BAE256D84D0D6;
 Mon, 27 Sep 2021 16:14:44 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex03.internal.baidu.com (172.31.51.43) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Mon, 27 Sep 2021 16:14:44 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Mon, 27 Sep 2021 16:14:43 +0800
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
 Stuebner <heiko@sntech.de>, <linux-arm-kernel@lists.infradead.org>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-amlogic@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>
Subject: [PATCH 3/9] iio: adc: lpc18xx_adc: Make use of the helper function
 dev_err_probe()
Date: Mon, 27 Sep 2021 16:14:19 +0800
Message-ID: <20210927081426.762-3-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210927081426.762-1-caihuoqing@baidu.com>
References: <20210927081426.762-1-caihuoqing@baidu.com>
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex10.internal.baidu.com (172.31.51.50) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_011450_514266_3719EBA6 
X-CRM114-Status: UNSURE (   9.71  )
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

When possible use dev_err_probe help to properly deal with the
PROBE_DEFER error, the benefit is that DEFER issue will be logged
in the devices_deferred debugfs file.
Using dev_err_probe() can reduce code size, and the error value
gets printed.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/iio/adc/lpc18xx_adc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/adc/lpc18xx_adc.c b/drivers/iio/adc/lpc18xx_adc.c
index 3566990ae87d..caa7feb4219f 100644
--- a/drivers/iio/adc/lpc18xx_adc.c
+++ b/drivers/iio/adc/lpc18xx_adc.c
@@ -137,19 +137,19 @@ static int lpc18xx_adc_probe(struct platform_device *pdev)
 		return PTR_ERR(adc->base);
 
 	adc->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(adc->clk)) {
-		dev_err(&pdev->dev, "error getting clock\n");
-		return PTR_ERR(adc->clk);
-	}
+	if (IS_ERR(adc->clk))
+		return dev_err_probe(&pdev->dev,
+				     PTR_ERR(adc->clk),
+				     "error getting clock\n");
 
 	rate = clk_get_rate(adc->clk);
 	clkdiv = DIV_ROUND_UP(rate, LPC18XX_ADC_CLK_TARGET);
 
 	adc->vref = devm_regulator_get(&pdev->dev, "vref");
-	if (IS_ERR(adc->vref)) {
-		dev_err(&pdev->dev, "error getting regulator\n");
-		return PTR_ERR(adc->vref);
-	}
+	if (IS_ERR(adc->vref))
+		return dev_err_probe(&pdev->dev,
+				     PTR_ERR(adc->vref),
+				     "error getting regulator\n");
 
 	indio_dev->name = dev_name(&pdev->dev);
 	indio_dev->info = &lpc18xx_adc_info;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
