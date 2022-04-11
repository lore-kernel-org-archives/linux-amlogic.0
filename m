Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEC1C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Apr 2022 12:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Glebq7GGJgE/eq5moGPbfYi6bu+HWbFPFlj83hmobUI=; b=vsAGlszhVWXk+g
	z0BT3qQtxN7R2MhzXAmuuombqUPz64cvEi7Ek6y+EXSqd1KXe4n4x9QdNoHl8qoT9QMfDkcNMqjxm
	4TOH52Ywb/OS/pSWjC0hZ9GqA/qTrKcQ6VF020pyOCTVBsJj2TxQqS3Ayh2ZIdsSyJ2F5maASz5sG
	aPU2oxX48evLlHsLJ9HeCVppfnnaoXnANM1hsw7L7wxofBwp3deyu4Ee87hCmxE3z9DvpmkAPs7jL
	54Twz+cd9ff/37jELTZXDx3IzLfyrJAViuRKpRdQjxwYxsPOPmxPaVkpnRYZdlRTA3GxQEq+huqqF
	h3EglGDqWcx+KOCUDAbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndslM-008qNG-Ve; Mon, 11 Apr 2022 12:03:20 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndsl2-008qGV-4N; Mon, 11 Apr 2022 12:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649678580; x=1681214580;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9kbQrXBy9DVbHOYLkpvDDmu+4Dwl0husw8ro+88KO44=;
 b=N5yhflv+IrYlAKkOU/XX4/7yYggeqNZFCis1NoXTMLDsN/dEgU0T3qi7
 Puai1jdCmHqtPvBgXVtJLSpsqfJ9Y+l+Ev7N/sqT3RG34saMPfOM708V4
 TNLB7V5XcpNJWotaW4SraKLXDQAQljwGf8Du5Rm3H5GKQnM7HP1q3p/29
 mC53Zlkfbbuu+shPFjSpwQAFgUdwDE+aS+64rwrPWaKY1EUDJBJCBMOsl
 fbbSbbSg3DWKu4mOFt5Ej7JOdQyNKj8I7qIDHvRKdGNfMtRoOQ2h+pQQX
 QvSEBpFGOsLrOVDC+EHTF/fbx89rgXG29yxcp5LIWCy1bk9xCCGceszWO A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="262276886"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="262276886"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 05:02:58 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="654594670"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 05:02:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ndshK-001CUl-He; Mon, 11 Apr 2022 14:59:10 +0300
Date: Mon, 11 Apr 2022 14:59:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Qianggui Song <qianggui.song@amlogic.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Cc: Neil Armstrong <narmstrong@baylibre.com>,
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
Subject: Re: [PATCH v4 00/13] gpiolib: Two new helpers and way toward fwnode
Message-ID: <YlQYDnCNuTibuVi1@smile.fi.intel.com>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_050300_237914_1A2D50FF 
X-CRM114-Status: GOOD (  13.05  )
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

On Fri, Apr 01, 2022 at 01:35:51PM +0300, Andy Shevchenko wrote:
> This is a spin-off of the previous work of switching GPIO library
> to use fwnode instead of of_node. Here we introduce a couple of
> a new macro helpers, which allows to switch some of the drivers
> to use fwnode and partially fwnode APIs. As a result of this cleanup
> a few drivers switched to use GPIO fwnode instead of of_node.
> 
> Bart, Linus, I can take it thru my tree with an immutable branch if
> it's the way you prefer, otherwise please suggest on how to proceed.

I'm going to push this, without samsung patch(es), but addresing latest
Geert's comment, to my for-next branch pending for PR to GPIO subsystem.

Please inform me within a few hours, if something should be postponed /
dropped / etc.

Thanks!

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
