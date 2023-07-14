Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50C9C0015E
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jul 2023 11:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9zw827yhwtswvwaeHlFhxZJy6QIlC3lZt+s44nW2uwo=; b=L7vzqAxUKNIihB
	lq6Caw8K7NtsLGnEErkMS06Aw5n/cqFfTGBIeYoM60RZwt+Fl1dp4+6Qp5UR09zTFODogioIjPqo1
	Hs15SvU3U7siZEyvYaaxw/hSXwizQcNJldCb0biSK/ry1kz3rPtmkbG0OrCth20RZ00DEdEvJWm+g
	7cl5TPU5h6qKIZxYTKAjLBU/wWEIZmkeSz0xtHrRsy1MU7L/5Wp44bfwd7ErzSfr9zBdoIfFCaJpF
	U3GGiQBooeYia6QZVjKO+KPsmcbopplLnNW5/jaWiGZscUgN1wIY2Hwx6ICR0+pfau31fzwrfeKFb
	zvHO0dLZDaod5ONshP7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKHAN-0065jB-2a;
	Fri, 14 Jul 2023 11:40:55 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKH9x-0065Rw-1w;
	Fri, 14 Jul 2023 11:40:36 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8A6C9100009;
	Fri, 14 Jul 2023 14:40:19 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8A6C9100009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1689334819;
	bh=eu8/qlieVAdLMy2mRVFcsfWVK/cHJOdzyxcUfVIBZpw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=rmNlqtFM4WPMziN4PntsI21alPkv/F61V2CRL9GplDicgKlc6i1yq0pVtDgRoQ/z7
	 bT9+6VCEcb98Kz5+xsDYN7WzZiRDHSuJcKg5LpKdwxUYaaMd30P5mMD8+8Lkdyu305
	 RZ3QSKn9nVz2WpxQQZy5JidNFmgLcs6Z9Q9MHPre6GCpYMKjnfQzMaxFTrAT5ShMqF
	 bXj8onpsudfvEsRsMnB/D9vWVKUJ2g7QAGr5mGcqWYYllPV3tsGqS+Zn8pB42aHqjT
	 zcDKvkMDKn5JmDKRKyaj93BmGAlblYFp+Wt9iI25S7fwzuyerOseSlo4iMVIAKiLDC
	 TNIffb/zXSKmw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 14 Jul 2023 14:40:19 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 14 Jul 2023 14:39:47 +0300
From: George Stark <gnstark@sberdevices.ru>
To: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <gnstark@sberdevices.ru>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>
Subject: [PATCH v7 0/6] meson saradc: add iio channels to read channel 7 mux inputs
Date: Fri, 14 Jul 2023 14:37:47 +0300
Message-ID: <20230714114010.293440-1-gnstark@sberdevices.ru>
X-Mailer: git-send-email 2.41.0
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
X-KSMG-AntiSpam-Info: LuaCore: 523 523 523027ce26ed1d9067f7a52a4756a876e54db27c, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;www.spinics.net:7.1.1;127.0.0.199:7.1.2;lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/07/14 02:56:00
X-KSMG-LinksScanning: Clean, bases: 2023/07/12 20:30:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/14 02:46:00 #21611850
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_044030_342053_658BA34A 
X-CRM114-Status: UNSURE (   9.76  )
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

v6->v7:
all patches:
	add tag Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

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
