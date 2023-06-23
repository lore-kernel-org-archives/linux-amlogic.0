Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4AFEB64DA
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jun 2023 02:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/17NeVzqjIjdt1KVqW6eh6mdSx1Un3oLbLePlzPem28=; b=LyDRJXUnZrPBN9
	G6IElqEfxwMu8JEcb4ffYgyaXfWdCE2wggv0bVzDteeJHPtuMOyuh5Rn1TjmTUYJdDtFJ+hJt0hmt
	sgCrsGpPwz/uu8S5NWfWhpURoYn/sIu9Odrx8gH9Lt2xPy77nnlRAtxaTe3GYeAbt0vfBxt4hbxnb
	WESEQiIarKIv6ryAwVYG7pAbFg73fanaco2IM6j89eDjW8d7nnRkaKI/px6koi8P5Rz9qw6mrftu9
	ORCjINaCGOVyA5AQZZXfIZ9Mm4hl//v38lmBa05ZLZ5H1M7EYJV/DBKiZKcDP25CY5JKEmGZDr/V4
	KgM1gBNyAJdRzs/whCFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCWSz-002Jvk-0i;
	Fri, 23 Jun 2023 02:24:05 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCWSr-002Jqu-1o;
	Fri, 23 Jun 2023 02:24:02 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 81B195FD28;
	Fri, 23 Jun 2023 05:23:54 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1687487034;
	bh=xJtb2PxI0po9bYawG64NHJS7+zf3ZJH0TBfB5YdKzHY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bRX+++1zU1HV0IKkDfv0xOuRU+k1BLIBZe+MGgmJ+N/JDnCju1VqjIBgTMULDJmFU
	 8mBlLVrl8ZaOMIgDjBT0LX1YyFPllOqcIch3Ms5MqCVTWAVquKk1HeTFMpj8/dRPBS
	 JH23tbqSBVSBWsu+39m404IllChX1E8fnfmDwqPq8e2t8pK4Frf9c46XVHC0zUPNrs
	 ZnUed4CBwvaKITRjhjA2RwOLWqxmksCf2CuBLa+uNFRYN5rqGQJaVli2gOzWSbFtMN
	 5kku/rKn/WTzGBq5wa6XC3LP4USU/wfR/7wiRu+AkUXo+UBEniQg021JYTIKgVmPo9
	 2TTDL0Ln/wCPA==
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
Subject: [PATCH v2 4/6] meson saradc: add enum for iio channel array indexes
Date: Fri, 23 Jun 2023 05:20:12 +0300
Message-ID: <20230623022334.791026-5-gnstark@sberdevices.ru>
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
X-CRM114-CacheID: sfid-20230622_192357_958102_515CEAA6 
X-CRM114-Status: UNSURE (   9.66  )
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

Add enum for iio channel array indexes.

Signed-off-by: George Stark <GNStark@sberdevices.ru>
---
 drivers/iio/adc/meson_saradc.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index ffd4de950a63..7ef006650982 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -223,16 +223,28 @@ enum meson_sar_adc_chan7_mux_sel {
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
 static const struct iio_chan_spec meson_sar_adc_iio_channels[] = {
-	MESON_SAR_ADC_CHAN(0),
-	MESON_SAR_ADC_CHAN(1),
-	MESON_SAR_ADC_CHAN(2),
-	MESON_SAR_ADC_CHAN(3),
-	MESON_SAR_ADC_CHAN(4),
-	MESON_SAR_ADC_CHAN(5),
-	MESON_SAR_ADC_CHAN(6),
-	MESON_SAR_ADC_CHAN(7),
-	IIO_CHAN_SOFT_TIMESTAMP(8),
+	MESON_SAR_ADC_CHAN(INDEX_CHAN_0),
+	MESON_SAR_ADC_CHAN(INDEX_CHAN_1),
+	MESON_SAR_ADC_CHAN(INDEX_CHAN_2),
+	MESON_SAR_ADC_CHAN(INDEX_CHAN_3),
+	MESON_SAR_ADC_CHAN(INDEX_CHAN_4),
+	MESON_SAR_ADC_CHAN(INDEX_CHAN_5),
+	MESON_SAR_ADC_CHAN(INDEX_CHAN_6),
+	MESON_SAR_ADC_CHAN(INDEX_CHAN_7),
+	IIO_CHAN_SOFT_TIMESTAMP(INDEX_CHAN_SOFT_TIMESTAMP),
 	MESON_SAR_ADC_TEMP_CHAN(), /* must be the last item */
 };
 
@@ -1003,7 +1015,7 @@ static int meson_sar_adc_calib(struct iio_dev *indio_dev)
 	meson_sar_adc_set_chan7_mux(indio_dev, CHAN7_MUX_VDD_DIV4);
 	usleep_range(10, 20);
 	ret = meson_sar_adc_get_sample(indio_dev,
-				       &indio_dev->channels[7],
+				       &indio_dev->channels[INDEX_CHAN_7],
 				       MEAN_AVERAGING, EIGHT_SAMPLES, &value0);
 	if (ret < 0)
 		goto out;
@@ -1011,7 +1023,7 @@ static int meson_sar_adc_calib(struct iio_dev *indio_dev)
 	meson_sar_adc_set_chan7_mux(indio_dev, CHAN7_MUX_VDD_MUL3_DIV4);
 	usleep_range(10, 20);
 	ret = meson_sar_adc_get_sample(indio_dev,
-				       &indio_dev->channels[7],
+				       &indio_dev->channels[INDEX_CHAN_7],
 				       MEAN_AVERAGING, EIGHT_SAMPLES, &value1);
 	if (ret < 0)
 		goto out;
-- 
2.38.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
