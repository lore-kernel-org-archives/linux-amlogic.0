Return-Path: <SRS0=mpVK=L2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D360C11F68
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 13:31:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14FB261425
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 13:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14FB261425
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJqK3wtYR1zuH3p07wyBaRQi0vS1W3gJct/UFgtGhNc=; b=I81PVDCJAVvzUD
	vySMfDRa3hZe9+vuLR9uIf2y/WaWwajSxJiVx69JrhMClA+mbiDFkfjv2x6EUOaiqo4HNJNmCudIb
	NmFdsvzi97I/vPu0zpu2nx6gCiLV99i/p+35JaleQSjLj/qTaJw3LBdjYdyGKGXvMDV7eiZfbjMqO
	Dnjy2il+GqvehGWX7L1LJgYjdP6Kni/MhQbGW5BsEQSxlGRX/egHDdBXYhWYvC5ZMNtg+k+kgDuiv
	oQTM+iHwmAqWjy2U1Yo8FgZqrQ3gnKAtomsIbLt1ruesLpfaJe9ZSLDYqcQ4s7G6RUxXvqwCHpojp
	IK8F5+ykHu5dv4JGk0bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzJGE-0036ss-8i; Fri, 02 Jul 2021 13:31:14 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzJFz-0036pr-QE; Fri, 02 Jul 2021 13:31:02 +0000
Received: by mail-ed1-x535.google.com with SMTP id m1so13224461edq.8;
 Fri, 02 Jul 2021 06:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TLPL1vwuoSurIn1Ke4+3XJSEMyvrxI7jqw6j1iy/If0=;
 b=CpCP4CL1+OGJCBDouYv0X21+BYXnktM13u1Rzi4vJ6YISSCdgISCyh+zfkTYrK8QzF
 YD8GFZ0mZc/WKKPTpYDc4EOOL0vn78bFwAI2bKvvjk9CRnQOVyOBlt5xkSxOxMEszoCU
 xZxvzIlZwEjgbqhb7e3nv5Rqq7zskft7QbEGGEXfN/NuC5WdUHm9BfOub51GgJMI6NpN
 r1RTVfMkd/rwrajpEDTRUHTlkJM5mXCwrSUsUdv95fFXn53sxWRW+waK6X4Nc3EqZD6f
 HxY1obYx8wiE+j5p4bg2RMH14e9SioNL53Ol2Qe5q+QNHvvsJRwgRRgIOMMyyGyWuA0i
 O3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TLPL1vwuoSurIn1Ke4+3XJSEMyvrxI7jqw6j1iy/If0=;
 b=eCWmu2Wa1ESxIDDwgAoO0Ys2Y1znXzF1W7QRAsyw1oMvpWppqJI16wjxGlS8+gPnBm
 KFBnH8e+KJFjcDmSk87s8Nu+BLtHGMxtOB6DjORSPhHso1+TKlr1Boznf1LfIU7N61BO
 f0EwyAHRvmnO2IGoMIEMrNyiig5OQ+jqRRmLZuDuM97uje/yyU+8b/YVyNsbvd+kbZTi
 cFUF8djmC87TnqnOzOyz/SlNyAGy+erYT9bUm+gapR8HBU75cA2/n65x/s6VReWkDkgi
 Y4HRceez/KOOsFVmVB01jbv3V6tlVflX5iVQZVO13EAdnAZkcY9RlQRgroEZcvETtqNs
 pHDA==
X-Gm-Message-State: AOAM533iz0CPi5HLi7aRRO+uVo7NHU7fg7TAkG/2QMFnwKjqOy6+xxU2
 gCbkZJ7Yl9rMolKhEpTZAFGt1mi7fZ/qCSZABiQoUrc3Ilc=
X-Google-Smtp-Source: ABdhPJwIDHn33FNtfeYw5efdxrdIzFrxnJWYLZAnaxQC9V+Ht48b2EB/ZvFajhnCdRje/T2QhEt0tMootqGY4wHhyww=
X-Received: by 2002:aa7:d74b:: with SMTP id a11mr6863372eds.40.1625232657982; 
 Fri, 02 Jul 2021 06:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210701215132.16317-1-viktor.prutyanov@phystech.edu>
 <20210701215132.16317-2-viktor.prutyanov@phystech.edu>
In-Reply-To: <20210701215132.16317-2-viktor.prutyanov@phystech.edu>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 2 Jul 2021 15:30:46 +0200
Message-ID: <CAFBinCBZXRrPakwvRLsbNbuYY6fcYysMs0+SPUmAhKpcYxrq0g@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: rc: meson-irblaster: document device tree
 bindings
To: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org, 
 khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 jbrunet@baylibre.com, 
 linux-media <linux-media@vger.kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, rockosov@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_063059_917210_C4579E2A 
X-CRM114-Status: GOOD (  22.11  )
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

On Thu, Jul 1, 2021 at 11:51 PM Viktor Prutyanov
<viktor.prutyanov@phystech.edu> wrote:
>
> This patch adds binding documentation for the IR transmitter
> available in Amlogic Meson SoCs.
This is an interesting piece of hardware where I've always wondered if
there is any device out there which supports this functionality.It
turns out that there is

[...]
> +description: |
> +  Some Amlogic SoCs such as A311D and T950D4 have IR transmitter
> +  (blaster) controller onboard. It is capable of sending IR signals
> +  with arbitrary carrier frequency and duty cycle.
> +
> +properties:
> +  compatible:
> +    const: amlogic,meson-irblaster
if you feel like some registers or register values are specific to
A311D or T950D4 then please also add a SoC-specific compatible string
(for example: amlogic,meson-g12b-irblaster).
An example can be seen in
Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml

[...]
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
from my understanding there are two clock inputs to the hardware
dt-bindings should always describe the hardware, not what the driver
may (or may not) use.
based on that I think you should drop minItems (then minItems will
have the same value as maxItems)

[...]
> +  mod-clock:
> +    oneOf:
> +      - const: sysclk
> +      - const: xtal
Does this "mod-clock" depend on something external to the IR blaster hardware?
If not this should be handled inside the driver only.

From how I understand the register description in the datasheet
there's two clock inputs.
XTAL is internally divided further down with fixed dividers.
Then there's a configurable divider which is then used to generate the
IR signal.
If the sysclk (I assume that this is clk81 - or at least derived from
it) is "too fast" then the driver should just ignore that clock while
the dt-bindings should still describe it (see my comment above)

[...]
> +    meson-irblaster@ff80014c {
node names should be generic, see for example
Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
(spifc is the name Amlogic has given this IP, but since node names are
supposed to be generic we use spi@...)

However, I am not sure if an IR blaster would be described as
ir-blaster@... or simply ir@...

> +      compatible = "amlogic,meson-irblaster";
> +      reg = <0xff80014c 0x10>;
> +      interrupts = <0 198 IRQ_TYPE_EDGE_RISING>;
> +      clocks = <&clkc CLKID_CLK81 &xtal>;
[...]
> +      clocks = <&clkc CLKID_CLK81 &xtal>;
while this works I think the recommended format is:
    clocks = <&clkc CLKID_CLK81>, <&xtal>


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
