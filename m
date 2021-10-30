Return-Path: <SRS0=r/fn=PS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97EC6C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Oct 2021 07:39:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E1C9603E8
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Oct 2021 07:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E1C9603E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=efie08TplO/tycNQWoICiyZkZbkBVpyFjMaDxW7Wrnw=; b=u8Pj7Mm25i3dvO
	wBeSLbs5XoTLtev31eicKm1YODf1kbtrQ8m3yg6X95cs1HYCijLxnAc3xfetut7tHtilw9pd17BHY
	+PBY4J0GGVQKb/taQGcRy2JOdLhcI8Kd1Rhodkg1huJvTgaK8k0QdI9tJw/sJ6HccVbkh55xqWIjN
	nJDsDwwGsQFqY65NkLnobFBmtulX2HsJHXbG3Ppj1MzOjroCWdeZJTnQayhwEbaDN4IlNKqralKbo
	lSxUrxOIfj8ieSLU5bGoPNlZiNFbnhzRVSw2wEyi+/eevSXnHOvt7GueIkUHN5wqsr7aW2cduYD6G
	NhFSGfEFV0xjvQiiqqdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgixk-00Cqvu-IN; Sat, 30 Oct 2021 07:39:36 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgixh-00CqvO-4T; Sat, 30 Oct 2021 07:39:34 +0000
Received: by mail-ed1-x530.google.com with SMTP id m17so45062418edc.12;
 Sat, 30 Oct 2021 00:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=WnDflYyo3vnsJsPrmBMpCvW7yx+6ot4PlCCkUYxmJpI=;
 b=Kzc+uy1+PCn3EvrvI8PrXqlgdfCwC7Tav4/plDfcCM+GWP9TvRR7q+b1cDjhYJzN3N
 6UA7flRe6Zt33mfuxPjmILgU/854GrFQNYRo3habjmJgiWnP4eP8VB3qYfFc5kyEfayI
 5r71lZF3XSHM5/sMUV8pgcjqRnE5OWJIVxQpDvTfXDV857mEOcuD6AaqIpVdSbeXjro4
 5c6/49gQK2NMAei2dLi83ua+I9Q+dlCu8bklkL4tCYriZ5UHtbrt1uPHxBl/5KDMFenI
 ZzFWRolG+ToY9UbrdaVJzCu5NuQpcMC3mubdlENTxhAzEgoZzku0/I997vxqt7U76Nf+
 Zfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=WnDflYyo3vnsJsPrmBMpCvW7yx+6ot4PlCCkUYxmJpI=;
 b=JkHJaJ2YRk5AT+5iB0WeCjQZcWl5ueot9+dFomSqBbj0bFU2VVfjhisgDUe9P+30Q7
 cqTpsrbyHvOLtNG0yLf1C1AzP+ZPCnfq+yhQ86M+YSGieGks+K5SFwmGr+y+pcQKgFCi
 XGTCnpl5jyEBFiNPg5tgBuLgbsmCZwtMaMZtzn/OKFgUQ7ZzA9alnXUpXb7vI/MLL6ws
 j69f8dkM/zYdWCdQEdVwIxmUVPcFZ9326x4OWxDU4/RnA5/cDl5Pae7wseu4EDgweyWS
 6rPd1jmF7VX6IUha14hL3fNcwHY0cyZzb4DN8xgNa1kJXzJ4gW8Uguuh0Dlbj6EXx3iO
 2WWw==
X-Gm-Message-State: AOAM532RFqfcJ2P+XrMCp+KAZmsgCUGyvYcAQKrPllx7DBhc+p9uLiBk
 Ej7/NFWezmBVw+6tT/R5V98=
X-Google-Smtp-Source: ABdhPJz7JfGatjQ7hHHqwrX7DDpASIlPz2talrTheUGX9T6ZDp9zPBd5ZSJIa/UhER9UwE3geNl1eQ==
X-Received: by 2002:a17:907:1c15:: with SMTP id
 nc21mr5512560ejc.510.1635579570680; 
 Sat, 30 Oct 2021 00:39:30 -0700 (PDT)
Received: from [172.16.20.20] ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id o22sm3925764ejy.50.2021.10.30.00.39.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 30 Oct 2021 00:39:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH v2] clk: meson: gxbb: Fix the SDM_EN bit for MPLL0 on GXBB
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20211027185326.1653827-1-martin.blumenstingl@googlemail.com>
Date: Sat, 30 Oct 2021 11:39:27 +0400
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <691BBB53-101E-464F-965A-3CD6EB63F27E@gmail.com>
References: <20211027185326.1653827-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211030_003933_225427_6A7C4A81 
X-CRM114-Status: GOOD (  32.19  )
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


> On 27 Oct 2021, at 10:53 pm, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
> 
> There are reports that 48kHz audio does not work on his WeTek Play 2

Typo to fixup when applying ^ s/his/the

> (which uses a GXBB SoC), while 44.1kHz audio works fine on the same
> board. There are also reports of 48kHz audio working fine on GXL and
> GXM SoCs, which are using an (almost) identical AIU (audio controller).
> 
> Experimenting has shown that MPLL0 is causing this problem. In the .dts
> we have by default:
> 	assigned-clocks = <&clkc CLKID_MPLL0>,
> 			  <&clkc CLKID_MPLL1>,
> 			  <&clkc CLKID_MPLL2>;
> 	assigned-clock-rates = <294912000>,
> 			       <270950400>,
> 			       <393216000>;
> The MPLL0 rate is divisible by 48kHz without remainder and the MPLL1
> rate is divisible by 44.1kHz without remainder. Swapping these two clock
> rates "fixes" 48kHz audio but breaks 44.1kHz audio.
> 
> Everything looks normal when looking at the info provided by the common
> clock framework while playing 48kHz audio (via I2S with mclk-fs = 256):
>        mpll_prediv                 1        1        0  2000000000
>           mpll0_div                1        1        0   294909641
>              mpll0                 1        1        0   294909641
>                 cts_amclk_sel       1        1        0   294909641
>                    cts_amclk_div       1        1        0    12287902
>                       cts_amclk       1        1        0    12287902
> 
> meson-clk-msr however shows that the actual MPLL0 clock is off by more
> than 38MHz:
>        mp0_out               333322917    +/-10416Hz
> 
> The rate seen by meson-clk-msr is very close to what we would get when
> SDM (the fractional part) was ignored:
>  (2000000000Hz * 16384) / ((16384 * 6) = 333.33MHz
> If SDM was considered the we should get close to:
>  (2000000000Hz * 16384) / ((16384 * 6) + 12808) = 294.9MHz
> 
> Further experimenting shows that HHI_MPLL_CNTL7[15] does not have any
> effect on the rate of MPLL0 as seen my meson-clk-msr (regardless of
> whether that bit is zero or one the rate is always the same according to
> meson-clk-msr). Using HHI_MPLL_CNTL[25] on the other hand as SDM_EN
> results in SDM being considered for the rate output by the hardware. The
> rate - as seen by meson-clk-msr - matches with what we expect when
> SDM_EN is enabled (fractional part is being considered, resulting in a
> 294.9MHz output) or disable (fractional part being ignored, resulting in
> a 333.33MHz output).
> 
> Reported-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Tested on WP2/Odroid C2 (fixed) and VIM1/LePotato (still good), thanks!

Tested-by: Christian Hewitt <christianshewitt@gmail.com>

> ---
> changes since v1 at [0]:
> - consider HHI_MPLL_CNTL[25] as SDM_EN bit after Jerome helped me
>  understand the purpose of SDM_EN and gave some explanation why this
>  can't be a spread spectrum bit
> 
> 
> [0] https://patchwork.kernel.org/project/linux-amlogic/patch/20211016145939.15643-1-martin.blumenstingl@googlemail.com/
> 
> 
> drivers/clk/meson/gxbb.c | 44 +++++++++++++++++++++++++++++++++++++---
> 1 file changed, 41 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index d6eed760327d..608e0e8ca49a 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -713,6 +713,35 @@ static struct clk_regmap gxbb_mpll_prediv = {
> };
> 
> static struct clk_regmap gxbb_mpll0_div = {
> +	.data = &(struct meson_clk_mpll_data){
> +		.sdm = {
> +			.reg_off = HHI_MPLL_CNTL7,
> +			.shift   = 0,
> +			.width   = 14,
> +		},
> +		.sdm_en = {
> +			.reg_off = HHI_MPLL_CNTL,
> +			.shift   = 25,
> +			.width	 = 1,
> +		},
> +		.n2 = {
> +			.reg_off = HHI_MPLL_CNTL7,
> +			.shift   = 16,
> +			.width   = 9,
> +		},
> +		.lock = &meson_clk_lock,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mpll0_div",
> +		.ops = &meson_clk_mpll_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&gxbb_mpll_prediv.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap gxl_mpll0_div = {
> 	.data = &(struct meson_clk_mpll_data){
> 		.sdm = {
> 			.reg_off = HHI_MPLL_CNTL7,
> @@ -749,7 +778,16 @@ static struct clk_regmap gxbb_mpll0 = {
> 	.hw.init = &(struct clk_init_data){
> 		.name = "mpll0",
> 		.ops = &clk_regmap_gate_ops,
> -		.parent_hws = (const struct clk_hw *[]) { &gxbb_mpll0_div.hw },
> +		.parent_data = &(const struct clk_parent_data) {
> +			/*
> +			 * Note:
> +			 * GXL and GXBB have different SDM_EN registers. We
> +			 * fallback to the global naming string mechanism so
> +			 * mpll0_div picks up the appropriate one.
> +			 */
> +			.name = "mpll0_div",
> +			.index = -1,
> +		},
> 		.num_parents = 1,
> 		.flags = CLK_SET_RATE_PARENT,
> 	},
> @@ -3044,7 +3082,7 @@ static struct clk_hw_onecell_data gxl_hw_onecell_data = {
> 		[CLKID_VAPB_1]		    = &gxbb_vapb_1.hw,
> 		[CLKID_VAPB_SEL]	    = &gxbb_vapb_sel.hw,
> 		[CLKID_VAPB]		    = &gxbb_vapb.hw,
> -		[CLKID_MPLL0_DIV]	    = &gxbb_mpll0_div.hw,
> +		[CLKID_MPLL0_DIV]	    = &gxl_mpll0_div.hw,
> 		[CLKID_MPLL1_DIV]	    = &gxbb_mpll1_div.hw,
> 		[CLKID_MPLL2_DIV]	    = &gxbb_mpll2_div.hw,
> 		[CLKID_MPLL_PREDIV]	    = &gxbb_mpll_prediv.hw,
> @@ -3439,7 +3477,7 @@ static struct clk_regmap *const gxl_clk_regmaps[] = {
> 	&gxbb_mpll0,
> 	&gxbb_mpll1,
> 	&gxbb_mpll2,
> -	&gxbb_mpll0_div,
> +	&gxl_mpll0_div,
> 	&gxbb_mpll1_div,
> 	&gxbb_mpll2_div,
> 	&gxbb_cts_amclk_div,
> -- 
> 2.33.1
> 
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
