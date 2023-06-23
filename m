Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1D1EB64DA
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jun 2023 02:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tVh1+ruCqLh5yFtEiF5dWI1UyoB8E7rzZpb79t1Qs4Q=; b=X1eX68JBYcIX8j
	uWVvoGdOq2Gl/+3LXEzG/tsUoYOwMatZ4Qdm55QBDKUXJ0Vuc79x1O3qt4QrLlFQfZB+IrEJsIeel
	3WI//74S1QOZqwDVTfM/THYLBeFEnf+f3SOaeNDyvOg8CM42t3GKfJRX9tujjIt4wi/vi03UIW8LV
	mudVOlG4/2h2LJez2BkRQ6M2MPXtx4WMGbA16QHLXNL0t2QdJCkSi79Y4xJKW+QzGNXYEw24+dKYC
	gxGWoqURyQUIJAmiBHFS2Gg2AOUdIOshuzfT8dw2veJKt8cFT7Ec0HTFctynfPNt/hZTjkXlJSGxt
	VeJGfmBdc0gGYML+MNaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCWTE-002K3G-0E;
	Fri, 23 Jun 2023 02:24:20 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCWSr-002Jqp-1I;
	Fri, 23 Jun 2023 02:24:02 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 5F7A65FD27;
	Fri, 23 Jun 2023 05:23:54 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1687487034;
	bh=xNSHkYYB8/LbeA0+r7XGd/32WotV9MdYNPXVJkH92yU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=lfi4idW2RP2iu9BEegqhGovm8etD0Wx6LaaRwxwsBbi63WHmdk/Hx21WZRpymJg/D
	 sFtp/N1nu5ICdl/vMcPJcvYZwYMM7Z7oPwOp6IQcro2xUB0GioQNbTarpIUrViOsAa
	 KFsLw2A2DxWadmVEPCaQbjDaNpUEUrmmF5LMsoDl6cyT6dZ+HazCUauzyGQ88XEFHD
	 Q7GIzC/Z7Tjua3hPpoPMjv3LwPKm9sj3iEWI739VfIzBhPvFrH7OMRKo+yoVizZh98
	 o9RwRPNr11i2iX0xxscxtCySVkj8eNhGE6cUtm9vVS+hpvITEKRKXO7v7jUsEpstLv
	 u7Z6pqVSnB8UQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri, 23 Jun 2023 05:23:54 +0300 (MSK)
From: George Stark <gnstark@sberdevices.ru>
To: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <gnstark@sberdevices.ru>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>, George Stark <GNStark@sberdevices.ru>
Subject: [PATCH v2 3/6] meson saradc: unite iio channel array definitions
Date: Fri, 23 Jun 2023 05:20:11 +0300
Message-ID: <20230623022334.791026-4-gnstark@sberdevices.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230623022334.791026-1-gnstark@sberdevices.ru>
References: <20230623022334.791026-1-gnstark@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/22 21:10:00 #21557945
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_192357_809159_271AF3C8 
X-CRM114-Status: GOOD (  12.45  )
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

Instead of having several similar channel arrays which are different
only by one item unite the arrays and put the unique item in the end.

Signed-off-by: George Stark <GNStark@sberdevices.ru>
---
 drivers/iio/adc/meson_saradc.c | 31 +++++++------------------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 6e69b40b3309..ffd4de950a63 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -189,9 +189,8 @@
 	.datasheet_name = "SAR_ADC_CH"#_chan,				\
 }
 
-#define MESON_SAR_ADC_TEMP_CHAN(_chan) {				\
+#define MESON_SAR_ADC_TEMP_CHAN() {					\
 	.type = IIO_TEMP,						\
-	.channel = _chan,						\
 	.address = MESON_SAR_ADC_VOLTAGE_AND_TEMP_CHANNEL,		\
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |			\
 				BIT(IIO_CHAN_INFO_AVERAGE_RAW),		\
@@ -234,19 +233,7 @@ static const struct iio_chan_spec meson_sar_adc_iio_channels[] = {
 	MESON_SAR_ADC_CHAN(6),
 	MESON_SAR_ADC_CHAN(7),
 	IIO_CHAN_SOFT_TIMESTAMP(8),
-};
-
-static const struct iio_chan_spec meson_sar_adc_and_temp_iio_channels[] = {
-	MESON_SAR_ADC_CHAN(0),
-	MESON_SAR_ADC_CHAN(1),
-	MESON_SAR_ADC_CHAN(2),
-	MESON_SAR_ADC_CHAN(3),
-	MESON_SAR_ADC_CHAN(4),
-	MESON_SAR_ADC_CHAN(5),
-	MESON_SAR_ADC_CHAN(6),
-	MESON_SAR_ADC_CHAN(7),
-	MESON_SAR_ADC_TEMP_CHAN(8),
-	IIO_CHAN_SOFT_TIMESTAMP(9),
+	MESON_SAR_ADC_TEMP_CHAN(), /* must be the last item */
 };
 
 struct meson_sar_adc_param {
@@ -1242,15 +1229,11 @@ static int meson_sar_adc_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	if (priv->temperature_sensor_calibrated) {
-		indio_dev->channels = meson_sar_adc_and_temp_iio_channels;
-		indio_dev->num_channels =
-			ARRAY_SIZE(meson_sar_adc_and_temp_iio_channels);
-	} else {
-		indio_dev->channels = meson_sar_adc_iio_channels;
-		indio_dev->num_channels =
-			ARRAY_SIZE(meson_sar_adc_iio_channels);
-	}
+	indio_dev->channels = meson_sar_adc_iio_channels;
+	indio_dev->num_channels = ARRAY_SIZE(meson_sar_adc_iio_channels);
+	/* last item is temp channel */
+	if (!priv->temperature_sensor_calibrated)
+		indio_dev->num_channels--;
 
 	ret = meson_sar_adc_init(indio_dev);
 	if (ret)
-- 
2.38.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
