Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F53AC43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 09:38:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BC7920854
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 09:38:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WMAg5Z1G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bg9AAbSk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BC7920854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hj/7IsLYpnpShsBprVOIcmJVfL25Bc+QRFeKvFXP5b8=; b=WMAg5Z1GC5EWcC
	j471eAPgV3P81UYN4m5dhoIBD+wcVbSm1Y37mW7rzuxNm+rpO3flAC9WLUf4WWgFay2zpYbq+CSwW
	0urjUk2iHaSfyopgqjX9TkQl/t+wlUpQesp26gTHkAliUihk0J1812rgHIF8Bu5+/9PVDDovCQPt0
	u34aRWvhsPGr/pcWsi1Hgx8MjbrBCaQiNuRdkn0i61wbCxp38I0k3ZNq319+3vACOOWxmBKe7Z9ih
	DPlsxNHx3di/bvxjV713E1Qs/MYyW9AVdpVtfNTInP5BS/3Psl+yWuNha+gu43g6fZlB0/tyIqmEn
	deRhhE0XGn9BUL4q+QuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6BCf-00015Y-Nm; Tue, 19 Mar 2019 09:38:37 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6BCT-0000sr-MM
 for linux-amlogic@lists.infradead.org; Tue, 19 Mar 2019 09:38:27 +0000
Received: by mail-wr1-x441.google.com with SMTP id w2so20166102wrt.11
 for <linux-amlogic@lists.infradead.org>; Tue, 19 Mar 2019 02:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=gEE78NY0aTh2V53BRXs7Vb1AT4RS/39YUxjOKHpK8ck=;
 b=bg9AAbSkwjF88ALNpomLOiA7hfHd+zyPw8EMoC8OPgvcl7MJO1GjxdkL/LLYuL+qpq
 fc/wcZsiW2nMHf0xWG3KfkLVCn27C0xTBQIhs8MFhhm+PIRnx8IPHJaXPFZ9mfooUcms
 CJsUvEupx3bYizsUmQHcCLD8SNhTpGnz2F1ETSCP3NePuuY7/2zi/2AhqTSO4zRygIHO
 TsVRnhPJ3lcWpTwxX0up65Vxnpyjy3H723WAOQYz3Cm2lwl3wci7F5szjIh7bt1H4o9l
 KudQrBlAKxTzEZgu8v4TvxNmlbI9ak3CrdIgSBJ1YZUnOqj9R/S2KEq67gLS1IFFjvDi
 q7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=gEE78NY0aTh2V53BRXs7Vb1AT4RS/39YUxjOKHpK8ck=;
 b=V5pfL0Q5bbch8jbw4apV8nkEY4+I0PQWaay1rdC88xZ/r4iJ0+GRGHM+pqVM29fkbd
 sztWaM0TL7RlTumRQVcHffiER++THcUxM+MjgIVJqH3MspdSRSDU91ozVFuvc1rb416L
 f1oGQzXt9dH4Y9pvHJ7BJVurzFipk8hIeOFCWhT9So+/TgvkXUzM7wIPvbAF62nhGFaC
 B7fbbZ2HfDhwSDhnA9pwHB4r82dtWHwSBPnt0LZZCuRGYb0cuzuxJHcEa3OX744YoSgR
 FEWB8+n7XssXRVLMXTl+zLZ4oX+mMZiiAgJym0lSopwC7E4jjPKPU4znPliOWlh+OT6m
 Jo2Q==
X-Gm-Message-State: APjAAAXzWEDBSr1susmpYaUqkklFM4EvCbLAUI1N2YnQV9R5LHIdJ6fY
 RCs4fjqeS0wll9RCYAfQ+QYEhRAK9JI=
X-Google-Smtp-Source: APXvYqyGC9pRd6FBea480Ckbu3+eq+E95jFx3u46HPwDS/fu+yS7YetE6jJd/VuI/eXFZIen7MHJeQ==
X-Received: by 2002:a5d:6b4c:: with SMTP id x12mr16215008wrw.14.1552988302801; 
 Tue, 19 Mar 2019 02:38:22 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 v6sm2432049wme.24.2019.03.19.02.38.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 19 Mar 2019 02:38:22 -0700 (PDT)
Message-ID: <77aff3b53a931f0a55e66694ac8578fc0eb00b1c.camel@baylibre.com>
Subject: Re: [PATCH v2 2/2] clk: meson: g12a: add cpu clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Date: Tue, 19 Mar 2019 10:38:19 +0100
In-Reply-To: <20190304131129.7762-3-narmstrong@baylibre.com>
References: <20190304131129.7762-1-narmstrong@baylibre.com>
 <20190304131129.7762-3-narmstrong@baylibre.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_023825_732357_B3C8A6F7 
X-CRM114-Status: GOOD (  18.94  )
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

On Mon, 2019-03-04 at 14:11 +0100, Neil Armstrong wrote:
> Add the Amlogic G12A Family CPU Clock tree in read/only for now.
> 
> The CPU clock can either use the SYS_PLL for > 1GHz frequencies or
> use a couple of div+mux from 1GHz/667MHz/24MHz source with 2 non-glitch
> muxes.
> 
> Proper DVFS support will come in a second time.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/meson/g12a.c | 350 +++++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/g12a.h |  22 ++-
>  2 files changed, 371 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 0e1ce8c03259..80a7172df2a6 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -150,6 +150,318 @@ static struct clk_regmap g12a_sys_pll = {
>  	},
>  };
>  
> +static struct clk_regmap g12a_sys_pll_div16_en = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = HHI_SYS_CPU_CLK_CNTL1,
> +		.bit_idx = 24,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "sys_pll_div16_en",
> +		.ops = &clk_regmap_gate_ro_ops,
> +		.parent_names = (const char *[]){ "sys_pll" },
> +		.num_parents = 1,
> +		/*
> +		 * This clock is used to debug the sys_pll range
> +		 * Linux should not change it at runtime
> +		 */
> +	},
> +};
> +
> +static struct clk_fixed_factor g12a_sys_pll_div16 = {
> +	.mult = 1,
> +	.div = 16,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "sys_pll_div16",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_names = (const char *[]){ "sys_pll_div16_en" },
> +		.num_parents = 1,
> +	},
> +};
> +
> +/* Datasheet names this field as "premux0" */
> +static struct clk_regmap g12a_cpu_clk_dyn0_sel = {

called premux0 so g12a_cpu_clk_premux0 ?

> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = HHI_SYS_CPU_CLK_CNTL0,
> +		.mask = 0x3,
> +		.shift = 0,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cpu_clk_dyn0_sel",
> +		.ops = &clk_regmap_mux_ro_ops,
> +		.parent_names = (const char *[]){ IN_PREFIX "xtal",
> +						  "fclk_div2",
> +						  "fclk_div3" },
> +		.num_parents = 3,
> +	},
> +};
> +
> +/* Datasheet names this field as "mux0_divn_tcnt" */
> +static struct clk_regmap g12a_cpu_clk_dyn0_div = {

g12a_cpu_clk_mux0_div ?

> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HHI_SYS_CPU_CLK_CNTL0,
> +		.shift = 4,
> +		.width = 6,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cpu_clk_dyn0_div",
> +		.ops = &clk_regmap_divider_ro_ops,
> +		.parent_names = (const char *[]){ "cpu_clk_dyn0_sel" },
> +		.num_parents = 1,
> +	},
> +};
> +
> +/* Datasheet names this field as "postmux0" */
> +static struct clk_regmap g12a_cpu_clk_dyn0 = {

g12a_cpu_clk_postmux0 ?

> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = HHI_SYS_CPU_CLK_CNTL0,
> +		.mask = 0x1,
> +		.shift = 2,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cpu_clk_dyn0",
> +		.ops = &clk_regmap_mux_ro_ops,
> +		.parent_names = (const char *[]){ "cpu_clk_dyn0_sel",
> +						  "cpu_clk_dyn0_div" },
> +		.num_parents = 2,
> +	},
> +};
> +
> +/* Datasheet names this field as "premux1" */
> +static struct clk_regmap g12a_cpu_clk_dyn1_sel = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = HHI_SYS_CPU_CLK_CNTL0,
> +		.mask = 0x3,
> +		.shift = 16,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cpu_clk_dyn1_sel",
> +		.ops = &clk_regmap_mux_ro_ops,
> +		.parent_names = (const char *[]){ IN_PREFIX "xtal",
> +						  "fclk_div2",
> +						  "fclk_div3" },
> +		.num_parents = 3,
> +	},
> +};
> +
> +/* Datasheet names this field as "Mux1_divn_tcnt" */
> +static struct clk_regmap g12a_cpu_clk_dyn1_div = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HHI_SYS_CPU_CLK_CNTL0,
> +		.shift = 20,
> +		.width = 6,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cpu_clk_dyn1_div",
> +		.ops = &clk_regmap_divider_ro_ops,
> +		.parent_names = (const char *[]){ "cpu_clk_dyn1_sel" },
> +		.num_parents = 1,
> +	},
> +};
> +
> +/* Datasheet names this field as "postmux1" */
> +static struct clk_regmap g12a_cpu_clk_dyn1 = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = HHI_SYS_CPU_CLK_CNTL0,
> +		.mask = 0x1,
> +		.shift = 18,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cpu_clk_dyn1",
> +		.ops = &clk_regmap_mux_ro_ops,
> +		.parent_names = (const char *[]){ "cpu_clk_dyn1_sel",
> +						  "cpu_clk_dyn1_div" },
> +		.num_parents = 2,
> +	},
> +};
> +
> +/* Datasheet names this field as "Final_dyn_mux_sel" */
> +static struct clk_regmap g12a_cpu_clk_dyn = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = HHI_SYS_CPU_CLK_CNTL0,
> +		.mask = 0x1,
> +		.shift = 10,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cpu_clk_dyn",
> +		.ops = &clk_regmap_mux_ro_ops,
> +		.parent_names = (const char *[]){ "cpu_clk_dyn0",
> +						  "cpu_clk_dyn1" },
> +		.num_parents = 2,
> +	},
> +};
> +
> +/* Datasheet names this field as "Final_mux_sel" */
> +static struct clk_regmap g12a_cpu_clk = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = HHI_SYS_CPU_CLK_CNTL0,
> +		.mask = 0x1,
> +		.shift = 11,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cpu_clk",
> +		.ops = &clk_regmap_mux_ro_ops,
> +		.parent_names = (const char *[]){ "cpu_clk_dyn",
> +						  "sys_pll" },
> +		.num_parents = 2,
> +	},
> +};
> +
> +static struct clk_regmap g12a_cpu_clk_div16_en = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = HHI_SYS_CPU_CLK_CNTL1,
> +		.bit_idx = 1,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "cpu_clk_div16_en",
> +		.ops = &clk_regmap_gate_ro_ops,
> +		.parent_names = (const char *[]){ "cpu_clk" },
> +		.num_parents = 1,
> +		/*
> +		 * This clock is used to debug the cpu_clk range
> +		 * Linux should not change it at runtime
> +		 */
> +	},
> +};
> +
> +static struct clk_fixed_factor g12a_cpu_clk_div16 = {
> +	.mult = 1,
> +	.div = 16,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cpu_clk_div16",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_names = (const char *[]){ "cpu_clk_div16_en" },
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap g12a_cpu_clk_apb_div = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HHI_SYS_CPU_CLK_CNTL1,
> +		.shift = 3,
> +		.width = 3,
> +		.flags = CLK_DIVIDER_POWER_OF_TWO,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cpu_clk_apb_div",
> +		.ops = &clk_regmap_divider_ro_ops,
> +		.parent_names = (const char *[]){ "cpu_clk" },
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap g12a_cpu_clk_apb = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = HHI_SYS_CPU_CLK_CNTL1,
> +		.bit_idx = 1,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "cpu_clk_apb",
> +		.ops = &clk_regmap_gate_ro_ops,
> +		.parent_names = (const char *[]){ "cpu_clk_apb_div" },
> +		.num_parents = 1,
> +		/*
> +		 * This clock is set by the ROM monitor code,
> +		 * Linux should not change it at runtime
> +		 */
> +	},
> +};
> +
> +static struct clk_regmap g12a_cpu_clk_atb_div = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HHI_SYS_CPU_CLK_CNTL1,
> +		.shift = 6,
> +		.width = 3,
> +		.flags = CLK_DIVIDER_POWER_OF_TWO,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cpu_clk_atb_div",
> +		.ops = &clk_regmap_divider_ro_ops,
> +		.parent_names = (const char *[]){ "cpu_clk" },
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap g12a_cpu_clk_atb = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = HHI_SYS_CPU_CLK_CNTL1,
> +		.bit_idx = 17,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "cpu_clk_atb",
> +		.ops = &clk_regmap_gate_ro_ops,
> +		.parent_names = (const char *[]){ "cpu_clk_atb_div" },
> +		.num_parents = 1,
> +		/*
> +		 * This clock is set by the ROM monitor code,
> +		 * Linux should not change it at runtime
> +		 */
> +	},
> +};
> +
> +static struct clk_regmap g12a_cpu_clk_axi_div = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HHI_SYS_CPU_CLK_CNTL1,
> +		.shift = 9,
> +		.width = 3,
> +		.flags = CLK_DIVIDER_POWER_OF_TWO,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cpu_clk_axi_div",
> +		.ops = &clk_regmap_divider_ro_ops,
> +		.parent_names = (const char *[]){ "cpu_clk" },
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap g12a_cpu_clk_axi = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = HHI_SYS_CPU_CLK_CNTL1,
> +		.bit_idx = 18,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "cpu_clk_axi",
> +		.ops = &clk_regmap_gate_ro_ops,
> +		.parent_names = (const char *[]){ "cpu_clk_axi_div" },
> +		.num_parents = 1,
> +		/*
> +		 * This clock is set by the ROM monitor code,
> +		 * Linux should not change it at runtime
> +		 */
> +	},
> +};
> +
> +static struct clk_regmap g12a_cpu_clk_trace_div = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HHI_SYS_CPU_CLK_CNTL1,
> +		.shift = 20,
> +		.width = 3,
> +		.flags = CLK_DIVIDER_POWER_OF_TWO,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cpu_clk_trace_div",
> +		.ops = &clk_regmap_divider_ro_ops,
> +		.parent_names = (const char *[]){ "cpu_clk" },
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap g12a_cpu_clk_trace = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = HHI_SYS_CPU_CLK_CNTL1,
> +		.bit_idx = 23,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "cpu_clk_trace",
> +		.ops = &clk_regmap_gate_ro_ops,
> +		.parent_names = (const char *[]){ "cpu_clk_trace_div" },
> +		.num_parents = 1,
> +		/*
> +		 * This clock is set by the ROM monitor code,
> +		 * Linux should not change it at runtime
> +		 */
> +	},
> +};
> +
>  static const struct pll_mult_range g12a_gp0_pll_mult_range = {
>  	.min = 55,
>  	.max = 255,
> @@ -2167,6 +2479,26 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
>  		[CLKID_MALI]			= &g12a_mali.hw,
>  		[CLKID_MPLL_5OM_DIV]		= &g12a_mpll_50m_div.hw,
>  		[CLKID_MPLL_5OM]		= &g12a_mpll_50m.hw,
> +		[CLKID_SYS_PLL_DIV16_EN]	= &g12a_sys_pll_div16_en.hw,
> +		[CLKID_SYS_PLL_DIV16]		= &g12a_sys_pll_div16.hw,
> +		[CLKID_CPU_CLK_DYN0_SEL]	= &g12a_cpu_clk_dyn0_sel.hw,
> +		[CLKID_CPU_CLK_DYN0_DIV]	= &g12a_cpu_clk_dyn0_div.hw,
> +		[CLKID_CPU_CLK_DYN0]		= &g12a_cpu_clk_dyn0.hw,
> +		[CLKID_CPU_CLK_DYN1_SEL]	= &g12a_cpu_clk_dyn1_sel.hw,
> +		[CLKID_CPU_CLK_DYN1_DIV]	= &g12a_cpu_clk_dyn1_div.hw,
> +		[CLKID_CPU_CLK_DYN1]		= &g12a_cpu_clk_dyn1.hw,
> +		[CLKID_CPU_CLK_DYN]		= &g12a_cpu_clk_dyn.hw,
> +		[CLKID_CPU_CLK]			= &g12a_cpu_clk.hw,
> +		[CLKID_CPU_CLK_DIV16_EN]	= &g12a_cpu_clk_div16_en.hw,
> +		[CLKID_CPU_CLK_DIV16]		= &g12a_cpu_clk_div16.hw,
> +		[CLKID_CPU_CLK_APB_DIV]		= &g12a_cpu_clk_apb_div.hw,
> +		[CLKID_CPU_CLK_APB]		= &g12a_cpu_clk_apb.hw,
> +		[CLKID_CPU_CLK_ATB_DIV]		= &g12a_cpu_clk_atb_div.hw,
> +		[CLKID_CPU_CLK_ATB]		= &g12a_cpu_clk_atb.hw,
> +		[CLKID_CPU_CLK_AXI_DIV]		= &g12a_cpu_clk_axi_div.hw,
> +		[CLKID_CPU_CLK_AXI]		= &g12a_cpu_clk_axi.hw,
> +		[CLKID_CPU_CLK_TRACE_DIV]	= &g12a_cpu_clk_trace_div.hw,
> +		[CLKID_CPU_CLK_TRACE]		= &g12a_cpu_clk_trace.hw,
>  		[NR_CLKS]			= NULL,
>  	},
>  	.num = NR_CLKS,
> @@ -2335,6 +2667,24 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
>  	&g12a_mali_1,
>  	&g12a_mali,
>  	&g12a_mpll_50m,
> +	&g12a_sys_pll_div16_en,
> +	&g12a_cpu_clk_dyn0_sel,
> +	&g12a_cpu_clk_dyn0_div,
> +	&g12a_cpu_clk_dyn0,
> +	&g12a_cpu_clk_dyn1_sel,
> +	&g12a_cpu_clk_dyn1_div,
> +	&g12a_cpu_clk_dyn1,
> +	&g12a_cpu_clk_dyn,
> +	&g12a_cpu_clk,
> +	&g12a_cpu_clk_div16_en,
> +	&g12a_cpu_clk_apb_div,
> +	&g12a_cpu_clk_apb,
> +	&g12a_cpu_clk_atb_div,
> +	&g12a_cpu_clk_atb,
> +	&g12a_cpu_clk_axi_div,
> +	&g12a_cpu_clk_axi,
> +	&g12a_cpu_clk_trace_div,
> +	&g12a_cpu_clk_trace,
>  };
>  
>  static const struct meson_eeclkc_data g12a_clkc_data = {
> diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
> index f399dfe1401c..70aa469ca1cf 100644
> --- a/drivers/clk/meson/g12a.h
> +++ b/drivers/clk/meson/g12a.h
> @@ -50,6 +50,7 @@
>  #define HHI_GCLK_MPEG2			0x148
>  #define HHI_GCLK_OTHER			0x150
>  #define HHI_GCLK_OTHER2			0x154
> +#define HHI_SYS_CPU_CLK_CNTL1		0x15c
>  #define HHI_VID_CLK_DIV			0x164
>  #define HHI_MPEG_CLK_CNTL		0x174
>  #define HHI_AUD_CLK_CNTL		0x178
> @@ -166,8 +167,27 @@
>  #define CLKID_MALI_0_DIV			170
>  #define CLKID_MALI_1_DIV			173
>  #define CLKID_MPLL_5OM_DIV			176
> +#define CLKID_SYS_PLL_DIV16_EN			178
> +#define CLKID_SYS_PLL_DIV16			179
> +#define CLKID_CPU_CLK_DYN0_SEL			180
> +#define CLKID_CPU_CLK_DYN0_DIV			181
> +#define CLKID_CPU_CLK_DYN0			182
> +#define CLKID_CPU_CLK_DYN1_SEL			183
> +#define CLKID_CPU_CLK_DYN1_DIV			184
> +#define CLKID_CPU_CLK_DYN1			185
> +#define CLKID_CPU_CLK_DYN			186
> +#define CLKID_CPU_CLK_DIV16_EN			188
> +#define CLKID_CPU_CLK_DIV16			189
> +#define CLKID_CPU_CLK_APB_DIV			190
> +#define CLKID_CPU_CLK_APB			191
> +#define CLKID_CPU_CLK_ATB_DIV			192
> +#define CLKID_CPU_CLK_ATB			193
> +#define CLKID_CPU_CLK_AXI_DIV			194
> +#define CLKID_CPU_CLK_AXI			195
> +#define CLKID_CPU_CLK_TRACE_DIV			196
> +#define CLKID_CPU_CLK_TRACE			197
>  
> -#define NR_CLKS					178
> +#define NR_CLKS					198
>  
>  /* include the CLKIDs that have been made part of the DT binding */
>  #include <dt-bindings/clock/g12a-clkc.h>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
