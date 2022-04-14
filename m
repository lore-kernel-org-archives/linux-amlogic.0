Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C11C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Apr 2022 16:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IhiNr2ZDDV1JChSgX2KHtVgxBufL0qBv7WBx3Nl1bgI=; b=EBLT4H923/bfpp
	/1Tv1/elSDsDV7wUibSxeDItB44XUq/ksQAfj+mO4HhdcJCb3ks3iQEMoFXRMNY3A+hJRwq39OrD1
	nx8G5nGxX0X6O58NDJm9wr0kbJ9e+xiEfTH4yQszMEuJjfHgUgMDHnkhjM+y+n/1xKp/YMym4ODN2
	eplQE9kjep2pVHtPveAkxIpSF+Gfry76TBYj+cyESEnM40GvkLKi9Cc+sFMxgz9WB/wDJYWb0XF9/
	wJ++LN2PyrT+6MHJ9ZozYfrqqAkL8H2ofYsJR/CYkvE+ef9AIZxjgdf1IYMRLmwhDLAhxwcMmxuED
	24Nz1NAeVX1GrcF8EPAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf203-006LdJ-Cq; Thu, 14 Apr 2022 16:07:15 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf1zr-006Lbj-NH; Thu, 14 Apr 2022 16:07:05 +0000
Received: by mail-ej1-x636.google.com with SMTP id l7so11001710ejn.2;
 Thu, 14 Apr 2022 09:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JZ9b/z89dch9gLvF5vASMxbmJ/Wzdwmfjy6OZsSqtqA=;
 b=L5sP55TAgL2AI4FDkJ+eMhfVeG1Y6n+mayllGbh7HAbtrbX8Kq31bKTjMTAqXQRdL+
 uxf5PF0+vennnKdDh1T5GXF47ae2ZFWslbFdRB1FcgBWFjZOP1tG9QRTiMQ5+OPvrUiI
 uvKkZBe1bmA87leVgy4H4aHNqAh9Ddz8maIOFpwfFldbi/9KASDbBidQAReNFKsRndjF
 mLrjHMWmyxtIw+DEVEBY5vPe4CNbEs7P2o7fRt23W0xo0/MlvZIRvflgp+6FVESYhKzj
 /+fwRMHo3W2c6bb3X30RDhJQAUPQQznabpXEXbKrWgIMGkIjBbescnE/2k5wlzkTPJ5D
 PnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JZ9b/z89dch9gLvF5vASMxbmJ/Wzdwmfjy6OZsSqtqA=;
 b=N3xLZGcuBjLiR1kJCqA4t7mkImSN5yuQ96/vCCRsLj7gXuuijFwl3B6V+7N3b0Drf0
 HonZ1S6n1QFKuPE1oP+RfgpwHMunnJAv7AYQkyLOy1gP2qXb/0GQIXmgmYyGC8oBrkzZ
 qigyJJWnjdCfk0wMU6p8dXRnpwQcx2HbZ8aEglmB1eJ4S+55ZIE2eIJhBd0oC3BnqFFi
 ZC48lfvZGXOcCqmv/C5XryF4CytTt+WOGt3Mgz1N1iYLOn2xlJjcTmXVNi0Qt/i6Izat
 tFQw2gc0WlnedBAyk6c9Wx0WY9fbbCK+LUhjliTaR+AD5Kz29TmGVARpKTR0KG4Jg1yE
 YFJQ==
X-Gm-Message-State: AOAM531c7sjty28fhInnNDz0p+jF70/NHQ6BU36AjUw1w/Gifefs27UG
 BpX9YRA7juteRU/RRwxYKrpr6Bf2EWovZUAuSFc=
X-Google-Smtp-Source: ABdhPJyF91NZOaGxS5Pl0tuT7o0nmwxyK0YmWaO6cyOAzEQDgBQtN5VcAICIZk16A9Jhgd3oPfGbcQ4Yyrca0dRmbw8=
X-Received: by 2002:a17:906:1692:b0:6e8:d245:44a9 with SMTP id
 s18-20020a170906169200b006e8d24544a9mr2933455ejd.639.1649952418435; Thu, 14
 Apr 2022 09:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <CGME20220414063849eucas1p126e41b53ff0d342f5c48408994b704e9@eucas1p1.samsung.com>
 <20220401103604.8705-12-andriy.shevchenko@linux.intel.com>
 <3a24ef01-3231-1bee-7429-dce5680c5682@samsung.com>
 <CAHp75VfMPpfeMpawRyLo_GtLR8+gVGgm8zW-fatp6=9a9wK18A@mail.gmail.com>
 <CAFBinCCCtZvdp+01DdEE=-f7rZ8V46O125wKDqE1muA645sdUg@mail.gmail.com>
In-Reply-To: <CAFBinCCCtZvdp+01DdEE=-f7rZ8V46O125wKDqE1muA645sdUg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Apr 2022 19:06:21 +0300
Message-ID: <CAHp75VcYaGmEruEsi2UUrLU4=k3OpBn2YV8B0LhyrhtQ=uCTXg@mail.gmail.com>
Subject: Re: [PATCH v4 11/13] pinctrl: meson: Replace custom code by
 gpiochip_node_count() call
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Qianggui Song <qianggui.song@amlogic.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, Tomasz Figa <tomasz.figa@gmail.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_090703_814698_CC125735 
X-CRM114-Status: GOOD (  20.65  )
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

On Thu, Apr 14, 2022 at 6:32 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> On Thu, Apr 14, 2022 at 3:51 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> [...]
> > > This patch landed in linux next-20220413 as commit 88834c75cae5
> > > ("pinctrl: meson: Replace custom code by gpiochip_node_count() call").
> > > Unfortunately it breaks booting of all my Amlogic-based test boards
> > > (Odroid C4, N2, Khadas VIM3, VIM3l). MMC driver is no longer probed and
> > > boards are unable to mount rootfs. Reverting this patch on top of
> > > linux-next fixes the issue.
> >
> > Thank you for letting me know, I'll withdraw it and investigate.
> If needed I can investigate further later today/tomorrow. I think the
> problem is that our node name doesn't follow the .dts recommendation.
>
> For GXL (arch/arm64/boot/dts/amlogic/meson-gxl.dtsi) the GPIO
> controller nodes are for example:
>   gpio: bank@4b0 {
>       ...
>   }
> and
>   gpio_ao: bank@14 {
>       ...
>   }
>
> See also:
> $ git grep -C6 gpio-controller arch/arm64/boot/dts/amlogic/*.dtsi
>
> Marek did not state which error he's getting but I suspect it fails
> with "no gpio node found".

Would be interesting to know that, yeah.

The subtle difference between the patched and unpatched version is
that the former uses only available nodes, it means that node is not
available by some reason and then the error would be the one you
guessed.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
