Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B78C00528
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jul 2023 11:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1rvbGmRZ299CCV/Xi3KD2Dpc7C4Jso+BeF7HHSyyRBI=; b=ZbLlHVPR0vmpM4
	YiMpnRY9J9Vu4SNulzSsV7jp7QmdIokWjQkmH7gcnZPGBMGaAyvbPJ1GxKMkz7/E74IKn6D7F/LSQ
	c6B9FCjWqgyNzBrzDx19uAGoHrjA1rXkBPCW8OCT8p6r8mWnutUdd1CrcLpCjIjXOcrQ0ZiMcuPdL
	IvRMtabJA0xHruTT9gViZ62ixfBcKyresPN4KzOFU9Tcq5VTRZzMXhwGJ7+qhUsxi3blT6owSPhYr
	6XEDitpE48TCWaNoAD+Kfl/Em0sirST5WQIGHSiLI5814dLYG+DpqjhhXm16DMmwFZYyJb0io3V7/
	eu+Axs8oMzat4CzS7Cow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKHA1-0065Vh-2P;
	Fri, 14 Jul 2023 11:40:33 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKH9x-0065S6-1b;
	Fri, 14 Jul 2023 11:40:32 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 9119712002B;
	Fri, 14 Jul 2023 14:40:20 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 9119712002B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1689334820;
	bh=8XVeudn2UdF5oaJ8pkhcnvk8RE4GczGedzmn9OVBnW4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=qWU3A6K3lk6vE5wM/dvlxM7eGucuhvzuQ7yvf4pvp0wM+er0a5LTipzFoY9tixX5C
	 SGUiKGtAemmqyg2FqvTPq+cH5/RnGexIRV8CBPMl+5vpZRRFp0oCwq5nr4UlRMshfS
	 hZf2bA9xfQwzwO/qGNlSuhMDFjWlyNxhdJoudMndgaLqGlJ4WjRKisgJcPUBGAVr3f
	 JJ4YLgbNY8T9Z1FVhpTOOv7HGFnhnzO1p1O065yAhJAESHYmrfvfXJFrsmVz3erYOq
	 gYzuiZoLh//cXPhXJbcGOACznO+D6+t1vVRWkWEgz5jv5E1Gqp3fVKvsDwa+hdKw16
	 nH6eQH99PYDKw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 14 Jul 2023 14:40:20 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 14 Jul 2023 14:39:48 +0300
From: George Stark <gnstark@sberdevices.ru>
To: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <gnstark@sberdevices.ru>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>, George Stark <GNStark@sberdevices.ru>
Subject: [PATCH v7 5/6] iio: adc: meson: add channel labels
Date: Fri, 14 Jul 2023 14:37:52 +0300
Message-ID: <20230714114010.293440-6-gnstark@sberdevices.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714114010.293440-1-gnstark@sberdevices.ru>
References: <20230714114010.293440-1-gnstark@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178622 [Jul 14 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: GNStark@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 523 523 523027ce26ed1d9067f7a52a4756a876e54db27c, {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:5.0.1,7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/14 02:46:00 #21611850
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_044030_294686_B2038B9E 
X-CRM114-Status: GOOD (  11.20  )
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

Add channel labels to provide human-readable names for the inputs.

Signed-off-by: George Stark <GNStark@sberdevices.ru>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/iio/adc/meson_saradc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index b14c66656bcc..918bd5da3605 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -1055,8 +1055,20 @@ static int meson_sar_adc_calib(struct iio_dev *indio_dev)
 	return ret;
 }
 
+static int read_label(struct iio_dev *indio_dev,
+		      struct iio_chan_spec const *chan,
+		      char *label)
+{
+	if (chan->type == IIO_TEMP)
+		return sprintf(label, "temp-sensor\n");
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
