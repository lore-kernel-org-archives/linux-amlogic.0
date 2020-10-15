Return-Path: <SRS0=WFBQ=DW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B65C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Oct 2020 18:46:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C09FE21582
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Oct 2020 18:46:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UKTSheAm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMIoopkI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C09FE21582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sLDjd5U4v+K3M0K4t7EnxuXkaRxn/Mp2pqJfPg3zNg8=; b=UKTSheAmCKPX2Jcsm4vyab1uq
	1F8Pi91+mXvgfkk8CuTdS3okEcFp+Tz1vAWcAmMu6THTlzopnF/o/uvmV6jbc7sG4s4OcoodbPA8x
	OCiA20axvKLtKJ4z2v1ONxn4pnAF/pnuRJFmYaux6vei0H+Lao/JkuM3lVYHzI7paGYcDfpc7z11R
	ehl+TmvQk1Snw6S7iH8+dpEnWNRtb5Qo3W25O2U1kG1v82alcDLP8+7OMDrUoZJoqHVeHo08yZeMp
	hhp55WzZcolrL+izToWiD/uxWCjcG9Lve5IKwTcMwck/PHdYEQUfszhcHZRyix4r02oMXyOceVsTY
	yuh3nQr4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kT8GR-0000qp-I8; Thu, 15 Oct 2020 18:46:11 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kT8GO-0000pk-Sr
 for linux-amlogic@lists.infradead.org; Thu, 15 Oct 2020 18:46:09 +0000
Received: by mail-io1-xd44.google.com with SMTP id m17so6226198ioo.1
 for <linux-amlogic@lists.infradead.org>; Thu, 15 Oct 2020 11:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZT3LqmAePxmQwo7wqrb27mFagmwcwLvOvM1fMDiWxTs=;
 b=RMIoopkIcvzGqc6L40+oYo9n5hIYxDc6F+GydXQbn4Z0OK5OhAT2MGHWtxWkNqACCO
 m93JgoBCCQn7kNDxnOo5X1vxuc2mnXu453S78ISjNTswNMUj/x25S09i39wqbIEkE+Lk
 U2IbhPz0/CllPXiUgcd8NZmtvrkXcicHGs/sMy2zO51LV63Ku2ZQS7loxi7sh0Kbz+6O
 2rOXE7U0MK3kqWOhRwag34LKwoaXFc+vv0TDcHODLV5NfvgHE9mIeVw3gSUjupqWmI9m
 3mNJ23ex6h+rmPFLqbSdic1lrIyOVKrXicrvaOqbPnX1PK1OkQAokqMRu2JjQ8+4b7HC
 KUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZT3LqmAePxmQwo7wqrb27mFagmwcwLvOvM1fMDiWxTs=;
 b=FAuD3WscHVpd6e6hGJZUEaRyM3iKZGiDzCf5cjEl/BQyoK7XA3MV4fpKyKgnzrBUFT
 4/OZnsADrPJpcRNDzJsoYU9e0/uLv+lMZai/a1ok2/+rBf7wHstiq5pQEcdSKQe+0WDR
 IQP50px8ogC8nFMJeRMr2iAcRfafv0cc6y+tnTq1pZQhvKZjFPWyeYhWidDAOKZco7XL
 WNweu5WFW+ThOaoy+X9omwpADwIVDqRoQddOuOnFctg7XSzhO7r7DYzYL3Z/+dbslWaK
 KLl3p3n1DYM8vmb/aLSgVDUz/L/9PZg1F9cfOhBhW9JbfafT3ui6B8mZcyKrtijrbbSG
 +WWA==
X-Gm-Message-State: AOAM5327Zj/RvRiSRicsFkzUknAiJ3iwHLqRahE3fIidWqbZEBgEbsiS
 ibkFgj2N3r600ktH8fLCfWvGAnC97S+rFa2D8wc=
X-Google-Smtp-Source: ABdhPJymwxy9AgECwUqvY6xkuyHZpsnq3Q4PIkSL7QpIXigg6Zbc9Ci/h9U0MEPLbdtPUN5tMljdBKbXYLcxKSPwwUo=
X-Received: by 2002:a5d:9e47:: with SMTP id i7mr4360587ioi.52.1602787565374;
 Thu, 15 Oct 2020 11:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200923123916.1115962-1-jbrunet@baylibre.com>
 <20201015134628.GA11989@arm.com>
 <1jlfg7k2ux.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jlfg7k2ux.fsf@starbuckisacylon.baylibre.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 15 Oct 2020 13:45:54 -0500
Message-ID: <CABb+yY1-MBac0e6xQwWkHRo3bqJNMWb4xQzdaGdrYT=n5zRvtw@mail.gmail.com>
Subject: Re: [PATCH] mailbox: cancel timer before starting it
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_144608_948330_8FA1FCCB 
X-CRM114-Status: GOOD (  27.03  )
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

On Thu, Oct 15, 2020 at 8:58 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Thu 15 Oct 2020 at 15:46, Ionela Voinescu <ionela.voinescu@arm.com> wrote:
>
> > Hi guys,
> >
> > On Wednesday 23 Sep 2020 at 14:39:16 (+0200), Jerome Brunet wrote:
> >> If the txdone is done by polling, it is possible for msg_submit() to start
> >> the timer while txdone_hrtimer() callback is running. If the timer needs
> >> recheduling, it could already be enqueued by the time hrtimer_forward_now()
> >> is called, leading hrtimer to loudly complain.
> >>
> >> WARNING: CPU: 3 PID: 74 at kernel/time/hrtimer.c:932 hrtimer_forward+0xc4/0x110
> >> CPU: 3 PID: 74 Comm: kworker/u8:1 Not tainted 5.9.0-rc2-00236-gd3520067d01c-dirty #5
> >> Hardware name: Libre Computer AML-S805X-AC (DT)
> >> Workqueue: events_freezable_power_ thermal_zone_device_check
> >> pstate: 20000085 (nzCv daIf -PAN -UAO BTYPE=--)
> >> pc : hrtimer_forward+0xc4/0x110
> >> lr : txdone_hrtimer+0xf8/0x118
> >> [...]
> >>
> >> Canceling the timer before starting it ensure that the timer callback is
> >> not running when the timer is started, solving this race condition.
> >>
> >> Fixes: 0cc67945ea59 ("mailbox: switch to hrtimer for tx_complete polling")
> >> Reported-by: Da Xue <da@libre.computer>
> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> ---
> >>  drivers/mailbox/mailbox.c | 8 ++++++--
> >>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> >> index 0b821a5b2db8..34f9ab01caef 100644
> >> --- a/drivers/mailbox/mailbox.c
> >> +++ b/drivers/mailbox/mailbox.c
> >> @@ -82,9 +82,13 @@ static void msg_submit(struct mbox_chan *chan)
> >>  exit:
> >>      spin_unlock_irqrestore(&chan->lock, flags);
> >>
> >> -    if (!err && (chan->txdone_method & TXDONE_BY_POLL))
> >> -            /* kick start the timer immediately to avoid delays */
> >> +    if (!err && (chan->txdone_method & TXDONE_BY_POLL)) {
> >> +            /* Disable the timer if already active ... */
> >> +            hrtimer_cancel(&chan->mbox->poll_hrt);
> >> +
> >> +            /* ... and kick start it immediately to avoid delays */
> >>              hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_MODE_REL);
> >> +    }
> >>  }
> >>
> >>  static void tx_tick(struct mbox_chan *chan, int r)
> >
> > I've tracked a regression back to this commit. Details to reproduce:
>
> Hi Ionela,
>
> I don't have access to your platform and I don't get what is going on
> from the log below.
>
> Could you please give us a bit more details about what is going on ?
>
> All this patch does is add hrtimer_cancel().
> * It is needed if the timer had already been started, which is
>   appropriate AFAIU
> * It is a NO-OP is the timer is not active.
>
Can you please try using hrtimer_try_to_cancel() instead ?

thanks

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
