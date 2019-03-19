Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87529C43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 09:56:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55581206BA
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 09:56:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OFRoNhsA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UxNSvKyu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55581206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wG6DqDdAqHGOCSmmNGAV/t+TaA/gyEqrR3G0J49KwRQ=; b=OFRoNhsAeAacEr
	k7AQxsLPFLOfHv7z/yjmzNAe5/de15QqbiJ3h4XT5cKh1TT4CpZ/V8OrdSWkmx+ygMxJokSVlXLow
	LnGrUJ1UezHQ0ctmra/o7Tc5CfEt3mO9B0FB/iQZACbzI6e0CHhb5Kt4EPsLpAyDElgQrnGqLxTaE
	W3MHZ1en/XeJSaegQM3hTyxL25aP2eHEQHGxjseqIIvYxRd4vwgY8XbwFnkD1D0LUGKj76Vo2x0v2
	MMHUGu2wsiUktkgu/lhBzFGVCdbOBDrVX5dJBSUEGru+Bnecg4ZoFeAs8TrjllsHbkCb52L1Es7GF
	pZZ90Tf1veIeWqd4F+yQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6BTe-00006m-At; Tue, 19 Mar 2019 09:56:10 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6BTU-0008Oc-Fb
 for linux-amlogic@lists.infradead.org; Tue, 19 Mar 2019 09:56:03 +0000
Received: by mail-wm1-x341.google.com with SMTP id t124so15693761wma.4
 for <linux-amlogic@lists.infradead.org>; Tue, 19 Mar 2019 02:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=NrP4Mi9oeJxxGsdJ7+Eiov2NQ2xo2XxCE9zjWrUOj+k=;
 b=UxNSvKyuApAmuff+KKZx9ep1+B2y80nsXl42EDjuURnJccuEsQuXtlmUid+0kgMA3r
 +MrlswW2uyVznivOM77mj5b2BLmpmeVaSGA/rHDo/X0pYpuIS0JURSscKq/UuPCHzGQ8
 W7Ljc9mcepJ7wwEFo/ZBH3oegPYKeReZ53xekj+2RB0v1QXMCEnJZHMyc/iCoSowEKBT
 P7JvKFZtUklOzqxSel+8eI6kddf/IMONuy6qLB17Qt3GhIvw3GKVL+lVK95MtCLhpefp
 7lgCmzLDMkjc6kH8OcBekwiuJyjtfnhRr4xm9yKDdzkDfvEQ9qh2dADnvMPvmWvUSxkq
 Y/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=NrP4Mi9oeJxxGsdJ7+Eiov2NQ2xo2XxCE9zjWrUOj+k=;
 b=p/5C+JiKO7kS3zTIknLWnQsY7UzajYlajYg61vCyJ9jOKXcleSlYnWJvgmxdmk72SG
 ifsmJfBGnmalQ8xIWr6HQiHC2zY2t8gTneVbXyIDuRaNoLT2kVacDHlWqEbiC/4flkfw
 dssqgrj4qsL5DSdwZjBfjucKNL6FISf/g7xgx3sLcBbzXz0yN+d42FMQh90gdoh2kX/t
 XWvBe3gmoJNXMvhxNBm3U453syXeXMjG5LDFAkbY4vQr5bKNBnMCvRlodNET+c7cI/2D
 KjMfDM8u94kXtykq/+AnBrV0EaxgD7mFnS3vkdcAZHlPUaoOjdRuFrV89cu9exK1Kxb7
 OQAQ==
X-Gm-Message-State: APjAAAU0+VxZk0GUBJlHhD5XOtpdNNeBXHSTBg37tb4fdB9dUtQC7qNR
 73JAnKq29BZn5kQd3keMtuv/7A==
X-Google-Smtp-Source: APXvYqw9XNFgfMyTb59DlP+RsgWiv+jG45b3uMwXygdijh3aGekXr1kcNtoqxB2AIwABPaB0SAvk8Q==
X-Received: by 2002:a1c:eb1a:: with SMTP id j26mr2678872wmh.43.1552989358684; 
 Tue, 19 Mar 2019 02:55:58 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 d9sm25841879wrn.72.2019.03.19.02.55.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 19 Mar 2019 02:55:57 -0700 (PDT)
Message-ID: <f160590677d4eb03c31c7cb81fbca20d8916c460.camel@baylibre.com>
Subject: Re: [PATCH 3/3] clk: meson-g12a: add PCIE PLL clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Date: Tue, 19 Mar 2019 10:55:56 +0100
In-Reply-To: <20190307141455.23879-4-narmstrong@baylibre.com>
References: <20190307141455.23879-1-narmstrong@baylibre.com>
 <20190307141455.23879-4-narmstrong@baylibre.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_025600_526936_A54B5B15 
X-CRM114-Status: GOOD (  17.99  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 2019-03-07 at 15:14 +0100, Neil Armstrong wrote:
> Add the PCIe reference clock feeding the USB3 + PCIE combo PHY.
> 
> This PLL needs a very precise register sequence to permit to be locked,
> thus using the specific clk-pll pcie ops.
> 
> The PLL is then followed by :
> - a fixed /2 divider
> - a 5-bit 1-based divider
> - a final /2 divider
> 
> This reference clock is fixed to 100MHz, thus only a single PLL setup
> is added.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/meson/g12a.c | 118 +++++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/g12a.h |   5 +-
>  2 files changed, 122 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 80a7172df2a6..d382c21a29e5 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -614,6 +614,118 @@ static struct clk_regmap g12a_hifi_pll = {
>  	},
>  };
>  
> +/*
> + * The Meson G12A PCIE PLL is fined tuned to deliver a very precise
> + * 100MHz reference clock for the PCIe Analog PHY, and thus requires
> + * a strict register sequence to enable the PLL.
> + */
> +static const struct reg_sequence g12a_pcie_pll_init_regs[] = {
> +	{ .reg = HHI_PCIE_PLL_CNTL0,	.def = 0x20090496 },
> +	{ .reg = HHI_PCIE_PLL_CNTL0,	.def = 0x30090496 },
> +	{ .reg = HHI_PCIE_PLL_CNTL1,	.def = 0x00000000 },
> +	{ .reg = HHI_PCIE_PLL_CNTL2,	.def = 0x00001100 },
> +	{ .reg = HHI_PCIE_PLL_CNTL3,	.def = 0x10058e00 },
> +	{ .reg = HHI_PCIE_PLL_CNTL4,	.def = 0x000100c0 },
> +	{ .reg = HHI_PCIE_PLL_CNTL5,	.def = 0x68000048 },
> +	{ .reg = HHI_PCIE_PLL_CNTL5,	.def = 0x68000068, .delay_us = 20 },
> +	{ .reg = HHI_PCIE_PLL_CNTL4,	.def = 0x008100c0, .delay_us = 10 },
> +	{ .reg = HHI_PCIE_PLL_CNTL0,	.def = 0x34090496 },
> +	{ .reg = HHI_PCIE_PLL_CNTL0,	.def = 0x14090496, .delay_us = 10 },
> +	{ .reg = HHI_PCIE_PLL_CNTL2,	.def = 0x00001000 },
> +};
> +
> +/* Keep a single entry table for recalc/round_rate() ops */
> +static const struct pll_params_table g12a_pcie_pll_table[] = {
> +	PLL_PARAMS(150, 1),
> +	{0, 0},
> +};
> +
> +static struct clk_regmap g12a_pcie_pll_dco = {
> +	.data = &(struct meson_clk_pll_data){
> +		.en = {
> +			.reg_off = HHI_PCIE_PLL_CNTL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = HHI_PCIE_PLL_CNTL0,
> +			.shift   = 0,
> +			.width   = 8,
> +		},
> +		.n = {
> +			.reg_off = HHI_PCIE_PLL_CNTL0,
> +			.shift   = 10,
> +			.width   = 5,
> +		},
> +		.frac = {
> +			.reg_off = HHI_PCIE_PLL_CNTL1,
> +			.shift   = 0,
> +			.width   = 12,
> +		},
> +		.l = {
> +			.reg_off = HHI_PCIE_PLL_CNTL0,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = HHI_PCIE_PLL_CNTL0,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +		.table = g12a_pcie_pll_table,
> +		.init_regs = g12a_pcie_pll_init_regs,
> +		.init_count = ARRAY_SIZE(g12a_pcie_pll_init_regs),
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "pcie_pll_dco",
> +		.ops = &meson_clk_pcie_pll_ops,
> +		.parent_names = (const char *[]){ IN_PREFIX "xtal" },
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_fixed_factor g12a_pcie_pll_dco_div2 = {
> +	.mult = 1,
> +	.div = 2,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "pcie_pll_dco_div2",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_names = (const char *[]){ "pcie_pll_dco" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap g12a_pcie_pll_od = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HHI_PCIE_PLL_CNTL0,
> +		.shift = 16,
> +		.width = 5,
> +		.flags = CLK_DIVIDER_ROUND_CLOSEST |
> +			 CLK_DIVIDER_ONE_BASED |
> +			 CLK_DIVIDER_ALLOW_ZERO,

That's unusual !
Ods have always been power of two divider so far. I suppose you have noticed
and checked this as well ?

That being said, the doc seems to imply that the global post divider will
divide by 36, which seems difficult to reach with powers of two.

> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "pcie_pll_od",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_names = (const char *[]){ "pcie_pll_dco_div2" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_fixed_factor g12a_pcie_pll = {
> +	.mult = 1,
> +	.div = 2,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "pcie_pll_pll",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_names = (const char *[]){ "pcie_pll_od" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
>  static struct clk_regmap g12a_hdmi_pll_dco = {
>  	.data = &(struct meson_clk_pll_data){
>  		.en = {
> @@ -2499,6 +2611,10 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
>  		[CLKID_CPU_CLK_AXI]		= &g12a_cpu_clk_axi.hw,
>  		[CLKID_CPU_CLK_TRACE_DIV]	= &g12a_cpu_clk_trace_div.hw,
>  		[CLKID_CPU_CLK_TRACE]		= &g12a_cpu_clk_trace.hw,
> +		[CLKID_PCIE_PLL_DCO]		= &g12a_pcie_pll_dco.hw,
> +		[CLKID_PCIE_PLL_DCO_DIV2]	= &g12a_pcie_pll_dco_div2.hw,
> +		[CLKID_PCIE_PLL_OD]		= &g12a_pcie_pll_od.hw,
> +		[CLKID_PCIE_PLL]		= &g12a_pcie_pll.hw,
>  		[NR_CLKS]			= NULL,
>  	},
>  	.num = NR_CLKS,
> @@ -2685,6 +2801,8 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
>  	&g12a_cpu_clk_axi,
>  	&g12a_cpu_clk_trace_div,
>  	&g12a_cpu_clk_trace,
> +	&g12a_pcie_pll_od,
> +	&g12a_pcie_pll_dco,
>  };
>  
>  static const struct meson_eeclkc_data g12a_clkc_data = {
> diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
> index 70aa469ca1cf..1393a09730a6 100644
> --- a/drivers/clk/meson/g12a.h
> +++ b/drivers/clk/meson/g12a.h
> @@ -186,8 +186,11 @@
>  #define CLKID_CPU_CLK_AXI			195
>  #define CLKID_CPU_CLK_TRACE_DIV			196
>  #define CLKID_CPU_CLK_TRACE			197
> +#define CLKID_PCIE_PLL_DCO			198
> +#define CLKID_PCIE_PLL_DCO_DIV2			199
> +#define CLKID_PCIE_PLL_OD			200
>  
> -#define NR_CLKS					198
> +#define NR_CLKS					202
>  
>  /* include the CLKIDs that have been made part of the DT binding */
>  #include <dt-bindings/clock/g12a-clkc.h>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
