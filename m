Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A44C004D4
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Jan 2023 11:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9UWjJFWe1A2cxN87PV45qtD7eJf6/lZZrB2dk/WZhhw=; b=OCae7NBTtW0WtR
	lQ6PSg2me7odyb2W0CWP4CbbuCYyBPj0b4v9g3v71t5nKBfDEyL67ObVcxET3XsGbNY+7Ziwqec4+
	uUIs7wkyEF85oKzq5r1IY8LIpyZDyZYkKzNc2pizSfG6QcLKCpRNdKLddeESueNdqqa3CCmqHegRX
	04PMawJJ2732m2cGHzoBbkHvkxMpG9hFCac2Olt4hDTtvWnbTC932KyqbyAcK72m8Ol3D4lKsOOEb
	HMYNgn3duGj3uYx0KoIa7xR7XOBjOTGgSHa7aXEtuk0tUl+/L6icqWrrEXEzrnFzyNlxSwQvlE2Sh
	Aew0Aj+xbY76bkcS2VxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIT99-004bJV-6G; Thu, 19 Jan 2023 11:31:55 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIT96-004bHC-0g
	for linux-amlogic@lists.infradead.org; Thu, 19 Jan 2023 11:31:54 +0000
Received: by mail-wm1-x32d.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so1027424wms.2
        for <linux-amlogic@lists.infradead.org>; Thu, 19 Jan 2023 03:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=8y8gxYsUcnAtqMlaYXb0rYXDx4AIIfXHx+EI4g6LIBE=;
        b=8L+sVM6mzom55nfPj24OcrHW9b+jXmKtqWVfrpg0my6d9IhYPJ8CF81ioXO9Y6ShEl
         sYiCLiJ1xqsJMBBX1F1b1Z5WMGCaLew+EdssnRL9fe9Jz44X38f5n4KeGk25goQDwotB
         j9yQP+trfu/QlJZt02ULpS5ykf+5UvDBcbBS9Y5QSatYpzzyt7oaOwSBSfmjEBRPAef1
         y0jVjSVcKg+gywd0fwJX2k4DhrZmTo3joV3S7ulVu8NAObTFSBorb/zsMVx7pvyK7dX2
         VKVrNca2sqTFL7LoXvKRwprhKpVbChx3Mb0fUKkCwqr1h3U5hevPI7tZG22HKitKvsqm
         XgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8y8gxYsUcnAtqMlaYXb0rYXDx4AIIfXHx+EI4g6LIBE=;
        b=tSWLIG7w5UtQmsJt5K6dkVz/lg47h4kAVdaV0HqMkbpM74LVBlV7glWlpUePK+Gn3n
         1DUBitLjtT1nsGr7Rss12FZn7Dirp4+DqgTOst4+y0Er/mqV96o24ZMdesbaUfcf6vjV
         9o44mNgXohjhlhXz098m5SMwPnjsmYkSrtg8H+voTAGMe/K1Bc2P9/nzpZVfDo1IPifq
         UbTxf6tX8DQutU2sAkFIb6fP261hl6qd5bC/n8ATfOg4ZjXp3ONpQ2QCdnGbt2xRM+jH
         7ZZMwrBoCuI3Rn38TO/jP/8qsqIJiOQ+U/vkuuHvV7JoD0Sq8wcVr2AOIe6nVZv6UVbT
         eXDA==
X-Gm-Message-State: AFqh2kqKEksZhfgWNeEHjV1Bm9EqQKD7Nh3UyByKnhqxomi917K7RfB4
	m+fzu1jMNxWzBzyxYKHfBYwPXQ==
X-Google-Smtp-Source: AMrXdXsWetgX83imAS+ETSHgMkanTq9tZSORTCmP1Hf79hKgFNFlP03wmr07wJXc++XyUDs3N5UyGA==
X-Received: by 2002:a7b:c5d6:0:b0:3d9:fb89:4e3d with SMTP id n22-20020a7bc5d6000000b003d9fb894e3dmr10406935wmk.28.1674127908326;
        Thu, 19 Jan 2023 03:31:48 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id h10-20020a05600c314a00b003db0659c454sm5757084wmo.32.2023.01.19.03.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 03:31:47 -0800 (PST)
References: <20230116074214.2326-1-yu.tu@amlogic.com>
 <20230116074214.2326-3-yu.tu@amlogic.com>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Neil  Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
  Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: "kelvin . zhang" <Kelvin.Zhang@amlogic.com>, "qi . duan"
 <qi.duan@amlogic.com>
Subject: Re: [PATCH V6 2/3] clk: meson: S4: add support for Amlogic S4 SoC
 PLL clock driver
Date: Thu, 19 Jan 2023 12:20:39 +0100
In-reply-to: <20230116074214.2326-3-yu.tu@amlogic.com>
Message-ID: <1jedrqyd3w.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_033152_097712_23E0BCBA 
X-CRM114-Status: GOOD (  16.94  )
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


On Mon 16 Jan 2023 at 15:42, Yu Tu <yu.tu@amlogic.com> wrote:

> Add the S4 PLL clock controller driver in the s4 SoC family.
>
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---

[...]

> +
> +static struct clk_regmap s4_fclk_div2 = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = ANACTRL_FIXPLL_CTRL1,
> +		.bit_idx = 24,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "fclk_div2",
> +		.ops = &clk_regmap_gate_ro_ops,

On the previous SoC, these fixed divider gate were not read-only.
They are marked as critical when necessary, with the appropriate
comment.

Why is it different on the s4 ?

> +		.parent_hws = (const struct clk_hw *[]) {
> +			&s4_fclk_div2_div.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +

[...]

> +#ifndef __MESON_S4_PLL_H__
> +#define __MESON_S4_PLL_H__
> +
> +/* ANA_CTRL - Registers
> + * REG_BASE:  REGISTER_BASE_ADDR = 0xfe008000

This multi-line comment style is wrong in clk/
REG_BASE is not used so I'm not sure this is useful

> + */
> +#define ANACTRL_FIXPLL_CTRL0                       0x040
> +#define ANACTRL_FIXPLL_CTRL1                       0x044
> +#define ANACTRL_FIXPLL_CTRL2                       0x048
> +#define ANACTRL_FIXPLL_CTRL3                       0x04c
> +#define ANACTRL_FIXPLL_CTRL4                       0x050
> +#define ANACTRL_FIXPLL_CTRL5                       0x054
> +#define ANACTRL_FIXPLL_CTRL6                       0x058
> +#define ANACTRL_FIXPLL_STS                         0x05c
> +#define ANACTRL_GP0PLL_CTRL0                       0x080
> +#define ANACTRL_GP0PLL_CTRL1                       0x084
> +#define ANACTRL_GP0PLL_CTRL2                       0x088
> +#define ANACTRL_GP0PLL_CTRL3                       0x08c
> +#define ANACTRL_GP0PLL_CTRL4                       0x090
> +#define ANACTRL_GP0PLL_CTRL5                       0x094
> +#define ANACTRL_GP0PLL_CTRL6                       0x098
> +#define ANACTRL_GP0PLL_STS                         0x09c
> +#define ANACTRL_HIFIPLL_CTRL0                      0x100
> +#define ANACTRL_HIFIPLL_CTRL1                      0x104
> +#define ANACTRL_HIFIPLL_CTRL2                      0x108
> +#define ANACTRL_HIFIPLL_CTRL3                      0x10c
> +#define ANACTRL_HIFIPLL_CTRL4                      0x110
> +#define ANACTRL_HIFIPLL_CTRL5                      0x114
> +#define ANACTRL_HIFIPLL_CTRL6                      0x118
> +#define ANACTRL_HIFIPLL_STS                        0x11c
> +#define ANACTRL_MPLL_CTRL0                         0x180
> +#define ANACTRL_MPLL_CTRL1                         0x184
> +#define ANACTRL_MPLL_CTRL2                         0x188
> +#define ANACTRL_MPLL_CTRL3                         0x18c
> +#define ANACTRL_MPLL_CTRL4                         0x190
> +#define ANACTRL_MPLL_CTRL5                         0x194
> +#define ANACTRL_MPLL_CTRL6                         0x198
> +#define ANACTRL_MPLL_CTRL7                         0x19c
> +#define ANACTRL_MPLL_CTRL8                         0x1a0
> +#define ANACTRL_MPLL_STS                           0x1a4
> +#define ANACTRL_HDMIPLL_CTRL0                      0x1c0
> +#define ANACTRL_HDMIPLL_CTRL1                      0x1c4
> +#define ANACTRL_HDMIPLL_CTRL2                      0x1c8
> +#define ANACTRL_HDMIPLL_CTRL3                      0x1cc
> +#define ANACTRL_HDMIPLL_CTRL4                      0x1d0
> +#define ANACTRL_HDMIPLL_CTRL5                      0x1d4
> +#define ANACTRL_HDMIPLL_CTRL6                      0x1d8
> +#define ANACTRL_HDMIPLL_STS                        0x1dc
> +#define ANACTRL_HDMIPLL_VLOCK                      0x1e4
> +
> +/*
> + * CLKID index values
> + *
> + * These indices are entirely contrived and do not map onto the hardware.
> + * It has now been decided to expose everything by default in the DT header:
> + * include/dt-bindings/clock/axg-clkc.h. Only the clocks ids we don't want
> + * to expose, such as the internal muxes and dividers of composite clocks,
> + * will remain defined here.
> + */
> +#define CLKID_FIXED_PLL_DCO		0
> +#define CLKID_FCLK_DIV2_DIV		2
> +#define CLKID_FCLK_DIV3_DIV		4
> +#define CLKID_FCLK_DIV4_DIV		6
> +#define CLKID_FCLK_DIV5_DIV		8
> +#define CLKID_FCLK_DIV7_DIV		10
> +#define CLKID_FCLK_DIV2P5_DIV		12
> +#define CLKID_GP0_PLL_DCO		14
> +#define CLKID_HIFI_PLL_DCO		16
> +#define CLKID_HDMI_PLL_DCO		18
> +#define CLKID_HDMI_PLL_OD		19
> +#define CLKID_MPLL_50M_DIV		21
> +#define CLKID_MPLL_PREDIV		23
> +#define CLKID_MPLL0_DIV			24
> +#define CLKID_MPLL1_DIV			26
> +#define CLKID_MPLL2_DIV			28
> +#define CLKID_MPLL3_DIV			30
> +
> +#define NR_PLL_CLKS			32
> +/* include the CLKIDs that have been made part of the DT binding */
> +#include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
> +
> +#endif /* __MESON_S4_PLL_H__ */


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
