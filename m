Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA39C77B78
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Apr 2023 11:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S4aRJe/rEqhVFawWb3C+wK3NgkCDibnE+dCLW1dXmKA=; b=cXTpJdVOCrSlBy
	jgDkzuDYR5PfSnIAdGP6Ahl2vGJAXIK3XDQ0sYd/dsORcPgqrqHPP+AdZ/pxxMm6EYpObMKHMQtqU
	g356rFt396/tNexfyt4Kg/QaYRWW2/MtM24P/jab3tXNpIcyIEfaY2UsM+ouEG8aiMPbzCFUg5ffF
	Ykph2eOJ78HJfDrz52O+/JLtm1r+MUiu6QtCSlUOwe4AaIWz4UaVoCjnAbmkpVggJb8NZmpmuKbnf
	QNgZAZq9eLYAnWcOjXzn9pc16oxCsZZMhh6/ehRkjArM6/y56NRGHHx8KWndO3D0XsOuaUoM7OlvS
	bpaWvJXkp/nOmuZKMkcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prcy5-003iPI-0E;
	Wed, 26 Apr 2023 11:05:49 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prcy0-003iN6-0c;
	Wed, 26 Apr 2023 11:05:47 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id C3D235FD7A;
	Wed, 26 Apr 2023 14:05:39 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1682507139;
	bh=mk5alZKFSoxzLGhsqJ1BDxTrptWunt8lfVSZGARmYfI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=i7a8nPO9995Z/5uPXp78chLMg2rLFQ38AZIjzyB//P70pw20qOROtU8HYJ9DB5BA9
	 OvwBnPffCIgd0QU9dju9R02Fdm15D8PyKEVsi6r9pAvwF+brTuKKpx6dFQgzkpHxpi
	 ZP/9bhMPsfaQTfixH9vluA9J4ydQvj8qcOvqT6UIExLfHGsHXqbElwVsLhkaW58xQ4
	 fxiqQCCNRdyjVsBX2MwFle/IlGN0FLFZvijR9DowjTvIaTrLK9QFJRpF4JakaZS1RW
	 UYnJwqHS4T3SxeNgxTO/5cj6j4T5XytWvZRaSDQHCHAwSKsae91T6I4+r9e9PY48to
	 PQunlBKlMGzsw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 26 Apr 2023 14:05:39 +0300 (MSK)
Date: Wed, 26 Apr 2023 14:05:38 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Yu Tu <yu.tu@amlogic.com>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, <kelvin.zhang@amlogic.com>,
	<qi.duan@amlogic.com>
Subject: Re: [PATCH V7 4/4] clk: meson: s4: add support for Amlogic S4 SoC
 peripheral clock controller
Message-ID: <20230426110538.y2d4qhv2qffc62vj@CAB-WSD-L081021>
References: <20230417065005.24967-1-yu.tu@amlogic.com>
 <20230417065005.24967-5-yu.tu@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230417065005.24967-5-yu.tu@amlogic.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/26 04:45:00 #21166225
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_040544_912795_223C0D18 
X-CRM114-Status: GOOD (  23.91  )
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

On Mon, Apr 17, 2023 at 02:50:05PM +0800, Yu Tu wrote:
> Add the peripherals clock controller driver in the s4 SoC family.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  drivers/clk/meson/Kconfig          |   12 +
>  drivers/clk/meson/Makefile         |    1 +
>  drivers/clk/meson/s4-peripherals.c | 3814 ++++++++++++++++++++++++++++
>  drivers/clk/meson/s4-peripherals.h |  217 ++
>  4 files changed, 4044 insertions(+)
>  create mode 100644 drivers/clk/meson/s4-peripherals.c
>  create mode 100644 drivers/clk/meson/s4-peripherals.h
> 
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index a663c90a3f3b..a6eb9fa15c74 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -128,4 +128,16 @@ config COMMON_CLK_S4_PLL
>  	  aka s4. Amlogic S805X2 and S905Y4 devices include AQ222 and AQ229.
>  	  Say Y if you want the board to work, because plls are the parent of most
>  	  peripherals.
> +
> +config COMMON_CLK_S4
> +	tristate "S4 SoC Peripherals clock controllers support"
> +	depends on ARM64
> +	default y
> +	select COMMON_CLK_MESON_REGMAP
> +	select COMMON_CLK_MESON_DUALDIV
> +	select COMMON_CLK_MESON_VID_PLL_DIV
> +	help
> +	  Support for the Peripherals clock controller on Amlogic S805X2 and S905Y4
> +	  devices, aka s4. Amlogic S805X2 and S905Y4 devices include AQ222 and AQ229.
> +	  Say Y if you want peripherals to work.
>  endmenu
> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
> index 376f49cc13f1..c9130afccb48 100644
> --- a/drivers/clk/meson/Makefile
> +++ b/drivers/clk/meson/Makefile
> @@ -20,3 +20,4 @@ obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
>  obj-$(CONFIG_COMMON_CLK_G12A) += g12a.o g12a-aoclk.o
>  obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o meson8-ddr.o
>  obj-$(CONFIG_COMMON_CLK_S4_PLL) += s4-pll.o
> +obj-$(CONFIG_COMMON_CLK_S4) += s4-peripherals.o

[...]

> +static struct clk_regmap s4_ceca_32k_clkin = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = CLKCTRL_CECA_CTRL0,
> +		.bit_idx = 31,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "ceca_32k_clkin",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_data = (const struct clk_parent_data []) {
> +			{ .fw_name = "xtal", }
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap s4_ceca_32k_div = {
> +	.data = &(struct meson_clk_dualdiv_data){
> +		.n1 = {
> +			.reg_off = CLKCTRL_CECA_CTRL0,
> +			.shift   = 0,
> +			.width   = 12,
> +		},
> +		.n2 = {
> +			.reg_off = CLKCTRL_CECA_CTRL0,
> +			.shift   = 12,
> +			.width   = 12,
> +		},
> +		.m1 = {
> +			.reg_off = CLKCTRL_CECA_CTRL1,
> +			.shift   = 0,
> +			.width   = 12,
> +		},
> +		.m2 = {
> +			.reg_off = CLKCTRL_CECA_CTRL1,
> +			.shift   = 12,
> +			.width   = 12,
> +		},
> +		.dual = {
> +			.reg_off = CLKCTRL_CECA_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.table = s4_32k_div_table,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "ceca_32k_div",
> +		.ops = &meson_clk_dualdiv_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s4_ceca_32k_clkin.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap s4_ceca_32k_sel_pre = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = CLKCTRL_CECA_CTRL1,
> +		.mask = 0x1,
> +		.shift = 24,
> +		.flags = CLK_MUX_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "ceca_32k_sel_pre",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s4_ceca_32k_div.hw,
> +			&s4_ceca_32k_clkin.hw
> +		},
> +		.num_parents = 2,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap s4_ceca_32k_sel = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = CLKCTRL_CECA_CTRL1,
> +		.mask = 0x1,
> +		.shift = 31,
> +		.flags = CLK_MUX_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "ceca_32k_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s4_ceca_32k_sel_pre.hw,
> +			&s4_rtc_clk.hw
> +		},
> +		.num_parents = 2,
> +		.flags = CLK_SET_RATE_PARENT,

In my opinion, all clocks that can inherit from a more accurate RTC clock
should be marked with the CLK_SET_RATE_NO_REPARENT flag.
This is necessary because in certain situations, it may be required to
freeze their parent. The setup of these clocks' parent should be located
on the device tree's side.

[...]

> +
> +/*
> + * gen clk is designed for debug/monitor some internal clock quality. Some of the
> + * corresponding clock sources are not described in the clock tree and internal clock
> + * for debug, so they are skipped.
> + */
> +static u32 s4_gen_clk_mux_table[] = { 0, 4, 5, 7, 19, 21, 22,
> +				      23, 24, 25, 26, 27, 28 };
> +static const struct clk_parent_data s4_gen_clk_parent_data[] = {
> +	{ .fw_name = "xtal", },
> +	{ .hw = &s4_vid_pll.hw },
> +	{ .fw_name = "gp0_pll", },
> +	{ .fw_name = "hifi_pll", },
> +	{ .fw_name = "fclk_div2", },
> +	{ .fw_name = "fclk_div3", },
> +	{ .fw_name = "fclk_div4", },
> +	{ .fw_name = "fclk_div5", },
> +	{ .fw_name = "fclk_div7", },
> +	{ .fw_name = "mpll0", },
> +	{ .fw_name = "mpll1", },
> +	{ .fw_name = "mpll2", },
> +	{ .fw_name = "mpll3", },
> +};
> +
> +static struct clk_regmap s4_gen_clk_sel = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = CLKCTRL_GEN_CLK_CTRL,
> +		.mask = 0x1f,
> +		.shift = 12,
> +		.table = s4_gen_clk_mux_table,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "gen_clk_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_data = s4_gen_clk_parent_data,
> +		.num_parents = ARRAY_SIZE(s4_gen_clk_parent_data),

I think, the gen_clk selector should be marked with the
CLK_SET_RATE_NO_REPARENT flag. This is because the GEN clock can be
connected to an external pad and may be set up directly from the
device tree.

> +	},
> +};
> +
> +static struct clk_regmap s4_gen_clk_div = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = CLKCTRL_GEN_CLK_CTRL,
> +		.shift = 0,
> +		.width = 11,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "gen_clk_div",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s4_gen_clk_sel.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap s4_gen_clk = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = CLKCTRL_GEN_CLK_CTRL,
> +		.bit_idx = 11,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "gen_clk",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s4_gen_clk_div.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
> +	},
> +};
> +

[...]

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
