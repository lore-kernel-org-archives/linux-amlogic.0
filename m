Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6EAC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jun 2022 12:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WWQd6xFd+mRLc3RgLkRXL78SvGyzgpen3/P8zdy8Dug=; b=boyWizmePeZeel
	kt5iy/N387Og7x8qfT/eQjAPORYVakZbCQK9pXK/U8veDVHpUGUquPqM8SrqcPNterVXCf0pt3F5Z
	UDbRqaLR5nOZdGB+OI+t2+k4MTBN6o20ghaD1T9hUials299/rMr7uQ6gEksHPkCJf0LWvTi2SBx9
	77TAeEwCUHeKMjt7E+H1dosGpkE9hvoErP9Vk6eJUVtxemcDYJuXYFYEiQrYwB/4CNlgnBy0/xFzw
	gft4WFOY0/VK7H+D3Y/icwaZEcuOzSmdo9sLKxotP+Qn0s+8MIDxR6sJHicDquh/ceNTtaxj1a66e
	94R8SNO1F2hobec949/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHKl-001mZB-KP; Thu, 09 Jun 2022 12:32:19 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHKi-001mWn-8g
	for linux-amlogic@lists.infradead.org; Thu, 09 Jun 2022 12:32:17 +0000
Received: by mail-lf1-x12e.google.com with SMTP id a29so9242642lfk.2
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Jun 2022 05:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SfBdadjjVbuYsWcHjyT2JNkeKnRXZofpQUc3M0v3lw8=;
        b=ZuexHRJpNkArhkzlyVFzZzfvSGVG0EYbj1SnK7hExFfijK7WjsRYWBLE0IAgfsl2Zi
         MEyYD78r42eLMgaGkHPJR1S3gTnNwQnEllIN+QBILQnNTymZq4f19Yu/6jG5M503bWVv
         sTnn/1fbYfOfY6pb0CbXuakmf+f9jM1TKXottjCpAfvvenicMckun+zADDhluMOtEFEr
         Fltda09pvIbbAqK5WXQ/PojELjI4dNLYnujpwmEs+PosBQICQSiY48ZEGW61ag+09nDR
         naerd/Vk9Iwjla68zxr0uqMt7jTerwywgXFZ3UjNXRbXyEQGZgLfPS9674SbORQU4h6m
         PWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SfBdadjjVbuYsWcHjyT2JNkeKnRXZofpQUc3M0v3lw8=;
        b=1R2It0m8d47Xzx9oXYST17wSe+DLZl//tUgYguWPGcVyqfvNrvtKmIMWE7AndbDz+A
         dLo9d87gcr0Iqqy20JoVoklCaXbGDxGhaOoRs3MTZgKPHvZQg4FSFAEOyv5n3NOmieBO
         WIjrDX+lFjRce/jnzQK3LoHahQw0aHALna/vxMksQjRWXVWl0l0vZinMlOhtAj+PJeT/
         4HMT5NDFaEc14GZO2A7ZK+VvmxeUDxGGFyA4zZBGxENJqTr9H/Wkw7CqUEx6FLqPrrsf
         loPI4v5FeOAGp8NibSCgQojR4mCGBM+TTQUkUxDnPFeOH5bErdqUqLvqkRO4U+pZSQdG
         EF1Q==
X-Gm-Message-State: AOAM530E2i2B77fRmpFicakyhtf7XoAO8ZTJOAocAqE9jysarzpEIZiM
	GiK5fekeMnSlF62YkN//6lxmqbXTIUTw+70TFgHBVQ==
X-Google-Smtp-Source: ABdhPJzLWjIsu++QNIx3qDCOGVcwgjQAzeuOsueKw0KOpXNjxn2Gz9hA0HmKib9smkmGcaOLoJgCB0QQYNMhpqx7BYk=
X-Received: by 2002:a05:6512:1588:b0:477:a556:4ab2 with SMTP id
 bp8-20020a056512158800b00477a5564ab2mr24638097lfb.376.1654777931483; Thu, 09
 Jun 2022 05:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <b6c1a8ac-c691-a84d-d3a1-f99984d32f06@samsung.com>
 <87fslyv6y3.fsf@jogness.linutronix.de> <51dfc4a0-f6cf-092f-109f-a04eeb240655@samsung.com>
 <87k0b6blz2.fsf@jogness.linutronix.de> <32bba8f8-dec7-78aa-f2e5-f62928412eda@samsung.com>
 <87y1zkkrjy.fsf@jogness.linutronix.de> <CAMuHMdVmoj3Tqz65VmSuVL2no4+bGC=qdB8LWoB=vyASf9vS+g@mail.gmail.com>
 <87fske3wzw.fsf@jogness.linutronix.de> <YqHgdECTYFNJgdGc@zx2c4.com>
 <CACT4Y+ajfVUkqAjAin73ftqAz=HmLX=p=S=HRV1qe-8_y36J+A@mail.gmail.com> <YqHnH+Yc4TCOXa9X@zx2c4.com>
In-Reply-To: <YqHnH+Yc4TCOXa9X@zx2c4.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 9 Jun 2022 14:32:00 +0200
Message-ID: <CACT4Y+Zf8=DgaAYfFWL==vbYF13omtMUGaP=LzKEbsuVzrTe9w@mail.gmail.com>
Subject: Re: [PATCH printk v5 1/1] printk: extend console_lock for per-console locking
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: John Ogness <john.ogness@linutronix.de>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Petr Mladek <pmladek@suse.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, kasan-dev@googlegroups.com, 
	bigeasy@linutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_053216_379265_1BEBA1E2 
X-CRM114-Status: GOOD (  18.93  )
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

On Thu, 9 Jun 2022 at 14:27, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Dmitry,
>
> On Thu, Jun 09, 2022 at 02:18:19PM +0200, Dmitry Vyukov wrote:
> > > AFAIK, CONFIG_PROVE_RAW_LOCK_NESTING is useful for teasing out cases
> > > where RT's raw spinlocks will nest wrong with RT's sleeping spinlocks.
> > > But nobody who wants an RT kernel will be using KFENCE. So this seems
> > > like a non-issue? Maybe just add a `depends on !KFENCE` to
> > > PROVE_RAW_LOCK_NESTING?
> >
> > Don't know if there are other good solutions (of similar simplicity).
>
> Fortunately, I found one that solves things without needing to
> compromise on anything:
> https://lore.kernel.org/lkml/20220609121709.12939-1-Jason@zx2c4.com/

Cool! Thanks!

> > Btw, should this new CONFIG_PROVE_RAW_LOCK_NESTING be generally
> > enabled on testing systems? We don't have it enabled on syzbot.
>
> Last time I spoke with RT people about this, the goal was eventually to
> *always* enable it when lock proving is enabled, but there are too many
> bugs and cases now to do that, so it's an opt-in. I might be
> misremembering, though, so CC'ing Sebastian in case he wants to chime
> in.

OK, we will wait then.
Little point in doubling the number of reports for known issues.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
