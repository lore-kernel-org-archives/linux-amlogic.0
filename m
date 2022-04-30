Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99332C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Apr 2022 16:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JyW7dUhsYYbMMrzrI3IhLrd+3doj37/07YXpKNLqItg=; b=TxO2sZGHl6Z1PE
	EQGkPp6/oyox46gpdUlvjuXbRH59/3QBOb/tedyz66dmUerpeV52MfXwT7M2lySFXBu0Ng9LLY4QA
	CepCjPB26lIVAFFByyafdihTM+R+USbRQ+z5efVWheLXKlzdUFBAtAPEY6o/nyofOGLW7LYTohM/j
	YLFLLscBg3IoDAQSlHd00kEPaJCzGSRSC5Y3gp/dmRNnLFX2r5xg/mGPVWlxlvdWTQbRj+/UwOb3N
	CemaEZJXHiz5lGYKTUhoxOdMJr9wKyXA3msZ/kE2AjDFtkwv97BXOjYL+yrWIpcWFuCa1SYIuu8rG
	PLkuf4+dzrbc1N1hNdPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkpVz-00EbUh-UG; Sat, 30 Apr 2022 16:00:11 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkpVw-00EbTB-Ve
 for linux-amlogic@lists.infradead.org; Sat, 30 Apr 2022 16:00:10 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1651334402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qg1MCgJs2GcRC2WuVMspd/xJnQOLWy76IzXScV+vSNk=;
 b=IqVNzG6jeHs2vRnqXL9KedXJ5Nneq6PU2Es22DQIRToeG6DxaGNtLE3alDyeUYg1NNXbOG
 tZ5XcIkOHripIzsDCl40gvjVoeCYFnsv3kIVTij3HVhFSbNAgA/OHxPOKwZ7QiSfsMRYY/
 AKhmpUiowRf81wz2OqN2Nn8wIhdctPHZNGBoxbkYoAwaA9/I/AluFXejieBz+3KlM4g/Z2
 iKRS2FZRwUrkL3wils42n513HmsViL/r2SDCbL7F2dBAwdVytWoLh/B69hWiiNosVfG2Qh
 qJJWhS3AfrCTqxEasuJKpNEnLt4tU06cLpUriIUxCouOwCQS9hu0CqIV3Q1SGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1651334402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qg1MCgJs2GcRC2WuVMspd/xJnQOLWy76IzXScV+vSNk=;
 b=lMdtoPUqqUTWycR9kLDoc1fYvtjsVvRXJ59N0pmRiF9K6BpLaSHO3eFzBjunfsjoOtlmtm
 8nTsnQ0RomQDUrCQ==
To: Marek Szyprowski <m.szyprowski@samsung.com>, Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH printk v5 1/1] printk: extend console_lock for
 per-console locking
In-Reply-To: <51dfc4a0-f6cf-092f-109f-a04eeb240655@samsung.com>
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
Date: Sat, 30 Apr 2022 18:06:01 +0206
Message-ID: <87k0b6blz2.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_090009_213718_DADF5D4E 
X-CRM114-Status: GOOD (  13.29  )
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

On 2022-04-29, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> The same issue happens if I boot with init=/bin/bash

Very interesting. Since you are seeing all the output up until you try
doing something, I guess receiving UART data is triggering the issue.

> I found something really interesting. When lockup happens, I'm still
> able to log via ssh and trigger any magic sysrq action via
> /proc/sysrq-trigger.

If you boot the system and directly login via ssh (without sending any
data via serial), can you trigger printk output on the UART? For
example, with:

    echo hello > /dev/kmsg

(You might need to increase your loglevel to see it.)

> It turned out that the UART console is somehow blocked, but it
> receives and buffers all the input. For example after issuing "echo
>  >/proc/sysrq-trigger" from the ssh console, the UART console has been 
> updated and I see the magic sysrq banner and then all the commands I 
> blindly typed in the UART console! However this doesn't unblock the
> console.

sysrq falls back to direct printing. This would imply that the kthread
printer is somehow unable to print.

> Here is the output of 't' magic sys request:
>
> https://pastebin.com/fjbRuy4f

It looks like the call trace for the printing kthread (pr/ttyAML0) is
corrupt.

Could you post your kernel config?

John

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
