Return-Path: <SRS0=a8bK=FL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849A4C4167B
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 13:44:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 257BC208DB
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 13:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 257BC208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iVB5KGLSUQ+IaMJSxx1W3WroeIWE66p1Bk0UCRK9BbA=; b=CNtGHHvSttCIjrk8pWsIkumr4
	6UFg6cOC+nGOUAohRl1uhrTI28e/6lTR6nNV/9NBfqTEQDMQ6r2HCkwNvRP5xxU/jE6NqHfKYq2yl
	LrJiI8qVUfWjcvPbM5RXnmAq5XToOZnk2wxTjZx8zx5XuWaDkOArQBeTw/TYR3GO4b1NTywR8XKN/
	tmMvK2MC3tYds0xkBv/49c8Vpgsq6ZVP1cy2M2wCRrjTj9pSY56bcjlw4eDAc0OpeCL4ZePSiu2NW
	2DnflTKNO6FcH8vrIBGxHCnpv5VKsaXYQLdn2FYuy1Yzn5Dh5OPkWoHsfS+AZk8tQCM5OmvpB0iKW
	WyCbHElXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmGo0-0003Px-Jt; Mon, 07 Dec 2020 13:43:56 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmGns-0003L9-Na
 for linux-amlogic@lists.infradead.org; Mon, 07 Dec 2020 13:43:50 +0000
Received: by mail-lf1-x12d.google.com with SMTP id u19so18143513lfr.7
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Dec 2020 05:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gP0uJhQTgF/+63+6gB2l+pnsCV2YV5kIdg6VVuH/EPg=;
 b=wIwEnnsZNQshljsYBE4lem1wlantjPxjdyfhvVc5xSyfwo/p1r3xY4FFmPmRbkP3Ji
 TDPOtFp7oYMFl1jRnDGJRFvwN6eNJvWA9YMsEQUzwT+c26CRjCY03kenMQSZV5D7uKAy
 oOgEBb/0wcKQZWP2BoYXl4f5ifuyJLym4cMeY94MgOo9Pj3Rab7X/5dkEirUjfA1paHE
 8tPdH4aToNawRR7X1A4J+0NWY86ZbfcwMW18bAi6WNUAT/3xGwfvLnCbbLQzGctEH+PE
 0dOEnClsuG/3DQ585xyUwWTDbpFln1ceL4kyoMfP4Y3CtmjkaZsFJkW4U6rrSIJ+pG91
 H9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gP0uJhQTgF/+63+6gB2l+pnsCV2YV5kIdg6VVuH/EPg=;
 b=SA4sragFEtniDGlFQVHh2OAdoXNFV6W/3Vu9cARszhstPJLCPG33TAgeH1kJS2RLLx
 n8htqyLJln/g6y3ztR9rC6JO+246OnkKXd7n4Kpn3Onc+iaiDSbtHRoUF8dNMJxw0INR
 JBZDHPCMKxv82FY09i0pbRkVq9sWtXpXrSJTY8Ff8vn3hSxFrtWQrTyQJr6OcTF4H4XH
 qMl4pinGvrIqXV0G3MkRrfneBok9LMMXI13kH0j/rbGgvcun/U5XK2LTdGpuDp0Td0p6
 Gt6TEGnXL+p5bv/VbtWGj8NGgrqhkw+G76TfJAQUTUxZ6xnB4SrXJIDWMiD9mLIgIQa8
 JeEg==
X-Gm-Message-State: AOAM533qj0LWRmMMknrHt2EBIIT1Ki59BWTBzNU3hFAkQSdpO5LJ3C3S
 uhMgCuVyu36+16ayRBVZsU/8jxewyaT3NW75sgSo3w==
X-Google-Smtp-Source: ABdhPJzLSJLiAu+AIBChoSsaNDZ5Zux7SKhh0tTGmJJ86OXT69+jxhMioDzwzNkdyd8WY2fO4ut19U3EPJxorUBCyMU=
X-Received: by 2002:ac2:4308:: with SMTP id l8mr7872928lfh.260.1607348626724; 
 Mon, 07 Dec 2020 05:43:46 -0800 (PST)
MIME-Version: 1.0
References: <tencent_220963AF059847E1171B4AB9@qq.com>
 <CACRpkdbvKWcD04SLLBOBuZWzN64xpVv1nfCXZGcSp9cs0MPivQ@mail.gmail.com>
 <1jeek5ps3b.fsf@starbuckisacylon.baylibre.com>
 <CAHp75VeQGxnGO4o5a1vFzS9XAMjmvwoJ3=pWLvNQT6mXEKcqWQ@mail.gmail.com>
 <1jtusxkh6v.fsf@starbuckisacylon.baylibre.com>
 <CACRpkdZmM3GK6mebmm6nT-XXfdTB5KGwArAFk-1Gx6noZDxVAw@mail.gmail.com>
 <1jr1o1katc.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jr1o1katc.fsf@starbuckisacylon.baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 7 Dec 2020 14:43:36 +0100
Message-ID: <CACRpkdbZxPwGNF427T85hmNHw6ncnYExKmXzLJM1rq8FCZOpxw@mail.gmail.com>
Subject: Re: 0001-add-amlogic-gpio-to-irq
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_084349_085243_C789EF2F 
X-CRM114-Status: GOOD (  26.42  )
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
Cc: narmstrong <narmstrong@baylibre.com>,
 "martin.blumenstingl" <martin.blumenstingl@googlemail.com>,
 Marc Zyngier <maz@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-gpio <linux-gpio@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, khilman <khilman@baylibre.com>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?5p6X5Zyj5qyi?= <linshenghuan@hangtu-china.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Dec 7, 2020 at 2:25 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> [Me]

> > So maybe the problem is that you need to go back and think about
> > updating the DT bindings for this thing to include interrupt-controller
> > as well?
>
> We do
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/irqchip/irq-meson-gpio.c
>
> That's actually the only thing we provide, on purpose.

Aha I see now.

> >>  * We only get to know a mapping is required when gpio_to_irq() is called
> >
> > No that callback should not be used for that.
>
> Agreed ... I was trying explain why we did *not* push a patch similar to what
> was proposed here, or use gpiolib irqchip.

The gpiolib irqchip kind of suppose there is a 1-to-1 mapping between a
GPIO line and an IRQ, so I see the reasoning. That said, the callbacks
are code so a deviant remapping irq line "pool" could possibly be used.

> > I don't quite understand this. Do you mean you are bombarded by pointless
> > requests for interrupts that will not work anyways?
>
> When we tried the approach suggested in this patch (again I agree it is
> bad, which is why I'm against it), some drivers out there (I don't
> remember which one TBH - that was 3 years ago) parsed the "gpio"
> property and tried gpio_to_irq() and if it did not work then go
> something else (like polling).
>
> However the allocation stayed behind. It does not take much
> "bombardment" when you only have 8.

I don't see any problem with gpio_to_irq() always returning -EINVAL
in situations like this.

> We control the ressources of the devices through DT, not the necessarily
> drivers (which may be generic)
>
> Some device needs the gpio, even if we don't want the irq.
> We can't always prevent the driver to try gpio_to_irq().

True. But you can say "no" to anything trying to do that, that way you
will only hand out the irqs on a first-come-first serve basis to the clients
that use the irqs directly and thus you get it under control.

> This why I don't want gpio_to_irq() to be enabled on this HW, because it
> would not be under our control anymore.

I think you can enable it and use gpiolibs hierarchical irqchip but let
gpio_to_irq() say no to everything.

> Again agreed. I'm really sorry if I have been that unclear about my
> motive here. We already had that discussion 3 years ago, I totally
> understand your point and agree. I was trying (and failing) to tell the
> author of the patch that this approach had already been discussed in
> past and that, unless gpiolib dramatically changed since then,
> gpio_to_irq() should be used in this way and he should use irqchip we
> already provide.

OK I get it.

It's just that from my point of view using the hierarchical gpiolib irqchip
has a value in itself even if gpio_to_irq() isn't used at all because it brings
the criss-cross under control.

If the author wants to get some driver to work, such as MMC card detect
or ethernet phy or similar, what s/he should do is to go and fix the driver
to ask for an irq directly from the platform device or similar if it
can't get an
IRQ from the GPIO line by using gpiod_to_irq().

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
