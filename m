Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7022CCA47F
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jun 2022 16:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k03qB/MOmYO1iQDH/JcTa3AM5rcU36ythEplL3GqwM4=; b=N72BbFO5V5HqBH
	JLfTS6DWe4GH5DvASWfHBSHD4wGnYGCU4eaHp+rMI13ApC1DiUt10kO0iqLvvFKcZO3VB6GIMcLLh
	qaM3q1IbgHevCYPu4cvVSlplTGnnurNV51h4c8grLZ0b38utaGrVLJb9QupsU8cAAHooL/JPu5+1C
	5fwKVDdg6Ssw6D0xxtfW0WvFV+lMVxfTP2Y6/1oHkRmwNJ6X3k3OPc4GsN1LaeFybqjaCexK9MERe
	7YXIOD/EuPTQ48LcVEQyrX2MhpaKIlvYnJrBEP34mRvUht6B6fe665dR6HvAc01qDoTD0OD+LzRDK
	YMx0QktmNzgTHcBxR0wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2FCQ-008KAP-FF; Fri, 17 Jun 2022 16:51:58 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2FCN-008K9D-Hx
	for linux-amlogic@lists.infradead.org; Fri, 17 Jun 2022 16:51:57 +0000
Date: Fri, 17 Jun 2022 18:51:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1655484710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UykvkKuHPgfnuKIJnIaYfKgo9S8iB+wmFcj7vk45wVs=;
	b=eUu/qClCX/d2AouxGZPJTmu48AdbHUOAEqK6i7LTOzrgE4GEiltOUP/aJutgp44nPnjM1S
	ulO0fZvQYiVcMfcod60L0fl3em63i+QghmCscjAvwGb0MsWcIiu7iqKCZEdO+OY50UIAWi
	Fzew3TXJ8JyJ31M5UjJ+UNJvMh+wufip+FNl1U45LGUmqJTGg/BwzaScUhjC14W2WpoYGb
	MWR63P+t6DeKQTXOdDHQPaH/tLPjlCbOP0/O0DhvtyiUkuQZUOA81nEFSDVBi44tlsUGpt
	q5eEmHXyFIG5Y6DNq8uYSnfp7/EMsOHcfSZWSQnIs/N65YiLViv4oc/1Ii/WQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1655484710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UykvkKuHPgfnuKIJnIaYfKgo9S8iB+wmFcj7vk45wVs=;
	b=+gB6pnNuCevctPh8aBUsQrzYo/gPjJ8DZnaghzrYDBDxO0I6SqrmLwluRFEY2z9zzM9Eox
	CDKIjQ9JrIzSaRBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Dmitry Vyukov <dvyukov@google.com>,
	John Ogness <john.ogness@linutronix.de>,
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
	Marco Elver <elver@google.com>, kasan-dev@googlegroups.com
Subject: Re: [PATCH printk v5 1/1] printk: extend console_lock for
 per-console locking
Message-ID: <YqyxJJ8Jrr4zEPmM@linutronix.de>
References: <87fslyv6y3.fsf@jogness.linutronix.de>
 <51dfc4a0-f6cf-092f-109f-a04eeb240655@samsung.com>
 <87k0b6blz2.fsf@jogness.linutronix.de>
 <32bba8f8-dec7-78aa-f2e5-f62928412eda@samsung.com>
 <87y1zkkrjy.fsf@jogness.linutronix.de>
 <CAMuHMdVmoj3Tqz65VmSuVL2no4+bGC=qdB8LWoB=vyASf9vS+g@mail.gmail.com>
 <87fske3wzw.fsf@jogness.linutronix.de>
 <YqHgdECTYFNJgdGc@zx2c4.com>
 <CACT4Y+ajfVUkqAjAin73ftqAz=HmLX=p=S=HRV1qe-8_y36J+A@mail.gmail.com>
 <YqHnH+Yc4TCOXa9X@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YqHnH+Yc4TCOXa9X@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_095155_775862_493D6F18 
X-CRM114-Status: GOOD (  18.28  )
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

On 2022-06-09 14:27:11 [+0200], Jason A. Donenfeld wrote:
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
> 
> > Btw, should this new CONFIG_PROVE_RAW_LOCK_NESTING be generally
> > enabled on testing systems? We don't have it enabled on syzbot.
> 
> Last time I spoke with RT people about this, the goal was eventually to
> *always* enable it when lock proving is enabled, but there are too many
> bugs and cases now to do that, so it's an opt-in. I might be
> misremembering, though, so CC'ing Sebastian in case he wants to chime
> in.

That is basically still the case. If CONFIG_PROVE_RAW_LOCK_NESTING yells
then there will be yelling on PREEMPT_RT, too. We would like to get
things fixed ;)

Without going through this thread, John is looking at printk and printk
triggers a few of those. That is one of reasons why this is not enabled
by default.

> Jason

Sebastian

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
