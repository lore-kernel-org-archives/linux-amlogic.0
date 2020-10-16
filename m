Return-Path: <SRS0=oK7S=DX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D6AC433E7
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 09:00:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 115C020848
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 09:00:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3ay/0UMc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wXy5eIvn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 115C020848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y6BHqwN+dXF/oPeJRfprjQ61Psf4MyRea822bt3sFDg=; b=3ay/0UMc9GWklibrqO61Kd1Dm
	aFGcLrNaX4bIr2tXHja3x/HvTaNIG7YOrZtAsg+CRM5/v/IUgqq6NzlEpDGlK5v85Xx2CY5QS8SC2
	OQHE01epHugtCZt+yb7Egk3w4QUe2JNODnPdrlz5cJUCCaxwjDR5UFElzicePutz3BWM6cD+zyjsh
	WbXU47obvMFZjoCRgnuDBQOvIpEfWZXaidvzttvU+ar70OE1Q6zwmTTJnKcmHiDjty9+8vzgTYjvq
	VxrNV40dZ2Dix4+9w7lbKRM6+P61IGOvPAoUZZUd57cY5zHPNHvB5leIaKXiK+AYJ3b7bG+deMFE8
	ZfhsmjKEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTLbP-0006pa-3j; Fri, 16 Oct 2020 09:00:43 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTLbM-0006ok-Dy
 for linux-amlogic@lists.infradead.org; Fri, 16 Oct 2020 09:00:41 +0000
Received: by mail-ej1-x642.google.com with SMTP id u8so2075640ejg.1
 for <linux-amlogic@lists.infradead.org>; Fri, 16 Oct 2020 02:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=iB+QPH92mHXjVf31wrVpD9hY3E5/PzA4JTgfur7FThU=;
 b=wXy5eIvn1HY2VZDvfhHhh92E7KKD+T/lLU6bPSDc19eVJ4GXWhv/UJjTulrUaNv/WH
 rxvE8zjr4KT2rLGqZZSBkhe9QWHea2ahORcSg5usFyYFPeHSaJzZmidW1fMeOz9vpeEv
 Szn0nAVXtwAtsnkQ8XdfdzQnFVn4aGZvxgaNvVGt2x6F6oVRcC+OajWE2AVTYj/jeoJp
 OQ/cdoE4MbI1HOr0QxG8RM92wo2iY/NXxIIESZ2Eh7p4vIifkHvBeGNl7ejQC0O9/KCs
 tKgk5UYgs0FVUR2lqImvCjj4S2vU+wJhCvw+3OqDmgIX+U2BBVZfdKLm6tL1z6Qqt3Cl
 mf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=iB+QPH92mHXjVf31wrVpD9hY3E5/PzA4JTgfur7FThU=;
 b=UJdmSk3ZlfcirayuPD1MxWZccQWCL4QWpiWPOW9N1fMUc2TMKeNtZYUv10gf697Qxq
 mqgR6viGnFy0p+VLsHO56Y8h4OOv1nQ1U/AOqGj+Axa2IlbJSphQvk9voy1ouwCjehov
 H4/fUBUTCv74vcBX3UjhiKfx2S3ZohdS7VtOEdPK+2oC2xQqmEocY67+gK9lSPdLaB+U
 fQvalNM+QG8f9lgFyLzcDv93WX3crOws7qtjJOS7NZ9j+D2pC0QCdHetk5VSBxXImnPx
 wMcnzSl+T56/bztlDKZxT/IZE//8bL8FoM2PQ6SDLeTr0rQpqmavsBpN+cfTczpemX5s
 gsEQ==
X-Gm-Message-State: AOAM532S+JBJLh5/tmsBDTYoHGkL4JnoQHOyDLwc+AXu9vfk8dWSAdNk
 DIAvoF0KvSAaRe+BXTCsSN+mOg==
X-Google-Smtp-Source: ABdhPJzUtemqqSmoJUsCCHlxelMMqqZjxqDcFeCbf5OyFCEHpXFqe511f4bCdUO1Wwe6uRKDksw7zA==
X-Received: by 2002:a17:906:3a97:: with SMTP id
 y23mr2680177ejd.250.1602838839150; 
 Fri, 16 Oct 2020 02:00:39 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id dp1sm1157128ejc.74.2020.10.16.02.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 02:00:38 -0700 (PDT)
References: <20200923123916.1115962-1-jbrunet@baylibre.com>
 <20201015134628.GA11989@arm.com>
 <1jlfg7k2ux.fsf@starbuckisacylon.baylibre.com>
 <CABb+yY1-MBac0e6xQwWkHRo3bqJNMWb4xQzdaGdrYT=n5zRvtw@mail.gmail.com>
 <20201016085217.GA12323@arm.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ionela Voinescu <ionela.voinescu@arm.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] mailbox: cancel timer before starting it
In-reply-to: <20201016085217.GA12323@arm.com>
Date: Fri, 16 Oct 2020 11:00:37 +0200
Message-ID: <1jk0vqk0ju.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_050040_579269_5AE2894E 
X-CRM114-Status: GOOD (  21.54  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, Da Xue <da@libre.computer>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 16 Oct 2020 at 10:52, Ionela Voinescu <ionela.voinescu@arm.com> wrote:

> On Thursday 15 Oct 2020 at 13:45:54 (-0500), Jassi Brar wrote:
> [..]
>> > >> --- a/drivers/mailbox/mailbox.c
>> > >> +++ b/drivers/mailbox/mailbox.c
>> > >> @@ -82,9 +82,13 @@ static void msg_submit(struct mbox_chan *chan)
>> > >>  exit:
>> > >>      spin_unlock_irqrestore(&chan->lock, flags);
>> > >>
>> > >> -    if (!err && (chan->txdone_method & TXDONE_BY_POLL))
>> > >> -            /* kick start the timer immediately to avoid delays */
>> > >> +    if (!err && (chan->txdone_method & TXDONE_BY_POLL)) {
>> > >> +            /* Disable the timer if already active ... */
>> > >> +            hrtimer_cancel(&chan->mbox->poll_hrt);
>> > >> +
>> > >> +            /* ... and kick start it immediately to avoid delays */
>> > >>              hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_MODE_REL);
>> > >> +    }
>> > >>  }
>> > >>
>> > >>  static void tx_tick(struct mbox_chan *chan, int r)
>> > >
>> > > I've tracked a regression back to this commit. Details to reproduce:
>> >
>> > Hi Ionela,
>> >
>> > I don't have access to your platform and I don't get what is going on
>> > from the log below.
>> >
>> > Could you please give us a bit more details about what is going on ?
>> >
>> > All this patch does is add hrtimer_cancel().
>> > * It is needed if the timer had already been started, which is
>> >   appropriate AFAIU
>> > * It is a NO-OP is the timer is not active.
>> >
>> Can you please try using hrtimer_try_to_cancel() instead ?
>> 
>
> Yes, using hrtimer_try_to_cancel() instead works for me. But doesn't
> this limit how effective this change is? AFAIU, this will possibly only
> reduce the chances for the race condition, but not solve it.
>

It is also my understanding, hrtimer_try_to_cancel() would remove a
timer which as not already started but would return withtout doing
anything if the callback is already running ... which is the original
problem


> Thanks,
> Ionela.
>
>> thanks


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
