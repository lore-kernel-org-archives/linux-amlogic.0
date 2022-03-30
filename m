Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932E0C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Mar 2022 11:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EVZcSOSfeADCnVMsP8mX5reklK34Uim1mFjm1WSBUs8=; b=zLtbV4VaIaPg6i
	hcT60+MslscOep//7SAclLa2gD/y/pUbChYaIurCTbZ+6KMN3uopzlgFh9aJhlRX4j5TMVY+UYeZs
	A5ilV9r1d7Ex7P2+VPz9QUFQ6GbzOtFNiMLfrvsac8Mavvuz86BetqHTrV/FRFvRCrYGXVPbu993s
	9H+KFuSve0RA+sIuKBM3mBXbTpSphqNTD/HxlMFYI41L5mNwSnqU1KE9wH7WXAaSd4l4Y6aBussVT
	AzyBs64dx3Tj9WDatrvrWoyqh3zv7QBiyrY3q1SA3xGz2MEae5DHmh0slq3cm+NCvo+eQs2Jiu7m8
	o39qj1LC5cAEAIWjoSKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZWcL-00FNBD-7W; Wed, 30 Mar 2022 11:36:01 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZWc6-00FN67-DR; Wed, 30 Mar 2022 11:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648640146; x=1680176146;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WvB6mJ9ryWwQ7CmVODZdOzNBEGHGFiTgCdDbkTsS7Js=;
 b=Fuy/BXTpzFIFmrAZFdWCU5Qp+4QK3oC127c+5GMN14tBfm7FOlDH/q6K
 OHEGtJeMBBwvDDG9co780PpEMAgZ1Ye8iKMpEidEIMVhVDhcOtLt6Xsyg
 YlWDWo8b8ZN9KvjqL5TxsiYGpSp+9oOCa8nFFurlhNch8BrEXY18QkpME
 UvV8xgS44ZRZ02z8XhMzJyaUPkbMwmDanTV80TG6ip8JLKiQ7BK2j7+K0
 QADzIk9EdePXPB1ctkKnZEznqKdazrNjHpn7vhqUc8TGp5akuULIpiX9I
 i3rbQl1mk5uT9svgozrv2yT0JH4B+OkrKxmAk2reSK00/avqSd/GMfvxv g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="284426760"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="284426760"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 04:35:44 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="519649292"
Received: from smile.fi.intel.com ([10.237.72.59])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 04:35:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nZWbM-009N8T-Sw; Wed, 30 Mar 2022 14:35:00 +0300
Date: Wed, 30 Mar 2022 14:35:00 +0300
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
Subject: Re: [PATCH v2 02/13] gpiolib: Introduce gpiochip_node_count() helper
Message-ID: <YkRAZP+uTi6VUcDG@smile.fi.intel.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-3-andriy.shevchenko@linux.intel.com>
 <CAMuHMdWFENTrXsYq3PKRFBqUL570-pPMG43Vct62=U9cyyF0yQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdWFENTrXsYq3PKRFBqUL570-pPMG43Vct62=U9cyyF0yQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_043546_508613_FC0AABAE 
X-CRM114-Status: GOOD (  12.70  )
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

On Wed, Mar 30, 2022 at 12:02:07PM +0200, Geert Uytterhoeven wrote:
> On Tue, Mar 29, 2022 at 5:29 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> > +       unsigned int count;
> 
> Preinitialize to zero?

Whatever for what consensus will be achieved. Initially I have that way,
then I changed.

> > +       count = 0;
> > +       for_each_gpiochip_node(dev, child)
> > +               count++;
> 
> Regardless:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks!

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
