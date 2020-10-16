Return-Path: <SRS0=oK7S=DX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4F9C433E7
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 11:47:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BB2E2084C
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2020 11:47:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cwON/Qle"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BB2E2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dxAnPhW8nwuarPbW3K0zAIiqFHgxsA9zpRsh/DkaS00=; b=cwON/QleP3PyFUke8e2urLyH4
	kGRvd8mIkE7/LbNH80pFbNWqi6YhQEw8yEGRz8d3lcgwGPEmv3NtIve8QEjlXo8LdfpE6tfiBkzxv
	oRD3cYeraPar9MxqkJzbJoFvi5XlN3lQHYyhE+kDpJTUqgpcWz2sg4pyf60TwCRux/n4wBEjoEo89
	lxsb1TdW0zDq/6lgnqEm1+zzWDQ8bphCfNBUr6f/Oqtzs7n/BrWKulGX1u/XPc3/W5+kgJhLalyZK
	NfwHw9tjjZwahY0m3RqUlkb5m37ps3p+uxOJq4+OiCuFRUa5LlRW/iiJXDlUxGENyiW+dMY3Txm7E
	288+X2YQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTOCt-0006Jf-6E; Fri, 16 Oct 2020 11:47:35 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTOCr-0006Im-1p
 for linux-amlogic@lists.infradead.org; Fri, 16 Oct 2020 11:47:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE7FBD6E;
 Fri, 16 Oct 2020 04:47:30 -0700 (PDT)
Received: from bogus (unknown [10.57.17.164])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B37B23F66B;
 Fri, 16 Oct 2020 04:47:29 -0700 (PDT)
Date: Fri, 16 Oct 2020 12:47:27 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] mailbox: cancel timer before starting it
Message-ID: <20201016114727.kvjimgaubcrcmp2k@bogus>
References: <20200923123916.1115962-1-jbrunet@baylibre.com>
 <20201015134628.GA11989@arm.com>
 <1jlfg7k2ux.fsf@starbuckisacylon.baylibre.com>
 <20201015142935.GA12516@arm.com>
 <20201016084428.gthqj25wrvnqjsvz@bogus>
 <1jimbak0hh.fsf@starbuckisacylon.baylibre.com>
 <20201016093421.7hyiqrekiy6mtyso@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016093421.7hyiqrekiy6mtyso@bogus>
User-Agent: NeoMutt/20171215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_074733_223290_32318654 
X-CRM114-Status: GOOD (  38.99  )
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
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Ionela Voinescu <ionela.voinescu@arm.com>, Da Xue <da@libre.computer>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Oct 16, 2020 at 10:34:21AM +0100, Sudeep Holla wrote:
> On Fri, Oct 16, 2020 at 11:02:02AM +0200, Jerome Brunet wrote:
> > 
> > On Fri 16 Oct 2020 at 10:44, Sudeep Holla <sudeep.holla@arm.com> wrote:
> > 
> > > On Thu, Oct 15, 2020 at 03:29:35PM +0100, Ionela Voinescu wrote:
> > >> Hi Jerome,
> > >> 
> > >> On Thursday 15 Oct 2020 at 15:58:30 (+0200), Jerome Brunet wrote:
> > >> > 
> > >> > On Thu 15 Oct 2020 at 15:46, Ionela Voinescu <ionela.voinescu@arm.com> wrote:
> > >> > 
> > >> > > Hi guys,
> > >> > >
> > >> > > On Wednesday 23 Sep 2020 at 14:39:16 (+0200), Jerome Brunet wrote:
> > >> > >> If the txdone is done by polling, it is possible for msg_submit() to start
> > >> > >> the timer while txdone_hrtimer() callback is running. If the timer needs
> > >> > >> recheduling, it could already be enqueued by the time hrtimer_forward_now()
> > >> > >> is called, leading hrtimer to loudly complain.
> > >> > >> 
> > >> > >> WARNING: CPU: 3 PID: 74 at kernel/time/hrtimer.c:932 hrtimer_forward+0xc4/0x110
> > >> > >> CPU: 3 PID: 74 Comm: kworker/u8:1 Not tainted 5.9.0-rc2-00236-gd3520067d01c-dirty #5
> > >> > >> Hardware name: Libre Computer AML-S805X-AC (DT)
> > >> > >> Workqueue: events_freezable_power_ thermal_zone_device_check
> > >> > >> pstate: 20000085 (nzCv daIf -PAN -UAO BTYPE=--)
> > >> > >> pc : hrtimer_forward+0xc4/0x110
> > >> > >> lr : txdone_hrtimer+0xf8/0x118
> > >> > >> [...]
> > >> > >> 
> > >> > >> Canceling the timer before starting it ensure that the timer callback is
> > >> > >> not running when the timer is started, solving this race condition.
> > >> > >> 
> > >> > >> Fixes: 0cc67945ea59 ("mailbox: switch to hrtimer for tx_complete polling")
> > >> > >> Reported-by: Da Xue <da@libre.computer>
> > >> > >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > >> > >> ---
> > >> > >>  drivers/mailbox/mailbox.c | 8 ++++++--
> > >> > >>  1 file changed, 6 insertions(+), 2 deletions(-)
> > >> > >> 
> > >> > >> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> > >> > >> index 0b821a5b2db8..34f9ab01caef 100644
> > >> > >> --- a/drivers/mailbox/mailbox.c
> > >> > >> +++ b/drivers/mailbox/mailbox.c
> > >> > >> @@ -82,9 +82,13 @@ static void msg_submit(struct mbox_chan *chan)
> > >> > >>  exit:
> > >> > >>  	spin_unlock_irqrestore(&chan->lock, flags);
> > >> > >>  
> > >> > >> -	if (!err && (chan->txdone_method & TXDONE_BY_POLL))
> > >> > >> -		/* kick start the timer immediately to avoid delays */
> > >> > >> +	if (!err && (chan->txdone_method & TXDONE_BY_POLL)) {
> > >> > >> +		/* Disable the timer if already active ... */
> > >> > >> +		hrtimer_cancel(&chan->mbox->poll_hrt);
> > >> > >> +
> > >> > >> +		/* ... and kick start it immediately to avoid delays */
> > >> > >>  		hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_MODE_REL);
> > >> > >> +	}
> > >> > >>  }
> > >> > >>  
> > >> > >>  static void tx_tick(struct mbox_chan *chan, int r)
> > >> > >
> > >> > > I've tracked a regression back to this commit. Details to reproduce:
> > >> > 
> > >> > Hi Ionela,
> > >> > 
> > >> > I don't have access to your platform and I don't get what is going on
> > >> > from the log below.
> > >> > 
> > >> > Could you please give us a bit more details about what is going on ?
> > >> > 
> > >> 
> > >> I'm not familiar with the mailbox subsystem, so the best I can do right
> > >> now is to add Sudeep to Cc, in case this conflicts in some way with the
> > >> ARM MHU patches [1].
> > >>
> > >
> > > Not it can't be doorbell driver as we use SCPI(old firmware) with upstream
> > > MHU driver as is limiting the number of channels to be used.
> > >
> > >> In the meantime I'll get some traces and get more familiar with the
> > >> code.
> > >>
> > >
> > > I will try that too.
> > 
> > BTW, this issue was originally reported on amlogic platforms which also
> > use arm,mhu mailbox driver.
> > 
> 
> OK. Anyway just noticed that hrtimer_cancel uses  hrtimer_try_to_cancel
> and hrtimer_cancel_wait_running. The latter is just cpu_relax() if
> PREEMPT_RT=n, so you may still have issue if the hrtimer is still active
> or restarts in the meantime. 
>

Scratch that, I failed to see the loop in hrtimer_cancel earlier.

-- 
Regards,
Sudeep

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
