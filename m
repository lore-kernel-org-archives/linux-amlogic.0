Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0716C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Apr 2022 15:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZREFzX2j6WoW1r1YxQJj4CFz75gTtzMeI6bC/GqVDw=; b=KElKimgdFkyU/+
	4VFqomVOwvgA8sWO1LlCxmmzvRPCVQPlZ2k+R81jLVuiHRmmLorTAWtkTB15a3N08aWqGA/4oOR3s
	jimsXKeK9DtXB3N5KVlElBtR6Ji9Iu1gN2gulXswrYXbbaWkQfCfe9flHcnDavVPy1yM7UtQsKzPA
	AKBb1gRHZ3bB2RcCgDBiHkGSTOBjE1vq+VchZiIcFAY0XJ/q2ixnBVTwm2kg9oI2IGYwCw20aNf5/
	xo+yLJw03PTRRA55wuaqkh5eY+O2pcgtlIbGlxq/9Nrhr/EZSfgmjH50vVAJTgFAR/BgXb+6FwpCX
	5OaIAFYQT1fkbCxOlqkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncqoC-000KvM-C9; Fri, 08 Apr 2022 15:46:00 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncqnz-000KSH-3a; Fri, 08 Apr 2022 15:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649432747; x=1680968747;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gcJtOPIX2/0B3YxiUGz/EyzDxp0SAsqb/v7kxf3M3BU=;
 b=BkXxHMTg8Z0dN5PTlSJXuANjOCbzOWFLBilAlkaVlBTQLTKXgcF8pDEU
 1YxquhIZNbc+PHTm63n+1S8PsTNP4KMZ4SuEjA36YaIMCdhl3ehvRRVkt
 HMoxjzBaow3U50I+9nSvoRZm94/NfDe0TEMhYDHM6mzRkV13H1WYXSc0K
 OgsgZyLmLc4ZYF6z/iFYZv8/mzSf7ioAwlwrUPCnhZxpKFy79bRIrZtgm
 vkbSlU2WNj+YcVXMnmhwfsy5a9zOOLKAFGSCm99kW9yQt+IfXMVwPI/0I
 rf0p65vXbWuvhDBiI6xPhhL2XvRdonXzujImsO6jtNUsXfFq2fpQQCjz0 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="261309791"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="261309791"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 08:43:44 -0700
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="589257568"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 08:43:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ncqiH-000Lsk-PD; Fri, 08 Apr 2022 18:39:53 +0300
Date: Fri, 8 Apr 2022 18:39:53 +0300
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
Message-ID: <YlBXSVyj88CqjGj4@smile.fi.intel.com>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <20220401103604.8705-6-andriy.shevchenko@linux.intel.com>
 <d1f873c6-150f-5f4d-7aa8-7bb15823d991@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d1f873c6-150f-5f4d-7aa8-7bb15823d991@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_084547_216596_8554018F 
X-CRM114-Status: GOOD (  19.56  )
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

On Fri, Apr 08, 2022 at 05:22:21PM +0200, Krzysztof Kozlowski wrote:
> On 01/04/2022 12:35, Andy Shevchenko wrote:
> > Switch the code to use for_each_gpiochip_node() helper.

(...)

> >  /*
> >   * Iterate over all driver pin banks to find one matching the name of node,
> >   * skipping optional "-gpio" node suffix. When found, assign node to the bank.
> >   */
> > -static void samsung_banks_of_node_get(struct device *dev,
> > -				      struct samsung_pinctrl_drv_data *d,
> > -				      struct device_node *node)
> > +static void samsung_banks_node_get(struct device *dev, struct samsung_pinctrl_drv_data *d)
> 
> This is worth simplification anyway, so please split it to separate patch.

Not sure what to do and why it worth an additional churn.

> >  {
> >  	const char *suffix = "-gpio-bank";
> >  	struct samsung_pin_bank *bank;
> > -	struct device_node *child;
> > +	struct fwnode_handle *child;
> >  	/* Pin bank names are up to 4 characters */
> >  	char node_name[20];
> >  	unsigned int i;
> > @@ -1038,17 +1037,17 @@ static void samsung_banks_of_node_get(struct device *dev,
> >  			continue;
> >  		}
> >  
> > -		for_each_child_of_node(node, child) {
> > -			if (!of_find_property(child, "gpio-controller", NULL))
> > -				continue;
> 
> This does not look equivalent. There are nodes without this property.

Not sure I understand why not. The macro checks for the property and
iterates over nodes that have this property.

Can you elaborate, please?

> > -			if (of_node_name_eq(child, node_name))
> > +		for_each_gpiochip_node(dev, child) {
> > +			struct device_node *np = to_of_node(child);
> > +
> > +			if (of_node_name_eq(np, node_name))
> >  				break;
> > -			else if (of_node_name_eq(child, bank->name))
> > +			if (of_node_name_eq(np, bank->name))
> >  				break;
> >  		}
> 
> This patch has to wait till someone provides you a tested-by. I might do
> it around next week.

Fine with me, I will drop it from my repo for now.

Thanks for review!

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
