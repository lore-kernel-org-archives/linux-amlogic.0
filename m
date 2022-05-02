Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA531C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 May 2022 13:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wNZcMzczCCcmu49dmvEG2vd6PmRRiK/X9x+UhdnVuOs=; b=NgSn18WfpFP+yq
	o5WTb7HA7/ZwJCA0Saa2XcAaxuj91EzLUKpWRBpwN8bRVRdPn4G+FBnoxGxLFiu3DEZgBtK+XyW1W
	JH5AUqwMiGuJXb9Qksn0ujoAQLsYRHZHiciOJRBFdTl8aauV1DHr7I7uU+mUAklxH/qVBbCG3I4KB
	4myBWr10PSw9vc1nk+CaF6XKsmxUz/aXbXW6nIjMu533iCQaTEP3spelH/Qx/OcNKLzs1+SfVJ93u
	Nh2HYTJQw7JvOnqlR+77t0ZmJX1PBDYRb1uudeAbP2UmAHn8Xxm1G9L5gcuhzRQciv/AAQq1D3ve7
	5NwboE0PfKZTFiKjIsfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlVq4-001ELE-0S; Mon, 02 May 2022 13:11:44 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlVpw-001EHt-9g
 for linux-amlogic@lists.infradead.org; Mon, 02 May 2022 13:11:40 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1651497090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ggFgY/zK0y72ZUtp6KigXGll6Hp+UovEpSfnz2w+970=;
 b=vTF3+lOygvZywEc8UOCDeFCHievf/zlP6DE4bG/HypfnZQOxRZeWw0g2pq1ihKyBjafuS2
 5oVT4DtRYCHZargZ6EV/gP3DlCe9gjfV927uV+GZdruxjLImz+bPFQj6dfogkUBSeN8Q8c
 HIBRSY7rtXFYGUXRMN90xPvCw9L2m/wUyBbDvSUiWgL2NnhDIgNzbXaYV07+2vExx+SYTg
 wNyHvxHeSXjc4tpCEghafuSQlIAJkk7Z8scRZrIC6/nuf98VRHkRTD/SjFB57F3rkAunJ1
 pEER6DYEYZrU5hxZbR0qW+HcS3f3SKamkAz+6hnK88QpWLp+KanTIMtxnQivRg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1651497090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ggFgY/zK0y72ZUtp6KigXGll6Hp+UovEpSfnz2w+970=;
 b=3T6JKye25mxbWo8WRxifuqeA96PeYYZMI/3rW+b2iio0VVDVwarm0EcC24fy0Vn6+xcGXD
 esJc+78qanVrKEBQ==
To: Marek Szyprowski <m.szyprowski@samsung.com>, Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH printk v5 1/1] printk: extend console_lock for
 per-console locking
In-Reply-To: <32bba8f8-dec7-78aa-f2e5-f62928412eda@samsung.com>
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
Date: Mon, 02 May 2022 15:17:29 +0206
Message-ID: <87y1zkkrjy.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_061136_533619_6B0386FB 
X-CRM114-Status: GOOD (  17.26  )
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

On 2022-05-02, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> Data written to /dev/kmsg and all kernel logs were always displayed
> correctly. Also data written directly to /dev/ttyAML0 is displayed
> properly on the console. The latter doesn't however trigger the input
> related activity.
>
> It looks that the data read from the uart is delivered only if other
> activity happens on the kernel console. If I type 'reboot' and press
> enter, nothing happens immediately. If I type 'date >/dev/ttyAML0' via
> ssh then, I only see the date printed on the console. However if I
> type 'date >/dev/kmsg', the the date is printed and reboot happens.

I suppose if you login via ssh and check /proc/interrupts, then type
some things over serial, then check /proc/interrupts again, you will see
there have been no interrupts for the uart. But interrupts for other
devices are happening. Is this correct?

> For comparison, here is a 't' sysrq result from the 'working' serial
> console (next-20220429), which happens usually 1 of 4 boots:
>
> https://pastebin.com/mp8zGFbW

This still looks odd to me. We should be seeing a trace originating from
ret_from_fork+0x10/0x20 and kthread+0x118/0x11c.

I wonder if the early creation of the thread is somehow causing
problems. Could you try the following patch to see if it makes a
difference? I would also like to see the sysrq-t output with this patch
applied:

---------------- BEGIN PATCH ---------------
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 2311a0ad584a..c4362d25de22 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3837,7 +3837,7 @@ static int __init printk_activate_kthreads(void)
 
 	return 0;
 }
-early_initcall(printk_activate_kthreads);
+late_initcall(printk_activate_kthreads);
 
 #if defined CONFIG_PRINTK
 /* If @con is specified, only wait for that console. Otherwise wait for all. */
---------------- END PATCH ---------------

Thanks for your help with this!

John

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
