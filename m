Return-Path: <SRS0=nKCN=CT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A9EC433E2
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2020 10:16:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8741D20829
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2020 10:16:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M6YTDoTH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FN6J7VZP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8741D20829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Lyod7tUfoOX67UCGOqrCtB2pJ3PrNBac+WvXNR9mLrM=; b=M6YTDoTH2zs5cBGkXTCc4uv3r
	h9xP0quZXNv44UTSaW/y11g889xKbXPIH3y9gF6F06lyLQ3XodM8wxbVPaw9nO28kbLzgxmefDjfb
	DN8J7qYMPWnBEkjMJBXfWT0pNRXRxn5BSYalEQG61ytKYZxNY2s0Ft3bNpJO2enz0yJbDIC56NQxW
	rRaCM0OyRugv4LkoBC2kq4cKm/BPTKMGyg2PPwgZWazIxhL/0fdqqNHKDhooiqI5uS6aWYkAVbnib
	kX52B/yd1bD9aAS5QerI08cYQJWCrtteq9a9QHC0D/Me6hLzyyAVY1K5vIhaejMwyvUqQcosTLMIG
	FVJB3idVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGJcY-0000aQ-Lr; Thu, 10 Sep 2020 10:16:02 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGJcW-0000ZS-CC
 for linux-amlogic@lists.infradead.org; Thu, 10 Sep 2020 10:16:01 +0000
Received: by mail-ed1-x541.google.com with SMTP id i1so5747478edv.2
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Sep 2020 03:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=zkwyqV72nYwWA5qlqge5HoFYS2okYOL1NjxqW6/mtcU=;
 b=FN6J7VZPxc8Z7St7J3X3gJ0rRRZo9/Y9WOwr9pPqMClujr7J1zsQ0cqLmUONyhp/74
 KwlFnjeH7kP0DmloyOI99P+oPdevKJVzRRWxZ7KczhnIcUN/XOtgU9LStxF5d8X/06cA
 dLWZ2uAHZjgAjfKPT5c22lIvYAfBKeb27KP1wYO4g/VfTte15A2HlbwfjNOpN5lTP1au
 0/USmfJ9D27SQ+LtUN9cZc4IFiVhu6LSJAtFH5bIxbdx3MSo+GPx54Um6WPJoEj7ERhT
 WSNm/5kzVazfk2seS5NOiR/sK8zIa8EiYzXde2CJZBAIWh1/zHVVGsBCvv4YtewISrPm
 q/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=zkwyqV72nYwWA5qlqge5HoFYS2okYOL1NjxqW6/mtcU=;
 b=GmYtwIe3bql6A7rGNdCOJrlpxpQJfHwY8tmmQdYbgsyIyGsz4hWTDQ96BGJMA00DIl
 hPvARHBJeSy+Sk+v2iTqZT/1loWgGqF68ToxIQYZDLthop0AZ6kP/xcf7nrzykbJKG3k
 TKlidlFV4XFlI/KmLQ8btpO1JOKYMfLSTRqy+kkmSZCXXQDxhZVSg5banHYTyUJn3CdS
 1nEryHMUstsZmQJ6c0pYLLUhaDyd5qEZMuOpnZul55PNAh0nNOf6NmWt3yLOk3PnusTl
 AA60n1tymNaHjk82g3/qymiNkRpIl1+7NuhrIbfBSZZwqITs3mqXJWv55uX4BpILOjHK
 gpcg==
X-Gm-Message-State: AOAM531nUsg+Jfqz+b5ZOx/17+bSA451QmAZ27gvpulF/S0+/p1ROMTj
 6fgC7RdXQiAknQ+VS0badXrOYA==
X-Google-Smtp-Source: ABdhPJzumU+Ux5za/Pav8t+NenxZdYdqetAJ30ort4kgOcQXtM/idiX6Om16/teSDCXUuxE0wOPlaw==
X-Received: by 2002:a50:e70e:: with SMTP id a14mr8226265edn.93.1599732959326; 
 Thu, 10 Sep 2020 03:15:59 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id m10sm6675588edf.11.2020.09.10.03.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 03:15:58 -0700 (PDT)
References: <20200907093810.6585-1-narmstrong@baylibre.com>
 <20200907093810.6585-5-narmstrong@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 4/4] clk: meson: axg: add MIPI DSI Host clock
In-reply-to: <20200907093810.6585-5-narmstrong@baylibre.com>
Date: Thu, 10 Sep 2020 12:15:57 +0200
Message-ID: <1jwo129btu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_061600_425632_384C0F55 
X-CRM114-Status: GOOD (  18.19  )
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


On Mon 07 Sep 2020 at 11:38, Neil Armstrong <narmstrong@baylibre.com> wrote:

> This adds the MIPI DSI Host clock, used to measure the signal timings (ENC VSYNC or
> DW-MIPI-DSI eDPI timings).
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/meson/axg.c | 66 +++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/axg.h |  4 ++-
>  2 files changed, 69 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
> index 2550616c14b0..0094ca6388d8 100644
> --- a/drivers/clk/meson/axg.c
> +++ b/drivers/clk/meson/axg.c
> @@ -1724,6 +1724,66 @@ static struct clk_regmap axg_cts_encl = {
>  	},
>  };
>  
> +/* MIPI DSI Host Clock */
> +
> +static const struct clk_parent_data axg_vdin_meas_parent_data[] = {
> +	{ .fw_name = "xtal", },
> +	{ .hw = &axg_fclk_div4.hw },
> +	{ .hw = &axg_fclk_div3.hw },
> +	{ .hw = &axg_fclk_div5.hw },
> +	{ },
> +	{ },

As you've done in other patches, I'd prefer if you used an index table
instead of having empty entries.

> +	{ .hw = &axg_fclk_div2.hw },
> +	{ .hw = &axg_fclk_div7.hw },
> +};
> +
> +static struct clk_regmap axg_vdin_meas_sel = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = HHI_VDIN_MEAS_CLK_CNTL,
> +		.mask = 0x7,
> +		.shift = 21,
> +		.flags = CLK_MUX_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vdin_meas_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_data = axg_vdin_meas_parent_data,
> +		.num_parents = ARRAY_SIZE(axg_vdin_meas_parent_data),
> +		.flags = CLK_SET_RATE_NO_REPARENT,

A comment about why manual control is required would be nice.

> +	},
> +};
> +
> +static struct clk_regmap axg_vdin_meas_div = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HHI_VDIN_MEAS_CLK_CNTL,
> +		.shift = 12,
> +		.width = 7,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vdin_meas_div",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&axg_vdin_meas_sel.hw },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap axg_vdin_meas = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = HHI_VDIN_MEAS_CLK_CNTL,
> +		.bit_idx = 20,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "vdin_meas",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&axg_vdin_meas_div.hw },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
>  static u32 mux_table_gen_clk[]	= { 0, 4, 5, 6, 7, 8,
>  				    9, 10, 11, 13, 14, };
>  static const struct clk_parent_data gen_clk_parent_data[] = {
> @@ -1987,6 +2047,9 @@ static struct clk_hw_onecell_data axg_hw_onecell_data = {
>  		[CLKID_VCLK2_DIV12]		= &axg_vclk2_div12.hw,
>  		[CLKID_CTS_ENCL_SEL]		= &axg_cts_encl_sel.hw,
>  		[CLKID_CTS_ENCL]		= &axg_cts_encl.hw,
> +		[CLKID_VDIN_MEAS_SEL]		= &axg_vdin_meas_sel.hw,
> +		[CLKID_VDIN_MEAS_DIV]		= &axg_vdin_meas_div.hw,
> +		[CLKID_VDIN_MEAS]		= &axg_vdin_meas.hw,
>  		[NR_CLKS]			= NULL,
>  	},
>  	.num = NR_CLKS,
> @@ -2115,6 +2178,9 @@ static struct clk_regmap *const axg_clk_regmaps[] = {
>  	&axg_vclk2_div12_en,
>  	&axg_cts_encl_sel,
>  	&axg_cts_encl,
> +	&axg_vdin_meas_sel,
> +	&axg_vdin_meas_div,
> +	&axg_vdin_meas,
>  };
>  
>  static const struct meson_eeclkc_data axg_clkc_data = {
> diff --git a/drivers/clk/meson/axg.h b/drivers/clk/meson/axg.h
> index a8787b394a47..481b307ea3cb 100644
> --- a/drivers/clk/meson/axg.h
> +++ b/drivers/clk/meson/axg.h
> @@ -158,8 +158,10 @@
>  #define CLKID_VCLK2_DIV6_EN			120
>  #define CLKID_VCLK2_DIV12_EN			121
>  #define CLKID_CTS_ENCL_SEL			132
> +#define CLKID_VDIN_MEAS_SEL			134
> +#define CLKID_VDIN_MEAS_DIV			135
>  
> -#define NR_CLKS					134
> +#define NR_CLKS					137
>  
>  /* include the CLKIDs that have been made part of the DT binding */
>  #include <dt-bindings/clock/axg-clkc.h>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
