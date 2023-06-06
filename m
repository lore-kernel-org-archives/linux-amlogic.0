Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E6DC77B7A
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jun 2023 15:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJPe1ItnKqmm9LX2zm87rLMO5/3bJ/TpkWwgpNfQfGM=; b=ASqYoJyKiAWzfT
	2giN7PtJQ+mZCjMRKl5a/hkruk84jlqrWSEM0C8h2DzuYBrt0LfU3YUUd9VnwHmdijn2Xtdeu8Rcf
	/I9sgZrvFX9LVgqnXsL0PdqyIPElxFDS4VS6wQ/Vwd+yrD35/bWGvMRjITc6h1H6AG6G6V6NLnpkT
	SkHLHN0XNTIYkj0jvyg8/0EhzvFQE/9UpJQMXwUK8znILbJEkwvD7o4xeO2k6bngkUoWzHIiec2sQ
	kQ0AtKXKsBTDFwFL0CI6DBQ4MJfNmXWfqdYxbUtSmerFYGBjnr6jNMSkMzzrysAh8jUAIwifW/5l3
	I2rL+UknuzzS3517UcgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Yls-002H5P-11;
	Tue, 06 Jun 2023 15:38:56 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Yll-002H28-35;
	Tue, 06 Jun 2023 15:38:54 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id BDE8C5FD4D;
	Tue,  6 Jun 2023 18:38:42 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686065922;
	bh=Fb53Ze/gEd5ZbtU+koYVHdOb5F9vo2dFU1Jt2wM1uWw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=MThwGBXaeuiX+mmzlXXmbP3fN5BFUU4DZdlCMp4zUXvUdSF1Zh0YziB8vhfBnq2pH
	 T8E2ODyUTPswCDzybjRRHdShm8C1cV7n19u5E7XIJZgRYh/WRuTZdrgILoz2XbkEwI
	 NZIUYccSXQlgy2m4hDR9QpjXv9MbMCEK+Ai7qvj0ZLeV6ro4rpwkXeV0+dNctBZTyJ
	 5rmPe66EuZwnbijpnKcP2F0H7bsRee1u063dDkIlsMpYIDw0kw3ROc+/t94kn5oZYy
	 4vHnQOR0kDba4jtX5kytMeKWbPbQM82p7L6BzGFjQ0sMMRMceO3JPdP1VtTUK6Kv+O
	 FFV1P7YMgEnwQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue,  6 Jun 2023 18:38:41 +0300 (MSK)
Date: Tue, 6 Jun 2023 18:38:41 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Yu Tu <yu.tu@amlogic.com>
CC: Jerome Brunet <jbrunet@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	<kelvin.zhang@amlogic.com>, <qi.duan@amlogic.com>
Subject: Re: [PATCH V9 4/4] clk: meson: s4: add support for Amlogic S4 SoC
 peripheral clock controller
Message-ID: <20230606153841.plf5uh6eyzpzsm2e@CAB-WSD-L081021>
References: <20230517070215.28463-1-yu.tu@amlogic.com>
 <20230517070215.28463-5-yu.tu@amlogic.com>
 <1jwn0g39t2.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jwn0g39t2.fsf@starbuckisacylon.baylibre.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/06 11:10:00 #21443593
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_083850_712680_DA30A814 
X-CRM114-Status: GOOD (  33.31  )
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

Hello Yu,

On Tue, Jun 06, 2023 at 04:38:15PM +0200, Jerome Brunet wrote:
> 
> On Wed 17 May 2023 at 15:02, Yu Tu <yu.tu@amlogic.com> wrote:
> 
> > Add the peripherals clock controller driver in the s4 SoC family.
> >
> > Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> > ---
> >  drivers/clk/meson/Kconfig          |   12 +
> >  drivers/clk/meson/Makefile         |    1 +
> >  drivers/clk/meson/s4-peripherals.c | 3830 ++++++++++++++++++++++++++++
> >  drivers/clk/meson/s4-peripherals.h |  217 ++
> >  4 files changed, 4060 insertions(+)
> >  create mode 100644 drivers/clk/meson/s4-peripherals.c
> >  create mode 100644 drivers/clk/meson/s4-peripherals.h
> >
> > diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> > index a663c90a3f3b..a6eb9fa15c74 100644
> > --- a/drivers/clk/meson/Kconfig
> > +++ b/drivers/clk/meson/Kconfig
> > @@ -128,4 +128,16 @@ config COMMON_CLK_S4_PLL
> >  	  aka s4. Amlogic S805X2 and S905Y4 devices include AQ222 and AQ229.
> >  	  Say Y if you want the board to work, because plls are the parent of most
> >  	  peripherals.
> > +
> > +config COMMON_CLK_S4
> > +	tristate "S4 SoC Peripherals clock controllers support"
> > +	depends on ARM64
> > +	default y
> > +	select COMMON_CLK_MESON_REGMAP
> > +	select COMMON_CLK_MESON_DUALDIV
> > +	select COMMON_CLK_MESON_VID_PLL_DIV
> > +	help
> > +	  Support for the Peripherals clock controller on Amlogic S805X2 and S905Y4
> > +	  devices, aka s4. Amlogic S805X2 and S905Y4 devices include AQ222 and AQ229.
> > +	  Say Y if you want peripherals to work.
> >  endmenu

[...]

> > +static struct clk_regmap s4_rtc_32k_by_oscin = {
> > +	.data = &(struct clk_regmap_gate_data){
> > +		.offset = CLKCTRL_RTC_BY_OSCIN_CTRL0,
> > +		.bit_idx = 30,
> > +	},
> > +	.hw.init = &(struct clk_init_data) {
> > +		.name = "rtc_32k_by_oscin",
> > +		.ops = &clk_regmap_gate_ops,
> > +		.parent_hws = (const struct clk_hw *[]) {
> > +			&s4_rtc_32k_by_oscin_sel.hw
> > +		},
> > +		.num_parents = 1,
> > +		.flags = CLK_SET_RATE_PARENT,
> > +	},
> > +};
> > +
> > +/*
> > + * This RTC clock can be supplied by an external 32KHz crystal oscillator.
> > + * If it is used, it should be documented in using fw_name and documented in the
> > + * Bindings. Not currently in use on this board.
> > + */
> 
> This is confusing and not really helpful
> What you describe here is simply the purpose of fw_name ... so it does
> not warrant a specific comment
> 
> > +static const struct clk_parent_data rtc_clk_sel_parent_data[] = {
> > +	{ .hw = &s4_rtc_32k_by_oscin.hw },
> > +	{ .hw = &s4_rtc_32k_by_oscin_div.hw },
> > +	{ .fw_name = "ext_32k",  }
> > +};
> > +
> > +/*
> > + * All clocks that can be inherited from a more accurate RTC clock are marked
> > + * with the CLK_SET_RATE_NO_REPARENT flag. This is because in certain
> > + * situations, we may need to freeze their parent. The parent setup of these
> > + * clocks should be located on the device tree side.
> > + */
> 
> It looks like the consensus is that CLK_SET_RATE_NO_REPARENT is not
> required. Please have at look at the discussion between Dmitry and
> Martin for the a1 controller
> 

I hope below links will be helpful for you:

CLK_SET_RATE_NO_REPARENT IRC discussion:
https://libera.irclog.whitequark.org/linux-amlogic/2023-05-18

Clock driver LKML discussion about CLK_SET_RATE_NO_REPARENT:
https://lore.kernel.org/all/20230530120640.irugyrio3qa7czjy@CAB-WSD-L081021/
https://lore.kernel.org/all/20230524092750.ldm362chnpkwkcj4@CAB-WSD-L081021/

PWM discussion about special RTC case:
https://lore.kernel.org/all/20230522133739.7tc35zr2npsysopd@CAB-WSD-L081021/

And I apologize for any confusion I may have caused in our previous
discussion. I want to clarify that I have updated the implementation
of CLK_SET_RATE_NO_REPARENT after discussing it with Martin...

[...]

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
