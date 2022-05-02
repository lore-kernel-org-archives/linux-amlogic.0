Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF595C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 May 2022 22:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8s/rDNoirXHZpgOvP3O+ooGbqM3qk6867MhTYC609rw=; b=oynYdRN+W7MjGr
	AMZZaOkODoHqv1Q0n0h2tEy7uCPY9O+HkJnG/wadTt5wLyvqcoQs8ES9OEr9PgOz+VtwRZdeSlCdN
	JuC7MmJ+YkWq7ajZZhmQcZRk58ij+MHDsb8ruWJSP0nSL6RAi5LPRJsg9pacNx9uJzQ2xSe4rp22J
	O3onIoGizh8efVelJp0sCeFwd9RDK+NZG6W746vAMrCLhr1u0c8f1FHwbFQvDt6m2lOmkkuP7mvP/
	Ws6uP8HSVke33rM2ZJcajkQNN3YJs0b11j6yTEkvkb/eiiUE7uexRe3pqJoBq1oJZ4q9fv/VRTokp
	KixBI1rbOWvhbLbJIdIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nleXV-002vlH-BA; Mon, 02 May 2022 22:29:09 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nleXR-002vk3-T1
 for linux-amlogic@lists.infradead.org; Mon, 02 May 2022 22:29:08 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220502222902euoutp0252d2dc8054e55b35711dbf8395965624~rakc6LEiP1519415194euoutp02R
 for <linux-amlogic@lists.infradead.org>; Mon,  2 May 2022 22:29:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220502222902euoutp0252d2dc8054e55b35711dbf8395965624~rakc6LEiP1519415194euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1651530542;
 bh=JISPIXGx+t2797poWPfDGEXeiCnRRaIzH+pykhQARJ8=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=BxpFuHTvvdrTin1VCBJBRV/oEFtBFk0hW2MtR13eQNhIIuKugbRbGf9Hp3RFtrNcI
 TEa+O6ZGSwOQ0z2xF9fQMxFkyBEtUPR8asube+hys2KJ4JGg5S9DcjWdASFgSFp1rD
 bwGTHc8mCk07L0mx2yCeAXUv/1hsC1GzOJ+LA1j4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220502222901eucas1p17d2b8f927ccab98b8d62154285f6a68c~rakbrOuJh1783017830eucas1p1s;
 Mon,  2 May 2022 22:29:01 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 3D.70.10009.D2B50726; Mon,  2
 May 2022 23:29:01 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220502222900eucas1p267df21cbfbdd081fc78ea567cf8f145d~rakbXzDWh0571905719eucas1p2I;
 Mon,  2 May 2022 22:29:00 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220502222900eusmtrp1af424595ed1aaa8c9a6fd6b1a9ef9375~rakbVt4qn1603816038eusmtrp1h;
 Mon,  2 May 2022 22:29:00 +0000 (GMT)
X-AuditID: cbfec7f2-e95ff70000002719-d7-62705b2dc747
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 95.3E.09522.C2B50726; Mon,  2
 May 2022 23:29:00 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220502222900eusmtip2149c260383c899bca1cb4148e433dd8b~rakasr7SN3199331993eusmtip2I;
 Mon,  2 May 2022 22:29:00 +0000 (GMT)
Message-ID: <601d6979-7462-6f20-0d60-2fcfcf1e405b@samsung.com>
Date: Tue, 3 May 2022 00:29:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH printk v5 1/1] printk: extend console_lock for
 per-console locking
Content-Language: en-US
To: John Ogness <john.ogness@linutronix.de>, Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-amlogic@lists.infradead.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <87y1zkkrjy.fsf@jogness.linutronix.de>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsWy7djPc7q60QVJBnOOsFo0L17PZrHtynxG
 iwWzuS0u75rDZvH/8VdWi30dD5gsdm9cxGaxedNUZgcOj9kNF1k8WvbdYvd4d+4cu8f+uWvY
 PTYvqfdYv+Uqi8fnTXIB7FFcNimpOZllqUX6dglcGZM/LWIpeCNcseDmW/YGxnUCXYycHBIC
 JhLdb2cxdzFycQgJrGCUOH/jEjuE84VR4tnWPWwQzmdGiTVdrYwwLR1b1rFAJJYzSrScmsoO
 khAS+MgoceVNPIjNK2AnsefUHiYQm0VAReLfnbfMEHFBiZMzn7CA2KICSRJz990DinNwCAtE
 SLTtDQUJMwuIS9x6Mh+sVUTAW2LV671gFzELfGWUmDz5P9gRbAKGEl1vu9hAbE4BY4mHk4+z
 QTTLS2x/OwfsHwmBLxwSh57/Z4K42kXi+vq1ULawxKvjW9ghbBmJ05N7WECOkBDIl/g7wxgi
 XCFx7fUaZgjbWuLOuV9sICXMApoS63fpQ4QdJab86mOH6OSTuPFWEOICPolJ26YzQ4R5JTra
 hCCq1SRmHV8Ht/PghUvMExiVZiGFySwkz89C8ssshL0LGFlWMYqnlhbnpqcWG+allusVJ+YW
 l+al6yXn525iBCam0/+Of9rBOPfVR71DjEwcjIcYJTiYlUR42zbkJAnxpiRWVqUW5ccXleak
 Fh9ilOZgURLnTc7ckCgkkJ5YkpqdmlqQWgSTZeLglGpgypj04Yb61+IiXjaZievvHHwS4tqd
 7co/w2KlwpOf9otOzozerMGp+WWuxP3OXYV3e9PKzx7rU84+Eju/PbZ+Q2ZcNUOFV0vY3adz
 ZCZIefm1OXmctC7XYjY0rxVf/Th4ZrzdxjOp1+2MjszQ6Tb8vGTbgsyVnfVreJQ9Ziu/lZ/r
 Mndj/Lxjp3fvyyxz4QqyCBdS8Pn0ePI3p+/t87eZ2s+RTzigw/r7j+TiPfnRbdXvM1l+eX7W
 +Ml82+bQ0weWx6t3/Dzcuk377z4+dePnN96mnZ27vSDmePbtQCWBn3NVY594v2B7s/55W6pm
 KpdnfbayumUnm2KKHWe74syV7QrB66I5XtT9tvs4adUSJZbijERDLeai4kQAKbCBJbsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRmVeSWpSXmKPExsVy+t/xe7o60QVJBusbtS2aF69ns9h2ZT6j
 xYLZ3BaXd81hs/j/+Curxb6OB0wWuzcuYrPYvGkqswOHx+yGiyweLftusXu8O3eO3WP/3DXs
 HpuX1Hus33KVxePzJrkA9ig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07
 m5TUnMyy1CJ9uwS9jMmfFrEUvBGuWHDzLXsD4zqBLkZODgkBE4mOLetYQGwhgaWMElM36UDE
 ZSROTmtghbCFJf5c62LrYuQCqnnPKLF2cwszSIJXwE5iz6k9TCA2i4CKxL87b6HighInZz4B
 GyoqkCTxYttzxi5GDg5hgQiJ971gYWYBcYlbT+aDtYoIeEuser2XHWQ+s8BXoPkfnjFCLOtn
 leh/dxGsg03AUKLrLcgVnBycAsYSDycfZ4OYZCbRtbWLEcKWl9j+dg7zBEahWUjumIVk4Swk
 LbOQtCxgZFnFKJJaWpybnltsqFecmFtcmpeul5yfu4kRGI/bjv3cvINx3quPeocYmTgYDzFK
 cDArifC2bchJEuJNSaysSi3Kjy8qzUktPsRoCgyMicxSosn5wISQVxJvaGZgamhiZmlgamlm
 rCTO61nQkSgkkJ5YkpqdmlqQWgTTx8TBKdXA5HOLXaMu79fbes1vJX85wv6cZUtceKP86c5/
 U1PP7c+P+MK4aoaoSKXc3l/8Gy1/WHcF2R8vmCTpdfqo+anVswNOM/rpnK1U3e1le/LRga8L
 DB0TWRamzbyocq6k9+w/J6f1XHwbnVaIMh1vcbOa9LHnttFWWV5/N+/ntYvvafP67933/v+R
 hUdOLHCc9lorJOzZE0mJtfM9z4vXlp1YcO7x1O6iVYFTT9ocknz7n/txrHDFhpVJkXtXGgfH
 LelXY1RvYD72O3SXl0rh0bsh+p6yr3Ylx2z13rQ+5WlVcJj4kpfFyXw3thxIejp57p0ztw+d
 /JqozL3my3euf+ym7hsPbcz/dVjqweTXcyJUk2uVWIozEg21mIuKEwHaym2MUAMAAA==
X-CMS-MailID: 20220502222900eucas1p267df21cbfbdd081fc78ea567cf8f145d
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
 <2a82eae7-a256-f70c-fd82-4e510750906e@samsung.com> <Ymjy3rHRenba7r7R@alley>
 <b6c1a8ac-c691-a84d-d3a1-f99984d32f06@samsung.com>
 <87fslyv6y3.fsf@jogness.linutronix.de>
 <51dfc4a0-f6cf-092f-109f-a04eeb240655@samsung.com>
 <87k0b6blz2.fsf@jogness.linutronix.de>
 <32bba8f8-dec7-78aa-f2e5-f62928412eda@samsung.com>
 <87y1zkkrjy.fsf@jogness.linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_152906_395432_B203E850 
X-CRM114-Status: GOOD (  26.73  )
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

Hi John,

On 02.05.2022 15:11, John Ogness wrote:
> On 2022-05-02, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> Data written to /dev/kmsg and all kernel logs were always displayed
>> correctly. Also data written directly to /dev/ttyAML0 is displayed
>> properly on the console. The latter doesn't however trigger the input
>> related activity.
>>
>> It looks that the data read from the uart is delivered only if other
>> activity happens on the kernel console. If I type 'reboot' and press
>> enter, nothing happens immediately. If I type 'date >/dev/ttyAML0' via
>> ssh then, I only see the date printed on the console. However if I
>> type 'date >/dev/kmsg', the the date is printed and reboot happens.
> I suppose if you login via ssh and check /proc/interrupts, then type
> some things over serial, then check /proc/interrupts again, you will see
> there have been no interrupts for the uart. But interrupts for other
> devices are happening. Is this correct?

Right. The counter for ttyAML0 is not increased when lockup happens and 
I type something to the uart console.

>> For comparison, here is a 't' sysrq result from the 'working' serial
>> console (next-20220429), which happens usually 1 of 4 boots:
>>
>> https://protect2.fireeye.com/v1/url?k=3ef0fd63-5f7be855-3ef1762c-000babff9b5d-2e40dc5adc30a14c&q=1&e=1469838f-8586-403e-bd4d-922675d8b658&u=https%3A%2F%2Fpastebin.com%2Fmp8zGFbW
> This still looks odd to me. We should be seeing a trace originating from
> ret_from_fork+0x10/0x20 and kthread+0x118/0x11c.
>
> I wonder if the early creation of the thread is somehow causing
> problems. Could you try the following patch to see if it makes a
> difference? I would also like to see the sysrq-t output with this patch
> applied:
>
> ---------------- BEGIN PATCH ---------------
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 2311a0ad584a..c4362d25de22 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -3837,7 +3837,7 @@ static int __init printk_activate_kthreads(void)
>   
>   	return 0;
>   }
> -early_initcall(printk_activate_kthreads);
> +late_initcall(printk_activate_kthreads);
>   
>   #if defined CONFIG_PRINTK
>   /* If @con is specified, only wait for that console. Otherwise wait for all. */
> ---------------- END PATCH ---------------
>
> Thanks for your help with this!

Well, nothing has changed. The lockup still happens.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
