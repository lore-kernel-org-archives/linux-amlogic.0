Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29365EB64DC
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jun 2023 22:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Si48g7cIjrBxylc2s6fqIMAnLcgKsssiI2EMHDt6to4=; b=HpaobU5LR4yp2s
	S2JatM15SO0xndDvVBYmuqDk6+Dowrce1QNzqu6/G1H+UKL7rLODrSbZeA1aKr3bQZPILpDwiNJ6a
	u6taE7HZ/0HaqMhNs4MYXFhvrxgcMk58LkSXzdcDVKZxoM6hCR7ylhyrzDF5EGyuSXYI6Yrxmdtl6
	WYii820YneneEOySICXOSwmNVdTgX75/4sVYkher4Ot+y018cp47C7+tECXYgeN9yZJ5lkpkG6ita
	D6mk7FLhxkdRBGQ1zthTe+zLz6NYzBlxeiQxogRIowjFpD8bOGjX7TV+hRtz13rxFOA450BvsoZpV
	9GzIkqw48OqDcLf+aN0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEHN7-00EKJZ-1w;
	Tue, 27 Jun 2023 22:41:17 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEHN1-00EKFe-1W;
	Tue, 27 Jun 2023 22:41:14 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 14E9D120006;
	Wed, 28 Jun 2023 01:40:32 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 14E9D120006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1687905632;
	bh=rc3qX8KRQTMzSGALx1FQDUphrLTDt4aHKYVi/7eAovo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=RiCvJHIQcUHyD3+08SlE+wff9SKwWNrVUEcTebeiiBCKgiBImZhpVA8/z+rhDvDJB
	 Omn712+V3UtH0zMfFMBNoXQSNROiKOEmLER0NG82SrchtYXfCIw2V8Q/MwVsKMDiNL
	 C0HTeU/qkKUQQGJQGUHgOzyFoWfFbax4IYEQWEp2FAGtjwt5rQHqc/esznBU/m/qcT
	 HB2QGgXAjETU+VitQD5mtV/amUcxZHrcjVERE8YKadPUpn4/lD8jqqoZr/8rpZIOD/
	 qHaSytlb6W2iNxyaMW9TAlQEyyYtvfBLubOBZv/8H1u8IiUfjfHVwf2Qu9INe6M+ej
	 tqiJ8slg47o4w==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 28 Jun 2023 01:40:30 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 28 Jun 2023 01:39:34 +0300
From: George Stark <gnstark@sberdevices.ru>
To: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <gnstark@sberdevices.ru>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>, George Stark <GNStark@sberdevices.ru>
Subject: [PATCH v3 2/5] meson saradc: move meson_sar_adc_set_chan7_mux routine upper
Date: Wed, 28 Jun 2023 01:37:15 +0300
Message-ID: <20230627224017.1724097-3-gnstark@sberdevices.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230627224017.1724097-1-gnstark@sberdevices.ru>
References: <20230627224017.1724097-1-gnstark@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178297 [Jun 27 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: GNStark@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 517 517 b0056c19d8e10afbb16cb7aad7258dedb0179a79, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/06/27 18:27:00 #21588965
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_154111_884945_0436CDA2 
X-CRM114-Status: GOOD (  11.16  )
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

Move meson_sar_adc_set_chan7_mux routine upper.

Signed-off-by: George Stark <GNStark@sberdevices.ru>
---
 drivers/iio/adc/meson_saradc.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index af38d95bd504..6e69b40b3309 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -338,6 +338,19 @@ static int meson_sar_adc_wait_busy_clear(struct iio_dev *indio_dev)
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
@@ -434,19 +447,6 @@ static void meson_sar_adc_enable_channel(struct iio_dev *indio_dev,
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
-- 
2.38.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
