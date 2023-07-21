Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA503EB64DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Jul 2023 10:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/NPUlZea/j8XWmqUPXN647OqjFI4+jFyV5+OYQh+o44=; b=yPpykNen8ApEfh
	NT75sqrdUKZO6C/ZEuO1kh15R5OAHnk04To0UCE5r9Mm4m92an53dLpPC9Yeie/t3Ko9YFkElR9zA
	9O4yRf5oyZ3qI4Acx4HUrw9BrvB5Iq7On3QIlT94gtF+oDxEWkK3Xn0z1mCYJRYhqjDO380HxjKcv
	fePn4DPfixLaUvDyPhKPCn5pUnN1zoXGwBKRmJb63uNpeajME7TZAS8w6Y4v5t+DRlbARByyNjIB2
	eq8KkNoudTkg0+2Hy/+0yMQlcxk5CzFAUlfWZjaBphIdilFnKymmODfEONRdWkb1Plyl3kcZiwCQC
	KGppx+niI/jXRaL59Pxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMnJI-00Dm2g-1K;
	Fri, 21 Jul 2023 10:24:32 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMnJC-00Dm07-1r;
	Fri, 21 Jul 2023 10:24:29 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 710F210000B;
	Fri, 21 Jul 2023 13:24:22 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 710F210000B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1689935062;
	bh=EWUIlxsTDbNkizZTsEpwplf6NYv49AJU87NGu8MEmCk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=oajsjVUx8JDqEcZXEXYVq5mcYmbZpxg0SaO/XN0hWUt2aC3QYWZnntz75Vmoit0kK
	 cr6sop1jOhmMFt+rMOh0gI950oYWR+pDKzz+G2MdL/5lWkszX+Fc6pKm6rIlE+24t9
	 84Yew9SKyD39Vqm2AEk9jOqBXVNDDtCZiDEiNCXPvsKYIcUpkJ8VIxUCMzJOq5Tgag
	 snVql/mpBRCzmNoavl3ZwVJX4vNJ0jlNsFUE57kNYp+G3wHn6YtG8sBgo00PqxGaz/
	 JBFJzVVzTwdPedYxPHcD2y1dew65ADVpRFk/0Mx4dUBlNUJIRXZ5f5E4pRDQ27Jqtf
	 +NSrdXTWO0fXQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 21 Jul 2023 13:24:22 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 21 Jul 2023 13:24:21 +0300
From: George Stark <gnstark@sberdevices.ru>
To: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <gnstark@sberdevices.ru>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>
Subject: [PATCH v2 2/2] iio: adc: meson: improve error logging at probe stage
Date: Fri, 21 Jul 2023 13:23:09 +0300
Message-ID: <20230721102413.255726-3-gnstark@sberdevices.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721102413.255726-1-gnstark@sberdevices.ru>
References: <20230721102413.255726-1-gnstark@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178775 [Jul 21 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: GNStark@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 525 525 723604743bfbdb7e16728748c3fa45e9eba05f7d, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/21 05:36:00 #21651174
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_032426_986316_6A9E3488 
X-CRM114-Status: GOOD (  13.79  )
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

Add log messages for errors that may occur at probe stage

Signed-off-by: George Stark <gnstark@sberdevices.ru>
---
 drivers/iio/adc/meson_saradc.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 8397a5347f32..11b10459a028 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -1046,8 +1046,10 @@ static int meson_sar_adc_hw_enable(struct iio_dev *indio_dev)
 	u32 regval;
 
 	ret = meson_sar_adc_lock(indio_dev);
-	if (ret)
+	if (ret) {
+		dev_err(dev, "failed to lock adc\n");
 		goto err_lock;
+	}
 
 	ret = regulator_enable(priv->vref);
 	if (ret < 0) {
@@ -1355,15 +1357,15 @@ static int meson_sar_adc_probe(struct platform_device *pdev)
 
 	priv->regmap = devm_regmap_init_mmio(dev, base, priv->param->regmap_config);
 	if (IS_ERR(priv->regmap))
-		return PTR_ERR(priv->regmap);
+		return dev_err_probe(dev, PTR_ERR(priv->regmap), "failed to init regmap\n");
 
 	irq = irq_of_parse_and_map(dev->of_node, 0);
 	if (!irq)
-		return -EINVAL;
+		return dev_err_probe(dev, -EINVAL, "failed to get irq\n");
 
 	ret = devm_request_irq(dev, irq, meson_sar_adc_irq, IRQF_SHARED, dev_name(dev), indio_dev);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "failed to request irq\n");
 
 	priv->clkin = devm_clk_get(dev, "clkin");
 	if (IS_ERR(priv->clkin))
@@ -1385,7 +1387,7 @@ static int meson_sar_adc_probe(struct platform_device *pdev)
 	if (!priv->adc_clk) {
 		ret = meson_sar_adc_clk_init(indio_dev, base);
 		if (ret)
-			return ret;
+			return dev_err_probe(dev, ret, "failed to init internal clk\n");
 	}
 
 	priv->vref = devm_regulator_get(dev, "vref");
@@ -1427,8 +1429,10 @@ static int meson_sar_adc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, indio_dev);
 
 	ret = iio_device_register(indio_dev);
-	if (ret)
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to register iio device\n");
 		goto err_hw;
+	}
 
 	return 0;
 
-- 
2.38.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
