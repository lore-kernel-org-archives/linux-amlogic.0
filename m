Return-Path: <SRS0=o/5p=RE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14619C43381
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Mar 2019 16:42:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4FA62084D
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Mar 2019 16:42:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YB9DV/a4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="i1drMWF4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4FA62084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VNNkf5uoqk5pDinf2/uMKF6ZYRvnQ7tN2vXJ2c7yc58=; b=YB9DV/a4/ZyukY
	/z9vTxMZPG2htH8YykxYC3Wt8mNX4ozdOAz+sw4tijSxQdMzeg0GOlpL6OS4wIeSksN79iX0epIir
	M46SRwyvUh5uafywxusbr7sRE6wu6pJr+5ahk1xSYgbJARrSUko5F3P2EoK1t5jzyQIJqdh1HlWjx
	kDz02lYmJnQkAX3sh6CVcZCzzDXqpkxyVfCDdPtbtCQ+OboVo6YMIFM2dR6KVzVjj+p6GISw6v3Il
	0aHqyrL79n63104YiTPPOt9/w0M2if0/j6a0NCHDbgFpcVT6Rbaqc0sJjto2JBxV1wfawiGArx3kz
	X1hNJ1gOMzIfiLxTn+Ag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzlEc-0002ow-U0; Fri, 01 Mar 2019 16:42:06 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzlEZ-0002oI-9R
 for linux-amlogic@lists.infradead.org; Fri, 01 Mar 2019 16:42:05 +0000
Received: by mail-wm1-x342.google.com with SMTP id y15so12889064wma.0
 for <linux-amlogic@lists.infradead.org>; Fri, 01 Mar 2019 08:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QWA54+N+XOlaNSbILt1/WRF1/1gjCAAgT4y6HcS5SxM=;
 b=i1drMWF4SAwxaCvpFDj7B4lLNeHG5oA1r1VMGHGzTPTChFaK53zsReyIjkjU9B2HjE
 +Fqoum2DeH7fQAcXjm0fRADz8OIsKayBcOwcfwu2cz/z7Kk1UJ1jv8D3NWiyaBrXnPu6
 lNZZYxzAlXcuNhftm0n6Pftj4Y9+DdIB2JueOeZ2RoIdq7lAsfmq4JooD58nkfFXMicc
 EOXY8slpLvNYkWkPmKUndryewhIQlYx9dRqaiPgQS97Wr/kAP93U+h8eU90gG0fjQfqO
 O8+O6Wulfb4ogFIiHgOl+vOORPgZq3a8PvtFYf2S+VCUTq4tT3RL8eBOFnqyqfaHrtZi
 zUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QWA54+N+XOlaNSbILt1/WRF1/1gjCAAgT4y6HcS5SxM=;
 b=Sl2i25KyiTZnS8wKyIwapAhvWF/aL9CiqbDZiarjyggL9rDJm9gdf/c44rCIuyUujN
 s4ZvUtMZyJpxTJqL9SLyKbuSW6DqkMGmJEEaL+cRv9JEBIoUX4XsI+ov0QiOjfKOfV9Y
 RcI2gvZd+YpEl43ZQjfbtLQnjJhHGMJrNMrmOaPtrePuPl7l29MaqVNGi7Zi02s/NySt
 gPr4+w9TS08PRyf1aB6AM4cKrY4y3OCm6F8R6DdKxRfHNr45Kon34uBhY1U93RKU0v3n
 sRvuDg0O4g1Y2sHKyAa2EsXq4ThHMEhGUtXgb2wBBIDwUtIoJp3dbGtYZAHJdy2HWoP7
 BRAA==
X-Gm-Message-State: APjAAAWy7lde9BuM1Zg9TWL9fCmSuKCCNIj12N+KUqu0z1VmY71cK8lR
 QY6TUl3epZzhbcJcnrRmEYT3nw==
X-Google-Smtp-Source: AHgI3IaFvnTYz6QS9CF20E0X3nhauiVy9jYWqqJ11NHLw2zB48zmye3Tdh5vQAnVsmFCtTVO4L70Ow==
X-Received: by 2002:a1c:c60b:: with SMTP id w11mr3761580wmf.39.1551458521195; 
 Fri, 01 Mar 2019 08:42:01 -0800 (PST)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x17sm41404438wrd.95.2019.03.01.08.42.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 Mar 2019 08:42:00 -0800 (PST)
Subject: Re: [PATCH 2/2] clk: meson: g12a: add cpu clocks
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20190301102140.7181-1-narmstrong@baylibre.com>
 <20190301102140.7181-3-narmstrong@baylibre.com>
 <CAFBinCC1b5Q8Y=5qXKJ+B1XBhpo8PGFYHwTEeVTgbXwz7ge3-A@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <a3654bdb-4289-7755-5601-e8177b00790f@baylibre.com>
Date: Fri, 1 Mar 2019 17:41:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCC1b5Q8Y=5qXKJ+B1XBhpo8PGFYHwTEeVTgbXwz7ge3-A@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_084203_395326_F72F0BFA 
X-CRM114-Status: GOOD (  28.08  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

On 01/03/2019 16:21, Martin Blumenstingl wrote:
> Hi Neil,
> 
> it's great to see the progress on G12A!
> 
> On Fri, Mar 1, 2019 at 11:22 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Add the Amlogic G12A Family CPU Clock tree in read/only for now.
>>
>> The CPU clock can either use the SYS_PLL for > 1GHz frequencies or
>> use a couple of div+mux from 1GHz/667MHz/24MHz source with 2 non-glitch
>> muxes.
>>
>> Proper DVFS support will come in a second time.
> can you please also mention that this adds various CPU clock
> post-dividers (APB, ATB, AXI and CPU trace)?
> I don't mind them being int his patchset

indeed, I forgot this !

> 
> disclaimer for my code-review:
> - I don't have access to the datasheet so I can't verify if the clock
> tree from this patch is correct
> - the latest buildroot code with G12A support
> (buildroot_openlinux_kernel_4.9_fbdev_20180706) doesn't have proper
> names for all clocks
> - based on my experience with Meson8* this looks good overall, some
> questions and comments below
> 
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>
>> ---
>>  drivers/clk/meson/g12a.c | 348 +++++++++++++++++++++++++++++++++++++++
>>  drivers/clk/meson/g12a.h |   1 +
>>  2 files changed, 349 insertions(+)
>>
>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>> index 0e1ce8c03259..4c938f1b8421 100644
>> --- a/drivers/clk/meson/g12a.c
>> +++ b/drivers/clk/meson/g12a.c
>> @@ -150,6 +150,316 @@ static struct clk_regmap g12a_sys_pll = {
>>         },
>>  };
>>
>> +static struct clk_regmap g12a_sys_pll_div16_en = {
>> +       .data = &(struct clk_regmap_gate_data){
>> +               .offset = HHI_SYS_CPU_CLK_CNTL1,
>> +               .bit_idx = 24,
>> +       },
>> +       .hw.init = &(struct clk_init_data) {
>> +               .name = "sys_pll_div16_en",
>> +               .ops = &clk_regmap_gate_ops,
>> +               .parent_names = (const char *[]){ "sys_pll" },
>> +               .num_parents = 1,
>> +               /*
>> +                * This clock is used to debug the sys_pll range
>> +                * Linux should not change it at runtime
>> +                */
> if we're not supposed to touch this the enable bit, can you switch to
> clk_regmap_gate_ro_ops ?

exact

> 
>> +               .flags = CLK_IGNORE_UNUSED,
>> +       },
>> +};
>> +
>> +static struct clk_fixed_factor g12a_sys_pll_div16 = {
>> +       .mult = 1,
>> +       .div = 16,
>> +       .hw.init = &(struct clk_init_data){
>> +               .name = "sys_pll_div16",
>> +               .ops = &clk_fixed_factor_ops,
>> +               .parent_names = (const char *[]){ "sys_pll_div16_en" },
>> +               .num_parents = 1,
>> +       },
>> +};
>> +
>> +static struct clk_regmap g12a_cpu_clk_dyn0_sel = {
>> +       .data = &(struct clk_regmap_mux_data){
>> +               .offset = HHI_SYS_CPU_CLK_CNTL0,
>> +               .mask = 0x3,
>> +               .shift = 0,
>> +       },
>> +       .hw.init = &(struct clk_init_data){
>> +               .name = "cpu_clk_dyn0_sel",
> the buildroot code has a variable with the name "p_premux"
> I'm not sure what the datasheet states, but maybe this should be
> cpu_clk_dyn0_pre_sel
> same applies to the corresponding dyn1 clock below

these bit are named "premux1", and cpu_clk_dyn0 names "postmux1",
which has no sense because there is no mux in between.

clk_dyn0_sel is the actual source selector of the dyn0 tree,
clkdyn0 is the top of the dyn0 tree, this is why i did not add "sel"
in it.

> 
>> +               .ops = &clk_regmap_mux_ro_ops,
>> +               .parent_names = (const char *[]){ IN_PREFIX "xtal",
>> +                                                 "fclk_div2",
>> +                                                 "fclk_div3" },
>> +               .num_parents = 3,
>> +       },
>> +};
>> +
>> +static struct clk_regmap g12a_cpu_clk_dyn0_div = {
>> +       .data = &(struct clk_regmap_div_data){
>> +               .offset = HHI_SYS_CPU_CLK_CNTL0,
>> +               .shift = 4,
>> +               .width = 6,
>> +       },
>> +       .hw.init = &(struct clk_init_data){
>> +               .name = "cpu_clk_dyn0_div",
>> +               .ops = &clk_regmap_divider_ro_ops,
>> +               .parent_names = (const char *[]){ "cpu_clk_dyn0_sel" },
>> +               .num_parents = 1,
>> +       },
>> +};
>> +
>> +static struct clk_regmap g12a_cpu_clk_dyn0 = {
>> +       .data = &(struct clk_regmap_mux_data){
>> +               .offset = HHI_SYS_CPU_CLK_CNTL0,
>> +               .mask = 0x1,
>> +               .shift = 2,
>> +       },
>> +       .hw.init = &(struct clk_init_data){
>> +               .name = "cpu_clk_dyn0",
> the buildroot code has a variable with the name "p_postmux". in this
> case I would leave the name "cpu_clk_dyn0" because it's the "output"
> of this specific "clock tree/branch".
> same applies to the corresponding dyn1 clock below
> 
>> +               .ops = &clk_regmap_mux_ro_ops,
>> +               .parent_names = (const char *[]){ "cpu_clk_dyn0_sel",
>> +                                                 "cpu_clk_dyn0_div" },
>> +               .num_parents = 2,
>> +       },
>> +};
>> +

[...]

>> +
>> +static struct clk_regmap g12a_cpu_clk_div16_en = {
>> +       .data = &(struct clk_regmap_gate_data){
>> +               .offset = HHI_SYS_CPU_CLK_CNTL1,
>> +               .bit_idx = 1,
>> +       },
>> +       .hw.init = &(struct clk_init_data) {
>> +               .name = "cpu_clk_div16_en",
>> +               .ops = &clk_regmap_gate_ops,
>> +               .parent_names = (const char *[]){ "cpu_clk" },
>> +               .num_parents = 1,
>> +               /*
>> +                * This clock is used to debug the cpu_clk range
>> +                * Linux should not change it at runtime
>> +                */
> same as above: if we're not supposed to touch this the enable bit, can
> you switch to clk_regmap_gate_ro_ops ?

Yep

> 
>> +               .flags = CLK_IGNORE_UNUSED,
>> +       },
>> +};
>> +
>> +static struct clk_fixed_factor g12a_cpu_clk_div16 = {
>> +       .mult = 1,
>> +       .div = 16,
>> +       .hw.init = &(struct clk_init_data){
>> +               .name = "cpu_clk_div16",
>> +               .ops = &clk_fixed_factor_ops,
>> +               .parent_names = (const char *[]){ "cpu_clk_div16_en" },
>> +               .num_parents = 1,
>> +       },
>> +};
>> +
>> +static struct clk_regmap g12a_cpu_clk_apb_div = {
>> +       .data = &(struct clk_regmap_div_data){
>> +               .offset = HHI_SYS_CPU_CLK_CNTL1,
>> +               .shift = 3,
>> +               .width = 3,
>> +               .flags = CLK_DIVIDER_POWER_OF_TWO,
>> +       },
>> +       .hw.init = &(struct clk_init_data){
>> +               .name = "cpu_clk_apb_div",
>> +               .ops = &clk_regmap_divider_ro_ops,
>> +               .parent_names = (const char *[]){ "cpu_clk" },
>> +               .num_parents = 1,
>> +       },
>> +};
>> +
>> +static struct clk_regmap g12a_cpu_clk_apb = {
>> +       .data = &(struct clk_regmap_gate_data){
>> +               .offset = HHI_SYS_CPU_CLK_CNTL1,
>> +               .bit_idx = 1,
>> +       },
>> +       .hw.init = &(struct clk_init_data) {
>> +               .name = "cpu_clk_apb",
>> +               .ops = &clk_regmap_gate_ops,
>> +               .parent_names = (const char *[]){ "cpu_clk_apb_div" },
>> +               .num_parents = 1,
>> +               /*
>> +                * This clock is set by the ROM monitor code,
>> +                * Linux should not change it at runtime
>> +                */
> same as above: if we're not supposed to touch this the enable bit, can
> you switch to clk_regmap_gate_ro_ops ?

Yep

> 
>> +               .flags = CLK_IGNORE_UNUSED,
>> +       },
>> +};
>> +
>> +static struct clk_regmap g12a_cpu_clk_atb_div = {
>> +       .data = &(struct clk_regmap_div_data){
>> +               .offset = HHI_SYS_CPU_CLK_CNTL1,
>> +               .shift = 6,
>> +               .width = 3,
>> +               .flags = CLK_DIVIDER_POWER_OF_TWO,
>> +       },
>> +       .hw.init = &(struct clk_init_data){
>> +               .name = "cpu_clk_atb_div",
>> +               .ops = &clk_regmap_divider_ro_ops,
>> +               .parent_names = (const char *[]){ "cpu_clk" },
>> +               .num_parents = 1,
>> +       },
>> +};
>> +
>> +static struct clk_regmap g12a_cpu_clk_atb = {
>> +       .data = &(struct clk_regmap_gate_data){
>> +               .offset = HHI_SYS_CPU_CLK_CNTL1,
>> +               .bit_idx = 17,
>> +       },
>> +       .hw.init = &(struct clk_init_data) {
>> +               .name = "cpu_clk_atb",
>> +               .ops = &clk_regmap_gate_ops,
>> +               .parent_names = (const char *[]){ "cpu_clk_atb_div" },
>> +               .num_parents = 1,
>> +               /*
>> +                * This clock is set by the ROM monitor code,
>> +                * Linux should not change it at runtime
>> +                */
> same as above: if we're not supposed to touch this the enable bit, can
> you switch to clk_regmap_gate_ro_ops ?

Yep

> 
>> +               .flags = CLK_IGNORE_UNUSED,
>> +       },
>> +};
>> +
>> +static struct clk_regmap g12a_cpu_clk_axi_div = {
>> +       .data = &(struct clk_regmap_div_data){
>> +               .offset = HHI_SYS_CPU_CLK_CNTL1,
>> +               .shift = 9,
>> +               .width = 3,
>> +               .flags = CLK_DIVIDER_POWER_OF_TWO,
>> +       },
>> +       .hw.init = &(struct clk_init_data){
>> +               .name = "cpu_clk_axi_div",
>> +               .ops = &clk_regmap_divider_ro_ops,
> out of curiosity (this applies to all CPU clock post-dividers):
> did you check whether CLK_DIVIDER_POWER_OF_TWO is correct on G12A?
> I'm asking because on Meson8b the post-dividers select between one of:
> "cpu_clk divided by 2, 3, 4, 5, 6, 7 or 8". also some of the
> post-dividers use register value 0 for cpu_clk_div2 while others use
> register value 1 for cpu_clk_div2.

It's correct !

> 
>> +               .parent_names = (const char *[]){ "cpu_clk" },
>> +               .num_parents = 1,
>> +       },
>> +};
>> +
>> +static struct clk_regmap g12a_cpu_clk_axi = {
>> +       .data = &(struct clk_regmap_gate_data){
>> +               .offset = HHI_SYS_CPU_CLK_CNTL1,
>> +               .bit_idx = 18,
>> +       },
>> +       .hw.init = &(struct clk_init_data) {
>> +               .name = "cpu_clk_axi",
>> +               .ops = &clk_regmap_gate_ops,
>> +               .parent_names = (const char *[]){ "cpu_clk_axi_div" },
>> +               .num_parents = 1,
>> +               /*
>> +                * This clock is set by the ROM monitor code,
>> +                * Linux should not change it at runtime
>> +                */
> same as above: if we're not supposed to touch this the enable bit, can
> you switch to clk_regmap_gate_ro_ops ?

Yep

> 
>> +               .flags = CLK_IGNORE_UNUSED,
>> +       },
>> +};
>> +
>> +static struct clk_regmap g12a_cpu_clk_trace_div = {
>> +       .data = &(struct clk_regmap_div_data){
>> +               .offset = HHI_SYS_CPU_CLK_CNTL1,
>> +               .shift = 20,
>> +               .width = 3,
>> +               .flags = CLK_DIVIDER_POWER_OF_TWO,
>> +       },
>> +       .hw.init = &(struct clk_init_data){
>> +               .name = "cpu_clk_trace_div",
>> +               .ops = &clk_regmap_divider_ro_ops,
>> +               .parent_names = (const char *[]){ "cpu_clk" },
>> +               .num_parents = 1,
>> +       },
>> +};
>> +
>> +static struct clk_regmap g12a_cpu_clk_trace = {
>> +       .data = &(struct clk_regmap_gate_data){
>> +               .offset = HHI_SYS_CPU_CLK_CNTL1,
>> +               .bit_idx = 23,
>> +       },
>> +       .hw.init = &(struct clk_init_data) {
>> +               .name = "cpu_clk_trace",
>> +               .ops = &clk_regmap_gate_ops,
>> +               .parent_names = (const char *[]){ "cpu_clk_trace_div" },
>> +               .num_parents = 1,
>> +               /*
>> +                * This clock is set by the ROM monitor code,
>> +                * Linux should not change it at runtime
>> +                */
> same as above: if we're not supposed to touch this the enable bit, can
> you switch to clk_regmap_gate_ro_ops ?

Yep

> 
>> +               .flags = CLK_IGNORE_UNUSED,
>> +       },
>> +};
>> +
>>  static const struct pll_mult_range g12a_gp0_pll_mult_range = {
>>         .min = 55,
>>         .max = 255,

Thanks !

Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
