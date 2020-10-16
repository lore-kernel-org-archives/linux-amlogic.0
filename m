Return-Path: <SRS0=oK7S=DX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FABC433E7
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 11:52:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EE98206DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 11:52:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J1xEktYj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EE98206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TEm3wql03kBDByz/q4qcxp624GtaNha45GrAWoafDBA=; b=J1xEktYjiCfjuaGpQyzZtfe1y
	xklbgjSd31XwzcarDmJGSWEcYB0ijmgLTMwRSfe9SqeP8V5q3V97qYiA3UaMmVRX3FN4JXv+QUC/S
	JPDbYY2/MmfU3hQMRDuISXV7NTh2AjxotPCiBerczjXPRgN1z427Jb+AkLCk9c9oqRx1nsAVKIwO4
	XC04Umh2Q9CUHt0RDyOtS59hwxz4HvC3JGNStfbKzpThCBItefHaPHMJU2rqSx1tJJVuuh9pTnLc0
	Jl/hD5aFEbFZWKii0bfu4GmWdgzI1nXEzqs5DmY1RwBdwXtgKhNt8eLY+X+ix+306KOdIDDkdIonF
	FKtDdijIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTOHU-0006xw-41; Fri, 16 Oct 2020 11:52:20 +0000
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTOHR-0006wm-9d
 for linux-amlogic@lists.infradead.org; Fri, 16 Oct 2020 11:52:18 +0000
Received: by mail-lj1-f194.google.com with SMTP id h20so2070038lji.9
 for <linux-amlogic@lists.infradead.org>; Fri, 16 Oct 2020 04:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IvK7Gltvc5Jq16cJfQWOx4Z/DyTlXOz5LMLBN4FX8rA=;
 b=Rvw6Bf63muDPHb25KbzIGb5n4BOJ47Kcc1BecUWdh9UqBBP3EMKpZDkJcmvQ7mL+RM
 PS/AJ6e6Q1mpwBf5vbGlr7o93qq32DSoiNsDSbxE7h8CsOoIH7UntG8FzckwMGyWPhW9
 izMUtriVAYKHo8bUxaTwWQVDbhkDueNvgqMIFOf6RPxpSNPvsPcpj9cAcvLwx07SVXm2
 179n2d5jAZzNg4d0VBuxo2Kf3Zrbcq1lscPi4fVpHBX4h6RsBBefwJNdiWQVN9pjWn3E
 eQ5pYHav2s7nu8uTCxlMY9nzQO8A7R7nTh9PCF98tq6zluUvzjiyB3NDXCfBq5CdqYrl
 PA6A==
X-Gm-Message-State: AOAM533RVff23uPjaZbX1zoPfIpk3Qls4qud7hZbJQzY5gmpGPvUBLtn
 /zMcuV+uJhh9JP+Mt8Ccyxi2IWBaL/GewIiwgYg=
X-Google-Smtp-Source: ABdhPJyfiL2CwCpCnq/Nyp/ytKswfb/qspg1rklEfWYG1m+icPopCJZgdchtKOXnRjx3CG96vDWQhNz4JlW9SBJfwhQ=
X-Received: by 2002:a2e:7815:: with SMTP id t21mr1232909ljc.217.1602849134167; 
 Fri, 16 Oct 2020 04:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200923123916.1115962-1-jbrunet@baylibre.com>
 <20201015134628.GA11989@arm.com>
 <1jlfg7k2ux.fsf@starbuckisacylon.baylibre.com>
 <CABb+yY1-MBac0e6xQwWkHRo3bqJNMWb4xQzdaGdrYT=n5zRvtw@mail.gmail.com>
 <20201016085217.GA12323@arm.com>
In-Reply-To: <20201016085217.GA12323@arm.com>
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 16 Oct 2020 12:52:02 +0100
Message-ID: <CAPKp9uZu0MggcMGyxK__UeGRONo3VHHWrqKwjOtZt-pguS=6JA@mail.gmail.com>
Subject: Re: [PATCH] mailbox: cancel timer before starting it
To: Ionela Voinescu <ionela.voinescu@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_075217_336967_BB2CA437 
X-CRM114-Status: GOOD (  24.34  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Da Xue <da@libre.computer>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Oct 16, 2020 at 12:32 PM Ionela Voinescu
<ionela.voinescu@arm.com> wrote:
>
> On Thursday 15 Oct 2020 at 13:45:54 (-0500), Jassi Brar wrote:
> [..]
> > > >> --- a/drivers/mailbox/mailbox.c
> > > >> +++ b/drivers/mailbox/mailbox.c
> > > >> @@ -82,9 +82,13 @@ static void msg_submit(struct mbox_chan *chan)
> > > >>  exit:
> > > >>      spin_unlock_irqrestore(&chan->lock, flags);
> > > >>
> > > >> -    if (!err && (chan->txdone_method & TXDONE_BY_POLL))
> > > >> -            /* kick start the timer immediately to avoid delays */
> > > >> +    if (!err && (chan->txdone_method & TXDONE_BY_POLL)) {
> > > >> +            /* Disable the timer if already active ... */
> > > >> +            hrtimer_cancel(&chan->mbox->poll_hrt);
> > > >> +
> > > >> +            /* ... and kick start it immediately to avoid delays */
> > > >>              hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_MODE_REL);
> > > >> +    }
> > > >>  }
> > > >>
> > > >>  static void tx_tick(struct mbox_chan *chan, int r)
> > > >
> > > > I've tracked a regression back to this commit. Details to reproduce:
> > >
> > > Hi Ionela,
> > >
> > > I don't have access to your platform and I don't get what is going on
> > > from the log below.
> > >
> > > Could you please give us a bit more details about what is going on ?
> > >
> > > All this patch does is add hrtimer_cancel().
> > > * It is needed if the timer had already been started, which is
> > >   appropriate AFAIU
> > > * It is a NO-OP is the timer is not active.
> > >
> > Can you please try using hrtimer_try_to_cancel() instead ?
> >
>
> Yes, using hrtimer_try_to_cancel() instead works for me. But doesn't
> this limit how effective this change is? AFAIU, this will possibly only
> reduce the chances for the race condition, but not solve it.
>

Indeed, I tried the same and got a lot of -ETIME failures. hrtimer_cancel
uses hrtimer_try_to_cancel in loop until it succeeds so that the following
hrtimer_start can be done w/o any pending timers.

-- 
Regards,
Sudeep

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
