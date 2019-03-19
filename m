Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E227C43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 09:10:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DD1920828
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 09:10:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BfUPzWVt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cYKbcMhC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DD1920828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqO8aLYA+3INXnIYcYwcMA7GolwLAQuOdV8Fgnvlsdo=; b=BfUPzWVtcxwyd9
	QRgIXtornqn5FgFmpyp8nUWtM8zKr6ebJ6ZIH/l3A5EF3tLQ11M4LnXWaHDbqDyDgUwl5lUu8347L
	hZ+ASXT60iLV0Wt4tRpPyneg6H0+EpusWjZWW9ZM5MCszWdbWBYQgBx3rgFo7sG8Ec/tvQ84zkcio
	wF8ZEIlvYHW9auzD1GJVKIw6VlCAXPbJVRc7Wr4uUKW31/X4WVz44AdzyE+OgexohV1a9cWQuxwXj
	Cw/0nmFessL9FTKCn++0pXqDwp888BJCaWvf/VwnEZ3u+beEBJ8C1YV5Fj64cavPKJwdCoG7N68f5
	RnxzV5VMOOvU0aeIohwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Aku-00064s-8J; Tue, 19 Mar 2019 09:09:56 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6Akg-0005vG-5h
 for linux-amlogic@lists.infradead.org; Tue, 19 Mar 2019 09:09:47 +0000
Received: by mail-wm1-x342.google.com with SMTP id 4so15708904wmf.5
 for <linux-amlogic@lists.infradead.org>; Tue, 19 Mar 2019 02:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=+mraZVcK8W8k1Ys6gUeDXV2nyq5RYNnllPGLk5tojv0=;
 b=cYKbcMhCFs8Dw+VaXuX6DU+Daf8sWyGsfswKk7iabqQd8c8KR6oT4QPYrgb6gtvLn2
 DSEGmXcy3RDZBjgCkJIsDtV9z3uHIuvn/18qRVUydgqlvpiJo+uVdaMk6ksK+yqH0WHz
 AoLcejuA6ICgXp+pqYAbYtP0hIre+TnVh37a5gEEKz4Bs/WwDJHl4fuOGKFrzTJ5JcZ8
 2A+Aa7bzJRkYrg+N50j4bhQk06Tw6wAlKX3yI7ZCwIrxB/PbYnCGWaydNa93NqDOHzHP
 fJkYtCBaCDiB5PI5Y/GZFuD/A0k68Y+WmDgGxV5+HtvG1yqBlPWJo30OT88Atk3eLXMM
 OHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=+mraZVcK8W8k1Ys6gUeDXV2nyq5RYNnllPGLk5tojv0=;
 b=EpzN5PCmxBZywcJ0xBq+7PSMlarGOlXar2fcCs3OUDG02C9g0e8sZkz6fDSLR5rbHG
 Ur49OdiPD0bgR4PpZ0VMwpTZczpbnpZ8HkLdC+Jd/3PbVFhhSSfBbbJcXyS5KiT7Cc9P
 oEplAtXO2hMnhooYvZW26qyBxVC1/LNImd3qRrtAmepGQI5zgH4YuLUc6qpTNY7BhCLv
 N8og4EQp6Jz3dvlXhSBX6Tc7gUOEjXQy19eB3L2vvmd9voS8bG9GGYRapWPeCfI3KsZ/
 vZBlthBTZBsxPecMpS90OYKdEatBqKcY9sqxv9e7lhG9bPhqRzlTCN8UYox2kNQlYckA
 18Nw==
X-Gm-Message-State: APjAAAVUONJHCg+BOns1ZNtpI4Q8/WNXxEt2RsA30rVFDARdO5yUSg5b
 3UEBXNmFwU0PyDnDvAFx8L4Yfg==
X-Google-Smtp-Source: APXvYqy6vWFdpG2Qxbc+KS5yE9C1ixzowrwQvTf/7vF3DtGkLWgMmO9RV67AmZ/Fy29kaPMWhoPS9w==
X-Received: by 2002:a1c:f606:: with SMTP id w6mr777471wmc.130.1552986580517;
 Tue, 19 Mar 2019 02:09:40 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 q5sm13657639wrn.43.2019.03.19.02.09.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 19 Mar 2019 02:09:39 -0700 (PDT)
Message-ID: <941196f5fe605d4ea10689129a70ee2900b759e7.camel@baylibre.com>
Subject: Re: [PATCH 2/2] clk: meson-g12a: add video decoder clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: Maxime Jourdan <mjourdan@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Date: Tue, 19 Mar 2019 10:09:37 +0100
In-Reply-To: <20190319085044.8581-3-mjourdan@baylibre.com>
References: <20190319085044.8581-1-mjourdan@baylibre.com>
 <20190319085044.8581-3-mjourdan@baylibre.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_020945_979240_E5A3E96B 
X-CRM114-Status: GOOD (  15.16  )
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

On Tue, 2019-03-19 at 09:50 +0100, Maxime Jourdan wrote:

A complete sentence would have been nice ;)

Add the video decoder clocks which are ...

> Mostly like meson-gx, except that the VDEC_HEVC clock is now split in two:
> HEVC and HEVCF.
> 
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> ---
>  drivers/clk/meson/g12a.c | 160 +++++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/g12a.h |   8 +-
>  2 files changed, 167 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 3a3134976534..cfb91df884cb 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -1495,6 +1495,148 @@ static struct clk_regmap g12a_vpu = {
>  	},
>  };
>  
> +/* VDEC clocks */
> +
> +static const char * const g12a_vdec_parent_names[] = {
> +	"fclk_div2p5", "fclk_div3", "fclk_div4", "fclk_div5", "fclk_div7",
> +	"hifi_pll", "gp0_pll",
> +};
> +
> +static struct clk_regmap g12a_vdec_1_sel = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = HHI_VDEC_CLK_CNTL,
> +		.mask = 0x7,
> +		.shift = 9,
> +		.flags = CLK_MUX_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vdec_1_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_names = g12a_vdec_parent_names,
> +		.num_parents = ARRAY_SIZE(g12a_vdec_parent_names),
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap g12a_vdec_1_div = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HHI_VDEC_CLK_CNTL,
> +		.shift = 0,
> +		.width = 7,

Maxime, the parent mux has "ROUND_CLOSEST" but this div does not, which means
it will round down. Is it on purpose ?

* If you can't the allow vdec_1 to round above the request (for safety reason
maybe) then none of the element should round closest.
* If you want closest achievable frequency (even if higher) for vdec_1, then
both element should round closest.

Same comment applies below

This is not a blocker but I'd like you to clarify.

> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vdec_1_div",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_names = (const char *[]){ "vdec_1_sel" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap g12a_vdec_1 = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = HHI_VDEC_CLK_CNTL,
> +		.bit_idx = 8,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "vdec_1",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_names = (const char *[]){ "vdec_1_div" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap g12a_vdec_hevcf_sel = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = HHI_VDEC2_CLK_CNTL,
> +		.mask = 0x7,
> +		.shift = 9,
> +		.flags = CLK_MUX_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vdec_hevcf_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_names = g12a_vdec_parent_names,
> +		.num_parents = ARRAY_SIZE(g12a_vdec_parent_names),
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap g12a_vdec_hevcf_div = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HHI_VDEC2_CLK_CNTL,
> +		.shift = 0,
> +		.width = 7,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vdec_hevcf_div",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_names = (const char *[]){ "vdec_hevcf_sel" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap g12a_vdec_hevcf = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = HHI_VDEC2_CLK_CNTL,
> +		.bit_idx = 8,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "vdec_hevcf",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_names = (const char *[]){ "vdec_hevcf_div" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap g12a_vdec_hevc_sel = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = HHI_VDEC2_CLK_CNTL,
> +		.mask = 0x7,
> +		.shift = 25,
> +		.flags = CLK_MUX_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vdec_hevc_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_names = g12a_vdec_parent_names,
> +		.num_parents = ARRAY_SIZE(g12a_vdec_parent_names),
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap g12a_vdec_hevc_div = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HHI_VDEC2_CLK_CNTL,
> +		.shift = 16,
> +		.width = 7,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vdec_hevc_div",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_names = (const char *[]){ "vdec_hevc_sel" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap g12a_vdec_hevc = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = HHI_VDEC2_CLK_CNTL,
> +		.bit_idx = 24,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "vdec_hevc",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_names = (const char *[]){ "vdec_hevc_div" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
>  /* VAPB Clock */
>  
>  static const char * const g12a_vapb_parent_names[] = {
> @@ -2615,6 +2757,15 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
>  		[CLKID_PCIE_PLL_DCO_DIV2]	= &g12a_pcie_pll_dco_div2.hw,
>  		[CLKID_PCIE_PLL_OD]		= &g12a_pcie_pll_od.hw,
>  		[CLKID_PCIE_PLL]		= &g12a_pcie_pll.hw,
> +		[CLKID_VDEC_1_SEL]		= &g12a_vdec_1_sel.hw,
> +		[CLKID_VDEC_1_DIV]		= &g12a_vdec_1_div.hw,
> +		[CLKID_VDEC_1]			= &g12a_vdec_1.hw,
> +		[CLKID_VDEC_HEVC_SEL]		= &g12a_vdec_hevc_sel.hw,
> +		[CLKID_VDEC_HEVC_DIV]		= &g12a_vdec_hevc_div.hw,
> +		[CLKID_VDEC_HEVC]		= &g12a_vdec_hevc.hw,
> +		[CLKID_VDEC_HEVCF_SEL]		= &g12a_vdec_hevcf_sel.hw,
> +		[CLKID_VDEC_HEVCF_DIV]		= &g12a_vdec_hevcf_div.hw,
> +		[CLKID_VDEC_HEVCF]		= &g12a_vdec_hevcf.hw,
>  		[NR_CLKS]			= NULL,
>  	},
>  	.num = NR_CLKS,
> @@ -2803,6 +2954,15 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
>  	&g12a_cpu_clk_trace,
>  	&g12a_pcie_pll_od,
>  	&g12a_pcie_pll_dco,
> +	&g12a_vdec_1_sel,
> +	&g12a_vdec_1_div,
> +	&g12a_vdec_1,
> +	&g12a_vdec_hevc_sel,
> +	&g12a_vdec_hevc_div,
> +	&g12a_vdec_hevc,
> +	&g12a_vdec_hevcf_sel,
> +	&g12a_vdec_hevcf_div,
> +	&g12a_vdec_hevcf,
>  };
>  
>  static const struct meson_eeclkc_data g12a_clkc_data = {
> diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
> index 1393a09730a6..39c41af70804 100644
> --- a/drivers/clk/meson/g12a.h
> +++ b/drivers/clk/meson/g12a.h
> @@ -189,8 +189,14 @@
>  #define CLKID_PCIE_PLL_DCO			198
>  #define CLKID_PCIE_PLL_DCO_DIV2			199
>  #define CLKID_PCIE_PLL_OD			200
> +#define CLKID_VDEC_1_SEL			202
> +#define CLKID_VDEC_1_DIV			203
> +#define CLKID_VDEC_HEVC_SEL			205
> +#define CLKID_VDEC_HEVC_DIV			206
> +#define CLKID_VDEC_HEVCF_SEL			208
> +#define CLKID_VDEC_HEVCF_DIV			209
>  
> -#define NR_CLKS					202
> +#define NR_CLKS					211
>  
>  /* include the CLKIDs that have been made part of the DT binding */
>  #include <dt-bindings/clock/g12a-clkc.h>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
