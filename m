Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38415C4167B
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Nov 2023 23:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J9G70deQGir0pkRdRpSfqSetDy+1uylAFWM7sQzp4Ck=; b=TFXu8ym+rLcwQv
	0SY4FlxweygcMiR1lMehbXpl/H1jm1L79TQs2aR6lZ982dpxO/iG3syX4ApsJ3GhEGT3bPTCxW978
	9ciiIbVRHxfe+pkm5JoFdzvGDy8aMakWAQLwBPkfSdM7PFQVM75yghvHG2P+I4i18CLMKsmPAEPNy
	+QjccHV2DKzJShi4F680SdKvKNjZ13buvHf+3mT7vxucBSoKZLjpzTH0WT8Cbqco+dErsA54bxut6
	3JBKPFIKJmHidvGqJCLmCrN8GjZU+RSKWT8OIX/ulUEAEbrGmvssfwABxr9+/9QcgD2jQIw1+Y87c
	0r6uGoiGeX2V6SQptoyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7lSe-003hv5-1a;
	Mon, 27 Nov 2023 23:56:20 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7lSa-003htx-0B;
	Mon, 27 Nov 2023 23:56:18 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id DDD26120015;
	Tue, 28 Nov 2023 02:56:06 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru DDD26120015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1701129366;
	bh=CJtUvORyiS7SGX4uAfp8J1IHEbYRh5RzK5Kl1l27Yd8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=UK7vCiWoyNz2a19lk9i/BpUUH9gFRhIb0HaKI+xnW8LrOqhU+fohNsLI4bkJ7JYJM
	 W+3Lcm1a/1ovHOhPFaBlNiRQg/PvGLbW0YwmvE7AmvRXvlGNrc1VzuogNJ6GzwLc+0
	 5B7dA4Cb+FH2CtTKczK7pwEcTJUrAyBoF19gfRV+CEQCIck3XDXtYrhrXXQ3Oh4uQC
	 86XTLEl1o1bMv+KxlYJiL6Kyzaa2afvTS+iLhgz1QwCOfjHIXVV9HRrkacf9B/axF2
	 oPYZ9qK0djKPiLv66XlGNtyw7s8EW/q8jo9nF5WYDlorKzxwbUPQeMtwbDn13eTVR1
	 W6t+oFsU5LaQQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 28 Nov 2023 02:56:06 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 28 Nov 2023 02:56:06 +0300
From: George Stark <gnstark@salutedevices.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <u.kleine-koenig@pengutronix.de>,
	<gnstark@salutedevices.com>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@salutedevices.com>
Subject: [PATCH v3 1/1] iio: adc: meson: add separate config for axg SoC family
Date: Tue, 28 Nov 2023 02:55:58 +0300
Message-ID: <20231127235558.71995-1-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181630 [Nov 27 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 5 0.3.5 98d108ddd984cca1d7e65e595eac546a62b0144b, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;salutedevices.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/11/27 21:09:00 #22555279
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_155616_785644_BEE2BC53 
X-CRM114-Status: GOOD (  12.01  )
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

According to Amlogic custom kernels ADC of axg SoC family has
vref_select and requires this setting to work nominally and thus
needs a separate config.

Fixes: 90c6241860bf ("iio: adc: meson: init voltage control bits")
Signed-off-by: George Stark <gnstark@salutedevices.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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
