Return-Path: <SRS0=UCsf=E7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 270C8C56202
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 17:32:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 060B6206B5
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 17:32:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cXrBdBjz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jK5CH9sE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 060B6206B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vpRpS3KDoX791ZosERgc/RqehTpkBY3SZX3B2BnFkM4=; b=cXrBdBjz/q/bISc5U2K2vEA3V
	PMB/f4NqlIXTs/zjBJQKLRLV8Fazr4A8tADFZwTFiomxRQlDIxpOR5XxA+Qr28XnhKqAol9H4gQ4z
	393j1O66805FG6RLiSLxM0gNLNYYoEHuNpe+ng6qOny6DQokhSM6CuBfppegMv5oT20d4rSgLOA5F
	3+Xr+E/LD2vUhhIH+DvfRhv6WPQwYskiuuIPhAHsZqZq9q3QPM75asvUda6D6PF+RCE0DCVla9S+n
	wCtJmvDtgOvZWBjwhhAE0QPIQxWWTlSeYsyFyheWZi8Ao1moJUrYGY18wO3+i8/s9xgnkHtdw+xHu
	E4y0KjKQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khyeg-0005KX-Rt; Wed, 25 Nov 2020 17:32:34 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khyec-0005JX-Cv
 for linux-amlogic@lists.infradead.org; Wed, 25 Nov 2020 17:32:31 +0000
Received: by mail-wr1-x444.google.com with SMTP id 64so2684651wra.11
 for <linux-amlogic@lists.infradead.org>; Wed, 25 Nov 2020 09:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=YeiDrEc86xIycJfwKc5bLCqAgMKj5XTfNaIBX6lyjdA=;
 b=jK5CH9sEY686hQgSKe1CwyrnXFmIAXDl+oH3T/yxkKLng6zt5CB9uStMQrqx9Kuuaw
 dDKmaV/d8ZQr8XFFV5sl1t7MD1d6pjgw8aP/xEywbNs+e/hzP5/DBPH8X0xPoUj+kTm4
 remvAq2JEgWSHMBKs4vp04i4hGdo0gz3l8hS4umApryHihbAC1gIycECc2qbeTQaiRqr
 jq2u/U6sTX7pITA/7cceQIbjh0Na7Ci5G4TXL7mhjzMbbEe03kBP4vlbjOvFzmGq4omk
 t3cpmgZrR0xklyKicea/ZejNOe4ojbtdwPPYOlPa0m9UdegnotnOg0dc3gF/vYu95dRy
 X9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=YeiDrEc86xIycJfwKc5bLCqAgMKj5XTfNaIBX6lyjdA=;
 b=jtjSfpWMWFZRjI4s6qGMPEXNo620uX6qsuwRFKkKO4OnKSHjYKdB2BLNE3cmWGHNvI
 SQodw3zJImZ0i8Ao0VhsFzgnLsANgahk/2WCJuL6KDeQPGijErCbsGlpDX8rhzb5vOb+
 zVKSS1zWylh/IGIfkhMPU6k9rMPm3X1zBq9WjkjAJl1aFMyGmvFc2BZCpEEodIyj/daY
 Pqi/R6JdZbAvunDhzQbiKqJNvxjIRNFXNe+z0P5TeulbPSolmBKcC8u49Ix4Dch+uKc/
 MXSIes4t+77xJ8TKiKto+wnQNtEzJWxnUwstcsBMClmhtUqlaDiH2DhtbWLvEuNiczUc
 bCaQ==
X-Gm-Message-State: AOAM533Ge4kzv2FWEvAMi6VJO1ipmLtNU1gw6vrE1SSc4Kj8XXFmdSR6
 Re8NER0pgTMvPWQ0spSd/TX5qQ==
X-Google-Smtp-Source: ABdhPJyaibWquAMim/5GHYlHcizp6oZtp39RwCmendo1r++fTRExKmfqUjlExXkf4zP10ewkK4e+5w==
X-Received: by 2002:a5d:514a:: with SMTP id u10mr5354145wrt.312.1606325547270; 
 Wed, 25 Nov 2020 09:32:27 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
 by smtp.gmail.com with ESMTPSA id p4sm5740947wrm.51.2020.11.25.09.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 09:32:26 -0800 (PST)
References: <20201123163811.353444-1-narmstrong@baylibre.com>
 <20201123163811.353444-3-narmstrong@baylibre.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/2] clk: meson: g12a: add MIPI DSI Host Pixel Clock
In-reply-to: <20201123163811.353444-3-narmstrong@baylibre.com>
Message-ID: <1jlfep8hqu.fsf@starbuckisacylon.baylibre.com>
Date: Wed, 25 Nov 2020 18:32:25 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_123230_562607_FEA68456 
X-CRM114-Status: GOOD (  19.04  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
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


On Mon 23 Nov 2020 at 17:38, Neil Armstrong <narmstrong@baylibre.com> wrote:

> This adds the MIPI DSI Host Pixel Clock, unlike AXG, the pixel clock can be different
> from the VPU ENCL output clock to feed the DSI Host controller with a different clock rate.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Series looks good.
2 minor comments below 

> ---
>  drivers/clk/meson/g12a.c | 72 ++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/g12a.h |  3 +-
>  2 files changed, 74 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 3cb8196c8e29..3dedf8408405 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -3658,6 +3658,66 @@ static struct clk_regmap g12a_hdmi_tx = {
>  	},
>  };
>  
> +/* MIPI DSI Host Clocks */
> +
> +static const struct clk_hw *g12a_mipi_dsi_pxclk_parent_hws[] = {
> +	&g12a_vid_pll.hw,
> +	&g12a_gp0_pll.hw,
> +	&g12a_hifi_pll.hw,
> +	&g12a_mpll1.hw,
> +	&g12a_fclk_div2.hw,
> +	&g12a_fclk_div2p5.hw,
> +	&g12a_fclk_div3.hw,
> +	&g12a_fclk_div7.hw,
> +};
> +
> +static struct clk_regmap g12a_mipi_dsi_pxclk_sel = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = HHI_MIPIDSI_PHY_CLK_CNTL,
> +		.mask = 0x7,
> +		.shift = 12,
> +		.flags = CLK_MUX_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mipi_dsi_pxclk_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_hws = g12a_mipi_dsi_pxclk_parent_hws,
> +		.num_parents = ARRAY_SIZE(g12a_mipi_dsi_pxclk_parent_hws),
> +		.flags = CLK_SET_RATE_PARENT,

The id of the mux is exposed which seems to hint the mux will be
manually controller but CLK_SET_RATE_NO_REPARENT is not set. Is this on
purpose ?

> +	},
> +};
> +
> +static struct clk_regmap g12a_mipi_dsi_pxclk_div = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HHI_MIPIDSI_PHY_CLK_CNTL,
> +		.shift = 0,
> +		.width = 7,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mipi_dsi_pxclk_div",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +					&g12a_mipi_dsi_pxclk_sel.hw },

Alignment here is weird compared to the reset of the file

> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap g12a_mipi_dsi_pxclk = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = HHI_MIPIDSI_PHY_CLK_CNTL,
> +		.bit_idx = 8,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mipi_dsi_pxclk",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +					&g12a_mipi_dsi_pxclk_div.hw },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
>  /* HDMI Clocks */
>  
>  static const struct clk_parent_data g12a_hdmi_parent_data[] = {
> @@ -4403,6 +4463,9 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
>  		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
>  		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
>  		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
> +		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
> +		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
> +		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
>  		[NR_CLKS]			= NULL,
>  	},
>  	.num = NR_CLKS,
> @@ -4658,6 +4721,9 @@ static struct clk_hw_onecell_data g12b_hw_onecell_data = {
>  		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
>  		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
>  		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
> +		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
> +		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
> +		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
>  		[NR_CLKS]			= NULL,
>  	},
>  	.num = NR_CLKS,
> @@ -4904,6 +4970,9 @@ static struct clk_hw_onecell_data sm1_hw_onecell_data = {
>  		[CLKID_NNA_CORE_CLK_SEL]	= &sm1_nna_core_clk_sel.hw,
>  		[CLKID_NNA_CORE_CLK_DIV]	= &sm1_nna_core_clk_div.hw,
>  		[CLKID_NNA_CORE_CLK]		= &sm1_nna_core_clk.hw,
> +		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
> +		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
> +		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
>  		[NR_CLKS]			= NULL,
>  	},
>  	.num = NR_CLKS,
> @@ -5151,6 +5220,9 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
>  	&sm1_nna_core_clk_sel,
>  	&sm1_nna_core_clk_div,
>  	&sm1_nna_core_clk,
> +	&g12a_mipi_dsi_pxclk_sel,
> +	&g12a_mipi_dsi_pxclk_div,
> +	&g12a_mipi_dsi_pxclk,
>  };
>  
>  static const struct reg_sequence g12a_init_regs[] = {
> diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
> index 69b6a69549c7..a97613df38b3 100644
> --- a/drivers/clk/meson/g12a.h
> +++ b/drivers/clk/meson/g12a.h
> @@ -264,8 +264,9 @@
>  #define CLKID_NNA_AXI_CLK_DIV			263
>  #define CLKID_NNA_CORE_CLK_SEL			265
>  #define CLKID_NNA_CORE_CLK_DIV			266
> +#define CLKID_MIPI_DSI_PXCLK_DIV		268
>  
> -#define NR_CLKS					268
> +#define NR_CLKS					271
>  
>  /* include the CLKIDs that have been made part of the DT binding */
>  #include <dt-bindings/clock/g12a-clkc.h>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
