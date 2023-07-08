Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5855DEB64DC
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jul 2023 16:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LGby8eZ49htEvovrUNzl4Kkr86Mvm3cPzya3kuPpz/I=; b=hjWZYdaSsTz0HV
	rTA6YC1TpYTwOy8wrFFxOKexCbagdTlC1743nZEUUmAEdKCp/sPrvyqilUENck2s71aKqzkXXNnWW
	9Zc4eX8Ri2SfyK9NHwtyFYyt3xxEm2mIV399kvqpbFGn8xCZTIzw1X3NW16CoZrczcUp3uVqz1nD0
	C96MA+CwRFPZoalNk/hJbW7FhAbEdRQrD2qPWYh2H07jJxiq9p0l1mfg9/nxhXtgUOF3OddOlxG5A
	/W+BwzZlT/YHPwANs1yA3AX2KOGwmmge0cpER3ZfAmgRSF/zN2W+MAmnRLkhmvvai5Wrh5eX+NSlC
	m6NaItk3EzJY0pGD2piQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIAQ4-007WJO-0k;
	Sat, 08 Jul 2023 16:04:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIAQ1-007WIM-05;
	Sat, 08 Jul 2023 16:04:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7385F60B72;
	Sat,  8 Jul 2023 16:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7644C433C7;
	Sat,  8 Jul 2023 16:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688832258;
	bh=MRhyEB9kNam7Mn6pjt39h7NCBpwSVZ2sV/31d3TWsT8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WBaBCvfJ5SZxWZmS9gM8T+dgSVlm4vLE3uBMNDOqq2zASPQR+rY+l7MghHzeIGjdM
	 z1VenmrZMJzOtg5TOYgvz2oB30fKJaTFIQhFxEgLxZtbUVf45bhw0c7faV4TYycqp1
	 ySjMrO+8Pw3P5Pm6Koa6QssrkFH6HFQj6Bp2znW3WA/exIx2qKDOL8acWNXRpcXGGD
	 I6ykfPYexuooDFVSOqNrMaTZ4MK62k9gQXH5hCCiyZ8tARRssjE41UPCu8CrrVx+aH
	 ZvBHtVbSNFuloNmy5T55piakA71M8YhMc9elgzDTuYDoPS/OzKJcnc5Nz3PZaCOity
	 HqVcUxQzkerPA==
Date: Sat, 8 Jul 2023 17:04:10 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: George Stark <gnstark@sberdevices.ru>
Cc: <lars@metafoo.de>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
 <jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
 <andriy.shevchenko@linux.intel.com>, <nuno.sa@analog.com>,
 <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <kernel@sberdevices.ru>
Subject: Re: [PATCH v4 0/6] iio: adc: meson: add iio channels to read
 channel 7 mux inputs
Message-ID: <20230708170410.0885b8e4@jic23-huawei>
In-Reply-To: <20230707153322.114302-1-gnstark@sberdevices.ru>
References: <20230707153322.114302-1-gnstark@sberdevices.ru>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230708_090421_152900_9704F919 
X-CRM114-Status: GOOD (  14.60  )
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

On Fri, 7 Jul 2023 18:27:37 +0300
George Stark <gnstark@sberdevices.ru> wrote:

> From: George Stark <GNStark@sberdevices.ru>


All looks fine to me.  However, given earlier versions had various other reviewers
I'd like to leave it on list a little longer.

Jonathan

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
> v3->v4:
> add new patch 'iio: adc: meson: remove unused timestamp channel' [1]
> 
> patch 'iio: adc: meson: move enums declaration before'
> 	update commit message, previous patch [2]
> patch 'iio: adc: meson: move meson_sar_adc_set_chan7_mux'
> 	update commit message, previous patch [3]
> patch 'iio: adc: meson: add enum for iio channel numbers'
> 	update commit message, previous patch [4]
> patch 'iio: adc: meson: add channel labels'
> 	update commit message, previous patch [5]
> 	change sprintf(label, "%s\n", "temp-sensor") to sprintf(label, "temp-sensor\n")
> patch 'iio: adc: meson: support reading from channel 7 mux'
> 	rewrite enum meson_sar_adc_chan7_mux_sel definition and
> 		read_label routine proposed by Andy [7], previous patch [6]
> 
> [1] https://lore.kernel.org/lkml/20230705160413.000062e7@Huawei.com/
> [2] https://lore.kernel.org/lkml/20230627224017.1724097-2-gnstark@sberdevices.ru/
> [3] https://lore.kernel.org/lkml/20230627224017.1724097-3-gnstark@sberdevices.ru/
> [4] https://lore.kernel.org/lkml/20230627224017.1724097-4-gnstark@sberdevices.ru/
> [5] https://lore.kernel.org/lkml/20230627224017.1724097-5-gnstark@sberdevices.ru/
> [6] https://lore.kernel.org/lkml/20230627224017.1724097-6-gnstark@sberdevices.ru/
> [7] https://lore.kernel.org/lkml/ZJwGCNA+ZURri24i@smile.fi.intel.com/
> 
> George Stark (6):
>   iio: adc: meson: remove unused timestamp channel
>   iio: adc: meson: move enums declaration before variables declaration
>   iio: adc: meson: move meson_sar_adc_set_chan7_mux routine upper
>   iio: adc: meson: add enum for iio channel numbers
>   iio: adc: meson: add channel labels
>   iio: adc: meson: support reading from channel 7 mux inputs
> 
>  drivers/iio/adc/meson_saradc.c | 173 +++++++++++++++++++++++++--------
>  1 file changed, 134 insertions(+), 39 deletions(-)
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
