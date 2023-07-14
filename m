Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762C4C001DC
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jul 2023 19:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WjLbSy32j/bQzbvCFQROqvik4Yz9ZJtHbH6+rMhQRKo=; b=zfKO/Oonc9xdai
	xMnTX31WoUvv2kqRDhP7GgS0iDwpqDBvIp+2CNRZlsVUPrvRWxsaVlG7pUcagRBBjYRMagpR8a9t4
	058dp/1qVFNaEr2HjKscje/BSox62t7CeMFwhTFI0bxkdKu50fHP4hcOm+hKBjzup7ATBJx6yzJJ8
	0T0/eX1fhWblVinKjXBSlioehRl4ayk9wa/nhR11YqeGXztRwI3dDYib20RA9U1BbtbYpA4m1s4vZ
	dZsl1mPmXk6RiNbyDfcs/tdc8smpSN9paKzZN7hjWTNen9qbfDO96boZ9LKSIuaBxssbb1r9EAG8f
	9Yz5Hcyfgq2a/Wdcif1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKO4u-0073Hc-1s;
	Fri, 14 Jul 2023 19:03:44 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKO4q-0073Fs-2k;
	Fri, 14 Jul 2023 19:03:43 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id DAB40100006;
	Fri, 14 Jul 2023 22:03:32 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru DAB40100006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1689361412;
	bh=Fb0dBL6rswv5znabzmWo6BH+sWIBGMpwWD/C6JhcIu4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Uldy4UkG0hFpwUJ+wHAxNeY38ov1cYZUx+gIPVLrldD+FnP/kQ4c5bcPPjI7yCRi8
	 /t6bv60dz4CN9hUl/6RqTQ6fujEhxfrIUG1JCfMQDFcooMk9XvsekvlSZi7k0bj/y0
	 24gLctBZrwL67F7uCxNLVXsAZz1lJGzg/ujCpo9lJAn3ZEC7OYr23Jw7XZG0YHjJzU
	 87nXW4Y8X7+xSP5z6R0s1Ma5ikVOdVzJ/bsqY0r5wg8mbaFwSxRXYRM5nZsny/nW11
	 HnjVK2z+xXWon3EfIRnFn73lVSNd9LW/Y4gQkSW2kQ8/dLShsA18/hYCfc/hKAuVhR
	 ryicvlcjGuBfQ==
Received: from p-i-exch-sc-m02.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 14 Jul 2023 22:03:32 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 14 Jul 2023 22:03:32 +0300
From: George Stark <gnstark@sberdevices.ru>
To: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <gnstark@sberdevices.ru>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>
Subject: [PATCH v1 1/1] iio: adc: meson: fix core clock enable/disable moment
Date: Fri, 14 Jul 2023 22:03:15 +0300
Message-ID: <20230714190320.308320-2-gnstark@sberdevices.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714190320.308320-1-gnstark@sberdevices.ru>
References: <20230714190320.308320-1-gnstark@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178634 [Jul 14 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: GNStark@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 523 523 523027ce26ed1d9067f7a52a4756a876e54db27c, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m02.sberdevices.ru:5.0.1,7.1.1;sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/14 14:48:00 #21614190
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_120341_635432_35513E61 
X-CRM114-Status: GOOD (  16.13  )
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

Enable core clock at probe stage and disable it at remove stage.
Core clock is responsible for turning on/off the entire SoC module so
it should be on before the first module register is touched and be off
at very last moment.

Signed-off-by: George Stark <gnstark@sberdevices.ru>
---
 drivers/iio/adc/meson_saradc.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index fe066c9fab83..5a5bb5cc1320 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -1055,12 +1055,6 @@ static int meson_sar_adc_hw_enable(struct iio_dev *indio_dev)
 		goto err_vref;
 	}
 
-	ret = clk_prepare_enable(priv->core_clk);
-	if (ret) {
-		dev_err(dev, "failed to enable core clk\n");
-		goto err_core_clk;
-	}
-
 	regval = FIELD_PREP(MESON_SAR_ADC_REG0_FIFO_CNT_IRQ_MASK, 1);
 	regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG0,
 			   MESON_SAR_ADC_REG0_FIFO_CNT_IRQ_MASK, regval);
@@ -1087,8 +1081,6 @@ static int meson_sar_adc_hw_enable(struct iio_dev *indio_dev)
 	regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG3,
 			   MESON_SAR_ADC_REG3_ADC_EN, 0);
 	meson_sar_adc_set_bandgap(indio_dev, false);
-	clk_disable_unprepare(priv->core_clk);
-err_core_clk:
 	regulator_disable(priv->vref);
 err_vref:
 	meson_sar_adc_unlock(indio_dev);
@@ -1116,8 +1108,6 @@ static void meson_sar_adc_hw_disable(struct iio_dev *indio_dev)
 
 	meson_sar_adc_set_bandgap(indio_dev, false);
 
-	clk_disable_unprepare(priv->core_clk);
-
 	regulator_disable(priv->vref);
 
 	if (!ret)
@@ -1420,6 +1410,12 @@ static int meson_sar_adc_probe(struct platform_device *pdev)
 			ARRAY_SIZE(meson_sar_adc_iio_channels);
 	}
 
+	ret = clk_prepare_enable(priv->core_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable core clk\n");
+		goto err;
+	}
+
 	ret = meson_sar_adc_init(indio_dev);
 	if (ret)
 		goto err;
@@ -1445,17 +1441,21 @@ static int meson_sar_adc_probe(struct platform_device *pdev)
 err_hw:
 	meson_sar_adc_hw_disable(indio_dev);
 err:
+	clk_disable_unprepare(priv->core_clk);
 	return ret;
 }
 
 static int meson_sar_adc_remove(struct platform_device *pdev)
 {
 	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
+	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
 
 	iio_device_unregister(indio_dev);
 
 	meson_sar_adc_hw_disable(indio_dev);
 
+	clk_disable_unprepare(priv->core_clk);
+
 	return 0;
 }
 
-- 
2.38.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
