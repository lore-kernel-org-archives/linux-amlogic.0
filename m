Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5A5C001DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jul 2023 23:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6VxEE1y3QiUiq/+Tq0rrF4KJwIOOyHRb4D54ym6ti1U=; b=VAvlpsjaUandm8
	GrjMr2FXNg0e3e5a2XoZRw14ALQ1h/hGYgvqpwEyP05DaFsPRax7EK86OpeoxiLbjRQOTdNjvDdSX
	b9aHcanFkT3Gw/jG2JUFHRZqPflgP+PZ/NlMeqzMnZm4dvh+0UjDlxcEx2rQq6/w/3sOwp9tfP1mV
	vbnqoAVC3QVUxKleoKDVCgx2QNYTUHyqUxJKJ1h0N9uMGUmjAMkcefN+cwpoWqmQ94Rizs3zgDmrh
	Wb/zKgctc1zpj146pIRqQ2x4ZVfx6PEfOhrd4d51XZ5/MhHC+SndpEWnQLXqopSRMNzjNQrxgm3aN
	i737CxwfbgLTwt6+Ph/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJj0R-001Son-2S;
	Wed, 12 Jul 2023 23:12:23 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJj0F-001Sff-0u;
	Wed, 12 Jul 2023 23:12:14 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 598C5120024;
	Thu, 13 Jul 2023 02:12:07 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 598C5120024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1689203527;
	bh=tkzvlUgbyspJS7/IueSbjXgYZDr8iyqjh7w6gb0meyY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=aYc1mDh8PRtrUIEZIZAn34HIDLXjfJ9PwfZ85IU07vQ2iNtviLWOu0yHLUTLs6pWv
	 dmwwQYMs5ythH9OEC5Fl1xsaM2saMoVCMJuFf6yFg/pprpTyoDJ3yfM+WWnp/2zORQ
	 tPLbQaGdnl1Bp3ObsDvzGugWksFiO3tol0gH67ObSqdJK3OjngK/mySKgFhQuiXdOc
	 VBpXhkunM1l1C7KIQnYtvEzrX1Tr0tU9jQUOpO2xcUN9WlcZV24wnJ14HFEC8tSH39
	 cq/YCrBdnDw/vyW3Avhe8d8ULewaRvVunrZtEwbtQaKcTPcwN949L2eeSX4vKP1KG5
	 f6O4RHMA+ChFw==
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
	<kernel@sberdevices.ru>
Subject: [PATCH v6 0/6] meson saradc: add iio channels to read channel 7 mux inputs
Date: Thu, 13 Jul 2023 02:10:41 +0300
Message-ID: <20230712231157.261245-1-gnstark@sberdevices.ru>
X-Mailer: git-send-email 2.41.0
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
X-KSMG-AntiSpam-Info: LuaCore: 521 521 0c3391dd6036774f2e1052158c81e48587b96e95, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, lore.kernel.org:7.1.1;sberdevices.ru:7.1.1,5.0.1;www.spinics.net:7.1.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/07/12 21:25:00
X-KSMG-LinksScanning: Clean, bases: 2023/07/12 20:30:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/12 10:49:00 #21602221
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_161211_674439_A75C2242 
X-CRM114-Status: GOOD (  10.03  )
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

v3->v4:
add new patch 'iio: adc: meson: remove unused timestamp channel' [1]

patch 'iio: adc: meson: move enums declaration before'
	update commit message, previous patch [2]
patch 'iio: adc: meson: move meson_sar_adc_set_chan7_mux'
	update commit message, previous patch [3]
patch 'iio: adc: meson: add enum for iio channel numbers'
	update commit message, previous patch [4]
patch 'iio: adc: meson: add channel labels'
	update commit message, previous patch [5]
	change sprintf(label, "%s\n", "temp-sensor") to sprintf(label, "temp-sensor\n")
patch 'iio: adc: meson: support reading from channel 7 mux'
	rewrite enum meson_sar_adc_chan7_mux_sel definition and
		read_label routine proposed by Andy [7], previous patch [6]

[1] https://lore.kernel.org/lkml/20230705160413.000062e7@Huawei.com/
[2] https://lore.kernel.org/lkml/20230627224017.1724097-2-gnstark@sberdevices.ru/
[3] https://lore.kernel.org/lkml/20230627224017.1724097-3-gnstark@sberdevices.ru/
[4] https://lore.kernel.org/lkml/20230627224017.1724097-4-gnstark@sberdevices.ru/
[5] https://lore.kernel.org/lkml/20230627224017.1724097-5-gnstark@sberdevices.ru/
[6] https://lore.kernel.org/lkml/20230627224017.1724097-6-gnstark@sberdevices.ru/
[7] https://lore.kernel.org/lkml/ZJwGCNA+ZURri24i@smile.fi.intel.com/

v4->v5:
patch 'iio: adc: meson: move enums declaration before variables declaration'
	update commit message, previous patch [1]
patch 'iio: adc: meson: move meson_sar_adc_set_chan7_mux routine upper'
	update commit message, previous patch [2]
patch 'iio: adc: meson: add channel labels'
	update commit message, previous patch [3]
patch 'iio: adc: meson: support reading from channel 7 mux inputs'
	update commit message, previous patch [4]

[1] https://lore.kernel.org/lkml/20230707153322.114302-3-gnstark@sberdevices.ru/
[2] https://www.spinics.net/lists/linux-iio/msg80226.html
[3] https://www.spinics.net/lists/linux-iio/msg80227.html
[4] https://www.spinics.net/lists/linux-iio/msg80230.html

v5->v6:
patch 'iio: adc: meson: move enums declaration before variables declaration'
	update commit message, previous patch [1]
patch 'iio: adc: meson: support reading from channel 7 mux inputs'
	update commit message, previous patch [2]
[1] https://www.spinics.net/lists/linux-iio/msg80315.html
[2] https://www.spinics.net/lists/linux-iio/msg80314.html

George Stark (6):
  iio: adc: meson: remove unused timestamp channel
  iio: adc: meson: move enums declaration before variables declaration
  iio: adc: meson: move meson_sar_adc_set_chan7_mux routine upper
  iio: adc: meson: add enum for iio channel numbers
  iio: adc: meson: add channel labels
  iio: adc: meson: support reading from channel 7 mux inputs

 drivers/iio/adc/meson_saradc.c | 173 +++++++++++++++++++++++++--------
 1 file changed, 134 insertions(+), 39 deletions(-)

-- 
2.38.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
