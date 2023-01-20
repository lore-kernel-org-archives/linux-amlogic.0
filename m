Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9867C38159
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Jan 2023 03:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kd33q+xeAlKUG7euOz9DEhMFFFe/K5/bu62PsHwZP0Q=; b=zPe6mSotBOnH4h
	hqeMoegtcHJteiSPlO9r0/lw9catpNToMxXWKvqr08QaxG3USh2Tgk4CtVwIomPfke90vMvgMZisS
	/viBKV7g7Hq2uNCDZi6hqcxmf+zmt4Pu2DhCsg06XhXD0uUu50XLRODvINQ8vvDWPNvxeIs9jGnH6
	yBk3mcYQ3RtLM6EzRn7VIITK2gJBS2nfRhIXTR4XApv4HsT291636O40+/s9mf7vTHo4oC7ccQbV1
	NDIW0kldta33wZJy8/poFpvB6vEo+jI5VnGx8IOW4qiLaqNZ1sUS5Kyj/EwuJGtbyEuoajsAo8RaC
	mKDk8+9HJApPAgG7uKyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIiAO-008Em5-Cv; Fri, 20 Jan 2023 03:34:12 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIiAD-008Ejo-H9; Fri, 20 Jan 2023 03:34:03 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Fri, 20 Jan
 2023 11:33:52 +0800
Message-ID: <aedb0764-b5cb-7f49-f279-51dbec070e80@amlogic.com>
Date: Fri, 20 Jan 2023 11:33:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V6 3/3] clk: meson: s4: add support for Amlogic S4 SoC
 peripheral clock controller
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: "kelvin . zhang" <Kelvin.Zhang@amlogic.com>, "qi . duan"
	<qi.duan@amlogic.com>
References: <20230116074214.2326-1-yu.tu@amlogic.com>
 <20230116074214.2326-4-yu.tu@amlogic.com>
 <1ja62eybrv.fsf@starbuckisacylon.baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1ja62eybrv.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_193401_629652_1BC6D19B 
X-CRM114-Status: GOOD (  32.68  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


Hi
On 2023/1/19 19:37, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> 
> On Mon 16 Jan 2023 at 15:42, Yu Tu <yu.tu@amlogic.com> wrote:
> 
>> Add the peripherals clock controller driver in the s4 SoC family.
>>
>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> 
> [...]
> 
>> +
>> +/* Video Clocks */
>> +static struct clk_regmap s4_vid_pll_div = {
>> +	.data = &(struct meson_vid_pll_div_data){
>> +		.val = {
>> +			.reg_off = CLKCTRL_VID_PLL_CLK_DIV,
>> +			.shift   = 0,
>> +			.width   = 15,
>> +		},
>> +		.sel = {
>> +			.reg_off = CLKCTRL_VID_PLL_CLK_DIV,
>> +			.shift   = 16,
>> +			.width   = 2,
>> +		},
>> +	},
>> +	.hw.init = &(struct clk_init_data) {
>> +		.name = "vid_pll_div",
>> +		/*
>> +		 * The frequency division from the hdmi_pll clock to the vid_pll_div
>> +		 * clock is the default value of this register. When designing the
>> +		 * video module of the chip, a default value that can meet the
>> +		 * requirements of the video module will be solidified according
>> +		 * to the usage requirements of the chip, so as to facilitate chip
>> +		 * simulation. So this is ro_ops.
>> +		 * It is important to note that this clock is not used on this
>> +		 * chip and is described only for the integrity of the clock tree.
>> +		 */
> 
> If it is reset value and will be applicable to all the design, regarless
> of the use-case, then yes RO ops is OK
> 
>>From what I understand here, the value will depend on the use-case requirements.
> This is a typical case where the DT prop "assigned-rate" should be used, not RO ops.

Check the previous chip history, the actual scene is not used at all, 
basically is used in simulation. So the previous SOC was "ro_ops" 
without any problems.  This S4 SOC is not actually useful either.

So when you were upstream, you had no problem making "ro_ops". I wonder 
if I could delete this useless clock, so you don't have to worry about it.

> 
>> +		.ops = &meson_vid_pll_div_ro_ops,
>> +		.parent_data = (const struct clk_parent_data []) {
>> +			{ .fw_name = "hdmi_pll", }
>> +		},
>> +		.num_parents = 1,
>> +		.flags = CLK_SET_RATE_PARENT,
>> +	},
>> +};
>> +
> 
>> +
>> +/* VDEC clocks */
>> +static const struct clk_parent_data s4_dec_parent_data[] = {
>> +	{ .fw_name = "fclk_div2p5", },
>> +	{ .fw_name = "fclk_div3", },
>> +	{ .fw_name = "fclk_div4", },
>> +	{ .fw_name = "fclk_div5", },
>> +	{ .fw_name = "fclk_div7", },
>> +	{ .fw_name = "hifi_pll", },
>> +	{ .fw_name = "gp0_pll", },
>> +	{ .fw_name = "xtal", }
>> +};
>> +
>> +static struct clk_regmap s4_vdec_p0_mux = {
>> +	.data = &(struct clk_regmap_mux_data){
>> +		.offset = CLKCTRL_VDEC_CLK_CTRL,
>> +		.mask = 0x7,
>> +		.shift = 9,
>> +		.flags = CLK_MUX_ROUND_CLOSEST,
>> +	},
>> +	.hw.init = &(struct clk_init_data) {
>> +		.name = "vdec_p0_mux",
>> +		.ops = &clk_regmap_mux_ops,
>> +		.parent_data = s4_dec_parent_data,
>> +		.num_parents = ARRAY_SIZE(s4_dec_parent_data),
>> +		/*
>> +		 * When the driver uses this clock, needs to specify the patent clock
>> +		 * he wants in the dts.
> 
> s/patent/parent ?
> s/he wants/it requires ?

Okay.

> 
>> +		 */
>> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
>> +	},
>> +};
>> +
> 
> [...]
> 
>> +static const struct clk_parent_data s4_vpu_clkc_parent_data[] = {
>> +	{ .fw_name = "fclk_div4", },
>> +	{ .fw_name = "fclk_div3", },
>> +	{ .fw_name = "fclk_div5", },
>> +	{ .fw_name = "fclk_div7", },
>> +	{ .fw_name = "mpll1", },
>> +	{ .hw = &s4_vid_pll.hw },
>> +	{ .fw_name = "mpll2", },
>> +	{ .fw_name = "gp0_pll", },
>> +};
>> +
>> +static struct clk_regmap s4_vpu_clkc_p0_mux  = {
>> +	.data = &(struct clk_regmap_mux_data){
>> +		.offset = CLKCTRL_VPU_CLKC_CTRL,
>> +		.mask = 0x7,
>> +		.shift = 9,
>> +	},
>> +	.hw.init = &(struct clk_init_data) {
>> +		.name = "vpu_clkc_p0_mux",
>> +		.ops = &clk_regmap_mux_ops,
>> +		.parent_data = s4_vpu_clkc_parent_data,
>> +		.num_parents = ARRAY_SIZE(s4_vpu_clkc_parent_data),
>> +		/*
>> +		 * When the driver uses this clock, needs to specify the patent clock
>> +		 * he wants in the dts.
>> +		 */
> 
> That's quite a lot of occurences of the same comment.
> At the same time, other clocks with the same flag have no comment.
> 
> Please make general comment, before the Video/VPU section, explaining
> which clocks needs on a use-case basis (through DT) and possibly how it
> should be set, what should drive the choices.
> 

The owner of the corresponding driver module wants to have a fixed 
clock, but I can't explain every specific reason. So I'm going to change 
it all to.flags = CLK_SET_RATE_PARENT in the next version. Let CCF 
choose the appropriate clock as you suggested. If there is a 
corresponding module you want to change, ask him to give you a specific 
explanation. Do you think that's all right?

I will not reply to you below.

>> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
>> +	},
>> +};
>> +
> 
>> +
>> +/* EMMC/NAND clock */
>> +static const struct clk_parent_data s4_sd_emmc_clk0_parent_data[] = {
>> +	{ .fw_name = "xtal", },
>> +	{ .fw_name = "fclk_div2", },
>> +	{ .fw_name = "fclk_div3", },
>> +	{ .fw_name = "hifi_pll", },
>> +	{ .fw_name = "fclk_div2p5", },
>> +	{ .fw_name = "mpll2", },
>> +	{ .fw_name = "mpll3", },
>> +	{ .fw_name = "gp0_pll", },
>> +};
>> +
>> +static struct clk_regmap s4_sd_emmc_c_clk0_sel = {
>> +	.data = &(struct clk_regmap_mux_data){
>> +		.offset = CLKCTRL_NAND_CLK_CTRL,
>> +		.mask = 0x7,
>> +		.shift = 9,
>> +	},
>> +	.hw.init = &(struct clk_init_data) {
>> +		.name = "sd_emmc_c_clk0_sel",
>> +		.ops = &clk_regmap_mux_ops,
>> +		.parent_data = s4_sd_emmc_clk0_parent_data,
>> +		.num_parents = ARRAY_SIZE(s4_sd_emmc_clk0_parent_data),
>> +		/*
>> +		 * When the driver uses this clock, needs to specify the patent clock
>> +		 * he wants in the dts.
>> +		 */
> 
> I'm getting a bit suspicious about the use (and abuse ...) of this flag.
> I don't quite get how selecting the base PLL for MMC should be done on
> use-case basis and should be up the board DT ...
> 
> Other SoC have all used fdiv2 so far. Do you expect this setting to be
> part of the dtsi SoC file ?
> 
>> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
>> +	},
>> +};
>> +
> 
>> +
>> +/* SPICC Clock */
>> +static const struct clk_parent_data s4_spicc_parent_data[] = {
>> +	{ .fw_name = "xtal", },
>> +	{ .hw = &s4_sys_clk.hw },
>> +	{ .fw_name = "fclk_div4", },
>> +	{ .fw_name = "fclk_div3", },
>> +	{ .fw_name = "fclk_div2", },
>> +	{ .fw_name = "fclk_div5", },
>> +	{ .fw_name = "fclk_div7", },
>> +};
>> +
>> +static struct clk_regmap s4_spicc0_mux = {
>> +	.data = &(struct clk_regmap_mux_data){
>> +		.offset = CLKCTRL_SPICC_CLK_CTRL,
>> +		.mask = 0x7,
>> +		.shift = 7,
>> +	},
>> +	.hw.init = &(struct clk_init_data) {
>> +		.name = "spicc0_mux",
>> +		.ops = &clk_regmap_mux_ops,
>> +		.parent_data = s4_spicc_parent_data,
>> +		.num_parents = ARRAY_SIZE(s4_spicc_parent_data),
>> +		/*
>> +		 * When the driver uses this clock, needs to specify the patent clock
>> +		 * he wants in the dts.
>> +		 */
> 
> This is getting too far. All the parent clocks are fixed.
> Let CCF do the job of picking the most adequate clock for the job
> instead of manually settings things
> 
>> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
>> +	},
>> +};
>> +
> 
> 
>> +
>> +/* PWM Clock */
>> +static const struct clk_parent_data s4_pwm_parent_data[] = {
>> +	{ .fw_name = "xtal", },
>> +	{ .hw = &s4_vid_pll.hw },
>> +	{ .fw_name = "fclk_div4", },
>> +	{ .fw_name = "fclk_div3", },
>> +};
>> +
>> +static struct clk_regmap s4_pwm_a_mux = {
>> +	.data = &(struct clk_regmap_mux_data) {
>> +		.offset = CLKCTRL_PWM_CLK_AB_CTRL,
>> +		.mask = 0x3,
>> +		.shift = 9,
>> +	},
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "pwm_a_mux",
>> +		.ops = &clk_regmap_mux_ops,
>> +		.parent_data = s4_pwm_parent_data,
>> +		.num_parents = ARRAY_SIZE(s4_pwm_parent_data),
>> +		/*
>> +		 * When the driver uses this clock, needs to specify the patent clock
>> +		 * he wants in the dts.
>> +		 */
> 
> Same here ... this is really going to far.
> 
>> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
>> +	},
>> +};
>> +
> 
>> +
>> +static struct clk_regmap s4_saradc_mux = {
>> +	.data = &(struct clk_regmap_mux_data) {
>> +		.offset = CLKCTRL_SAR_CLK_CTRL,
>> +		.mask = 0x3,
>> +		.shift = 9,
>> +	},
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "saradc_mux",
>> +		.ops = &clk_regmap_mux_ops,
>> +		.parent_data = (const struct clk_parent_data []) {
>> +			{ .fw_name = "xtal", },
>> +			{ .hw = &s4_sys_clk.hw },
>> +		},
>> +		.num_parents = 2,
>> +		/*
>> +		 * When the driver uses this clock, needs to specify the patent clock
>> +		 * he wants in the dts.
>> +		 */
> 
> For each clock type, if this flag is going to be used, I'd like a clear
> explanation about why it is use-case dependent and why you need manual
> control over this. Same applies to all the occurence.
> 
>> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
>> +	},
>> +};
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
