Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7397C77B7E
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 May 2023 21:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+568B+GEf1HBFh+6EWlelbzEpkv18LK4Fcx9A2qSxxo=; b=vEBCOt5bM0dd1C
	NH86T45KLkCM2V0w/OwLnoQRk+fCp4Rhg6jBuSggHo3TjULdu/OtvkzOs9ncL0fN/wJSz3YKSqpQW
	suMDFgrMP7ciqPi0joprwNM0vXD58WqRJg/fpJoP3zlngYc2GNyzKmCobtnVwoTEKBnrBYyEBln2B
	i1tt02yF91QJYxq80al+GxxMWwAtJF9RcEvJcLmO9tNwpTr5cmedKrKvNx5wqOqpjlPGKqNBVa/eC
	R2enIRCSZE9KAKcfkzC+FDHnkx36tPQQZZE5FuNavxxDGug1/MwIUsPUl4zEvnv6xRYB0wZbNZye1
	uC5gE+9p4XVrB/BwDiYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q31n2-006QDo-0t;
	Sat, 27 May 2023 21:49:32 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q31mz-006QDJ-0t;
	Sat, 27 May 2023 21:49:31 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id CD88A5FD05;
	Sun, 28 May 2023 00:49:26 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685224166;
	bh=uwW7K4cfFXdf+jokRdWQHLSxAVdT45vfjiDQ4hUhzgg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=KlFCzbHL2FA+v5Zv8EyvgScQE7bfqs4jIfCA9E9aG3+2QukzPXZw380GbZoUqNwJa
	 T4z61Pfta5IX5kNaqcXAWxaALnNQHULKzY1Tz+cT2k8INB5RTklEXBWs1dGy/M4Nai
	 xXChRfVX991qfFGg1wRahBLpj7gyiu+LaQ+yFLsqyMZfmUuGMxpHM2LGTqjoGsZrdb
	 DUj5ZJ+u6uH74oWHoJU5Ddl7QybWy5ZK1BmOqfDLFX1/mb2+U2GSiBGN3FRIJojRvk
	 SS9s6gZzKvxe5AU74Pn66Q77AX2pSV1Jg7hgxoeAbLdkGmiAJ2y1xpOErG9jKZ7REx
	 mF073ASciavcg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Sun, 28 May 2023 00:49:25 +0300 (MSK)
From: George Stark <gnstark@sberdevices.ru>
To: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <gnstark@sberdevices.ru>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>, George Stark <GNStark@sberdevices.ru>
Subject: [PATCH v2] meson saradc: add iio device attrib to switch channel 7 mux
Date: Sun, 28 May 2023 00:48:54 +0300
Message-ID: <20230527214854.126517-1-gnstark@sberdevices.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/27 20:13:00 #21359908
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230527_144929_666440_EFE65006 
X-CRM114-Status: GOOD (  14.40  )
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

Patch adds two sysfs nodes: chan7_mux to set mux state
and chan7_mux_available to show available mux states.
Mux can be used to debug and calibrate adc by
switching and measuring well-known inputs like GND, Vdd etc.

Signed-off-by: George Stark <GNStark@sberdevices.ru>
---
 drivers/iio/adc/meson_saradc.c | 65 ++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index e05e51900c35..6959a0064551 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -11,6 +11,7 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/iio/iio.h>
+#include <linux/iio/sysfs.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/nvmem-consumer.h>
@@ -320,6 +321,7 @@ struct meson_sar_adc_priv {
 	bool					temperature_sensor_calibrated;
 	u8					temperature_sensor_coefficient;
 	u16					temperature_sensor_adc_val;
+	u8					chan7_mux_sel;
 };
 
 static const struct regmap_config meson_sar_adc_regmap_config_gxbb = {
@@ -483,6 +485,7 @@ static void meson_sar_adc_set_chan7_mux(struct iio_dev *indio_dev,
 	regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG3,
 			   MESON_SAR_ADC_REG3_CTRL_CHAN7_MUX_SEL_MASK, regval);
 
+	priv->chan7_mux_sel = sel;
 	usleep_range(10, 20);
 }
 
@@ -1130,8 +1133,70 @@ static int meson_sar_adc_calib(struct iio_dev *indio_dev)
 	return ret;
 }
 
+static const char * const chan7_vol[] = {
+	"gnd",
+	"vdd/4",
+	"vdd/2",
+	"vdd*3/4",
+	"vdd",
+	"ch7_input",
+};
+
+static ssize_t chan7_mux_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
+	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
+	unsigned int index = priv->chan7_mux_sel;
+
+	if (index >= ARRAY_SIZE(chan7_vol))
+		index = ARRAY_SIZE(chan7_vol) - 1;
+
+	return sysfs_emit(buf, "%s\n", chan7_vol[index]);
+}
+
+static ssize_t chan7_mux_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t count)
+{
+	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
+	int i;
+
+	i = sysfs_match_string(chan7_vol, buf);
+	if (i < 0)
+		return -EINVAL;
+	meson_sar_adc_set_chan7_mux(indio_dev, i);
+	return count;
+}
+
+static IIO_DEVICE_ATTR_RW(chan7_mux, -1);
+
+static ssize_t chan7_mux_available_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	int i, len = 0;
+
+	for (i = 0; i < ARRAY_SIZE(chan7_vol); i++)
+		len += sysfs_emit_at(buf, len, "%s ", chan7_vol[i]);
+
+	return len;
+}
+
+static IIO_DEVICE_ATTR_RO(chan7_mux_available, -1);
+
+static struct attribute *meson_sar_adc_attrs[] = {
+	&iio_dev_attr_chan7_mux_available.dev_attr.attr,
+	&iio_dev_attr_chan7_mux.dev_attr.attr,
+	NULL
+};
+
+static const struct attribute_group meson_sar_adc_attr_group = {
+	.attrs = meson_sar_adc_attrs,
+};
+
 static const struct iio_info meson_sar_adc_iio_info = {
 	.read_raw = meson_sar_adc_iio_info_read_raw,
+	.attrs = &meson_sar_adc_attr_group,
 };
 
 static const struct meson_sar_adc_param meson_sar_adc_meson8_param = {
-- 
2.38.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
