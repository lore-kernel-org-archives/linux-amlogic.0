Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E114EB64DA
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jul 2023 23:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hbtbACdnksSswAgXy8nze6j08zVm5sBaloojkKy8/Ng=; b=YMPjsngYwYPdQw
	pf9AU+WpjCUCFORRMl4Jp3hL3U0z2hjwb0NGYJEzUcpzewWCFO/0VTHnUgqEzwSpWFIzETSwPIWU6
	GLr5VzfKuUH+jHOHRmv4Vmn6zG4/DpFOXLW8XtGs5ZJ7OlaGkYvF/TL3KeocY0E0A2C96SVxDkcPC
	XZucfmgwZ5TLur+sacE0njkWZe8G54b9nLxw0EWGoSI8pxyJx/e8kiFrFTZ1h2DDZuMk/knaDCT5n
	fWflodicpHXMlNZ0s2siTPe7abjttLGCQ4FBBZSQFs62s9V/Gm7fKNFOqjUG0wP1kEO4MxGo2LT+H
	hQS2Rbxi3axnA0pSoaUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJj0K-001Sk3-1d;
	Wed, 12 Jul 2023 23:12:16 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJj0F-001Sfh-0u;
	Wed, 12 Jul 2023 23:12:13 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 7FEB1120025;
	Thu, 13 Jul 2023 02:12:07 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 7FEB1120025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1689203527;
	bh=m3UMUUxQmGpFqfZrTXPJiSCifxETsKYb/UHHJV0Y7yo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Ck87GP39hGj3h7T86NNXyrrjLcxNs6KmPSSRhmMvsb4mgY+v1zPJIWcSs901m/h9j
	 RWEHiqcG56tv2vHzvZ2k9HOcXGb2DxT6JFssAoJVI6hj5qdquibdKK3wYsvcuTM47o
	 DMwWeT6nojRHpGo8NO0eVRKEiNSX14AEM1jAseyeSnQ/E0O5GBthe01rxPwdj776wz
	 g3Ff+ySIS5SeXHfdr/ofd+Q1kz7GeASUVwq8YQpdlIfucRHLHSiNoYWCoklsf3p4FY
	 JbdBDsTjr8dD01qZAZ4EvMGEMeXzwmxNC7AfoLg0ZTt7pGMhGpWk6ZB0s0PGK/ZrXy
	 HRIaAY6oDgDWg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 13 Jul 2023 02:12:07 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 13 Jul 2023 02:11:47 +0300
From: George Stark <gnstark@sberdevices.ru>
To: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <gnstark@sberdevices.ru>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>, George Stark <GNStark@sberdevices.ru>
Subject: [PATCH v6 1/6] iio: adc: meson: remove unused timestamp channel
Date: Thu, 13 Jul 2023 02:10:42 +0300
Message-ID: <20230712231157.261245-2-gnstark@sberdevices.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230712231157.261245-1-gnstark@sberdevices.ru>
References: <20230712231157.261245-1-gnstark@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178587 [Jul 12 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: GNStark@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 521 521 0c3391dd6036774f2e1052158c81e48587b96e95, {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:7.1.1,5.0.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/12 10:49:00 #21602221
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_161211_680141_4ECF11D3 
X-CRM114-Status: GOOD (  11.48  )
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

Remove IIO_CHAN_SOFT_TIMESTAMP channel because it's used only for
buffering mode which is not implemented.

Signed-off-by: George Stark <GNStark@sberdevices.ru>
---
 drivers/iio/adc/meson_saradc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 18937a262af6..569ffc178935 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -211,7 +211,6 @@ static const struct iio_chan_spec meson_sar_adc_iio_channels[] = {
 	MESON_SAR_ADC_CHAN(5),
 	MESON_SAR_ADC_CHAN(6),
 	MESON_SAR_ADC_CHAN(7),
-	IIO_CHAN_SOFT_TIMESTAMP(8),
 };
 
 static const struct iio_chan_spec meson_sar_adc_and_temp_iio_channels[] = {
@@ -224,7 +223,6 @@ static const struct iio_chan_spec meson_sar_adc_and_temp_iio_channels[] = {
 	MESON_SAR_ADC_CHAN(6),
 	MESON_SAR_ADC_CHAN(7),
 	MESON_SAR_ADC_TEMP_CHAN(8),
-	IIO_CHAN_SOFT_TIMESTAMP(9),
 };
 
 enum meson_sar_adc_avg_mode {
-- 
2.38.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
