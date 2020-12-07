Return-Path: <SRS0=a8bK=FL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA64C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 13:25:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7418923331
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 13:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7418923331
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F3bLwXBCBmHdYF+6CrXeUugCuUQvRvmZZ6d+S55bTuY=; b=KWhJYBfhxRgI/BPiUqYwteAKG
	xS6DfjFJPDUH5OtDtF2oEQiV/5MJDQVgtE8u6vmCMJhKF5q9MvD/Ur68xjD5PR8Q77IfIRnoIkPli
	c+KL/nD0ydLpQWu99pvse1GgwIGO3Ol9LKuAIzzwRZz76j8tpzP+8b7MXsq4eXiY0gez1nLhN69sV
	Z/KwpWueGsbff3o5axMnshuLJbmN8lE5AGZHRza/t/rNf8E3Wn2knFhuepx1FL66zzXWXsn+vo1D7
	jjRCK0DaaFn5UX2Yo7aQug4kiX/g15kcxzHKhkPyw6duU1WgIgqVG7GShrwzFcmrIsZ27Ovq6I+mG
	+oj8H3cXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmGW8-0006oX-3v; Mon, 07 Dec 2020 13:25:28 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmGW3-0006nJ-SC
 for linux-amlogic@lists.infradead.org; Mon, 07 Dec 2020 13:25:25 +0000
Received: by mail-wm1-x331.google.com with SMTP id w206so9559272wma.0
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Dec 2020 05:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=saexyCJf1GbqWUkiP2yMQP3x3pHqTsfM/ykC2r7v4yE=;
 b=GnkapeRVF5Nkadd2mPkjPfgvA2XcIFLcl5ecBTO8innbDyqonlubd1adXncBQ4QqN1
 2/HhRJcHLErWRxS5DlCrDG8kU8BbPxh523SoUHdmuZH5Dt0tPOS96eYKvMuv3a5mFDOU
 We2WuGHdxRRNDgvI6RBld6jYoWMMxNIJXvKjKEG4S8ARaQJR5q9P75IQPkSQoCbA39Pc
 gDnmmvF+GPK4he2i6D9b5Z4nuJl9KnLpzHOkBQrmUJ2blQmvWgiT0Tj6XXiT1bwLdh1l
 E7YfFD3GE74HTMu+g898b+FfPKjaFfB9lY8CW+ANp+0tdWNsw7zei/ueGfqcIYIjz0z1
 KyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=saexyCJf1GbqWUkiP2yMQP3x3pHqTsfM/ykC2r7v4yE=;
 b=FUlgznP5UR7xW1kljnMRGCOFsz0JBE4NHGJcGaPWPrXR9isk9JEkR1qFOKWz0JvQwt
 IkkV1IxgbLilcATNCzmIk48Az2qUvdM1w0bNz9CUSIrcCDl0oljsQPqRkK/7IcxKH4zv
 NfjMSIWYcUi1g/5cgn6079ujlF/U6Sb3N1zIxhWaVww1iklqJMwGkKdHtk+bUhf0zCNr
 e6x9iaM3wlCGIVgqv7MaNIZnexnvpCJhtwhHgpjPX6V34AGbIGRtgtkFjqmUR/Vge8NM
 h/chScq2fVwYspgQHagXsTeHnX7UTOzR5huBhjuDzfKst096HjaT6OYmjPVLimGdO0/h
 dO5g==
X-Gm-Message-State: AOAM531vp6HfES0MbkyWXin3Pn35xfhizK4pDQKjrB1Oi/a43Ers3gpL
 wa4m2GOIir1FrWCIGyyVQjldUQ==
X-Google-Smtp-Source: ABdhPJx33fRb/hFSGTHG5aiJYDcuF4kPeym+Gd8dMK8baE94WXb262rD9EDNnhmMAbLNcNHw7Ln0WA==
X-Received: by 2002:a05:600c:208:: with SMTP id
 8mr3891023wmi.143.1607347521332; 
 Mon, 07 Dec 2020 05:25:21 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id l11sm13497956wmh.46.2020.12.07.05.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 05:25:20 -0800 (PST)
References: <tencent_220963AF059847E1171B4AB9@qq.com>
 <CACRpkdbvKWcD04SLLBOBuZWzN64xpVv1nfCXZGcSp9cs0MPivQ@mail.gmail.com>
 <1jeek5ps3b.fsf@starbuckisacylon.baylibre.com>
 <CAHp75VeQGxnGO4o5a1vFzS9XAMjmvwoJ3=pWLvNQT6mXEKcqWQ@mail.gmail.com>
 <1jtusxkh6v.fsf@starbuckisacylon.baylibre.com>
 <CACRpkdZmM3GK6mebmm6nT-XXfdTB5KGwArAFk-1Gx6noZDxVAw@mail.gmail.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: 0001-add-amlogic-gpio-to-irq
In-reply-to: <CACRpkdZmM3GK6mebmm6nT-XXfdTB5KGwArAFk-1Gx6noZDxVAw@mail.gmail.com>
Message-ID: <1jr1o1katc.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 07 Dec 2020 14:25:19 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_082523_983144_FDC580F5 
X-CRM114-Status: GOOD (  36.66  )
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
 =?utf-8?B?5p6X5Zyj5qyi?= <linshenghuan@hangtu-china.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 07 Dec 2020 at 13:34, Linus Walleij <linus.walleij@linaro.org> wrote:

> On Mon, Dec 7, 2020 at 12:07 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>> On Mon 07 Dec 2020 at 11:18, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>> > On Fri, Dec 4, 2020 at 4:25 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>> >> On Fri 04 Dec 2020 at 10:13, Linus Walleij <linus.walleij@linaro.org> wrote:
>> >
>> >> This HW only has 8 irqs that can each be mapped to a pin. No direct
>> >> translation can be made, we have to allocate an irq to monitor the line.
>> >> So when gpio_to_irq() was called, we had to do that allocation dynamically
>> >> to return a valid irq number. Since there was no counter part to
>> >> gpio_to_irq(), those allocation cannot be freed during the lifetime of
>> >> the device.
>
> gpio_to_irq() is just a helper really and should not really be used to allocate
> anything.

Agreed

>
> In device tree systems, the GPIO provider should nominally present itsel
> as a dual-mode gpio-controller and interrupt-controller for example:
>
>                 gpio1: gpio@4e000000 {
>                         compatible = "cortina,gemini-gpio", "faraday,ftgpio010";
>                         reg = <0x4e000000 0x100>;
>                         interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
>                         resets = <&syscon GEMINI_RESET_GPIO1>;
>                         clocks = <&syscon GEMINI_CLK_APB>;
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
>                         #interrupt-cells = <2>;
>                 };
>
> The GPIOs are normally *not* translated to IRQs in this set-up. Rather the
> interrupts are requested by consumers using request_[threaded_]irq()
> which means you should be using the irqchip callbacks such as
> .irq_request_resources() and .irq_release_resources() to allocate one
> of the free irq lines to use. These will be called at the right points if a
> properly written driver requests an IRQ and when the driver is removed.
>
> In some rare cases gpio_to_irq() is used because all the driver knows is
> a GPIO number and it want to try to obtain an IRQ for it, and if a 1-to-1
> mapping exists it returns this number. This is not the norm, but the
> exception.

Sure

>
> So maybe the problem is that you need to go back and think about
> updating the DT bindings for this thing to include interrupt-controller
> as well?

We do
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/irqchip/irq-meson-gpio.c

That's actually the only thing we provide, on purpose.

>
>>  * This HW has to create the mapping between GPIO and irq number
>>    dynamically. The number of irqs available is very limited.
>
> This should be done using irq_chip callbacks.
>

Yes

>>  * We only get to know a mapping is required when gpio_to_irq() is called
>
> No that callback should not be used for that.

Agreed ... I was trying explain why we did *not* push a patch similar to what
was proposed here, or use gpiolib irqchip.

>
>>  * There is no way to know when it is safe to dispose of the created
>>    mapping
>
> The way that is done is when .irq_release_resources() is called.
>
>>  * Some drivers require a trigger type we don't support. These will create
>>    mappings and not use it because of the failure when .set_type() is
>>    called
>
> I don't quite understand this. Do you mean you are bombarded by pointless
> requests for interrupts that will not work anyways?

When we tried the approach suggested in this patch (again I agree it is
bad, which is why I'm against it), some drivers out there (I don't
remember which one TBH - that was 3 years ago) parsed the "gpio"
property and tried gpio_to_irq() and if it did not work then go
something else (like polling).

However the allocation stayed behind. It does not take much
"bombardment" when you only have 8.

> Then do not assign
> interrupts to these drivers in the device tree.

We don't.

> These requesting devices and their requests are under your control.

We control the ressources of the devices through DT, not the necessarily
drivers (which may be generic)

Some device needs the gpio, even if we don't want the irq.
We can't always prevent the driver to try gpio_to_irq().

This why I don't want gpio_to_irq() to be enabled on this HW, because it
would not be under our control anymore.


> The drivers should be able to
> back out and work without interrupt if request_irq() fails because it
> can't provide the type on interrupt you want:
>
> int irq = request_irq(irq, my_isr, IRQF_TRIGGER_RISING |
> IRQF_TRIGGER_FALLING, "My ISR", cookie);
> // This results in .irq_request_resources() and .irq_set_type()
> if (irq < 0) {
>    // Oopps out of IRQs or couldn't support double edges, bail out or
> use polling
> }
>
> Just do it like this (you might have to augment your drivers) and you'll
> be fine?
>

Again agreed. I'm really sorry if I have been that unclear about my
motive here. We already had that discussion 3 years ago, I totally
understand your point and agree. I was trying (and failing) to tell the
author of the patch that this approach had already been discussed in
past and that, unless gpiolib dramatically changed since then,
gpio_to_irq() should be used in this way and he should use irqchip we
already provide.

>> To answer your question, there an API which lets us know a mapping is
>> needed, but none to inform that it is not required anymore. The GPIO API
>> was not meant to used like this. Not saying it is good or bad, this is
>> just how it is.
>
> So don't use it?

Exactly

>
> Yours,
> Linus Walleij


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
