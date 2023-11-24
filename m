Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1C6C61DF4
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Nov 2023 14:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y2s93qTNKpk8Oc14iJcprBsz+HN68P+FzBJTVrR8KPA=; b=q/LByUbW1yzLaT
	jh3SGM5z+FfEw1l+Q0WtI7z47dnbnje6MYFZ+d1AHxrCUJWyMScsyLikK9DYL9fvJZ1PX5QZC+Eiy
	8GymHL3reKSRzwzt0c+5L7zR7IeukSFMHso4UVJMrX4+60PXxttN8q1JQhqmbyXBC+ArWtc/ZWPmT
	V6IA6dppdDU96wLKmHkRn7H/GFyLnk/g9CCf1yHDAC/deIxlX/yVpkX6+6JITQlFDNnWl0UJDYtuK
	hE+9uxBq+vkp7lLMWL0xzRBHHgpyN0P+l+e4oRy7ImF/XjRjYfAtXs2VbHIMYl0rm4XixS7kinZXa
	zwbFd5Aw/nB9Kq76Yiuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XX5-007Slq-1B;
	Fri, 24 Nov 2023 14:51:51 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XX1-007SkN-3D
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Nov 2023 14:51:50 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50a6ff9881fso2978882e87.1
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Nov 2023 06:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700837505; x=1701442305; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=YLH3RabXw2c69V6TB3Sm7NE+ZfpHa9RR2X+4P7QIY2A=;
        b=ki7Q82loLgsVN7OODAMvDT7NR1HUr8CNGv9iVOpHkY+W2zsl7keZ/LhTWh3/67zi1Z
         6YaOCqMW0zLaKm/bEpI1uIgbk07dGaQLKVxF9ygdk2NwiINKUdpUR3DmiF868thuqjbM
         +B4FsO+rjLyVTQkLckIufIv9BiTrA3Mp7iJkQgzjg722GTERt4zuKKT6gwlHiNEQ8bDc
         IuEnWiAo23xs1rA4h7v0zlle5fg/ra8U3b8OfuD4bxlf9ZqfMASU0959cfB+XDFq6FOJ
         cN1IXcsiGrFNq4zsK86lhYBhCwsQKcQv27zYHWUJCbLA5a3mvXKP2tanlPK+GKZ2Epnm
         NJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700837505; x=1701442305;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLH3RabXw2c69V6TB3Sm7NE+ZfpHa9RR2X+4P7QIY2A=;
        b=mJA/GuyV+2Ybdrgp3LHhTMJgHAOqy7pgbyBJK8pn6CTmyWhiZRgNOwSp6f9e1ZSuMI
         6jhzagnf0aHIn/kv9ngxKjTeIMeixDxPW3ark5UUTlgTPMRxALC0LAC0FFUZF3jGC2F1
         +N5CicsZCewaJY7Lekyz1Ax21EBftxtMs4ctv0e+PE5n+UbQxhno07YP6iN8dQ8g5nhJ
         UpvAurcJ0a+570+QpagBXlha4MTXlFEhtrOZT/NLlQ3a2gXt8FzTdA0EYpMC4hk3nNgK
         mq0St1pdCOFocl2ab1gVwFWEtH1RdGgZgmKltfIaL+GxjK9RUVPj+eP6L1LOUP7/Aa0/
         aADA==
X-Gm-Message-State: AOJu0YyXOwgdBOiRZNK1QnYkQq7QAvNraNQVTB97/cEOGJHsFE+Mq5/G
	AmWdlkeaEJ3uosmiucx5mboPkA==
X-Google-Smtp-Source: AGHT+IGzobmk4kXmgVRxM0ztfMfkVi2LmDBDF+KmM4imIGL1YRZKbMZP9UCqrrMDhFVbSXHkvt4CQQ==
X-Received: by 2002:a05:6512:70:b0:508:1470:6168 with SMTP id i16-20020a056512007000b0050814706168mr2071629lfo.57.1700837505349;
        Fri, 24 Nov 2023 06:51:45 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:1243:6910:fe68:2de5])
        by smtp.gmail.com with ESMTPSA id z11-20020a5d4d0b000000b00332cb23ccbdsm4421287wrt.81.2023.11.24.06.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 06:51:44 -0800 (PST)
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
 <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-7-95256ed139e6@linaro.org>
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
Subject: Re: [PATCH v9 07/12] clk: meson: add vclk driver
Date: Fri, 24 Nov 2023 15:41:07 +0100
In-reply-to: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-7-95256ed139e6@linaro.org>
Message-ID: <1j7cm7dx1b.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_065148_039362_88EA0422 
X-CRM114-Status: GOOD (  31.44  )
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

> The VCLK and VCLK_DIV clocks have supplementary bits.
>
> The VCLK has a "SOFT RESET" bit to toggle after the whole
> VCLK sub-tree rate has been set, this is implemented in
> the gate enable callback.
>
> The VCLK_DIV clocks as enable and reset bits used to disable
> and reset the divider, associated with CLK_SET_RATE_GATE it ensures
> the rate is set while the divider is disabled and in reset mode.
>
> The VCLK_DIV enable bit isn't implemented as a gate since it's part
> of the divider logic and vendor does this exact sequence to ensure
> the divider is correctly set.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/clk/meson/Kconfig  |   5 ++
>  drivers/clk/meson/Makefile |   1 +
>  drivers/clk/meson/vclk.c   | 141 +++++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/vclk.h   |  51 ++++++++++++++++
>  4 files changed, 198 insertions(+)
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 29ffd14d267b..59a40a49f8e1 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -30,6 +30,10 @@ config COMMON_CLK_MESON_VID_PLL_DIV
>  	tristate
>  	select COMMON_CLK_MESON_REGMAP
>  
> +config COMMON_CLK_MESON_VCLK
> +	tristate
> +	select COMMON_CLK_MESON_REGMAP
> +
>  config COMMON_CLK_MESON_CLKC_UTILS
>  	tristate
>  
> @@ -140,6 +144,7 @@ config COMMON_CLK_G12A
>  	select COMMON_CLK_MESON_EE_CLKC
>  	select COMMON_CLK_MESON_CPU_DYNDIV
>  	select COMMON_CLK_MESON_VID_PLL_DIV
> +	select COMMON_CLK_MESON_VCLK

This particular line belong in the next patch

>  	select MFD_SYSCON
>  	help
>  	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2
> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
> index 9ee4b954c896..9ba43fe7a07a 100644
> --- a/drivers/clk/meson/Makefile
> +++ b/drivers/clk/meson/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_COMMON_CLK_MESON_PLL) += clk-pll.o
>  obj-$(CONFIG_COMMON_CLK_MESON_REGMAP) += clk-regmap.o
>  obj-$(CONFIG_COMMON_CLK_MESON_SCLK_DIV) += sclk-div.o
>  obj-$(CONFIG_COMMON_CLK_MESON_VID_PLL_DIV) += vid-pll-div.o
> +obj-$(CONFIG_COMMON_CLK_MESON_VCLK) += vclk.o
>  
>  # Amlogic Clock controllers
>  
> diff --git a/drivers/clk/meson/vclk.c b/drivers/clk/meson/vclk.c
> new file mode 100644
> index 000000000000..47f08a52b49f
> --- /dev/null
> +++ b/drivers/clk/meson/vclk.c
> @@ -0,0 +1,141 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
> + */
> +
> +#include <linux/module.h>
> +#include "vclk.h"
> +
> +/* The VCLK gate has a supplementary reset bit to pulse after ungating */
> +
> +static inline struct clk_regmap_vclk_data *
> +clk_get_regmap_vclk_data(struct clk_regmap *clk)
> +{
> +	return (struct clk_regmap_vclk_data *)clk->data;
> +}
> +
> +static int clk_regmap_vclk_enable(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
> +
> +	meson_parm_write(clk->map, &vclk->enable, 1);
> +
> +	/* Do a reset pulse */
> +	meson_parm_write(clk->map, &vclk->reset, 1);
> +	meson_parm_write(clk->map, &vclk->reset, 0);
> +
> +	return 0;
> +}
> +
> +static void clk_regmap_vclk_disable(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
> +
> +	meson_parm_write(clk->map, &vclk->enable, 0);
> +}
> +
> +static int clk_regmap_vclk_is_enabled(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
> +
> +	return meson_parm_read(clk->map, &vclk->enable);
> +}
> +
> +const struct clk_ops clk_regmap_vclk_ops = {
> +	.enable = clk_regmap_vclk_enable,
> +	.disable = clk_regmap_vclk_disable,
> +	.is_enabled = clk_regmap_vclk_is_enabled,
> +};
> +EXPORT_SYMBOL_GPL(clk_regmap_vclk_ops);

s/clk_regmap_vclk/meson_vclk at least for what is exported, ideally most
all the code.

I get clk_regmap_ comes from code copied from clk_regmap.c.
The reason the this part is different (and not using parm) if that when
I converted amlogic to regmap, I hope we could make this generic,
possibly converging between aml and qcom (which was the only other
platform using regmap for clock at the time). This is why clk_regmap.c
is a bit different from the other driver.

For the aml specific drivers, best to look at the mpll or cpu-dyndiv one.

> +
> +/* The VCLK Divider has supplementary reset & enable bits */
> +
> +static inline struct clk_regmap_vclk_div_data *
> +clk_get_regmap_vclk_div_data(struct clk_regmap *clk)
> +{
> +	return (struct clk_regmap_vclk_div_data *)clk->data;
> +}
> +
> +static unsigned long clk_regmap_vclk_div_recalc_rate(struct clk_hw *hw,
> +						     unsigned long prate)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
> +
> +	return divider_recalc_rate(hw, prate, meson_parm_read(clk->map, &vclk->div),
> +				   vclk->table, vclk->flags, vclk->div.width);
> +}
> +
> +static int clk_regmap_vclk_div_determine_rate(struct clk_hw *hw,
> +					      struct clk_rate_request *req)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
> +
> +	return divider_determine_rate(hw, req, vclk->table, vclk->div.width,
> +				      vclk->flags);
> +}
> +
> +static int clk_regmap_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +					unsigned long parent_rate)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
> +	int ret;
> +
> +	ret = divider_get_val(rate, parent_rate, vclk->table, vclk->div.width,
> +			      vclk->flags);
> +	if (ret < 0)
> +		return ret;
> +
> +	meson_parm_write(clk->map, &vclk->div, ret);
> +
> +	return 0;
> +};
> +
> +static int clk_regmap_vclk_div_enable(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
> +
> +	/* Unreset the divider when ungating */
> +	meson_parm_write(clk->map, &vclk->reset, 0);
> +	meson_parm_write(clk->map, &vclk->enable, 1);
> +
> +	return 0;
> +}
> +
> +static void clk_regmap_vclk_div_disable(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
> +
> +	/* Reset the divider when gating */
> +	meson_parm_write(clk->map, &vclk->enable, 0);
> +	meson_parm_write(clk->map, &vclk->reset, 1);
> +}
> +
> +static int clk_regmap_vclk_div_is_enabled(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
> +
> +	return meson_parm_read(clk->map, &vclk->enable);
> +}
> +
> +const struct clk_ops clk_regmap_vclk_div_ops = {
> +	.recalc_rate = clk_regmap_vclk_div_recalc_rate,
> +	.determine_rate = clk_regmap_vclk_div_determine_rate,
> +	.set_rate = clk_regmap_vclk_div_set_rate,
> +	.enable = clk_regmap_vclk_div_enable,
> +	.disable = clk_regmap_vclk_div_disable,
> +	.is_enabled = clk_regmap_vclk_div_is_enabled,
> +};
> +EXPORT_SYMBOL_GPL(clk_regmap_vclk_div_ops);
> +
> +MODULE_DESCRIPTION("Amlogic vclk clock driver");
> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/clk/meson/vclk.h b/drivers/clk/meson/vclk.h
> new file mode 100644
> index 000000000000..4f25d7ad2717
> --- /dev/null
> +++ b/drivers/clk/meson/vclk.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
> + */
> +
> +#ifndef __VCLK_H
> +#define __VCLK_H

This is too generic.
Please add the MESON prefix like the other clock driver please.

> +
> +#include "clk-regmap.h"
> +#include "parm.h"
> +
> +/**
> + * struct clk_regmap_vclk_data - vclk regmap backed specific data
> + *
> + * @enable:	vclk enable field
> + * @reset:	vclk reset field
> + * @flags:	hardware-specific flags
> + *
> + * Flags:
> + * Same as clk_gate except CLK_GATE_HIWORD_MASK which is ignored
> + */
> +struct clk_regmap_vclk_data {
> +	struct parm enable;
> +	struct parm reset;
> +	u8 flags;
> +};
> +
> +extern const struct clk_ops clk_regmap_vclk_ops;
> +
> +/**
> + * struct clk_regmap_vclk_div_data - vclk_div regmap back specific data
> + *
> + * @div:	divider field
> + * @enable:	vclk divider enable field
> + * @reset:	vclk divider reset field
> + * @table:	array of value/divider pairs, last entry should have div = 0
> + *
> + * Flags:
> + * Same as clk_divider except CLK_DIVIDER_HIWORD_MASK which is ignored
> + */
> +struct clk_regmap_vclk_div_data {
> +	struct parm div;
> +	struct parm enable;
> +	struct parm reset;
> +	const struct clk_div_table *table;
> +	u8 flags;
> +};
> +
> +extern const struct clk_ops clk_regmap_vclk_div_ops;
> +
> +#endif /* __VCLK_H */


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
