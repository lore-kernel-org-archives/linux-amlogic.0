Return-Path: <SRS0=JCZT=UJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF0FC31E40
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2019 15:53:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 855C12085A
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2019 15:53:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BrTsHslP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="oAoQN1PM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 855C12085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wmR5RtUPZpx5dGPWAgCAO28WJxLPRaO+6DWfb8+Vrw8=; b=BrTsHslPw99Lp+
	DVvuCMBNa2+C2ulNWmVMtkC7bkhO02O2r6LSausZhDK0YObF0M8HtYZ45/+kky/Jx3poE+4Yamq81
	5Jo5eEM6W/mZ1nfzbQ/RRuJjNVh/zjTI5tElt0hGS7gDHnHO63tKv29hWdVNHzakQ35IRdELCydP6
	EoURcPnnK8tpUv3OVgE4iI0KKh72MBFR9Hm6LpXtWQMXDPKbccjH4xULwK+uG/MIAS+83+l84qpSt
	IJB+sHC+wp8XckBvoxjy6aI/59qNANBvxR1J+QRzuE+O/DNskF2POKOJuH0jec0ZAVk0Emk2gclBy
	GlqMxmh8lnBv2+vIH2dw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1haMbc-0003HA-1u; Mon, 10 Jun 2019 15:53:08 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1haMbZ-0003G7-FM; Mon, 10 Jun 2019 15:53:06 +0000
Received: by mail-ot1-x343.google.com with SMTP id z24so8778442oto.1;
 Mon, 10 Jun 2019 08:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V7uCnX5LIMJHtHTPYaDf7mFvAliKfGgnILabe1niN2o=;
 b=oAoQN1PM0ta5wsaELk8p5Ea3yH54iqbEAfrpkhqkZGMCVsw06eugxD2IoI4566Pjsw
 Rk3pbbLyKj/rM4MV8Jjv0667R9dJqhWTmWuW+jO0XS9f8QWqFEjJrkpzCGADqWxbwRHM
 Cv7E50lrJwB83BKjtPzWsfiHW8+NtdxbhBU3yGiD2FbAXv8YK1w6bySs13F7PvsPeSWb
 oDBlQIlL4cn+nDMkZTE5S5JQSqmdjphWwsqsSLxweSu2w7HnxyJlf5OM7jgrjToA2OMF
 j1XIFDG4Iywk3bh1QURsSspr/zYSw2nzOFyfgSApccMfQPOdHj3/5kLhE6+KhmXJwai4
 t0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V7uCnX5LIMJHtHTPYaDf7mFvAliKfGgnILabe1niN2o=;
 b=jO9z+X/xqeab0Cnd3GbYUCj/bVHeBA77m5Tk040pIDYsSSDgd7w9XKPclJ/todTRlA
 r64W1Ou4YrSoWTnYtxvKMJJd9Zb621dbBXa1+CgAXzapA0phg0vqC8ButWOxpoE/0yBJ
 1R84xC8qOkCEHkKih1OUSUH80it/UT3b8LQHLoeA76re8la4kP8nmBdzr5CzJvnVxsF1
 F7XlWaP895gK9kHLKy3JUXPxhIAyfpRKuVuOnIVr2PMfEok+glGMONNJnYImF4+ogEy8
 /5RaalChC+3rvc9Y4gZkGMl13YQwGx5cMiilB7mGv5boT0ytWzgyrnVIwqx52ymqX1A+
 wrKw==
X-Gm-Message-State: APjAAAVSjymT5SjVQrpvdNxn/iyVx8Sn8kTiYpHrGe44jarpuld7sMsY
 wewqq8hvRqKq/4vE8cSCCRXj4Dr3JkOA7mew2Zw=
X-Google-Smtp-Source: APXvYqzBtsrTeIkjNn7DDhjuFe0wNjh2kvmCkP3GNZSqEC0xKl2tEIEqMtPBumjQp/9gUrheEnWAc4JbHlAvsf/i/IM=
X-Received: by 2002:a9d:6d8d:: with SMTP id x13mr29456736otp.6.1560181982711; 
 Mon, 10 Jun 2019 08:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
 <20190609204510.GB8247@lunn.ch> <20190610114700.tymqzzax334ahtz4@flea>
 <CAFBinCCs5pa1QmaV32Dk9rOADKGXXFpZsSK=LUk4CGWMrG5VUQ@mail.gmail.com>
 <20190610132546.GE8247@lunn.ch>
In-Reply-To: <20190610132546.GE8247@lunn.ch>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 10 Jun 2019 17:52:51 +0200
Message-ID: <CAFBinCAc6cczcZX_diCZJiUsNObcmFqfdq4v_osiwee18Gk0iA@mail.gmail.com>
Subject: Re: [RFC next v1 0/5] stmmac: honor the GPIO flags for the PHY reset
 GPIO
To: Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190610_085305_514262_B0C3306E 
X-CRM114-Status: GOOD (  15.08  )
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
 linux-gpio@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 netdev@vger.kernel.org, linus.walleij@linaro.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 bgolaszewski@baylibre.com, joabreu@synopsys.com, khilman@baylibre.com,
 peppe.cavallaro@st.com, linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Andrew,

On Mon, Jun 10, 2019 at 3:25 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > if anyone else (just like me) doesn't know about it, there are generic
> > bindings defined here: [0]
> >
> > I just tested this on my X96 Max by defining the following properties
> > inside the PHY node:
> >   reset-delay-us = <10000>;
> >   reset-assert-us = <10000>;
> >   reset-deassert-us = <10000>;
> >   reset-gpios = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
> >
> > that means I don't need any stmmac patches which seems nice.
> > instead I can submit a patch to mark the snps,reset-gpio properties in
> > the dt-bindings deprecated (and refer to the generic bindings instead)
> > what do you think?
>
> Hi Martin
>
> I know Linus wants to replace all users of old GPIO numbers with gpio
> descriptors. So your patches have value, even if you don't need them.
OK, then I will send my patches anyways

> One other things to watch out for. We have generic code at two
> levels. Either the GPIO is per PHY, and the properties should be in
> the PHY node, or the reset is for all PHYs of an MDIO bus, and then
> the properties should be in the MDIO node.
our Amlogic boards only have one PHY and all schematics I'm aware of
route the SoC's GPIO line directly to the PHY's reset line.
so in my opinion defining the resets for the PHY is the right thing to do


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
