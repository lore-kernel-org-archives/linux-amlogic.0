Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8314BCD1292
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2024 08:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m1hUDoV56LTirO0wyYpj3RmNCuUpfI0VO33x0C2TqVQ=; b=vp3Zhxbl8+8tf8
	Dt2pT9Q9Mk2+UWk/zlo6Yg9tLVULnlyV9akZAHDzEp/bXs1AEfp5xbg76URO5wWJGuR4I/RI/z124
	Lyacjnm/uJb/p0wiFug/sTK5+5g1OmLcmRkzRK7fLYWoQRKPTy9ATAXjC84IU3ZMXCQX6DKk2hvVf
	SUNAdkCnk4Kekmn7kFMPlCWFBTkq4WuqNkc9zDJ3zL02kiN1U6dCer/x+jHAJaomllW5DDIAYW87V
	4PwRpw/tTOw0MYrf7kUja0ZGioR7Xw9EMm8u4any1+ku51xErfd4chUuVj5Lvabisy65kROPyFtsm
	7Ya4UbGhNOnf6IgzUmQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsILy-00000001pC0-2Bfl;
	Thu, 04 Apr 2024 08:21:46 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsILu-00000001p9E-0USo
	for linux-amlogic@lists.infradead.org;
	Thu, 04 Apr 2024 08:21:44 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-51588f70d2dso900610e87.3
        for <linux-amlogic@lists.infradead.org>; Thu, 04 Apr 2024 01:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712218900; x=1712823700; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=CPwL4Hhi6eMHXODzuzMBAv39xZC80TOzZvNrDXAf1dg=;
        b=byMENRxtGwp7nWodUhyKGaURxf4ZiaOgW83WJDfbqCnx493yBBVfeD4b8iydZZo4YZ
         hETWn1YSj9sk2ScqtDfSsbf0RoBPdnd9NYpXOf/wpmE7y2BjMkziHqAeOq3vMMr+AbBZ
         gPCA+KmfE/s5bCzOgT08YQfPSmAFOm7iut3MvDrD54nbXnrBd2T/GPiibaGiPD9qe2fv
         bu4qXJ8GxCyq6ufuSuK6TluSOdUMHAB2h/OrAeNyv4pqx+QxeOLa/OfwOqiSdHZOxF7Y
         Sz8G14C2dkTP2BVxEVN4KYPgk54wrFesUNQWBujnb03Xs99xKzmi6uDKBTCDlDEPZn3N
         u0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712218900; x=1712823700;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPwL4Hhi6eMHXODzuzMBAv39xZC80TOzZvNrDXAf1dg=;
        b=kCazlkYSlFn81zX5mAWyUz2rdw45j3m6EoM2JBCRcqXJ5l5SO9mdBefKt9K7OzDXws
         e1wIQRy5b8rUNUYq773GN4EMKbFf8NwDitaaYJzjCq6eK9unf//6NHJKXmN/bT+5H6+5
         6IIiUTPQarJfthJ/FmiD1sL1gtMZXM73Bq1OVzCs3vUE3vMle1Kc8xOhlBW5nR4xkD5h
         KQOIU0/Snhvb1JUYbYq3F97TTugFXMvnQuaNVjhaQeQfFYEle2Tks7ap+IfjyR/fHLV0
         uU6JE5UaZlzbfcbUMQ5ZdL/AwCevCdeEbIVU3grFvqXUFpKGktv6wTjtqJ+iOT7i0F5R
         JdGA==
X-Forwarded-Encrypted: i=1; AJvYcCXkB1XkCgqxU9Ds40HSXim1kj/uHZ84Sw09GFveLu/FThv0nS288JgALV5ZiUrlGkLD40cYSv8bawr/eeFH7vn2EdpxloVnr970/jSyGw9bQno=
X-Gm-Message-State: AOJu0YxHdE2B1nEjkejV9paaJu3wpZJGFzK+rGnssfYai8fwtdMX84TO
	vfbRM8/zOYns13Uye3fI2ol6joyUcnhS7Ml5/BZQCr4r68grEyfqGJyiR5pcVuI=
X-Google-Smtp-Source: AGHT+IFUEwVuNlanR1q98I8Zl8lkNJ31ayYDfyh+WNpgcvSLagazbm4WrPf/D1u5iJDSqbZMTQL5rA==
X-Received: by 2002:a19:a416:0:b0:516:d0c2:755 with SMTP id q22-20020a19a416000000b00516d0c20755mr81615lfc.63.1712218899806;
        Thu, 04 Apr 2024 01:21:39 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b7ad:8118:73f1:92e5])
        by smtp.gmail.com with ESMTPSA id j16-20020a05600c1c1000b004156e3c0149sm1848043wms.0.2024.04.04.01.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 01:21:39 -0700 (PDT)
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
 <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-2-99ecdfdc87fc@linaro.org>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Jagan Teki
 <jagan@amarulasolutions.com>, Nicolas Belin <nbelin@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v12 2/7] clk: meson: add vclk driver
Date: Thu, 04 Apr 2024 10:13:19 +0200
In-reply-to: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-2-99ecdfdc87fc@linaro.org>
Message-ID: <1jmsq9pmgd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_012142_266364_C019ABD3 
X-CRM114-Status: GOOD (  26.50  )
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


On Wed 03 Apr 2024 at 09:46, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> The VCLK and VCLK_DIV clocks have supplementary bits.
>
> The VCLK gate has a "SOFT RESET" bit to toggle after the whole
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

The checkpatch warning is still there. Is it a choice or a mistake ?

Documentation says "GPL v2" exists for historic reason which seems to
hint "GPL" is preferred, and I suppose this is why checkpatch warns for
it.

>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/clk/meson/Kconfig  |   4 ++
>  drivers/clk/meson/Makefile |   1 +
>  drivers/clk/meson/vclk.c   | 141 +++++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/vclk.h   |  51 ++++++++++++++++
>  4 files changed, 197 insertions(+)
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 29ffd14d267b..8a9823789fa3 100644
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
> index 000000000000..45dc216941ea
> --- /dev/null
> +++ b/drivers/clk/meson/vclk.c
> @@ -0,0 +1,141 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2024 Neil Armstrong <neil.armstrong@linaro.org>
> + */
> +
> +#include <linux/module.h>
> +#include "vclk.h"
> +
> +/* The VCLK gate has a supplementary reset bit to pulse after ungating */
> +
> +static inline struct meson_vclk_gate_data *
> +clk_get_meson_vclk_gate_data(struct clk_regmap *clk)
> +{
> +	return (struct meson_vclk_gate_data *)clk->data;
> +}
> +
> +static int meson_vclk_gate_enable(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
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
> +static void meson_vclk_gate_disable(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
> +
> +	meson_parm_write(clk->map, &vclk->enable, 0);
> +}
> +
> +static int meson_vclk_gate_is_enabled(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
> +
> +	return meson_parm_read(clk->map, &vclk->enable);
> +}
> +
> +const struct clk_ops meson_vclk_gate_ops = {
> +	.enable = meson_vclk_gate_enable,
> +	.disable = meson_vclk_gate_disable,
> +	.is_enabled = meson_vclk_gate_is_enabled,
> +};
> +EXPORT_SYMBOL_GPL(meson_vclk_gate_ops);
> +
> +/* The VCLK Divider has supplementary reset & enable bits */
> +
> +static inline struct meson_vclk_div_data *
> +clk_get_meson_vclk_div_data(struct clk_regmap *clk)
> +{
> +	return (struct meson_vclk_div_data *)clk->data;
> +}
> +
> +static unsigned long meson_vclk_div_recalc_rate(struct clk_hw *hw,
> +						unsigned long prate)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
> +
> +	return divider_recalc_rate(hw, prate, meson_parm_read(clk->map, &vclk->div),
> +				   vclk->table, vclk->flags, vclk->div.width);
> +}
> +
> +static int meson_vclk_div_determine_rate(struct clk_hw *hw,
> +					 struct clk_rate_request *req)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
> +
> +	return divider_determine_rate(hw, req, vclk->table, vclk->div.width,
> +				      vclk->flags);
> +}
> +
> +static int meson_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +				   unsigned long parent_rate)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
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
> +static int meson_vclk_div_enable(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
> +
> +	/* Unreset the divider when ungating */
> +	meson_parm_write(clk->map, &vclk->reset, 0);
> +	meson_parm_write(clk->map, &vclk->enable, 1);
> +
> +	return 0;
> +}
> +
> +static void meson_vclk_div_disable(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
> +
> +	/* Reset the divider when gating */
> +	meson_parm_write(clk->map, &vclk->enable, 0);
> +	meson_parm_write(clk->map, &vclk->reset, 1);
> +}
> +
> +static int meson_vclk_div_is_enabled(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
> +
> +	return meson_parm_read(clk->map, &vclk->enable);
> +}
> +
> +const struct clk_ops meson_vclk_div_ops = {
> +	.recalc_rate = meson_vclk_div_recalc_rate,
> +	.determine_rate = meson_vclk_div_determine_rate,
> +	.set_rate = meson_vclk_div_set_rate,
> +	.enable = meson_vclk_div_enable,
> +	.disable = meson_vclk_div_disable,
> +	.is_enabled = meson_vclk_div_is_enabled,
> +};
> +EXPORT_SYMBOL_GPL(meson_vclk_div_ops);
> +
> +MODULE_DESCRIPTION("Amlogic vclk clock driver");
> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/clk/meson/vclk.h b/drivers/clk/meson/vclk.h
> new file mode 100644
> index 000000000000..20b0b181db09
> --- /dev/null
> +++ b/drivers/clk/meson/vclk.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2024 Neil Armstrong <neil.armstrong@linaro.org>
> + */
> +
> +#ifndef __VCLK_H
> +#define __VCLK_H
> +
> +#include "clk-regmap.h"
> +#include "parm.h"
> +
> +/**
> + * struct meson_vclk_gate_data - vclk_gate regmap backed specific data
> + *
> + * @enable:	vclk enable field
> + * @reset:	vclk reset field
> + * @flags:	hardware-specific flags
> + *
> + * Flags:
> + * Same as clk_gate except CLK_GATE_HIWORD_MASK which is ignored
> + */
> +struct meson_vclk_gate_data {
> +	struct parm enable;
> +	struct parm reset;
> +	u8 flags;
> +};
> +
> +extern const struct clk_ops meson_vclk_gate_ops;
> +
> +/**
> + * struct meson_vclk_div_data - vclk_div regmap back specific data
> + *
> + * @div:	divider field
> + * @enable:	vclk divider enable field
> + * @reset:	vclk divider reset field
> + * @table:	array of value/divider pairs, last entry should have div = 0
> + *
> + * Flags:
> + * Same as clk_divider except CLK_DIVIDER_HIWORD_MASK which is ignored
> + */
> +struct meson_vclk_div_data {
> +	struct parm div;
> +	struct parm enable;
> +	struct parm reset;
> +	const struct clk_div_table *table;
> +	u8 flags;
> +};
> +
> +extern const struct clk_ops meson_vclk_div_ops;
> +
> +#endif /* __VCLK_H */


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
