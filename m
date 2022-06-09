Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD9CC43334
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jun 2022 11:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n47befV+5aOLuHSGSCeKrie5Uiul+IXJ94zritEJtIA=; b=OkFPqeLYUgamlo
	O/cShTFOfooO/AVKN8xEARNsOV6vfUB+jmfW3SVqiZcx2AR3DG4FUB6M0/lRBoW/xhjz7r2bik1Ww
	oWLTGi4FGxGus9bC7TxOqnzuzLuvBcRUFB2coNMYwU+GJ+zQFOfVrI27WmOocfR1pA/R/wWTNN+jU
	xqxc1rK12i/FSDB9IIjweeajwuKjsxxZY/+WsUw6Olh5ecP5399oIqobLtRcKTOEtSsqcDz5VTJ7/
	FoEckRKU0Ad3gDyLqrXAHDUgRrPv6HKB8WgLOrtJCazVW1nRzwu1BDIfCWCINFyioPTZyukKjNwAl
	kh9LdY6MUrj/qlFBNOyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGCE-001F3R-E9; Thu, 09 Jun 2022 11:19:26 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGCA-001Exb-Sx
	for linux-amlogic@lists.infradead.org; Thu, 09 Jun 2022 11:19:24 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1654773556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1WfcyJ5/Z+Ptknrmt9EKb2lYt88mTxvWrPcDw1CBGnQ=;
	b=JnUH5R2kmNT60oLX6YGZ7fFh2oyH4muKjrWKPkLleJhv0c9c3imtVAyWZ5CGshMdbpcvSK
	qshUKVrIvAosjByUWaGgJ8yGXbhA7JQT+HG6IJmSVRPm6x4owodJS1VDP9l0TCHAGYk3yK
	Bp55yd6cyrqcsYlzakoe6cDA3t15+4151JyLf+caKhQxbdmrE0sRoKY72B5b7lT8LPFmo8
	bnoO94cfBPsQI9Up/C/wO9+D30c6GxdSiH6B8gBnpKPNarnDoBfh3OvNpkAnaJUUXMs2lM
	Y27jWiFmcp6aSaMZb5NM+ERN4Quy2HBOvbh/8mhJLTJooT9n5KPZMGrq8jsaZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1654773556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1WfcyJ5/Z+Ptknrmt9EKb2lYt88mTxvWrPcDw1CBGnQ=;
	b=N8p5zbYzCHfPItKgtIV/lJfoNNSjpu7xVICfMkMRp+PylHOVGu/4v/8HLeXruN360n3X+S
	rCqEJIsmj4yLveAw==
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "Theodore Ts'o" <tytso@mit.edu>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        kasan-dev@googlegroups.com
Subject: Re: [PATCH printk v5 1/1] printk: extend console_lock for
 per-console locking
In-Reply-To: <CAMuHMdVmoj3Tqz65VmSuVL2no4+bGC=qdB8LWoB=vyASf9vS+g@mail.gmail.com>
References: <20220421212250.565456-1-john.ogness@linutronix.de>
 <20220421212250.565456-15-john.ogness@linutronix.de>
 <878rrs6ft7.fsf@jogness.linutronix.de> <Ymfgis0EAw0Oxoa5@alley>
 <Ymfwk+X0CHq6ex3s@alley>
 <CGME20220427070833eucas1p27a32ce7c41c0da26f05bd52155f0031c@eucas1p2.samsung.com>
 <2a82eae7-a256-f70c-fd82-4e510750906e@samsung.com>
 <Ymjy3rHRenba7r7R@alley>
 <b6c1a8ac-c691-a84d-d3a1-f99984d32f06@samsung.com>
 <87fslyv6y3.fsf@jogness.linutronix.de>
 <51dfc4a0-f6cf-092f-109f-a04eeb240655@samsung.com>
 <87k0b6blz2.fsf@jogness.linutronix.de>
 <32bba8f8-dec7-78aa-f2e5-f62928412eda@samsung.com>
 <87y1zkkrjy.fsf@jogness.linutronix.de>
 <CAMuHMdVmoj3Tqz65VmSuVL2no4+bGC=qdB8LWoB=vyASf9vS+g@mail.gmail.com>
Date: Thu, 09 Jun 2022 13:25:15 +0206
Message-ID: <87fske3wzw.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_041923_132139_4F487F8A 
X-CRM114-Status: UNSURE (   5.67  )
X-CRM114-Notice: Please train this message.
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

(Added RANDOM NUMBER DRIVER and KFENCE people.)

Hi Geert,

On 2022-06-08, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>     =============================
>     [ BUG: Invalid wait context ]
>     5.19.0-rc1-ebisu-00802-g06a0dd60d6e4 #431 Not tainted
>     -----------------------------
>     swapper/0/1 is trying to lock:
>     ffffffc00910bac8 (base_crng.lock){....}-{3:3}, at:
> crng_make_state+0x148/0x1e4
>     other info that might help us debug this:
>     context-{5:5}
>     2 locks held by swapper/0/1:
>      #0: ffffffc008f8ae00 (console_lock){+.+.}-{0:0}, at:
> printk_activate_kthreads+0x10/0x54
>      #1: ffffffc009da4a28 (&meta->lock){....}-{2:2}, at:
> __kfence_alloc+0x378/0x5c4
>     stack backtrace:
>     CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> 5.19.0-rc1-ebisu-00802-g06a0dd60d6e4 #431
>     Hardware name: Renesas Ebisu-4D board based on r8a77990 (DT)
>     Call trace:
>      dump_backtrace.part.0+0x98/0xc0
>      show_stack+0x14/0x28
>      dump_stack_lvl+0xac/0xec
>      dump_stack+0x14/0x2c
>      __lock_acquire+0x388/0x10a0
>      lock_acquire+0x190/0x2c0
>      _raw_spin_lock_irqsave+0x6c/0x94
>      crng_make_state+0x148/0x1e4
>      _get_random_bytes.part.0+0x4c/0xe8
>      get_random_u32+0x4c/0x140
>      __kfence_alloc+0x460/0x5c4
>      kmem_cache_alloc_trace+0x194/0x1dc
>      __kthread_create_on_node+0x5c/0x1a8
>      kthread_create_on_node+0x58/0x7c
>      printk_start_kthread.part.0+0x34/0xa8
>      printk_activate_kthreads+0x4c/0x54
>      do_one_initcall+0xec/0x278
>      kernel_init_freeable+0x11c/0x214
>      kernel_init+0x24/0x124
>      ret_from_fork+0x10/0x20

I am guessing you have CONFIG_PROVE_RAW_LOCK_NESTING enabled?

We are seeing a spinlock (base_crng.lock) taken while holding a
raw_spinlock (meta->lock).

kfence_guarded_alloc()
  raw_spin_trylock_irqsave(&meta->lock, flags)
    prandom_u32_max()
      prandom_u32()
        get_random_u32()
          get_random_bytes()
            _get_random_bytes()
              crng_make_state()
                spin_lock_irqsave(&base_crng.lock, flags);

I expect it is allowed to create kthreads via kthread_run() in
early_initcalls.

John Ogness

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
