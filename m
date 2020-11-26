Return-Path: <SRS0=dEj7=FA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60730C63697
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2020 14:08:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 819B32087C
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2020 14:08:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WHxj0ECB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qSpjWd6O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 819B32087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sUA9dDaclYu/qXSwlXGIF9yAiSPBXX3kH4J8ZlS4RLQ=; b=WHxj0ECByD8mzZvFC2vz9Leln
	sM3XjjwPEQxjWrfLvnSq4Z/kHmG22Q9HTpRpTHZSHakHwDoMvDBU1yGukS/83GuD198kFs+J18vuo
	1dEaAHNVgdH50Fp7rJ8Bkz7X+okBUpFWEY/laBuIss76oFTyyUmcqFJHrwIXKHYcTIy4YwCBPHJ59
	ABK8TsJPljjLXZgO02KjE05/bLAqgyEnO25XENJYRTRmePdzj+5f3URazXQeD2XoOOeH9QsFH6NYX
	+P+YO6iNHosxpbst6la1ca8OEMvMwZ9AJZw3v0OVVYBA8eFUGYCaQ5eUkPoFpjugCrEEujTZCguA+
	ot4Gshdng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiHx4-0007te-Mi; Thu, 26 Nov 2020 14:08:50 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiHwz-0007rx-As
 for linux-amlogic@lists.infradead.org; Thu, 26 Nov 2020 14:08:46 +0000
Received: by mail-wr1-x443.google.com with SMTP id k14so2301428wrn.1
 for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2020 06:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ms9P/9ZKnLKjnkdKQYxlUUE6MT7zPdWaPNv5jPaGoG4=;
 b=qSpjWd6OpYkeGsGCjXKJgaLB7KeRMaNFOySuymYNhwVTesYIrZM/fSx+aXIztQwiuW
 dLpxZDZxaB8+DbwroUIe20utOhmUdkJVtPHKcSVcSknBqEm26Pwz33NR/EXUMXGrDbOV
 DohwMEa8qrGaRdXzp6UYs7dO3RhisxMZpXxRywEa0pXK3tWtI5jvyV3rMNQSbUcUiyK2
 Dwl2HTNkAISL4xzGjpcOz+2D9IwtZLnCSqb+88d409zH92KvhO75f8KsiHQKfxcsfMc8
 TN5bFgpMX605f7UucMmimZqEzlBvsxabRkwFiMfLSk6y4zmXtO0zM5eqKFwlg61XAffA
 yAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Ms9P/9ZKnLKjnkdKQYxlUUE6MT7zPdWaPNv5jPaGoG4=;
 b=g6hyWhchumRXJtcEMtwSPemBCwZyuKaKkoJb4GVHJg0F89ZUif3dD6RgQIzeUVDMop
 0ol9PzpXF7d8zCFMVi56tOw6y39snzAvVlblTuAVHbN/UD47h02c0hTFwibv0XG+zrlY
 rw95Ok0O/yMfQS/MWooYHPdvxcJWezRgfTXg9jlMr7tBbeLHZ/h03HsaA+aAdVoVM0Qg
 frkx0tLdeYtsOO+fbykg6hgYTn5S1cxRpZyAsdF/kpiPJurMngTP4+DZLCHnxdflxOMW
 VBkSHN6dqhz9gXs2nT96WEnIOZgkP/jCUAKA0LJZIBNttvMUhdx2bbYah3Fs8zRW4OFO
 /AxQ==
X-Gm-Message-State: AOAM530tJGc1FnWmTx238736IBFmFWX6oYTYWiFfMgkWlcBUPmlSFFfi
 gpA5NH/vD2eaW7bZTPQRWObWmw==
X-Google-Smtp-Source: ABdhPJx1vDuyttkLPwXL5ajrV4osa4VJuNgzabV9PhsGPka2KzdNYf0nghOIeYqEOWrHdshqQ8v8tQ==
X-Received: by 2002:adf:b74d:: with SMTP id n13mr4106424wre.101.1606399722310; 
 Thu, 26 Nov 2020 06:08:42 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:193b:ad82:52ad:936c?
 ([2a01:e35:2ec0:82b0:193b:ad82:52ad:936c])
 by smtp.gmail.com with ESMTPSA id 9sm8416131wmo.34.2020.11.26.06.08.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2020 06:08:40 -0800 (PST)
Subject: Re: [PATCH 2/2] clk: meson: g12a: add MIPI DSI Host Pixel Clock
To: Jerome Brunet <jbrunet@baylibre.com>
References: <20201123163811.353444-1-narmstrong@baylibre.com>
 <20201123163811.353444-3-narmstrong@baylibre.com>
 <1jlfep8hqu.fsf@starbuckisacylon.baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <ec838697-9f07-d0d8-6398-d9506bfba75f@baylibre.com>
Date: Thu, 26 Nov 2020 15:08:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1jlfep8hqu.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_090845_488031_CA1E3506 
X-CRM114-Status: GOOD (  23.38  )
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

On 25/11/2020 18:32, Jerome Brunet wrote:
> 
> On Mon 23 Nov 2020 at 17:38, Neil Armstrong <narmstrong@baylibre.com> wrote:
> 
>> This adds the MIPI DSI Host Pixel Clock, unlike AXG, the pixel clock can be different
>> from the VPU ENCL output clock to feed the DSI Host controller with a different clock rate.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> Series looks good.
> 2 minor comments below 
> 
>> ---
>>  drivers/clk/meson/g12a.c | 72 ++++++++++++++++++++++++++++++++++++++++
>>  drivers/clk/meson/g12a.h |  3 +-
>>  2 files changed, 74 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>> index 3cb8196c8e29..3dedf8408405 100644
>> --- a/drivers/clk/meson/g12a.c
>> +++ b/drivers/clk/meson/g12a.c
>> @@ -3658,6 +3658,66 @@ static struct clk_regmap g12a_hdmi_tx = {
>>  	},
>>  };
>>  
>> +/* MIPI DSI Host Clocks */
>> +
>> +static const struct clk_hw *g12a_mipi_dsi_pxclk_parent_hws[] = {
>> +	&g12a_vid_pll.hw,
>> +	&g12a_gp0_pll.hw,
>> +	&g12a_hifi_pll.hw,
>> +	&g12a_mpll1.hw,
>> +	&g12a_fclk_div2.hw,
>> +	&g12a_fclk_div2p5.hw,
>> +	&g12a_fclk_div3.hw,
>> +	&g12a_fclk_div7.hw,
>> +};
>> +
>> +static struct clk_regmap g12a_mipi_dsi_pxclk_sel = {
>> +	.data = &(struct clk_regmap_mux_data){
>> +		.offset = HHI_MIPIDSI_PHY_CLK_CNTL,
>> +		.mask = 0x7,
>> +		.shift = 12,
>> +		.flags = CLK_MUX_ROUND_CLOSEST,
>> +	},
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "mipi_dsi_pxclk_sel",
>> +		.ops = &clk_regmap_mux_ops,
>> +		.parent_hws = g12a_mipi_dsi_pxclk_parent_hws,
>> +		.num_parents = ARRAY_SIZE(g12a_mipi_dsi_pxclk_parent_hws),
>> +		.flags = CLK_SET_RATE_PARENT,
> 
> The id of the mux is exposed which seems to hint the mux will be
> manually controller but CLK_SET_RATE_NO_REPARENT is not set. Is this on
> purpose ?

You're right, it should be CLK_SET_RATE_NO_REPARENT here since we need to
control the source of the clock.

> 
>> +	},
>> +};
>> +
>> +static struct clk_regmap g12a_mipi_dsi_pxclk_div = {
>> +	.data = &(struct clk_regmap_div_data){
>> +		.offset = HHI_MIPIDSI_PHY_CLK_CNTL,
>> +		.shift = 0,
>> +		.width = 7,
>> +	},
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "mipi_dsi_pxclk_div",
>> +		.ops = &clk_regmap_divider_ops,
>> +		.parent_hws = (const struct clk_hw *[]) {
>> +					&g12a_mipi_dsi_pxclk_sel.hw },
> 
> Alignment here is weird compared to the reset of the file

ok

> 
>> +		.num_parents = 1,
>> +		.flags = CLK_SET_RATE_PARENT,
>> +	},
>> +};
>> +
>> +static struct clk_regmap g12a_mipi_dsi_pxclk = {
>> +	.data = &(struct clk_regmap_gate_data){
>> +		.offset = HHI_MIPIDSI_PHY_CLK_CNTL,
>> +		.bit_idx = 8,
>> +	},
>> +	.hw.init = &(struct clk_init_data) {
>> +		.name = "mipi_dsi_pxclk",
>> +		.ops = &clk_regmap_gate_ops,
>> +		.parent_hws = (const struct clk_hw *[]) {
>> +					&g12a_mipi_dsi_pxclk_div.hw },
>> +		.num_parents = 1,
>> +		.flags = CLK_SET_RATE_PARENT,
>> +	},
>> +};
>> +
>>  /* HDMI Clocks */
>>  
>>  static const struct clk_parent_data g12a_hdmi_parent_data[] = {
>> @@ -4403,6 +4463,9 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
>>  		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
>>  		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
>>  		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
>> +		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
>> +		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
>> +		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
>>  		[NR_CLKS]			= NULL,
>>  	},
>>  	.num = NR_CLKS,
>> @@ -4658,6 +4721,9 @@ static struct clk_hw_onecell_data g12b_hw_onecell_data = {
>>  		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
>>  		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
>>  		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
>> +		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
>> +		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
>> +		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
>>  		[NR_CLKS]			= NULL,
>>  	},
>>  	.num = NR_CLKS,
>> @@ -4904,6 +4970,9 @@ static struct clk_hw_onecell_data sm1_hw_onecell_data = {
>>  		[CLKID_NNA_CORE_CLK_SEL]	= &sm1_nna_core_clk_sel.hw,
>>  		[CLKID_NNA_CORE_CLK_DIV]	= &sm1_nna_core_clk_div.hw,
>>  		[CLKID_NNA_CORE_CLK]		= &sm1_nna_core_clk.hw,
>> +		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
>> +		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
>> +		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
>>  		[NR_CLKS]			= NULL,
>>  	},
>>  	.num = NR_CLKS,
>> @@ -5151,6 +5220,9 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
>>  	&sm1_nna_core_clk_sel,
>>  	&sm1_nna_core_clk_div,
>>  	&sm1_nna_core_clk,
>> +	&g12a_mipi_dsi_pxclk_sel,
>> +	&g12a_mipi_dsi_pxclk_div,
>> +	&g12a_mipi_dsi_pxclk,
>>  };
>>  
>>  static const struct reg_sequence g12a_init_regs[] = {
>> diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
>> index 69b6a69549c7..a97613df38b3 100644
>> --- a/drivers/clk/meson/g12a.h
>> +++ b/drivers/clk/meson/g12a.h
>> @@ -264,8 +264,9 @@
>>  #define CLKID_NNA_AXI_CLK_DIV			263
>>  #define CLKID_NNA_CORE_CLK_SEL			265
>>  #define CLKID_NNA_CORE_CLK_DIV			266
>> +#define CLKID_MIPI_DSI_PXCLK_DIV		268
>>  
>> -#define NR_CLKS					268
>> +#define NR_CLKS					271
>>  
>>  /* include the CLKIDs that have been made part of the DT binding */
>>  #include <dt-bindings/clock/g12a-clkc.h>
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
