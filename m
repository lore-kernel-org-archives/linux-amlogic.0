Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D60FEB64D9
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jun 2023 22:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K3YjGMTwWchyn1zqW975/Jx7mwm3ym7fGR/AgG5Z+w8=; b=IuapmroYYBoH1r
	uFQa0/lH47VVjiSTQV3ii+oB4N9iyf1iFy4BV2o6NpVDFFVMtoHmpoPcYrLj+LM68D2pg4pMlwR7R
	GM6PRiZPd4WdYdKtNRHSw92vxK58BkqLad1+2EzQDbAxJT6L/GL0nl3tDZNcb4GcG75epsGC7Bn3d
	q9UyUaK/SGJsMY+d5N9Ix0oxBeW7kir21PBgrJsP+WfLp/sefhId2eaJIvetWn6eQxUfBXaF7Hptm
	ww94DTHtGja4bO0wW1nLunX8VrprmAYyR5Vhg1Se1L9WEPqdGkQZYplgWgUGGdhq7HN8gHqNX9SyE
	AoQzZTDOqen8Wqt/bSgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEHMm-00EKDz-0u;
	Tue, 27 Jun 2023 22:40:56 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEHMh-00EKAs-0t;
	Tue, 27 Jun 2023 22:40:54 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 9F9A3100002;
	Wed, 28 Jun 2023 01:40:26 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 9F9A3100002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1687905626;
	bh=e1cUKFmZg0TXaiRU2tWtXncs27m+jCxjdlCXc/znU2A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=hHjrbZftTb+sAPRvW49lU2m6Q22wjlLjFVYWuTRoWM0rAqaEX527ySUIM/O3Hf9FK
	 7wLAISq4jEwdksx+p25tWkFZ8GXWa9chHdfceqc7/S7LGqGkaYD+rmYAp4+azoo3W/
	 3AwyGT/ZSBTIMol6wtgRyAWfrbN2mHFdLy5UgLf0NWft2qGd/xvUMjgTLX64A2S9hj
	 9u7VeF93CdsAAu2KAnyGUUgvCY1iR/mDTHTpdUutXsCpAw5OmiQTcepdcBuxYM+6sT
	 1MaWay06ZswESyvsZfgSetuX2j111TA6TuARs8gilaNSO3RhMHhOEFpTBZsrM/sL0G
	 9rtdduGZseI6Q==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 28 Jun 2023 01:40:26 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 28 Jun 2023 01:39:30 +0300
From: George Stark <gnstark@sberdevices.ru>
To: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <gnstark@sberdevices.ru>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>, George Stark <GNStark@sberdevices.ru>
Subject: [PATCH v3 0/5] meson saradc: add iio channels to read channel 7 mux inputs
Date: Wed, 28 Jun 2023 01:37:13 +0300
Message-ID: <20230627224017.1724097-1-gnstark@sberdevices.ru>
X-Mailer: git-send-email 2.41.0
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
X-KSMG-AntiSpam-Info: LuaCore: 517 517 b0056c19d8e10afbb16cb7aad7258dedb0179a79, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/06/27 21:22:00
X-KSMG-LinksScanning: Clean, bases: 2023/06/27 21:22:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/06/27 18:27:00 #21588965
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_154052_246467_473EBD8F 
X-CRM114-Status: UNSURE (   9.34  )
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

From: George Stark <GNStark@sberdevices.ru>

Changelog:

v1->v2:
split refactoring patch [1] into 4 smaller patches, fix comment style

[1] https://lore.kernel.org/lkml/20230621062715.455652-2-gnstark@sberdevices.ru/

v2->v3:
remove patch 'meson saradc: unite iio channel array definitions' [1] after discussion

patch 'meson saradc: add enum for iio channel array indexes'
  - change enum items prefix from INDEX_ to NUM_ since name 'channel index' is
  more relevant to channel array index in iio world and with 2 tables our array index is
  not always equal to channel number
  - resolve conflicts after deleting [1]
  - update commit message, previous patch [2]
  - return channel number for temp channel. It wasn't used and isn't used currently
  but may need later

patch meson saradc: support reading from channel 7 mux inputs
  - resolve conflicts after deleting [1]
  - update commit message, previous patch [3]
  - add routine find_channel_by_num to get channel by channel number

[1] https://lore.kernel.org/lkml/20230623022334.791026-4-gnstark@sberdevices.ru/
[2] https://lore.kernel.org/lkml/20230623022334.791026-5-gnstark@sberdevices.ru/
[3] https://lore.kernel.org/lkml/20230623022334.791026-7-gnstark@sberdevices.ru/

George Stark (5):
  meson saradc: move enums declaration before variables declaration
  meson saradc: move meson_sar_adc_set_chan7_mux routine upper
  meson saradc: add enum for iio channel numbers
  meson saradc: add channel labels
  meson saradc: support reading from channel 7 mux inputs

 drivers/iio/adc/meson_saradc.c | 165 +++++++++++++++++++++++++--------
 1 file changed, 126 insertions(+), 39 deletions(-)

-- 
2.38.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
