Return-Path: <SRS0=JCZT=UJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C57D0C31E41
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2019 15:51:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99CD620859
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2019 15:51:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jjr2mVAo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Sl+8Rmb2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99CD620859
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tj86PVbh84TbXzYIefxN/98DHuHQuQRKC63yOV0Cixg=; b=jjr2mVAosBu2Y8
	TzSS/MvsiAp4izD99WC3tGvcmlUMbdIIA/yLQWqSkLnvTeiEZdOFyyeAg5840JPxoa4aRLlUs6Tfz
	c0pTDhKeMTykfVSnaXmbru6h4Isqbl1t4fGbJyOK9k5cuNgjUKhW12wLng1g19obxLFzyjoHIw2hj
	Za5ZBYOnjCDMWSt66sC/PK+sIu3/uDLKvFUB7Go09N8tVOAi3/eAUCR2ERBSlbgbSvGuAs18SslBu
	LP3YQHI+DkVFawr37AjT2xjVq+nIumRnmUbsK7As0Kc5u5To1dtyBb/F8dckEU0PAS70okX5uhsBz
	YShfWKgBWykNOt1vaOkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1haMaB-0002gZ-Tt; Mon, 10 Jun 2019 15:51:40 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1haMa9-0002g6-AH; Mon, 10 Jun 2019 15:51:38 +0000
Received: by mail-oi1-x241.google.com with SMTP id q186so6613957oia.0;
 Mon, 10 Jun 2019 08:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZuHcFSp9RV6IeTzjDjOYf2cyyZ7YnVvyyWSJ347qo6A=;
 b=Sl+8Rmb2SbYgcshM1Z0Js0gffJMpHV6iNwuBeKkftDEg6qJgrbJkm+yybg3CWqzJ2x
 qR/7WtHww9+6woEtKc/YlVDtO0g8Y7A5kuCpvgscXSZXtgke0JyDjp7/Ew/b8W3AI/1n
 gk/fXnfGrZlppgM50p9VnIWFn0op1rziV+e31gh6EDInrEX50Zgw9lXzNQTzACC4Jz4y
 xuZfkn9Py55sJbkDpD6NHuD5fTNDddBbEKMWUsAunWtMuSUEU6AKzYsvxiPACEuq19TJ
 TR+RMKGFu9vNaEkKqQAk3oVJ4ZRkCumfzKglVgjyGf5iNvXv1fklUHBgHDDTgVFNNHmA
 0rXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZuHcFSp9RV6IeTzjDjOYf2cyyZ7YnVvyyWSJ347qo6A=;
 b=Q9yURTyO/0iLZYCbdjxPm4AW6oSL3yKT3yeu/f/DsSdqXOf9eeIpdrylgV6iH2iGXy
 2a+NlYvv4nsv/QOgo9Zbs+Uy38HrDyLjUeoF5KGgUniEcgkURri1xiIkp2oR7kavQIB2
 ZN3cCi7bKX1tW7M8Yx1YTTpN1+Z8xsOkYGpyOqnNkNCiKZ0XS8kjrgpc9nUQXxXlx7M+
 jVaj1ATax52KMoQ1eqbr+utwBDXzc3WnRkq+RT6BU6/kihAkFob1q08PRuwa3cVHWwwW
 xdYFqSoN+LXUzEt7um2llBniRuocdwg/clqblSyPb4kpOVf7dQ4nOOS8ke7NZxvgzlZA
 VMtA==
X-Gm-Message-State: APjAAAWO4ctrUqXHzw04ePmLovtyTSaqa+2c0eiyzR/Pq3bY2o1kFyWn
 ejny8e8Ikwu/ikeKTzRQASsR45Rml/weVZvgVbs=
X-Google-Smtp-Source: APXvYqwamDEZ2pn1KOIAFzWrcT6R7MpvRaH+7gsnVBBoMuB1pYAjxIlbqNIxs3Use8vvJu0GGPKKrdLueixgJ+eH8z4=
X-Received: by 2002:aca:4403:: with SMTP id r3mr12815875oia.39.1560181896310; 
 Mon, 10 Jun 2019 08:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
 <20190609204510.GB8247@lunn.ch> <20190610114700.tymqzzax334ahtz4@flea>
 <CAFBinCCs5pa1QmaV32Dk9rOADKGXXFpZsSK=LUk4CGWMrG5VUQ@mail.gmail.com>
 <20190610135109.7alkvruvw2jbtwph@flea>
In-Reply-To: <20190610135109.7alkvruvw2jbtwph@flea>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 10 Jun 2019 17:51:25 +0200
Message-ID: <CAFBinCAy=YR+qV=vYtAV4p5ftcR-VuYTJz3wuMY-k6PWcmbDQQ@mail.gmail.com>
Subject: Re: [RFC next v1 0/5] stmmac: honor the GPIO flags for the PHY reset
 GPIO
To: Maxime Ripard <maxime.ripard@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190610_085137_352308_DE0DC0D4 
X-CRM114-Status: GOOD (  19.81  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, alexandre.torgue@st.com,
 bgolaszewski@baylibre.com, netdev@vger.kernel.org, linus.walleij@linaro.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, joabreu@synopsys.com,
 khilman@baylibre.com, peppe.cavallaro@st.com,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jun 10, 2019 at 3:51 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Hi Martin,
>
> On Mon, Jun 10, 2019 at 02:31:17PM +0200, Martin Blumenstingl wrote:
> > On Mon, Jun 10, 2019 at 1:47 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > >
> > > Hi Andrew,
> > >
> > > On Sun, Jun 09, 2019 at 10:45:10PM +0200, Andrew Lunn wrote:
> > > > > Patch #1 and #4 are minor cleanups which follow the boyscout rule:
> > > > > "Always leave the campground cleaner than you found it."
> > > >
> > > > > I
> > > > > am also looking for suggestions how to handle these cross-tree changes
> > > > > (patch #2 belongs to the linux-gpio tree, patches #1, 3 and #4 should
> > > > > go through the net-next tree. I will re-send patch #5 separately as
> > > > > this should go through Kevin's linux-amlogic tree).
> > > >
> > > > Patches 1 and 4 don't seem to have and dependencies. So i would
> > > > suggest splitting them out and submitting them to netdev for merging
> > > > independent of the rest.
> > >
> > > Jumping on the occasion of that series. These properties have been
> > > defined to deal with phy reset, while it seems that the PHY core can
> > > now handle that pretty easily through generic properties.
> > >
> > > Wouldn't it make more sense to just move to that generic properties
> > > that already deals with the flags properly?
> > thank you for bringing this up!
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
>
> I'm glad it works for you :)
>
> > instead I can submit a patch to mark the snps,reset-gpio properties in
> > the dt-bindings deprecated (and refer to the generic bindings instead)
> > what do you think?
>
> I already did as part of the binding reworks I did earlier today:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2019-June/658427.html
great, thank you - you have my Reviewed-by!

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
