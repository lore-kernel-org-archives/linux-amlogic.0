Return-Path: <SRS0=+F2p=SW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B92C282DD
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Apr 2019 09:24:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2D36205C9
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Apr 2019 09:24:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mwp8zK9K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="qaZ8lzoU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2D36205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQwA1huFXfuippJFfj9KADMTfF2WXGYPfowKiQ4rWRA=; b=mwp8zK9KDkmB75
	z1UGCc6JtKSRxdh0M049fRbEUQTOXH1QCw0PIOFHIz74KcpC5W7Y5GQ2941UpanT1q3PZZySxTnzi
	A79KW+liKG36HLaYoYByF/nPU95IPJ2wrG8T7PvVy5yrsEc+rptLqEq5Rup/4Jgzt+0oFLgjLlyg8
	7aOM5i8mgnwCNUDSqVF/3FsbHJgvGKhWBs5R7ojpadku9QkaJ0I/ZsBCZFy/J8LYfLOWvUJ1cmLPM
	2pfrwZAaHSDje1kjIrGWUtvXdWvJ8SHkX/C6S1MZEMCWAQDqJVt5kT2xnnWiib2v3Rd7CgzFd8I/Q
	q0O13PCeMuivlUhfRxIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHmEB-00044x-Iy; Sat, 20 Apr 2019 09:24:07 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHmE8-00043z-De
 for linux-amlogic@lists.infradead.org; Sat, 20 Apr 2019 09:24:05 +0000
Received: by mail-ot1-x341.google.com with SMTP id 103so5995210otd.9
 for <linux-amlogic@lists.infradead.org>; Sat, 20 Apr 2019 02:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0Gb4/VMu7KH5rxCB7x/AZRSTQfoVJyp09bqTmrvK/YA=;
 b=qaZ8lzoUYYFnk+Usd9KrVY3GM7kajdk1D4RL26DCG+K+DrT7/PSfCyX/412VOM9Di9
 GONs056tAErtnwcw+/+CmU+cWHrCZkRcZIXZc96kQlXieE/muBnSCQJbTWAnF8Q7vcre
 CUiIIJUo7TL6kYOysdexDtTVK9SKCWDnVWs0/3uAmmDIkhcPcHeDS6pNzuOGTAHXTurS
 DkC1PpaPMaDIJYEmmNBmcVCUjEPa22qisXRkKXRRDOg+CaRJfU8+llNsTAbLPUzj9TUj
 iGgtTE+Ck6ALbGsm0AYzx4Bj1+IRMMKKmqz2fTau1KXAPhJ+c9nVxp2lZmJUhJeKgRN9
 Si7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Gb4/VMu7KH5rxCB7x/AZRSTQfoVJyp09bqTmrvK/YA=;
 b=lWgp2sVQPQP6mmLSMawYeVZybOVWgXpVuvrD2gChMrpKr26GeglBdpnlarBnew9crA
 Y3lxTkZOHx0b0be21YOlmhglQpkE9d8IrJkIz8A7vnsnZe4hZcBiSlcxa0ESD3Z1b1E4
 dVNjQ1Z4BtzJxmbD3Q6erMFGfDGuOCu1fuh3ogS4DPsNvGb5oLUiiM5yyDqZ7DVU8YnK
 ktK3NZad3DvHdjHlZzee/cS0YahDG7jFwkWkYdJ53wtGSuGmRY3d+nrpyRlCpZmVfFCK
 vBQiol9WJJ4S7Idv+uHumeefK+TFj4qG4DJsVIHenT4Qta8B7/f1Mh0K4oea3cZfVqyy
 sd1Q==
X-Gm-Message-State: APjAAAWND7RxEtcLxWVVBsZP/QGCACiPEwwyLtRr6/JPZ3UwFPe9ldE6
 oajTGeZXQSKRfLhLFT9jHtK+5KOn9lnPTABPm/M=
X-Google-Smtp-Source: APXvYqxhGTYdMX6k/b7uYzLmx+89ZwQCwYkcqnAJHrnbaTvpka4HeMXsiP8119gswQQ9Ucv5yu4kByN6OHPH+OI59y0=
X-Received: by 2002:a9d:3db4:: with SMTP id l49mr5073251otc.131.1555752242781; 
 Sat, 20 Apr 2019 02:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190417204355.469-1-jbrunet@baylibre.com>
 <20190417204355.469-6-jbrunet@baylibre.com>
 <CAFBinCCAbMpWYY6-W+909Q=jLpweC2F6ED6CVf6zVGrRiA1hxg@mail.gmail.com>
 <8316d7875bf0479e91cc11ce5fbf3b2e21f92a2c.camel@baylibre.com>
 <CAFBinCBQPSsqwDSd6nQMLqOuApiESwHXn4wQbOp49WLpXfBk=Q@mail.gmail.com>
 <5b19d32be23fbe630339fd48f93b16e9301385d1.camel@baylibre.com>
 <5d65cc12e18f9a4b86c097fbade0cef91b3b5d9b.camel@baylibre.com>
In-Reply-To: <5d65cc12e18f9a4b86c097fbade0cef91b3b5d9b.camel@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 20 Apr 2019 11:23:51 +0200
Message-ID: <CAFBinCBtc=Yb3WDgLzgnyd=NauaZnkQRnc08_j-XbiDybh=7cg@mail.gmail.com>
Subject: Re: [PATCH 5/7] mmc: meson-gx: avoid clock glitch when switching to
 DDR modes
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190420_022404_490235_1BA22A86 
X-CRM114-Status: GOOD (  21.74  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Fri, Apr 19, 2019 at 10:53 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> On Thu, 2019-04-18 at 23:15 +0200, Jerome Brunet wrote:
> > On Thu, 2019-04-18 at 22:53 +0200, Martin Blumenstingl wrote:
> > > Hi Jerome,
> > >
> > > On Thu, Apr 18, 2019 at 10:46 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > > > On Thu, 2019-04-18 at 22:16 +0200, Martin Blumenstingl wrote:
> > > > > Hi Jerome,
> > > > >
> > > > > On Wed, Apr 17, 2019 at 10:44 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > > > > > Activating DDR in the Amlogic mmc controller, among other things, will
> > > > > > divide the output clock by 2. So by activating it with clock on, we are
> > > > > > creating a glitch on the output.
> > > > > >
> > > > > > Instead, let's deal with DDR when the clock output is off, when setting
> > > > > > the clock.
> > > > > >
> > > > > > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > > > > it seems that this patch breaks SD card on my Khadas VIM and Khadas VIM2.
> > > >
> > > > The error I see in your logs is with eMMC and hs200, not SD card.
> > > sorry, I should have been more clear that there are two errors:
> > > eMMC, this is what I have been seeing for a while on my Khadas VIM2
> > > (it's probably not related to this patch):
> > >    mmc1: mmc_select_hs200 failed, error -84
> > >    mmc1: error -84 whilst initialising MMC card
> >
> > Following patches were also supposed to help the vim2.
> > ... something I tested numerous time on this particular board.
> >
> > > however, then there's this other error:
> > >    print_req_error: I/O error, dev mmcblk0, sector 0 flags 0
> > >    Buffer I/O error on dev mmcblk0, logical block 0, async page read
> > > as result of this the partition table cannot be read and my kernel
> > > cannot find the rootfs.
> >
> > I don't know what the problem is (probably some CRC error - you can check the log
> > in interrupt for this) but I'm pretty sure it is not related to this patch.
> >
> > I see in the log SD is indeed in HS mode, so not in any DDR mode.
> > I also see that the SDIO fails as well. There something really weird, which can't
> > be explained by this patch alone AFAICT.
>
> Ok, I think I got it. It is indeed not linked to DDR, but a more trivial mistake.
> It looks like a writel went AWOL during the final rebase (and after the test campaign).
>
> in meson_mmc_set_ios, after:
> val |= FIELD_PREP(CFG_BUS_WIDTH_MASK, bus_width);
>
> Could you try adding
> writel(val, host->regs + SD_EMMC_CFG);
good catch!

> Without this, the bus width is not changed, which explains why eMMC, SD and SDIO fail
> on init.
I have added that missing writel on top of the whole series and now:
- SD card is detected again (same as without this series)
- SDIO wifi is detected again (same as without this series)
- eMMC is detected (was not working before)

I will give my Tested-by on v2 of these patches


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
