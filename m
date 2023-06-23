Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDBFC0015E
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jun 2023 02:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uGitEbPJ7WAZ7w/LPxpBZ/RGfTcfL1/FEQBI5ON809A=; b=1WAqk9oCJ2DRGa
	5HoMnTqlMhym2fd6uoBquIVCALEtSEIzwzEOefpxtn0BTIS064sKj1VrKfY2afpkSikal22I8Fl2q
	WJzoMvVH/HMdk177FJNUiRcLBvyyYJRBDVn0yDJ8A2MwhMatXC+kY8nuck0OYGMTAcMXDQHk2+ri7
	dBzau5kkHIp6Pjai8y4Wxr7QRMMzwZLWxMSNpHrpGi6ev+Bvk/BKg4OpIY2jj4YEntuQsPuJvPiXc
	GzOh7krwYP86d2YzQsHtwSk/6c0CuGoHRYX4dY2y7j3JmRCEs0ZM7+tYVtByQk/y3OoRDFFlDRq6R
	h/MhyT8uDQILUHTgnZ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCWSx-002Ju7-0U;
	Fri, 23 Jun 2023 02:24:03 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCWSr-002JqE-0D;
	Fri, 23 Jun 2023 02:24:01 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 7B5075FD1D;
	Fri, 23 Jun 2023 05:23:49 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1687487029;
	bh=4DyGjQMn+es+mH1vT9Y4V2O51Aluf6NSHZpaGh0GwY0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=egT3vADQODLoHOyyZ7SxtoiA1XgL2C/KMR5zVFMcaEaTfO4kFaAkoA+ALrH6oHxGg
	 W17FPY1cf4laxvuSLq9c5q07U8rN2aZ66N4KNth0rYJzv2FZOFXfSupVfpEAehAV31
	 uFx/aD3TMZiLU5BgbyeXVdQwSRzM3+dqrsSs2QqZl8IX4WGg+Qj1o++u9flm1SXphH
	 Opg0V4lG0Yy8DOttA/pscRjTHJ7rxAVebIYT3Gm20IKCwyB/nkhfpnz1I2Mm2b9Cvk
	 licMT//odGa2Hr3RZw9qQTva8meYMwHIkqZWH+FLKZG9NVM5Bclhj9GVzKG+SPIGzC
	 4XA7/1SA95mZg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri, 23 Jun 2023 05:23:46 +0300 (MSK)
From: George Stark <gnstark@sberdevices.ru>
To: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <gnstark@sberdevices.ru>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>, George Stark <GNStark@sberdevices.ru>
Subject: [PATCH v2 0/6] meson saradc: add iio channels to read channel 7 mux inputs
Date: Fri, 23 Jun 2023 05:20:08 +0300
Message-ID: <20230623022334.791026-1-gnstark@sberdevices.ru>
X-Mailer: git-send-email 2.41.0
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
X-CRM114-CacheID: sfid-20230622_192357_653856_EA6E257E 
X-CRM114-Status: UNSURE (   4.65  )
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

Hello Andy

Thanks for review.

Changelog:
v1->v2:
split refactoring patch [1] into 4 smaller patches, fix comment style

[1] https://lore.kernel.org/lkml/20230621062715.455652-2-gnstark@sberdevices.ru/

George Stark (6):
  meson saradc: move enums declaration before variables declaration
  meson saradc: move meson_sar_adc_set_chan7_mux routine upper
  meson saradc: unite iio channel array definitions
  meson saradc: add enum for iio channel array indexes
  meson saradc: add channel labels
  meson saradc: support reading from channel7 mux inputs

 drivers/iio/adc/meson_saradc.c | 164 +++++++++++++++++++++++----------
 1 file changed, 114 insertions(+), 50 deletions(-)

-- 
2.38.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
