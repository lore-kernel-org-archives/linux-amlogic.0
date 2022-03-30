Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0574C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Mar 2022 16:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2swl+UYs5ThR3H2Uljq4LHsiRBTndZ4uHUOBWLY5XF4=; b=jLqJ66cbSFH2qB
	ya1PLRuuvj5biGebYCAXZemI9JI3A09sPppJz3tD3eXKplDtVn+MfSfbYxq+S/8aQV8BUy6svhQwL
	MAdPpn/l0EDeSMjlDlKVIrafa04TApXB8uXEgSUtBb3EOFJi8mMPJM8gORfz5pOhRZ7KoH67ubn9R
	BTZ4lNoLwBkrZmlm5kU3IXEPllpMvXp3qKRDj0GemfolGqXqa8qy5Lo4wpavVNvyuOp2D2pQJJaxQ
	mTMv/fNDpLJUOXtnczpdlXdbTLnssj3ZgtgvDdH6G63Iz2X2DBP3/zReEebRLfqdknYQsg2ZkgutS
	s0Y38z/Xi5miFkxpcBfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZak2-00GiyX-1x; Wed, 30 Mar 2022 16:00:14 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZac8-00Gfbh-OE; Wed, 30 Mar 2022 15:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648655524; x=1680191524;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aHOCvdmEcRy5ZvBUbTf9zFkDOMo9CAy71FTo/IenFRo=;
 b=eaJehdiCnZrxeTqBfxF7caWnB131NP+hR2tbB7mKERRsVhzVtV40MYoQ
 rb1nEfPg0WDljCE5vKgGGW1I4B7KjMRUb9+Y3O3E4AJ/wDFMXOxfSTSzQ
 EDt4S0mWar2e7+SMfxcIITxHqnzQgO238WQegHvoWCgsPBEidOUTUI+wj
 HK81xBDVG+9MXFO0C7zDShzsFQalr1Hm2McPEoKqNuVeUknU7Jy2A05pY
 RRJSgdYHopwHaLB77sQbtiD9Y80JeUt5G1vpLckqrp4NNiRBFoE3c5o9h
 zOyeN35kvAFici1oj/kRUFyo7K2iSAJNSOM8rvpBzYoqr89tzqPr6+XAo w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="241730518"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="241730518"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 08:52:02 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="788049544"
Received: from smile.fi.intel.com ([10.237.72.59])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 08:51:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nZabQ-009UCS-Cy; Wed, 30 Mar 2022 18:51:20 +0300
Date: Wed, 30 Mar 2022 18:51:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Qianggui Song <qianggui.song@amlogic.com>,
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
Subject: Re: [PATCH v2 09/13] pinctrl: meson: Rename REG_* to MREG_*
Message-ID: <YkR8eDT6fS8uRpOT@smile.fi.intel.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-10-andriy.shevchenko@linux.intel.com>
 <94e888fe-d8fc-5379-302f-66d64f2ae10b@baylibre.com>
 <YkM22GwhxV+YKl8l@smile.fi.intel.com>
 <CAMuHMdWVA834tkeag=WOnHFGuhwZ93PkrgO24OV69Fye1hruLw@mail.gmail.com>
 <1b0bc704-a740-ea15-1e90-166905be27d0@baylibre.com>
 <YkQgfwUs8KbhF/b/@smile.fi.intel.com>
 <6812bb31-5d2b-4737-c2ad-8727d105847d@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6812bb31-5d2b-4737-c2ad-8727d105847d@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_085204_883069_DF1D9F0A 
X-CRM114-Status: GOOD (  24.96  )
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

On Wed, Mar 30, 2022 at 05:22:56PM +0200, Neil Armstrong wrote:
> On 30/03/2022 11:18, Andy Shevchenko wrote:

...

> > > > > > What error do you hit ?
> > > > > 
> > > > > arch/x86/include/asm/arch_hweight.h:9:17: error: expected identifier before string constant
> > > > > 9 | #define REG_OUT "a"
> > > > >     |                 ^~~
> > > > 
> > > > Perhaps REG_{OUT,IN} in arch/x86/include/asm/arch_hweight.h should be
> > > > renamed instead, as this is a generic header file that can be included
> > > > anywhere, while the REG_{OUT,IN} definitions are only used locally,
> > > > in the header file?
> > > 
> > > Even better, those REG_OUT/REG_IN should be undefined at the end of the header since only
> > > used in the headers inline functions:
> > > ==============><==================================
> > > diff --git a/arch/x86/include/asm/arch_hweight.h b/arch/x86/include/asm/arch_hweight.h
> > > index ba88edd0d58b..139a4b0a2a14 100644
> > > --- a/arch/x86/include/asm/arch_hweight.h
> > > +++ b/arch/x86/include/asm/arch_hweight.h
> > > @@ -52,4 +52,7 @@ static __always_inline unsigned long __arch_hweight64(__u64 w)
> > >   }
> > >   #endif /* CONFIG_X86_32 */
> > > 
> > > +#undef REG_IN
> > > +#undef REG_OUT
> > > +
> > >   #endif
> > > ==============><==================================
> > 
> > Can you submit a formal patch, please?
> 
> I'll submit it separately

Sure!

> > And I think it would be good to have my patch as well, so we do not depend on
> > the fate of the other one.
> 
> Yes sure

Thanks for acknowledging and review!

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
