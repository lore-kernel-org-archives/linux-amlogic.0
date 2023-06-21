Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1999CEB64D7
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jun 2023 06:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RAcEd9ZJqHL9h5IuKJ7jVC87x5BQk+Qmx47r/jIQ5eA=; b=kkB8LYPAAxFCzY
	e0tszVOSAOIYSsbzUcMkvYva4xxsMwRjLHCgExG6/Q3a0lFdRHGjh/ZxN0b6JbFJmVi5xCDVi5xN6
	S7h1yDgOeBVnfx04iSYZ0YPTr0beeO0MXYEjK7fgT3a/awLni/cw6zGOeANGdDK2YVQ3BS4WgwTgU
	cTKg4tE4LNC2vn9Uu0e/LQt4/EpSFhdw4kBivU6+lEeao72YkGhnuYYOQMTDsXTmoYr8KDWmfmb5m
	QJqk1JS6dsrYivu+LQk2oCIYBV/yUL6aVt6KInyL6AL2Nx4fsKqUJTJOS2OajQUdBABL1g2QLyuvP
	Rg+EyES7dNC2QFiK5iiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBrJj-00DPkY-1n;
	Wed, 21 Jun 2023 06:27:47 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBrJa-00DPh2-2r;
	Wed, 21 Jun 2023 06:27:43 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id C4C645FD60;
	Wed, 21 Jun 2023 09:27:35 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1687328855;
	bh=YQ2V6XFLUgswbRr9qW2w1qbMLzV+8NemKwLTVnCTW20=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=P0RFbgc1pyUJ+agr3Fgq7ek7/svzYSn2J7N/OS6uTcZg3B2a3hwDtBp3UxcU8q6C/
	 l9pVg5ImyYIR9AAxNXQXS52aA+jUJdlXNTYIZBOtshfy00OCyYV4EdqmHBkW/G3Swy
	 IukM5IA8dgn1ha9uNv8TsLQ2RHNYvG+CnaDCe67Aqe6XzFvoqnwweXrd/KDLccrrv1
	 l8WPnwsu/9F9vQMyukKr0DfRSSZFL12ixfY8TTAHdEt7GxfowuUmjuH7/vHQoRki59
	 kLrG/ffRzaJEwQm0zAhP7YWY3rSEpmd5+6P1UvHswnO+gD3xszicSOy1ZB+NBVDjre
	 vuVpuXmi3CRmA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 21 Jun 2023 09:27:35 +0300 (MSK)
From: George Stark <gnstark@sberdevices.ru>
To: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <gnstark@sberdevices.ru>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>, George Stark <GNStark@sberdevices.ru>
Subject: [PATCH v1 2/3] meson saradc: add channel labels
Date: Wed, 21 Jun 2023 09:26:09 +0300
Message-ID: <20230621062715.455652-3-gnstark@sberdevices.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621062715.455652-1-gnstark@sberdevices.ru>
References: <20230621062715.455652-1-gnstark@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/20 23:30:00 #21539802
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_232739_119998_CE52CFEE 
X-CRM114-Status: UNSURE (   9.24  )
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

patch adds channel attribute 'label' with channel name

Signed-off-by: George Stark <GNStark@sberdevices.ru>
---
 drivers/iio/adc/meson_saradc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 42f0389e123d..66d6f527122c 100644
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
