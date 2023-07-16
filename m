Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5522EB64DD
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Jul 2023 16:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wfz47mGKBM31+qeKJ5u2hoOa8B1dRcm8Ge4RNKxDGRM=; b=IJg6L159D9ttxX
	Qv0eV0eoC3nh7b3JQvVB17+AS0o/ZWt3MO2gsFh4kGjLDvlXaYKRvBcGoz2NPWNHnLMs/axm8nLDs
	wW/2xTsk3wZShbbOnzCGmXCWEggaY3ypuKjYRm2sqKN2QSByuaouQ0+3a9wjdIjqN4Xobms7VvIkA
	L3YX0Zp582fRYZDgGILNnGbAoXG2D4kocS+biIJxukRPGKBiubUZ6UzhUPnc8oDKFbranIzpgsbOf
	ma3HDNMt+VkYeMTj76oEyp3PCJ+Y6p55/Ay7mTOj/6IT6ZcRH0AtVx0APwx2e0RnpCXGaJwHTDBnR
	jAugQElbcAxN3eSrAn4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL4Lb-00CkYY-1F;
	Sun, 16 Jul 2023 16:11:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL4LY-00CkWg-23;
	Sun, 16 Jul 2023 16:11:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 05B1060C50;
	Sun, 16 Jul 2023 16:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42ACCC433C7;
	Sun, 16 Jul 2023 16:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689523903;
	bh=HWacphPikmgnJGPNvAFWGmB20TdoOVVM6awomSy4Ta0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=knNOaZ9qd+WUqdFq9dwM5hdG6A+frOIqYpllVHOECE3TfXXPC/x+2sx82LOZNIm7S
	 0LZhL1w+lh9KBi3xhqI7dbrIm+27WUDmo5Kqv4p463llAezp16NB7ncS9plQV2hnym
	 TQ0VxpSUfAMAS7Pdib7UcwY6eWyuax6oQzEid3KwueBw1hS631/+0OJTqZV6vHPPDD
	 Pu9vkRzGFobMh/Bfpk1PIMVmIzS6FsCw+l4cV7XFYSWXZ1PWb/TAn+awGtFkvNNkY0
	 GQ2Gq7pf0FHC9d5vaMa6AQUrieIKdqFMj8vrze/ewirh6zMvyP08320I+hC03Gml4U
	 +oAPZoqakzWDg==
Date: Sun, 16 Jul 2023 17:11:34 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: George Stark <gnstark@sberdevices.ru>
Cc: <lars@metafoo.de>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
 <jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
 <andriy.shevchenko@linux.intel.com>, <nuno.sa@analog.com>,
 <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <kernel@sberdevices.ru>
Subject: Re: [PATCH v1 0/3] iio: adc: meson: tune init sequence
Message-ID: <20230716171134.43d05c45@jic23-huawei>
In-Reply-To: <20230715110654.6035-1-gnstark@sberdevices.ru>
References: <20230715110654.6035-1-gnstark@sberdevices.ru>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_091144_725897_2A1DD99F 
X-CRM114-Status: GOOD (  16.15  )
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

On Sat, 15 Jul 2023 14:05:57 +0300
George Stark <gnstark@sberdevices.ru> wrote:

> This patch is a part of effort to support meson a1 SoC and make meson saradc driver
> independent from vendor boot code initialization in common.
> 
> Information was taken from vendor kernel 5.4, 4.19 and vendor uboot 2019.
> Most of the bits are undocumented at all or it's not said how they affect measuring.
> 
> All those bits are already initialized in bl* code and since kernel driver dosn't
> rewrite or reset any registers but only changes some bits at init stage everything
> works fine.
> 
> Test procedure is rather simple - one can change those bits in runtime
> (e.g. using devmem) and try to read channels (cat /sys/bus/platform/drivers/meson-saradc/.../iio:device0/*)
> changing some of those bits leads to measure procedure errors or abnormal results.
> Another test is build meson saradc as module, reset adc by reset bit, reload module
> and compare measure results to those got before reset.
> 
> George Stark (3):
>   iio: adc: meson: init channels 0,1 input muxes
>   iio: adc: meson: init internal continuous ring counter
>   iio: adc: meson: init voltage control bits
> 
>  drivers/iio/adc/meson_saradc.c | 73 ++++++++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 
These look fine to me, but I'd like them to sit on list a little while
on off chance anyone else has feedback on them.

Thanks,

Jonathan



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
