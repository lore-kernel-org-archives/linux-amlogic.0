Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C05C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Apr 2022 11:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DnsL4Ffz17h5ht7lcd5K5XN4YO5aFHb6ER1kmXhmD1w=; b=ttEEvV2p+1JCpl
	3s82Fj6/GpPAq1lRBKzndbiQBiKByF8bYulcdLUqP36QENwU+Jn0tu0dXn8XUc1909FVMxLzGAPPz
	wV/Hf5oPBbjCOCbP84/Uka+SJWwB5B2X1jG+XnsMQc1JaZ/Wv3oREIkiIVsQRUoriPmmiGYy7gCfb
	pROzuyo5b+mPQGLAzDiZcFM61u2nOy6hLs0TIVN1EJl1HOPSRpqnW2Bxj9+QHPsFhbG+NVgaxupvd
	d05whBPWricC42ixuQ0vbMjMOlqdcU+WNZ9pMwt6iUiJx+x1IYtiOY1BwkLzHKCCvl8mJlCEzKHzi
	VFJ6+NXrhx9Esmbvcr7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndsUG-008lLe-NA; Mon, 11 Apr 2022 11:45:40 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndsU5-008lIe-7M; Mon, 11 Apr 2022 11:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649677529; x=1681213529;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r5Ar8qxrxZpK4XRu/tA3qWYavit0uwaROYPXccoJAjE=;
 b=leR+6MD1TauS60Hf5EbzB8QQEfSB2aul1EDlEe/1GqNyo6A5T9u4861M
 LIEfCTwCJ8p30LDWOxNg2Sxh3Z1rWGABougBpw6iPR2sDruR/f9LKkAkm
 lD2JgZNn0CIe/9dhWxy1h//H816i3i88o842d0Eu6Q4wTstbzNQDPLeNS
 +lch2tAT1ozUApKHre2LdpCt2anKA0o1fdiyqRfUVUvcv5825rQ6VH9GS
 xgxZcF54Gd5cI6jAX2IhRY4giuAGXd57w84ACqnim3oYf+SvL6hrhOJnK
 Zjla1QGEZS+aWdSVIMOAuu3q5mMprEYi9v5FyoiS1RcFFQm/owStlkJCf w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="325007489"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="325007489"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 04:45:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="622798226"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 04:45:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ndsQJ-001CCZ-MO; Mon, 11 Apr 2022 14:41:35 +0300
Date: Mon, 11 Apr 2022 14:41:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Qianggui Song <qianggui.song@amlogic.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 openbmc@lists.ozlabs.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
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
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 09/13] pinctrl: meson: Rename REG_* to MESON_REG_*
Message-ID: <YlQT7w1XSbnkNI9E@smile.fi.intel.com>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <20220401103604.8705-10-andriy.shevchenko@linux.intel.com>
 <CAMuHMdX8zWA-3_=Je7sB_72G8Ky7-syqCH-RXGxNMazUipW-2g@mail.gmail.com>
 <YlQAn9+4kdB0F/4d@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YlQAn9+4kdB0F/4d@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_044529_408103_7980E42C 
X-CRM114-Status: GOOD (  11.77  )
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

On Mon, Apr 11, 2022 at 01:19:11PM +0300, Andy Shevchenko wrote:
> On Mon, Apr 11, 2022 at 11:04:00AM +0200, Geert Uytterhoeven wrote:
> > On Fri, Apr 1, 2022 at 12:36 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:

...

> > >         NUM_REG,
> > 
> > MESON_NUM_REG?
> 
> Hmm... Only one place where it's defined and used, but I can do it, sure.

Updated locally.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
