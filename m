Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B82EB64DD
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jun 2023 06:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AjxOcTBfr00BooFD5PoP27/p62oFZh4KAvm1wAP3Qys=; b=JOQUfZtGVywIw6
	JOFG90CqNXuuxlOLsB0cbd6EfbHN6ANcfn/hpjqia8iHufiBOnp8WwXBFfgYqKtIMnOSaNE+8bJH8
	g/bYWBtMW7E30PNIkclc1aWIdacVw5gK94gjQ4yr8QSlOJ8gkHoNMvPK1xfmXaEzFllu7tlQuyLRx
	7SaHpJaVinQJ5bHY63NQf+4sBGYjZg1uR2Q4LDpbsTpA4xsVncR2YOeW56Uc5uLshRSzLaNihoBRZ
	LUgkLQ45bphdOUu42Z2q9xXSH5DD3VWxk5YQ5q/D6Pqn8uB1480RKI7yOtgsl1QGFaCQ3vWiwwbWU
	J4jrfGIyY4qT/fXAv3UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBrJg-00DPj0-0P;
	Wed, 21 Jun 2023 06:27:44 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBrJa-00DPgk-1Q;
	Wed, 21 Jun 2023 06:27:42 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 1E9B35FD5F;
	Wed, 21 Jun 2023 09:27:35 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1687328855;
	bh=1HCYzQCWt+fRi1jUgBj1XLHgZN68PTMiptoPlI6IIWk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=PMlBL9RC8nMPIi5Kr5U9w97+BUgNfviyi54qKXXimeW+pRY/sFgGmqO9f/8ysXWcB
	 VC9oGlrxC0B7K4DPMg4hfQwINDjCnAvFNWJwpOIXoYDCXtl6qoJoJWW7QkYXPFAg2Q
	 scDZNVCQzNTnaY08NI5wuRFFJ7BNHeuWJsgpbMMeL/osJdzXwQ84hiYTcxHbaUsIcz
	 2IwHetI79PUWQQ+nYFN09uyYpqvfFKDLZplHQVkbFXNnk4fLfwNIMk1YqxBYThirYz
	 oJxy+V6706Bbt+KJJ/StoiTw0kKJ8OoZtWgXPVx7/zhyNjE6XXYN5BuqXXr7WIOubp
	 WriTf1lvp5VtA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 21 Jun 2023 09:27:34 +0300 (MSK)
From: George Stark <gnstark@sberdevices.ru>
To: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <gnstark@sberdevices.ru>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>, George Stark <GNStark@sberdevices.ru>
Subject: [PATCH v1 1/3] meson saradc: code refactoring
Date: Wed, 21 Jun 2023 09:26:08 +0300
Message-ID: <20230621062715.455652-2-gnstark@sberdevices.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621062715.455652-1-gnstark@sberdevices.ru>
References: <20230621062715.455652-1-gnstark@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/20 23:30:00 #21539802
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_232738_993732_48B88975 
X-CRM114-Status: GOOD (  13.53  )
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

- remove channel array double definition
- add channel index enum
- move enums declaration before variables declaration
- move meson_sar_adc_set_chan7_mux routine upper

Signed-off-by: George Stark <GNStark@sberdevices.ru>
---
 drivers/iio/adc/meson_saradc.c | 97 ++++++++++++++++------------------
 1 file changed, 46 insertions(+), 51 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 18937a262af6..42f0389e123d 100644
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
@@ -202,31 +201,6 @@
 	.datasheet_name = "TEMP_SENSOR",				\
 }
 
-static const struct iio_chan_spec meson_sar_adc_iio_channels[] = {
-	MESON_SAR_ADC_CHAN(0),
-	MESON_SAR_ADC_CHAN(1),
-	MESON_SAR_ADC_CHAN(2),
-	MESON_SAR_ADC_CHAN(3),
-	MESON_SAR_ADC_CHAN(4),
-	MESON_SAR_ADC_CHAN(5),
-	MESON_SAR_ADC_CHAN(6),
-	MESON_SAR_ADC_CHAN(7),
-	IIO_CHAN_SOFT_TIMESTAMP(8),
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
-};
-
 enum meson_sar_adc_avg_mode {
 	NO_AVERAGING = 0x0,
 	MEAN_AVERAGING = 0x1,
@@ -249,6 +223,31 @@ enum meson_sar_adc_chan7_mux_sel {
 	CHAN7_MUX_CH7_INPUT = 0x7,
 };
 
+enum meson_sar_adc_channel_index {
+	INDEX_CHAN_0,
+	INDEX_CHAN_1,
+	INDEX_CHAN_2,
+	INDEX_CHAN_3,
+	INDEX_CHAN_4,
+	INDEX_CHAN_5,
+	INDEX_CHAN_6,
+	INDEX_CHAN_7,
+	INDEX_CHAN_SOFT_TIMESTAMP,
+};
+
+static const struct iio_chan_spec meson_sar_adc_iio_channels[] = {
+	MESON_SAR_ADC_CHAN(INDEX_CHAN_0),
+	MESON_SAR_ADC_CHAN(INDEX_CHAN_1),
+	MESON_SAR_ADC_CHAN(INDEX_CHAN_2),
+	MESON_SAR_ADC_CHAN(INDEX_CHAN_3),
+	MESON_SAR_ADC_CHAN(INDEX_CHAN_4),
+	MESON_SAR_ADC_CHAN(INDEX_CHAN_5),
+	MESON_SAR_ADC_CHAN(INDEX_CHAN_6),
+	MESON_SAR_ADC_CHAN(INDEX_CHAN_7),
+	IIO_CHAN_SOFT_TIMESTAMP(INDEX_CHAN_SOFT_TIMESTAMP),
+	MESON_SAR_ADC_TEMP_CHAN(), /* must be the last item */
+};
+
 struct meson_sar_adc_param {
 	bool					has_bl30_integration;
 	unsigned long				clock_rate;
@@ -338,6 +337,19 @@ static int meson_sar_adc_wait_busy_clear(struct iio_dev *indio_dev)
 					       1, 10000);
 }
 
+static void meson_sar_adc_set_chan7_mux(struct iio_dev *indio_dev,
+					enum meson_sar_adc_chan7_mux_sel sel)
+{
+	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
+	u32 regval;
+
+	regval = FIELD_PREP(MESON_SAR_ADC_REG3_CTRL_CHAN7_MUX_SEL_MASK, sel);
+	regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG3,
+			   MESON_SAR_ADC_REG3_CTRL_CHAN7_MUX_SEL_MASK, regval);
+
+	usleep_range(10, 20);
+}
+
 static int meson_sar_adc_read_raw_sample(struct iio_dev *indio_dev,
 					 const struct iio_chan_spec *chan,
 					 int *val)
@@ -434,19 +446,6 @@ static void meson_sar_adc_enable_channel(struct iio_dev *indio_dev,
 	}
 }
 
-static void meson_sar_adc_set_chan7_mux(struct iio_dev *indio_dev,
-					enum meson_sar_adc_chan7_mux_sel sel)
-{
-	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
-	u32 regval;
-
-	regval = FIELD_PREP(MESON_SAR_ADC_REG3_CTRL_CHAN7_MUX_SEL_MASK, sel);
-	regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG3,
-			   MESON_SAR_ADC_REG3_CTRL_CHAN7_MUX_SEL_MASK, regval);
-
-	usleep_range(10, 20);
-}
-
 static void meson_sar_adc_start_sample_engine(struct iio_dev *indio_dev)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
@@ -1016,7 +1015,7 @@ static int meson_sar_adc_calib(struct iio_dev *indio_dev)
 	meson_sar_adc_set_chan7_mux(indio_dev, CHAN7_MUX_VDD_DIV4);
 	usleep_range(10, 20);
 	ret = meson_sar_adc_get_sample(indio_dev,
-				       &indio_dev->channels[7],
+				       &indio_dev->channels[INDEX_CHAN_7],
 				       MEAN_AVERAGING, EIGHT_SAMPLES, &value0);
 	if (ret < 0)
 		goto out;
@@ -1024,7 +1023,7 @@ static int meson_sar_adc_calib(struct iio_dev *indio_dev)
 	meson_sar_adc_set_chan7_mux(indio_dev, CHAN7_MUX_VDD_MUL3_DIV4);
 	usleep_range(10, 20);
 	ret = meson_sar_adc_get_sample(indio_dev,
-				       &indio_dev->channels[7],
+				       &indio_dev->channels[INDEX_CHAN_7],
 				       MEAN_AVERAGING, EIGHT_SAMPLES, &value1);
 	if (ret < 0)
 		goto out;
@@ -1242,15 +1241,11 @@ static int meson_sar_adc_probe(struct platform_device *pdev)
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
+	// last item is temp channel
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
