Return-Path: <SRS0=PWIy=PE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3F9C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Oct 2021 17:19:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02CE461073
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Oct 2021 17:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02CE461073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJi10GySgxIunkkT4SU2R4KeB+ZtCqiMqwV7lZcTkwo=; b=jjn7OU9doTu2pi
	L9yQ6OYzvmX1wn5E8CG2giN5OFpYhiSDJ5BAd2qMPlB7W/Tt0B8ZcFpxMSjjLu7YowxNHdYstmxit
	cw/Px6S7HZu2a/gtgoASSXmQ7rV4AkMi14MgoR/0bYNSaIaHpvOnTmv44x3/I/Ay0AzgihNjJHKv3
	CuSiI/wnHuNM7CZdoFlLzobc+aP7N7YYiv5XOK9fKdcoG+zo7l/F3uqBrLsPNuKFNST0tV+ecqjee
	xVYrt4+p4fj4niX++ebIt8UMGzWUBQOpslT9l3ZNGyKNjOvkTf3j7MGaAlT9cvMC4ITgbGPQmx0Yu
	e1vbDmlG13kxFOlCST2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbnKk-00B1XK-KT; Sat, 16 Oct 2021 17:18:58 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbnKh-00B1Wr-8K; Sat, 16 Oct 2021 17:18:57 +0000
Received: by mail-ed1-x534.google.com with SMTP id d9so51244199edh.5;
 Sat, 16 Oct 2021 10:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=eDrZAVgr6gXztfY6YuCojIIzJX8BkmSmkXn/eMUrmak=;
 b=OBc44gbIyexm/ldgbuh4Qm7kyybFebIcCNPLtfZszfK+t6YH7gKp5jS2eNOZSJm4Fh
 qKBaSOu8S5V3JdecaBFvdVoqmuEvjncgi/RDaqw1auxwDPSK0qKfiFhjrvnp/AnjB3X2
 EAQjLDEORaqBGAoMDYgFEiBWP83P2UQ4FkehEEOC7lrQoWLz7bAtKd5quuSR3S0LyHcH
 FujAmmMaLy6kX+9EFXwcZf1KSWcqf8OwaqkwChg3rvUhsMB3OoJ9QuE/I9WhKrUvgHs4
 uTBtz6rDmu8l6ESnzcuqWRrQRJai8L9un3OIHBO6UeGI8DSoG6DQQf26fmVd031R5A5I
 6CaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=eDrZAVgr6gXztfY6YuCojIIzJX8BkmSmkXn/eMUrmak=;
 b=Krb4jzOMkanUpu+44OVL4gtvV6HwyODPehtwIVHzcDZTVaJj9CsCk1d7iw/5hUcnel
 DthFVtipq3r+58zcAyzWDGz6293Fvrlk0DgVM0wI8R4ChooESwClNNyGBlZp7FH5phrH
 y43a/NUexIgR6VWn6Owi6J7oKW20GR9Ek5edBS/UGD2sKsgjC6EIpawU1cR2qOAZ2l2y
 v6xipYYoj0cmE5TA+1GTfZ4Gt8370q4SrwWepMaShdGtJLZx3qjW2WL8y9OqtFioWrwG
 LbK36wqkcwJfiRY6k5g/NDLFsGjzL23b1f7iPPd5LmrVQKY57Ns5bJktGn2sm+HI7Kf2
 wEFw==
X-Gm-Message-State: AOAM531e5D0dk//F+PTHw4pa/N4+oG47KBJ7vj1M7L682C9FyXC3/VDU
 o0gaVQpt4KOkrmBnTEPn1/I=
X-Google-Smtp-Source: ABdhPJzgG/uUWDXa8uM9FOuCmMlIcs36QVxE3caz5llmugfKanOMr7zzlV9f9Le21vZCaDnD22NKng==
X-Received: by 2002:a05:6402:3186:: with SMTP id
 di6mr27724723edb.225.1634404732989; 
 Sat, 16 Oct 2021 10:18:52 -0700 (PDT)
Received: from [172.16.20.20] ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id c8sm7012426edt.55.2021.10.16.10.18.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 16 Oct 2021 10:18:52 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH] clk: meson: gxbb: Add the spread spectrum bit for MPLL0
 on GXBB
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20211016145939.15643-1-martin.blumenstingl@googlemail.com>
Date: Sat, 16 Oct 2021 21:18:49 +0400
Cc: linux-amlogic@lists.infradead.org, jbrunet@baylibre.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <BA5C537C-0595-4ABA-A71A-C5722F8E94A6@gmail.com>
References: <20211016145939.15643-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211016_101855_337690_920C3A27 
X-CRM114-Status: GOOD (  26.84  )
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


> On 16 Oct 2021, at 6:59 pm, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
> 
> Christian reports that 48kHz audio does not work on his WeTek Play 2
> (which uses a GXBB SoC), while 44.1kHz audio works fine on the same
> board. He also reports that 48kHz audio works on GXL and GXM SoCs,
> which are using an (almost) identical AIU (audio controller).
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
> The 3.14 vendor kernel uses the following code to enable SSEN only for
> MPLL0 (where con_reg2 is HHI_MPLL_CNTL and SSEN_shift is 25):
> 	if (strncmp(hw->clk->name, "mpll_clk_out0", 13) == 0) {
> 		val = readl(mpll->con_reg2);
> 		val |= 1 <<  mpll->SSEN_shift;
> 		writel(val, mpll->con_reg2);
> 	}
> 
> Add the SSEN (spread spectrum enable) bit and add the
> CLK_MESON_MPLL_SPREAD_SPECTRUM flag to enable this bit for MPLL0. Do
> this for GXBB *only* since GXL doesn't seem to care if this bit is set
> or not, meaning that meson-clk-msr always sees (approximately) the same
> frequency as common clock framework.
> 
> Fixes: 8925dbd03bb29b ("clk: meson: gxbb: no spread spectrum on mpll")
> Reported-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Tested with a selection of different media at 41KHz and 48KHz on GXBB
(WeTek Play2 and Hub) and GXL (LePotato).

Tested-by: Christian Hewitt <christianshewitt@gmail.com>

> ---
> drivers/clk/meson/gxbb.c | 50 +++++++++++++++++++++++++++++++++++++---
> 1 file changed, 47 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index d6eed760327d..673bc915c7d9 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -713,6 +713,41 @@ static struct clk_regmap gxbb_mpll_prediv = {
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
> +			.reg_off = HHI_MPLL_CNTL7,
> +			.shift   = 15,
> +			.width	 = 1,
> +		},
> +		.n2 = {
> +			.reg_off = HHI_MPLL_CNTL7,
> +			.shift   = 16,
> +			.width   = 9,
> +		},
> +		.ssen = {
> +			.reg_off = HHI_MPLL_CNTL,
> +			.shift   = 25,
> +			.width   = 1,
> +		},
> +		.flags = CLK_MESON_MPLL_SPREAD_SPECTRUM,
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
> @@ -749,7 +784,16 @@ static struct clk_regmap gxbb_mpll0 = {
> 	.hw.init = &(struct clk_init_data){
> 		.name = "mpll0",
> 		.ops = &clk_regmap_gate_ops,
> -		.parent_hws = (const struct clk_hw *[]) { &gxbb_mpll0_div.hw },
> +		.parent_data = &(const struct clk_parent_data) {
> +			/*
> +			 * Note:
> +			 * GXL and GXBB have different SSEN requirements. We
> +			 * fallback to the global naming string mechanism so
> +			 * mpll0_div picks up the appropriate one.
> +			 */
> +			.name = "mpll0_div",
> +			.index = -1,
> +		},
> 		.num_parents = 1,
> 		.flags = CLK_SET_RATE_PARENT,
> 	},
> @@ -3044,7 +3088,7 @@ static struct clk_hw_onecell_data gxl_hw_onecell_data = {
> 		[CLKID_VAPB_1]		    = &gxbb_vapb_1.hw,
> 		[CLKID_VAPB_SEL]	    = &gxbb_vapb_sel.hw,
> 		[CLKID_VAPB]		    = &gxbb_vapb.hw,
> -		[CLKID_MPLL0_DIV]	    = &gxbb_mpll0_div.hw,
> +		[CLKID_MPLL0_DIV]	    = &gxl_mpll0_div.hw,
> 		[CLKID_MPLL1_DIV]	    = &gxbb_mpll1_div.hw,
> 		[CLKID_MPLL2_DIV]	    = &gxbb_mpll2_div.hw,
> 		[CLKID_MPLL_PREDIV]	    = &gxbb_mpll_prediv.hw,
> @@ -3439,7 +3483,7 @@ static struct clk_regmap *const gxl_clk_regmaps[] = {
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


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
