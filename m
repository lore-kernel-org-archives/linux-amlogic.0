Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A067EC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Apr 2022 10:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a26XGjyEm0YnU9b8XwEAPjEnFLFpR7KqyX9McafPuLg=; b=c2eZhnhGxfQS2c
	P+AFmun5gk/3K7dTemkW4U/WcgWDRIfvN2JE60WKwpnnkelq/FkikBEeZv7Fw8xxHpn9TfcnYdA3E
	ouEgMh9vFCbCQoWlNxBrdAq1ugKX7how7O9wOSF9uBxIis24eYAmgqxJJcrHCeopCi8tLKHzGCSna
	TrrUQN2oNQ1U433HWCK2NW5nO+sM7TYriqbueZ8/MXprhR9gIvo7lFnemzthabsKjU++1QLdILdPJ
	DET3H/iyqEhGOCvIbY/6koq6o53EePZEckYCMqfcb2Gvs4e91C3UbtjTMhxrKXbgUfsmCjARG0Cdo
	entdgf/htgKhqZh1HcZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndrQH-008Oyi-VP; Mon, 11 Apr 2022 10:37:30 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndrCJ-008Hyp-Rj; Mon, 11 Apr 2022 10:23:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649672583; x=1681208583;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W9PBitEIG3h2GlCxu7zEfN69pBWFXH7+lRg/Bcxe/tU=;
 b=ZC2AF/cQqGnjY0Nl8jXOyt1X+DC9kvD5J9JyFcXXqQPEY/VQI9iR+3y+
 BZBK69/4cxiBqxv2KVmkAAXtonoy7UwiQ0nYGbY3eFXaFP5fGydnJmEVM
 7V+pIHDTeh5WcRvXynVCAQuyc86fdVWpI5jGQ83zAYewKnUlvlcfAxunS
 qh82tKGwktz2/l37Xql6W9cfBQergipHxxi5o8pNzxMIKDXvhwIAZg/gF
 9EOzW88CukEcjdJuF5yTVaGrirkMgUOmcFCaK4tMbEyqY0IzKn3tEqPJM
 k8zii7kYDlKjYQ5KLgTAfUIPrIY8SUTALimeVO366mXVvrBV70PSa1fJ/ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="261521099"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="261521099"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 03:23:00 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="525460425"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 03:22:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ndr8Z-001B7S-AA; Mon, 11 Apr 2022 13:19:11 +0300
Date: Mon, 11 Apr 2022 13:19:11 +0300
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
Message-ID: <YlQAn9+4kdB0F/4d@smile.fi.intel.com>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <20220401103604.8705-10-andriy.shevchenko@linux.intel.com>
 <CAMuHMdX8zWA-3_=Je7sB_72G8Ky7-syqCH-RXGxNMazUipW-2g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdX8zWA-3_=Je7sB_72G8Ky7-syqCH-RXGxNMazUipW-2g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_032303_989110_30B9CFDE 
X-CRM114-Status: GOOD (  12.81  )
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

On Mon, Apr 11, 2022 at 11:04:00AM +0200, Geert Uytterhoeven wrote:
> On Fri, Apr 1, 2022 at 12:36 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > Currently compilation test fails on x86 due to name collision. The usual
> > way to fix that is to move both conflicting parts to their own namespaces.
> >
> > Rename REG_* to MESON_REG_* as a prerequisite for enabling COMPILE_TEST.

> >         NUM_REG,
> 
> MESON_NUM_REG?

Hmm... Only one place where it's defined and used, but I can do it, sure.

$ git grep -n -w NUM_REG
drivers/pinctrl/meson/pinctrl-meson.h:72:       NUM_REG,
drivers/pinctrl/meson/pinctrl-meson.h:105:      struct meson_reg_desc regs[NUM_REG];

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
