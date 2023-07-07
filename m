Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32ABC001DF
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jul 2023 15:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hbtbACdnksSswAgXy8nze6j08zVm5sBaloojkKy8/Ng=; b=NHWESrDShXq7y4
	H38XFkR5JbpXDo6LAtbV1wmHX2qtE03+OGkGriOj9wMc9DLN2gkwPDv8D0lF7Gg2cudxLP4+1CeyP
	V9J91XOTN/CV3ADkGAzATw3x01AcvHCtWjjvESKwXPAp6D4RbXIEQxFcaQBpUol2K+ZdmOlPIx8GN
	Ytg3AHqv/IfFLhvAAsYlEvK3ucqKQMMk7JToFYISzwvD6+nOcfsgArxSHD9066wRt6D4lM7ig/gop
	zeCqe0I7HnuoZ4e1IQimffqid6UoBdNPWRbFfx+800QxYl9fEf//soRafsRyPwP9GEflnvUI1x/ik
	pO9V+nIC5fChmIC5bBSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHnSr-0053gD-1m;
	Fri, 07 Jul 2023 15:33:45 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHnSl-0053bs-1s;
	Fri, 07 Jul 2023 15:33:43 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id C505A120011;
	Fri,  7 Jul 2023 18:33:32 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru C505A120011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688744012;
	bh=m3UMUUxQmGpFqfZrTXPJiSCifxETsKYb/UHHJV0Y7yo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=lo0qSycrN05qvwzNFemorzEPjKxdYu6putorNqL6aG+I28Ay2MKmMFr/VRq1PUxW1
	 WPziVn47UOS8mziO9FL5spXex/4zN4WTLvZEdZbMPQPpCMqpxEDwe8DkN3M0Swz0BT
	 Um2Jeqk8Sg6M3twhxeUG19AjJyMoUeZlKgHVXMx7KSvgh8ZhZcRViXSBICpew61mMy
	 mR+YvGPuv9ZAilJhcqY3GqIg/hPaxFWieVP+/PtzR3vPYGYZkgCBN2S0PTylnL78Vg
	 y8GFiUm2tDUgiKf4oxfI38OXYKIumpH3mAicwGzN5br80XD8BnefWADNI5fS15QhKk
	 1AqUNlRcm2a8Q==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri,  7 Jul 2023 18:33:32 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 7 Jul 2023 18:33:15 +0300
From: George Stark <gnstark@sberdevices.ru>
To: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <gnstark@sberdevices.ru>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>, George Stark <GNStark@sberdevices.ru>
Subject: [PATCH v4 1/6] iio: adc: meson: remove unused timestamp channel
Date: Fri, 7 Jul 2023 18:27:38 +0300
Message-ID: <20230707153322.114302-2-gnstark@sberdevices.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230707153322.114302-1-gnstark@sberdevices.ru>
References: <20230707153322.114302-1-gnstark@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178491 [Jul 07 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: GNStark@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;sberdevices.ru:5.0.1,7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/07 03:24:00 #21575635
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_083340_274163_CF4944A5 
X-CRM114-Status: GOOD (  11.10  )
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
