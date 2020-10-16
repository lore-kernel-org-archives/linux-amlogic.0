Return-Path: <SRS0=oK7S=DX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA713C433E7
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 18:55:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F800212CC
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 18:55:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ccc6lUet";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bkVHQhFM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F800212CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f5syPhGOZffFakTKI8MEEr2YYIxYhELrSX/MzjcZnCM=; b=Ccc6lUetOVUYl3uranc71ejm5
	qXfti9ywNgPLruEKSRPPGWFPBJI6XARHGLj4Uark45x3PiXebR3BDhEy1W17SgbsVBVFoZYPANp4K
	87p6hr/mVZeVb1OYe/71C+xZewzsL17PCSh4yctuJoC1Wni7Y6/jD9XAawaLVilr3ArBnodqPM00r
	p4XApySpsnXIZbDbEIaCvr4hoNj/1B9YMr53X+lWexChCOykZpM56/w5gJsHdgxbS1kNm0zp1hs1e
	+DQRjwGWU780yx3hbaLvPcUl3eEOFnbvLK4cOaU5E9mQH9n41jJHfqjBMYta3rFcDmUCM8HeHga7F
	djfsHfUZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTUsk-00026C-4i; Fri, 16 Oct 2020 18:55:14 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTUsU-00020E-Tm
 for linux-amlogic@lists.infradead.org; Fri, 16 Oct 2020 18:55:08 +0000
Received: by mail-ed1-x542.google.com with SMTP id dg9so3473175edb.12
 for <linux-amlogic@lists.infradead.org>; Fri, 16 Oct 2020 11:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=OBFJ5RfCXY9bpxl1TWGCyUY+dYqJSSwXVnmVFww6Des=;
 b=bkVHQhFML0mSWmvehN1DzB5vqdG7YlLmI0KDHoLbb/5+B/rdu79GY8TIfrA2ciP261
 C91zwYDMVuZMkHsVUilPL0yazA3dkF7E42VjFD2EXviznbjwW1P/kjOFQpRG2S+iFTpI
 wYG1Jrn9VVqRxdJqEMyt6jAhwdi475szMSRdNmXKmNQW3iTZPRyTeW3nuk0t0C3m3jpA
 +ZRr4ATDFD1eeJlhz74tNgl35yjjVPhdppKOmnBUy0SWfDeU2K4Oxmd9jjl67Wng8XOH
 P2KSTtlhfTp3aAuSzeKpubN44rtYEtSxamSZJHuQ1uU/2JlsZif6SE+ar3v1gccInOMB
 52KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=OBFJ5RfCXY9bpxl1TWGCyUY+dYqJSSwXVnmVFww6Des=;
 b=HS7mOXIqpcm9lvd0+zwNsKlARztGHkjMKgyMsxddPtpNMxH1LZAO+DV3eqNSI0+t1n
 Os/FkZ/HNynG5oRo6uVkY0uJYYawhJ2X9CAeyamvFBmDhXkYDfnD7b7tCK5utNiV1nfK
 efJzZ5t8WO3GUmr/y63BZ039uUBnwJiiOZbpDJBuNPfvXBoae2q9siwxb4dyC+JXluJp
 MsxLjC1eq987z/TdmlwlbSCJ8SMjG8LzqVdQioZGmVtb9XppgJlrxLSZoREDA6VGab0X
 UcmyglPrPz72YAWoOUgY9l4ZmXHTtfW4dXClvmaXCJWBrwyf5KYeaS9bQ7eDFFqzgN3q
 2QcQ==
X-Gm-Message-State: AOAM533OwYIonoQYRIVXga8OrUkc33vEkVbvhMnerGx9BWmCmnNSymvN
 TGZ0ywGnWn46Y7RVXQa2WzYPbw==
X-Google-Smtp-Source: ABdhPJzSOaPwv6Mp9iJ+YDKakY+j87fCgJz/D0gy5zxV8nBfwtNHNXPwVTdQ4RVpzWD+YMZjr2nnTA==
X-Received: by 2002:a50:b745:: with SMTP id g63mr5595037ede.181.1602874497505; 
 Fri, 16 Oct 2020 11:54:57 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id h17sm2527030ejf.98.2020.10.16.11.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:54:56 -0700 (PDT)
References: <20200923123916.1115962-1-jbrunet@baylibre.com>
 <20201015134628.GA11989@arm.com>
 <1jlfg7k2ux.fsf@starbuckisacylon.baylibre.com>
 <CABb+yY1-MBac0e6xQwWkHRo3bqJNMWb4xQzdaGdrYT=n5zRvtw@mail.gmail.com>
 <20201016085217.GA12323@arm.com>
 <1jk0vqk0ju.fsf@starbuckisacylon.baylibre.com>
 <CABb+yY0pDxQ7B+NPsEz325-_X2nSJngnfER7uOLVyoBLoH37cA@mail.gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] mailbox: cancel timer before starting it
In-reply-to: <CABb+yY0pDxQ7B+NPsEz325-_X2nSJngnfER7uOLVyoBLoH37cA@mail.gmail.com>
Date: Fri, 16 Oct 2020 20:54:55 +0200
Message-ID: <1jft6ej91c.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_145459_109510_72F6CB2C 
X-CRM114-Status: GOOD (  26.41  )
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


On Fri 16 Oct 2020 at 19:33, Jassi Brar <jassisinghbrar@gmail.com> wrote:

> On Fri, Oct 16, 2020 at 4:00 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>>
>> On Fri 16 Oct 2020 at 10:52, Ionela Voinescu <ionela.voinescu@arm.com> wrote:
>>
>> > On Thursday 15 Oct 2020 at 13:45:54 (-0500), Jassi Brar wrote:
>> > [..]
>> >> > >> --- a/drivers/mailbox/mailbox.c
>> >> > >> +++ b/drivers/mailbox/mailbox.c
>> >> > >> @@ -82,9 +82,13 @@ static void msg_submit(struct mbox_chan *chan)
>> >> > >>  exit:
>> >> > >>      spin_unlock_irqrestore(&chan->lock, flags);
>> >> > >>
>> >> > >> -    if (!err && (chan->txdone_method & TXDONE_BY_POLL))
>> >> > >> -            /* kick start the timer immediately to avoid delays */
>> >> > >> +    if (!err && (chan->txdone_method & TXDONE_BY_POLL)) {
>> >> > >> +            /* Disable the timer if already active ... */
>> >> > >> +            hrtimer_cancel(&chan->mbox->poll_hrt);
>> >> > >> +
>> >> > >> +            /* ... and kick start it immediately to avoid delays */
>> >> > >>              hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_MODE_REL);
>> >> > >> +    }
>> >> > >>  }
>> >> > >>
>> >> > >>  static void tx_tick(struct mbox_chan *chan, int r)
>> >> > >
>> >> > > I've tracked a regression back to this commit. Details to reproduce:
>> >> >
>> >> > Hi Ionela,
>> >> >
>> >> > I don't have access to your platform and I don't get what is going on
>> >> > from the log below.
>> >> >
>> >> > Could you please give us a bit more details about what is going on ?
>> >> >
>> >> > All this patch does is add hrtimer_cancel().
>> >> > * It is needed if the timer had already been started, which is
>> >> >   appropriate AFAIU
>> >> > * It is a NO-OP is the timer is not active.
>> >> >
>> >> Can you please try using hrtimer_try_to_cancel() instead ?
>> >>
>> >
>> > Yes, using hrtimer_try_to_cancel() instead works for me. But doesn't
>> > this limit how effective this change is? AFAIU, this will possibly only
>> > reduce the chances for the race condition, but not solve it.
>> >
>>
>> It is also my understanding, hrtimer_try_to_cancel() would remove a
>> timer which as not already started but would return withtout doing
>> anything if the callback is already running ... which is the original
>> problem
>>
> If we are running in the callback path, hrtimer_try_to_cancel will
> return -1, in which case we could skip hrtimer_start.
> Anyways, I think simply checking for hrtimer_active should effect the same.
> I have submitted a patch, of course not tested.

Yes it sloves this race but ...

If a race is possible between a timer callback rescheduling itself (which
is not that uncommon) and another thread trying to cancel it, maybe
there is something worth fixing in hrtimer ? Also, mailbox calls
hrtimer_cancel() in unregister ... are we confident this would work ?

Any fix is by me - yours avoid killing and restarting the timer :) but
it feels like we are working around an issue that might bite us back
later on.

>
> Thanks


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
