Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C40CC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 May 2022 05:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qGQI2vW29hOUTYSc541Rv2e7tkWJnv8QCJWRAaNIlnM=; b=QBsml9IcCHB38Z
	YaARo7s7eK5+XjUZ7fTr2Dh/C0Pdc4KYK3xPZLOq1HSJrE7nj0MtIwluemF+uQi7qGKcXPRwSfoyF
	35DAFgCGl6+qP5xLa2Rfl28JoS4FyeNAcrEv5ZON0+RKDyYRDAqL4tG3bxLUrAW4N19EsP8PL2tat
	4zxi9VGvLtoiID5XvrEt6otK7oWr3633UBh5w/hZUS0NKK6yJZt10LcP18cNsFc2lsPAtUh9jnDZ9
	hghzt+OqY/FYyr+CdMeRASaCRlnEEJb29/IeBrMp7UAmtaNDJiG6jKqxYElD1WktrNPGsqW2KntNi
	9UotFCIb2htsZw0UrhiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm7zx-008tsX-VA; Wed, 04 May 2022 05:56:29 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm7zv-008tpH-GG
 for linux-amlogic@lists.infradead.org; Wed, 04 May 2022 05:56:28 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1651643779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y4gZIDL4SXYoFWE4y++sOkoisUu5mBEu04VZLJ6Da3k=;
 b=HDzJK9xF0QUViF6InNkFLn1aDJyGLxf1Liu4VNGxtUJ96Gg5nqPfXftf4oXoZoyfl2f+s3
 dNTuEK3ALsewLQpLlDLkBXvCnQ7w25gWB8O3YKRNlv8FHEOO24AZp91Y9sj0RseCHQzKQc
 kS5TX0fGxAaW8MDIdMB4gpSWfJ0fyiwRLd8TaLrsObIyb1UM5bZE4/t3BMWnkp17JoQML5
 jzNwgKN5yb087IFldVhWBeevKWovU1xtMn8xi6zsmYuLaNOVTMz2dH4e32f5Ajdp79ZsV2
 cau41KD3H/krQL0ptv7KsIL5ryHz71yZLf5hl3DG9YJSyY3KvqNHtAGAVXExCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1651643779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y4gZIDL4SXYoFWE4y++sOkoisUu5mBEu04VZLJ6Da3k=;
 b=f+DoFRCkfWwFo6/8okdZxAJ8tv80c/O3h9qzst54Ax3zeh1bD/qs3SswAVPuwCSAF01nzO
 j2sEd1/ouC01vHBw==
To: Marek Szyprowski <m.szyprowski@samsung.com>, Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH printk v5 1/1] printk: extend console_lock for
 per-console locking
In-Reply-To: <601d6979-7462-6f20-0d60-2fcfcf1e405b@samsung.com>
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
 <601d6979-7462-6f20-0d60-2fcfcf1e405b@samsung.com>
Date: Wed, 04 May 2022 08:02:18 +0206
Message-ID: <87pmkton7h.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_225627_732605_197FDA25 
X-CRM114-Status: UNSURE (   9.79  )
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

On 2022-05-03, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> I suppose if you login via ssh and check /proc/interrupts, then type
>> some things over serial, then check /proc/interrupts again, you will
>> see there have been no interrupts for the uart. But interrupts for
>> other devices are happening. Is this correct?
>
> Right. The counter for ttyAML0 is not increased when lockup happens
> and I type something to the uart console.

Hmmm. This would imply that the interrupts are disabled fo the UART.

Just to be sure that we haven't corrupted something in the driver, if
you make the following change, everything works, right?

--------- BEGIN PATCH ------
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index c7973266b176..1eaa323e335c 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3578,7 +3578,7 @@ static int __init printk_activate_kthreads(void)
 	struct console *con;
 
 	console_lock();
-	printk_kthreads_available = true;
+	//printk_kthreads_available = true;
 	for_each_console(con)
 		printk_start_kthread(con);
 	console_unlock();
--------- END PATCH ------

The above change will cause the kthreads to not print and instead always
fallback to the direct method.

John

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
