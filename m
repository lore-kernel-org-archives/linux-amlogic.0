Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37570C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Apr 2022 10:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6e+207bP2lYDk2Oc7+0CRwi7iAQVBObRI5eWNSkoVc=; b=Am5ciIz5SEfCq2
	gGlBmydt40IHUrZQHlBQGwjePmHGXxSAs+LgyS3jsgjFXqG8P3RNviFXbSMDPQ4DUDr7uns1HIyR0
	OVr3PFcJpbagBAIBTft4X8M+yU6MyXjj5fFQa6dFu9cLfSQFg8Z1BDEMTU+c2p3pdfLzkS61vrCGl
	XL0xoNvzUBG4/L6A5ZsqUX6WHefRPR3r+Gjg2YbWMpkeJUddtKLym+rTZr5tk6JwcKQYfPfKCx4Mr
	mOSQmD+Bmhe/FUl2cAR5yyec/WguuQJVlLOCofX+tmJlYgRjfGQUzQ+84eDMCBJ94nGLik5GSr2j8
	e5ODc8KG/IXHmYCI7AtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njIYy-00Dw9e-RJ; Tue, 26 Apr 2022 10:36:56 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njISI-00Dslw-QD; Tue, 26 Apr 2022 10:30:04 +0000
Received: by mail-ed1-x52a.google.com with SMTP id a21so9561240edb.1;
 Tue, 26 Apr 2022 03:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LTZivMFTyarowtjvZsLmSz53sJ8fua2clE9JO0AViWw=;
 b=lIWdCje29PhrXiG84AYK/fAkTPVO9Xz9g253ZCUUK+Hp/vIVJWHpPBpQpxQjt53gHx
 iN+KMl6ALYRKvPaDySuc4UsI6ga0mWS7yUdyy3ioev1B1rCpklQalOH4hpN+xw235Odq
 qzwYQ7nm2RsS9J7KXnbza27TlkAtGModTyAulsIPkqvbYSkvBb3fbZQZ3fnhx9Qkmy8S
 F81bBmzpgV9G7Lwiy9JYs+Y8XG0guJEYp+64sAyPjuXHfXh2wTY7MBybgQ0OywzWM/tv
 e5UWhtV2yShw2LYoY5EqceFDrdtWuU99L2ButNyqfdos3WS80fS9s6oh7C8WYyf1TfOx
 h3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LTZivMFTyarowtjvZsLmSz53sJ8fua2clE9JO0AViWw=;
 b=zhtgzYvmz/k7sm+kgEy8Ia/59BURGv3RS3sdr5AP20MZW6PF0T3TYg60QoejHoatY3
 211oXlJsIOBOVIU97DtbircU83hYG6nPG4Sz0r/JtGoIoChYg6m5r+WTIj9qEsEiTLxd
 bC0h5v7XEEwUXMufKUHlYAM1ctQDJdtIH/p+bqLfn/5ogrsszrz6pP78+Pwm0kFKbfnQ
 akvzn09WStyYPL60OdAz0svW4d13TFmMU1w9toMLXw3zMBHd0NznY4LS2dyRmta/6VKi
 r6MFpN3N+4NLXp/lp+B15U6pPp5D9LftvT77uyQrClouKTDqm6ffsu5VIuHo04M4i2ls
 M9xg==
X-Gm-Message-State: AOAM530JnCDtzg1/jhILnA0cNu9OMx7LmIuVo1nOhVuP4X9wwcKquGMt
 rcr5YRONEP1CTo958JUJMz5bag8XM2UEvQhZurM=
X-Google-Smtp-Source: ABdhPJyDzGgT65bNt9vthGlanF7wSx2um9g1nmHGK2QB5fZUPfxvE2f7p5FkhAVNQhWvys1clS4g3RswY5rO293PZcM=
X-Received: by 2002:aa7:d350:0:b0:425:e029:da56 with SMTP id
 m16-20020aa7d350000000b00425e029da56mr12360614edr.296.1650968999090; Tue, 26
 Apr 2022 03:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220414190242.22178-1-andriy.shevchenko@linux.intel.com>
 <20220414190242.22178-2-andriy.shevchenko@linux.intel.com>
 <CAMRc=MfE0othcfwETf13_K3sOLKmUGwCnjapzVjLMk1cD+ihVQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfE0othcfwETf13_K3sOLKmUGwCnjapzVjLMk1cD+ihVQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 26 Apr 2022 12:29:20 +0200
Message-ID: <CAHp75VcpZPB12Y4FVN4h9RdkvYQfELtbRnd08FfPpG1cJG-99g@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] gpiolib: Introduce a helper to get first GPIO
 controller node
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_033002_926677_E9ED013C 
X-CRM114-Status: GOOD (  16.76  )
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

On Tue, Apr 26, 2022 at 12:27 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Thu, Apr 14, 2022 at 9:02 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Introduce a helper to get first GPIO controller node which drivers
> > may want to use.

> > +static inline struct fwnode_handle *gpiochip_node_get_first(struct device *dev)
> > +{
> > +       struct fwnode_handle *fwnode;
> > +
> > +       for_each_gpiochip_node(dev, fwnode)
> > +               return fwnode;
> > +
> > +       return NULL;
> > +}
> > +
> >  #endif /* __LINUX_GPIO_DRIVER_H */
> > --
> > 2.35.1
> >
>
> Any chance you could name it get_first_gpiochip_node()? It's static so
> we don't have to worry about the prefix and it would make the purpose
> more clear.

There are two things why I prefer it as is:
1) it's static inline, so it's part of (internal) but still exported API;
2) it's already in my for-next branch which I would like not to
rebase, until it's a really serious issue.

That said, if you still insist I can rename it.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
