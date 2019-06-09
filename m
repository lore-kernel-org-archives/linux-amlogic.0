Return-Path: <SRS0=Y0fp=UI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33EEC28EBD
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Jun 2019 21:21:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87D0A2070B
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Jun 2019 21:21:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fJkR5kfh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="vA8aLg9f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87D0A2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/CWFo2ZGtoBG6oB88CN9PDvC3EDqD9mYHdHsTOwl9xY=; b=fJkR5kfhgB20l6
	I8zzSb8H7JRcAIuLKE6KLrBnchmg8QbQdP1sj3yrpd6YUdwwqPtrkI8aZDy2yoOI0Ks2VJfvoiHmH
	Rx6/8pawvqGD3aQVU38cpchSuy8Wzen98FHVPV9fIxVkmctxwD7QHBEpC2deYLHXQymshvY6xT/Lp
	Qvk9BGC8jM6vVk8sc158lrTYq/+gkjleHtQe5NDskIUPzLsMlCP1pywiy6hq1BVIyevyfLzcHqPig
	4TdSreGwf/pG59JcHWTD0fJROEcQMQ8KfY0qcfPIG7y31XkA6HJe81hf/Kjq+SjL7/qaKK6Oow8/s
	e/RYMq3Q0ewqgjxCCvUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ha5Fb-0005pO-8m; Sun, 09 Jun 2019 21:21:15 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ha5FY-0005ou-Iq; Sun, 09 Jun 2019 21:21:13 +0000
Received: by mail-ot1-x342.google.com with SMTP id p4so3334913oti.0;
 Sun, 09 Jun 2019 14:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ILeRyRcjcESncIl+P40HqpETCX7L+NY2Xryuox2AyAU=;
 b=vA8aLg9fXf3AMIkpttufBddw8qtRPGAoEkExHeDBLzOR4ig+7ulCusH6Lq+Zfq8Qy5
 n27AtawXPi6N876u0WAnmpjFukegBqhtfOW/ivahVb3zJx84+aXeWYfmY/OxlTSL+60z
 pPIp2tpUv36aNJY8n/MYH5MSJcHb2SNryQAWScuOiMrGIzF2uO8eI0Gr6Wb6Gp4DaMBU
 jexUiHzfshPGcZCvgWMl3ZEua5Wax4mKYIBULPDfCC4gchorb1Csg6suVmgsML8voafP
 aTaX4gv7DsUxW5b9B20uLabF+OX3m0RmUUEyB77CsWTj8DKhnic5nkMeGNUYSfiJxWAZ
 T2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ILeRyRcjcESncIl+P40HqpETCX7L+NY2Xryuox2AyAU=;
 b=I45ReTZ7YvrWx4xZwGegO7xe2r8HYua5a5w530yHpHhkacNypW2n4LVD87ITQPrEUp
 Z1NNNdYESBP+PGZMO3zrwGfUdjuRjINbi1CKkZcTn4E9/j6ovzdWaAdeKSaDg2Vi7XoF
 q71mJHGV3bf7fxeOn4yRIWoEYNu3rfNJfSbHHldPiwgoH2fZEPg+/7ZSyfMTHAAcudVD
 wDR4SROcEiX/VQG38V4cNQMxluo+BjmcdMqcgKmyeurb1JISMaHkJ+JjuQsv1nPcMS9K
 ZA63PlIOjvZnkAE0EJnjbfnaErO4EmOAEVoVv+1vS8LS4gRUp+cyNT28gYaAnlEUdR03
 5Dww==
X-Gm-Message-State: APjAAAUTmFfi38afK4NKuNZeYo5t5MhoXOBiT4gF96Jipkb6IrqDK8l0
 V7JWjNVAK7DibfMQ9aRCIark68lar19JY+Z/5X0=
X-Google-Smtp-Source: APXvYqxchWD3SK/5TgN7AGYLIIb5pfYYcmdM95qajFTt87HFoDR3f82VHMstyE2SNxDn2jQ7NIGHtL0BVjkO1m192S0=
X-Received: by 2002:a9d:6405:: with SMTP id h5mr16556583otl.42.1560115271456; 
 Sun, 09 Jun 2019 14:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
 <20190609180621.7607-3-martin.blumenstingl@googlemail.com>
 <20190609203828.GA8247@lunn.ch>
In-Reply-To: <20190609203828.GA8247@lunn.ch>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 9 Jun 2019 23:21:00 +0200
Message-ID: <CAFBinCA1xp5+77DhYMFjX31D3DsaU7d9EqFkWbn+UFFx5LSqEw@mail.gmail.com>
Subject: Re: [RFC next v1 2/5] gpio: of: parse stmmac PHY reset line specific
 active-low property
To: Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190609_142112_652165_4C9E6495 
X-CRM114-Status: GOOD (  19.61  )
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
Cc: devicetree@vger.kernel.org, alexandre.torgue@st.com,
 linux-gpio@vger.kernel.org, netdev@vger.kernel.org, linus.walleij@linaro.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 bgolaszewski@baylibre.com, joabreu@synopsys.com, khilman@baylibre.com,
 peppe.cavallaro@st.com, linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Andrew,

On Sun, Jun 9, 2019 at 10:38 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sun, Jun 09, 2019 at 08:06:18PM +0200, Martin Blumenstingl wrote:
> > The stmmac driver currently ignores the GPIO flags which are passed via
> > devicetree because it operates with legacy GPIO numbers instead of GPIO
> > descriptors.
>
> Hi Martin
>
> I don't think this is the reason. I think historically stmmac messed
> up and ignored the flags. There are a number of device tree blobs
> which have the incorrect flag value, but since it was always ignored,
> it did not matter. Then came along a board which really did need the
> flag, but it was too late, it could not be enabled because too many
> boards would break. So the hack was made, and snps,reset-active-low
> was added.
that seems appropriate. I don't know whether you can fetch the GPIO
flags when using legacy GPIO numbers.
so it may also be a mix of your explanation and mine.
in the end it's the same though: stmmac ignores the GPIO flags

> Since snps,reset-active-low is a hack, it should not be in the
> core. Please don't add it to gpiolib-of.c, keep it within stmmac
> driver.
I don't know how to keep backwards compatibility with old .dtb / .dts
when moving this into the stmmac driver again.

let's assume I put the "snps,reset-active-low" inversion logic back into stmmac.
then I need to ignore the flags because some .dts file use the flag
GPIO_ACTIVE_LOW *and* set "snps,reset-active-low" at the same time.
"snps,reset-active-low" would then invert GPIO_ACTIVE_LOW again, which
basically results in GPIO_ACTIVE_HIGH

however, I can't ignore the flags because then I'm losing the
information I need for the newer Amlogic SoCs like open drain / open
source.

so the logic that I need is:
- use GPIO flags from .dtb / .dts
- set GPIO_ACTIVE_LOW in addition to the flags if
"snps,reset-active-low" is set (this is different to "always invert
the output value")

my understanding that of_gpio_flags_quirks (which I'm touching with
this patch) is supposed to manage similar quirks to what we have in
stmmac (it also contains some regulator and MMC quirks too).
however, that's exactly the reason why I decided to mark this as RFC -
so I'm eager to hear Linus comments on this


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
