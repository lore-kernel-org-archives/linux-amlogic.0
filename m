Return-Path: <SRS0=oK7S=DX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F5DC433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 18:46:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A5CE20725
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 18:46:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aYAfzcBY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+iDyajo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A5CE20725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ircyIpNIu+ED2FKTz8/yWbTtnbz7mTcYG1QrMxe6WKY=; b=aYAfzcBYWd2iVTqxUBQSYWONQ
	ssWHX4AK0Po3OC/XJVx1Ainpuz3MU09I828Nd6Yx4AJ39bqiYHovBsk2ggb3d1OZhzTAd0N7jd7HX
	hBI5tZFS7xNKHwP4ZCFfpDDZunzZgYBGmkhDLFGRmBWltBIlsL+atDs3g5XndB1MbCBPXEz8LtEXm
	kYs9gEeVO7V7HUDVcy8p9GUkg/beCqCGle0dBQd513jqXQYgEry+u/ZEQBHn/kguR+UL0hWF2vYFq
	aLefQhKEGirngj1Vo8MoesoazNNwu8plcoZoDwi+2KLhfoQiwCLWlOKr9EWc7ZxjUKjQDNsM/Z015
	C0/YYAIaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTUjt-0008Cq-3R; Fri, 16 Oct 2020 18:46:05 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTUjr-0008CS-2h
 for linux-amlogic@lists.infradead.org; Fri, 16 Oct 2020 18:46:03 +0000
Received: by mail-io1-xd44.google.com with SMTP id 67so5090756iob.8
 for <linux-amlogic@lists.infradead.org>; Fri, 16 Oct 2020 11:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gFYiHCtCMBPTnzOc5FacAZTSSsWRxO+aMV1lhIW9c4A=;
 b=Y+iDyajocIxVP1ldK6z4P5MpjH5KHiGPZqqpmxBm2PZBXtC4O0CDNobydFUS0eSv8c
 DOfn99vT45hHin3T346vSjjuIgRI4XAIpkP8O5QUODbnsrB3EXDYQChHWCOUxNFnBWf2
 m9JHwYqJT9tpFqUwRmUHmmvhdl6a3DP8DPyPMXy/G9L6wYsE1geCM7VvFF2UgJ5x7hlv
 tdH5OuAzllqlr+8+VsWAan8cSAmvvhcn84Ua+jJTEbnzXLQYxlm3oDMtOh4JzFHd0y2+
 W2CdYccBmN/AWjFzu3Wyy+a8K+Hr0Es/X+wYtpNsLC6eQrDnrfGft5WqmsE92nvPYYre
 ed7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gFYiHCtCMBPTnzOc5FacAZTSSsWRxO+aMV1lhIW9c4A=;
 b=EShwLWtI9zSG23XCkK25oyYQGtiY+P0/tq3ZpDBr0NQi//81DatWkzelc+h27PKbbv
 UAikhYW+DYbJofJT3MmsHP7JMpbpxgXWq+2Otf4M/l+5oWTzt+hqPe0FHCCd0yvgE5zC
 DaXuV2sVrjxqRbH9KIQorrks7V4xECkZhNOef5YRaocDKv5R5MUMP4RzwwvjoNJzxYy3
 FV/inBESKJD6YXKrphRjqFjBLgMHbuVpAaYEQ8bzIaFoJvdMlyqEF1fB0qay9JZfACec
 gi90MqaMXJqg7ewpsqLDbO4FkvmlkQiULkEGRFuQNS+TIy24mPP9aE+GCQEiVP0Nmonj
 EyBA==
X-Gm-Message-State: AOAM532cHdKiSQ/wl6L8fScDhMdtTjbD9DLNj/7O5yw4YfnxvKMyptUA
 QYR1dmp8XBV0Bx2i+sux8PbD0sS9ZF59QXvEeOg=
X-Google-Smtp-Source: ABdhPJwpScOm7bxiJmJnbvOrphT+j2Q+QAlQXIUGg5uVqwUQygWnzDTWCHHayI8QccyqyREkYjWjDp5gWcQWXx6Ukxo=
X-Received: by 2002:a5e:9618:: with SMTP id a24mr3613286ioq.27.1602873960045; 
 Fri, 16 Oct 2020 11:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201016173020.12686-1-jassisinghbrar@gmail.com>
 <1jh7quj9sa.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jh7quj9sa.fsf@starbuckisacylon.baylibre.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 16 Oct 2020 13:45:49 -0500
Message-ID: <CABb+yY3oghojLDAz2n8fio47X=we=mF=u8iA2zc7ApvcH7ySKA@mail.gmail.com>
Subject: Re: [PATCH] mailbox: avoid timer start from callback
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_144603_177735_65830695 
X-CRM114-Status: GOOD (  25.54  )
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jassi Brar <jaswinder.singh@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Ionela Voinescu <ionela.voinescu@arm.com>, Da Xue <da@libre.computer>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Oct 16, 2020 at 1:38 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Fri 16 Oct 2020 at 19:30, jassisinghbrar@gmail.com wrote:
>
> > From: Jassi Brar <jaswinder.singh@linaro.org>
> >
> > If the txdone is done by polling, it is possible for msg_submit() to start
> > the timer while txdone_hrtimer() callback is running. If the timer needs
> > recheduling, it could already be enqueued by the time hrtimer_forward_now()
> > is called, leading hrtimer to loudly complain.
> >
> > WARNING: CPU: 3 PID: 74 at kernel/time/hrtimer.c:932 hrtimer_forward+0xc4/0x110
> > CPU: 3 PID: 74 Comm: kworker/u8:1 Not tainted 5.9.0-rc2-00236-gd3520067d01c-dirty #5
> > Hardware name: Libre Computer AML-S805X-AC (DT)
> > Workqueue: events_freezable_power_ thermal_zone_device_check
> > pstate: 20000085 (nzCv daIf -PAN -UAO BTYPE=--)
> > pc : hrtimer_forward+0xc4/0x110
> > lr : txdone_hrtimer+0xf8/0x118
> > [...]
> >
> > This can be fixed by not starting the timer from the callback path. Which
> > requires the timer reloading as long as any message is queued on the
> > channel, and not just when current tx is not done yet.
> >
> > Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
> > ---
> >  drivers/mailbox/mailbox.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> > index 0b821a5b2db8..a093a6ecaa66 100644
> > --- a/drivers/mailbox/mailbox.c
> > +++ b/drivers/mailbox/mailbox.c
> > @@ -82,9 +82,12 @@ static void msg_submit(struct mbox_chan *chan)
> >  exit:
> >       spin_unlock_irqrestore(&chan->lock, flags);
> >
> > -     if (!err && (chan->txdone_method & TXDONE_BY_POLL))
> > -             /* kick start the timer immediately to avoid delays */
> > -             hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_MODE_REL);
> > +     /* kick start the timer immediately to avoid delays */
> > +     if (!err && (chan->txdone_method & TXDONE_BY_POLL)) {
> > +             /* but only if not already active */
>
> It would solve the problem I reported as well but instead of running the
> check immediately (timer with value 0), we will have to wait for the
> next of the timer, it is already started. IOW, there might be a delay
> now. I don't know if this important for the mailbox - the existing
> comments in the code suggested it was.
>
That comment is for when the first message is queued on the channel,
which remains unimpacted.
So, do I have your tested/acked by ?

thnx,

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
