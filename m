Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296A6C5ACB3
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Nov 2023 07:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tZ+jFcdzPM3++Ac55gliHreKz6rSPS6BrLMuxSN7woE=; b=2ZbK4vahN0myxm
	uQO8e0LsnM254VtbHahoX1cj4otU8EKOMiUB3dMStQswRRj2OBLuyRDEV1thEU0XJVVxCION1rXl9
	nKLXOHh40ygL0LB5aRYOg+U02u3K46Rnr6LFlI9X8Nejij8hC5R6nrAszFx4zjknAYZAzhnQFE32C
	7OubQFd5hjK1GDP8/oGQ2SCbEyP+n+YQlBhRKQI7yPlMc+aKDO+HFeGrDo48qoRA4KRn5sieFfMBo
	g4hIXlqKUh/4JTdh0ax9bjDip3LeLmzDhY3zAhtw8qy3S1TU/1ruhSFWwHUIuM5vx6iworFR0PdhH
	5yM5inW8R88NdV63K1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5LWW-00FwKm-26;
	Tue, 21 Nov 2023 07:50:20 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5LWS-00FwJt-2F;
	Tue, 21 Nov 2023 07:50:19 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 0FF9B10000A;
	Tue, 21 Nov 2023 10:50:10 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 0FF9B10000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1700553010;
	bh=0WELMaCNNccOLdD1SLZ+BioYKABuEVgaCyabuvIP7gQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=sbT8afONwaXW+D/Cv7SGe30LrK/ezzGk4RXjg1gmiihW7/cPUivpHgeZEsPIkHT+h
	 nqwR/H20u9zF9xt+chkWoB0qaQkNHVYmPqnazWWPkdE/YRiVnjbYi+e92cJUOTFG8E
	 1wtsDyLRjiLzOncuB0RfH2SMXINUKtUxVJMPeYQnYQlQvwDbNiagyTxkhg8trHEXci
	 BWuO66Mt21KZfAfxpkeSElOHxDKRm2vanhtp3s4bmXKPTqfzp9b5LKA9GD43zBAN4K
	 iqYZCH86RQdRYWAbJtkPcbeddrvpV4zkkMe4pvTyLKdVNz+T9GoGgCCoLK5C7qOdK/
	 Cyd7yASQfVcSw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 21 Nov 2023 10:50:09 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 21 Nov 2023 10:50:09 +0300
From: George Stark <gnstark@salutedevices.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <u.kleine-koenig@pengutronix.de>,
	<gnstark@salutedevices.com>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@salutedevices.com>
Subject: [PATCH] iio: adc: meson: add separate config for axg SoC family
Date: Tue, 21 Nov 2023 10:50:00 +0300
Message-ID: <20231121075000.133711-1-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181493 [Nov 21 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/11/21 04:39:00 #22491233
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_235017_446704_999A18C3 
X-CRM114-Status: GOOD (  12.37  )
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

According to Amlogic custom kernels ADC of axg SoC family requires
unique number of setting so add dedicated config for it.

Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 drivers/iio/adc/meson_saradc.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index db280da9edbf..34555a85f131 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -1242,6 +1242,20 @@ static const struct meson_sar_adc_param meson_sar_adc_gxl_param = {
 	.cmv_select = 1,
 };
 
+static const struct meson_sar_adc_param meson_sar_adc_axg_param = {
+	.has_bl30_integration = true,
+	.clock_rate = 1200000,
+	.bandgap_reg = MESON_SAR_ADC_REG11,
+	.regmap_config = &meson_sar_adc_regmap_config_gxbb,
+	.resolution = 12,
+	.disable_ring_counter = 1,
+	.has_reg11 = true,
+	.vref_volatge = 1,
+	.has_vref_select = true,
+	.vref_select = VREF_VDDA,
+	.cmv_select = 1,
+};
+
 static const struct meson_sar_adc_param meson_sar_adc_g12a_param = {
 	.has_bl30_integration = false,
 	.clock_rate = 1200000,
@@ -1286,7 +1300,7 @@ static const struct meson_sar_adc_data meson_sar_adc_gxm_data = {
 };
 
 static const struct meson_sar_adc_data meson_sar_adc_axg_data = {
-	.param = &meson_sar_adc_gxl_param,
+	.param = &meson_sar_adc_axg_param,
 	.name = "meson-axg-saradc",
 };
 
-- 
2.38.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
