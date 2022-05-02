Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935CFC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 May 2022 09:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/P03R1dEo84VOCnYiIetG4B8nAsUW8y9utBeebUsAgs=; b=qpfwZo0/dn3D5Z
	FttE/fh52JAFk4npQ5bd0hh6kAx/yVSwUbNM9hNZLzsNpcjZlZP/0hO/pHPHoT8hR8IKGD3hgfUBL
	lfSL+h1Cjpb6hyNaWkP9+T2TIUUZtXcNPEzgBXID32vhOXBR736VJCq4ZKuetcQvOLwyhDKygKgI2
	OGjaxzXHoEf3p8LcPOEyemKV9W7fAVvIpryLC1vzmVkwK0Lgvu1rS/p604Rd73Tqgnv4roc+7s2Ig
	AJ9drxpBoIAtJvPACZ1rEESlSJejWDIHYTWJeFzA4MGoH5m5YiYHrhubDNiM8TjxjXwfr8iqWowKG
	ELHHb1REuMN5ROFr3IiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlSDD-000aRt-MZ; Mon, 02 May 2022 09:19:23 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlSD6-000aPL-Sv
 for linux-amlogic@lists.infradead.org; Mon, 02 May 2022 09:19:20 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220502091909euoutp01ef4659d90c7950f3e34b7f69b6866b17~rPyyeugb90058200582euoutp017
 for <linux-amlogic@lists.infradead.org>; Mon,  2 May 2022 09:19:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220502091909euoutp01ef4659d90c7950f3e34b7f69b6866b17~rPyyeugb90058200582euoutp017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1651483149;
 bh=lDXJ5CYaoAKSZPGi9MeFLI+70hpv6Q1ZJIVgPfaCf/Y=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=j05/VmpNwtde6gqetWcyrTDaB1uT5GuzZr2+NQACFa50sfuzX2cF1f+YVXqWITSwz
 KI5ElXLtZufBZeI9g4LTPUMWHgKvTvWrvSYhOjq6Oj8P+VBDrQ0b+N91o130rS+ODN
 UrW2cvZi8XWLr3Awc7/yiTS9txykjmtS4SLTJ4N8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220502091909eucas1p25e68edb6237939a8909c016f6cbb5ecb~rPyySFm0B1423514235eucas1p2L;
 Mon,  2 May 2022 09:19:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id C3.0C.10260.C02AF626; Mon,  2
 May 2022 10:19:08 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220502091908eucas1p188479523b542fce2d66567129c3c3e7e~rPyx_rcnj2475724757eucas1p1B;
 Mon,  2 May 2022 09:19:08 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220502091908eusmtrp1317a784349930bc4e312e61e33ce09bf~rPyx9ULCf1600616006eusmtrp1b;
 Mon,  2 May 2022 09:19:08 +0000 (GMT)
X-AuditID: cbfec7f5-bddff70000002814-b8-626fa20cb2d2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 9A.FD.09404.C02AF626; Mon,  2
 May 2022 10:19:08 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220502091908eusmtip1304e3d1c3eb3dee07717ebf2af2f4ab8~rPyxY_Wyf2870128701eusmtip1j;
 Mon,  2 May 2022 09:19:08 +0000 (GMT)
Message-ID: <32bba8f8-dec7-78aa-f2e5-f62928412eda@samsung.com>
Date: Mon, 2 May 2022 11:19:07 +0200
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
In-Reply-To: <87k0b6blz2.fsf@jogness.linutronix.de>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOKsWRmVeSWpSXmKPExsWy7djP87o8i/KTDD59MLdoXryezWLblfmM
 Fgtmc1tc3jWHzeL/46+sFvs6HjBZ7N64iM1i86apzA4cHrMbLrJ4tOy7xe7x7tw5do/9c9ew
 e2xeUu+xfstVFo/Pm+QC2KO4bFJSczLLUov07RK4Mvb2TGUuuCFcMf/MerYGxl/8XYycHBIC
 JhJN89YxdjFycQgJrGCUeLDgPwuE84VR4nnTA2YI5zOjxMN1z1hhWjZuOMYEYgsJLGeU+Hbe
 EqLoI6PE8ae32EASvAJ2EvduTmQGsVkEVCQaDsxkhogLSpyc+YQFxBYVSJKYu+8eUJyDQ1gg
 QqJtbyhImFlAXOLWk/lg80UEvCVWvd7LDjKfWeAro8Tkyf8ZQRJsAoYSXW+7wHZxChhLtN/a
 wQLRLC+x/e0cZohDP3BI7L7vCWG7SPTe/Af1gLDEq+Nb2CFsGYnTk3tYQG6QEMiX+DvDGCJc
 IXHt9RqoMdYSd879YgMpYRbQlFi/Sx8i7Cgx5VcfO0Qnn8SNt4IQB/BJTNo2nRkizCvR0SYE
 Ua0mMev4OridBy9cYp7AqDQLKUhmIfl9FpJXZiHsXcDIsopRPLW0ODc9tdg4L7Vcrzgxt7g0
 L10vOT93EyMwLZ3+d/zrDsYVrz7qHWJk4mA8xCjBwawkwtu2ISdJiDclsbIqtSg/vqg0J7X4
 EKM0B4uSOG9y5oZEIYH0xJLU7NTUgtQimCwTB6dUA9Os3AUSopMPt9p9F1xZcL/9gFXhxUxX
 1nIPL4GbyYuM3y3vmGf9aidT0PxNN+bJbAjbkrk0LTn54uNs8Te7JzBZ9BxhOnjrhYaS4rQ1
 bfv/aDkLhl7+PXGjjFLT65SJ05nfWH6r3yTquzxyZ1DjkhVyljPkJhXdyviYI5vUKqz9c049
 R/73D3siCsTDIryE1zltErKVftrYGHSQLyZaQ+nb+2CH/Tdr/R++cWff2LKU9YTK2u317B2r
 /NJjNmSdbEvZ3XKR0XRm5LsmCeuEHZI/p3002l62vO4Yz0yBxYUG804J+20V0k5N27XBamvg
 khmGxXe3Hv0huNpnp4vddP0PEUF9vi4Pvzh79rd8kVBiKc5INNRiLipOBABmqsuuugMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRmVeSWpSXmKPExsVy+t/xu7o8i/KTDM7PU7JoXryezWLblfmM
 Fgtmc1tc3jWHzeL/46+sFvs6HjBZ7N64iM1i86apzA4cHrMbLrJ4tOy7xe7x7tw5do/9c9ew
 e2xeUu+xfstVFo/Pm+QC2KP0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTt
 bFJSczLLUov07RL0Mvb2TGUuuCFcMf/MerYGxl/8XYycHBICJhIbNxxj6mLk4hASWMoocfrh
 D3aIhIzEyWkNrBC2sMSfa11sILaQwHtGie/380FsXgE7iXs3JzKD2CwCKhINB2YyQ8QFJU7O
 fMICYosKJEm82PacsYuRg0NYIELifS9YmFlAXOLWk/lMILaIgLfEqtd72UFuYBb4yiix9sMz
 RohdG1kk9n8yAbHZBAwlut5C3MApYCzRfmsH1CAzia6tXYwQtrzE9rdzmCcwCs1CcsYsJPtm
 IWmZhaRlASPLKkaR1NLi3PTcYiO94sTc4tK8dL3k/NxNjMBo3Hbs55YdjCtffdQ7xMjEwXiI
 UYKDWUmEt21DTpIQb0piZVVqUX58UWlOavEhRlNgWExklhJNzgemg7ySeEMzA1NDEzNLA1NL
 M2MlcV7Pgo5EIYH0xJLU7NTUgtQimD4mDk6pBqYMv2XryvSXKC7QWWrqd7X93HLFLZNMpBby
 qqlbT65h03Rc9snifX3oFKnsak+mrdy5lz4f2d1YuS//WK+4Pz9nbfr2SdvveewsUXQu2Cuz
 1iWrQEgkqvONsdhnXm4zizUTzpX57N77/uFuqUdb7rl1Fm9ssVkyrXShlh7H76gD82OM6+st
 9ZokmgNXPs9PFq6YksUVn7Om0Gt6I+PCqIOHZ2Ve53toFlawl7fgTAerSYrV749OIT/XOCm4
 l6czT9l/4av2XMXISwlbTmgElp1NPMmgsWfyvFUaVRoPPDZWuj14vDfo5pZ6n1LXZYmirk/3
 G2nYmycv11g699ChbIPDE4+s/9HoaqDsO8m9XYmlOCPRUIu5qDgRAFuCh+pPAwAA
X-CMS-MailID: 20220502091908eucas1p188479523b542fce2d66567129c3c3e7e
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_021917_472396_26ADB5A5 
X-CRM114-Status: GOOD (  21.87  )
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

On 30.04.2022 18:00, John Ogness wrote:
> On 2022-04-29, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> The same issue happens if I boot with init=/bin/bash
> Very interesting. Since you are seeing all the output up until you try
> doing something, I guess receiving UART data is triggering the issue.

Right, this is how it looks like.

>> I found something really interesting. When lockup happens, I'm still
>> able to log via ssh and trigger any magic sysrq action via
>> /proc/sysrq-trigger.
> If you boot the system and directly login via ssh (without sending any
> data via serial), can you trigger printk output on the UART? For
> example, with:
>
>      echo hello > /dev/kmsg
>
> (You might need to increase your loglevel to see it.)

Data written to /dev/kmsg and all kernel logs were always displayed 
correctly. Also data written directly to /dev/ttyAML0 is displayed 
properly on the console. The latter doesn't however trigger the input 
related activity.

It looks that the data read from the uart is delivered only if other 
activity happens on the kernel console. If I type 'reboot' and press 
enter, nothing happens immediately. If I type 'date >/dev/ttyAML0' via 
ssh then, I only see the date printed on the console. However if I type 
'date >/dev/kmsg', the the date is printed and reboot happens.


>> It turned out that the UART console is somehow blocked, but it
>> receives and buffers all the input. For example after issuing "echo
>>   >/proc/sysrq-trigger" from the ssh console, the UART console has been
>> updated and I see the magic sysrq banner and then all the commands I
>> blindly typed in the UART console! However this doesn't unblock the
>> console.
> sysrq falls back to direct printing. This would imply that the kthread
> printer is somehow unable to print.
>
>> Here is the output of 't' magic sys request:
>>
>> https://protect2.fireeye.com/v1/url?k=8649f24d-e73258c4-86487902-74fe48600034-a2ca6bb18361467d&q=1&e=1bc4226f-a422-42b9-95e8-128845b8609f&u=https%3A%2F%2Fpastebin.com%2FfjbRuy4f
> It looks like the call trace for the printing kthread (pr/ttyAML0) is
> corrupt.

Right, good catch. For comparison, here is a 't' sysrq result from the 
'working' serial console (next-20220429), which happens usually 1 of 4 
boots:

https://pastebin.com/mp8zGFbW


> Could you post your kernel config?

https://pastebin.com/GUWGdCHX

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
