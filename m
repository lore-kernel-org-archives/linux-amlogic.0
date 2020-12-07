Return-Path: <SRS0=a8bK=FL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37382C4361B
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 12:34:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF510233E2
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 12:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF510233E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XOgz7Xe3s1kqXh2jU/XUNGagaZWWshT9vU+sUnbovZo=; b=TuFvG0Rwm4BfFMtfZp0HB1/TT
	VuFoJXhZNm7FsDGYJ1xjg8/EFvjy8AsS/wC75xlKLQgulCnnxl/2uRAwwurkaHzEVeVPZnQaTJy0P
	pAgzcZRMC3Z7p56nayC2Jp5dtb+9evBWdmSMiDGkTfI4m7YCPPCBdhSq/xT3r3wUyyppOjIVCtdtq
	jRxrzs2U0cush+oYceCyiCSGJH9rPuOAoMVPuZMVMenfOvrLsy8Gbc70eM6jKYXdhoIqvNuJrTROZ
	ZOKUQzC8reGp67flAN/H7uQaKsUucDuIrqKxGfzJv5jqEpPk8wKBfAuDjOtLjkosBwmkaumqNnhhQ
	fTHtV9bLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmFiy-0002TK-UN; Mon, 07 Dec 2020 12:34:40 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmFir-0002Pi-8M
 for linux-amlogic@lists.infradead.org; Mon, 07 Dec 2020 12:34:34 +0000
Received: by mail-lj1-x22e.google.com with SMTP id t22so14798704ljk.0
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Dec 2020 04:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=boKMjDjJa5tRLm1VPCUmtsYmlC2fesJJoaLCTYk8EUo=;
 b=XRCkYUCdOmvRRAtRW3hi67kI3cSeDfNcypHvLS8jdjZZe/bAI5psCeUuTET6Ap9u/a
 5vY1eRHmi2x5zg4MXni5dltguovscn5Vx3S8VYcRZaFkS6Xh6yKIhlvAz9GaKMKYZ2jL
 bypClOGEwkbSDSCtYJUpOdXlkMHCfpDbv5lgyAMEqIRY6tCKHpMjxBMym9nMiaNZpZ4r
 qkGb4ZLSq7dUPqVo0McnPOil2TXOvm33hPJK/S4rEnAIB7HVJ2nl+1UdMreUuvqDVSgl
 bAs2J7FdEnjl0ku+0IfuhgiDcU/fYPx1YUxP0BS5VEkva4tHgDXe73Iv5BD+lKX1cXYe
 hkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=boKMjDjJa5tRLm1VPCUmtsYmlC2fesJJoaLCTYk8EUo=;
 b=nHjrat47MfV5TsghSaeQ7U7vKeeNLXvjV7eO4+c98O0ea/QH19MdRUtf33mh659+A0
 x7yKMhzx/wiBAfSVoCPrGnhc49hjygDRESFhvbGboefy9r3kFuojDNVu802BzDpYS4Zb
 p09ouDapwXO2zCqnQSHCoIpjZZk600pm5WVJU9pOls7KSh/bMgL5XHuuvmzpLxbafSQ5
 B992g5biodGVRmYiIQzw4A16n/OvVTgEyKTTgTp3GDwu9Yx4GQxfbUlP2+yk6Z8I3Ewf
 6JwShdUGX0ejbQ6BnwPQpDTVHRaWH/Idq5otENBoqnKC/HEzvDgaAhg/g0IWXNMTb1dr
 K+Cw==
X-Gm-Message-State: AOAM533P/99yH9QYNmhcTSD+Ftm4oLf0sWUmF4wrLXpF6FpBp0Y2VaBh
 a22BoqD38QHPveNIugyN6IYfcK5xNei8x5Q7TJzF9w==
X-Google-Smtp-Source: ABdhPJxCMdxWp9BFOclJM4l0os50hx76oBCQDWSP9Mz1ISgEte4ORw7PcLsLj6UH4DkqJ6zlcpFPOuTE9rfLfpwTh4Y=
X-Received: by 2002:a2e:321a:: with SMTP id y26mr8487351ljy.293.1607344469350; 
 Mon, 07 Dec 2020 04:34:29 -0800 (PST)
MIME-Version: 1.0
References: <tencent_220963AF059847E1171B4AB9@qq.com>
 <CACRpkdbvKWcD04SLLBOBuZWzN64xpVv1nfCXZGcSp9cs0MPivQ@mail.gmail.com>
 <1jeek5ps3b.fsf@starbuckisacylon.baylibre.com>
 <CAHp75VeQGxnGO4o5a1vFzS9XAMjmvwoJ3=pWLvNQT6mXEKcqWQ@mail.gmail.com>
 <1jtusxkh6v.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jtusxkh6v.fsf@starbuckisacylon.baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 7 Dec 2020 13:34:18 +0100
Message-ID: <CACRpkdZmM3GK6mebmm6nT-XXfdTB5KGwArAFk-1Gx6noZDxVAw@mail.gmail.com>
Subject: Re: 0001-add-amlogic-gpio-to-irq
To: Jerome Brunet <jbrunet@baylibre.com>, Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_073433_524619_1A678A2E 
X-CRM114-Status: GOOD (  23.21  )
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
 khilman <khilman@baylibre.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-gpio <linux-gpio@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?5p6X5Zyj5qyi?= <linshenghuan@hangtu-china.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Dec 7, 2020 at 12:07 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Mon 07 Dec 2020 at 11:18, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Fri, Dec 4, 2020 at 4:25 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> >> On Fri 04 Dec 2020 at 10:13, Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> >> This HW only has 8 irqs that can each be mapped to a pin. No direct
> >> translation can be made, we have to allocate an irq to monitor the line.
> >> So when gpio_to_irq() was called, we had to do that allocation dynamically
> >> to return a valid irq number. Since there was no counter part to
> >> gpio_to_irq(), those allocation cannot be freed during the lifetime of
> >> the device.

gpio_to_irq() is just a helper really and should not really be used to allocate
anything.

In device tree systems, the GPIO provider should nominally present itsel
as a dual-mode gpio-controller and interrupt-controller for example:

                gpio1: gpio@4e000000 {
                        compatible = "cortina,gemini-gpio", "faraday,ftgpio010";
                        reg = <0x4e000000 0x100>;
                        interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
                        resets = <&syscon GEMINI_RESET_GPIO1>;
                        clocks = <&syscon GEMINI_CLK_APB>;
                        gpio-controller;
                        #gpio-cells = <2>;
                        interrupt-controller;
                        #interrupt-cells = <2>;
                };

The GPIOs are normally *not* translated to IRQs in this set-up. Rather the
interrupts are requested by consumers using request_[threaded_]irq()
which means you should be using the irqchip callbacks such as
.irq_request_resources() and .irq_release_resources() to allocate one
of the free irq lines to use. These will be called at the right points if a
properly written driver requests an IRQ and when the driver is removed.

In some rare cases gpio_to_irq() is used because all the driver knows is
a GPIO number and it want to try to obtain an IRQ for it, and if a 1-to-1
mapping exists it returns this number. This is not the norm, but the
exception.

So maybe the problem is that you need to go back and think about
updating the DT bindings for this thing to include interrupt-controller
as well?

>  * This HW has to create the mapping between GPIO and irq number
>    dynamically. The number of irqs available is very limited.

This should be done using irq_chip callbacks.

>  * We only get to know a mapping is required when gpio_to_irq() is called

No that callback should not be used for that.

>  * There is no way to know when it is safe to dispose of the created
>    mapping

The way that is done is when .irq_release_resources() is called.

>  * Some drivers require a trigger type we don't support. These will create
>    mappings and not use it because of the failure when .set_type() is
>    called

I don't quite understand this. Do you mean you are bombarded by pointless
requests for interrupts that will not work anyways? Then do not assign
interrupts to these drivers in the device tree. These requesting devices
and their requests are under your control. The drivers should be able to
back out and work without interrupt if request_irq() fails because it
can't provide the type on interrupt you want:

int irq = request_irq(irq, my_isr, IRQF_TRIGGER_RISING |
IRQF_TRIGGER_FALLING, "My ISR", cookie);
// This results in .irq_request_resources() and .irq_set_type()
if (irq < 0) {
   // Oopps out of IRQs or couldn't support double edges, bail out or
use polling
}

Just do it like this (you might have to augment your drivers) and you'll
be fine?

> To answer your question, there an API which lets us know a mapping is
> needed, but none to inform that it is not required anymore. The GPIO API
> was not meant to used like this. Not saying it is good or bad, this is
> just how it is.

So don't use it?

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
