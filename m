Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA9FC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Apr 2022 14:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GCrFoZVLFKvvSETE1NJEOeWrjYP/35+VY5MNYIVySBA=; b=VY6992jbr0GKYF
	iQh+CGnnuUuD93l/OkXJkIQuewZ+AVY3eo0M4umQ+koDSScCavezST4EoO2Aec/jm9AEAvwLu5Tfn
	2m6x1jdL1jkKXViZrgAC4nOz79lAqykK4iY5NxPZd46Hjui/ynva/Slw7vKoiKPt9Y2sM86+wFANF
	TmtkHrka8Sbe0NW3KLUfuAEHmyVM5LnxqlB+dV2JqQ79fhTDFQtUIRQN560dBwzfSuUE4xBOgtbDp
	LMsTOzBi91raRBex4n3oyh0hskBOj7crrI9KFpYk5zdIcTuAUhIenKKTQl9/oUJLp6svFBTnVJMnl
	Nstdjh7q4M2nLNle8BFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk5Xm-007YFh-Q7; Thu, 28 Apr 2022 14:54:58 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk5Xk-007YEb-A2
 for linux-amlogic@lists.infradead.org; Thu, 28 Apr 2022 14:54:57 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 26AC51F88B;
 Thu, 28 Apr 2022 14:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1651157693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Oui+HQWDmS1z2iw8Iqn3J1xquHUwKC8gitMw4oJxH4g=;
 b=bQNeM7h8q0WUlej4Jf2wj7R6YC8nlIOwlFGDsSxXyocm5+zlJszZyO+ov3XhD/O7Yj3Lbl
 MGCTQDDB6t8EBefFQsNbhgLuMcyExZz1xntLXDzzzpUx7fGHAI4tSgGTXofPB28Dvzd1IY
 Sd9SIM8HH2zP/p88mKC7H+EmeE6CXd0=
Received: from suse.cz (unknown [10.100.224.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 9D6CD2C141;
 Thu, 28 Apr 2022 14:54:52 +0000 (UTC)
Date: Thu, 28 Apr 2022 16:54:49 +0200
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
Message-ID: <YmqquUrDN2VWnR92@alley>
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
X-CRM114-CacheID: sfid-20220428_075456_532750_4D3C4E23 
X-CRM114-Status: GOOD (  16.15  )
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
> 3. It looks like the problem happens quite late in the boot process. I
> expect it is due to some userspace process that is running that is
> interacting with printk (either /dev/kmsg or /proc/kmsg) and is causing
> problems.

I did not find an real issue in the code handling /dev/kmsg,
/proc/kmsg, or syslog sycall API. There might be just few
small changes:

    1. There is an increased number of spurious wakeups because
       log_wait is shared between upstream readers and printk kthreads.
       And we newly wake up waiters from both vprintk_emit()
       and __console_unlock() code paths.

       It might affect especially the pooling APIs: kmsg_pool(),
       devkmsg_pool()). They might return 0 more often than before.


    2. 4th patch replaced wake_up_interruptible(&log_wait) with
       wake_up_interruptible_all(&log_wait). As a result, all
       readers are woken at the same time.

       It is perfectly fine because the log buffer is lockless.
       And all readers should be either independent or synchronized
       against each other.


Any of the above changes should not introduce new problems. But
they might make some old problem (race) more visible.

I spent quite some time reviewing the code and testing. But I neither
see any problem nor I am able to reproduce it. Some more clues
from Marek would be needed.

Best Regards,
Petr

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
