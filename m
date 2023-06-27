Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B08C001B3
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jun 2023 22:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SzePCuhJZpChDLA5FdzK/1iGFNRfWzxeUdhsmSzhijA=; b=OkufkqUxh8HTeJ
	d0RiryaeYBGjtuFtYUraCKdr1X2DKUT1hqKGRjN3GMEhToiIau7Dbnt3hKTgsxkmfvV444BMTz30b
	Lp/kahydhzc4spGhzVJgt8IGGUeUVrD1I2hBy9rJgvI3zKWiKZXsI8BYvHOah7XmWKQLL95eKFxHv
	/lsMTxxJz8cfjsP0tw5OkBdr2SKcIZxJJkxJc2bD98MkAwGDXul3fR0xn34OIUNmwA4JHLZj4UwKa
	E93ws2kLUaZlWbMzUpWsTjw7q5aT5SFRfEI/NrDF6Rf4hdcBxRqwx/EcQjgsDsDJryrWkEVG0iiJK
	ECzOXXzwYiV4Ds9wmEUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEHN5-00EKIC-0L;
	Tue, 27 Jun 2023 22:41:15 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEHN1-00EKFd-1W;
	Tue, 27 Jun 2023 22:41:13 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id E3171120005;
	Wed, 28 Jun 2023 01:40:30 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru E3171120005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1687905630;
	bh=LSrYU9Za3aez8EGwCKmAePmxhFcW4UYhK9sMcYhgfkg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=n7f8qvfHYgfGX/Pfta/RcE08RYeM0CO7vAv1eNMXrRhn4ov5WApS+EeNq4c/XC+2s
	 XAyrOTawobECKrBgGatDt0c7kmT6HcQPSoNPdj+aNoj+BGWGBFpXsNwzPbIDBmzt/m
	 wz51uQN3s02lwDUpfTfwunSm4pyr+/W2yMctLoDDEK0MbcY450uCg0nBy+eXo5kKyy
	 ORVUtxqBSdA9TEPg375XIzcAIEHnWypsb82QwgSUzTmFMpWOS1B5MTooqsTQ0A2201
	 soU307sdVJbAix4f1AvkRa4186LyEEqhQqVZIZ6Zb+Cfjo3uDWJycxhK97eFKlEU+L
	 bURLeV3kaKPtw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 28 Jun 2023 01:40:29 +0300 (MSK)
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
Subject: [PATCH v3 1/5] meson saradc: move enums declaration before variables declaration
Date: Wed, 28 Jun 2023 01:37:14 +0300
Message-ID: <20230627224017.1724097-2-gnstark@sberdevices.ru>
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
X-CRM114-CacheID: sfid-20230627_154111_871623_50A0D89D 
X-CRM114-Status: GOOD (  11.34  )
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

Move enums declaration before variables declaration.

Signed-off-by: George Stark <GNStark@sberdevices.ru>
---
 drivers/iio/adc/meson_saradc.c | 44 +++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 18937a262af6..af38d95bd504 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -202,6 +202,28 @@
 	.datasheet_name = "TEMP_SENSOR",				\
 }
 
+enum meson_sar_adc_avg_mode {
+	NO_AVERAGING = 0x0,
+	MEAN_AVERAGING = 0x1,
+	MEDIAN_AVERAGING = 0x2,
+};
+
+enum meson_sar_adc_num_samples {
+	ONE_SAMPLE = 0x0,
+	TWO_SAMPLES = 0x1,
+	FOUR_SAMPLES = 0x2,
+	EIGHT_SAMPLES = 0x3,
+};
+
+enum meson_sar_adc_chan7_mux_sel {
+	CHAN7_MUX_VSS = 0x0,
+	CHAN7_MUX_VDD_DIV4 = 0x1,
+	CHAN7_MUX_VDD_DIV2 = 0x2,
+	CHAN7_MUX_VDD_MUL3_DIV4 = 0x3,
+	CHAN7_MUX_VDD = 0x4,
+	CHAN7_MUX_CH7_INPUT = 0x7,
+};
+
 static const struct iio_chan_spec meson_sar_adc_iio_channels[] = {
 	MESON_SAR_ADC_CHAN(0),
 	MESON_SAR_ADC_CHAN(1),
@@ -227,28 +249,6 @@ static const struct iio_chan_spec meson_sar_adc_and_temp_iio_channels[] = {
 	IIO_CHAN_SOFT_TIMESTAMP(9),
 };
 
-enum meson_sar_adc_avg_mode {
-	NO_AVERAGING = 0x0,
-	MEAN_AVERAGING = 0x1,
-	MEDIAN_AVERAGING = 0x2,
-};
-
-enum meson_sar_adc_num_samples {
-	ONE_SAMPLE = 0x0,
-	TWO_SAMPLES = 0x1,
-	FOUR_SAMPLES = 0x2,
-	EIGHT_SAMPLES = 0x3,
-};
-
-enum meson_sar_adc_chan7_mux_sel {
-	CHAN7_MUX_VSS = 0x0,
-	CHAN7_MUX_VDD_DIV4 = 0x1,
-	CHAN7_MUX_VDD_DIV2 = 0x2,
-	CHAN7_MUX_VDD_MUL3_DIV4 = 0x3,
-	CHAN7_MUX_VDD = 0x4,
-	CHAN7_MUX_CH7_INPUT = 0x7,
-};
-
 struct meson_sar_adc_param {
 	bool					has_bl30_integration;
 	unsigned long				clock_rate;
-- 
2.38.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
