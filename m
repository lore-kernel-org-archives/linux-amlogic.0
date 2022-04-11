Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881A4C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Apr 2022 13:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VnLu7bYn65xqnhTb+WFiLS7LqqYJKoEUtQidJgj5sK4=; b=xd9pkWtK3nSnKI
	TDxyxtDtx940FY4IP+Sd0jswU6Smn4WXPkHsCwsSXdcT9WA9QBWHdR9KIORbAYyS6DV8Y36FA86Nx
	6zspWA1c/DMnce5AM8FSIJkMtcajgfVh06hWThc7BpLNnE70zoRIt/5BlyZft6yVEXAvNUXRFq2sU
	o9zidnVM/9YA03QEnlNo3TeeWsALUoJEKgqR86MKLPt0JrtDpwCfbiAqk2p+CUR10VoTlXU0q6+9A
	cqecZrLt6AXwZXOjUNzT5j7egaB56PA6JUaZaCWdVUEnAGHnjsUIEwJj6qP+gfaae5pn60RARCOOf
	PUo310fZnsvOQ3Zo5bKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndtul-00970D-Un; Mon, 11 Apr 2022 13:17:07 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndtua-0096xz-Oc; Mon, 11 Apr 2022 13:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649683016; x=1681219016;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8NkmJflT2vjOmTzpi2Ay4zQaAbqkNIhnYYU/YH2VLeY=;
 b=Dloq1yYar662wgnmZO3cWhTK+r8nQt0HLR07BgTfTgpQTy55EI80/7HU
 j7/iNjEkWKfbDDeyr+hX4DwRDvQbiHb9HVZnUpeazVRMJ8Q6RtSM/fnpb
 F0UzFXNXRtqdKrFZjr/Q9Gxry9oULE+39pSmneV/ko4UNzsWW3cELPwxh
 KgAhRgt3n9ArBMSo1hFSjED1nIhSSKgYyF6oPcA14W/1SiUsCDAYPxoJR
 9tOeebeQ/UyNPF9CYMveHpm8+/Vdipq5cVoAHpCnGd0PzRXWPOf+MVVcE
 h2gYqRjsN+dOGPn8R2t8vr7wFOCuR5IgOGbX4nJlnorrAUeMWwJ9Imzz5 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="261550851"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="261550851"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 06:16:53 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="644080149"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 06:16:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ndtqp-001DRI-MC; Mon, 11 Apr 2022 16:13:03 +0300
Date: Mon, 11 Apr 2022 16:13:03 +0300
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
Message-ID: <YlQpX0Gu/O9IuhyW@smile.fi.intel.com>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <20220401103604.8705-6-andriy.shevchenko@linux.intel.com>
 <4513324d-3dba-fd21-2a7f-9f1b9ef535cc@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4513324d-3dba-fd21-2a7f-9f1b9ef535cc@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_061656_877927_C66579CF 
X-CRM114-Status: GOOD (  14.52  )
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

On Mon, Apr 11, 2022 at 02:21:00PM +0200, Krzysztof Kozlowski wrote:
> On 01/04/2022 12:35, Andy Shevchenko wrote:
> > Switch the code to use for_each_gpiochip_node() helper.
> > 
> > While at it, in order to avoid additional churn in the future,
> > switch to fwnode APIs where it makes sense.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/pinctrl/samsung/pinctrl-exynos.c  |  8 +++---
> >  drivers/pinctrl/samsung/pinctrl-s3c24xx.c |  2 +-
> >  drivers/pinctrl/samsung/pinctrl-s3c64xx.c |  4 +--
> >  drivers/pinctrl/samsung/pinctrl-samsung.c | 30 +++++++++++------------
> >  drivers/pinctrl/samsung/pinctrl-samsung.h |  2 +-
> >  5 files changed, 22 insertions(+), 24 deletions(-)
> 
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks!
I'm going to spread this to two patches to which I pointed out before.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
