Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C97C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Apr 2022 18:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ApxYH2sj4Z2Z2zYiJ9KuOPGHfX/hfMCnpv8caX9e78=; b=czvj7mUxHLlpYz
	SEjUZKeRBcU9GX2JEIdlBq676xYqUsazyceFj8hnuaUhHdluTYYMCkW+rD088eoVy5nhwVIN8NAfO
	PkE5+6KBo3ignkNRpEhVi3Pxb/n96kq3epRuoR9yJZS/9jGTxZbtAZnuM0vTd3IlIRg8t9qE5JuQd
	RhUin7Co3m4IAew4ySMUEZzqPms3jUHfmjVgrk/mgmTq71E/QALCceLtlEf3w+UXHIob7vAz3oVBS
	V15gT2GVjErnEewiLYnLy7ikDxktezvBSIYbM/yTdc0uMNGKI2OUXn2PBwSh7//TpCe7IJP6vG/6l
	xUnpb/7QvjpfURa2kjCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf4DB-006tAz-Es; Thu, 14 Apr 2022 18:28:57 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf4D0-006t8Y-Df; Thu, 14 Apr 2022 18:28:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649960926; x=1681496926;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ms5h4jAz7I7FYnpzjU8QQ1aLktOyBK/CNSFMTkKzozo=;
 b=DCOfxDPUgMvslxEZ/t6yNLMOtXMfnZQsIJTU/qd3FCx+2zoAdPChUmdp
 CNYe7S+yxlkqlC8bS9qS/ttjNP88hfVA48uu18f+pwsRZg7RoDVgTNmgS
 LlSf1ILwjTE0CUPssezhYR0WS1eSkCZ+oQ9s7sLTX4D4HEiwuA+eLZRaz
 DcK5kK+A4uiuw8Qq9eYbuhcXE3b3BptyqLlzATl5B9juisfK9B31iVuJV
 3Y5bIEf7y37UxcVE8Bb6UjmYKBe4gYB7qDnP/kLIyGshq2TK9vfg2qehy
 ebRBqkgsh6oQR4bH/+FFiJUXJIBEAfGlQ2+BY+hbu7Lg47PL8GET3wFGS A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="323447286"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="323447286"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:28:42 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="527016674"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:28:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nf4Ck-002Rse-LK; Thu, 14 Apr 2022 21:28:30 +0300
Date: Thu, 14 Apr 2022 21:28:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
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
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 11/13] pinctrl: meson: Replace custom code by
 gpiochip_node_count() call
Message-ID: <Ylhnzg3bvbrfpoFi@smile.fi.intel.com>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <CGME20220414063849eucas1p126e41b53ff0d342f5c48408994b704e9@eucas1p1.samsung.com>
 <20220401103604.8705-12-andriy.shevchenko@linux.intel.com>
 <3a24ef01-3231-1bee-7429-dce5680c5682@samsung.com>
 <CAHp75VfMPpfeMpawRyLo_GtLR8+gVGgm8zW-fatp6=9a9wK18A@mail.gmail.com>
 <CAFBinCCCtZvdp+01DdEE=-f7rZ8V46O125wKDqE1muA645sdUg@mail.gmail.com>
 <CAHp75VcYaGmEruEsi2UUrLU4=k3OpBn2YV8B0LhyrhtQ=uCTXg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VcYaGmEruEsi2UUrLU4=k3OpBn2YV8B0LhyrhtQ=uCTXg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_112846_547753_41ED02EA 
X-CRM114-Status: GOOD (  27.90  )
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

On Thu, Apr 14, 2022 at 07:06:21PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 14, 2022 at 6:32 PM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> > On Thu, Apr 14, 2022 at 3:51 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > [...]
> > > > This patch landed in linux next-20220413 as commit 88834c75cae5
> > > > ("pinctrl: meson: Replace custom code by gpiochip_node_count() call").
> > > > Unfortunately it breaks booting of all my Amlogic-based test boards
> > > > (Odroid C4, N2, Khadas VIM3, VIM3l). MMC driver is no longer probed and
> > > > boards are unable to mount rootfs. Reverting this patch on top of
> > > > linux-next fixes the issue.
> > >
> > > Thank you for letting me know, I'll withdraw it and investigate.
> > If needed I can investigate further later today/tomorrow. I think the
> > problem is that our node name doesn't follow the .dts recommendation.
> >
> > For GXL (arch/arm64/boot/dts/amlogic/meson-gxl.dtsi) the GPIO
> > controller nodes are for example:
> >   gpio: bank@4b0 {
> >       ...
> >   }
> > and
> >   gpio_ao: bank@14 {
> >       ...
> >   }
> >
> > See also:
> > $ git grep -C6 gpio-controller arch/arm64/boot/dts/amlogic/*.dtsi
> >
> > Marek did not state which error he's getting but I suspect it fails
> > with "no gpio node found".
> 
> Would be interesting to know that, yeah.
> 
> The subtle difference between the patched and unpatched version is
> that the former uses only available nodes, it means that node is not
> available by some reason and then the error would be the one you
> guessed.

Looking into the difference between iterating via available nodes I have found
nothing suspicious. Your DTSes do not have status property, so it assumes the
node is available.

I'm quite puzzled what's going on there. Because I can't see what the logical
difference the patch brought in.

P.S. In any case it's withdrawn now and shouldn't appear in the next Linux
Next. But I would really appreciate more input on this.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
