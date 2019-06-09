Return-Path: <SRS0=Y0fp=UI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A03C28EBD
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Jun 2019 22:29:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED9BD206E0
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Jun 2019 22:29:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XCHOZgvH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Yw5lxz2M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED9BD206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4m0+4QvB7uFzJuiUKge2Zsfzu/aFxgjdHGcv3Lv3N0A=; b=XCHOZgvHhSLfk6
	QE6UlqakvU7L4P1f1nyN96y3J8LM7x16sYbAMd+g54L/6EGgsaoF+EHAmAxxPI0g+WRqE4J8EnG4O
	kkcYmLGGNDv7lX24ZJzdvEjx5h+T2xjPsaJcjBINSL+/W3R5bYJv91WV1GlGQ8zhR4t0zXbADdgig
	L3QBERn2ZQD88bh7TPmBUkm+PoUTsYrYn5fh2gI0OEanG3kCEnFSeUQIMXJ6BajdP+wt19SBDmoFI
	ozBlBJktGDtLjU67Zgk75Wm2XgiK2EY6wYTRA399b1OPpmPhgxZOT18uZlj/xBxPb2Rct6al/B7o+
	/qrs+QYq4h14hvp5jFeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ha6JF-0002iD-R4; Sun, 09 Jun 2019 22:29:05 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ha6JD-0002hH-1K; Sun, 09 Jun 2019 22:29:04 +0000
Received: by mail-ot1-x341.google.com with SMTP id z24so6636167oto.1;
 Sun, 09 Jun 2019 15:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sePl1BxoH8M2Ag9hWKHMM9PC7HT35mw+FBXMYc8ap6c=;
 b=Yw5lxz2MiGWV6OwbaX63dQW+cirM/W4o6b7Xia0ej4yEhpRzVI0DltV0GAL7UAgwaM
 91vcaOnjNUJVMHrChqbrsdrWY1l2Pa5hrSha6gqLWFmHolBLQThdwquKORq0rFPGJTEn
 gZn4TkcAPDzh40IsgK0PORqVgyrCwVi4/QyzPw03MCCouiZZuHfzu16PhSjZnuX7pkA7
 eJ0xRRqfgEK1OJNXktIsRvAD4kIC/8m+yQgBfYmzQnLkefvqmaESBfZ+7XJoqqfzlx87
 i0dDU/jG2ZRsV61cQKa9bl8ip8+MV72DncqyaXYNGoJxCZHJLUbY0n7nRGhZ/GjAfjKk
 ZZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sePl1BxoH8M2Ag9hWKHMM9PC7HT35mw+FBXMYc8ap6c=;
 b=KnDbvk840PvR7uKL/pZdmgkNkRZZs0WiU61l8fK6lrJBsWVVdG806AFBE5OOWRkHOO
 vkSeQuVZlktTVfXv5sb9lJpUSoqQWN12/nhuu74lYpgqbZ4bmMnw4vgdI9yy1gcGxMGR
 mNfjoiUchy3jX1poANZ9C2GXqC/GBBDHOMo21gCBpbcsBQffv/x+cA0qHro9zebicHIF
 FGwZ2SCGI7rkEuE7ZoSmy/k02ZTTziVCyYAEAUTmVv7UlvEev71Dwi+WAci8YHL8ajx5
 m6ZK3/BDpCshdAq/KJEWNDFyihd3PQoKWVe2uEL9SwkRuW/bf0RA7t7EWe1zs+U9DT82
 uugQ==
X-Gm-Message-State: APjAAAV0c93koFhigInNUJ0zwPCTZFdwj24M3j/CQMxKd/I4/nszP4u/
 R900N+mILDJyC2DUisUHETAxBJ4SNWtW3OrxqTG1suVG
X-Google-Smtp-Source: APXvYqy+T7mpPqt6GkRiQjZzGluZ3AiR4EAUVviHS6NHy+UPPLubdx6ZNTH4stn3vXNw9TQ8wcN2BMs2ClwdoqNifV0=
X-Received: by 2002:a9d:6405:: with SMTP id h5mr16693612otl.42.1560119341436; 
 Sun, 09 Jun 2019 15:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
 <20190609180621.7607-6-martin.blumenstingl@googlemail.com>
 <CACRpkdYzeiLB7Yuixv6NsnLJoa_FnGKRHHQm=t4gMH34NdFSYA@mail.gmail.com>
 <CAFBinCBgoLb+Hfdo-sZ_0H6ct=UJm7j6wD_C6udbA6BTRvFOWQ@mail.gmail.com>
 <CACRpkdYur+dwC1LqasQR-cvTWcpV12vr+8Wi5o9kXVWe-0teZw@mail.gmail.com>
In-Reply-To: <CACRpkdYur+dwC1LqasQR-cvTWcpV12vr+8Wi5o9kXVWe-0teZw@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 10 Jun 2019 00:28:50 +0200
Message-ID: <CAFBinCDOhBUqNx4y+j1NeE08wWuZ-bhX5DsE8kcG4LUHKEQ+nQ@mail.gmail.com>
Subject: Re: [RFC next v1 5/5] arm64: dts: meson: g12a: x96-max: fix the
 Ethernet PHY reset line
To: Linus Walleij <linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190609_152903_109194_5BD36D69 
X-CRM114-Status: GOOD (  23.14  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jose Abreu <joabreu@synopsys.com>, Kevin Hilman <khilman@baylibre.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "David S. Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Linus,

On Mon, Jun 10, 2019 at 12:06 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sun, Jun 9, 2019 at 11:36 PM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
>
> > > If "snps,reset-active-low" was set it results in the sequence 1, 0, 1
> > > if it is not set it results in the sequence 0, 1, 0.
> >
> > I'm changing this logic with earlier patches of this series.
> > can you please look at these as well because GPIO_OPEN_SOURCE doesn't
> > work with the old version of stmmac_mdio_reset() that you are showing.
>
> OK but the logic is the same, just that the polarity handling is moved
> into gpiolib.
>
> > > The high (reset) is asserted by switching the pin into high-z open drain
> > > mode, which happens by switching the line into input mode in some
> > > cases.
> > >
> > > I think the real reason it works now is that reset is actually active high.
> >
> > let me write down what I definitely know so far
> >
> > the RTL8211F PHY wants the reset line to be LOW for a few milliseconds
> > to put it into reset mode.
> > driving the reset line HIGH again takes it out of reset.
> >
> > Odroid-N2's schematics [0] (page 30) shows that there's a pull-up for
> > the PHYRSTB pin, which is also connected to the NRST signal which is
> > GPIOZ_15
>
> Looks correct, R143 is indeed a pull up indicating that the line is
> open drain, active low.
good so far

> > > It makes a lot of sense, since if it resets the device when set as input
> > > (open drain) it holds all devices on that line in reset, which is likely
> > > what you want as most GPIOs come up as inputs (open drain).
> > > A pull-up resistor will ascertain that the devices are in reset.
> >
> > my understanding is that the pull-up resistor holds it out of reset
> > driving GPIOZ_15's (open drain) output LOW pulls the signal to ground
> > and asserts the reset
>
> Yep that seems correct.
>
> Oh I guess it is this:
>
>         amlogic,tx-delay-ns = <2>;
> -       snps,reset-gpio = <&gpio GPIOZ_14 0>;
> +       snps,reset-gpio = <&gpio GPIOZ_15 GPIO_OPEN_SOURCE>;
>         snps,reset-delays-us = <0 10000 1000000>;
> -       snps,reset-active-low;
>
> Can you try:
> snps,reset-gpio = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
> ?
I tried it and it works!

> Open source is nominally (and rarely) used for lines that are active high.
> For lines that are active low, we want to use open drain combined
> with active low.
thank you for the explanation - I'll take your version for v2 :)


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
