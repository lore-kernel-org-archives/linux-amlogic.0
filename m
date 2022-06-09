Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB2BC43334
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jun 2022 12:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GsCVyqWVK/6utv/E9a5vrSWXqbU7kU3JAgXRcTq/9Do=; b=0PmPvUB4dGLNRA
	rIhmTj9GIpJ2R4bqlijaDqYpTYrTf6DlcyBkEfSffKJ6hVACo2YmxtlNXxhJcF5I0rxztDuYjCvHt
	r1pu+UxPdp+OaWgCnxar4X8UCEl0WpHK/6Jx5aKKweQgJaSW/Lj8TcyNDi/R5+0VnXoxx6TxuanWe
	5kgu7oTJyzJQ4JM3VyNU4NEKT7S1zpR9qQm2X56/RfR1q9/iz2BMSvZP6neD3dz9WgkEoCk7ukKPX
	mibbNADK2sMkxuadu6kQZudi+bScJMN0/EMkQwHedVVkYiQnyp5g/1WpZx8ueLli3rT05OzIlldyc
	hPCadZrAmV6wRX0RKK8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzH35-001dRM-JA; Thu, 09 Jun 2022 12:14:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGoc-001XM7-2u
	for linux-amlogic@lists.infradead.org; Thu, 09 Jun 2022 11:59:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F7F960C92;
	Thu,  9 Jun 2022 11:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56CF2C34114;
	Thu,  9 Jun 2022 11:59:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="qAkHwz2j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1654775941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RJORkAj3NYvpFmB7Va3TCC7yJxwVqGg4INvFsRsC1Dc=;
	b=qAkHwz2jr4oCqOOVRj78DuuxoJkmmUX4fPRZKXfsz4meQuqHLz4LN0u/rjJFW5FdSmeY2Y
	CDTcMkoCYHq1luCGXvyHiVS5q3V+ByoO9LplbfpB90MaDetyPd5tE6XSQfZQB8ydr2Vt6c
	U7H+8O/1A8YthKJqeNeHEigJDa+s9/w=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5cfe460d (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Thu, 9 Jun 2022 11:59:00 +0000 (UTC)
Date: Thu, 9 Jun 2022 13:58:44 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, kasan-dev@googlegroups.com
Subject: Re: [PATCH printk v5 1/1] printk: extend console_lock for
 per-console locking
Message-ID: <YqHgdECTYFNJgdGc@zx2c4.com>
References: <2a82eae7-a256-f70c-fd82-4e510750906e@samsung.com>
 <Ymjy3rHRenba7r7R@alley>
 <b6c1a8ac-c691-a84d-d3a1-f99984d32f06@samsung.com>
 <87fslyv6y3.fsf@jogness.linutronix.de>
 <51dfc4a0-f6cf-092f-109f-a04eeb240655@samsung.com>
 <87k0b6blz2.fsf@jogness.linutronix.de>
 <32bba8f8-dec7-78aa-f2e5-f62928412eda@samsung.com>
 <87y1zkkrjy.fsf@jogness.linutronix.de>
 <CAMuHMdVmoj3Tqz65VmSuVL2no4+bGC=qdB8LWoB=vyASf9vS+g@mail.gmail.com>
 <87fske3wzw.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87fske3wzw.fsf@jogness.linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_045906_416143_17AF6E18 
X-CRM114-Status: GOOD (  12.26  )
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

Hi John,

On Thu, Jun 09, 2022 at 01:25:15PM +0206, John Ogness wrote:
> (Added RANDOM NUMBER DRIVER and KFENCE people.)

Thanks.

> I am guessing you have CONFIG_PROVE_RAW_LOCK_NESTING enabled?
> 
> We are seeing a spinlock (base_crng.lock) taken while holding a
> raw_spinlock (meta->lock).
> 
> kfence_guarded_alloc()
>   raw_spin_trylock_irqsave(&meta->lock, flags)
>     prandom_u32_max()
>       prandom_u32()
>         get_random_u32()
>           get_random_bytes()
>             _get_random_bytes()
>               crng_make_state()
>                 spin_lock_irqsave(&base_crng.lock, flags);
> 
> I expect it is allowed to create kthreads via kthread_run() in
> early_initcalls.

AFAIK, CONFIG_PROVE_RAW_LOCK_NESTING is useful for teasing out cases
where RT's raw spinlocks will nest wrong with RT's sleeping spinlocks.
But nobody who wants an RT kernel will be using KFENCE. So this seems
like a non-issue? Maybe just add a `depends on !KFENCE` to
PROVE_RAW_LOCK_NESTING?

Jason

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
