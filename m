Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AFAC27C55
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2024 10:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oJ0iLsp2mCqSz6187UuJqErHZfYShLMaiWwR2AUcHfc=; b=zAScaAN6Il4bRL
	kNfPG8q5+KkIUS5KSljAKRa0zUiwCaX3+VMA9m1E5BOeXErB/SXNgaTIwEusyZHF5Fbrx2URsPVtF
	rvOtVdHQieFwrGORag1Rpex3JTsduRsK0+uu6p3iCLvYFGbTxORxOO6vja+5K9saJxJR5/sLpbbI4
	a2OVntElyqQK61aS5oaOJEHJnj/2Vq0Piz7Va29JmAawIvAEi0Be80zBM3QPfY5A5+sTqm0/5irmX
	wk4Ma1J+IepRFxI1hRfyTsCcr3d/Otq6cGpnk7Dwis+ARLXA+9vP6ZnAKJdzQhqlyEx+vd2DHj/bJ
	AryfqVbS+9RLZctBJdlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGbs2-00000004YZX-0WfZ;
	Mon, 10 Jun 2024 10:03:22 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGbro-00000004YPB-064f
	for linux-amlogic@lists.infradead.org;
	Mon, 10 Jun 2024 10:03:16 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2e724bc466fso51962311fa.3
        for <linux-amlogic@lists.infradead.org>; Mon, 10 Jun 2024 03:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718013784; x=1718618584; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=b2i7+OYCl1YQYAYWvDNNXE/dtiCXGJ18nePxaYtt3mU=;
        b=ABOFiDVR6QMj0Ij9cHzuEPrVGmpidhEnFL17AP8gt+FuQLtULSPin8YfgA+vWuKqxZ
         Zg28sYUXhZeV08c1UH6iy0poM0AcyN7hTyRm3VmFVFPPR5lwbuc7gC5P8x8PF/VgyST8
         DG64KyBG25/zNkJMrgrbhL5oL9pFDwLpS3HrHqJJRa4hu2mpZtWIbc2X8Ifn5JntgDHr
         OZJLTC1qnVsVmrHtIdbUurjftQIvBp+Tu843HluSe8ppWqsr7LhQvDd9kiqIbJ48SMbq
         6jSs8ayB/tigRugX8MbWb+fy3B/zuZ6jW3mT21QlCELffjs5GTjX0IUzzXANAaT1ipgH
         sTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718013784; x=1718618584;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b2i7+OYCl1YQYAYWvDNNXE/dtiCXGJ18nePxaYtt3mU=;
        b=bx2/fKgrwvHsYoTs60sy9Q6rKa6UeoXAdAqm0dWevuOwdw8ZPA95Bju1XwKoBipl2B
         VT8dKoDHrTigRYTbVYurVHl+LQONTyQRUKAI1UCLIEy0EkVhG0bR8ifWvN65oE/ViUzE
         5xm5Xz7n2nYPEl0m29h0EnAKh7Xhqvmhbe/qyA8Ru8agmItoCx+hCPuRiusZ4RGC1VLP
         Wtghp/0R8+1gjnoeUnCx3ncRhnlnXrVyUjDPuuEjrcMIfSRz0e9YvVGV6hY+2jj7PYOp
         H7IYLlNiPXYba28MQp7M9WRCNlSAEN8ikaGDlM9uAA2loM0YQ2c6pLW+CPE7qFMg1LrN
         BRwA==
X-Forwarded-Encrypted: i=1; AJvYcCUOZC4dimGaKVofmHCDeBnE/ShuF75ukswxNGk2PlDjdkfad52aC+p54/nlh3BStlpGTe3rvs0AdU3X85QnciYBO3+P03A4xFPt4maViK3P+/s=
X-Gm-Message-State: AOJu0YyCe9xaY44vXynHaGuBslvnCpaRIkLUcEDDUgKmI7LXUCh6tDBU
	7vke3TigpkNzqI2N48eKH5ez2N59w133gr/dCbTKPtYe/x4sB2E0/C1XOpEZ8Yw=
X-Google-Smtp-Source: AGHT+IHZ73Tpvv2Elpueal4JbazGDNuTQZMcJtVKElUURsboMYpgXqIw1Wja70T0IsIuzDJ+z0958A==
X-Received: by 2002:a2e:2202:0:b0:2eb:17fe:a14b with SMTP id 38308e7fff4ca-2eb17fea1b8mr52129051fa.3.1718013783395;
        Mon, 10 Jun 2024 03:03:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:afd3:66ee:5486:4249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4217f633f2asm63744345e9.28.2024.06.10.03.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 03:03:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: <neil.armstrong@linaro.org>,  <mturquette@baylibre.com>,
  <sboyd@kernel.org>,  <robh+dt@kernel.org>,
  <krzysztof.kozlowski+dt@linaro.org>,  <khilman@baylibre.com>,
  <martin.blumenstingl@googlemail.com>,  <jian.hu@amlogic.com>,
  <kernel@sberdevices.ru>,  <rockosov@gmail.com>,
  <linux-amlogic@lists.infradead.org>,  <linux-clk@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 3/7] clk: meson: a1: pll: support 'syspll'
 general-purpose PLL for CPU clock
In-Reply-To: <20240515185103.20256-4-ddrokosov@salutedevices.com> (Dmitry
	Rokosov's message of "Wed, 15 May 2024 21:47:26 +0300")
References: <20240515185103.20256-1-ddrokosov@salutedevices.com>
	<20240515185103.20256-4-ddrokosov@salutedevices.com>
Date: Mon, 10 Jun 2024 12:03:02 +0200
Message-ID: <1jzfrtp12h.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_030308_379231_A95FE6F7 
X-CRM114-Status: GOOD (  21.13  )
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

On Wed 15 May 2024 at 21:47, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:

> The 'syspll' PLL, also known as the system PLL, is a general and
> essential PLL responsible for generating the CPU clock frequency.
> With its wide-ranging capabilities, it is designed to accommodate
> frequencies within the range of 768MHz to 1536MHz.
>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>  drivers/clk/meson/a1-pll.c | 72 ++++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/a1-pll.h |  6 ++++
>  2 files changed, 78 insertions(+)
>
> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
> index 60b2e53e7e51..286e83199d17 100644
> --- a/drivers/clk/meson/a1-pll.c
> +++ b/drivers/clk/meson/a1-pll.c
> @@ -138,6 +138,76 @@ static struct clk_regmap hifi_pll = {
>  	},
>  };
>  
> +static const struct pll_mult_range sys_pll_mult_range = {
> +	.min = 32,
> +	.max = 64,
> +};
> +
> +static const struct reg_sequence sys_pll_init_regs[] = {
> +	{ .reg = ANACTRL_SYSPLL_CTRL1, .def = 0x01800000 },
> +	{ .reg = ANACTRL_SYSPLL_CTRL2, .def = 0x00001100 },
> +	{ .reg = ANACTRL_SYSPLL_CTRL3, .def = 0x10022300 },
> +	{ .reg = ANACTRL_SYSPLL_CTRL4, .def = 0x00300000 },
> +	{ .reg = ANACTRL_SYSPLL_CTRL0, .def = 0x01f18432 },

That last entry is clearly an hard coded rate being poked.
Drop it please

> +};
> +
> +static struct clk_regmap sys_pll = {
> +	.data = &(struct meson_clk_pll_data){
> +		.en = {
> +			.reg_off = ANACTRL_SYSPLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = ANACTRL_SYSPLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 8,
> +		},
> +		.n = {
> +			.reg_off = ANACTRL_SYSPLL_CTRL0,
> +			.shift   = 10,
> +			.width   = 5,
> +		},
> +		.frac = {
> +			.reg_off = ANACTRL_SYSPLL_CTRL1,
> +			.shift   = 0,
> +			.width   = 19,
> +		},
> +		.l = {
> +			.reg_off = ANACTRL_SYSPLL_STS,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.current_en = {
> +			.reg_off = ANACTRL_SYSPLL_CTRL0,
> +			.shift   = 26,
> +			.width   = 1,
> +		},
> +		.l_detect = {
> +			.reg_off = ANACTRL_SYSPLL_CTRL2,
> +			.shift   = 6,
> +			.width   = 1,
> +		},
> +		.range = &sys_pll_mult_range,
> +		.init_regs = sys_pll_init_regs,
> +		.init_count = ARRAY_SIZE(sys_pll_init_regs),
> +		/*
> +		 * The sys_pll clock is usually enabled and initialized in the
> +		 * bootloader stage. Additionally, the cpu_clk is connected to
> +		 * sys_pll. As a result, it is not allowed to initialize the
> +		 * cpu_clk again, as doing so would prevent the CPU from
> +		 * executing any instructions.
> +		 */
> +		.flags = CLK_MESON_PLL_NOINIT_ENABLED,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "sys_pll",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_names = (const char *[]){ "syspll_in" },
> +		.num_parents = 1,
> +	},
> +};
> +
>  static struct clk_fixed_factor fclk_div2_div = {
>  	.mult = 1,
>  	.div = 2,
> @@ -283,6 +353,7 @@ static struct clk_hw *a1_pll_hw_clks[] = {
>  	[CLKID_FCLK_DIV5]	= &fclk_div5.hw,
>  	[CLKID_FCLK_DIV7]	= &fclk_div7.hw,
>  	[CLKID_HIFI_PLL]	= &hifi_pll.hw,
> +	[CLKID_SYS_PLL]		= &sys_pll.hw,
>  };
>  
>  static struct clk_regmap *const a1_pll_regmaps[] = {
> @@ -293,6 +364,7 @@ static struct clk_regmap *const a1_pll_regmaps[] = {
>  	&fclk_div5,
>  	&fclk_div7,
>  	&hifi_pll,
> +	&sys_pll,
>  };
>  
>  static struct regmap_config a1_pll_regmap_cfg = {
> diff --git a/drivers/clk/meson/a1-pll.h b/drivers/clk/meson/a1-pll.h
> index 4be17b2bf383..666d9b2137e9 100644
> --- a/drivers/clk/meson/a1-pll.h
> +++ b/drivers/clk/meson/a1-pll.h
> @@ -18,6 +18,12 @@
>  #define ANACTRL_FIXPLL_CTRL0	0x0
>  #define ANACTRL_FIXPLL_CTRL1	0x4
>  #define ANACTRL_FIXPLL_STS	0x14
> +#define ANACTRL_SYSPLL_CTRL0	0x80
> +#define ANACTRL_SYSPLL_CTRL1	0x84
> +#define ANACTRL_SYSPLL_CTRL2	0x88
> +#define ANACTRL_SYSPLL_CTRL3	0x8c
> +#define ANACTRL_SYSPLL_CTRL4	0x90
> +#define ANACTRL_SYSPLL_STS	0x94
>  #define ANACTRL_HIFIPLL_CTRL0	0xc0
>  #define ANACTRL_HIFIPLL_CTRL1	0xc4
>  #define ANACTRL_HIFIPLL_CTRL2	0xc8

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
