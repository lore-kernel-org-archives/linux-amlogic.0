Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71708C001B0
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jul 2023 11:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C6EkQS35riw1k7cmfUU608X5FkMon67MFQ6vH4O7ZvQ=; b=FgFx9HsW5FxjaK
	w8JQiQ02pduw/pZzt1mff5KWFnroEsVEjw2q5zfSiVkY+RDr1YcQh88ytrLeaDmHXLBHadCJeU96O
	p7wgkblvOafjLiQY8HSdMH3CdbnKSo9qIH/dIKU4XtTjQphId9Wpm9QpqZ4zZCFpsB9EEPZH9aGjH
	DFRHsP+hABou6Ok6jFm56ARyP3M/6EOHEWEF8WA5kQUIxB5mmDU972N7TQ92hwDKOWCyuczCM4o4G
	OlaaqAGnXUcLTMh1RVHfiDF8q8g0j/8R6k8qCdhVuaoKh7uDo4jrscHScbUCwsVlW6Kaaeu5rX2hH
	v0XvqQ133WYBwsRhTQVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKd7L-008XMh-1K;
	Sat, 15 Jul 2023 11:07:15 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKd7H-008XKg-2B;
	Sat, 15 Jul 2023 11:07:14 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 14FC2100006;
	Sat, 15 Jul 2023 14:07:03 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 14FC2100006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1689419223;
	bh=uzjZyhESz+VGISOfZsao53vOWFInLG46m6Rl5JmIEbE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=q8uuya69cupVj+K0t6x1FUP95DZwX6Loeg0Uthv+GfUE6GNVZtT4gAYKlEZJrksFA
	 cNarILwtoLQP+L7v/kUV0QT/qLGutLarQM3eJxC9dyDcDNQj+N9Zaq3RiQ5f3StT9R
	 S3GMfNFK6B+pxjn3jbWE7Hqa4iq8IkIXFPWR7rwAx8PUDjtIgSG5guyfBGHitmoRRx
	 WYYPqtVVhlnpBTxat8q+2mrF0tIUMiTdXCJNZdDxQuA7ipP3aPff9x0nr9gz1RohlG
	 zS/JLpUhAYKN2B5Pxh7WBbIZ+9fg34BnezG1w+yQh5PS/JwUNmtJWx9jFDwdQSWA7p
	 1fhlY7Qv5hm8w==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sat, 15 Jul 2023 14:07:02 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Sat, 15 Jul 2023 14:06:23 +0300
From: George Stark <gnstark@sberdevices.ru>
To: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <gnstark@sberdevices.ru>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>
Subject: [PATCH v1 1/3] iio: adc: meson: init channels 0,1 input muxes
Date: Sat, 15 Jul 2023 14:05:58 +0300
Message-ID: <20230715110654.6035-2-gnstark@sberdevices.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230715110654.6035-1-gnstark@sberdevices.ru>
References: <20230715110654.6035-1-gnstark@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178635 [Jul 15 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: GNStark@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 523 523 523027ce26ed1d9067f7a52a4756a876e54db27c, {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/15 07:52:00 #21618415
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_040712_423850_478723A2 
X-CRM114-Status: GOOD (  10.46  )
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

Set up input channels 0,1 muxes in the same way as for the channels 2-7
later in the code.

Signed-off-by: George Stark <gnstark@sberdevices.ru>
---
 drivers/iio/adc/meson_saradc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 2411cc864ccd..524e5569381e 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -899,6 +899,22 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
 			   MESON_SAR_ADC_CHAN_10_SW_CHAN1_MUX_SEL_MASK,
 			   regval);
 
+	regmap_update_bits(priv->regmap, MESON_SAR_ADC_CHAN_10_SW,
+			   MESON_SAR_ADC_CHAN_10_SW_CHAN0_XP_DRIVE_SW,
+			   MESON_SAR_ADC_CHAN_10_SW_CHAN0_XP_DRIVE_SW);
+
+	regmap_update_bits(priv->regmap, MESON_SAR_ADC_CHAN_10_SW,
+			   MESON_SAR_ADC_CHAN_10_SW_CHAN0_YP_DRIVE_SW,
+			   MESON_SAR_ADC_CHAN_10_SW_CHAN0_YP_DRIVE_SW);
+
+	regmap_update_bits(priv->regmap, MESON_SAR_ADC_CHAN_10_SW,
+			   MESON_SAR_ADC_CHAN_10_SW_CHAN1_XP_DRIVE_SW,
+			   MESON_SAR_ADC_CHAN_10_SW_CHAN1_XP_DRIVE_SW);
+
+	regmap_update_bits(priv->regmap, MESON_SAR_ADC_CHAN_10_SW,
+			   MESON_SAR_ADC_CHAN_10_SW_CHAN1_YP_DRIVE_SW,
+			   MESON_SAR_ADC_CHAN_10_SW_CHAN1_YP_DRIVE_SW);
+
 	/*
 	 * set up the input channel muxes in MESON_SAR_ADC_AUX_SW
 	 * (2 = SAR_ADC_CH2, 3 = SAR_ADC_CH3, ...) and enable
-- 
2.38.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
