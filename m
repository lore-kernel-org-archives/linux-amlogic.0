Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF2AEB64D9
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Jul 2023 09:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jz+4uoWJZGBJCO94SucJJv0+R6Qa2qBuusrcc438uTk=; b=JdTro3UDiaJ249
	0W/vvXRY3Nny2baM9XvkQ5c3bKTfr+tXlUbPZaR5e4/vqTu/NYqJqkChXDP2Ff+3pU9PmtXPmuPHE
	/MFQAT9o/RHOUaJygA2d0nOjGAI4y+AkzqhWrFLOrwOA5aaNys4kpoLEsR1vOLadKdcts/u6OpscE
	otoEs+cRBBojp5L/PjV0DVeJ1/iCAQShA3OAiZwgDiesaPQVIvj3YInMb+oYhSdNWWuk0PJZdLuSB
	d4dAVRufEkIPx3h0YThwb+yoaovNGGdFQgm+olAuZZd13yqLOhpVZ3XSw1PLwllAOLq3MRjgejjmA
	osjmMlzh0YVhepL7ebbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFt7j-007SGe-0b;
	Sun, 02 Jul 2023 09:12:03 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFt7e-007SER-1k;
	Sun, 02 Jul 2023 09:12:00 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Qv3DF4H6rz6J6qZ;
	Sun,  2 Jul 2023 17:10:05 +0800 (CST)
Received: from localhost (10.48.51.211) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 2 Jul
 2023 10:11:40 +0100
Date: Sun, 2 Jul 2023 17:11:36 +0800
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: George Stark <gnstark@sberdevices.ru>
CC: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <linux-iio@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <kernel@sberdevices.ru>
Subject: Re: [PATCH v3 0/5] meson saradc: add iio channels to read channel 7
 mux inputs
Message-ID: <20230702171136.00003950@Huawei.com>
In-Reply-To: <20230627224017.1724097-1-gnstark@sberdevices.ru>
References: <20230627224017.1724097-1-gnstark@sberdevices.ru>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.48.51.211]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_021158_729154_832AA48C 
X-CRM114-Status: UNSURE (   9.74  )
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

On Wed, 28 Jun 2023 01:37:13 +0300
George Stark <gnstark@sberdevices.ru> wrote:

> From: George Stark <GNStark@sberdevices.ru>
> 
> Changelog:
> 
> v1->v2:
> split refactoring patch [1] into 4 smaller patches, fix comment style
> 
> [1] https://lore.kernel.org/lkml/20230621062715.455652-2-gnstark@sberdevices.ru/
> 
> v2->v3:
> remove patch 'meson saradc: unite iio channel array definitions' [1] after discussion
> 
> patch 'meson saradc: add enum for iio channel array indexes'
>   - change enum items prefix from INDEX_ to NUM_ since name 'channel index' is
>   more relevant to channel array index in iio world and with 2 tables our array index is
>   not always equal to channel number
>   - resolve conflicts after deleting [1]
>   - update commit message, previous patch [2]
>   - return channel number for temp channel. It wasn't used and isn't used currently
>   but may need later
> 
> patch meson saradc: support reading from channel 7 mux inputs
>   - resolve conflicts after deleting [1]
>   - update commit message, previous patch [3]
>   - add routine find_channel_by_num to get channel by channel number
> 
> [1] https://lore.kernel.org/lkml/20230623022334.791026-4-gnstark@sberdevices.ru/
> [2] https://lore.kernel.org/lkml/20230623022334.791026-5-gnstark@sberdevices.ru/
> [3] https://lore.kernel.org/lkml/20230623022334.791026-7-gnstark@sberdevices.ru/
> 
> George Stark (5):
>   meson saradc: move enums declaration before variables declaration
>   meson saradc: move meson_sar_adc_set_chan7_mux routine upper
>   meson saradc: add enum for iio channel numbers
>   meson saradc: add channel labels
>   meson saradc: support reading from channel 7 mux inputs

iio: adc: meson: ....
to make it clear these are changing the IIO driver.

Jonathan
`
> 
>  drivers/iio/adc/meson_saradc.c | 165 +++++++++++++++++++++++++--------
>  1 file changed, 126 insertions(+), 39 deletions(-)
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
