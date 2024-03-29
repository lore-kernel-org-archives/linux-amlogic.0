Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57265C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2024 12:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpicMS3DwZ/wWtmQc+yoppMTrb6VnQXZwuuQ9dWdtsA=; b=CA06e0cjzz8ciu
	TT5ykrgW6dZnIE4YtHa6HUl6z8GYwJoe7ZvXthQXRRpua+4nthklQmbUjXXQ+xt+HeUybwFtn4JfJ
	Q5zrHpw5U32Ka44v7g49s95OkHL2VZC7sgehiga5tKuVReAbFi9vzOF9JmXRxe2Ns5LTNrkig78VJ
	uFQhIeTLGG52EWE7eD0+ml9+0RpdCvsUuJwWtJCWXFaYNJqI1iD6iMc69Qi9tpVoIimmNtqv8AxV/
	xtRz3zD7y+ZxGTYJyq6s4vtPXRqzHa/LSSsDj7hVFR62rqX1AL6uVlh8kTCAvLxaai9X6oYuBjVzE
	h91IYre99TQytfDHQWQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBSv-00000000Ohy-3WX3;
	Fri, 29 Mar 2024 12:36:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBRs-00000000OCh-3C3v
	for linux-amlogic@bombadil.infradead.org;
	Fri, 29 Mar 2024 12:35:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	In-reply-to:Date:Subject:Cc:To:From:References:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KC8w3+NJEoEp4iFjjEQ7VsL+cucprnwnTVjKhg4Pdoo=; b=DlYMw7UgUj7xZyl02H5YUDwz0+
	eMQxhwzWiriAWAHdMbNONH8qruV10+wQztDrUEA9DJkNL+xHX2euhZHu2XeBtf4XC2ZYYeKrs8bSD
	Gyd9PnRWCOWcV8Y5A+h5MhiFQMxIMVPv3yhYc0yC4aK6ysCS1Ox48ns4nUUSrFqJSzcnktzfTSQBr
	f6G+5nptktJQAvVgkAQX4ZyZf4B6aIxpnjd2oZJzlQwOz12GL27YA1uVSEvXYu6IiUfnsuBZ5+mos
	5TJbVqAV4mrO0QJROS0KRiMru2xqkbrz5hBL3IRlimqNGexgtQ7/4J5L3C0Yt/fXFOGqpYANW+Wnu
	8t7diyEA==;
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBRo-00000001YeC-25JK
	for linux-amlogic@lists.infradead.org;
	Fri, 29 Mar 2024 12:35:07 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2d6fd3cfaa6so27277531fa.2
        for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2024 05:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711715701; x=1712320501; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=KC8w3+NJEoEp4iFjjEQ7VsL+cucprnwnTVjKhg4Pdoo=;
        b=0KYjq8FJ7Hw5atf7c1T9sLSaMbwGZEAzfa93NM1XZXTVVrZ2531NP2D0QNd2a/RO/u
         8rgf4hzhHR5pAoMuZBt3TO5rOa6OOlC4f/J0P2vPkBXzrSTuc8sLbeliMkzkyKxdSDtQ
         QMk/hSOOz+Ge7AaTHA4RssFkajmVo0k2UytqilBR7DlViCoyaC9RUux3mqF5gyKWUG0x
         Hrgi8n3ud1A381R3T7UmFkJD02uViCaGXPs46cMDLFvS1k1YVuj3z3S1QvHdIc+bfbMC
         1/nTqh8smimO990b8qepZtTLyroJgkXjmyOgmrknYJHlXKizC1Msj4RaQIgSf6kYTMBk
         b4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711715701; x=1712320501;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KC8w3+NJEoEp4iFjjEQ7VsL+cucprnwnTVjKhg4Pdoo=;
        b=bUtWQZnSmpuwKCsc+c/peB09TCl7EYK51R3Nv+oZvkycRhbrKqTpNEfliU7AKEFZzu
         k/uWJevnDuCVeZbfoIGcHD9dsNoPDPvII31tSayXCaoGfQ8BC+sMJGyKYUrmsryTzII/
         dImw9ekjtfpYfFchY1IQJd/7JNEnmu7wV7WPIk9CVF53ARxNcuQg2+zWZLHC9qC3peLK
         IQocfcX3QFGhskr2qQxrP8UAeLoPG8tB06VAEPCzVm5AJfWTfqzOtJuslnrjINfB1oHf
         /LptTQFE1F91pQ8IVNBPod1G6DEMLVIg9q8AGlAaBWHM4ctuHp4NS70KQxjukAVJ6yfY
         v76A==
X-Forwarded-Encrypted: i=1; AJvYcCV8vB+LwCtWKUoPxQeL9MZrZZGeCaSWHiQ4YRt2+vJFB4USO1r1gsfqp5QKBQG5CU61N/6MWZUxY6FCS5iYTUJiYvjY6Vb2UnbK/Y9q9DEbEuk=
X-Gm-Message-State: AOJu0YyrM3lZK5G06sjv+y+pkOCm9jq/RHs2AZaSe9797Gr/OCk+rubm
	wE3WO4a8OSTy9SRG8we72P7HqBPWs9EC0jrdPQX+xJ9T4aiT9sqMk1DxdJn4hPn3Y41R2XCg9qM
	D9FM=
X-Google-Smtp-Source: AGHT+IEqnZmZnd/1sz5qvYox5md+LW+1OE5EJ48R6LS63eh6sEQiAaI25oj7fuUOQA3dlUi+U7wpjA==
X-Received: by 2002:a2e:7e12:0:b0:2d7:2ba:525 with SMTP id z18-20020a2e7e12000000b002d702ba0525mr1339873ljc.18.1711715701308;
        Fri, 29 Mar 2024 05:35:01 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:f8f5:63d4:de5b:e4de])
        by smtp.gmail.com with ESMTPSA id jb2-20020a05600c54e200b004155387c08esm525835wmb.27.2024.03.29.05.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 05:35:00 -0700 (PDT)
References: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
 <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-2-04f55de44604@linaro.org>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Nicolas Belin <nbelin@baylibre.com>,
 Jagan Teki <jagan@amarulasolutions.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v11 2/7] clk: meson: add vclk driver
Date: Fri, 29 Mar 2024 13:33:29 +0100
In-reply-to: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-2-04f55de44604@linaro.org>
Message-ID: <1jzfuh8bd7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_123504_893731_14EBFF57 
X-CRM114-Status: GOOD (  26.39  )
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


On Mon 25 Mar 2024 at 12:09, Neil Armstrong <neil.armstrong@linaro.org> wrote:

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

checkpatch reports a few easy CHECKs and one WARNING.
Could you please fix these ?

Other than that, It looks OK.

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
> index 000000000000..3ea813a0a995
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
> +						     unsigned long prate)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
> +
> +	return divider_recalc_rate(hw, prate, meson_parm_read(clk->map, &vclk->div),
> +				   vclk->table, vclk->flags, vclk->div.width);
> +}
> +
> +static int meson_vclk_div_determine_rate(struct clk_hw *hw,
> +					      struct clk_rate_request *req)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
> +
> +	return divider_determine_rate(hw, req, vclk->table, vclk->div.width,
> +				      vclk->flags);
> +}
> +
> +static int meson_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +					unsigned long parent_rate)
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
