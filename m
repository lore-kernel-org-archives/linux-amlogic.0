Return-Path: <SRS0=GyIY=MA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBE6C07E96
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Jul 2021 13:58:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A0416141A
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Jul 2021 13:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A0416141A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dr5YfZaMkASz9LSZGwyIVzj3k359ngUq/F7d47HWq8o=; b=2hd8P5CqZk0sSz
	fs4QloNQHt0xSFuVKLCM0uGFd6y3vEZY63oyKAgvF7zuqpIoRpO9tOYvAzz5v/nufD2XSL26jBKXf
	zDtYIBvGl/u//69XZy863moVVq+RMaDFdEUovZe128arTcUmVqLwkOKVqNu/GcZhFqHJCFC+GpWZj
	8RfJ2DoQiECIYH+RS1JAzJ134j1ITqwVO5HIsbDA3F60IOAN9wpxNemszKilZyXhsNtz6GP1JtfJ3
	R3xFoWUuLFc4VdIoz9Oah8KDmYnBOHYvRYmcD/6d1c9Ictl3pIVQEUx4wDh4ox8B+wuVUHmBaKrTP
	KvPmT0SFR5oyLE/TyFBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1UXp-00H9St-Ht; Thu, 08 Jul 2021 13:58:25 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1UXc-00H9Q9-9E; Thu, 08 Jul 2021 13:58:13 +0000
Received: by mail-ej1-x630.google.com with SMTP id c17so9736859ejk.13;
 Thu, 08 Jul 2021 06:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X4qt0wVH0QhfISGoZ2TdbwDYVS2o7e6p+1hm7yDFUI8=;
 b=t46CYqZsKP1VChYxYyxWdTePbU+3tcjjPFIKITI/qu6a4WCXf0iwl+1ekVf97SwL0i
 bQpg9XTHhoIbJhuUVAUY+XTa9+JmesO2SMxHXB5orSBPhanbViKyXKPGDM2kC9Jn8tKB
 B7SQxrMO1jvQSmCnY9fY/Tfqa1+khEoKdPX0bncBV800FEVgO0SGjktc5raFwDHqgDVI
 X2ltMV9oDPeX/KZUNkIoYMFOmkmcyNMkAznMSm0p4DdrtHSiMLXAMtdocg+e7Py53tjP
 lMd1rEl77ICbR1o25+zBWT0uWIbCTzrzW0wnSJcBC1g+VNqY576e8kuhsIIOsk0V9EeG
 OxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X4qt0wVH0QhfISGoZ2TdbwDYVS2o7e6p+1hm7yDFUI8=;
 b=LdvoaKT5pFnFo9hb5ufecZ4iWgmHOqRg/J2QNZKnngLh69AziK6sLJU8gL01I9hmsM
 xZw0VaWLMQpy1UsgF/XpDpRRmwrY7sQwn1cYn/TN3SgHzCbjKFOQ5R2hGU++mXESTzm+
 doBPdXv1HDXhW8BkYlCa9tYeOgRavbwpiMnCJjCQaB+mGkrxp8XFqkry5s8HXznObhGP
 Qb+3Lr3iW7mPs50+rMnEczvZve48ujMjTsbHQqLg7HGoTYqMfxhW7IHErSkB531fLiys
 1ynhD/ACFAYiC0ozSMQ1MebBbMLYml39iUzwg+ojfrl+tQeLZzBGUrHQJR7EIP3BuPDK
 I0cQ==
X-Gm-Message-State: AOAM532wpz5b48GPMp6CNulyF9rVShULjoex9eUVVgDvlZ5YhJr8Z/VZ
 VCPD1LovIT0RyxpW2SHT722exll8er76gMeFLnA=
X-Google-Smtp-Source: ABdhPJyxZtWy9FPRhxKZ7dds12JrOUCU9TNACLcbn4HSSc+y8H5c1evbH9NBOvDONR49j19SZ9UjcQJjNICLbQBTFrw=
X-Received: by 2002:a17:906:39c3:: with SMTP id
 i3mr30931439eje.527.1625752690494; 
 Thu, 08 Jul 2021 06:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210707141323.20757-1-viktor.prutyanov@phystech.edu>
 <20210707141323.20757-2-viktor.prutyanov@phystech.edu>
 <CAFBinCDgQHA1vmunNBdER0BfiKt8XYZ+-VBs3c21+S3bYP7GZQ@mail.gmail.com>
 <20210708162051.13953369@192.168.1.3>
In-Reply-To: <20210708162051.13953369@192.168.1.3>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 8 Jul 2021 15:57:59 +0200
Message-ID: <CAFBinCDOcR5t=6m5X6LnuA+XT4v9nMQnDdD_moOqzf5ffWt+4A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: rc: meson-irblaster: document device tree
 bindings
To: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org, 
 khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 jbrunet@baylibre.com, 
 linux-media <linux-media@vger.kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, rockosov@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_065812_386028_E612E061 
X-CRM114-Status: GOOD (  22.46  )
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

Hi Viktor,

On Thu, Jul 8, 2021 at 3:20 PM Viktor Prutyanov
<viktor.prutyanov@phystech.edu> wrote:
[...]
> > > +  mod-clock:
> > > +    maxItems: 1
> > in the change-log for this patch you mentioned that mod-clock is
> > updated as well I think that mod-clock (as a whole property) should
> > only be added if it's an external input to the IR blaster IP block
>
> There are 2 clocks connected to blaster module, and mod-clock is just a
> selector between them. Meson IR blaster driver should choose one of the
> modulation clocks. If not through a property, then how to do it?
It depends on what the requirement for this clock is
I'll give you some examples as I am not sure about the inner workings
of the IR blaster - in hope that you'll be able to make a conclusion
for yourself.

drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c:
If Ethernet is configured into RGMII mode we need to configure a clock
tree (which consists of a mux to select between two different input
clocks, a fixed divider, a configurable divider and a gate).
The output clock rate must be 125MHz (or on SoCs which don't support
this directly then "as close as possible").
In this driver the clocks (and their hierarchy) are modelled using the
common clock framework so in the end we can conveniently use
clk_set_rate(dwmac->rgmii_tx_clk, 125 * 1000 * 1000)

drivers/mmc/host/meson-mx-sdio.c:
During initialization we need to inform the MMC subsystem of the
minimum and maximum supported clocks - this is done in
meson_mx_mmc_add_host().
The actual clock rate in the end depends on the SD/MMC card and it's
passed down to use from the MMC subsystem.
We then use clk_set_rate() in meson_mx_mmc_set_ios() to set the clock
rate closest to what has been requested by the MMC subsystem.
The IP block for this controller does not contain a mux but a
fixed-divider as well as a configurable divider - both are modelled
using the common clock framework.

Based on my understanding of the IR blaster description in the
datasheet that IP uses:
- fixed divider clock: xtal / 3
- fixed divider clock or a fixed rate clock (it's hard to tell as all
Amlogic boards I have use a 24MHz crystal): 1MHz (1uS)
- fixed divider clock or a fixed rate clock (it's hard to tell as all
Amlogic boards I have use a 24MHz crystal): 100kHz (10uS)
- clk81
- a mux to choose between the four above clocks
- a configurable divider (SLOW_CLOCK_DIV)
- possibly a gate clock (bit 0 of IR_BLASTER_CNTL0 called ENABLE)

If you only care about one specific clock setting (let's say the 1MHz/1uS).
Then you can either hard-code the values and register initialization
in the driver.
The mod-clock property is not needed in this case.

If the desired clock rate however changes (for example with the IR
protocol) you can model the fixed dividers, fixed rate/divider clocks
and mux using the common clock framework (similar to how it's done in
dwmac-meson8b.c).
Then you need to calculate the desired clock rate and finally use
clk_set_rate(irb->clock, desired_clk_rate_hz);
The mod-clock property is not needed in this case.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
