Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD635C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Mar 2022 13:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TwKnyxYOVvy/DZBEF9ZRWpPSNpfhqReFJfTk8xkT+Qs=; b=ymFh5HTfzIUbUX
	AlZKSphImD5RVQnDC2gnvAMVaGWMqRWSevktBzi9RkZzL9mL6VLKaVf/O2x5l84avdgnN3JFe11D8
	qg1cXNfajpspjFwV/GJW1WHotInpkpM4T2ZNJVpE826CRCUXgRsVD0xbOAIr5aM2gj0n8A6rV4ev/
	8Mq8qjoHT5KnpfyA9I+8Rp5GXA7s4cDB+rvDTWUJ8EuuyqNtFeKiCr52VMW4nO2GrDm5Y2NrtUe/u
	jhKEKL62C9eeWyJThY54wQha4t0bByO5tXvaCbsA7FiWfYzCNBSBZEcHkXnA0NCMw93GJ0/DQp529
	MXxIMrAophYEZ5Hq79hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZXzg-00FxpT-4y; Wed, 30 Mar 2022 13:04:12 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZXyF-00FxFH-9q; Wed, 30 Mar 2022 13:02:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648645363; x=1680181363;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sJ4bTg/Jje7M8hJIE2LrKZWgq7g/VxTTlmJq4PtT+5k=;
 b=La9+QqeALCOrGc9TGIrrgIuy+8VE6arLWwFRZSpSN+w5hB9zYQlavYGp
 Ut2qKeanFUrugqNYBKcRTapcAkGTo6n284s029RZffNoWQmgB5u/1wUAI
 cTpSgJSezYw7bgs8wHfcySpDmsBDfeMuTsyf64qG09Xk4lREOZZ+zmhuq
 9YGfwMvHPgc6fuRDUSlB+ckjkexywEro89QLl08KLUffxYowhMGt07hxp
 TKXht+BHEXWx1uvm8OmC6n3UhwgOW7YC/5JFcNIvgY5fYwoD8bLt8PxJX
 yIAqKVlM34N5u8zR7h0j7cL3Ucv+mOQ4x4jKQPD18aFsXbVDX9M2DzCKg g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="240131003"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="240131003"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 06:02:42 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="519668600"
Received: from smile.fi.intel.com ([10.237.72.59])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 06:02:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nZXxJ-009PSJ-LE; Wed, 30 Mar 2022 16:01:45 +0300
Date: Wed, 30 Mar 2022 16:01:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Fabien DESSENNE <fabien.dessenne@foss.st.com>
Cc: Qianggui Song <qianggui.song@amlogic.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
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
Subject: Re: [PATCH v2 04/13] pinctrl: stm32: Switch to use
 for_each_gpiochip_node() helper
Message-ID: <YkRUuS5YKXstq9T7@smile.fi.intel.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-5-andriy.shevchenko@linux.intel.com>
 <ec5a56e6-9402-f80f-3c86-1820e39fec27@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec5a56e6-9402-f80f-3c86-1820e39fec27@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_060243_414003_DD7C4F7D 
X-CRM114-Status: GOOD (  13.98  )
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

On Wed, Mar 30, 2022 at 02:32:36PM +0200, Fabien DESSENNE wrote:
> Hi Andy
> 
> 
> Thank you for the patch.
> 
> Fabien
> 
> On 29/03/2022 17:29, Andy Shevchenko wrote:
> > Switch the code to use for_each_gpiochip_node() helper.
> > 
> > While at it, in order to avoid additional churn in the future,
> > switch to fwnode APIs where it makes sense.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>

Thank you for the prompt review!

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
