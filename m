Return-Path: <SRS0=W3Hy=PK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E1C1C43387
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jan 2019 12:46:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BA6A2171F
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jan 2019 12:46:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HrUxQ0yF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EWZgWqUt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BA6A2171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LVglcXtlquuUwNf2IVXTeOcy9d16xXBLZmV/fhrqUQY=; b=HrUxQ0yF0039sH
	OvQGYfA4pdzlPgaRI1uA3EXFawrYMhcm3zsoOj4sjK6pZ8QnMkXV3wOnNFWUi0uvz/N2qJT1n6MRL
	Nfi3Tswsfe1dR9vFMM/TPCc+0288Dab5P+gi7xzhgQaOW+X4sg6xty/z3BaQyS/ZDSDfkJv41uBlk
	gT4fxW0XGDImTcRGrSAZkkCdQqx//GW9efQ07sZTEimlTk+12eqicUDrFacZdwsdWfwSdbSNG52yY
	6LgXTadG/ynACM5EcIdkZF8IUfPJEFv0RWTZ8jQ24nLyQXdxL/d15wP+OUqmIXXuCZXGRjMA5AxEb
	qmYytEyXUPfxt02W8fng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gefum-0000ib-1b; Wed, 02 Jan 2019 12:46:28 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gefui-0000hg-Mb
 for linux-amlogic@lists.infradead.org; Wed, 02 Jan 2019 12:46:26 +0000
Received: by mail-ed1-x541.google.com with SMTP id b14so26055867edt.6
 for <linux-amlogic@lists.infradead.org>; Wed, 02 Jan 2019 04:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=jWYtroL2CqhWj6bXnI5dboJDLzbLdRv4JwKj7ZxvKBI=;
 b=EWZgWqUtrGjNF7V2Uaoq2Toh3HSQZtuH8v+mrbrrv88fL4qd9hLjNur0qJW5BYm1o0
 VKH45G7l2He5rD52tcDoHVyPK9ieYxS0z3ajyUYhUKXne60HWjGlaNBWMSEzRHKf3vBt
 f5+5sHM0CwQErIh7ArJYjEnFn7m/DnhPAAOkVtX0Gj8pjdFWl3vQS61XbIrdye8ThOfy
 O9mJFPTvt92nA45j5ZrCM/C+y00lGo7lRgeKK2BWbTR4Mda/MLtMR+HGJgWOCLQLg4uu
 elT5r36XfdZ7s9q2PBNF18d/e7G9Y6Jty4p1xFg4k4IyXtGetzod64OeTObL5bWtD/cO
 X07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=jWYtroL2CqhWj6bXnI5dboJDLzbLdRv4JwKj7ZxvKBI=;
 b=UZQKQrnTNMqsDf91yPUM732u6ZfbQjWGBp0D6qARTLh7KxI9oOwPBWB3EEMKrHXHlj
 bfoAXsp8v7Tyn1pr+nPg3nGXHK7bl7nojrg+WsWbQHEoo33znjETnKRkLw3Q3vq0jwf8
 I4BRP1VnlGIe/Y3YkdTcAGVE0Zq8vDbLgOvnNiBjyo4GiNUTeYwPNFo+8Dg9FslvzIkJ
 Whc4ez8Cc9yagksYdUeUvHo18oieIH2/Iuw/5h/n3+/jRcM8p9I1wbNP/GI3MRKfNMQe
 5Y2+wR/tBIhYYYBREFPEgMN+sNIjuG3anb8YilyFmBCjtxn/J9QTm+nSUnDVNXINelH7
 3xoQ==
X-Gm-Message-State: AA+aEWYwQmO9QFGJDYowONAEHUVEw5Oiaubk9ryb3oCb3TRuG+gXyKg/
 pKf+6RMiS43Am7iTYil8NqbZLw==
X-Google-Smtp-Source: AFSGD/Vy3OSJ6pNRR/l9vqY9gzNvkFb97nE2PnjrcFzwVI2kDcHK5ftCvqgRHizHGNI+pSaAOzrQiQ==
X-Received: by 2002:a50:f5f4:: with SMTP id x49mr40057079edm.26.1546433181585; 
 Wed, 02 Jan 2019 04:46:21 -0800 (PST)
Received: from boomer.baylibre.com
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e35sm21881660eda.13.2019.01.02.04.46.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 02 Jan 2019 04:46:20 -0800 (PST)
Message-ID: <db2580c8740ca202d02f37ef567be0e273eca6d7.camel@baylibre.com>
Subject: Re: [PATCH 0/4] mmc: meson-gx: chained descriptor fixup and
 improvements
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 02 Jan 2019 13:46:19 +0100
In-Reply-To: <CAFBinCCUO6ihxNWDup5ZVKWBc8+oiW_-j8OUxRhb+tjpGsUBkg@mail.gmail.com>
References: <20181206151828.24417-1-jbrunet@baylibre.com>
 <CAFBinCCUO6ihxNWDup5ZVKWBc8+oiW_-j8OUxRhb+tjpGsUBkg@mail.gmail.com>
User-Agent: Evolution 3.30.3 (3.30.3-1.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190102_044624_805401_0BCF1E5E 
X-CRM114-Status: GOOD (  25.14  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 2018-12-22 at 18:28 +0100, Martin Blumenstingl wrote:
> Hi Jerome,
> 
> On Thu, Dec 6, 2018 at 4:18 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > The goal of the patchset was mainly to address the following warning:
> > 
> > WARNING: CPU: 0 PID: 0 at /usr/src/kernel/drivers/mmc/host/meson-gx-
> > mmc.c:1025 meson_mmc_irq+0xc0/0x1e0
> > Modules linked in: crc32_ce crct10dif_ce ipv6 overlay
> > CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         4.19.1 #1
> > Hardware name: Some A113 Board (DT)
> > pstate: 40000085 (nZcv daIf -PAN -UAO)
> > pc : meson_mmc_irq+0xc0/0x1e0
> > lr : __handle_irq_event_percpu+0x70/0x180
> > sp : ffff000008003980
> > x29: ffff000008003980 x28: 0000000000000000
> > [...]
> > x1 : ffff80001a71bd40 x0 : 0000000000000000
> > Call trace:
> >  meson_mmc_irq+0xc0/0x1e0
> >  __handle_irq_event_percpu+0x70/0x180
> >  handle_irq_event_percpu+0x34/0x88
> >  handle_irq_event+0x48/0x78
> >  handle_fasteoi_irq+0xa0/0x180
> >  generic_handle_irq+0x24/0x38
> >  __handle_domain_irq+0x5c/0xb8
> >  gic_handle_irq+0x58/0xa8
> > 
> > This happens when using the chained descriptor mode. If there is an
> > error, we call mmc_request_done(), loosing any reference to the cmd. It
> > turns out that the chained descriptor does really stops when we do so, at
> > least not completly. Most of the time, it can be seen with this harmless
> > warning because the descriptor will raise another unexpected IRQ. On rare
> > occasion, it will completly break the MMC.
> > 
> > This is mostly adressed by patch #1.
> > With this fixed, I took (yet) another look at the ultra-high speed modes
> > and the tuning.
> > 
> > I came up with new settings in patch 3 and 4. I've tested them on eMMC,
> > sdcard and sdio on the following platforms:
> >  * gxbb p200
> >  * gxl p230, libretech (eMMC only), kvim.
> >  * axg s400
> > 
> > So far, these new settings seems to be working great but I think it
> > would be nice if others could test this and provide their feedback.
> > This why  patch 3 and 4 are RFT tagged.
> > 
> > Jerome Brunet (4):
> >   mmc: meson-gx: make sure the descriptor is stopped on errors
> >   mmc: meson-gx: remove useless lock
> >   mmc: meson-gx: align default phase on soc vendor tree
> >   mmc: meson-gx: add signal resampling
> I gave all four patches a go on my Khadas VIM2 Basic (16GB eMMC).
> regardless of whether I have your patch applied or not: eMMC
> sporadically fails tuning (if I reboot the board a few times it starts
> to work)
> [    4.172686] mmc1: tuning execution failed: -5
> [    4.182535] mmc1: error -5 whilst initialising MMC card

Damn ...

This particular device is set to use hs400 ATM. Could you try with hs200 only
? (removing mmc-hs400-1_8v from meson-gxm-khadas-vim2.dts) 

I might be wrong but I think tuning is supposed to be done with hs200, before
activating DDR mode to switch to hs400. In theory, removing hs400 should not
change anything (so I expect the tuning to still fail) but it is worth
checking.

> 
> I'm not sure if this issue is specific to my Khadas VIM2 so this is
> *not* a nack for your patches.

I'll check if I can get my hands on this device.

When cooking this series, I tried another trick which was cycling on the
resampling delays (see ADJUST_ADJ_DELAY_MASK). At the time, I could not see
any significant improvement while doing it, so I dropped it.

If possible. could you check if any particular value in this field, between 0
and 5, makes things any better ?

Alternatively, if you find another combination of phase for the mmc_clk and
tx_clk that works better for this device, feel free to let me know. Maybe we
can work something out.

Cheers

> 
> 
> Regards
> Martin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
