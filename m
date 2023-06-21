Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36292EB64DC
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jun 2023 06:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYbW+x21uNU4ci9ZkzPwVRCSXEhg20kqhJ9UgT1JTLI=; b=ARTh926gwO3hQy
	J6MZ/5q2lCJhY8Mokym2OGaqnFqJR4SMZDgxyU/zWXwqj8/PCkIdjfLwsRk0RIOkf3qRShJmCPL9P
	UQmj8taQj3lLKTpNmHnC0qMrs85kk6vKauqE8e22CXES/kQ411mryFQcFHNLHsE+zKH6I3BcQgFmv
	5m3VFKgZ3SNbUY2ZhpR6rqn7vd88JhElZaYOV8U475/0wUllC4Itzid1qnM4GMWogJvDUUT9Sc3i+
	jIIPRzQ7WpTezMhB1pFVIhJ4la/Qg7qYrMa0QJ9vSd4TwwuTL4ZrD0F1X8SjriXwtXddv+w/XYAFa
	3vwcy474oyr+w/O/nQzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBrJw-00DPp3-08;
	Wed, 21 Jun 2023 06:28:00 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBrJb-00DPh5-1v;
	Wed, 21 Jun 2023 06:27:43 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 851195FD61;
	Wed, 21 Jun 2023 09:27:36 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1687328856;
	bh=iYMidsTDXcTCWyifw1vWsk3ddCRuBC/523lS3FYIPhA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=d91jAQnp+1oOd7EG36ECRbKu2NluxoeVSEEiTUd+3ULMtQv2z3CSczX/CHzaCeLhF
	 XDHWa9jh8ooov05wqJE2FPhTyVl9fZXyAoSwZOLkntZBr7H0V8Q3B0FIghnZQTIU30
	 eTP4UJpzwSvbsES98TfHRxOR4sTRhatLEWh5+QQwCOhQao9qvd+XNzOoikgn48pYdm
	 /qTyR8V9GOqkVEvS45goJtDNIzoRUL5ZIeXS5t8qH2yoWqQuCFlW1Hk8M78wfRJxyp
	 rC0GkQiqWJUvEcOvIk1VM/GNGl9g3oQBxaY1fjo5wkpubxch1GqrgJ6qCmC/qyu8Zy
	 Clvf2m+/oSxuQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 21 Jun 2023 09:27:36 +0300 (MSK)
From: George Stark <gnstark@sberdevices.ru>
To: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <gnstark@sberdevices.ru>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>, George Stark <GNStark@sberdevices.ru>
Subject: [PATCH v1 3/3] meson saradc: support reading from channel7 mux inputs
Date: Wed, 21 Jun 2023 09:26:10 +0300
Message-ID: <20230621062715.455652-4-gnstark@sberdevices.ru>
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
X-CRM114-CacheID: sfid-20230620_232739_998133_5FDEBC8E 
X-CRM114-Status: GOOD (  15.73  )
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

meson saradc channel 7 is connected to muxer that can switch channel
input to well-known sources like Vdd, GND and several Vdd dividers.
This patch adds iio channel for every mux input.

Signed-off-by: George Stark <GNStark@sberdevices.ru>
---
 drivers/iio/adc/meson_saradc.c | 65 +++++++++++++++++++++++++++++++---
 1 file changed, 61 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 66d6f527122c..c4f350b4523e 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -163,6 +163,7 @@
 #define MESON_SAR_ADC_MAX_FIFO_SIZE				32
 #define MESON_SAR_ADC_TIMEOUT					100 /* ms */
 #define MESON_SAR_ADC_VOLTAGE_AND_TEMP_CHANNEL			6
+#define MESON_SAR_ADC_VOLTAGE_AND_MUX_CHANNEL			7
 #define MESON_SAR_ADC_TEMP_OFFSET				27
 
 /* temperature sensor calibration information in eFuse */
@@ -201,6 +202,19 @@
 	.datasheet_name = "TEMP_SENSOR",				\
 }
 
+#define MESON_SAR_ADC_MUX(_chan, _sel) {				\
+	.type = IIO_VOLTAGE,						\
+	.channel = _chan,						\
+	.indexed = 1,							\
+	.address = MESON_SAR_ADC_VOLTAGE_AND_MUX_CHANNEL,		\
+	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |			\
+				BIT(IIO_CHAN_INFO_AVERAGE_RAW),		\
+	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),		\
+	.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_CALIBBIAS) |	\
+				BIT(IIO_CHAN_INFO_CALIBSCALE),		\
+	.datasheet_name = "SAR_ADC_MUX_"#_sel,				\
+}
+
 enum meson_sar_adc_avg_mode {
 	NO_AVERAGING = 0x0,
 	MEAN_AVERAGING = 0x1,
@@ -233,6 +247,27 @@ enum meson_sar_adc_channel_index {
 	INDEX_CHAN_6,
 	INDEX_CHAN_7,
 	INDEX_CHAN_SOFT_TIMESTAMP,
+	INDEX_MUX_0_VSS,
+	INDEX_MUX_1_VDD_DIV4,
+	INDEX_MUX_2_VDD_DIV2,
+	INDEX_MUX_3_VDD_MUL3_DIV4,
+	INDEX_MUX_4_VDD,
+};
+
+static enum meson_sar_adc_chan7_mux_sel chan7_mux_values[] = {
+	CHAN7_MUX_VSS,
+	CHAN7_MUX_VDD_DIV4,
+	CHAN7_MUX_VDD_DIV2,
+	CHAN7_MUX_VDD_MUL3_DIV4,
+	CHAN7_MUX_VDD,
+};
+
+static const char * const chan7_mux_names[] = {
+	"gnd",
+	"0.25vdd",
+	"0.5vdd",
+	"0.75vdd",
+	"vdd",
 };
 
 static const struct iio_chan_spec meson_sar_adc_iio_channels[] = {
@@ -245,6 +280,11 @@ static const struct iio_chan_spec meson_sar_adc_iio_channels[] = {
 	MESON_SAR_ADC_CHAN(INDEX_CHAN_6),
 	MESON_SAR_ADC_CHAN(INDEX_CHAN_7),
 	IIO_CHAN_SOFT_TIMESTAMP(INDEX_CHAN_SOFT_TIMESTAMP),
+	MESON_SAR_ADC_MUX(INDEX_MUX_0_VSS, 0),
+	MESON_SAR_ADC_MUX(INDEX_MUX_1_VDD_DIV4, 1),
+	MESON_SAR_ADC_MUX(INDEX_MUX_2_VDD_DIV2, 2),
+	MESON_SAR_ADC_MUX(INDEX_MUX_3_VDD_MUL3_DIV4, 3),
+	MESON_SAR_ADC_MUX(INDEX_MUX_4_VDD, 4),
 	MESON_SAR_ADC_TEMP_CHAN(), /* must be the last item */
 };
 
@@ -284,6 +324,7 @@ struct meson_sar_adc_priv {
 	bool					temperature_sensor_calibrated;
 	u8					temperature_sensor_coefficient;
 	u16					temperature_sensor_adc_val;
+	enum meson_sar_adc_chan7_mux_sel	chan7_mux_sel;
 };
 
 static const struct regmap_config meson_sar_adc_regmap_config_gxbb = {
@@ -348,6 +389,8 @@ static void meson_sar_adc_set_chan7_mux(struct iio_dev *indio_dev,
 			   MESON_SAR_ADC_REG3_CTRL_CHAN7_MUX_SEL_MASK, regval);
 
 	usleep_range(10, 20);
+
+	priv->chan7_mux_sel = sel;
 }
 
 static int meson_sar_adc_read_raw_sample(struct iio_dev *indio_dev,
@@ -443,6 +486,15 @@ static void meson_sar_adc_enable_channel(struct iio_dev *indio_dev,
 		regmap_update_bits(priv->regmap,
 				   MESON_SAR_ADC_DELTA_10,
 				   MESON_SAR_ADC_DELTA_10_TEMP_SEL, regval);
+	} else if (chan->address == MESON_SAR_ADC_VOLTAGE_AND_MUX_CHANNEL) {
+		enum meson_sar_adc_chan7_mux_sel sel;
+
+		if (chan->channel == INDEX_CHAN_7)
+			sel = CHAN7_MUX_CH7_INPUT;
+		else
+			sel = chan7_mux_values[chan->channel - INDEX_MUX_0_VSS];
+		if (sel != priv->chan7_mux_sel)
+			meson_sar_adc_set_chan7_mux(indio_dev, sel);
 	}
 }
 
@@ -1015,7 +1067,7 @@ static int meson_sar_adc_calib(struct iio_dev *indio_dev)
 	meson_sar_adc_set_chan7_mux(indio_dev, CHAN7_MUX_VDD_DIV4);
 	usleep_range(10, 20);
 	ret = meson_sar_adc_get_sample(indio_dev,
-				       &indio_dev->channels[INDEX_CHAN_7],
+				       &indio_dev->channels[INDEX_MUX_1_VDD_DIV4],
 				       MEAN_AVERAGING, EIGHT_SAMPLES, &value0);
 	if (ret < 0)
 		goto out;
@@ -1023,7 +1075,7 @@ static int meson_sar_adc_calib(struct iio_dev *indio_dev)
 	meson_sar_adc_set_chan7_mux(indio_dev, CHAN7_MUX_VDD_MUL3_DIV4);
 	usleep_range(10, 20);
 	ret = meson_sar_adc_get_sample(indio_dev,
-				       &indio_dev->channels[INDEX_CHAN_7],
+				       &indio_dev->channels[INDEX_MUX_3_VDD_MUL3_DIV4],
 				       MEAN_AVERAGING, EIGHT_SAMPLES, &value1);
 	if (ret < 0)
 		goto out;
@@ -1050,8 +1102,13 @@ static int read_label(struct iio_dev *indio_dev,
 {
 	if (chan->type == IIO_TEMP)
 		return sprintf(label, "%s\n", "temp-sensor");
-	if (chan->type == IIO_VOLTAGE)
-		return sprintf(label, "channel-%d\n", chan->channel);
+	if (chan->type == IIO_VOLTAGE) {
+		if (chan->channel <= INDEX_CHAN_7)
+			return sprintf(label, "channel-%d\n", chan->channel);
+		if (chan->channel >= INDEX_MUX_0_VSS)
+			return sprintf(label, "%s\n",
+				chan7_mux_names[chan->channel - INDEX_MUX_0_VSS]);
+	}
 	return 0;
 }
 
-- 
2.38.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
