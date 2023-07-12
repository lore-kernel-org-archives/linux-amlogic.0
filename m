Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F4FEB64DD
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jul 2023 23:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPWYngGSdg7YLODmPfFCpTE9STZeokSxjMAafjGR7iY=; b=w0ninZbe8ydaTd
	G0xzsbUgosedOQpZ6V7u6QhzL+QHjfZzlJYQi1GcVjPa5Y6ubjRZKL2N92VsSNVaKVuXCS+EMDy6K
	XJqMgo5nshwVRDRgs9dMxUyoUc5E4ZcJC+soU293nE4FbF87e5JAj4M2r0gj33QJzfJIMb5utRi98
	K4330OKBT6Jb8JibC3cYHvcEqAi9RDNhYdtWhTD74z/L0ntx3HoOBjjRL9uNdM441nYMdbzbV13jk
	JikUO4uRhFND0aSGGQyq4fWlG90t6sEHFs+IHkBif9vohsUVb5Ae2JqDbNWlH+OQ4L2RtCPLeIpJa
	8KndI9FsUeHw7naKTH1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJj0H-001Si2-36;
	Wed, 12 Jul 2023 23:12:13 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJj0E-001Sfc-19;
	Wed, 12 Jul 2023 23:12:12 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 0C0CE100023;
	Thu, 13 Jul 2023 02:12:08 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 0C0CE100023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1689203528;
	bh=98khYn1fztt12eqMcHqL5Q5p7BU+eCOCeF+HxCxX/Ck=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=HWUZo+0l5D7O5Y4TTzYcYdQhy2ZAG2Zb6v4VKQ5ZAfmDke+XSOcGmsi8GN9eFMNdD
	 zeA8G5hrxG5rEzVb0kGkC8FH9Ki5P6PanyASef7032Sr2+WOpuOJNnmW27TWPBhhTR
	 6NgTVn33MI8no7jiE8o5gTeH0LpGIJqpXj/sIVQ36BrlitkIVhR6VKZ3jkmJ6dNhAQ
	 cU/2EWktWFy3RXZ9so2qZBkwLWtG6DsNECo7VfBCXx1p2ZQA0UrLg5WlpuiWExB8Mc
	 teouz4xcwMZTamvd9Ix2Hg8ysMQtU95bKiiDC/5yINbds55/bPkbMHDyjOxZtaNpts
	 2TopbaZoKc0eg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 13 Jul 2023 02:12:07 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 13 Jul 2023 02:11:48 +0300
From: George Stark <gnstark@sberdevices.ru>
To: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <gnstark@sberdevices.ru>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>, George Stark <GNStark@sberdevices.ru>
Subject: [PATCH v6 4/6] iio: adc: meson: add enum for iio channel numbers
Date: Thu, 13 Jul 2023 02:10:45 +0300
Message-ID: <20230712231157.261245-5-gnstark@sberdevices.ru>
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
X-KSMG-AntiSpam-Info: LuaCore: 521 521 0c3391dd6036774f2e1052158c81e48587b96e95, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/12 10:49:00 #21602221
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_161210_744444_93AF94BA 
X-CRM114-Status: GOOD (  12.28  )
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

Channels could be referenced in the driver code and using enum allows
to make it more robust.

Signed-off-by: George Stark <GNStark@sberdevices.ru>
---
 drivers/iio/adc/meson_saradc.c | 46 +++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 44ac6ce5e3aa..b14c66656bcc 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -224,27 +224,39 @@ enum meson_sar_adc_chan7_mux_sel {
 	CHAN7_MUX_CH7_INPUT = 0x7,
 };
 
+enum meson_sar_adc_channel_index {
+	NUM_CHAN_0,
+	NUM_CHAN_1,
+	NUM_CHAN_2,
+	NUM_CHAN_3,
+	NUM_CHAN_4,
+	NUM_CHAN_5,
+	NUM_CHAN_6,
+	NUM_CHAN_7,
+	NUM_CHAN_TEMP,
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
+	MESON_SAR_ADC_CHAN(NUM_CHAN_0),
+	MESON_SAR_ADC_CHAN(NUM_CHAN_1),
+	MESON_SAR_ADC_CHAN(NUM_CHAN_2),
+	MESON_SAR_ADC_CHAN(NUM_CHAN_3),
+	MESON_SAR_ADC_CHAN(NUM_CHAN_4),
+	MESON_SAR_ADC_CHAN(NUM_CHAN_5),
+	MESON_SAR_ADC_CHAN(NUM_CHAN_6),
+	MESON_SAR_ADC_CHAN(NUM_CHAN_7),
 };
 
 static const struct iio_chan_spec meson_sar_adc_and_temp_iio_channels[] = {
-	MESON_SAR_ADC_CHAN(0),
-	MESON_SAR_ADC_CHAN(1),
-	MESON_SAR_ADC_CHAN(2),
-	MESON_SAR_ADC_CHAN(3),
-	MESON_SAR_ADC_CHAN(4),
-	MESON_SAR_ADC_CHAN(5),
-	MESON_SAR_ADC_CHAN(6),
-	MESON_SAR_ADC_CHAN(7),
-	MESON_SAR_ADC_TEMP_CHAN(8),
+	MESON_SAR_ADC_CHAN(NUM_CHAN_0),
+	MESON_SAR_ADC_CHAN(NUM_CHAN_1),
+	MESON_SAR_ADC_CHAN(NUM_CHAN_2),
+	MESON_SAR_ADC_CHAN(NUM_CHAN_3),
+	MESON_SAR_ADC_CHAN(NUM_CHAN_4),
+	MESON_SAR_ADC_CHAN(NUM_CHAN_5),
+	MESON_SAR_ADC_CHAN(NUM_CHAN_6),
+	MESON_SAR_ADC_CHAN(NUM_CHAN_7),
+	MESON_SAR_ADC_TEMP_CHAN(NUM_CHAN_TEMP),
 };
 
 struct meson_sar_adc_param {
-- 
2.38.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
