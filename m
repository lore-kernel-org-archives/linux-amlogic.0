Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B41C43334
	for <linux-amlogic@archiver.kernel.org>; Sat,  9 Jul 2022 20:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=J8CWe1o/5VloJU9MkP3bwpeOiaRlDu0o0JAdqBlUO84=; b=vqv
	ikemwllThnClFxQFDxMskm2DuI8iEQh9//9OTpYkrTsz3wYpQ+7xlhND72bx1+9UULTgfuO9ZjpHt
	AUrQM4fakXHuxa9CbUNK7QG+vqm0lTa/dU8kYXJR0k5CpPyDmlMjvMMOyidjXyuP4gvhs9oYZt3da
	sq1OYT7ZNlJsBWSHeK22lZ+/d53OXsv1Y0qZCAZTiNF2193W6mcSV3FeSFL+5GTE1sA4qrM9IGK09
	nXZYRbH2GUvgHZiPoRrU/vpDVTxG89k+AL4B6qv1uNG3jrxGkFSyqON9Z1rxz8AGoKpS5sxXOKZuy
	fj/0c9e7tZLhZNTpC+JIzcVcyzthNzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAGr3-009Fjk-2X; Sat, 09 Jul 2022 20:15:05 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAGqz-009FiC-N1
	for linux-amlogic@lists.infradead.org; Sat, 09 Jul 2022 20:15:03 +0000
Received: by mail-lj1-x229.google.com with SMTP id 19so2087096ljz.4
        for <linux-amlogic@lists.infradead.org>; Sat, 09 Jul 2022 13:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=XCKvgdakwuVZnQHlmluz1ab7BHcachJR1RqZJvjEEv8=;
        b=pFm2Jn0lkC/Wol0KEZzwJ+8I09eG3huwEDZJTsoLAXNFlQ+/PPp/wv7KFA/044x83z
         4bWUOzhJ8KbYGIikHfp75/hym7siv6knCUXpx9+6Ihmvxf/NCQ9JeORrpcPJRSTkCMQq
         s/7dhDhOtXBsvl9k/Hj7uiIMxWNpNKyjlyjfAq4Ot3/qJ4fCbb1T+GIRvakBah/aDP/n
         1jE2UhmdHrMVzrwajqPLOsQt6HqMK/cgjH87AhDjXkGF+yt/Q4KbzQ5zPn1T2CHHP1KB
         OMsSOoikGJn4xZhVHfDXsrBTtydLZGtYBm5od8NLuvExudPMdlglXFZgumVKypf/1Z0o
         Gs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=XCKvgdakwuVZnQHlmluz1ab7BHcachJR1RqZJvjEEv8=;
        b=cbGTmWRrbWfiTfjBK+k7egudwjY3ybO4LjaSWEAxBow2RSwVX8QM5D6B7u7r23BQRF
         1tL/YwOKx8KwfN4bwTOcPo7voRlJeq86ky9+Ra4I0BBWCYLVHGjRObqMwYzqHBqakCBv
         VnHoKCmYpGwgxqSBTm6g9xI/8fJ/T7iKZlqCDKF2M+P1ls6IauxcGMSvqvBTgTwe4gBe
         Ht4Vc5F5jH20lBy/HJxmam5DD7H7w8ZxpmtlDfyx/QU2JwAced155WqvlMn/hWxIA5j0
         oKWcYArTFrwEc5ZYiEPMtfM1YUPhNTgg7vMFb4+We0GIaaiWeec64cTuHbibQlmO8Phk
         Jgug==
X-Gm-Message-State: AJIora/Pjz4RFI/MHlNUNh8PccTuQGp+wH9YRwWsDqSqCyansoPTed3q
	TnxaDJa+C7XuF/900KSjUVM+dM1aMBpY4+Eh4DTvtmRSomY=
X-Google-Smtp-Source: AGRyM1vRIfcrNv9nUJhcdazJUZiaR4PSb4lxwLPZQOPhtSoVg6ROQr2ElJD6fUxs9MYQWRtCM3d9qT8nW/vGSWtXqrY=
X-Received: by 2002:a05:651c:243:b0:25d:5b44:197d with SMTP id
 x3-20020a05651c024300b0025d5b44197dmr4541570ljn.516.1657397698964; Sat, 09
 Jul 2022 13:14:58 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Peter_H=C3=B6ller?= <drmedvet.hoeller@gmail.com>
Date: Sat, 9 Jul 2022 22:14:45 +0200
Message-ID: <CAJgPF1+b+=iaxE_RkAY=zG7y=PeEZ8r-2A6JSvNQbkTtHBUVAw@mail.gmail.com>
Subject: GPIO dynamic IRQ handling for AMlogic
To: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220709_131501_766187_60C47DC2 
X-CRM114-Status: UNSURE (   8.73  )
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

Hi,

we are working on an Odroid C2 rev2 (S905 AMlogic) project for 3 years now.
While upgrading to Kernel 5.16 we stumbled over the issue that there
were only 8 static IRQ availabe for GPIO, so you get reduzed down to 4
I/O-pins, if you use them with edge both, rising as well as falling -
if you set up the IRQs for GPIO statically.

Referring to your post
http://lists.infradead.org/pipermail/linux-amlogic/2020-July/007684.html
from Neil Armstraong:
<<
The only available driver for GPIO interrupts is irq-meson-gpio and
should be enough for most of your use-cases
if you pass the GPIO interrupt as `interrupt = ` and `interrupt-parent
=` as we do for the Ethernet PHY on some
boards.

>>

we completely understand there is no out-of-the-box upstream
compatibilty because you are loosing kernel's compatibilty for other
boards. But as we are using our kernel only for odroidC2 only, we
wondered how to customize it correctly:

So we need information as foollows please:

1.) What are the IRQ-ranges availabe for GPIO of odroid C2 working
with Kernel 5.16. Unfortunately, we cannot derive that information
from anywhere else.

2.) we would be verry happy to get further syntax information about
how exactly to implement the mentioned  'interrups =' and
'interrupt-parent =' in the DeviceTree with the correct IRQ-ranges.

and 3.) How to correctly declare/announce the GPIO-IRQs dynamically in
the DeviceTree (syntax) and, if so, which corresponding syntax-changes
are needed to be done where in the driver 'irq-meson-gpio' to make
this finally work.

with kind regards and many many thanks in advance

Peter

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
