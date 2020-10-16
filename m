Return-Path: <SRS0=oK7S=DX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A74C433E7
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 13:52:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A3832063A
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 13:52:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1MwGkHYc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A3832063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A3wiyWCjF7+hP2yB68RulbzlAD2C1iZ65+gA0mZsEBM=; b=1MwGkHYcXxoPsE4uGy+CncC2J
	20pXW91dPrsCoM1FLRoQ/2cSRURbg8/d9zbaQLCvAQOJ3XHgGLua03oR2i1iD0g8Wi1R0jk9gPAaD
	2Z2XyjX+63QhMhoahhu6cW4A8zyYis5Ts8Jhw6/dPnzbomVmt0XXuFFg1JT/byUOnelDsQVhl+mNL
	MgrTHEF5c24cE4Lj+8SWsowgJEpSspOT/o9xWidE3ENa7YgcdmqNdsvz4yV4obDBFIRWdwZX22DNf
	5mc9iLJBnyMagmSiSMIlJzh9ORFwwncIL2D/A4LggfBdwRcK3LwuwmWDFU43TRWgHifzZrEuZgu2w
	/pFzp95Ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTQ9q-0003Pn-Iz; Fri, 16 Oct 2020 13:52:34 +0000
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTQ9o-0003PR-MT
 for linux-amlogic@lists.infradead.org; Fri, 16 Oct 2020 13:52:33 +0000
Received: by mail-lf1-f68.google.com with SMTP id v6so2967336lfa.13
 for <linux-amlogic@lists.infradead.org>; Fri, 16 Oct 2020 06:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3tLxs3Ec/9QewzF9/5OsF1Lu3L5UygZwfvUIskQ2kBw=;
 b=l1tGIIneghA6lHKTIQCo10qi47ZZ7iMgUBoTjvspIOQrjWbQHAQCR2EZiS3ovfZe/1
 JqSyZCv92rvjJOrhIEdgErKNQsdUwOI34/rLFBgR+AtIyTZAnJBLOaC9rA4vcJAjGygR
 VgWNoCiVd9/PJMSFAXXP0XfDWutf2QrAHeQMcZRdC3Ela1M7jvrP9VC34EMSCQnZU7Uu
 XV5K1BPS9qbug9ToA+VCprkDN24F2M616MU4wyX05TYMHHLcTSBL/acioJzyi76dvhcq
 gNCQTceePCS9mQoLNGMgosgdIF1FIUwKeWFgcb5k1h1O5Vbo1GK5SpZyA0VYAnXXLcib
 nxxA==
X-Gm-Message-State: AOAM532wrymUS+05qHmaFFIRtDS0unNZAA5n5RGWvWQZwFeinGuaW7NQ
 5/Kv0NLtqjsvGcq0UeUMvkTqf3QT1SBhJ0n6+BnAvOiOiFw=
X-Google-Smtp-Source: ABdhPJzVoTKCIBlULvlI8sRT2QNkbWiIHdeolA+3CxYx+ze+DF/frgS0t1N3TZyOWIOv7YmTV1h25wewkycLChctw8Y=
X-Received: by 2002:a05:6512:3137:: with SMTP id
 p23mr1479500lfd.316.1602856350629; 
 Fri, 16 Oct 2020 06:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200923123916.1115962-1-jbrunet@baylibre.com>
 <20201015134628.GA11989@arm.com>
 <1jlfg7k2ux.fsf@starbuckisacylon.baylibre.com>
 <CABb+yY1-MBac0e6xQwWkHRo3bqJNMWb4xQzdaGdrYT=n5zRvtw@mail.gmail.com>
 <20201016085217.GA12323@arm.com>
 <1jk0vqk0ju.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jk0vqk0ju.fsf@starbuckisacylon.baylibre.com>
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 16 Oct 2020 14:52:18 +0100
Message-ID: <CAPKp9uaqeShkedY1aJpgAhe3NWeHdKOdNQv8W_OwKj+nFMjaDg@mail.gmail.com>
Subject: Re: [PATCH] mailbox: cancel timer before starting it
To: Jerome Brunet <jbrunet@baylibre.com>, Sudeep Holla <sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_095232_743337_6C747F17 
X-CRM114-Status: GOOD (  26.72  )
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
 Ionela Voinescu <ionela.voinescu@arm.com>, Da Xue <da@libre.computer>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Oct 16, 2020 at 1:15 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Fri 16 Oct 2020 at 10:52, Ionela Voinescu <ionela.voinescu@arm.com> wrote:
>
> > On Thursday 15 Oct 2020 at 13:45:54 (-0500), Jassi Brar wrote:
> > [..]
> >> > >> --- a/drivers/mailbox/mailbox.c
> >> > >> +++ b/drivers/mailbox/mailbox.c
> >> > >> @@ -82,9 +82,13 @@ static void msg_submit(struct mbox_chan *chan)
> >> > >>  exit:
> >> > >>      spin_unlock_irqrestore(&chan->lock, flags);
> >> > >>
> >> > >> -    if (!err && (chan->txdone_method & TXDONE_BY_POLL))
> >> > >> -            /* kick start the timer immediately to avoid delays */
> >> > >> +    if (!err && (chan->txdone_method & TXDONE_BY_POLL)) {
> >> > >> +            /* Disable the timer if already active ... */
> >> > >> +            hrtimer_cancel(&chan->mbox->poll_hrt);
> >> > >> +
> >> > >> +            /* ... and kick start it immediately to avoid delays */
> >> > >>              hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_MODE_REL);
> >> > >> +    }
> >> > >>  }
> >> > >>
> >> > >>  static void tx_tick(struct mbox_chan *chan, int r)
> >> > >
> >> > > I've tracked a regression back to this commit. Details to reproduce:
> >> >
> >> > Hi Ionela,
> >> >
> >> > I don't have access to your platform and I don't get what is going on
> >> > from the log below.
> >> >
> >> > Could you please give us a bit more details about what is going on ?
> >> >
> >> > All this patch does is add hrtimer_cancel().
> >> > * It is needed if the timer had already been started, which is
> >> >   appropriate AFAIU
> >> > * It is a NO-OP is the timer is not active.
> >> >
> >> Can you please try using hrtimer_try_to_cancel() instead ?
> >>
> >
> > Yes, using hrtimer_try_to_cancel() instead works for me. But doesn't
> > this limit how effective this change is? AFAIU, this will possibly only
> > reduce the chances for the race condition, but not solve it.
> >
>
> It is also my understanding, hrtimer_try_to_cancel() would remove a
> timer which as not already started but would return withtout doing
> anything if the callback is already running ... which is the original
> problem
>


There seem to be some races. It always hangs in the hrtimer_cancel.
Logging some extra messages makes it progress for a while and finally
get stuck in the loop. I wonder if there is a race between cancel
and handler execution.

-- 
Regards,
Sudeep

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
