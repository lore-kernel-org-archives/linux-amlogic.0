Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7E3C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Apr 2022 12:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZmiUP2lrhXqViooDHPxPYJyRrYpFYEv085d9gU6QXc8=; b=yje9qOsn8FlaB3
	Qj12h/IuQtZYdSHeta0Ksbtx4c6mGeQ1f+BcxsMBBn5FJnJxd4Lmi53Xy/MQsGLLyxbMtNP8h61Gn
	uPwvW1OjcL3s08rOu0R1zB9Q/EWs6f0ZyPvgh6/S5XunTUXfnfihwi1s25xezSVEGkSz2aehHESuF
	LQNx3CQo9Ny1HJbt39k/X3GijmhiGIB30HpjK5xdlqlu6+9KZUi9nFkpGiDZWufO4Wikwcbht2ktl
	CEQ3c6kp82BuSRtLZy1dizrkLoh7ucbsckPziwJxcBp2uZjZ5RvoSIojFx8SeH4PVuR/jqh7O+zqk
	wD+ENsbgMZxg78fHx8XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndsit-008pDC-8q; Mon, 11 Apr 2022 12:00:47 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndsiU-008p0P-Nm; Mon, 11 Apr 2022 12:00:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649678422; x=1681214422;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sC8CyttMimPSNhIr3hh4HcfuM59Ph6N7lGNcafQdvcs=;
 b=Rt/hjiYnVKutx3rEz7hJcr4+wc9eUC/PjQoioRZA8kjo2rXpyTPKhArh
 C2JxzkWBe4Cc8WeGEmFooygYwHfTSEWQbFvfaEbkZSKyGu8ybJr7oPDLy
 4dAb6YnJ1Pln/vrQAKpFaHF/Np3OifYl5rFjN2elgr5Aq2Y0d0UVkK47K
 iyGs6tl0O74L4fBAK0nDL9qZq/URFYWL+xNiVl5T+DJqt2xIByldi4Ebr
 SGuAFEAqlxnXooDr56pdxSuL0KtA+MP93OlAjdCLQX9tc9Q7LBZQz0iRb
 ZWsK7xoy1pMsfEXcvEeUkc9NVp5CMzq5Vo+jONjadno6IHoqBBsAisUDy g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="243981350"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="243981350"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 05:00:12 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="699346695"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 05:00:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ndsed-001CQ3-RA; Mon, 11 Apr 2022 14:56:23 +0300
Date: Mon, 11 Apr 2022 14:56:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Qianggui Song <qianggui.song@amlogic.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Marc Zyngier <maz@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
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
Subject: Re: [PATCH v4 05/13] pinctrl: samsung: Switch to use
 for_each_gpiochip_node() helper
Message-ID: <YlQXZ3Ye13rObMy8@smile.fi.intel.com>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <20220401103604.8705-6-andriy.shevchenko@linux.intel.com>
 <d1f873c6-150f-5f4d-7aa8-7bb15823d991@linaro.org>
 <YlBXSVyj88CqjGj4@smile.fi.intel.com>
 <3b527700-444e-1f6e-fee1-5cd6ed2ef7f9@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b527700-444e-1f6e-fee1-5cd6ed2ef7f9@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_050022_846463_E767ED22 
X-CRM114-Status: GOOD (  17.01  )
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

On Sat, Apr 09, 2022 at 03:33:49PM +0200, Krzysztof Kozlowski wrote:
> On 08/04/2022 17:39, Andy Shevchenko wrote:
> > On Fri, Apr 08, 2022 at 05:22:21PM +0200, Krzysztof Kozlowski wrote:
> >> On 01/04/2022 12:35, Andy Shevchenko wrote:
> >>> Switch the code to use for_each_gpiochip_node() helper.
> > 
> > (...)
> > 
> >>>  /*
> >>>   * Iterate over all driver pin banks to find one matching the name of node,
> >>>   * skipping optional "-gpio" node suffix. When found, assign node to the bank.
> >>>   */
> >>> -static void samsung_banks_of_node_get(struct device *dev,
> >>> -				      struct samsung_pinctrl_drv_data *d,
> >>> -				      struct device_node *node)
> >>> +static void samsung_banks_node_get(struct device *dev, struct samsung_pinctrl_drv_data *d)
> >>
> >> This is worth simplification anyway, so please split it to separate patch.
> > 
> > Not sure what to do and why it worth an additional churn.
> 
> Makes this change smaller so it's easier to review.

https://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git/log/?h=review-andy

That's how it looks like. Tell me if it is what you have had in mind.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
