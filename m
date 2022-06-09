Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FF9C43334
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jun 2022 12:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ixDn6VY1uuslyWgHHMhnFpxK5kG+24zdwDlJZxj8McA=; b=BVaIObwGhP9JmS
	fuGwijZSEWaIASBhgTAUXnbuVdyrp3PvViXuEIThT+Uj0+/lt2H3Om6ks+aF1txXrMO4PL/6AiFr6
	xV5EP3DUDL9Bmp8ca/F2QAr1gf5m6KbQT7izHSXXtOe1pQGds3JBo2wayMplavpB1exPv+GPKMGTX
	H8uPkpU9yFqZqO4t6dZVll3cl65GNh7GIjulMR0EGoSWI+LoKQ1nzXNd8TfP9XeSPfBCHrq7jmIrY
	/v5NtIyCJdOhcyWhDbR1WE4VjM9kZlpsHJx9dOIpFf+0yCjI8wmNemgqZz001unuW+qTeCrHgJQCX
	3Vc/kcHrGkHI2ZNImZNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHE1-001j43-OX; Thu, 09 Jun 2022 12:25:21 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzH7S-001fdt-DH
	for linux-amlogic@lists.infradead.org; Thu, 09 Jun 2022 12:18:35 +0000
Received: by mail-lf1-x134.google.com with SMTP id h23so37699901lfe.4
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Jun 2022 05:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qCB93MU2lyB4bbkAlS32u/raZUY6pI3+1JJtxGQYwOs=;
        b=SnGVLIFVmkWS/5O3WR5Yn2W2Ds1NFqEfS3sI+ejy5eoIAJbLfPG165wJGZZKyDgJX6
         IgbU7A4xDIoB4/5BJPf3t9jq3L2YzNf5tEl48IUCjpABmyCvmqoF6ZvT4hx8E3sNDw27
         gdOttApmEh9PCcTdXgKIET8ItTeCRFIXikV9nCjm+xRC415Jh6PGndXoZGJmxiTADG0s
         +iq25xjR3o1sMUNjuHcZjsEe+P+bGz8WqiC2RDA/GZ6/ddEoDBVWiczPATaRuUyQHC5K
         vocV4QEFzvN97BYgCXdHQ7nLfENH2uTjFwOpCdClRH5hQ53JLHFCWzs6ZrDPecvXlYOY
         n54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qCB93MU2lyB4bbkAlS32u/raZUY6pI3+1JJtxGQYwOs=;
        b=ddVaI6XDDu99hlHKiTL4ML2SlzgFIam5trlnz0Bg3IWNtfspyu4IdaqSBZv7IgvbaX
         ZDcD8bsbeL+Fyh2cwaJgv7f/7bd/Us1MBthlOi+wJyFrunv5pROxgYAX4UF3jG1o5TMz
         1av8yOZ02TqVvqmbav3o/lL5K3E67vVPuGVZKSwn8ygTzpX+7lJfB43v94WPYrobs7dM
         YoZx1NxnfZU8KA2h7fUcHMv+6ZHytDmZ2qTwX2qYCFEW5pwcTvVvgo++kBfDFajTJbjv
         HwdeqbKBlciNqVY6vr/na2DS6u5wB9X1ksTQ2S07sd+P6f5O5qvzVMyvTlNntRjaWvCh
         Peag==
X-Gm-Message-State: AOAM530rlfcM7BN7GUdcTREMhDjCOjbCCycn+MRvQ2gW61m41VDaldEV
	er5daodrfwpBl1I4kyR4CqB/L01nlEQbRjU0VZtCtQ==
X-Google-Smtp-Source: ABdhPJy/2ggc9B0vGeMRo0sX4stf8bv7Rwug9333U8wn2aBgx+asd6E1GNcEibqrTYwRXm68Iqlt0BoAgM0kft2UWtM=
X-Received: by 2002:a05:6512:3f13:b0:464:f55f:7806 with SMTP id
 y19-20020a0565123f1300b00464f55f7806mr25244406lfa.598.1654777110811; Thu, 09
 Jun 2022 05:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <2a82eae7-a256-f70c-fd82-4e510750906e@samsung.com>
 <Ymjy3rHRenba7r7R@alley> <b6c1a8ac-c691-a84d-d3a1-f99984d32f06@samsung.com>
 <87fslyv6y3.fsf@jogness.linutronix.de> <51dfc4a0-f6cf-092f-109f-a04eeb240655@samsung.com>
 <87k0b6blz2.fsf@jogness.linutronix.de> <32bba8f8-dec7-78aa-f2e5-f62928412eda@samsung.com>
 <87y1zkkrjy.fsf@jogness.linutronix.de> <CAMuHMdVmoj3Tqz65VmSuVL2no4+bGC=qdB8LWoB=vyASf9vS+g@mail.gmail.com>
 <87fske3wzw.fsf@jogness.linutronix.de> <YqHgdECTYFNJgdGc@zx2c4.com>
In-Reply-To: <YqHgdECTYFNJgdGc@zx2c4.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 9 Jun 2022 14:18:19 +0200
Message-ID: <CACT4Y+ajfVUkqAjAin73ftqAz=HmLX=p=S=HRV1qe-8_y36J+A@mail.gmail.com>
Subject: Re: [PATCH printk v5 1/1] printk: extend console_lock for per-console locking
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: John Ogness <john.ogness@linutronix.de>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Petr Mladek <pmladek@suse.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, kasan-dev@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_051834_478239_555B9FA1 
X-CRM114-Status: GOOD (  15.29  )
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

On Thu, 9 Jun 2022 at 13:59, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
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

Don't know if there are other good solutions (of similar simplicity).
But fwiw this is not about the target production environment. Real
production uses of RT kernels will probably not enable LOCKDEP,
PROVE_RAW_LOCK_NESTING and other debugging configs.
This is about detecting as many bugs as possible in testing
environments. And testing environments can well have both LOCKDEP and
KFENCE enabled. Any such limitation will require doubling the number
of tested configurations.

Btw, should this new CONFIG_PROVE_RAW_LOCK_NESTING be generally
enabled on testing systems? We don't have it enabled on syzbot.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
