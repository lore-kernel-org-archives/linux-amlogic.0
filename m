Return-Path: <SRS0=4IOV=6L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D429C4CECD
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Apr 2020 18:36:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EBF020B1F
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Apr 2020 18:36:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rVpnLnzV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pXUgT4BB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EBF020B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MmbX1NthiWt70F/N62MiPS6VjLNbBIAY4D8zr//tDWQ=; b=rVpnLnzVGLTV1W
	RG3aKYkm76Pe6hwtkPfqcXZvRiW/9IWofR1//LwB2T1M3rDTTiB8hJAfMNgVy8rBHmN2Q/dEnrzGr
	1VOyuntYWVLu6bamuSp2j6/8EvCjS3bmeuj1vIflAgQPQ1CT5mVP3wXvuS2fbWq7IGxBNC4A7LOpq
	bIsK2a2SgFEHo232yh1c1vEmlWevlf6o2Tl+s1RRhqbJtqKeT+pfXCSpFrDrALIevBec/YRhDOGgK
	tvomcZ6mYLqajxVOAtOy+dXZ0MDktnn0OJwRlTxS0Swv1wcHxVhXPmx7WTgJMmMnFBcykp5K4oOTZ
	KG30Pss89YIYH4APTZRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT8cC-0000fh-J1; Mon, 27 Apr 2020 18:36:24 +0000
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT8bs-0000Im-Aw
 for linux-amlogic@lists.infradead.org; Mon, 27 Apr 2020 18:36:06 +0000
Received: by mail-ua1-x944.google.com with SMTP id g35so6854236uad.0
 for <linux-amlogic@lists.infradead.org>; Mon, 27 Apr 2020 11:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1xM9QjmpwYbkisRgg+9m3KKxSIRNSU7Z5AW0CFZxADU=;
 b=pXUgT4BBYjU7eXZo207JUZsU3pUdyE9dKL1mF7Do3uspZf/cO+6wRg05YOWJXZlkv/
 puy1OMkOOUYSmFDCdqg8foPpc57v7YjCzOt1JLFdijuOk+hddZ0gpu+qAh94YKsLoBx1
 R1n5j8CA7M5whL2MYKKdY2mOwGrpJ6wFY8fJtsQ7t7qY8VA3zRsXPKrpOc0XRZcC2SGH
 hjpbfKy036pJGTb35GPecBbKXrZ9f5pkpxEIbddKQokLimKOD0OF3GGUGwm1uShb4UhF
 jQcXmVBRDeVhh9kFLIEFicwnPvbC/YariFA5TYc3Di9PRAI1TtRiJj2V5UxgFusegIln
 x3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1xM9QjmpwYbkisRgg+9m3KKxSIRNSU7Z5AW0CFZxADU=;
 b=c3w840DCYz2FgO+VugyA6yiFjGm0E7SuphXNFSvaLm+DpwA7RXFqwyffG85ew5LNkZ
 hsQ/rPCCdszVnZsqFPlDiPMc8QPqthWnnAeB9fsRPz1IGiXM1BDydWpY96OpKTGRl8tY
 AJb+8ZWv7tb4HGGRomR9oBozRfZmUrC58G7tJ21sQhKFdJYJRyj5y+i4ihq1A64GuPMp
 iQKqm12gexyqw71H963EKUCCYFL1I36Xr1G2UNnHV/xO8zVWMJnMu7l1IB6BxMSkrB6f
 5t+t+j+gDGv9Aj17jm3sWKuDPWL9V4pFy04UDgYhK5nW+RduImGj0ZVAcK3hwdaWBaF0
 oqbA==
X-Gm-Message-State: AGi0PuZjbnKE3Ixz4XlmbEwsqAYfdkf2ob+Gl6/xLCKdf4GUveM3wXWA
 XIFiYcQWDK9gu0+GHDslWVHa8Q5S79YiUHpue2BZ1Q==
X-Google-Smtp-Source: APiQypJNKdwylcthlxM+njJYVD9XtTTnPk4q1j17763v7R71x0bAw3EsHZ45/PbN0eX4zVscCJdVfvic8BQcRqzaqIM=
X-Received: by 2002:ab0:6588:: with SMTP id v8mr18411294uam.100.1588012562614; 
 Mon, 27 Apr 2020 11:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200328003249.1248978-1-martin.blumenstingl@googlemail.com>
 <1jblnd2tp3.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCDzNw6nV3oBJs6C0sssW61GERBXq39DCM22BT9zS8M31A@mail.gmail.com>
 <1j8sig3mi3.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j8sig3mi3.fsf@starbuckisacylon.baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 27 Apr 2020 20:35:26 +0200
Message-ID: <CAPDyKFrYNmCtX3KHaE1vw4rT45WdsUWKqOaJ43rJCKwsnY4PCQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Amlogic 32-bit Meson SoC SDHC MMC controller driver
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_113604_924391_A31DC61B 
X-CRM114-Status: GOOD (  24.14  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 yinxin_1989@aliyun.com, Rob Herring <robh+dt@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, lnykww@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome, Martin,

On Mon, 27 Apr 2020 at 18:46, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Mon 27 Apr 2020 at 18:23, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
> > Hi Jerome,
> >
> > On Mon, Apr 27, 2020 at 10:56 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > [...]
> >> > Changes since v3 at [3]:
> >> > - split the clock bits into a separate clock controller driver because
> >> >   of two reasons: 1) it keeps the MMC controller driver mostly clean of
> >> >   the clock bits
> >>
> >> If the register is in the MMC controller register space and the MMC
> >> driver is the driver using these clocks, it is where the clocks belong.
> >> I don't get why it could be an issue ?
> >>
> >> Is the clock block is shared with another device, like on the Gx family ?
> > no, it is not shared with another device (to my knowledge).
> >
> >> > 2) the pure clock controller can use
> >> >   devm_clk_hw_register() (instead of devm_clk_register(), which is
> >> >   deprecated) and the MMC controller can act as a pure clock consumer.
> >>
> >> Why can't you use devm_clk_hw_register in an MMC driver ?
> >> Unless I missed something, it is provided by clk-provider.h, which can be
> >> included by any driver.
> > indeed, I could use devm_clk_hw_register in the MMC driver.
> > Ulfs concern was that a lot of code was needed for managing the clocks
> > and I agree with him. so this is my way of keeping those details away
> > from the MMC driver and have two separate drivers which are better to
> > understand overall.
>
> Martin, Ulf,
>
> I understand that CCF code might seems verbose and I'm happy to help
> review it if necessary but I don't think every driver out there should
> register some kind of fake clock controller driver everytime they wish
> to use CCF API.
>
> Yes the it might make the driver code cleaner but the overall
> architecture is harder to follow.
>
> CCF was made so driver from any subsystem *may* use it. Creating a
> controller for a single register is overkill. The HW architecture of
> this particular device does not justify it.

I fully understand your point and I agree with it.

If I recall correctly, my point in the earlier review phase was that I
wanted the driver to be nicely split into a clock provider part and
into a mmc host driver part. I also raised the point of using
devm_clk_hw_register() rather than the deprecated devm_clk_register().
I still think this makes sense.

That said, perhaps a reasonable split could be to have two separate
c-files (one for clock provider and one for mmc host), but both in the
mmc subsystem.

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
