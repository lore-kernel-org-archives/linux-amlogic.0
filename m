Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B267EC4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Mar 2022 12:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HS0XrCjxhEA3n4RiOFdnz7YU8GA3XxnNS8jATcMXWBE=; b=S6OBPeVv7OXpKv
	qjoBESzlOQrSfwCapRXhUYFc3uJVrmOI6KKm7+JavIUNhyY2UkeaQ7Jtzum0VBG76Wyvj/cizb9ja
	1SOr9PdBg/qqUJwmYLDTi0wnvz9mHBN/KxMo+/r0XF4RPT/waNTnMIsxjO3CYCxJLIPeF8Z1LAD91
	07Q09ZzGcQXPU4jqWWtUPrgKPJ3hVaFqp2MnbjLCyO8lJCVGnjUHJld6S6aXotY09zqz4b1J32qhM
	bFY0WDbaLryLB+exug2SDX9iQEBC/7X1TX2bAraH6X9qE9/p26ZepuHgAiD7sdM6H4SYqWH48bTSN
	6lxk8whpaYWVkN6rUvbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZXnb-00FsZ0-MU; Wed, 30 Mar 2022 12:51:43 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZXGK-00Fd8v-C2; Wed, 30 Mar 2022 12:17:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648642640; x=1680178640;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=degjoFghFkob5qL3ehvoGOpozoU5J2XRIt2L6L1iub0=;
 b=nTm/U5w+R+TmMvsK5nXBcKiwKB8ex0NdECB5/lRCuLih26RF5hs4a0q0
 cR04ZfkUZYCB7zFPlkZP635ZnQEfpeosZbVufs5gHOx06g3ni9jykIdfe
 JqNaR3LVFbn63PWXwYQI/9BCRPk2CN6PSceZFomtADTd1gSZOOUZtLJRh
 GaWe43bC7lCbfveMPu0YDFw7muNuWTfrROnrFEuCW2F6/1rYFS0F+I3t7
 59rR8Jeg2XzXeTwrW/V+ph/hUSV09MohB4GcL1CcwlpDh4ng8/FM8BH5P
 EEvTOgw+GO+aITa9qkjIT5e50cSpahCjKvk64NRgUBZ/cLZ6PaxvIGncx Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="241683610"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="241683610"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 05:17:19 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="565512740"
Received: from smile.fi.intel.com ([10.237.72.59])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 05:17:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nZXFc-009OGn-0z; Wed, 30 Mar 2022 15:16:36 +0300
Date: Wed, 30 Mar 2022 15:16:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 07/13] pinctrl: renesas: rza1: Switch to use
 for_each_gpiochip_node() helper
Message-ID: <YkRKI6W4vR/aCr8c@smile.fi.intel.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-8-andriy.shevchenko@linux.intel.com>
 <CAMuHMdWs+OuxV0cO=XGYvOOJ0Mctwu6fKV5HnkdRBXNKkLE3uQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdWs+OuxV0cO=XGYvOOJ0Mctwu6fKV5HnkdRBXNKkLE3uQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_051720_528172_EF4F6564 
X-CRM114-Status: GOOD (  13.56  )
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

On Wed, Mar 30, 2022 at 12:00:27PM +0200, Geert Uytterhoeven wrote:
> On Tue, Mar 29, 2022 at 5:29 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> > +       struct fwnode_reference_args of_args;
> 
> fw_args?

Perhaps just args as other drivers do?

...

> > -       chip->label     = devm_kasprintf(rza1_pctl->dev, GFP_KERNEL, "%pOFn",
> > -                                        np);
> > +       chip->label     = devm_kasprintf(rza1_pctl->dev, GFP_KERNEL, "%pfw", fwnode);
> 
> This changes the label from e.g. "/soc/pinctrl@fcfe3000/gpio-11" to "gpio-11".

Hmm... It seems other way around, i.e. it changes from the name to full name.

> %pfwP?

But conclusion here is correct. Good catch!

...

> With the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for review and testing!

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
