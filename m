Return-Path: <SRS0=oK7S=DX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8139C433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 19:28:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 622E720829
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 19:28:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZiX7Bp27";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9rp63JS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 622E720829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LuyHfPzkJUt+E6hitPM3Gcw0tMEaZaFc+B8odNx8qv8=; b=ZiX7Bp27gPTH6D6t4Q1GUTq16
	Y28+clarcSKrVOb6XujSkk+5sEWVI0PD9IZ3hetD2ipD9kQuqIIeFpwXcNUveA9MwWUUb0Oy00YbF
	ySbgbpXJMtP2oEVO5mEx64kBxWvhXMLdpJqYSfGznCpkimyY1gBeyJWLTBvVEvcSSrwlpKykV/Fy7
	j3m2x57K7gyV3MD8YGGN59wagArH7pbV4Gv2KZ1ANW0OfSFDWGC/1AwmMHfvVENChPy/2bk8kB9y1
	u8GnHgAIWxPGU9tSilu7vXsEHLJwd4ZdVoy/JFlUBItUREvobkLAthko+Vyp/ERaV2irOjRlB7R6N
	oMYpG9GYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTVOU-0006EW-56; Fri, 16 Oct 2020 19:28:02 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTVOP-0006Ci-7w
 for linux-amlogic@lists.infradead.org; Fri, 16 Oct 2020 19:27:59 +0000
Received: by mail-il1-x144.google.com with SMTP id j8so3973091ilk.0
 for <linux-amlogic@lists.infradead.org>; Fri, 16 Oct 2020 12:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1DJnrCVnvy4PoMtVGFycjUVirWQQwi3AYGu5HmZZQwQ=;
 b=X9rp63JScAmPAW+kyhIqursnDhfJTrj0ZGbEnAzBHYg+kq0WkEUosaRnDPVOyc4rPm
 aly52LA2VUl/vVmAsXzsxWDfNFoAY/NvEwJZdD7AgzlR0BZ8Nv+AY0REwg9IpNTZB1J+
 AI8XkXWArpm8XI9ZHfcPNFZPqJIP+w4jsFPOLJDmTuqLdD+7Gv485x9kgOvx2B84bQSJ
 vLy9dWeKBnMNZqk1QWVgAUbHrmwDn2WO89Hr5jE0jwmFQIf5YR02mD7JehIFzoD+ZchC
 tLLrw+YVM8Fj9JQQfG9cKIkkdfnSq06ogxMvn5WzgahHCaRS4+hx9TUyKOCtHEOURRVD
 N6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1DJnrCVnvy4PoMtVGFycjUVirWQQwi3AYGu5HmZZQwQ=;
 b=R96jSCHJJGwRQJqwNdlB2oVAXf9PUX7fkx14+lGwC5DO+CLMUk0D2OuKFC7oyvObwf
 vCwQxqCCE/LcDTTRLUMV1Cu9/ZMAIht9/1Ug04umQH8IZeDh8MlFic1BV0Ts/P/MUDDI
 II4/dhn/ymerTbqJfPRnchDM7HWq+DF71jV12ZyHlvOdj04HadOFrbWbpo0bTe4+MBRF
 0orpsknxsdVeUj/B66Av0D493AsCVAko153VjP9E0Pg24R0NqF956qYtG8Flu5Bp4I75
 9ALq4Z07Ye5fVG178U+nif1CpYCTYqD6EwwAA5Bj5WSOOBYeOfc7eCVLuPtBQco/tt4F
 Yztg==
X-Gm-Message-State: AOAM533HRi2s0Dm2MDZSfz9iA3eQewVPcRbx9b7Ef1yCobgRaWbvZ1iE
 xtnHSHQgdidqBFygD+Nhct++VA4rQ8l5GIy9i9Y=
X-Google-Smtp-Source: ABdhPJzxFfuKsusi7gNdStcCWsYC45SHHjQhi7PziKAYTfwXYyFewbjE66BYsHom8WYmkbtQdiVJOBCrQU7//fwykx4=
X-Received: by 2002:a92:8910:: with SMTP id n16mr4077254ild.239.1602876473992; 
 Fri, 16 Oct 2020 12:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200923123916.1115962-1-jbrunet@baylibre.com>
 <20201015134628.GA11989@arm.com>
 <1jlfg7k2ux.fsf@starbuckisacylon.baylibre.com>
 <CABb+yY1-MBac0e6xQwWkHRo3bqJNMWb4xQzdaGdrYT=n5zRvtw@mail.gmail.com>
 <20201016085217.GA12323@arm.com>
 <1jk0vqk0ju.fsf@starbuckisacylon.baylibre.com>
 <CABb+yY0pDxQ7B+NPsEz325-_X2nSJngnfER7uOLVyoBLoH37cA@mail.gmail.com>
 <1jft6ej91c.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jft6ej91c.fsf@starbuckisacylon.baylibre.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 16 Oct 2020 14:27:43 -0500
Message-ID: <CABb+yY0Ktj9O9YxGDM0q_6MnKPBCopm+RzQa6SM64Pn_60a2pA@mail.gmail.com>
Subject: Re: [PATCH] mailbox: cancel timer before starting it
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_152757_386747_852C20CB 
X-CRM114-Status: GOOD (  30.74  )
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

On Fri, Oct 16, 2020 at 1:54 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Fri 16 Oct 2020 at 19:33, Jassi Brar <jassisinghbrar@gmail.com> wrote:
>
> > On Fri, Oct 16, 2020 at 4:00 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
> >>
> >>
> >> On Fri 16 Oct 2020 at 10:52, Ionela Voinescu <ionela.voinescu@arm.com> wrote:
> >>
> >> > On Thursday 15 Oct 2020 at 13:45:54 (-0500), Jassi Brar wrote:
> >> > [..]
> >> >> > >> --- a/drivers/mailbox/mailbox.c
> >> >> > >> +++ b/drivers/mailbox/mailbox.c
> >> >> > >> @@ -82,9 +82,13 @@ static void msg_submit(struct mbox_chan *chan)
> >> >> > >>  exit:
> >> >> > >>      spin_unlock_irqrestore(&chan->lock, flags);
> >> >> > >>
> >> >> > >> -    if (!err && (chan->txdone_method & TXDONE_BY_POLL))
> >> >> > >> -            /* kick start the timer immediately to avoid delays */
> >> >> > >> +    if (!err && (chan->txdone_method & TXDONE_BY_POLL)) {
> >> >> > >> +            /* Disable the timer if already active ... */
> >> >> > >> +            hrtimer_cancel(&chan->mbox->poll_hrt);
> >> >> > >> +
> >> >> > >> +            /* ... and kick start it immediately to avoid delays */
> >> >> > >>              hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_MODE_REL);
> >> >> > >> +    }
> >> >> > >>  }
> >> >> > >>
> >> >> > >>  static void tx_tick(struct mbox_chan *chan, int r)
> >> >> > >
> >> >> > > I've tracked a regression back to this commit. Details to reproduce:
> >> >> >
> >> >> > Hi Ionela,
> >> >> >
> >> >> > I don't have access to your platform and I don't get what is going on
> >> >> > from the log below.
> >> >> >
> >> >> > Could you please give us a bit more details about what is going on ?
> >> >> >
> >> >> > All this patch does is add hrtimer_cancel().
> >> >> > * It is needed if the timer had already been started, which is
> >> >> >   appropriate AFAIU
> >> >> > * It is a NO-OP is the timer is not active.
> >> >> >
> >> >> Can you please try using hrtimer_try_to_cancel() instead ?
> >> >>
> >> >
> >> > Yes, using hrtimer_try_to_cancel() instead works for me. But doesn't
> >> > this limit how effective this change is? AFAIU, this will possibly only
> >> > reduce the chances for the race condition, but not solve it.
> >> >
> >>
> >> It is also my understanding, hrtimer_try_to_cancel() would remove a
> >> timer which as not already started but would return withtout doing
> >> anything if the callback is already running ... which is the original
> >> problem
> >>
> > If we are running in the callback path, hrtimer_try_to_cancel will
> > return -1, in which case we could skip hrtimer_start.
> > Anyways, I think simply checking for hrtimer_active should effect the same.
> > I have submitted a patch, of course not tested.
>
> Yes it sloves this race but ...
>
Thanks for confirmation.

> If a race is possible between a timer callback rescheduling itself (which
> is not that uncommon) and another thread trying to cancel it
>
In our case, we should not be cancelling+restarting the timer in the
first place, because txdone_hrtimer will take care of it via
hrtimer_forward_now.

>, maybe
> there is something worth fixing in hrtimer ? Also, mailbox calls
> hrtimer_cancel() in unregister ... are we confident this would work ?
>
Yes. After unregister() every channel is supposed to die and so must
its resources.

-jassi

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
