Return-Path: <SRS0=Jp6n=EB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A94E0C4363A
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 17:28:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 434602223C
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 17:28:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m92m03tO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="y0kJ3u3y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 434602223C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bKyypDDRf67tkDstO/H4LQylugUaD5MFghrohSUPHeI=; b=m92m03tOyfdGi2e4ibEuyV++o
	7cmdSBclpV1mF91ow7qsyx7fXzIdHlL7xqhuEcGgVZCdNtZ4dB0jrYl/MoKCR3hrtrNu1x+l3QM1O
	PNidx1E7O1rALPBJ7CcIszb2rSl0R/0KK/6fnix04lezQ7byHxwLen7sG17SLBmsecF0goFYakU1r
	H3I8F9Gar3IyxUSdvpCxrxvOXTGxUVlfE5XQFiZrcyfd3XLibZZiKgX92YWuXMB7LRc9a4WCMXtsy
	wFGU/CT/iNrCJoBww86sRi99EhZlaNfIwwuU4p7er902kuLLLbOmM4r/KTuMCv67slNAEAB4DLjR2
	foeqSB/Ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX6IK-0002z6-Ns; Mon, 26 Oct 2020 17:28:32 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX6IE-0002wV-L2
 for linux-amlogic@lists.infradead.org; Mon, 26 Oct 2020 17:28:27 +0000
Received: by mail-pl1-x641.google.com with SMTP id h2so5046168pll.11
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Oct 2020 10:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=RZLa3K0yUyDDt6WL3NskNHHGlNOc6iTJzksW2X6flDM=;
 b=y0kJ3u3yZkSwyiAYhnsxoLLHT8X+UqAZTzY9WS0EI0KtA6qAfQUteGA+GRFKdOk6BL
 aJ2hh7qb4B6fUQfgJKiBKIOVhWDYR0tdnltyaUAQjfKog/ErX1TZxA0MSVCvZK/7KlLD
 01eDQbjcjixE0TmOkBmMDjtsw58tTn8XyUzY+9ciGdXnYHLXvY6j8WbKviRTHpVaP6sT
 CG9SSThfXQEd9Mb+AcM0gxkOjCOI09ZVUSIkxOxldchuj6hz8ToRcb4I3CJx3/mCrO6Y
 ULQZ6S87e+elRcet6mjt+UEd4A1BMKowqJ8M8sf6QrGFAhaZG1gIony+M/ec9SYb+2bG
 kYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=RZLa3K0yUyDDt6WL3NskNHHGlNOc6iTJzksW2X6flDM=;
 b=OXFc+JY/CLjA/xDFuL/krlzrsa5yFmsdMmVhm24lVJ6E1/d0CFn3wTOhOXFT1H48u8
 wm4MujGh6lFfChzPZFmfkerGkJoRR/44Dq+NUulxT/4nC+Nm6WvhM8eQWsVlVLtoTz2i
 h4i4RQGXoeNxeljtCYav+QXecswBowhxo/c82sLt4DjCSCFULnkLORLOreQ3nQJ8sc0r
 xFxHT9fHyB2jcNDLmzu+L5NGppURoaEu0RzUHkzaRnh0j7p38kuur3WBQtz04Yj1UXKc
 O3pJpZt5yK7qk/QvOjaYMkWp/Yek6t53ZeAR0QIMC9zg9QLgkl9xUXbBgijsgxTX5XRP
 5F+g==
X-Gm-Message-State: AOAM533uSK5RXUYDGbmnAKEz4lZNqhSL/OHaPIxmBuQ5SinF9qt0IIVk
 Ao56Pz4t27klsKUjFN+ZADQo/g==
X-Google-Smtp-Source: ABdhPJzaEZwwz+BQVXD1x3jUrw7XUO725+SjVzU1V/pq3tDCWnUZ2mD5YSqI+kMyVe9g2QCRxNkv9A==
X-Received: by 2002:a17:90a:ef81:: with SMTP id
 m1mr17959155pjy.212.1603733304302; 
 Mon, 26 Oct 2020 10:28:24 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id i24sm12289572pfd.15.2020.10.26.10.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 10:28:23 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 0/2] irq-meson-gpio: make it possible to build as a module
In-Reply-To: <b0780e423d5fa527835ba55c64dba473@kernel.org>
References: <20201020072532.949137-1-narmstrong@baylibre.com>
 <87v9eyo75s.wl-maz@kernel.org> <7ha6w9hsfm.fsf@baylibre.com>
 <b0780e423d5fa527835ba55c64dba473@kernel.org>
Date: Mon, 26 Oct 2020 10:28:23 -0700
Message-ID: <7hy2jshp6w.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_132826_741355_F1BAEAB7 
X-CRM114-Status: GOOD (  14.80  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, jbrunet@baylibre.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Marc Zyngier <maz@kernel.org> writes:

> On 2020-10-26 16:18, Kevin Hilman wrote:
>> Marc Zyngier <maz@kernel.org> writes:
>> 
>>> On Tue, 20 Oct 2020 08:25:30 +0100,
>>> Neil Armstrong <narmstrong@baylibre.com> wrote:
>>>> 
>>>> In order to reduce the kernel Image size on multi-platform 
>>>> distributions,
>>>> make it possible to build the Amlogic GPIO IRQ controller as a module
>>>> by switching it to a platform driver.
>>>> 
>>>> The second patch removes MESON_IRQ_GPIO selection from ARCH_MESON to 
>>>> allow
>>>> building the driver as module.
>>>> 
>>>> Neil Armstrong (2):
>>>>   irqchip: irq-meson-gpio: make it possible to build as a module
>>>>   arm64: meson: remove MESON_IRQ_GPIO selection
>>>> 
>>>>  arch/arm64/Kconfig.platforms     |  1 -
>>>>  drivers/irqchip/Kconfig          |  5 +-
>>>>  drivers/irqchip/irq-meson-gpio.c | 89 
>>>> ++++++++++++++++++++------------
>>>>  3 files changed, 59 insertions(+), 36 deletions(-)
>>> 
>>> I've tried this series on my vim3l with the this driver compiled as a
>>> module, and lost the Ethernet interface in the process, as the phy
>>> wasn't able to resolve its interrupt and things fail later on:
>>> 
>>> [   72.238291] meson8b-dwmac ff3f0000.ethernet eth1: no phy at addr -1
>>> [   72.238917] meson8b-dwmac ff3f0000.ethernet eth1: stmmac_open: 
>>> Cannot attach to PHY (error: -19)
>>> 
>>> This is a generic problem with making DT-based interrupt controllers
>>> modular when not *all* the drivers can deal with probing deferral.
>> 
>> Yes, but this series still keeps the default as built-in.
>> 
>> If you build as a module, and you add `fw_devlink=on` to the kernel
>> command-line, device-links will be created based on DT dependencies
>> which will ensure the right module load order.
>
> It doesn't work here. I get the exact same error (well, with eth0 
> instead
> of eth1). In my experience, fw_devlink isn't reliable yet. Config on 
> request.

Other than CONFIG_MESON_IRQ_GPIO=m, are you using default upstream
defconfig?

I just double-checked with this series on top of v5.10-rc1, and I have
eth0 working with interrupts without needing fw_devlink=on.

With the default upstream defconfig all the networking for these devices
is already configured as modules.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
