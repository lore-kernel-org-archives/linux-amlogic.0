Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8861FC64EC4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 20:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QuNOliVXeDTxFKEScT/xhmc3RrSFznbAJ4qrIQkDm+4=; b=aXYZwl5Q421lK3
	YEGHQoMKLOAb+ITTc/CdsCUlY1WxTttbturRXbDtWlbQNZNqZbnd+OvZ3zOUKVoEgdqiA/SYN3tuH
	fGcqwbOrsaxldB14Tgo3ImDTN5J105F4cVT2957xS3jh0Gfrku2hej79x3xo1sc/F5JWAiypCVey/
	U/vTJMvfZWYv7nAA77pg0wWJbCnPrOmGhp4MQrY+mRAfb0286qZID1N1begTDARQ/FHW3F0dxySao
	tXuXpTNVfssEoJjRdhJpO170g6risXIIXv12QCmgQGYHuMIjQIJCsHoEDz4VDWdvEoYPiExV4WavB
	HZ6ybO5Jw9Ar2amhur2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZHFj-00Er6o-2Y; Mon, 06 Mar 2023 20:16:11 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZH5p-00Em2o-75; Mon, 06 Mar 2023 20:06:06 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 3590C5FD0A;
	Mon,  6 Mar 2023 23:05:50 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1678133150;
	bh=kfJP0RM/utPmyIadCM5quEpcMdJsmWpckynw55rXs3w=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=qlHil6xZy9T9bb+R4Xr8gReHeXEiDZN5CLOcQRWCk7FMHDKGUp+hzKA7CwboPn43j
	 H7Sls7mXVOBOAU6S7sDdjColk4V5eRPu4tAhQA1CpUNJRCzmH6ttSZOIsN0rvZEL3I
	 YHEA7Mbin7zQUAeTF6uXh+jZ9p03TFsgZxbBzXAh7y2zAMtNQx6zQ8KIFyYbqA9is+
	 kHs8nAoRWvGonJ+w2bkKDveOu0/QnsgzEVTNdMQUuygoZSfZEvgpEa/HZnb9ybkjJL
	 jyLbWbN6AlJrp3Es7mCxsyOg4Q2FKYALTkKddLc8DH7vGChiQBnMWGkd6fuRcrILFz
	 kHc3K5z7syyaQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon,  6 Mar 2023 23:05:49 +0300 (MSK)
Date: Mon, 6 Mar 2023 23:05:49 +0300
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
Subject: Re: [PATCH v9 2/5] clk: meson: a1: add Amlogic A1 PLL clock
 controller driver
Message-ID: <20230306200549.7iuedbl27ejfhf6b@CAB-WSD-L081021>
References: <20230301183759.16163-1-ddrokosov@sberdevices.ru>
 <20230301183759.16163-3-ddrokosov@sberdevices.ru>
 <1jr0u2azfi.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jr0u2azfi.fsf@starbuckisacylon.baylibre.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/06 16:19:00 #20919562
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_120601_669637_092854DC 
X-CRM114-Status: GOOD (  35.40  )
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

On Mon, Mar 06, 2023 at 12:17:23PM +0100, Jerome Brunet wrote:
> 
> On Wed 01 Mar 2023 at 21:37, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:
> 
> > Introduce PLL clock controller for Amlogic A1 SoC family.
> >
> > Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> > Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> > ---
> >  drivers/clk/meson/Kconfig  |  10 +
> >  drivers/clk/meson/Makefile |   1 +
> >  drivers/clk/meson/a1-pll.c | 365 +++++++++++++++++++++++++++++++++++++
> >  drivers/clk/meson/a1-pll.h |  47 +++++
> >  4 files changed, 423 insertions(+)
> >  create mode 100644 drivers/clk/meson/a1-pll.c
> >  create mode 100644 drivers/clk/meson/a1-pll.h
> >

[...]

> > diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
> > new file mode 100644
> > index 000000000000..c565f9b2a8dd
> > --- /dev/null
> > +++ b/drivers/clk/meson/a1-pll.c
> > @@ -0,0 +1,365 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
> > + * Author: Jian Hu <jian.hu@amlogic.com>
> > + *
> > + * Copyright (c) 2023, SberDevices. All Rights Reserved.
> > + * Author: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> > +#include "meson-a1-clkc.h"
> 
> As pointed out by the kernel robot, there is a problem here
> 

My fault. Really sorry for that.

[...]

> > +static struct clk_regmap fixed_pll = {
> > +	.data = &(struct clk_regmap_gate_data){
> > +		.offset = ANACTRL_FIXPLL_CTRL0,
> > +		.bit_idx = 20,
> > +	},
> > +	.hw.init = &(struct clk_init_data) {
> > +		.name = "fixed_pll",
> > +		.ops = &clk_regmap_gate_ops,
> > +		.parent_hws = (const struct clk_hw *[]) {
> > +			&fixed_pll_dco.hw
> > +		},
> > +		.num_parents = 1,
> > +		/*
> > +		 * It is enough that the fdiv leaf has critical flag,
> > +		 * No critical or unused flag here.
> > +		 */
> 
> The comment is not useful
> 

OK

> > +	},
> > +};
> > +
> > +static const struct pll_mult_range hifi_pll_mult_range = {
> > +	.min = 32,
> > +	.max = 64,
> > +};
> > +
> > +static const struct reg_sequence hifi_init_regs[] = {
> > +	{ .reg = ANACTRL_HIFIPLL_CTRL1, .def = 0x01800000 },
> > +	{ .reg = ANACTRL_HIFIPLL_CTRL2, .def = 0x00001100 },
> > +	{ .reg = ANACTRL_HIFIPLL_CTRL3, .def = 0x100a1100 },
> > +	{ .reg = ANACTRL_HIFIPLL_CTRL4, .def = 0x00302000 },
> > +	{ .reg = ANACTRL_HIFIPLL_CTRL0, .def = 0x01f18440 },
> 
> This last poke should not bits otherwise handled by parms.
> This is a rate init in disguise.
> 

I believe, you are talking about hifi_pll clk_regmap conflicts with
hifi_init_regs. The above init sequence shouldn't affect pll regmap setup,
it doesn't touch them (we assume that default bit values are all zero):

    .en = {
        .reg_off = ANACTRL_HIFIPLL_CTRL0,
        .shift   = 28,
        .width   = 1,
    },
    // init_value = 0x01f18440
    // en_mask    = 0x10000000

    .m = {
        .reg_off = ANACTRL_HIFIPLL_CTRL0,
        .shift   = 0,
        .width   = 8,
    },
    // init_value = 0x01f18440
    // m_mask     = 0x0000000f

    .n = {
        .reg_off = ANACTRL_HIFIPLL_CTRL0,
        .shift   = 10,
        .width   = 5,
    },
    // init_value = 0x01f18440
    // n_mask     = 0x00007c00
                           ^
                    oops, one overlap
                    but why we can't set init value for pre_sel?

    .frac = {
        .reg_off = ANACTRL_HIFIPLL_CTRL1,
        .shift   = 0,
        .width   = 19,
    },
    // init_value = 0x01800000
    // frac_mask  = 0x0007ffff

    .current_en = {
        .reg_off = ANACTRL_HIFIPLL_CTRL0,
        .shift   = 26,
        .width   = 1,
    },
    // init_value      = 0x01f18440
    // current_en_mask = 0x04000000

    .l_detect = {
        .reg_off = ANACTRL_HIFIPLL_CTRL2,
        .shift   = 6,
        .width   = 1,
    },
    // init_value    = 0x00001100
    // l_detect_mask = 0x00000040

> > +};
> > +
> > +static struct clk_regmap hifi_pll = {
> > +	.data = &(struct meson_clk_pll_data){
> > +		.en = {
> > +			.reg_off = ANACTRL_HIFIPLL_CTRL0,
> > +			.shift   = 28,
> > +			.width   = 1,
> > +		},
> > +		.m = {
> > +			.reg_off = ANACTRL_HIFIPLL_CTRL0,
> > +			.shift   = 0,
> > +			.width   = 8,
> > +		},
> > +		.n = {
> > +			.reg_off = ANACTRL_HIFIPLL_CTRL0,
> > +			.shift   = 10,
> > +			.width   = 5,
> > +		},
> > +		.frac = {
> > +			.reg_off = ANACTRL_HIFIPLL_CTRL1,
> > +			.shift   = 0,
> > +			.width   = 19,
> > +		},
> > +		.l = {
> > +			.reg_off = ANACTRL_HIFIPLL_STS,
> > +			.shift   = 31,
> > +			.width   = 1,
> > +		},
> > +		.current_en = {
> > +			.reg_off = ANACTRL_HIFIPLL_CTRL0,
> > +			.shift   = 26,
> > +			.width   = 1,
> > +		},
> > +		.l_detect = {
> 
> What is this ?
> 

Lock detection module.

This is IP module included to new PLL power-on sequence. From clk-pll.c
patchset:

/*
 * Compared with the previous SoCs, self-adaption current module
 * is newly added for A1, keep the new power-on sequence to enable the
 * PLL. The sequence is:
 * 1. enable the pll, delay for 10us
 * 2. enable the pll self-adaption current module, delay for 40us
 * 3. enable the lock detect module
 */

[...]

> > +static struct clk_regmap fclk_div3 = {
> > +	.data = &(struct clk_regmap_gate_data){
> > +		.offset = ANACTRL_FIXPLL_CTRL0,
> > +		.bit_idx = 22,
> > +	},
> > +	.hw.init = &(struct clk_init_data){
> > +		.name = "fclk_div3",
> > +		.ops = &clk_regmap_gate_ops,
> > +		.parent_hws = (const struct clk_hw *[]) {
> > +			&fclk_div3_div.hw
> > +		},
> > +		.num_parents = 1,
> > +		/*
> > +		 * This clock is used by APB bus which is set in boot ROM code
> > +		 * and is required by the platform to operate correctly.
> > +		 * About critical, refer to fclk_div2.
> 
> This last line is not useful. Same for other occurences
> 

Good point. Copy-paste detected :-)

[...]

> > +static int meson_a1_pll_probe(struct platform_device *pdev)
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
> > +	map = devm_regmap_init_mmio(dev, base, &a1_pll_regmap_cfg);
> > +	if (IS_ERR(map))
> > +		return dev_err_probe(dev, PTR_ERR(map),
> > +				     "can't init regmap mmio region\n");
> > +
> > +	/* Populate regmap for the regmap backed clocks */
> > +	for (i = 0; i < ARRAY_SIZE(a1_pll_regmaps); i++)
> > +		a1_pll_regmaps[i]->map = map;
> > +
> > +	for (clkid = 0; clkid < a1_pll_hw_onecell_data.num; clkid++) {
> > +		hw = a1_pll_hw_onecell_data.hws[clkid];
> > +		err = devm_clk_hw_register(dev, hw);
> > +		if (err)
> > +			return dev_err_probe(dev, err,
> > +					     "clock registration failed\n");
> > +	}
> > +
> > +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> > +					   &a1_pll_hw_onecell_data);
> > +}
> > +
> > +#ifdef CONFIG_OF
> 
> This config is selected by ARM64 which this driver depends on
> 

Make sense, thanks a lot!

[...]

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
