Return-Path: <SRS0=oK7S=DX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AC8C433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 08:52:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F59620663
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 08:52:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vQOKJ7aV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F59620663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HulGwBKZdoatCg+pUXSzXOvwnsEQ66HRboEwaXATrzs=; b=vQOKJ7aVBH6bizMn7lBkXhqvE
	zeNPS31wKwxiPS1tWXAqGes1kezMPcJ2A4vDGIMx0eG4SCeK5aY6nqwumlKVVuvKPhOSuf6RlLxpA
	uUvjnl5q515+PRa1U6UQ80UUXzdNrNvR3W3XytBOMdnGAAo/ZqZbszcGKR0aCMx+WA9jXQdYXDvrd
	6cRB1grLhXYy7LDZLqenneLaKudzw2ZT/bRGdyrNlTBpT9rZj6uxQboyHjkPFNSE0Tv2FnPSepiiE
	kKcRUJs4tgeRwfxY9OspKI8U81VUllqAzrquIpwjZc3t/LMh1Sd5/iHdusVSQhYG3tOTMY3z4lWHh
	YxPHoAdjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTLTM-0005Vp-Rt; Fri, 16 Oct 2020 08:52:24 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTLTJ-0005UC-Js
 for linux-amlogic@lists.infradead.org; Fri, 16 Oct 2020 08:52:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E59ED30E;
 Fri, 16 Oct 2020 01:52:18 -0700 (PDT)
Received: from localhost (unknown [10.1.199.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 866173F719;
 Fri, 16 Oct 2020 01:52:18 -0700 (PDT)
Date: Fri, 16 Oct 2020 09:52:17 +0100
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] mailbox: cancel timer before starting it
Message-ID: <20201016085217.GA12323@arm.com>
References: <20200923123916.1115962-1-jbrunet@baylibre.com>
 <20201015134628.GA11989@arm.com>
 <1jlfg7k2ux.fsf@starbuckisacylon.baylibre.com>
 <CABb+yY1-MBac0e6xQwWkHRo3bqJNMWb4xQzdaGdrYT=n5zRvtw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABb+yY1-MBac0e6xQwWkHRo3bqJNMWb4xQzdaGdrYT=n5zRvtw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_045221_701255_9059A53F 
X-CRM114-Status: GOOD (  22.60  )
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
Cc: Kevin Hilman <khilman@baylibre.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Da Xue <da@libre.computer>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thursday 15 Oct 2020 at 13:45:54 (-0500), Jassi Brar wrote:
[..]
> > >> --- a/drivers/mailbox/mailbox.c
> > >> +++ b/drivers/mailbox/mailbox.c
> > >> @@ -82,9 +82,13 @@ static void msg_submit(struct mbox_chan *chan)
> > >>  exit:
> > >>      spin_unlock_irqrestore(&chan->lock, flags);
> > >>
> > >> -    if (!err && (chan->txdone_method & TXDONE_BY_POLL))
> > >> -            /* kick start the timer immediately to avoid delays */
> > >> +    if (!err && (chan->txdone_method & TXDONE_BY_POLL)) {
> > >> +            /* Disable the timer if already active ... */
> > >> +            hrtimer_cancel(&chan->mbox->poll_hrt);
> > >> +
> > >> +            /* ... and kick start it immediately to avoid delays */
> > >>              hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_MODE_REL);
> > >> +    }
> > >>  }
> > >>
> > >>  static void tx_tick(struct mbox_chan *chan, int r)
> > >
> > > I've tracked a regression back to this commit. Details to reproduce:
> >
> > Hi Ionela,
> >
> > I don't have access to your platform and I don't get what is going on
> > from the log below.
> >
> > Could you please give us a bit more details about what is going on ?
> >
> > All this patch does is add hrtimer_cancel().
> > * It is needed if the timer had already been started, which is
> >   appropriate AFAIU
> > * It is a NO-OP is the timer is not active.
> >
> Can you please try using hrtimer_try_to_cancel() instead ?
> 

Yes, using hrtimer_try_to_cancel() instead works for me. But doesn't
this limit how effective this change is? AFAIU, this will possibly only
reduce the chances for the race condition, but not solve it.

Thanks,
Ionela.

> thanks

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
