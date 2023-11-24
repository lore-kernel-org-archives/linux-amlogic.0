Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CFBC61D97
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Nov 2023 14:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GHtPFlnMzovYdvNX+Bnum1yuelDaeZOPiBCUJTHHgk8=; b=H3tlShB61Pe4I8
	P/OAGjsHNITrHC5qzDVXxvhEpHNWeoHqW6P/0NaNk+f9FHzqoZy4Ucs7YzrBEKtKzLL0k07kBy7v8
	/8SGsvpvhCwPnaZSrwFluO41QA4we6vdzqev1AGxSNUhGyCIlGaTI5sneq6VjFkLrwx7z6ApgZt6m
	P4D45c8dilZWqLVsiLExrUdDCLMImjzkyqqvYuG60lzZzLgnJSJicjkqlyDMtCOVhQp4LUFbxyHHt
	raTG3FM3G8Z+m+gYPdowPofqAKr44Mw2XeuwNIl4VfL2lWnIn91Y2eGoOdROD1Wms3tW78PdHIlaK
	JbEo/yND3BgyhwgWUm0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XM9-007QuC-2J;
	Fri, 24 Nov 2023 14:40:33 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XM5-007Qrg-0Q
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Nov 2023 14:40:32 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40b36339549so12732755e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Nov 2023 06:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700836825; x=1701441625; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=NIiwAxdmzOkDiTxrhYUc4Y3MMadBDgLLDbQxBLZ1bpU=;
        b=xFsuMLOK4JIrzyAbTGLrw/TmrjIZBxMc6s2P9H1sDKk7gPWcMmJpuRuObQ7s99mQwO
         k2Cl25wFkQCy8NrWRnozprwBUFigNJuAYfzgU2uPhdxpcRwEPWScTuKXx7u6skJtATCj
         fTj9za0MeV9serCVZaL/cmky7acF/7qOHe/DVgrqTBG2sZ34pX2SRDMxD/vo9TvMKlJX
         44kO+yhjctSyD0kEZ5mdJNHoXOjDGcdUQEiMC2lFdynKyqweS4OrBjYcyVXqPKxmyaXx
         JyKJgw6+j9EtdFBUqJXcGT6JWvMXH0/yuhmtfY6WpPiEtrVqYjQ2jgDaSXoMHLALmSTw
         +8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700836825; x=1701441625;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIiwAxdmzOkDiTxrhYUc4Y3MMadBDgLLDbQxBLZ1bpU=;
        b=du3/iN7XVlUpk/AabtglM1syu2TT7UvYNJnj0zuRGRcXH8rKdbVWcRBI9YM01HBdyw
         ZmZEWc7/GRYh+xFiaZsysfoFooXQr3z+4CbEdl0qKAy0/1zVv5WTqo62GWv3zueThIcN
         ggzhWilggx85uCBNPtpcL7puFvVZN5K3p44/hWF5hlTBUniVXcilc442cTCEZrtBHZdh
         w2KVkMFZ18nBQ6DnqRcicqHzw/7tUeJaci+SVg8SstAZV11v92sSPFxeX37F2J6xoPgq
         sMpLKorQvpX+lDAp7IXtBT1I/SSaoYgfqISeun4qCkN6zr5Wx7heHMxma28Fg4puutq6
         L2gQ==
X-Gm-Message-State: AOJu0Yzvp8LFqeoqWaFkSD5mHpkvYUaBhFb3QxGzwXS2bGAExEFum1Fs
	azStivhM4rX17j+V7pA+zR9Xaw==
X-Google-Smtp-Source: AGHT+IHzzbRCPSKjkI9QlpIzhC8HlPiBgBVnia+Dbm7E/Rv/wiz9vBCUYYDhElu81nWxgMuUVurIgQ==
X-Received: by 2002:a5d:4b88:0:b0:32d:87c8:b548 with SMTP id b8-20020a5d4b88000000b0032d87c8b548mr2321540wrt.21.1700836825270;
        Fri, 24 Nov 2023 06:40:25 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:1243:6910:fe68:2de5])
        by smtp.gmail.com with ESMTPSA id dm16-20020a0560000bd000b0032d09f7a713sm4500582wrb.18.2023.11.24.06.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 06:40:24 -0800 (PST)
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
 <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-8-95256ed139e6@linaro.org>
User-agent: mu4e 1.10.7; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jagan Teki <jagan@amarulasolutions.com>,
 Nicolas Belin <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, Remi Pommarel <repk@triplefau.lt>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 08/12] clk: meson: g12a: make VCLK2 and ENCL clock
 path configurable by CCF
Date: Fri, 24 Nov 2023 15:12:53 +0100
In-reply-to: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-8-95256ed139e6@linaro.org>
Message-ID: <1jbkbjdxk8.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_064029_174241_D27EEEE0 
X-CRM114-Status: GOOD (  24.51  )
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


On Fri 24 Nov 2023 at 09:41, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> In order to setup the DSI clock, let's make the unused VCLK2 clock path
> configuration via CCF.
>
> The nocache option is removed from following clocks:
> - vclk2_sel
> - vclk2_input
> - vclk2_div
> - vclk2
> - vclk_div1
> - vclk2_div2_en
> - vclk2_div4_en
> - vclk2_div6_en
> - vclk2_div12_en
> - vclk2_div2
> - vclk2_div4
> - vclk2_div6
> - vclk2_div12
> - cts_encl_sel
>
> vclk2 and vclk2_div uses the newly introduced vclk regmap driver
> to handle the enable and reset bits.
>
> In order to set a rate on cts_encl via the vclk2 clock path,
> the NO_REPARENT flag is set on cts_encl_sel & vclk2_sel in order
> to keep CCF from selection a parent.
> The parents of cts_encl_sel & vclk2_sel are expected to be defined
> in DT.
>
> The following clock scheme is to be used for DSI:
>
> xtal
> \_ gp0_pll_dco
>    \_ gp0_pll
>       |- vclk2_sel
>       |  \_ vclk2_input
>       |     \_ vclk2_div
>       |        \_ vclk2
>       |           \_ vclk2_div1
>       |              \_ cts_encl_sel
>       |                 \_ cts_encl	-> to VPU LCD Encoder
>       |- mipi_dsi_pxclk_sel
>       \_ mipi_dsi_pxclk_div
>          \_ mipi_dsi_pxclk		-> to DSI controller
>
> The mipi_dsi_pxclk_div is set as RO in order to use the same GP0
> for mipi_dsi_pxclk and vclk2_input.

Could you explain a bit more this part of about the RO ops ?
Maybe I'm missing something.

You would be relying on the reset being always the way it. It is
probable but not safe.

A way to deal with the shared GP0 would be to:
* cut rate propagation at mipi_dsi_pxclk_sel (already done) and
  (vclk2_sel - TBD) ... 
* Set GP0 base rate through assigned-clock-rate (which you already in
  patch 11)

With this, I'm not sure anything needs to be RO for the rates to be set
properly for each subtree.

Also, with the subtree above and your example in patch 11, it looks odd that
PXCLK is manually set through DT while ENCL is not. Both are input of
dsi driver.

>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/clk/meson/g12a.c | 68 +++++++++++++++++++++++++++++++++---------------
>  1 file changed, 47 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index cadd824336ad..fb3d9196a1fd 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -22,6 +22,7 @@
>  #include "clk-regmap.h"
>  #include "clk-cpu-dyndiv.h"
>  #include "vid-pll-div.h"
> +#include "vclk.h"
>  #include "meson-eeclk.h"
>  #include "g12a.h"
>  
> @@ -3165,7 +3166,7 @@ static struct clk_regmap g12a_vclk2_sel = {
>  		.ops = &clk_regmap_mux_ops,
>  		.parent_hws = g12a_vclk_parent_hws,
>  		.num_parents = ARRAY_SIZE(g12a_vclk_parent_hws),
> -		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,

No sure CLK_SET_RATE_PARENT is wise here.
What you manually set in DT for the GP0, is likely to change because of
this, isn't it ?

>  	},
>  };
>  
> @@ -3193,7 +3194,7 @@ static struct clk_regmap g12a_vclk2_input = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2_sel.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
>  
> @@ -3215,19 +3216,32 @@ static struct clk_regmap g12a_vclk_div = {
>  };
>  
>  static struct clk_regmap g12a_vclk2_div = {
> -	.data = &(struct clk_regmap_div_data){
> -		.offset = HHI_VIID_CLK_DIV,
> -		.shift = 0,
> -		.width = 8,
> +	.data = &(struct clk_regmap_vclk_div_data){
> +		.div = {
> +			.reg_off = HHI_VIID_CLK_DIV,
> +			.shift   = 0,
> +			.width   = 8,
> +		},
> +		.enable = {
> +			.reg_off = HHI_VIID_CLK_DIV,
> +			.shift   = 16,
> +			.width   = 1,
> +		},
> +		.reset = {
> +			.reg_off = HHI_VIID_CLK_DIV,
> +			.shift   = 17,
> +			.width   = 1,
> +		},
> +		.flags = CLK_DIVIDER_ROUND_CLOSEST,
>  	},
>  	.hw.init = &(struct clk_init_data){
>  		.name = "vclk2_div",
> -		.ops = &clk_regmap_divider_ops,
> +		.ops = &clk_regmap_vclk_div_ops,
>  		.parent_hws = (const struct clk_hw *[]) {
>  			&g12a_vclk2_input.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_GET_RATE_NOCACHE,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -3246,16 +3260,24 @@ static struct clk_regmap g12a_vclk = {
>  };
>  
>  static struct clk_regmap g12a_vclk2 = {
> -	.data = &(struct clk_regmap_gate_data){
> -		.offset = HHI_VIID_CLK_CNTL,
> -		.bit_idx = 19,
> +	.data = &(struct clk_regmap_vclk_data){
> +		.enable = {
> +			.reg_off = HHI_VIID_CLK_CNTL,
> +			.shift   = 19,
> +			.width   = 1,
> +		},
> +		.reset = {
> +			.reg_off = HHI_VIID_CLK_CNTL,
> +			.shift   = 15,
> +			.width   = 1,
> +		},
>  	},
>  	.hw.init = &(struct clk_init_data) {
>  		.name = "vclk2",
> -		.ops = &clk_regmap_gate_ops,
> +		.ops = &clk_regmap_vclk_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2_div.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -3339,7 +3361,7 @@ static struct clk_regmap g12a_vclk2_div1 = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
>  
> @@ -3353,7 +3375,7 @@ static struct clk_regmap g12a_vclk2_div2_en = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
>  
> @@ -3367,7 +3389,7 @@ static struct clk_regmap g12a_vclk2_div4_en = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
>  
> @@ -3381,7 +3403,7 @@ static struct clk_regmap g12a_vclk2_div6_en = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
>  
> @@ -3395,7 +3417,7 @@ static struct clk_regmap g12a_vclk2_div12_en = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
>  
> @@ -3461,6 +3483,7 @@ static struct clk_fixed_factor g12a_vclk2_div2 = {
>  			&g12a_vclk2_div2_en.hw
>  		},
>  		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
>  
> @@ -3474,6 +3497,7 @@ static struct clk_fixed_factor g12a_vclk2_div4 = {
>  			&g12a_vclk2_div4_en.hw
>  		},
>  		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
>  
> @@ -3487,6 +3511,7 @@ static struct clk_fixed_factor g12a_vclk2_div6 = {
>  			&g12a_vclk2_div6_en.hw
>  		},
>  		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
>  
> @@ -3500,6 +3525,7 @@ static struct clk_fixed_factor g12a_vclk2_div12 = {
>  			&g12a_vclk2_div12_en.hw
>  		},
>  		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
>  
> @@ -3561,7 +3587,7 @@ static struct clk_regmap g12a_cts_encl_sel = {
>  		.ops = &clk_regmap_mux_ops,
>  		.parent_hws = g12a_cts_parent_hws,
>  		.num_parents = ARRAY_SIZE(g12a_cts_parent_hws),
> -		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
>  	},
>  };
>  
> @@ -3717,7 +3743,7 @@ static struct clk_regmap g12a_mipi_dsi_pxclk_sel = {
>  		.ops = &clk_regmap_mux_ops,
>  		.parent_hws = g12a_mipi_dsi_pxclk_parent_hws,
>  		.num_parents = ARRAY_SIZE(g12a_mipi_dsi_pxclk_parent_hws),
> -		.flags = CLK_SET_RATE_NO_REPARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
>  	},
>  };
>  
> @@ -3729,7 +3755,7 @@ static struct clk_regmap g12a_mipi_dsi_pxclk_div = {
>  	},
>  	.hw.init = &(struct clk_init_data){
>  		.name = "mipi_dsi_pxclk_div",
> -		.ops = &clk_regmap_divider_ops,
> +		.ops = &clk_regmap_divider_ro_ops,
>  		.parent_hws = (const struct clk_hw *[]) {
>  			&g12a_mipi_dsi_pxclk_sel.hw
>  		},


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
