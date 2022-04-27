Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4087DC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Apr 2022 17:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TIsfPbjTcsG27UKtvFqix712wEhA/al2zAUfzqCDf04=; b=mE8vkACriQllao
	xd7PxbczzbAvt4jYvsjAuIUsjlhPsUtfD2ghDeFDEcrdO3ECeA/TWrKj8W4oHG1vLfY88IhqDjrZ6
	PReaApL2IMD5HCob12jnag4EjP/9Y51Nm+lmBDtR1q3wyhLzUQJwVK6zjC12FhjDymZd0+NLP3EcE
	xk++CvbfIatVBSHq2JrdNl/BJAbiAz2+5r87C/b+v7+fzrMMz0PS7NLvG1SR5PfFy3+ho89ejQODW
	4rB72S44KHzd9ICfHeZU0aqI1CsC74XcVZUrhu6qL+kc8TmwPN5izZN9kv2YIHZ9Gppwns5FETc58
	5JHO2N6bUjkwmjJpk0eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njlKE-002bxL-IP; Wed, 27 Apr 2022 17:19:38 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njkq0-002Phz-6O
 for linux-amlogic@lists.infradead.org; Wed, 27 Apr 2022 16:48:26 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 925FF21107;
 Wed, 27 Apr 2022 16:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1651078098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k4uwkTTpLjGf9jLW7bBMGO3SMfacleIQxRESSfxLAow=;
 b=jtmJxFlrnPeIVUqUn3cdH/SbeO7NLKovXD2iVIO7YWrFJrYPJdaiDDRyS+ZFhJyzyT+GPI
 zfsmyPOSSgnSJk0r3mqsYyyl81+8atEe8s7EBZW55Q/E1HjN6pBf7r+HYD6JBWSRZQ77GQ
 ysikTkdTv11Q1KGip4G6tVOVROMI00s=
Received: from suse.cz (unknown [10.100.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id E4B662C145;
 Wed, 27 Apr 2022 16:48:17 +0000 (UTC)
Date: Wed, 27 Apr 2022 18:48:15 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH printk v5 1/1] printk: extend console_lock for
 per-console locking
Message-ID: <Ymlzz3146gHYT5HU@alley>
References: <20220421212250.565456-1-john.ogness@linutronix.de>
 <20220421212250.565456-15-john.ogness@linutronix.de>
 <878rrs6ft7.fsf@jogness.linutronix.de> <Ymfgis0EAw0Oxoa5@alley>
 <Ymfwk+X0CHq6ex3s@alley>
 <CGME20220427070833eucas1p27a32ce7c41c0da26f05bd52155f0031c@eucas1p2.samsung.com>
 <2a82eae7-a256-f70c-fd82-4e510750906e@samsung.com>
 <Ymjy3rHRenba7r7R@alley>
 <b6c1a8ac-c691-a84d-d3a1-f99984d32f06@samsung.com>
 <87fslyv6y3.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87fslyv6y3.fsf@jogness.linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_094824_410647_53F22ED6 
X-CRM114-Status: GOOD (  28.08  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed 2022-04-27 18:21:16, John Ogness wrote:
> Hi Marek,
> 
> On 2022-04-27, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > Here is the full serial console log:
> >
> > https://pastebin.com/E5CDH88L
> 
> Here are a few ideas from me:
> 
> 1. For next-20220427 the printk-threaded series was slightly changed. I
> do not expect it to work any different, but I would prefer we are
> debugging the current version. If possible, could you move to
> next-20220427?
> 
> 2. I noticed you boot with the kernel boot arguments "earlycon" and
> "no_console_suspend". Could you try booting without this? I expect this
> will make no difference.
> 
> 3. It looks like the problem happens quite late in the boot process. I
> expect it is due to some userspace process that is running that is
> interacting with printk (either /dev/kmsg or /proc/kmsg) and is causing
> problems. If you boot with init=/bin/sh then I expect the system is
> running fine. (You don't have much of a system running, but it should
> not hang.) We need to isolate which userspace process is triggering the
> issue.

Interesting idea.


> 4. Have you tried issuing magic sysrq commands on the serial line? (For
> example, sending a break signal and then the letter 't' or sending a
> break signal and then the letter 'c'?) That might trigger various dumps
> so that we can see the system state.

I see that sshd is started. If you are able to connect the system
with the frozen login via ssh then it might be easier to trigger
sysrq via procfs, for example:

  #> echo t >/proc/sysrq-trigger

"sysrq t" should print state of all processes. It might show what process
is hanging and where.


> 5. You are not running a VT console, so the graphics driver should not
> be affecting the printk subsystem at all. I expect your autologin is
> also starting various services and programs. If you disable the
> automatic login and instead manually login (perhaps as another user) can
> you manually start those services one at a time to see at what point the
> system hangs?

Yeah, I am not able to reproduce it and some more clues would help.

Best Regards,
Petr

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
