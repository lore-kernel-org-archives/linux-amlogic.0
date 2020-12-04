Return-Path: <SRS0=hFP1=FI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E81CC4361A
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Dec 2020 14:24:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A6E422B2C
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Dec 2020 14:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A6E422B2C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A2b46wV03UW/E//7ACZA1vV5LEDYvwl/IUbSx7g276U=; b=s4NlXkuX2Sjr6FZINxW6Dsz1p
	7j+W0rSDdzqITlZqeo4JrjqPv8u8hoCwzVqWyk+rCIaRzv62XxRmy5YaA6LGgNSS7WhUB4d213jnT
	XLdUYSpPLaRXEeRSVtqcWL/veOzKaHmQhDfKh8P31NERAAO4O8xzLDxIDiCOX61Thw/voVUN/Qw4q
	IhmJnPG8TW15+Y7qsFcHQk2bH1hx152TQg+nAM7u7O8x+zgVcaJenXNGqZZgWybecMlFSCnC/vhDC
	YPDHiTqrezqGQzDAJtbJRArEyr2jPtSyAOV8UICBj5J/Yr1IolmrTneuzGg655MWQEQvsi+WOJI3o
	rOF3sPJvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klC0P-0004dI-Pp; Fri, 04 Dec 2020 14:24:17 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klC0M-0004cR-Au
 for linux-amlogic@lists.infradead.org; Fri, 04 Dec 2020 14:24:15 +0000
Received: by mail-wr1-x42e.google.com with SMTP id i2so5497374wrs.4
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Dec 2020 06:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=jUrLTNYFEiHdTQnh4b2KYj9Mt2pIKbyV0FmvqdxpeB8=;
 b=Z6DkyOnE9k1kWZpvptHeGrpAXBwSapeSB8w1YdvYbnb3eftmlK2wjdSjdpN7qCOj2+
 nn+uYpuGAK4xmpf1bBewVR90Ik16AG7aoY0iQEv6cw7rLmLB8GXJK4KKVyk5XMUXcfk0
 EDMMpV3uJc4m6t/gnwI3sy2t4d250gGHLxpLlwGXbaZhswUraVRt94C2BMMcjp3HX10m
 zEQCPyhxIq0cXuBLHXrkZwPXLwpT4yin9SfAh1QeSDSJL9XPv//Px0NZy4CjDLc+UxI5
 FQ+q0ZObcEIkv6JwodNHpm4IsjoWTxyMo1vL+Sg/7A6qI2A95DQjYkyf/sWjUp3flODt
 PKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=jUrLTNYFEiHdTQnh4b2KYj9Mt2pIKbyV0FmvqdxpeB8=;
 b=Cxd3hcksphvLA3GU4NnhSRrs72+Ot3/4xiWQiYg4WHUFYsieQF6qqWfTkbpIw+smro
 qh50ZaIzhoUXzUA7vuc09GC62Bo5hpKzg68t2i4wTp7IqOtKhNMy2ryGxE8MQofwH9po
 KKoMrdPIN7RBkRIOsEgoPhdBzqdx9VEMvPBZZp+nMqbc/Z5OSykXwBPJ8ZjdozDjgiNS
 /MtigBioc5Zo7LM55PpxEkduS6DG+wYWTgivkRvY2PFMuehpQryrLAXh6fPrZzUtQ5q/
 uLe7ZtTziW4P93HSIpxTaWYuodFQvBC09otKn8lmodcipIvl8+SffieL1aYD9cdzg6rA
 eDaA==
X-Gm-Message-State: AOAM533ya7DPRPVscQhUweoT0tvrMF00wFigG7ua5Cgr1xY7Rm0pO1Yf
 Z2AfEAQzPwEEt8nrAgQXFbKB1YSC2CSr+2P8
X-Google-Smtp-Source: ABdhPJwoBA9wqffJQYc31bYbuyvOWnHNUoeQXULAdRVuAJOkUsOmNY8LZXa33e0UvMqyOWL8CHF4zQ==
X-Received: by 2002:a05:6000:89:: with SMTP id
 m9mr5285264wrx.412.1607091850901; 
 Fri, 04 Dec 2020 06:24:10 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id j8sm3868701wrx.11.2020.12.04.06.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 06:24:10 -0800 (PST)
References: <tencent_220963AF059847E1171B4AB9@qq.com>
 <CACRpkdbvKWcD04SLLBOBuZWzN64xpVv1nfCXZGcSp9cs0MPivQ@mail.gmail.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>, =?utf-8?B?5p6X5Zyj5qyi?=
 <linshenghuan@hangtu-china.com>
Subject: Re: 0001-add-amlogic-gpio-to-irq
In-reply-to: <CACRpkdbvKWcD04SLLBOBuZWzN64xpVv1nfCXZGcSp9cs0MPivQ@mail.gmail.com>
Message-ID: <1jeek5ps3b.fsf@starbuckisacylon.baylibre.com>
Date: Fri, 04 Dec 2020 15:24:09 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_092414_486706_0F43CA7D 
X-CRM114-Status: GOOD (  14.41  )
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
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 04 Dec 2020 at 10:13, Linus Walleij <linus.walleij@linaro.org> wrote:

> Hi Lisheng,
>
> this patch got a bit mangled but I get where you're going.
>
> I think Meson needs to be augmented to use hierarchical gpiolib irqchip
> because this seems to be what the system is doing.
>
> So start with drivers/pinctrl/meson/Kconfig and add:
>
> select GPIOLIB_IRQCHIP
> select IRQ_DOMAIN_HIEARARCHY
>
> Then use the generic hierarchical gpiolib irqchip as described
> in Documentation/driver-api/gpio/driver.rst
> Type
> git grep child_to_parent_hwirq
> for several examples of how to do this.

One reason the irqchip has not been linked to the gpio controller so far
is IRQ_EDGE_BOTH which the irqchip does not support (expect for the
latest sm1 family)

This is a problem we discussed a couple of years ago.

This HW only has 8 irqs that can each be mapped to a pin. No direct
translation can be made, we have to allocate an irq to monitor the line.
So when gpio_to_irq() was called, we had to do that allocation dynamically
to return a valid irq number. Since there was no counter part to
gpio_to_irq(), those allocation cannot be freed during the lifetime of
the device.

When drivers relying IRQ_EDGE_BOTH first try the `gpio_to_irq()`,
allocating the irq works but setting the type does not. We are then left
with unused allocated irqs (and we don't have much)

Frameworks using gpio_to_irq() are often capable() of parsing interrupt
properties directly too. So far, it was enough to work around the problem.

I admit, I have not been following gpiolib closely since then, maybe
some progress have been made

>
> Yours,
> Linus Walleij


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
