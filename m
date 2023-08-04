Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2863C001DB
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Aug 2023 07:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GnxAThF3utQvlbsSr/Jd6N0qyj+cbQ4FsGkpzx52Ghw=; b=baOr55uJNNBZ0R
	tv4oQRmfYmjcBYKjnM9ntLW2RrUrY1JLnjincsGRizHuDm4DyNjDW2ZVVYyGifw85hgU+j+sAL14S
	zJMEjoOHvvZTfTq/PntnN0zK1CiZQh4EmBR+jHBQfzehjVnxapq6/tMzMS2+6Lk6LF7rZatQgpEo1
	uxwF4vNY9luEZMtaJvhfTGcIfFgbMIodlUyORWBdEcKdKpbAUFzIMheIDOo7bqkuRBQrdK7Relkbi
	mPFNLE5nBltyqrs00kCLKo6V0crU7kc0Tps2iRQuxMaoyKSENzv6cvC/Z6KtQ2kvsy/vlpoCD83Ps
	NDpPfHRc2rcgQTRstabA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRpOc-00BoB1-02;
	Fri, 04 Aug 2023 07:38:50 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRpOX-00Bo9F-2w
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Aug 2023 07:38:48 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fe1d9a8ec6so17415485e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 04 Aug 2023 00:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691134722; x=1691739522;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=fjxFinBxb4fV1ij6n7gKBVvXzD01CF3vgozZrKOB0SE=;
        b=h+NLbZA0tsAFL0P0PKK1oTtDPfbOx8shpPl1Lou6ZSyZexm+zeAy3QF6iK4xeb0569
         VPBIBtHIcr/qYGN5r6213rM2j3Q+1TB7y31V0g/3w0fHUl3PSYI50VUMceaAyEwFCSKy
         req9TM2xckPClNduez1E3gwuczNHP6KN+2LdJ1UMD32c1qiQKPl4EmAlan+5E1fJoc7S
         2hEfBKhXCG76Cb06Z2U87bkjr2tAsg7Uf7bQe1wHf+czTaZH4dAHT8ibD1GikmqLW44c
         47kRBdUFl1UIXH3HdnILXuaiO9NQbd18H5s0iMlSongqwXwspCc5rIjomIyYG43EkuU/
         KSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691134722; x=1691739522;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjxFinBxb4fV1ij6n7gKBVvXzD01CF3vgozZrKOB0SE=;
        b=b5QApycU6zg2m9sAmwU04W8RE6xnohbzKrqtq/8wYkEvdtZ1Xt13QkShdB1dbpY/ib
         C+/2kRKFk76U5V53YHBRO7nELfmI6jQp5/5sfy0onyTeVWtynTgE3aQfYvgltgFtc8ey
         /p8XPM5nRgshCt9BbRJS7tZpkdGsQw77oWO5kmwjxOMbgOmnNTA3a0BfpAOoAXX53yGk
         kQISfi3y+WASQicfPRzbD3tlmo9cCvhaGEDHY3SR9QcKQdDQSC2PZFPhU5WJ3C+jJ7JX
         J6BDpAZWvMF5BiVRc8Fnby1k4cGU7gqoyAO+9JJ6rwP9jPJqEafZ2oTUpNVQIa7aqU09
         MunQ==
X-Gm-Message-State: AOJu0YzVnGEPz84TyKpswVmH9GiLHAHfaiUnYktjV6c6XqtxZ7IY8q0A
	r556gGvQgmrsVJ1gtTDox9by2A==
X-Google-Smtp-Source: AGHT+IEE6baaOoe7hjC7lnxd2eIQ1EQ45U+zSikR5aX0hM69lyOQFKivCFZIHwCSOuDrFWz8zQGvbg==
X-Received: by 2002:adf:ea43:0:b0:317:5efa:c46a with SMTP id j3-20020adfea43000000b003175efac46amr924802wrn.27.1691134721650;
        Fri, 04 Aug 2023 00:38:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:aeaf:609a:5eef:39a8])
        by smtp.gmail.com with ESMTPSA id t6-20020a5d6a46000000b003142e438e8csm1792101wrw.26.2023.08.04.00.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 00:38:41 -0700 (PDT)
References: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
 <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-3-762219fc5b28@linaro.org>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jagan Teki <jagan@amarulasolutions.com>,
 Nicolas Belin <nbelin@baylibre.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 3/9] clk: meson: add vclk driver
Date: Fri, 04 Aug 2023 09:33:36 +0200
In-reply-to: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-3-762219fc5b28@linaro.org>
Message-ID: <1j5y5vp88v.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_003846_171444_AEC22A59 
X-CRM114-Status: GOOD (  29.01  )
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


On Thu 03 Aug 2023 at 14:03, Neil Armstrong <neil.armstrong@linaro.org> wrote:

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

Unless there is reason, I'd prefer if this driver was using 'struct
parm', like the rest of amlogic custom clock drivers, for consistency.

>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/clk/meson/Kconfig  |   5 ++
>  drivers/clk/meson/Makefile |   1 +
>  drivers/clk/meson/vclk.c   | 146 +++++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/vclk.h   |  68 +++++++++++++++++++++
>  4 files changed, 220 insertions(+)
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 135da8f2d0b1..83f629515e96 100644
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
>  	select MFD_SYSCON
>  	help
>  	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2
> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
> index cd961cc4f4db..6efeb8c7bd2a 100644
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
> index 000000000000..0df84403b17f
> --- /dev/null
> +++ b/drivers/clk/meson/vclk.c
> @@ -0,0 +1,146 @@
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
> +static int clk_regmap_vclk_enable(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
> +
> +	regmap_set_bits(clk->map, vclk->offset, BIT(vclk->enable_bit_idx));
> +
> +	/* Do a reset pulse */
> +	regmap_set_bits(clk->map, vclk->offset, BIT(vclk->reset_bit_idx));
> +	regmap_clear_bits(clk->map, vclk->offset, BIT(vclk->reset_bit_idx));
> +
> +	return 0;
> +}
> +
> +static void clk_regmap_vclk_disable(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
> +
> +	regmap_clear_bits(clk->map, vclk->offset, BIT(vclk->enable_bit_idx));
> +}
> +
> +static int clk_regmap_vclk_is_enabled(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
> +	unsigned int val;
> +
> +	regmap_read(clk->map, vclk->offset, &val);
> +
> +	return val & BIT(vclk->enable_bit_idx) ? 1 : 0;
> +}
> +
> +const struct clk_ops clk_regmap_vclk_ops = {
> +	.enable = clk_regmap_vclk_enable,
> +	.disable = clk_regmap_vclk_disable,
> +	.is_enabled = clk_regmap_vclk_is_enabled,
> +};
> +EXPORT_SYMBOL_GPL(clk_regmap_vclk_ops);
> +
> +/* The VCLK Divider has supplementary reset & enable bits */
> +
> +static unsigned long clk_regmap_vclk_div_recalc_rate(struct clk_hw *hw,
> +						     unsigned long prate)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(clk->map, vclk->offset, &val);
> +	if (ret)
> +		/* Gives a hint that something is wrong */
> +		return 0;
> +
> +	val >>= vclk->shift;
> +	val &= clk_div_mask(vclk->width);
> +
> +	return divider_recalc_rate(hw, prate, val, vclk->table, vclk->flags,
> +				   vclk->width);
> +}
> +
> +static int clk_regmap_vclk_div_determine_rate(struct clk_hw *hw,
> +					      struct clk_rate_request *req)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
> +
> +	return divider_determine_rate(hw, req, vclk->table, vclk->width,
> +				      vclk->flags);
> +}
> +
> +static int clk_regmap_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +					unsigned long parent_rate)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
> +	unsigned int val;
> +	int ret;
> +
> +	ret = divider_get_val(rate, parent_rate, vclk->table, vclk->width,
> +			      vclk->flags);
> +	if (ret < 0)
> +		return ret;
> +
> +	val = (unsigned int)ret << vclk->shift;
> +	return regmap_update_bits(clk->map, vclk->offset,
> +				  clk_div_mask(vclk->width) << vclk->shift, val);
> +};
> +
> +static int clk_regmap_vclk_div_enable(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
> +
> +	/* Unreset the divider when ungating */
> +	regmap_clear_bits(clk->map, vclk->offset, BIT(vclk->reset_bit_idx));
> +
> +	return regmap_set_bits(clk->map, vclk->offset, BIT(vclk->enable_bit_idx));
> +}
> +
> +static void clk_regmap_vclk_div_disable(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
> +
> +	/* Reset the divider when gating */
> +	regmap_clear_bits(clk->map, vclk->offset, BIT(vclk->enable_bit_idx));
> +
> +	regmap_set_bits(clk->map, vclk->offset, BIT(vclk->reset_bit_idx));
> +}
> +
> +static int clk_regmap_vclk_div_is_enabled(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
> +	unsigned int val;
> +
> +	regmap_read(clk->map, vclk->offset, &val);
> +
> +	return val & BIT(vclk->enable_bit_idx) ? 1 : 0;
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
> index 000000000000..90786552a7f3
> --- /dev/null
> +++ b/drivers/clk/meson/vclk.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
> + */
> +
> +#ifndef __VCLK_H
> +#define __VCLK_H
> +
> +#include "clk-regmap.h"
> +
> +/**
> + * struct clk_regmap_vclk_data - vclk regmap backed specific data
> + *
> + * @offset:		offset of the register controlling gate
> + * @enable_bit_idx:	single bit controlling vclk enable
> + * @reset_bit_idx:	single bit controlling vclk reset
> + * @flags:		hardware-specific flags
> + *
> + * Flags:
> + * Same as clk_gate except CLK_GATE_HIWORD_MASK which is ignored
> + */
> +struct clk_regmap_vclk_data {
> +	unsigned int	offset;
> +	u8		enable_bit_idx;
> +	u8		reset_bit_idx;
> +	u8		flags;
> +};
> +
> +static inline struct clk_regmap_vclk_data *
> +clk_get_regmap_vclk_data(struct clk_regmap *clk)
> +{
> +	return (struct clk_regmap_vclk_data *)clk->data;
> +}
> +
> +extern const struct clk_ops clk_regmap_vclk_ops;
> +
> +/**
> + * struct clk_regmap_vclk_div_data - vclk_div regmap back specific data
> + *
> + * @offset:	offset of the register controlling the divider
> + * @shift:	shift to the divider bit field
> + * @width:	width of the divider bit field
> + * @enable_bit_idx:	single bit controlling vclk divider enable
> + * @reset_bit_idx:	single bit controlling vclk divider reset
> + * @table:	array of value/divider pairs, last entry should have div = 0
> + *
> + * Flags:
> + * Same as clk_divider except CLK_DIVIDER_HIWORD_MASK which is ignored
> + */
> +struct clk_regmap_vclk_div_data {
> +	unsigned int	offset;
> +	u8		shift;
> +	u8		width;
> +	u8		enable_bit_idx;
> +	u8		reset_bit_idx;
> +	const struct clk_div_table      *table;
> +	u8		flags;
> +};
> +
> +static inline struct clk_regmap_vclk_div_data *
> +clk_get_regmap_vclk_div_data(struct clk_regmap *clk)
> +{
> +	return (struct clk_regmap_vclk_div_data *)clk->data;
> +}
> +
> +extern const struct clk_ops clk_regmap_vclk_div_ops;
> +
> +#endif /* __VCLK_H */


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
