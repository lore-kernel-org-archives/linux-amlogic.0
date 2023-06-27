Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63BBEB64D9
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jun 2023 22:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4QnEWKdacgvUPmszWFIX/QaI8vcXAZMQ7lKEFTc41o=; b=eYhRZi/CBAXtBS
	0qpExlfSdx+O+4M/xDcRxj75GFCZAtJSLLCBH5oshURNx0WFvv7dwerVXgyfYGxSGm1xIL2YS/u6y
	olfdbdnlusLMZh6tJduDtafjNjVPzYTZm/f+znZv4QZZqNA2H0z3WmGqKC9FBxwEhSGDl7qjUzwFV
	bsZGbaJ6ceOzahenaANuqdrdgCXCC6M4T4XDf113d1yKalCqkr7k3dABwar+TYbtGo7SNlhoI5uM3
	L09TZQCs8P1PRSvP6smyTz5CMxo3Li1fomhfmcrcbHxFEC2rikILzZkN4AnlnTeO5OmRzoqx01wm1
	K2/0NogYv0MgBMs5Rp0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEHN4-00EKHr-2I;
	Tue, 27 Jun 2023 22:41:14 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEHN1-00EKFw-1W;
	Tue, 27 Jun 2023 22:41:13 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 5CBE9120008;
	Wed, 28 Jun 2023 01:40:34 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 5CBE9120008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1687905634;
	bh=fGkHaSpBhZc/5j/U10QNDIDrMkJ0Fz7Q81mDkVTHDy8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=eTdBVcsYXOzcwKlEbqu8swR5qSIj+2HRsAJqr9FQwaOPIYw+OdTmaJvt4TQ1btO+0
	 ncPlcW6U707TNlb5oqMJdgjljQZUjlGrHKMAbf1VZlr6bAVzscjS30ciZff2rGWmDE
	 hgg0zSvHzi4qfVvP3YF9ZemOi75Yy9DpbdliP0nkWhj+LtnDVeEUzWK7jriU5UklFI
	 PqB0GTYGHkCvF7DKL1/k1T95rgO0W5srSKWhg06rn/B/KMEdU816BDPaPWstncA9pz
	 lZq1zpynJ+tbn8xpuFjT7hGGlkRydckkc7sHvuNvFOAudBbHjSmKvujmhJ0pUyf5JC
	 PPw2TcxlFL8AQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 28 Jun 2023 01:40:33 +0300 (MSK)
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
Subject: [PATCH v3 4/5] meson saradc: add channel labels
Date: Wed, 28 Jun 2023 01:37:17 +0300
Message-ID: <20230627224017.1724097-5-gnstark@sberdevices.ru>
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
X-CRM114-CacheID: sfid-20230627_154111_874395_DCCFD89C 
X-CRM114-Status: GOOD (  11.42  )
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

Add attribute 'label' to all iio channels.

Signed-off-by: George Stark <GNStark@sberdevices.ru>
---
 drivers/iio/adc/meson_saradc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index b87f05dfb322..85970fe852af 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -1058,8 +1058,20 @@ static int meson_sar_adc_calib(struct iio_dev *indio_dev)
 	return ret;
 }
 
+static int read_label(struct iio_dev *indio_dev,
+		      struct iio_chan_spec const *chan,
+		      char *label)
+{
+	if (chan->type == IIO_TEMP)
+		return sprintf(label, "%s\n", "temp-sensor");
+	if (chan->type == IIO_VOLTAGE)
+		return sprintf(label, "channel-%d\n", chan->channel);
+	return 0;
+}
+
 static const struct iio_info meson_sar_adc_iio_info = {
 	.read_raw = meson_sar_adc_iio_info_read_raw,
+	.read_label = read_label,
 };
 
 static const struct meson_sar_adc_param meson_sar_adc_meson8_param = {
-- 
2.38.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
