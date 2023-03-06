Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B22FC61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 19:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82/7sYTvYFM9SjIXkE26H4Z/Gw+PaNjyYMYUNaJ5NdM=; b=DzT41SavN55c3/
	//OXnpBPc8sop6ud7F+/oyYEPLCCK67Fc36nTcLVGu9ImBeyHItNAGAd9bEURt67Wl9bWBnjer2Vo
	VXHTsYhyXVxdwRxSDuG4cvsWT5v3b1HXvX109uaJQV2noMe/z0rWeOBoc4JxCZgMnpcAPbrI+JSVx
	gC2Pn6u29FkJWx4RySp1H1fm+lcR59dQuVP7FxwAaDP1AEEcej4U0IvRrpLe7xTJs9cM8lTQ/C+cr
	jO3EVzWg8Yk0+OkfrreTRTC43uR5ZDi3OUuwDAQx+RMx8fwc73nrShmmkL/T66Iq7URVgbiVWyPuq
	GGuLNdGL4kErw8KVIdhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZG9h-00ETU8-Rr; Mon, 06 Mar 2023 19:05:53 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZG9b-00ETOp-0f; Mon, 06 Mar 2023 19:05:49 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id D0BF25FD0A;
	Mon,  6 Mar 2023 22:05:40 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1678129540;
	bh=/40x545y6N3H4xvARhuWQ6W0qgSWl87tx0IbBsc6DTk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=msA1ul5xWibswwqECdFeXH4MH5rW7a8f0PJpfL0aHk+q6I4C51hkZco9lKWYI1Lci
	 fqykc22BJkdP81gsccDRAZNPm+Q/F4C7ptnJQeZohr/JWIF6lEtMB/JEnm1AwKB1NZ
	 Cmf90G4O1IcsuVHaGbB95OLeXTq5e7PTSHKv9+36fZ969HtAaDT1pHhhK1Wg7MJ3en
	 tUfX7oxM1j1Hx8PUWsqXZLBZr0xQvhaB2iQI1IepXb3M+1v081LFdTB2eP7s19YPlW
	 kqq1Q3Li1FM69RoSso8FkS0M2vK9YLzGblxe3/EP46fsJk/1KeYCLHxU5evvqcP6Jg
	 e77IfCLFiioHQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon,  6 Mar 2023 22:05:40 +0300 (MSK)
Date: Mon, 6 Mar 2023 22:05:39 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: <neil.armstrong@linaro.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <jian.hu@amlogic.com>,
	<kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v9 4/5] clk: meson: a1: add Amlogic A1 Peripherals clock
 controller driver
Message-ID: <20230306190539.kl6n347kev5pskz6@CAB-WSD-L081021>
References: <20230301183759.16163-1-ddrokosov@sberdevices.ru>
 <20230301183759.16163-5-ddrokosov@sberdevices.ru>
 <1jilfeaync.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jilfeaync.fsf@starbuckisacylon.baylibre.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/06 16:19:00 #20919562
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_110547_473754_6B8EACBF 
X-CRM114-Status: GOOD (  38.94  )
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

Hello Jerome,

Thanks a lot for such detailed review. Please find my comments and
thoughts below.

On Mon, Mar 06, 2023 at 12:38:22PM +0100, Jerome Brunet wrote:
> 
> On Wed 01 Mar 2023 at 21:37, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:
> 
> > Introduce Peripherals clock controller for Amlogic A1 SoC family.
> >
> > Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> > Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>

[...]

> > +static struct clk_regmap dspa_a_sel = {
> > +	.data = &(struct clk_regmap_mux_data){
> > +		.offset = DSPA_CLK_CTRL0,
> > +		.mask = 0x7,
> > +		.shift = 10,
> > +		.table = mux_table_dsp_ab,
> > +	},
> > +	.hw.init = &(struct clk_init_data){
> > +		.name = "dspa_a_sel",
> > +		.ops = &clk_regmap_mux_ops,
> > +		.parent_data = dsp_ab_parent_data,
> > +		.num_parents = ARRAY_SIZE(dsp_ab_parent_data),
> > +		/* DSPA_A clk parent should be set statically from dt */
> > +		.flags = CLK_SET_RATE_NO_REPARENT,
> > +	},
> > +};
> > +
> > +static struct clk_regmap dspa_a_div = {
> > +	.data = &(struct clk_regmap_div_data){
> > +		.offset = DSPA_CLK_CTRL0,
> > +		.shift = 0,
> > +		.width = 10,
> > +	},
> > +	.hw.init = &(struct clk_init_data){
> > +		.name = "dspa_a_div",
> > +		.ops = &clk_regmap_divider_ops,
> > +		.parent_hws = (const struct clk_hw *[]) {
> > +			&dspa_a_sel.hw
> > +		},
> > +		.num_parents = 1,
> > +		.flags = CLK_SET_RATE_PARENT,
> > +	},
> > +};
> > +
> > +static struct clk_regmap dspa_a = {
> > +	.data = &(struct clk_regmap_gate_data){
> > +		.offset = DSPA_CLK_CTRL0,
> > +		.bit_idx = 13,
> > +	},
> > +	.hw.init = &(struct clk_init_data) {
> > +		.name = "dspa_a",
> > +		.ops = &clk_regmap_gate_ops,
> > +		.parent_hws = (const struct clk_hw *[]) {
> > +			&dspa_a_div.hw
> > +		},
> > +		.num_parents = 1,
> > +		/*
> > +		 * DSPA_A accelerator clk, cannot be disabled by CCF if it
> > +		 * has been set by bootloader
> 
> Then IGNORE_UNUSED is wrong. use RO ops with you must retain the
> bootloader config.

I thought UNUSED logic will disable 'unused' clock during
initialization. Or do you mean it's not relevant for ro ops clock,
because disable() callback is not defined?

> 
> Note that it is usually a bad idea to depend on the bootloader config.
> Things tends to go bad when other bootloader version join the fun, like
> upstream u-boot

To be honest, I don't have the ability to test such behavior on our side,
because in my hands I have SoC SKUs w/o DSP only.
But theoretically DSP FW can be started already from the bootloader, and
then we shouldn't touch this clock.
May be CCF has device tree tricks to solve such situations, don't know
actually. On the other hand, appropriate driver logic would be a nice
exit here.

[...]

> > +static struct clk_regmap dspa_en_nic = {
> > +	.data = &(struct clk_regmap_gate_data){
> > +		.offset = DSPA_CLK_EN,
> > +		.bit_idx = 0,
> > +	},
> > +	.hw.init = &(struct clk_init_data) {
> > +		.name = "dspa_en_nic",
> > +		.ops = &clk_regmap_gate_ops,
> > +		.parent_hws = (const struct clk_hw *[]) {
> > +			&dspa_sel.hw
> > +		},
> > +		.num_parents = 1,
> > +		/*
> > +		 * DSPA_EN_NIC accelerator clk, cannot be disabled by CCF if it
> > +		 * has been set by bootloader
> > +		 */
> > +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> 
> All this just highlight the lack of proper drivers to handle the clock,
> like remote proc one.
> 

Okay, let's imagine we have such a driver. If DSP is already running,
we can skip the clock setup on this driver side. Hmmm. It looks like
a proper solution...

I would prefer to tag it with TODO and mark DSP clocks with ro_ops till
we don't have such a driver.

[...]

> > +
> > +static struct clk_regmap fclk_div2_divn = {
> > +	.data = &(struct clk_regmap_gate_data){
> > +		.offset = CLK12_24_CTRL,
> > +		.bit_idx = 12,
> > +	},
> > +	.hw.init = &(struct clk_init_data){
> > +		.name = "fclk_div2_divn",
> > +		.ops = &clk_regmap_gate_ops,
> > +		.parent_hws = (const struct clk_hw *[]) {
> > +			&fclk_div2_divn_pre.hw
> > +		},
> > +		.num_parents = 1,
> > +		.flags = CLK_SET_RATE_PARENT,
> > +	},
> > +};
> > +
> > +/*
> > + * the index 2 is sys_pll_div16, it will be completed in the CPU clock ctrl,
> 
> I don't get this, what do you mean ? 
> 

I mean, it will be implemented in the CPU clock controller driver in the
next patch series. Agree, I have to make a rephrase.

> > + * the index 4 is the clock measurement source, it relies on
> > + * the clock measurement register configuration.
> 
> Obviously ... What mean here is that clock measurement is a debug
> feature and should be considered
> 

Should I mark it with TODO tag? I prefer to implement 'must have' logic
first. Clock measurement are optional from my point of view.

[...]

> > +static struct clk_regmap pwm_a = {
> > +	.data = &(struct clk_regmap_gate_data){
> > +		.offset = PWM_CLK_AB_CTRL,
> > +		.bit_idx = 8,
> > +	},
> > +	.hw.init = &(struct clk_init_data) {
> > +		.name = "pwm_a",
> > +		.ops = &clk_regmap_gate_ops,
> > +		.parent_hws = (const struct clk_hw *[]) {
> > +			&pwm_a_div.hw
> > +		},
> > +		.num_parents = 1,
> > +		/*
> > +		 * The CPU working voltage is controlled by pwm_a
> > +		 * in BL2 firmware. The clock is required by the platform
> > +		 * to operate correctly. Add the CLK_IS_CRITICAL flag to
> > +		 * avoid changing at runtime.
> > +		 * About critical, refer to sys
> > +		 */
> 
> PWM_A required by the BL2 ... really ? Looks really fishy to me.
> 
> Is it possible it is used by regulator instead ?
> 

Honestly, this comment's information was grabbed from Amlogic custom
driver. It has such words:

/*
 * add CLK_IGNORE_UNUSED flag for pwm controller GATE
 * clk core will disable unused clock, it may disable
 * vddcore voltage which contrlled by one pwm in bl21.
 * add the flag to avoid changing cpu voltage.
 */

We don't have bl21 source code in the hands, so I can't check
unfortunately. But I have no reasons to don't trust Amlogic custom
clk driver decisions about low level bootloaders roles.

[...]

> > +static int meson_a1_periphs_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct clk_hw *hw;
> > +	void __iomem *base;
> > +	struct regmap *map;
> > +	int clkid, i, err;
> > +
> > +	base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(base))
> > +		return dev_err_probe(dev, PTR_ERR(base),
> > +				     "can't ioremap resource\n");
> > +
> > +	map = devm_regmap_init_mmio(dev, base, &a1_periphs_regmap_cfg);
> > +	if (IS_ERR(map))
> > +		return dev_err_probe(dev, PTR_ERR(map),
> > +				     "can't init regmap mmio region\n");
> > +
> > +	/* Populate regmap for the regmap backed clocks */
> > +	for (i = 0; i < ARRAY_SIZE(a1_periphs_regmaps); i++)
> > +		a1_periphs_regmaps[i]->map = map;
> > +
> > +	for (clkid = 0; clkid < a1_periphs_hw_onecell_data.num; clkid++) {
> > +		hw = a1_periphs_hw_onecell_data.hws[clkid];
> > +		err = devm_clk_hw_register(dev, hw);
> > +		if (err)
> > +			return dev_err_probe(dev, err,
> > +					     "clock registration failed\n");
> > +	}
> > +
> > +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> > +					   &a1_periphs_hw_onecell_data);
> > +}
> > +
> > +#ifdef CONFIG_OF
> 
> Same as the PLL driver
> 

Sure, good point.

[...]

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
