Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0D3C43334
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jun 2022 12:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSRzPRrhsxAqhv1C4bFB0WR8KeQAooqgNpqrtb8xC6I=; b=c2PAT3AqQqMx8h
	yfnXesv0EaEanvAGCoNY/vd0lYnMgVhvFzwt+f/A1zOw7HFh7BtseVF1NXsDPrF/kbUwG8gNNWf3i
	rPLkQuSZutaGn4D2n1lcVsFKaPg29FMbc5EMbaklDYjNDuWR5PYLnpb0lW6yR0aOy5e0QWbAY9cdD
	Vb0isNnxdk7XXbIgjGNWyOyYtdPUdfCj8W08gpw0FNjVt8LYZDNthH/B7M3+pPxdkUkkYE5nJ3bo2
	6T+4Pl8jNAgI3ONzWhNjlZ++rghQcfwB98Ui/rlmBia3+eG/Yu+FGpwkX9Kf2rdwGz2OVR6Sis0Bf
	OIoaJ9burW+qcudOudfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHE7-001j7Q-BN; Thu, 09 Jun 2022 12:25:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzH7p-001fqa-Hd
	for linux-amlogic@lists.infradead.org; Thu, 09 Jun 2022 12:18:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F136EB82D3F;
	Thu,  9 Jun 2022 12:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74CBFC34114;
	Thu,  9 Jun 2022 12:18:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="nPButqce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1654777131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QcC0C5Avs6rzR+CXyutM5LVS60s9Gr59fufuQSrdYzU=;
	b=nPButqceNog3QoAuGe+Xo1aWY+jmFC0oKkdxJA/HlfNn5gyJSkY048+8YUEgC5k/QiUqka
	snl7ctXLVINTE8vFcoeFAQb+YNAb3GmPZvMNxB0d88MsS4gqQYLDYtvFL343DDZUwFyRY9
	nzxx5xl+dUBR8Me2Q1rFhIsG3eVBFbQ=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id de5c4ac3 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Thu, 9 Jun 2022 12:18:51 +0000 (UTC)
Date: Thu, 9 Jun 2022 14:18:44 +0200
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
Message-ID: <YqHlJDh1MSYJWBnu@zx2c4.com>
References: <Ymjy3rHRenba7r7R@alley>
 <b6c1a8ac-c691-a84d-d3a1-f99984d32f06@samsung.com>
 <87fslyv6y3.fsf@jogness.linutronix.de>
 <51dfc4a0-f6cf-092f-109f-a04eeb240655@samsung.com>
 <87k0b6blz2.fsf@jogness.linutronix.de>
 <32bba8f8-dec7-78aa-f2e5-f62928412eda@samsung.com>
 <87y1zkkrjy.fsf@jogness.linutronix.de>
 <CAMuHMdVmoj3Tqz65VmSuVL2no4+bGC=qdB8LWoB=vyASf9vS+g@mail.gmail.com>
 <87fske3wzw.fsf@jogness.linutronix.de>
 <YqHgdECTYFNJgdGc@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YqHgdECTYFNJgdGc@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_051857_783160_59D87F7F 
X-CRM114-Status: GOOD (  15.33  )
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

Hey again,

On Thu, Jun 09, 2022 at 01:58:44PM +0200, Jason A. Donenfeld wrote:
> Hi John,
> 
> On Thu, Jun 09, 2022 at 01:25:15PM +0206, John Ogness wrote:
> > (Added RANDOM NUMBER DRIVER and KFENCE people.)
> 
> Thanks.
> 
> > I am guessing you have CONFIG_PROVE_RAW_LOCK_NESTING enabled?
> > 
> > We are seeing a spinlock (base_crng.lock) taken while holding a
> > raw_spinlock (meta->lock).
> > 
> > kfence_guarded_alloc()
> >   raw_spin_trylock_irqsave(&meta->lock, flags)
> >     prandom_u32_max()
> >       prandom_u32()
> >         get_random_u32()
> >           get_random_bytes()
> >             _get_random_bytes()
> >               crng_make_state()
> >                 spin_lock_irqsave(&base_crng.lock, flags);
> > 
> > I expect it is allowed to create kthreads via kthread_run() in
> > early_initcalls.
> 
> AFAIK, CONFIG_PROVE_RAW_LOCK_NESTING is useful for teasing out cases
> where RT's raw spinlocks will nest wrong with RT's sleeping spinlocks.
> But nobody who wants an RT kernel will be using KFENCE. So this seems
> like a non-issue? Maybe just add a `depends on !KFENCE` to
> PROVE_RAW_LOCK_NESTING?

On second thought, the fix is trivial:
https://lore.kernel.org/lkml/20220609121709.12939-1-Jason@zx2c4.com/

Jason

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
