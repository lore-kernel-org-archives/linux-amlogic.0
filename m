Return-Path: <SRS0=a8bK=FL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9AEC4361B
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 11:07:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D83121BE5
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 11:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D83121BE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YTDitRHtzGzxBeom2MAjwEbDyZqO5WbIz+eTQJ2qx/U=; b=lUYWcre3LsysgKH2yyFn9bFGP
	9iC6f7holbIxBpB2m7fIjbJD+Shxgrn84N1f3GzB8cmPVzezPsnudERoJQQbZErQ+R59RFp9pFD5l
	59Jy4W3vF5u29MVmZUtUnBwMJRHh6K9Nlbau6S5fb4R9NrNYoeR76gDBQA/EopCTxBy6+/6rOz1B/
	M90v4b7mZlbGzZ89qp5o2I5Y2anWHsqPzZRJqIvm95QgkIFlPDhQsct7+bkdY109oY5IoyE3rbQZJ
	VjvmNOqIhAovMDk82eWv75wRlivAgVQ5WGOtC74gBNSxoegagJfXStQxKfFgeagM9pPkQwSdBXmHw
	qOGU39+RQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmEMu-00036M-I1; Mon, 07 Dec 2020 11:07:48 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmEMq-00034Y-Or
 for linux-amlogic@lists.infradead.org; Mon, 07 Dec 2020 11:07:46 +0000
Received: by mail-wr1-x42f.google.com with SMTP id x6so8405584wro.11
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Dec 2020 03:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=fXKwSDv16AOh+KVLgtrXO8MP7h/qcJpU35hR/cYiidI=;
 b=jjnXwZBExlA+jNskPXLyHx7XlGVcvXHpeqhzK23So8UPP9i4SLl+29SBBR1OC3jx2Y
 Mdkyc1ZYxIu4Et9sLTH6EZXbgx9uArDCx8jEIof72bFGkK0fhZYPozBlYBgV/lUTimlH
 I83tCvHVqEDYW8bgeVw3ypLeVgjiMqXQmcKPbiy0kavnPaYpVq2jIS+0X7e61k6Pa6Io
 qELk+CxcR3vLs5iFwAC2C2eGWvRKVXH+g6wpyZICUKpeeenQ3369Rpo9dilWdThI3sbB
 uOK1lNPy9BSvx8m3Rj4mlj3axQwZIWQQwIU3Tj0W+iudvHQcndDWsjsr46o3X1fi5Mol
 5vrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=fXKwSDv16AOh+KVLgtrXO8MP7h/qcJpU35hR/cYiidI=;
 b=mQ4Y8jw+nNhaHsDen6qe3vTUEp54ykg0ntklmWCmPxQ/gTzNEXDiTgBUA121afWkAl
 j34a/C1lsicqa/M6aYh41FoxeAU49VZ2noCPiyfPGi5nHhqcvX1yhohZ2sTsbDgjZKMS
 C9Ra4NRIsZo/nWii/TsuvuU1ozaDAjmnTuCl0ZOZrsFxlZKmbx0lYeBVfxpS5FElAgpf
 Z8FHCZk+U/CAVeFsGP63YfH24K3tnkuoYonYTYtya8RlZLiSWTP5GpvU8XNMsUQ2xuyh
 9hGnnzNGwjQ45iUM9SoSe/E8KfB66jXhZLYBfBl81KEA8kCIdWYOlapphxK+LvQfRvko
 RQ6Q==
X-Gm-Message-State: AOAM531jH5Exl4ge6SlpmW1qSkfU+tipfS3bBRu03Ue8fliNj0AkHzAY
 0axi72eb6sdaGzhKZy5qVxHNhA==
X-Google-Smtp-Source: ABdhPJwE5n6HwO553Bm7gWNTT5QYa/KtHJFapNmhnaLnMoSS1kVbdYU3iWE4x2cOCWZAYF0xz/NpCg==
X-Received: by 2002:adf:8503:: with SMTP id 3mr2072019wrh.56.1607339258533;
 Mon, 07 Dec 2020 03:07:38 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id m2sm13399888wml.34.2020.12.07.03.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 03:07:37 -0800 (PST)
References: <tencent_220963AF059847E1171B4AB9@qq.com>
 <CACRpkdbvKWcD04SLLBOBuZWzN64xpVv1nfCXZGcSp9cs0MPivQ@mail.gmail.com>
 <1jeek5ps3b.fsf@starbuckisacylon.baylibre.com>
 <CAHp75VeQGxnGO4o5a1vFzS9XAMjmvwoJ3=pWLvNQT6mXEKcqWQ@mail.gmail.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: 0001-add-amlogic-gpio-to-irq
In-reply-to: <CAHp75VeQGxnGO4o5a1vFzS9XAMjmvwoJ3=pWLvNQT6mXEKcqWQ@mail.gmail.com>
Message-ID: <1jtusxkh6v.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 07 Dec 2020 12:07:37 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_060744_825662_385FCE19 
X-CRM114-Status: GOOD (  17.64  )
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
 khilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-gpio <linux-gpio@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?5p6X5Zyj5qyi?= <linshenghuan@hangtu-china.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 07 Dec 2020 at 11:18, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Fri, Dec 4, 2020 at 4:25 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>> On Fri 04 Dec 2020 at 10:13, Linus Walleij <linus.walleij@linaro.org> wrote:
>
>> This HW only has 8 irqs that can each be mapped to a pin. No direct
>> translation can be made, we have to allocate an irq to monitor the line.
>> So when gpio_to_irq() was called, we had to do that allocation dynamically
>> to return a valid irq number. Since there was no counter part to
>> gpio_to_irq(), those allocation cannot be freed during the lifetime of
>> the device.
>
> I'm not sure why we are talking about legacy API which should not be
> used.

I would have been happy to forget about it, but it seems to be the topic
of the thread :)

> Besides that I didn't get what you meant under counterpart API (IRQ
> descriptor has a mapping to the IRQ chip which keeps the mapping to
> whatever hardware wants).

 * This HW has to create the mapping between GPIO and irq number
   dynamically. The number of irqs available is very limited.
 * We only get to know a mapping is required when gpio_to_irq() is called
 * There is no way to know when it is safe to dispose of the created
   mapping
 * Some drivers require a trigger type we don't support. These will create
   mappings and not use it because of the failure when .set_type() is
   called

To answer your question, there an API which lets us know a mapping is
needed, but none to inform that it is not required anymore. The GPIO API
was not meant to used like this. Not saying it is good or bad, this is
just how it is.

If there was a way to know it is safe to dispose of the mapping, then
letting users of gpio_to_irq() try and fail would be OK, but we don't
have that AFAIK.

This is why gpio_to_irq() or gpiolib irqchip had not been added so far
on this HW. I don't think it is worth fixing, especially if the API is
considered to be legacy.

On this HW, getting an interupt from a pin is done by going directly
after the interrupt controller, like here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts#n173

AFAICT, making pps-gpio parse an "interrupt" property should be doable
too.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
