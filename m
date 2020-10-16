Return-Path: <SRS0=oK7S=DX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06797C433E7
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 17:34:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D1F1207BC
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 17:34:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sz7PsxhY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MyFCI1d5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D1F1207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BFP8AKa2uaYuZB7H7cNXP4ikccfBpBHykPVu+GhxWOg=; b=sz7PsxhY/htPOlLLfaaSWxUkF
	kMv47Ri89J9pGMn3HiTHeOrnCTnSdVSsj2nQKGYn619XlWiziyUPQjb3tHwXoOe3t4MwuDFO2R8Q8
	1aVz1SsJ7nC+hLUhp4tdU8k4w3KtUtZyJQcO3I369H+/5OX3Z7BPyQc6u7nTyErKxbKpCitHOGfIM
	3JY5BM35stGULrqMlDE0irxzPEL5chd2sg8t7fNW/c6fZrESGAqnbIYiZFFGWnu+c6SkCPyE9OxhD
	YnhaKRQsTlD36O4JJ7WtmmyTW/kq4en5gsIe+Ih4e4bsIFUw4hD6u2vJgHhuwCiwo7xZTNZ4XDK7J
	TjO24rZ3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTTcJ-0008TT-Tf; Fri, 16 Oct 2020 17:34:11 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTTcH-0008Ru-Hn
 for linux-amlogic@lists.infradead.org; Fri, 16 Oct 2020 17:34:10 +0000
Received: by mail-il1-x142.google.com with SMTP id l16so3513749ilj.9
 for <linux-amlogic@lists.infradead.org>; Fri, 16 Oct 2020 10:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QQNx5lbWWREoG92H9GWCHwFrOsjOJReO5JJROvxhPeA=;
 b=MyFCI1d57eYhGAHzNbPzG0+gwYQAPxbalJwgjSW3Xqd7s2+P4uhkgk30gxqP/ihsvQ
 KF7AvZIciGhSezS3QwLEja/cPTQDqJafJnNdZxZlCIf0vTsPdXD9Q9cshuO9TkutzWfQ
 ZAoP/KiSOVuFakNyI8LvzZLyuakFqxRi4ZzsqUJu7Pe8KdVeoKHeIyH+k4OWEFxozyCa
 5+TFuqYQOhZzIHK05h9JUTmtHxl9ACg1oGGohQgBDKcXuqyQD19KN3haqgRW3myQ+ppE
 ofO4JeH99ih+xoeSNvSPp//8olyMBOwbZlIdCeKkgxReTNifQzN5QHAqumDS43rAchzN
 zmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QQNx5lbWWREoG92H9GWCHwFrOsjOJReO5JJROvxhPeA=;
 b=Wlo4Zrum0Ll7T2CmpT/If5RAgKRK9lV4YrZJMGkOOeUliwQh4qo98vckmc/a7bf7Vk
 iawmrdOMFNkQvb/6TcImh0+nGu1bxMbczmTH7we7TLOAJbRJoFcMUvJmg2V2L8SPqzB/
 XFURSsywLNTa0gBR3rWQUK/hMlUL7qoAaZQdbVnPI8EsXm2k13nHjOvGQcMw6YWLQYhP
 lxaJF8y6uJYYavdxP/WTmEu14Jyelo5T4WnY6cPZfr4B4Sr3rSq6YFp2i7iO3P8ckt26
 otA+5GMRXHx8S0nYYyNJe7zuxmIjF2zm3T1H9jGwLkOzri06DiShzIzmtsj26L/XKCNE
 rH0A==
X-Gm-Message-State: AOAM531AGWK18Fuvk6E9fImSOdB0FyqHM0VuBjlTSwxAwzAHxk8o6oWZ
 bmHbZAIcQeo1ofRuPJXFjDo0C+fK8XYDNQzdwrCUqEObEHg=
X-Google-Smtp-Source: ABdhPJzqEi6vOzU0lH2knDMwvo/xl3sQVDyGD5lN09LWg2IW8Wn0f7e5enis3EJ0LeWdcqTHvb9n++TPoRvcM1csb1A=
X-Received: by 2002:a92:600e:: with SMTP id u14mr3557017ilb.303.1602869647783; 
 Fri, 16 Oct 2020 10:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200923123916.1115962-1-jbrunet@baylibre.com>
 <20201015134628.GA11989@arm.com>
 <1jlfg7k2ux.fsf@starbuckisacylon.baylibre.com>
 <CABb+yY1-MBac0e6xQwWkHRo3bqJNMWb4xQzdaGdrYT=n5zRvtw@mail.gmail.com>
 <20201016085217.GA12323@arm.com>
 <1jk0vqk0ju.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jk0vqk0ju.fsf@starbuckisacylon.baylibre.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 16 Oct 2020 12:33:57 -0500
Message-ID: <CABb+yY0pDxQ7B+NPsEz325-_X2nSJngnfER7uOLVyoBLoH37cA@mail.gmail.com>
Subject: Re: [PATCH] mailbox: cancel timer before starting it
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_133409_591478_D74F1B2B 
X-CRM114-Status: GOOD (  25.93  )
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
 Ionela Voinescu <ionela.voinescu@arm.com>, Da Xue <da@libre.computer>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Oct 16, 2020 at 4:00 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
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
If we are running in the callback path, hrtimer_try_to_cancel will
return -1, in which case we could skip hrtimer_start.
Anyways, I think simply checking for hrtimer_active should effect the same.
I have submitted a patch, of course not tested.

Thanks

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
