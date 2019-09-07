Return-Path: <SRS0=mB3M=XC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05ADEC43331
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Sep 2019 14:58:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C51E62178F
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Sep 2019 14:58:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XIxM4H0N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="C7nRy5n5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C51E62178F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WWGDPsatZJVgyc8jFqvqfuLhgCDpjohSoXsm+TojUlQ=; b=XIxM4H0NYzOwjk
	TZh7Hp8czXSOMpOVifvjW4kh9Ok+c9wuyFebWDVbL8eZ24Juwn/27Z6sT/QY0JM/BgOXZiVGg0pCK
	u09BkCalNhUbRkImcPhOhOMeKq9EMlqMTP0RpPrfIy+Ji4x7xiyKKUjmnoAjUc1pWhKQLJVm48wSw
	GF9HRigdT7E6hjRJoCHnKyB2er6EuOseOg6HZ8ZJrT9OPCf2vAiEWVEoIR2JqihdQD7Iyo0CjLyDv
	IfGEy8K6zYh8f1zqTeJYMniadzXNpSNdbQkVO78RAgQaTW9wKRtcrBlHN4/RYtcNc48Ywl+L3RV7Y
	xS8+j1F52CKV/jR733sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i6cA6-0001gG-1U; Sat, 07 Sep 2019 14:58:02 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i6cA2-0001fw-Da
 for linux-amlogic@lists.infradead.org; Sat, 07 Sep 2019 14:58:00 +0000
Received: by mail-ot1-x341.google.com with SMTP id s28so8516361otd.4
 for <linux-amlogic@lists.infradead.org>; Sat, 07 Sep 2019 07:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3ijvzbpmR5G2fll0xuJrHpgiM7/NRRmoNnpXQj5BVhY=;
 b=C7nRy5n535icRoS3rB9/NmeOtjPXKbk0qSin6HVYDA0bZsXSAmiHaMJhL8ocVPNQQn
 OXS7I/CzyleoB5auAIaP3uuZ6B+BN9O7pnpquLTyWN4lWXDAc8/WdDJ3bPBl2ej7iZ19
 68eu1qRkA416WhzgwUGM1614l1v0op9qnxFctGtyMuqedRleI56ezVd+W9RJb5e/HjqU
 s4yEkNHuKe2CleZSLhFbYd7CYUDy+pUep6de1glV3WC9WxQLbDfiMrTZe76OGwszQx9v
 lKndSynIWHegi+v56Xl1hrz/kMWz0LbWhuuMq7KkRlE6NHQNL6Ev/sjG0yTWytPgw22L
 dMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3ijvzbpmR5G2fll0xuJrHpgiM7/NRRmoNnpXQj5BVhY=;
 b=h8jCwfhPwdcGtlhjZW39JQagSSwN5rXiio2bIrFF4H8rvhS3JxfUacGa27MXPfNfLa
 KIohVNk18uv0sARyqiamdV6HFeVbG0xIo0PvTky6QkjZugiYux18omDukmPvSqaIUaw8
 KJSR5Vo2pSVBiWxsaIi6i5vZop4UCrBCSXYkvQ7koe+ZVr9sb1Ce7NI2onWCfEFY2mgW
 wVhmrjbJbzNY30Ff27/qlExoGR5a10m2yaoVml9ql8pZsJLPgBNkdKUmjYYFNFFuY6n3
 1cO8fDNHNElm0KFv4+/97FJzuld18o68PBPPVUWqgYleqHmHit+4mdEDWBx8YrEWgTuE
 YFMQ==
X-Gm-Message-State: APjAAAWSN4oiwIvqBfw45B76sXeIegvINwXJaEJUf+0/X//DmYdUwhiv
 u8uYrqK1kpjcn97ILOQOry4kqhNG7Wqn8zZ4fy0=
X-Google-Smtp-Source: APXvYqyHbQMJm+9MOanyEl2hZx9Q+JSw5joYtqNW6gQXujzue+BDrbxrLE31fAkmbkxFu5AiwCr1uSq3RWcgMwevqEY=
X-Received: by 2002:a9d:12e7:: with SMTP id g94mr10290698otg.6.1567868276771; 
 Sat, 07 Sep 2019 07:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <b99e39ce-30b9-4def-3b98-eb463e5ae57d@gmx.net>
In-Reply-To: <b99e39ce-30b9-4def-3b98-eb463e5ae57d@gmx.net>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 7 Sep 2019 16:57:45 +0200
Message-ID: <CAFBinCBV+5g5tgHs99U2PaUH8RP=WKQJrRno5LLWy-=J4TTAwQ@mail.gmail.com>
Subject: Re: [BUG] wrong pinning definition or uart_c in pinctrl-meson-gxbb.c
To: Otto Meier <gf435@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190907_075758_494679_9A2E4E1C 
X-CRM114-Status: GOOD (  12.50  )
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
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Otto,

On Thu, Sep 5, 2019 at 1:49 PM Otto Meier <gf435@gmx.net> wrote:
>
> Hi i tried to use uart_C of the the odroid-c2.
>
> I enabled it int the dts file. During boot it crashed when the
> the sdcard slot is addressd.
>
> After long search in the net i found this:
>
> https://forum.odroid.com/viewtopic.php?f=139&t=25371&p=194370&hilit=uart_C#p177856
thank you for doing research on this...

>
> After changing the pin definitios accordingly erverything works.
>
> Uart_c is functioning and sdcard ist working.
>
> Patch attached
...as well as going the extra mile (writing a patch and submitting it)

your patch is looking good to me apart from some small formal issues:
- some typos in the commit message (int -> in, addressd -> addressed,
definitios -> definitions, ist -> is)
- please add the following line above your Signed-off-by line (to get
your fix also into -stable kernels): Fixes: 6db0f3a8a04e46 ("pinctrl:
amlogic: gxbb: add more UART pins")
- your "Signed-off-by" has to be in a specific format
- patches must be sent inline (not as attachment)
- the pinctrl maintainers are not Cc'ed (so they won't notice this patch)

here's a simplified version of the patch submission flow that I use:
- (change the code)
- git commit --signoff (give a good description why you are changing
things, include a Fixes line if appropriate)
- git format-patch HEAD~1
- run ./scripts/checkpatch.pl 0001-*.patch (fix all checkpatch errors,
"git commit --amend" the changes, then run git format-patch again)
- find the email recipients with: ./scripts/get_maintainer.pl 0001-*.patch
- run: git send-email 0001-*.patch --to=<maintainer or mailing list
email> --to=<another maintainer mailing list or email> --cc=<more
mailing lists...>

feel free to ask if you have any questions


I'm looking forward to an updated  patch!
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
