Return-Path: <SRS0=yQOf=LQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA7B3C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 19:57:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B7176100B
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 19:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B7176100B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=koJazCDSwYvcZu5BuaXFJH5C9CExPKwoCBm/nsHgXug=; b=UlgExmeEb704uP
	Sin60ujmB4nsL/V5IW2kLtAkZRLOB6U2p94NUFDiqdxCcEEiO/+jVtbpKUY+9kTwnePf2CtKD7u2m
	+yxpmSFh+JoC5Z9EhkQlpvWDX3lAbTIlvX7pjeYp6GCPI/KtQ8wXxVldLrs//9Kc8s5DnV5wg8dTN
	tTWfCQA6w4ai/Rlp5TQSm6SLqNAo2f1T1kY4loC7rYZio+EQAuqBaXaXfivdZY4yBBHc0KAe8rKVr
	+Lnu0mDvO6R+RFVlxpr96ZNv2E+4h6wdsHUne3J6YdRxw/EeAuBayvmU+tvm43ubNwrYgOrePGTgJ
	uVhVWhk/LPjToc0ULBQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvmWm-008GyJ-IG; Tue, 22 Jun 2021 19:57:44 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvmWk-008Gxi-Bk; Tue, 22 Jun 2021 19:57:43 +0000
Received: by mail-ej1-x634.google.com with SMTP id my49so234832ejc.7;
 Tue, 22 Jun 2021 12:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Eovzw/udn4hicrC407R2X9SrTc2QGxyjor98KY9344o=;
 b=ofg0zEesjw/TVIggXvcIPH9DhGxXKSu3YWaBmok3qYhCzDJdLDF2FsMeqpMBwexpQ/
 ksHDL089XVMVKt9O40sZVVDvQBckA/2cpF9IeuFFXqS4ubOEH3x1LiIXWt8x5IdqEw2n
 rVm53TetQoqR93n+1YkQuSikga5VtiWvaGy+qQg5lQkmI1y9gFFwmxC17kfi+TejkrGV
 6JS26EHtHAtIs2d54h/qG0RYACCtShPOI2ByFu6zYIdaDcQ9n6pfJPTaAw8zqNCk4YE6
 t8BGqlqrkWWaTQN2Gk3MI9chqPSmFQC0tIYlhYPAykP7D7bGVQ+rOC4+OH97GwnxU6Tu
 uwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Eovzw/udn4hicrC407R2X9SrTc2QGxyjor98KY9344o=;
 b=m3eMXls8X1rQ3Rh1SbveEQ2X1D/fL/z8IneQu1dpLNXMT0SPOXKsOiF5LdvGyKpK+q
 1jbXByn/Yg5HpANWYVLKH86/o5Oddc+9Ba/zoq6kWhDsKM2xAMQNa1QUg6flT7QbL2tW
 1o9+CS2u8aVynxKR435saefahasRXPUJ4JTDvTeISbAzuz2n7RjImwKe9B5rsgTir9UK
 i75Y6LuL8rC2JjQuqC/KaQUa/c3m8FUhW3pgbXpnumm3O076FeAmLlYklcFpfyzAY0+N
 aiSn2jp4MrRwGqQmVCykjFU9Iz15VNxOUjnQevV27m38UqlDNKvlK2sse+zdrqIaazBh
 hw+w==
X-Gm-Message-State: AOAM5323o2Jq/ehqir0DmMcaHwmjegcKLLN+IZVoZTYZ/22VCHg81212
 5BPicJe61IKTN+zB6M7uxL7fkKzn4j7w4kEZGUiFpBqQhZo=
X-Google-Smtp-Source: ABdhPJyKd7e5C4Ph84g4B35RZoEdjwc6rb5o8Q7KdW9xfBBwAEDRGr7WOP7Jo/YB2xiUfT0KiK2lMC5guhRIKZ2smks=
X-Received: by 2002:a17:906:f188:: with SMTP id
 gs8mr5734432ejb.527.1624391859989; 
 Tue, 22 Jun 2021 12:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210604190338.2248295-1-martin.blumenstingl@googlemail.com>
 <20210604190338.2248295-3-martin.blumenstingl@googlemail.com>
 <YNAvItt8BQH1QmQT@vkoul-mobl>
In-Reply-To: <YNAvItt8BQH1QmQT@vkoul-mobl>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 22 Jun 2021 21:57:28 +0200
Message-ID: <CAFBinCAOi0EuucaQcJvgzV3o9fu=26u2ivAiQVidrmXTzQRQfg@mail.gmail.com>
Subject: Re: [PATCH 2/2] phy: amlogic: Add a new driver for the HDMI TX PHY on
 Meson8/8b/8m2
To: Vinod Koul <vkoul@kernel.org>
Cc: robh+dt@kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, kishon@ti.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_125742_464518_51F1C378 
X-CRM114-Status: GOOD (  19.37  )
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

Hi Vinod,

thanks for taking the time to review this!

On Mon, Jun 21, 2021 at 8:18 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 04-06-21, 21:03, Martin Blumenstingl wrote:
> > Amlogic Meson8/8b/8m2 have a built-in HDMI PHY in the HHI register
> > region. Unfortunately only few register bits are documented. For
> > HHI_HDMI_PHY_CNTL0 the magic numbers are taken from the 3.10 vendor
> > kernel.
> >
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > ---
> >  drivers/phy/amlogic/Kconfig              |  11 ++
> >  drivers/phy/amlogic/Makefile             |   1 +
> >  drivers/phy/amlogic/phy-meson8-hdmi-tx.c | 150 +++++++++++++++++++++++
> >  3 files changed, 162 insertions(+)
> >  create mode 100644 drivers/phy/amlogic/phy-meson8-hdmi-tx.c
> >
> > diff --git a/drivers/phy/amlogic/Kconfig b/drivers/phy/amlogic/Kconfig
> > index db5d0cd757e3..e6c3a2a8b769 100644
> > --- a/drivers/phy/amlogic/Kconfig
> > +++ b/drivers/phy/amlogic/Kconfig
> > @@ -2,6 +2,17 @@
> >  #
> >  # Phy drivers for Amlogic platforms
> >  #
> > +config PHY_MESON8_HDMI_TX
> > +     tristate "Meson8, Meson8b and Meson8m2 HDMI TX PHY driver"
> > +     default ARCH_MESON
> > +     depends on (ARCH_MESON && ARM) || COMPILE_TEST
>
> depends on ARM seems redundant..
config ARCH_MESON exists in arch/arm as well as arch/arm64
my idea was to hide it from the 64-bit SoCs since it's not used there

While reading your comment I spotted something for myself:
I think "default ARCH_MESON" should not be there.

> > + * Meson8, Meson8b and Meson8m2 HDMI TX PHY.
> > + *
> > + * Copyright (C) 2020 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> 2021..
good catch, I'll fix this in v2


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
