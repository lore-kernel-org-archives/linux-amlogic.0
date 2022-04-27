Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C3FC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Apr 2022 07:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cGGSNg2qpgRScTn4rfoC7QmmN8hoBkXL9fP9/VbfxKM=; b=zetXjvu2ObGdfm
	lwY14zxUoP5LYBXF0sZgvOLP7ogU+axJzk317RLVzdlnnOmzy4zoHvLXgXwxOZ9nNDP3eAX+Sid0Y
	lCnoGefnjeuBSOKI6ucVsTiH6t/5Im57B6aTHZ213MMfceIEU6hPinfGlY9wR5KfYhy6b9xvNQOkN
	RYC2fDmXNLCmofU4ZpWWYXu4a2hotaGsdvhB6a7VPo/2cOphr1Izt3ewAf6kf5PIHYXCtMqQkD2Lv
	W1t9n8t+t55E8TkVKwpnFwbq+XSD8T7nazbKGYxfXuHd2eT71wRusWo6F43SB9V54O4UeSqI2vTqf
	Nko3/fjEXMtowl7qOGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njbmz-000AtO-Ny; Wed, 27 Apr 2022 07:08:41 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njbmv-000ArJ-Kw
 for linux-amlogic@lists.infradead.org; Wed, 27 Apr 2022 07:08:40 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220427070834euoutp01e62824a33c90af2c68be907cdf34fd74~pryWPY0cT0082100821euoutp01Q
 for <linux-amlogic@lists.infradead.org>; Wed, 27 Apr 2022 07:08:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220427070834euoutp01e62824a33c90af2c68be907cdf34fd74~pryWPY0cT0082100821euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1651043314;
 bh=3IlMOM9G9dkX+aI1gLuWuQ/q1pYg4/JUIIqa3Qn4A/U=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=dUAoHmh1uVCJ+DRA2PG9lVryb7voBtyjlPHs8El93Y//OtdmQV7iWa8C9hHksLbBA
 hGaBR0MX8i3PMSUisGgP1DXAbuQgEiw2EVlqWSbSUowcI5c4Qe41qD78p9YgHBTLIL
 A3glTpMrolwdjreuRfujB/l029cbWj57Vo1NOvWk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220427070834eucas1p223b41220406dc980cbe68fb7359b7870~pryWArwXP1581815818eucas1p25;
 Wed, 27 Apr 2022 07:08:34 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id D4.75.10260.1FBE8626; Wed, 27
 Apr 2022 08:08:33 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220427070833eucas1p27a32ce7c41c0da26f05bd52155f0031c~pryVldXMz2272022720eucas1p2V;
 Wed, 27 Apr 2022 07:08:33 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220427070833eusmtrp251fe7356a4fee93d3869c7c52d61025a~pryVko3Oj0148001480eusmtrp2_;
 Wed, 27 Apr 2022 07:08:33 +0000 (GMT)
X-AuditID: cbfec7f5-bddff70000002814-79-6268ebf1a8f7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F8.90.09522.1FBE8626; Wed, 27
 Apr 2022 08:08:33 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220427070832eusmtip17049ccfdbadafd9f178fc6d8e21a8850~pryVCzENk1882418824eusmtip19;
 Wed, 27 Apr 2022 07:08:32 +0000 (GMT)
Message-ID: <2a82eae7-a256-f70c-fd82-4e510750906e@samsung.com>
Date: Wed, 27 Apr 2022 09:08:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH printk v5 1/1] printk: extend console_lock for
 per-console locking
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-amlogic@lists.infradead.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <Ymfwk+X0CHq6ex3s@alley>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsWy7djPc7ofX2ckGZz+YG7RvHg9m8W2K/MZ
 LRbM5ra4vGsOm8X/x19ZLfZ1PGCy2L1xEZvF5k1TmR04PGY3XGTxaNl3i93j3blz7B77565h
 99i8pN5j/ZarLB6fN8kFsEdx2aSk5mSWpRbp2yVwZezuaGcpOKpVsWjTOvYGxhbFLkZODgkB
 E4nNk46xdDFycQgJrGCUeHFyLROE84VR4vGLjewQzmdGidtnljDCtDS+bYRqWc4o0fdnHTOE
 85FR4vzb6cwgVbwCdhIrOrawgtgsAqoSm2YsZ4WIC0qcnPmEBcQWFUiSmLvvHlA9B4ewQIRE
 295QkDCzgLjErSfzmUBsEQFvibdnz4BdwSzwlVFi8uT/YFewCRhKdL3tYgOxOYHmT/twgAWi
 WV5i+9s5YAdJCHzgkDi59xEryAIJAReJr43ZEB8IS7w6voUdwpaR+L8TZBlISb7E3xnGEOEK
 iWuv1zBD2NYSd879YgMpYRbQlFi/Sx8i7Cgx5VcfO0Qnn8SNt4IQB/BJTNo2nRkizCvR0SYE
 Ua0mMev4OridBy9cYp7AqDQLKUhmIfl9FpJXZiHsXcDIsopRPLW0ODc9tdg4L7Vcrzgxt7g0
 L10vOT93EyMwMZ3+d/zrDsYVrz7qHWJk4mA8xCjBwawkwvtld0aSEG9KYmVValF+fFFpTmrx
 IUZpDhYlcd7kzA2JQgLpiSWp2ampBalFMFkmDk6pBqZ1+9TWezExHvqjMPFJT+DE+bJB/aHz
 LrYZXPbKl34wW1jCQoTH6fS7vsb08Ne/r9+7zv7y1J46kVL1OPPUZ2UbFOr2Pc3sf5xoZHzE
 K+ZM7i8Gl+PLW9p9dm239fz2W72QeY1P/797/1rXOKxi6J6dfvH8yoUaX0Jf7Z67wLlydkoj
 74XPlxZwnA6xSryp9OOw4b/8KqWjad3y18ruxC774SVjvvGzVdzvlRVu3xbLHta7aLXo4Zf8
 pwt/7khRkk5hVmwPrP94Nf7L2sfd0Q8PPYtpYzTiPNFrXeUhkZttziVyc+6l8FlNskEsm6RL
 rbmeHN6yTGm/hv/c5rvn5H0f5i84p6rgc9dyS/NtfX4lluKMREMt5qLiRAB7FVYUuwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRmVeSWpSXmKPExsVy+t/xu7ofX2ckGXyeImXRvHg9m8W2K/MZ
 LRbM5ra4vGsOm8X/x19ZLfZ1PGCy2L1xEZvF5k1TmR04PGY3XGTxaNl3i93j3blz7B77565h
 99i8pN5j/ZarLB6fN8kFsEfp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb
 2aSk5mSWpRbp2yXoZezuaGcpOKpVsWjTOvYGxhbFLkZODgkBE4nGt40sXYxcHEICSxklJky4
 wgqRkJE4Oa0ByhaW+HOtiw2i6D2jxMffh5hBErwCdhIrOraAFbEIqEpsmrGcFSIuKHFy5hMW
 EFtUIEnixbbnjF2MHBzCAhES73vBwswC4hK3nsxnArFFBLwl3p49ww4yn1ngK6PE2g/PGCGW
 XWaUmLflFlgHm4ChRNdbkCs4OTiBlk37cABqkplE19YuRghbXmL72znMExiFZiG5YxaShbOQ
 tMxC0rKAkWUVo0hqaXFuem6xoV5xYm5xaV66XnJ+7iZGYERuO/Zz8w7Gea8+6h1iZOJgPMQo
 wcGsJML7ZXdGkhBvSmJlVWpRfnxRaU5q8SFGU2BgTGSWEk3OB6aEvJJ4QzMDU0MTM0sDU0sz
 YyVxXs+CjkQhgfTEktTs1NSC1CKYPiYOTqkGpt1Sr45Je3OILyqUf9Z0KWeKuuG9bR/m56+9
 f8futiX7gs9RD9rmGjzK2+hdVrLy99Hl614tjUmZtzdcSuLuEnb7ru62JxuWVH9aXcG7jMf2
 psCBd3fao8+4+hz+oGey063zba49q8LuyiveSSfTclO9/DRPXu55IrzHI3Bd4JUN9U+5a85m
 hBifUm+V9XPXyfmhk1rKVmk9gaHNIlE0RpaHjUVYfHFPps3KAsXes9a+TuHG87qsY7UvuDlI
 m3rd/T3zjVBuj1PzXq0Nt0uiAiRV9oaazWQ/IPPyp7x/6sm0C8a1iULcuu+XtP3Kciz8lJyy
 Voa/43fhWh9LifY5lRc8+c+8EZ0fbJVxbbESS3FGoqEWc1FxIgC/b4I7UQMAAA==
X-CMS-MailID: 20220427070833eucas1p27a32ce7c41c0da26f05bd52155f0031c
X-Msg-Generator: CA
X-RootMTR: 20220427070833eucas1p27a32ce7c41c0da26f05bd52155f0031c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220427070833eucas1p27a32ce7c41c0da26f05bd52155f0031c
References: <20220421212250.565456-1-john.ogness@linutronix.de>
 <20220421212250.565456-15-john.ogness@linutronix.de>
 <878rrs6ft7.fsf@jogness.linutronix.de> <Ymfgis0EAw0Oxoa5@alley>
 <Ymfwk+X0CHq6ex3s@alley>
 <CGME20220427070833eucas1p27a32ce7c41c0da26f05bd52155f0031c@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_000838_224229_77C6D79D 
X-CRM114-Status: GOOD (  22.16  )
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

Hi,

On 26.04.2022 15:16, Petr Mladek wrote:
> On Tue 2022-04-26 14:07:42, Petr Mladek wrote:
>> On Mon 2022-04-25 23:04:28, John Ogness wrote:
>>> Currently threaded console printers synchronize against each
>>> other using console_lock(). However, different console drivers
>>> are unrelated and do not require any synchronization between
>>> each other. Removing the synchronization between the threaded
>>> console printers will allow each console to print at its own
>>> speed.
>>>
>>> But the threaded consoles printers do still need to synchronize
>>> against console_lock() callers. Introduce a per-console mutex
>>> and a new console boolean field @blocked to provide this
>>> synchronization.
>>>
>>> console_lock() is modified so that it must acquire the mutex
>>> of each console in order to set the @blocked field. Console
>>> printing threads will acquire their mutex while printing a
>>> record. If @blocked was set, the thread will go back to sleep
>>> instead of printing.
>>>
>>> The reason for the @blocked boolean field is so that
>>> console_lock() callers do not need to acquire multiple console
>>> mutexes simultaneously, which would introduce unnecessary
>>> complexity due to nested mutex locking. Also, a new field
>>> was chosen instead of adding a new @flags value so that the
>>> blocked status could be checked without concern of reading
>>> inconsistent values due to @flags updates from other contexts.
>>>
>>> Threaded console printers also need to synchronize against
>>> console_trylock() callers. Since console_trylock() may be
>>> called from any context, the per-console mutex cannot be used
>>> for this synchronization. (mutex_trylock() cannot be called
>>> from atomic contexts.) Introduce a global atomic counter to
>>> identify if any threaded printers are active. The threaded
>>> printers will also check the atomic counter to identify if the
>>> console has been locked by another task via console_trylock().
>>>
>>> Note that @console_sem is still used to provide synchronization
>>> between console_lock() and console_trylock() callers.
>>>
>>> A locking overview for console_lock(), console_trylock(), and the
>>> threaded printers is as follows (pseudo code):
>>>
>>> console_lock()
>>> {
>>>          down(&console_sem);
>>>          for_each_console(con) {
>>>                  mutex_lock(&con->lock);
>>>                  con->blocked = true;
>>>                  mutex_unlock(&con->lock);
>>>          }
>>>          /* console_lock acquired */
>>> }
>>>
>>> console_trylock()
>>> {
>>>          if (down_trylock(&console_sem) == 0) {
>>>                  if (atomic_cmpxchg(&console_kthreads_active, 0, -1) == 0) {
>>>                          /* console_lock acquired */
>>>                  }
>>>          }
>>> }
>>>
>>> threaded_printer()
>>> {
>>>          mutex_lock(&con->lock);
>>>          if (!con->blocked) {
>>> 		/* console_lock() callers blocked */
>>>
>>>                  if (atomic_inc_unless_negative(&console_kthreads_active)) {
>>>                          /* console_trylock() callers blocked */
>>>
>>>                          con->write();
>>>
>>>                          atomic_dec(&console_lock_count);
>>>                  }
>>>          }
>>>          mutex_unlock(&con->lock);
>>> }
>>>
>>> The console owner and waiter logic now only applies between contexts
>>> that have taken the console_lock via console_trylock(). Threaded
>>> printers never take the console_lock, so they do not have a
>>> console_lock to handover. Tasks that have used console_lock() will
>>> block the threaded printers using a mutex and if the console_lock
>>> is handed over to an atomic context, it would be unable to unblock
>>> the threaded printers. However, the console_trylock() case is
>>> really the only scenario that is interesting for handovers anyway.
>>>
>>> @panic_console_dropped must change to atomic_t since it is no longer
>>> protected exclusively by the console_lock.
>>>
>>> Since threaded printers remain asleep if they see that the console
>>> is locked, they now must be explicitly woken in __console_unlock().
>>> This means wake_up_klogd() calls following a console_unlock() are
>>> no longer necessary and are removed.
>>>
>>> Also note that threaded printers no longer need to check
>>> @console_suspended. The check for the @blocked field implicitly
>>> covers the suspended console case.
>>>
>>> Signed-off-by: John Ogness <john.ogness@linutronix.de>
>> Nice, it it better than v4. I am going to push this for linux-next.
>>
>> Reviewed-by: Petr Mladek <pmladek@suse.com>
> JFYI, I have just pushed this patch instead of the one
> from v4 into printk/linux.git, branch rework/kthreads.
>
> It means that this branch has been rebased. It will be
> used in the next refresh of linux-next.

This patchset landed in linux next-20220426. In my tests I've found that 
it causes deadlock on all my Amlogic Meson G12B/SM1 based boards: Odroid 
C4/N2 and Khadas VIM3/VIM3l. The deadlock happens when system boots to 
userspace and getty (with automated login) is executed. I even see the 
bash prompt, but then the console is freezed. Reverting this patch 
(e00cc0e1cbf4) on top of linux-next (together with 6b3d71e87892 to make 
revert clean) fixes the issue.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
