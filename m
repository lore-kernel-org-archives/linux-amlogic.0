Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BE7C43334
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jun 2022 12:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKHA1xfLYvWE1Elu4NkjQvOsV2TiQTaK3Z98z/cxlBw=; b=Zw/r/jf2ZkHRYG
	yGoVSiSZd1hp7+UY3gQgOs7vPlxnpMirlVNE6vbvGP7Jh0MsD4HLebjjnH/lJSJJRffvZsUxc3exa
	A2RrQFPAmHA59Z9OCf63JR44Rz1A0kHYtfdveDuyTM6Mbw3woZA9RNRrkox2CByaFJBoeSP0iBqVA
	9hO01HzkfXMkbnrmlmQ6JYWZSgkNKt5msKKpliYPm9FzlanBGOZkBXJwq2767+bOENvOaw6E2OBh2
	/3lcX7Rj+55FI5Lh43whIzoITpNUFwLo1cwHqw4gfr9DyHtPe5KB6wISeSOFOM/XP2mMhDdowwzrK
	4KN1DFI6/zQBY9aXW9oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHHA-001kwO-T9; Thu, 09 Jun 2022 12:28:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHFz-001kLb-19
	for linux-amlogic@lists.infradead.org; Thu, 09 Jun 2022 12:27:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6DF2560DF8;
	Thu,  9 Jun 2022 12:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A28C34114;
	Thu,  9 Jun 2022 12:27:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="cL/t578z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1654777638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jmAyfJLi9ZPxrr5XglUuWLKXwd2sQ5F4418QWy98e5Q=;
	b=cL/t578zwy2SyTTjrlTP22f5QIRFvmgvvl9HuxtD+7WAkfIJY5OTtDsziFj4ML1n+HfiW8
	W3wiYocFp64vZeE7bjSyNLOazgsL+zYQ+VlLYMb6/H6u2vajPcU9DTyCO1x8eLin2OR6q9
	T6JGHso3VsxHLGkcRD/jFuzU5W2+hFg=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 969d3aeb (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Thu, 9 Jun 2022 12:27:18 +0000 (UTC)
Date: Thu, 9 Jun 2022 14:27:11 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
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
	Marco Elver <elver@google.com>, kasan-dev@googlegroups.com,
	bigeasy@linutronix.de
Subject: Re: [PATCH printk v5 1/1] printk: extend console_lock for
 per-console locking
Message-ID: <YqHnH+Yc4TCOXa9X@zx2c4.com>
References: <b6c1a8ac-c691-a84d-d3a1-f99984d32f06@samsung.com>
 <87fslyv6y3.fsf@jogness.linutronix.de>
 <51dfc4a0-f6cf-092f-109f-a04eeb240655@samsung.com>
 <87k0b6blz2.fsf@jogness.linutronix.de>
 <32bba8f8-dec7-78aa-f2e5-f62928412eda@samsung.com>
 <87y1zkkrjy.fsf@jogness.linutronix.de>
 <CAMuHMdVmoj3Tqz65VmSuVL2no4+bGC=qdB8LWoB=vyASf9vS+g@mail.gmail.com>
 <87fske3wzw.fsf@jogness.linutronix.de>
 <YqHgdECTYFNJgdGc@zx2c4.com>
 <CACT4Y+ajfVUkqAjAin73ftqAz=HmLX=p=S=HRV1qe-8_y36J+A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACT4Y+ajfVUkqAjAin73ftqAz=HmLX=p=S=HRV1qe-8_y36J+A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_052723_138988_6506651E 
X-CRM114-Status: GOOD (  17.33  )
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

Hi Dmitry,

On Thu, Jun 09, 2022 at 02:18:19PM +0200, Dmitry Vyukov wrote:
> > AFAIK, CONFIG_PROVE_RAW_LOCK_NESTING is useful for teasing out cases
> > where RT's raw spinlocks will nest wrong with RT's sleeping spinlocks.
> > But nobody who wants an RT kernel will be using KFENCE. So this seems
> > like a non-issue? Maybe just add a `depends on !KFENCE` to
> > PROVE_RAW_LOCK_NESTING?
> 
> Don't know if there are other good solutions (of similar simplicity).

Fortunately, I found one that solves things without needing to
compromise on anything:
https://lore.kernel.org/lkml/20220609121709.12939-1-Jason@zx2c4.com/

> Btw, should this new CONFIG_PROVE_RAW_LOCK_NESTING be generally
> enabled on testing systems? We don't have it enabled on syzbot.

Last time I spoke with RT people about this, the goal was eventually to
*always* enable it when lock proving is enabled, but there are too many
bugs and cases now to do that, so it's an opt-in. I might be
misremembering, though, so CC'ing Sebastian in case he wants to chime
in.

Jason

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
