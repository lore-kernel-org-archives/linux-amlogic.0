Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D698C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 May 2022 22:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3s8w6gDEmjI3kBmvPYrwx98BbMGKugm/Gw6DD41IViM=; b=TmmA18I1zceA08
	NbW2W7BpE3G8DwGEFfXedSEiL8Vs6AJYopc/Kbm0z6HHzcDozs6sRaRKklFKnzoIhW0C6MZgHZUqM
	KJhe9l2gDBgKEsV4r7ydiQ0NHCyIPZ+cPC+lYUbukIxmcNzNieBDLXYlmtK32EqzZbM2622ybaIfs
	/MTdg0uOGMGT6+ftHnlKdV+glZsqScZQwhF/ElKH4jAD7ziIRbJBkPNSClwdlrwOZSto+eRjgt/Te
	HFp3lWF1gYGCYfRzOetAYY5goisVhjLEy+k/hEzp45O9RI38qJCgO+nhIpiOwmZOux7CClPdRJJBO
	fszKHeSaUPEQdCL2JFEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmNhd-00D6y3-92; Wed, 04 May 2022 22:42:37 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmNha-00D6wF-OQ
 for linux-amlogic@lists.infradead.org; Wed, 04 May 2022 22:42:36 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1651704149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bIg1HscWN1tvVWMSh8fcrYwHSnmqdBrRg0rNnb5YAr4=;
 b=B6aIpuDJHUxIAuuxMW19vF2YskBMeJJY1RaYy1313Uyk1P/Z3GVoSvY0AbQFxrYcX1l0Az
 2/+LxzzMrc1k1ZWkIqwQ8W3k4ne/1w5GJuxZvSBg2nx92EhrCkYuJ2wCRUN7EiSMXMzYDd
 l1zVlr9+kWhZ1O7tHnfvpUy6/izefbTfP7q2LCkJgKbaY4KB4Mig6HzKfJE6CZIwC6h8bu
 vBvgOPtqmZ+JYem07KSOyh4vmjnHfcNrTUIhwocHTXrKf9CbgBxcjyD2Ul+RpraPyBVlBj
 55XhJKVhvDEXyxGfxU+jB6XLkv8B4/eKL61MRBrXnIptEUAYhLuU+qKkxUksGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1651704149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bIg1HscWN1tvVWMSh8fcrYwHSnmqdBrRg0rNnb5YAr4=;
 b=m98oYRuoP7rXD4qoKzjZfEYooVQPaQUBsEyWbXMrczs81p1HFw9GRfR/HRpjmTjK8iPQCm
 sjWxzDfchSYoCEBQ==
To: Marek Szyprowski <m.szyprowski@samsung.com>, Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas
 Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH printk v5 1/1] printk: extend console_lock for
 per-console locking
In-Reply-To: <87pmktm2a9.fsf@jogness.linutronix.de>
References: <Ymfgis0EAw0Oxoa5@alley> <Ymfwk+X0CHq6ex3s@alley>
 <CGME20220427070833eucas1p27a32ce7c41c0da26f05bd52155f0031c@eucas1p2.samsung.com>
 <2a82eae7-a256-f70c-fd82-4e510750906e@samsung.com>
 <Ymjy3rHRenba7r7R@alley>
 <b6c1a8ac-c691-a84d-d3a1-f99984d32f06@samsung.com>
 <87fslyv6y3.fsf@jogness.linutronix.de>
 <51dfc4a0-f6cf-092f-109f-a04eeb240655@samsung.com>
 <87k0b6blz2.fsf@jogness.linutronix.de>
 <32bba8f8-dec7-78aa-f2e5-f62928412eda@samsung.com>
 <Ym/Z7PYPqvWPEjuL@alley>
 <45849b63-d7a8-5cc3-26ad-256a28d09991@samsung.com>
 <87pmktm2a9.fsf@jogness.linutronix.de>
Date: Thu, 05 May 2022 00:48:28 +0206
Message-ID: <87a6bwapij.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_154234_972923_8B370715 
X-CRM114-Status: UNSURE (   8.71  )
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

On 2022-05-04, John Ogness <john.ogness@linutronix.de> wrote:
> I can reproduce the apparent stack corruption with qemu:
>
> [    5.545268] task:pr/ttyAMA0      state:S stack:    0 pid:   26 ppid:     2 flags:0x00000008
> [    5.545520] Call trace:
> [    5.545620]  __switch_to+0x104/0x160
> [    5.545796]  __schedule+0x2f4/0x9f0
> [    5.546122]  schedule+0x54/0xd0
> [    5.546206]  0x0

I believe I am chasing a ghost. I can rather easily reproduce these
strange call traces, but if another sysrq-t is sent afterwards, the call
trace is OK. Also, I added trace_dump_stack() into the printk-kthread
main loop to dump the stack on every iteration. There I never see any
corruption, even though the timestamps are near the sysrq-t dump showing
corruption. Moving trace_dump_stack() into
amba-pl011:pl011_console_write() also showed no stack corruption at very
near times when sysrq-t did.

And it should be noted that the console-hanging issues reported in this
thread _cannot_ be reproduced with qemu.

So I will stop focussing on this "corrupt stack" thing and instead
investigate what the meson driver is doing that causes it to get
stuck. Since interrupts do not even fire, I'm guessing that the RX
interrupts are not being re-enabled (AML_UART_RX_INT_EN) for some code
path. This bit is only explicitly set once, in
meson_uart_startup(). Whenever the bit is cleared, later the previous
value is restored. This is assumed to mean the interrupt gets
re-enabled. But if there is some code path where multiple CPUs can
modify the register, then the interrupt could end up permanently
disabled.

I will go through and check if all access to AML_UART_CONTROL is
protected by port->lock.

John

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
