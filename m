Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99EBC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Mar 2022 12:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UwVBapXkCt+Ff3UghHkMp3nTa7PY6zo8kedH0Lt9+2k=; b=Z5O/zemsAZ2vDu
	aF9RFOfciMev3G6c/z1GYUHtoARLjF+CZ+Tmo311xPaxGaQJCgJ/BqxsqHT9cSggVXv1PUNUveXkG
	0cIRj+ivlabxETPRouSLC+CNbjTGYOJmeOMhY7A+qjhJPG84i+1fTRaUr9VFv4EeAOFmmjN3B+WX8
	u2sXdcGHSkD9lBo03YGO9tDbCcPGuSHmDFtlKFkXRVgRVheXsXyq6H5byI1NtPfeTR7Qpjka0+FdK
	MV7LYWYfcL8VRwD0qmL6rjVabZuww1+uLHxi4XX2LeT2pkek1VCT8LDAov8X8UylW5i0Umj8V3lkx
	4J3yGWs2eVekEjdFOxEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZXrc-00FuOp-NZ; Wed, 30 Mar 2022 12:55:52 +0000
Received: from mail-qt1-f176.google.com ([209.85.160.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZXKo-00Ff7F-MX; Wed, 30 Mar 2022 12:22:00 +0000
Received: by mail-qt1-f176.google.com with SMTP id i4so17846605qti.7;
 Wed, 30 Mar 2022 05:21:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UOWc2z4o6DC6pqDz0yydlogP1ndPfXTDpB2t/FafZMU=;
 b=gQvIJoDBkaFhK6fajTh+xw4iYap+yqhqyqMgDvnw+RJ+UnF1wYIrU14SKd/nu6tqEt
 9n6+wji6ZuTcxUNKsIN7rVmXzrLDgDJurHKrjl+JMv6FA/5SKx1RNihpB7GP9pdguYjm
 uSaqvnkE3Y4c0zFvFeikjsriIihS3UpfTmmG6dsajAFJSPL3TOdjLezdssCjEDQ6Snu8
 +WvLWUZdrFmCFkqPkFeZPF0aYHwulhEQyO5Gfcr2Fgy461rdSHHTcrSOSaq1SJ/ki9pv
 CnY8kNSqSXERqgsD76YfI6pxiTZmo8Xb1zvJJESE9KOlMMSbg2zcUiqgDs2WGzZoRWja
 l/qA==
X-Gm-Message-State: AOAM533aNx/viB9sxtiteEYZ5Z7KpnPWM8EoUjwV06qqYxZ75c6xjZ5l
 eMd6snSee85t+yF0U5I4WQhUG42WWRNyNg==
X-Google-Smtp-Source: ABdhPJy3PMZcI3NFJOlYGJpaGPsTXKWmt+r75C+wRY4JPfpVs3qeswOcv7LlPdRV71pB1RIlcTvVSw==
X-Received: by 2002:ac8:5787:0:b0:2e1:c837:64ed with SMTP id
 v7-20020ac85787000000b002e1c83764edmr32611959qta.98.1648642916224; 
 Wed, 30 Mar 2022 05:21:56 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 s16-20020ac85cd0000000b002e1ed82f1e5sm18166132qta.75.2022.03.30.05.21.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 05:21:55 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id m67so36487373ybm.4;
 Wed, 30 Mar 2022 05:21:55 -0700 (PDT)
X-Received: by 2002:a25:9e89:0:b0:63c:ad37:a5de with SMTP id
 p9-20020a259e89000000b0063cad37a5demr17071596ybq.342.1648642915183; Wed, 30
 Mar 2022 05:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-8-andriy.shevchenko@linux.intel.com>
 <CAMuHMdWs+OuxV0cO=XGYvOOJ0Mctwu6fKV5HnkdRBXNKkLE3uQ@mail.gmail.com>
 <YkRKI6W4vR/aCr8c@smile.fi.intel.com>
In-Reply-To: <YkRKI6W4vR/aCr8c@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Mar 2022 14:21:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWiL+R=9NSgpxo+9e+_8jj9zm4nGwcfejap5z3XdYYtwA@mail.gmail.com>
Message-ID: <CAMuHMdWiL+R=9NSgpxo+9e+_8jj9zm4nGwcfejap5z3XdYYtwA@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] pinctrl: renesas: rza1: Switch to use
 for_each_gpiochip_node() helper
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Qianggui Song <qianggui.song@amlogic.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Fabien Dessenne <fabien.dessenne@foss.st.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 openbmc@lists.ozlabs.org, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Linus Walleij <linus.walleij@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Philipp Zabel <p.zabel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_052158_777156_DE35EB75 
X-CRM114-Status: GOOD (  22.41  )
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

Hi Andy,

On Wed, Mar 30, 2022 at 2:17 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Mar 30, 2022 at 12:00:27PM +0200, Geert Uytterhoeven wrote:
> > On Tue, Mar 29, 2022 at 5:29 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > > +       struct fwnode_reference_args of_args;
> >
> > fw_args?
>
> Perhaps just args as other drivers do?

Fine for me.

> > > -       chip->label     = devm_kasprintf(rza1_pctl->dev, GFP_KERNEL, "%pOFn",
> > > -                                        np);
> > > +       chip->label     = devm_kasprintf(rza1_pctl->dev, GFP_KERNEL, "%pfw", fwnode);
> >
> > This changes the label from e.g. "/soc/pinctrl@fcfe3000/gpio-11" to "gpio-11".
>
> Hmm... It seems other way around, i.e. it changes from the name to full name.

Oops, sorry about that.
(I accidentally included the change from testing "%pfwP" ;-)

>
> > %pfwP?
>
> But conclusion here is correct. Good catch!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
