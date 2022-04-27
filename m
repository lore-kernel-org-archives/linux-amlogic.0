Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BF9C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Apr 2022 17:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wqzJtVmigMgZ57P2xso0FZaBP6ymmxWRmD7jmUfWuHI=; b=O/uDpZupIlWvgk
	U5wX0/UGgMO4BsRyoPkO9u1DPdVyJtN+Jg31SpdD4XT5iEosNhPI3Cqc/+E/8+O+522FZuWj5Nkie
	dOEW4NeaUamlz/SeKxjJNxFYSWb7YUzkybtWP2dEt0cLpCN0BOaQ7amBcvjuRpTMXzHNiIXrQiKYa
	N9J3ggSsMK0Qk2DnioppQBZdnMqfAfiXGzzhV5ucYs6vS8W+XbpyO+2nsJsmnvMsr0CYD7L0Yu3Ud
	/fdcdR6Ag0PLtqXsictSRjfjqOH2fVuVcd/2cqMDk/nLHfdhO9FQ1Y+bNut6ahyMvVcYBQmxxYpYT
	YpvmvB0JZF8rJOmEwJcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njl3L-002Ui7-3D; Wed, 27 Apr 2022 17:02:11 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njkKD-002Efi-56
 for linux-amlogic@lists.infradead.org; Wed, 27 Apr 2022 16:15:37 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1651076116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hL0SFvjJMATe9c/xNNoB1N/3UB9xTPkwRzwHyvMkOEo=;
 b=AQglSgvgOxwUtydaGqvaRV8wKFYWNJ5YBFXokRswfDPGPvtqovA5fe7IEUlYQrfA8A/KK4
 vhr+l3sx/bzG5dOHf+iPmNipYtStckHEv7JIIE5HNvBHm5T/Gn8/ipXhmdaHViSUtmKn+l
 /6ijh6YutZVGxD63L2Tj8820/NMLtvkUWUBO7PMpZjag8/RqsLxRM1RHOAmsr8CSBKitKv
 6MNBpflkms+etpyCPbShCWd7nWAqTAiXU+P7NhzCw4DIxFS3rl+G3nqitELh67Q/Q2sgjI
 AwUEGcKf9JrZwYtTihJWP02Qx5qhgxwgnXOfJV9oJWhFBWHJ+DUogeol4RNguA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1651076116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hL0SFvjJMATe9c/xNNoB1N/3UB9xTPkwRzwHyvMkOEo=;
 b=da0NgqfyPY/ECXVc5ePxpKHwiEQm5i/p0C8aGvfMy0pAy0eKvexqsUYEauVs/uDOkAC+tD
 wxFcKLSC1SDrVZAw==
To: Marek Szyprowski <m.szyprowski@samsung.com>, Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas
 Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH printk v5 1/1] printk: extend console_lock for
 per-console locking
In-Reply-To: <b6c1a8ac-c691-a84d-d3a1-f99984d32f06@samsung.com>
References: <20220421212250.565456-1-john.ogness@linutronix.de>
 <20220421212250.565456-15-john.ogness@linutronix.de>
 <878rrs6ft7.fsf@jogness.linutronix.de> <Ymfgis0EAw0Oxoa5@alley>
 <Ymfwk+X0CHq6ex3s@alley>
 <CGME20220427070833eucas1p27a32ce7c41c0da26f05bd52155f0031c@eucas1p2.samsung.com>
 <2a82eae7-a256-f70c-fd82-4e510750906e@samsung.com>
 <Ymjy3rHRenba7r7R@alley>
 <b6c1a8ac-c691-a84d-d3a1-f99984d32f06@samsung.com>
Date: Wed, 27 Apr 2022 18:21:16 +0206
Message-ID: <87fslyv6y3.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_091533_424487_ED06A660 
X-CRM114-Status: GOOD (  12.18  )
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

Hi Marek,

On 2022-04-27, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> Here is the full serial console log:
>
> https://pastebin.com/E5CDH88L

Here are a few ideas from me:

1. For next-20220427 the printk-threaded series was slightly changed. I
do not expect it to work any different, but I would prefer we are
debugging the current version. If possible, could you move to
next-20220427?

2. I noticed you boot with the kernel boot arguments "earlycon" and
"no_console_suspend". Could you try booting without this? I expect this
will make no difference.

3. It looks like the problem happens quite late in the boot process. I
expect it is due to some userspace process that is running that is
interacting with printk (either /dev/kmsg or /proc/kmsg) and is causing
problems. If you boot with init=/bin/sh then I expect the system is
running fine. (You don't have much of a system running, but it should
not hang.) We need to isolate which userspace process is triggering the
issue.

4. Have you tried issuing magic sysrq commands on the serial line? (For
example, sending a break signal and then the letter 't' or sending a
break signal and then the letter 'c'?) That might trigger various dumps
so that we can see the system state.

5. You are not running a VT console, so the graphics driver should not
be affecting the printk subsystem at all. I expect your autologin is
also starting various services and programs. If you disable the
automatic login and instead manually login (perhaps as another user) can
you manually start those services one at a time to see at what point the
system hangs?

Thanks for you help with this!

John Ogness

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
