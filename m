Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C04C43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 09:34:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8BDB20854
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 09:34:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jNJC9/jH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ivVZ6pzl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8BDB20854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3tb7Q96c4jBpODy4Rl9UZ4T/v7bSj9MhICRnuC240FA=; b=jNJC9/jHt9ZYy7
	Mzds3LmJAEXH5KYHuHqZopNggSzndZaMpViHrMF2jj/hXwsp/c+drl7Qzwy7f0I58uE3F9Y+NiE5w
	rlvccf/WnbZpaheKJvzSSSzFZKStzpCSxqIMK1gofS92jfZ41UTcVlm+g27JaMxuMl0NjP0Qx2Q9x
	Be6uINv65xVP2DtsceMI2hLwpzE0mRP4b4FNb+DBSZaNm/oGPikzBv+vkyOOEKkcszNj1BZjdIG8l
	1kHub7hASaTI/anQPMJxZrLlJqNMJOVHvu7yYWft8Dk5Uj4l3+QjFCvGydQPBecq28FJ86afha/0r
	MuXUCBIUYBW4iQ5aQDqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6B8b-0007gd-SQ; Tue, 19 Mar 2019 09:34:25 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6B8R-0007Xa-VF
 for linux-amlogic@lists.infradead.org; Tue, 19 Mar 2019 09:34:18 +0000
Received: by mail-wm1-x343.google.com with SMTP id a184so1877196wma.2
 for <linux-amlogic@lists.infradead.org>; Tue, 19 Mar 2019 02:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1secG8grQnDRzOPQL9tPYAFq3zh/WVmWP3ZHLtk8oeQ=;
 b=ivVZ6pzlVyyc019tK8EgOr+wcslYmqPierr3nIm2a6YkftCCS3sj3/GbjWZ8CsYNTF
 eOLi+n4/Q8cuMAAZW1bHu//4+5kFwiSw3gBi8zZdii2Gu8F9/X4Fb+gtwi3gvT/rs3AG
 1VnL2cVuEUIcsS32pDWlAiP0PCbVpYQitW/MWtgaYTRR8X7V7sWxX4as5rpCVaX4Qwiu
 M4Pg+wsfVjBdQU5pq0mzhOSpQ8Dh+sCEvDhCLeZ/jSVEzTEAZ79r549tI7uAysuN+4vr
 N5nFfgyMUf8G8BApahOYWmyPFJjs3tV7g1zlUJCr4helVhVAuPGkvw5bnb9//lcU5fLS
 fqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1secG8grQnDRzOPQL9tPYAFq3zh/WVmWP3ZHLtk8oeQ=;
 b=XM7/mx8u1emhGswm2SvWZmruaSRZnqBCHLvarYSYllq+pa2IpfCKW44Ds7brht/y8E
 mFY9T0i95fBU62JHFc9nEUpUOvM+OjKt6h0XvVQSstvrpJCpNuVmDYd0Wm4qtcTelTCm
 QEFaTXBWP++bAS7jbe2sAb5eL8k33RGVAmWmunqSHd3oby+Z8HSxiTcs5iDDbkfivJc7
 nuXJ4OvVXQvXhD7hTPG6Gii9A+4OqS3pEZR6Hwh33VgJ3ipAcWMvMBWamq2xXTLhYmlv
 L8oTe4JkDiJKRRJypEdcWiZky0XxDh6E3XtiNNfDhyTpQJHa3eEXNvxnpogQcQXVSLwF
 JwAA==
X-Gm-Message-State: APjAAAXk+qS3ishw1JjQiFw9y3sHl8rxKd5PIkTNo1qA3fGw6VhcEtyj
 jsQihYZ2ePywtJN6et4lYFtdKwnvGdSL09El2Xkoug==
X-Google-Smtp-Source: APXvYqwit9HuMrFvVxwlOC7XX16+R9K2iHAyLsDcVmomSfJ1yp2SMOUXxKT6+drqa8hXKPtkIc0z++fU+zTqNqCFslE=
X-Received: by 2002:a7b:c5c3:: with SMTP id n3mr1761678wmk.82.1552988054233;
 Tue, 19 Mar 2019 02:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190319085044.8581-1-mjourdan@baylibre.com>
 <20190319085044.8581-3-mjourdan@baylibre.com>
 <941196f5fe605d4ea10689129a70ee2900b759e7.camel@baylibre.com>
In-Reply-To: <941196f5fe605d4ea10689129a70ee2900b759e7.camel@baylibre.com>
From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Tue, 19 Mar 2019 10:34:03 +0100
Message-ID: <CAMO6nayZzBb7jaN3-nkxqQT+9-h3+oAtAr=jnrvcDYhHGBKAeA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: meson-g12a: add video decoder clocks
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_023416_011306_45922648 
X-CRM114-Status: GOOD (  19.61  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,
On Tue, Mar 19, 2019 at 10:09 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> On Tue, 2019-03-19 at 09:50 +0100, Maxime Jourdan wrote:
>
> A complete sentence would have been nice ;)
>
> Add the video decoder clocks which are ...
>

Sorry about that, I'll apply myself in the future.

> > Mostly like meson-gx, except that the VDEC_HEVC clock is now split in two:
> > HEVC and HEVCF.
> >
> > Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> > ---
> >  drivers/clk/meson/g12a.c | 160 +++++++++++++++++++++++++++++++++++++++
> >  drivers/clk/meson/g12a.h |   8 +-
> >  2 files changed, 167 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> > index 3a3134976534..cfb91df884cb 100644
> > --- a/drivers/clk/meson/g12a.c
> > +++ b/drivers/clk/meson/g12a.c
> > @@ -1495,6 +1495,148 @@ static struct clk_regmap g12a_vpu = {
> >       },
> >  };
> >
> > +/* VDEC clocks */
> > +
> > +static const char * const g12a_vdec_parent_names[] = {
> > +     "fclk_div2p5", "fclk_div3", "fclk_div4", "fclk_div5", "fclk_div7",
> > +     "hifi_pll", "gp0_pll",
> > +};
> > +
> > +static struct clk_regmap g12a_vdec_1_sel = {
> > +     .data = &(struct clk_regmap_mux_data){
> > +             .offset = HHI_VDEC_CLK_CNTL,
> > +             .mask = 0x7,
> > +             .shift = 9,
> > +             .flags = CLK_MUX_ROUND_CLOSEST,
> > +     },
> > +     .hw.init = &(struct clk_init_data){
> > +             .name = "vdec_1_sel",
> > +             .ops = &clk_regmap_mux_ops,
> > +             .parent_names = g12a_vdec_parent_names,
> > +             .num_parents = ARRAY_SIZE(g12a_vdec_parent_names),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +     },
> > +};
> > +
> > +static struct clk_regmap g12a_vdec_1_div = {
> > +     .data = &(struct clk_regmap_div_data){
> > +             .offset = HHI_VDEC_CLK_CNTL,
> > +             .shift = 0,
> > +             .width = 7,
>
> Maxime, the parent mux has "ROUND_CLOSEST" but this div does not, which means
> it will round down. Is it on purpose ?
>
> * If you can't the allow vdec_1 to round above the request (for safety reason
> maybe) then none of the element should round closest.
> * If you want closest achievable frequency (even if higher) for vdec_1, then
> both element should round closest.
>
> Same comment applies below
>
> This is not a blocker but I'd like you to clarify.
>

The goal is indeed to always round closest, so I will add the divider
flags (all of the three divs need it, not just this one).

I based most of those clocks from the ones in GXBB, which do not
include the flags. I'll push a fix for this platform as well.

Cheers,
Maxime

> > +     },
> > +     .hw.init = &(struct clk_init_data){
> > +             .name = "vdec_1_div",
> > +             .ops = &clk_regmap_divider_ops,
> > +             .parent_names = (const char *[]){ "vdec_1_sel" },
> > +             .num_parents = 1,
> > +             .flags = CLK_SET_RATE_PARENT,
> > +     },
> > +};
> > +
> > +static struct clk_regmap g12a_vdec_1 = {
> > +     .data = &(struct clk_regmap_gate_data){
> > +             .offset = HHI_VDEC_CLK_CNTL,
> > +             .bit_idx = 8,
> > +     },
> > +     .hw.init = &(struct clk_init_data) {
> > +             .name = "vdec_1",
> > +             .ops = &clk_regmap_gate_ops,
> > +             .parent_names = (const char *[]){ "vdec_1_div" },
> > +             .num_parents = 1,
> > +             .flags = CLK_SET_RATE_PARENT,
> > +     },
> > +};
> > +
> > +static struct clk_regmap g12a_vdec_hevcf_sel = {
> > +     .data = &(struct clk_regmap_mux_data){
> > +             .offset = HHI_VDEC2_CLK_CNTL,
> > +             .mask = 0x7,
> > +             .shift = 9,
> > +             .flags = CLK_MUX_ROUND_CLOSEST,
> > +     },
> > +     .hw.init = &(struct clk_init_data){
> > +             .name = "vdec_hevcf_sel",
> > +             .ops = &clk_regmap_mux_ops,
> > +             .parent_names = g12a_vdec_parent_names,
> > +             .num_parents = ARRAY_SIZE(g12a_vdec_parent_names),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +     },
> > +};
> > +
> > +static struct clk_regmap g12a_vdec_hevcf_div = {
> > +     .data = &(struct clk_regmap_div_data){
> > +             .offset = HHI_VDEC2_CLK_CNTL,
> > +             .shift = 0,
> > +             .width = 7,
> > +     },
> > +     .hw.init = &(struct clk_init_data){
> > +             .name = "vdec_hevcf_div",
> > +             .ops = &clk_regmap_divider_ops,
> > +             .parent_names = (const char *[]){ "vdec_hevcf_sel" },
> > +             .num_parents = 1,
> > +             .flags = CLK_SET_RATE_PARENT,
> > +     },
> > +};
> > +
> > +static struct clk_regmap g12a_vdec_hevcf = {
> > +     .data = &(struct clk_regmap_gate_data){
> > +             .offset = HHI_VDEC2_CLK_CNTL,
> > +             .bit_idx = 8,
> > +     },
> > +     .hw.init = &(struct clk_init_data) {
> > +             .name = "vdec_hevcf",
> > +             .ops = &clk_regmap_gate_ops,
> > +             .parent_names = (const char *[]){ "vdec_hevcf_div" },
> > +             .num_parents = 1,
> > +             .flags = CLK_SET_RATE_PARENT,
> > +     },
> > +};
> > +
> > +static struct clk_regmap g12a_vdec_hevc_sel = {
> > +     .data = &(struct clk_regmap_mux_data){
> > +             .offset = HHI_VDEC2_CLK_CNTL,
> > +             .mask = 0x7,
> > +             .shift = 25,
> > +             .flags = CLK_MUX_ROUND_CLOSEST,
> > +     },
> > +     .hw.init = &(struct clk_init_data){
> > +             .name = "vdec_hevc_sel",
> > +             .ops = &clk_regmap_mux_ops,
> > +             .parent_names = g12a_vdec_parent_names,
> > +             .num_parents = ARRAY_SIZE(g12a_vdec_parent_names),
> > +             .flags = CLK_SET_RATE_PARENT,
> > +     },
> > +};
> > +
> > +static struct clk_regmap g12a_vdec_hevc_div = {
> > +     .data = &(struct clk_regmap_div_data){
> > +             .offset = HHI_VDEC2_CLK_CNTL,
> > +             .shift = 16,
> > +             .width = 7,
> > +     },
> > +     .hw.init = &(struct clk_init_data){
> > +             .name = "vdec_hevc_div",
> > +             .ops = &clk_regmap_divider_ops,
> > +             .parent_names = (const char *[]){ "vdec_hevc_sel" },
> > +             .num_parents = 1,
> > +             .flags = CLK_SET_RATE_PARENT,
> > +     },
> > +};
> > +
> > +static struct clk_regmap g12a_vdec_hevc = {
> > +     .data = &(struct clk_regmap_gate_data){
> > +             .offset = HHI_VDEC2_CLK_CNTL,
> > +             .bit_idx = 24,
> > +     },
> > +     .hw.init = &(struct clk_init_data) {
> > +             .name = "vdec_hevc",
> > +             .ops = &clk_regmap_gate_ops,
> > +             .parent_names = (const char *[]){ "vdec_hevc_div" },
> > +             .num_parents = 1,
> > +             .flags = CLK_SET_RATE_PARENT,
> > +     },
> > +};
> > +
> >  /* VAPB Clock */
> >
> >  static const char * const g12a_vapb_parent_names[] = {
> > @@ -2615,6 +2757,15 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
> >               [CLKID_PCIE_PLL_DCO_DIV2]       = &g12a_pcie_pll_dco_div2.hw,
> >               [CLKID_PCIE_PLL_OD]             = &g12a_pcie_pll_od.hw,
> >               [CLKID_PCIE_PLL]                = &g12a_pcie_pll.hw,
> > +             [CLKID_VDEC_1_SEL]              = &g12a_vdec_1_sel.hw,
> > +             [CLKID_VDEC_1_DIV]              = &g12a_vdec_1_div.hw,
> > +             [CLKID_VDEC_1]                  = &g12a_vdec_1.hw,
> > +             [CLKID_VDEC_HEVC_SEL]           = &g12a_vdec_hevc_sel.hw,
> > +             [CLKID_VDEC_HEVC_DIV]           = &g12a_vdec_hevc_div.hw,
> > +             [CLKID_VDEC_HEVC]               = &g12a_vdec_hevc.hw,
> > +             [CLKID_VDEC_HEVCF_SEL]          = &g12a_vdec_hevcf_sel.hw,
> > +             [CLKID_VDEC_HEVCF_DIV]          = &g12a_vdec_hevcf_div.hw,
> > +             [CLKID_VDEC_HEVCF]              = &g12a_vdec_hevcf.hw,
> >               [NR_CLKS]                       = NULL,
> >       },
> >       .num = NR_CLKS,
> > @@ -2803,6 +2954,15 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
> >       &g12a_cpu_clk_trace,
> >       &g12a_pcie_pll_od,
> >       &g12a_pcie_pll_dco,
> > +     &g12a_vdec_1_sel,
> > +     &g12a_vdec_1_div,
> > +     &g12a_vdec_1,
> > +     &g12a_vdec_hevc_sel,
> > +     &g12a_vdec_hevc_div,
> > +     &g12a_vdec_hevc,
> > +     &g12a_vdec_hevcf_sel,
> > +     &g12a_vdec_hevcf_div,
> > +     &g12a_vdec_hevcf,
> >  };
> >
> >  static const struct meson_eeclkc_data g12a_clkc_data = {
> > diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
> > index 1393a09730a6..39c41af70804 100644
> > --- a/drivers/clk/meson/g12a.h
> > +++ b/drivers/clk/meson/g12a.h
> > @@ -189,8 +189,14 @@
> >  #define CLKID_PCIE_PLL_DCO                   198
> >  #define CLKID_PCIE_PLL_DCO_DIV2                      199
> >  #define CLKID_PCIE_PLL_OD                    200
> > +#define CLKID_VDEC_1_SEL                     202
> > +#define CLKID_VDEC_1_DIV                     203
> > +#define CLKID_VDEC_HEVC_SEL                  205
> > +#define CLKID_VDEC_HEVC_DIV                  206
> > +#define CLKID_VDEC_HEVCF_SEL                 208
> > +#define CLKID_VDEC_HEVCF_DIV                 209
> >
> > -#define NR_CLKS                                      202
> > +#define NR_CLKS                                      211
> >
> >  /* include the CLKIDs that have been made part of the DT binding */
> >  #include <dt-bindings/clock/g12a-clkc.h>
>
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
