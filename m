Return-Path: <SRS0=G+6o=6O=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBD1C83003
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Apr 2020 03:34:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BC4720733
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Apr 2020 03:34:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AFlXkxrb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BC4720733
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:MIME-Version:In-Reply-To:
	Subject:To:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=WrTUSootwAXdgVWSf5uyIP8/CVgfr/lHgSUAXhvkxrA=; b=AFlXkxrbrl9pKH
	ivsAlpJT5A/zAmY22yqXUVavwniXYk+jHoe1nnZ7E3lg93SGk5NzZJnNPK/WiUOlAoOf7BDJYmtGj
	0J99q7ksWYcJ5ewra42J3xp8rd0cCtcMLOEsHM5/upA+ht1SLwZsLusi8wJLN3i/Cgu29jQqPdAw9
	jUh1TZWIdVGS0Lp6rwD4yNF8dVxlEoFvra0eEF01NfgoF9yJPzIxnZR1xemQdeaRaWHwEaEz4Htgu
	X2bYQnc3T7s+sT2JkrMyvPPagXHefSCdg4AKlxfw/d0tkeZimdV/VvJRW/YyYFeyjA6yiZqZzdrHe
	CRhljlXbtZgNrrJ0C2bA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTzxQ-00056Q-Q9; Thu, 30 Apr 2020 03:33:52 +0000
Received: from m176148.mail.qiye.163.com ([59.111.176.148])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTzxM-00054n-RS
 for linux-amlogic@lists.infradead.org; Thu, 30 Apr 2020 03:33:51 +0000
Received: from vivo.com (wm-8.qy.internal [127.0.0.1])
 by m176148.mail.qiye.163.com (Hmail) with ESMTP id AA5181A3FD3;
 Thu, 30 Apr 2020 11:33:07 +0800 (CST)
Message-ID: <AMEAJAC4CHW7UjeCKaE3F4rq.3.1588217587684.Hmail.bernard@vivo.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSF0gY2xrL21lc29uOiBmaXhlcyBtZW1sZWFrIGlzc3VlIGluIGluaXQgZXJyIGJyYW5jaA==?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 157.0.31.122
In-Reply-To: <CAFBinCA7CvBzEYMG+VmJTRF9zxajj1KOHt0F4A2hUJhKrTpmhw@mail.gmail.com>
MIME-Version: 1.0
Received: from bernard@vivo.com( [157.0.31.122) ] by ajax-webmail (
 [127.0.0.1] ) ; Thu, 30 Apr 2020 11:33:07 +0800 (GMT+08:00)
From: =?UTF-8?B?6LW15Yab5aWO?= <bernard@vivo.com>
Date: Thu, 30 Apr 2020 11:33:07 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZSFVLT0hLS0tJSUpJTklPT1lXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kJHlYWEh9ZQUhMTklMSU9ISk1DN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6Nj46MTo4TzgzLEwuER44MBo#SD1PCQpVSFVKTkNDSUpMTkNMTE5MVTMWGhIXVRkeCRUaCR87
 DRINFFUYFBZFWVdZEgtZQVlKTkxVS1VISlVKSUlZV1kIAVlBTU5MSDcG
X-HM-Tid: 0a71c92527f89394kuwsaa5181a3fd3
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_203349_182587_914793DB 
X-CRM114-Status: GOOD (  11.99  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: opensource.kernel@vivo.com, Neil Armstrong <narmstrong@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: 2020-04-30 01:43:55
To:  Jerome Brunet <jbrunet@baylibre.com>
Cc:  Bernard Zhao <bernard@vivo.com>,Neil Armstrong <narmstrong@baylibre.com>,Stephen Boyd <sboyd@kernel.org>,Kevin Hilman <khilman@baylibre.com>,linux-amlogic@lists.infradead.org,linux-clk@vger.kernel.org,linux-kernel@vger.kernel.org,opensource.kernel@vivo.com
Subject: Re: [PATCH] clk/meson: fixes memleak issue in init err branch>Hi Jerome,
>
>On Wed, Apr 29, 2020 at 2:37 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>>
>> On Wed 29 Apr 2020 at 05:14, Bernard Zhao <bernard@vivo.com> wrote:
>>
>> > In common init function, when run into err branch, we didn`t
>> > use kfree to release kzmalloc area, this may bring in memleak
>>
>> Thx for reporting this Bernard.
>> I'm not a fan of adding kfree everywhere. I'd much prefer a label and
>> clear error exit path.
>>
>> That being said, the allocation is probably not the only thing that
>> needs to be undone in case of error. I guess this is due to conversion
>> to CLK_OF_DECLARE_DRIVER() which forced to drop all the devm_
>> This was done because the clock controller was required early in the
>> boot sequence.
>>
>> There is 2 paths to properly solve this:
>> 1) Old school: manually undo everything with every error exit condition
>>    Doable but probably a bit messy
>> 2) Convert back the driver to a real platform driver and use devm_.
>>    We would still need the controller to register early but I wonder if
>>    we could use the same method as drivers/clk/mediatek/clk-mt2701.c and
>>    use arch_initcall() ?
>>
>> Martin, you did the initial conversion, what do you think of option 2 ?
>I tried it with the attached patch
>unfortunately my "m8b_clkc_test_probe" is still run too late
>
>> Would it still answer the problem you were trying to solve back then ?
>I'm afraid it does not:
>- the resets are needed early for SMP initialization
>- the clocks are needed even earlier for timer registration (we have
>both, the ARM TWD timer and some Amlogic custom timer. both have clock
>inputs)
>
>> One added benefit of option 2 is we could drop CLK_OF_DECLARE_DRIVER().
>> We could even do the same in for the other SoCs, which I suppose would
>> avoid a fair amount of probe deferral.
>it would be great, indeed
>but this will only work once timer initialization and SMP boot can
>happen at a later stage
>
>If the clock controller registration fails the board won't boot. Yes,
>cleaning up memory is good, but in this specific case it will add a
>couple of extra CPU cycles before the kernel is dead
>So, if we want to ignore that fact then I agree with your first option
>(undoing things the "old school" way).
>

Hi
I am not sure whether my understanding is correct. 
I feels that the failure of our module can not block the entire kernel from starting. 
Maybe we should throw an exception, clear the status, as "old way", 
and continue to execute the kernel.

And if our module requires that the kernel cannot continue to run when the exception occurs,
then we do not need to return in the error branch, also we do not need to kfree, just BUG_ON().

Regards,
Bernard

>Martin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
