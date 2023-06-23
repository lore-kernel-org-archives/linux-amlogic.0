Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891E3EB64DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jun 2023 02:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XyMB/p9MOcdJ9tHz/u8Gly2/GYZoeeFpir0sUfAoWCY=; b=I/+SBsVmY4IiPq
	uV6iJ4Qwkl9nr9ShmfCmLiSY+KK68wjFDPFChQmRaL9HM0dtUT2+v6CIrRl2+kSmQ45iVXNWAlStg
	vt/6Y59AESllY1S1kf7+yfIqwbL58txWHLIPQe0U9ZgWyuZGjyJ/aBuxrYWEV5P+9Yzc0m10Y4/Rt
	+iwvQlbuZXPYTA4YPhOwRX2uSMcuCRIEhOWhIwqwHlkdq/SpQBabp/cbGOGanDHN+9yLOmSjlDDIs
	oCk+BGiozKr6SQdjLlwWojE0lXogAVHFTimbNRCrr2BwsxbvKsqMdKdGUmRimUTewKyQ1WYcGAMzf
	grrl0SwAcFN3P3Y33+lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCWTF-002K4J-0l;
	Fri, 23 Jun 2023 02:24:21 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCWSw-002Jt2-1p;
	Fri, 23 Jun 2023 02:24:04 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id A65DB5FD66;
	Fri, 23 Jun 2023 05:23:54 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1687487034;
	bh=yGw6bp8rvMgtKlw7MfG3NQJsW3rgZ+48z4t6tgdQl5A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SQfezWoQUw91CXnAJuGgsda09wgT4veJgufAKFqHIVzEWuGMW9zal7vDWqaRDhaRL
	 lt9ZGqr/oqWg1CZ9khRL8kgyWLc6Sqv0GI6hBnjK91uwLxeE+FoeFgB40Z33ZbA3Js
	 vY3fVKzvmPCb9+S/tcniHM3OE3XrP6C233+tZ45foRlT/5uCtbmkyFmjXeythZi7lg
	 StvbLYLOw6qGXpnFYj4PDRPs1yrBJ0NijYiMglo6K/UecY5DLchEMsD3zo2AB4O8Ni
	 1/5LX0iCC0k7VZOcu412pn3Mo8MD0VZdsAW8qy+GkK10oIcpNufSiLdgtlO94Mto3C
	 8eziUJpe906tw==
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
Subject: [PATCH v2 5/6] meson saradc: add channel labels
Date: Fri, 23 Jun 2023 05:20:13 +0300
Message-ID: <20230623022334.791026-6-gnstark@sberdevices.ru>
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
X-CRM114-CacheID: sfid-20230622_192402_793757_3A7BB4C6 
X-CRM114-Status: UNSURE (   8.87  )
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

Add attribute 'label' to all iio channles

Signed-off-by: George Stark <GNStark@sberdevices.ru>
---

Changelog:
v1->v2: update commit message from [1]

[1] https://lore.kernel.org/lkml/20230621062715.455652-3-gnstark@sberdevices.ru/

---
 drivers/iio/adc/meson_saradc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 7ef006650982..e7eb154b151f 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -1044,8 +1044,20 @@ static int meson_sar_adc_calib(struct iio_dev *indio_dev)
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
