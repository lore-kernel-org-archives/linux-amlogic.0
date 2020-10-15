Return-Path: <SRS0=WFBQ=DW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3C3C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Oct 2020 14:29:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D77322255
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Oct 2020 14:29:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NSxYKgnd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D77322255
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rc02ORQQp6AQtH3Ifp/gIOZ1zRTS6q31m+XQgSKAAtk=; b=NSxYKgnddSy6JeX3gRa5shTw+
	Xt0gThaebW/wXfk66C/FC6UABiSfuKOXsu6MRBTki5RnhdVOgXKiQcaMM30+rPSjAtK6U04TxYgE6
	ruPMBvwCzAQt+zKkZJt9NxbaPbCkz9Xtv6PpNpZP+10pQreEIRqx9XyDG4LK+gxGoG0yQJwLTZB5h
	ICGRkARarvpHz/z9hWXSLST4JXMA3pbGOx7/z9COaNWq75YrRNehY9hyqMWg1gfg7LBfN49EQtVNV
	cxpGzq8CDou18IVWxxflVRhn1J1UloFJj/Kkm79HTwmkP74e14oj7bKhBs9ST+0E1VR+I9UnI2oQj
	ZhgtlYWIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kT4GE-0004HU-NB; Thu, 15 Oct 2020 14:29:42 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kT4GA-0004GS-RZ
 for linux-amlogic@lists.infradead.org; Thu, 15 Oct 2020 14:29:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 220AD13D5;
 Thu, 15 Oct 2020 07:29:37 -0700 (PDT)
Received: from localhost (e108754-lin.cambridge.arm.com [10.1.199.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7A403F719;
 Thu, 15 Oct 2020 07:29:36 -0700 (PDT)
Date: Thu, 15 Oct 2020 15:29:35 +0100
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] mailbox: cancel timer before starting it
Message-ID: <20201015142935.GA12516@arm.com>
References: <20200923123916.1115962-1-jbrunet@baylibre.com>
 <20201015134628.GA11989@arm.com>
 <1jlfg7k2ux.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jlfg7k2ux.fsf@starbuckisacylon.baylibre.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_102939_092218_11933A01 
X-CRM114-Status: GOOD (  33.86  )
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
 linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
 linux-amlogic@lists.infradead.org, Da Xue <da@libre.computer>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Thursday 15 Oct 2020 at 15:58:30 (+0200), Jerome Brunet wrote:
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
> >>  	spin_unlock_irqrestore(&chan->lock, flags);
> >>  
> >> -	if (!err && (chan->txdone_method & TXDONE_BY_POLL))
> >> -		/* kick start the timer immediately to avoid delays */
> >> +	if (!err && (chan->txdone_method & TXDONE_BY_POLL)) {
> >> +		/* Disable the timer if already active ... */
> >> +		hrtimer_cancel(&chan->mbox->poll_hrt);
> >> +
> >> +		/* ... and kick start it immediately to avoid delays */
> >>  		hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_MODE_REL);
> >> +	}
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

I'm not familiar with the mailbox subsystem, so the best I can do right
now is to add Sudeep to Cc, in case this conflicts in some way with the
ARM MHU patches [1].

In the meantime I'll get some traces and get more familiar with the
code.

[1]
https://lore.kernel.org/linux-arm-kernel/20201009113129.uqw5zrqztjgw6vga@bogus/

Hope it helps,
Ionela.

> All this patch does is add hrtimer_cancel().
> * It is needed if the timer had already been started, which is
>   appropriate AFAIU
> * It is a NO-OP is the timer is not active.
> 
> >
> >
> >  - HEAD: (linux-next)
> >    * 62c04453381e  Jerome Brunet   3 weeks ago mailbox: cancel timer before starting it
> >
> >  - Platform: arm64 Juno R0 and Juno R2 [1]
> >
> >  - Partial log:
> > 	[    0.000000] Booting Linux on physical CPU 0x0000000100 [0x410fd030]
> > 	[    0.000000] Linux version 5.9.0-rc8-01722-g62c04453381e () (aarch64-none-linux-gnu-gcc (GNU Toolchain for the A-profile Architecture 9.2-2019.12 (arm-9.10)) 9.2.1 20191025, GNU ld (GNU Toolchain for the A-profile Architecture 9.2-2019.12 (arm-9.10)) 2.33.1.20191209) #175 SMP PREEMPT Thu Oct 15 14:17:41 BST 2020
> > 	[    0.000000] Machine model: ARM Juno development board (r0)
> > 	[..]
> > 	[    1.714340] mhu 2b1f0000.mhu: ARM MHU Mailbox registered
> > 	[    1.722768] NET: Registered protocol family 17
> > 	[    1.727364] 9pnet: Installing 9P2000 support
> > 	[    1.731689] Key type dns_resolver registered
> > 	[    1.735474] usb 1-1: new high-speed USB device number 2 using ehci-platform
> > 	[    1.736407] registered taskstats version 1
> > 	[    1.747061] Loading compiled-in X.509 certificates
> > 	[    1.755885] scpi_protocol scpi: SCP Protocol 1.2 Firmware 1.21.0 version
> > 	[    1.770484] cpu cpu0: EM: created perf domain
> > 	[    1.778505] cpu cpu1: EM: created perf domain
> > 	[    1.807449] scpi_clocks scpi:clocks: failed to register clock 'pxlclk'
> > 	[    1.897593] hub 1-1:1.0: USB hub found
> > 	[    1.901656] hub 1-1:1.0: 4 ports detected
> > 	[    2.559453] atkbd serio0: keyboard reset failed on 1c060000.kmi
> > 	[   22.787431] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> > 	[   22.793536] rcu:     1-...0: (1 ticks this GP) idle=222/1/0x4000000000000002 softirq=63/64 fqs=2626
> > 	[   22.802421]  (detected by 2, t=5255 jiffies, g=-991, q=9)
> > 	[   22.807823] Task dump for CPU 1:
> > 	[   22.811049] task:swapper/1       state:R  running task     stack:    0 pid:    0 ppid:     1 flags:0x0000002a
> > 	[   22.820980] Call trace:
> > 	[   22.823429]  __switch_to+0x138/0x198
> > 	[   23.583444] rcu: INFO: rcu_preempt detected expedited stalls on CPUs/tasks: { 1-... } 5443 jiffies s: 49 root: 0x2/.
> > 	[   23.593995] rcu: blocking rcu_node structures:
> > 	[   23.598449] Task dump for CPU 1:
> > 	[   23.601680] task:swapper/1       state:R  running task     stack:    0 pid:    0 ppid:     1 flags:0x0000002a
> > 	[   23.611619] Call trace:
> > 	[   23.614064]  __switch_to+0x138/0x198
> > 	[   85.807430] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> > 	[   85.813534] rcu:     1-...0: (1 ticks this GP) idle=222/1/0x4000000000000002 softirq=63/64 fqs=10502
> > 	[   85.822506]  (detected by 2, t=21009 jiffies, g=-991, q=9)
> > 	[   85.827994] Task dump for CPU 1:
> > 	[   85.831220] task:swapper/1       state:R  running task     stack:    0 pid:    0 ppid:     1 flags:0x0000002a
> > 	[   85.841150] Call trace:
> > 	[   85.843596]  __switch_to+0x138/0x198
> > 	[   87.071446] rcu: INFO: rcu_preempt detected expedited stalls on CPUs/tasks: { 1-... } 21315 jiffies s: 49 root: 0x2/.
> > 	[   87.082088] rcu: blocking rcu_node structures:
> > 	[   87.086540] Task dump for CPU 1:
> > 	[   87.089773] task:swapper/1       state:R  running task     stack:    0 pid:    0 ppid:     1 flags:0x0000002a
> > 	[   87.099708] Call trace:
> > 	[   87.102155]  __switch_to+0x138/0x198
> > 	[  148.827442] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> > 	[  148.833565] rcu:     1-...0: (1 ticks this GP) idle=222/1/0x4000000000000002 softirq=63/64 fqs=18377
> > 	[  148.842543]  (detected by 4, t=36762 jiffies, g=-991, q=9)
> > 	[  148.848037] Task dump for CPU 1:
> > 	[  148.851268] task:swapper/1       state:R  running task     stack:    0 pid:    0 ppid:     1 flags:0x0000002a
> > 	[  148.861207] Call trace:
> > 	[  148.863663]  __switch_to+0x138/0x198
> > 	[  150.559443] rcu: INFO: rcu_preempt detected expedited stalls on CPUs/tasks: { 1-... } 37187 jiffies s: 49 root: 0x2/.
> > 	[  150.570082] rcu: blocking rcu_node structures:
> > 	[  150.574535] Task dump for CPU 1:
> > 	[  150.577767] task:swapper/1       state:R  running task     stack:    0 pid:    0 ppid:     1 flags:0x0000002a
> > 	[  150.587705] Call trace:
> > 	[  150.590151]  __switch_to+0x138/0x198
> >
> >  - Commit working as expected:
> >    * 558e4c36ec9f  Krzysztof Kozlowski     7 weeks ago     maiblox: mediatek: Fix handling of platform_get_irq() error
> >
> >
> > [1] https://developer.arm.com/tools-and-software/development-boards/juno-development-board
> >
> > Thank you,
> > Ionela.
> >
> >> -- 
> >> 2.25.4
> >> 
> >> 
> >> _______________________________________________
> >> linux-amlogic mailing list
> >> linux-amlogic@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
