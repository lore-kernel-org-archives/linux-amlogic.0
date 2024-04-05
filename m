Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E86CD11C2
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Apr 2024 08:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xqItyZfJomVn2aGsdVWiOUgwcfwFG/2AdR+uQ7CuwLo=; b=KIn+XJsT9HIck7
	lOWKGmT+gnJS8Q+7498vx39oyMv+KpH3nhP20wFXb2tyaiD65jQUqrET5lbJPASScCTvs5TnWij/x
	Zcybo40pU0ZP+z1hBCWhgHSyrD8Ta71QF73Fo+fucpq/GjaH6GAdJX5fpDJR3LX6zMmja9nt4Lj6J
	iqo7fvwUJgoYfZoEaA0Otx287L3ZV1vrQUC6f8Vazp1M2TuknWV+VvtkzR+yFbVBeRf05QdN3kQMP
	W9iy+Z4Np41wZuOmC9Xcd4JA03K4SsCfRNJYAijhMxr82h6gL9KQ5Zu+HXgv3KD8Mi19/d5kSfplE
	tQRGPt6UEJ1deif85lAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsfPK-000000063xe-0RCH;
	Fri, 05 Apr 2024 08:58:46 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsfPG-000000063vl-392l
	for linux-amlogic@lists.infradead.org;
	Fri, 05 Apr 2024 08:58:44 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-33ff53528ceso1405840f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 05 Apr 2024 01:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712307521; x=1712912321; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=tvTd0Fm8ZquDDVIbm2YOHB7MsYv/hDWQ2T1VR/OyIKU=;
        b=En9Q9fTs8GCgMWjc+Ls7mMLwP6xEeUzdLzLCrZ7uXvA828bzIUp9mNo8Z4eyyDEERB
         TiYhpN6j/4+bTECBzwqR575y/W+nuqbsx4JFH0UXXpeNB/L+Ixo59O0PUFyddzR1cmb1
         8qnS4Jo+02FK+kfw/7MK+17zbN4kolQ29O6skx8Ub5W+No4i5wB8kgynLa1DMGJTUu++
         EnhWS0I63vNe4EIMD+Tg7m+NDKsSvVpFX/wwQh45L/NTkE/2ZaFFyHqoUwVaPimXQhJC
         p51iq1lGRL8G0cKJpFl4GNLI4oAEZKyZxSXu6E3oWvYPaNDBZFLBYTa9GfSdSmAGZuwb
         /BMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712307521; x=1712912321;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvTd0Fm8ZquDDVIbm2YOHB7MsYv/hDWQ2T1VR/OyIKU=;
        b=NHhBgdFjj0pRXOtrqwmKl8e0zeJFgi2veNlUpZPp1YHdx9VwyUi9jSY6qnJBOHvs6q
         tDRhNFW52mfW3z+8ixjc+OzIyewUIfZw73f6ggeMPm9w/ZSrpyBDGZn7uHn+uMGY2Jfv
         d2Si8WGDD04GTyTcbtXGvJyGeuo88ffkvPsVX3B+TCXkvsJIMd/LbQaDlrcXDEDoainb
         atzmhhdQDPYxA69zNhiEElovI6Y8uvJSdI0X2O0rcCVH+1rmj2/FwbojsIlvV66dMsbm
         v70WyxreqEpD1vBBZnj8Z3mE1gZxOqRj08q34KqAq6f2XSVEGUTHYngnesgaeH9o7e8m
         rl6A==
X-Forwarded-Encrypted: i=1; AJvYcCUIgmaJr/EwVWP+U/W1Fbga5Rv5yzOZsCgIBW5FktJe944pnwLwoIPH/iK6DUhLaHbEMCpodB6ipGnMX+he+71kPyPSO+zzuiC3QwxdSMgYlEE=
X-Gm-Message-State: AOJu0YxNwd/mQqhwhAOBlJGqiYNdiNJ0yUeYmuogLXoFePlEDsw/OLt+
	lHYS1SBZuCzS5k6719+0JVV40L0al+PxWMcCSXI4z5X9KyUeQnW3sN4QWkEHfAI=
X-Google-Smtp-Source: AGHT+IFkeZDLwHmb5ksDQvkIX1BxNeAKFtQ2xaawsaOuYE3qt3kcvau+dHTVrKGw3Ss9d7qEh2aORA==
X-Received: by 2002:adf:a486:0:b0:33e:bfd0:41f9 with SMTP id g6-20020adfa486000000b0033ebfd041f9mr633683wrb.31.1712307520708;
        Fri, 05 Apr 2024 01:58:40 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:dd7a:d766:e9e8:454c])
        by smtp.gmail.com with ESMTPSA id g11-20020adfe40b000000b00341cb22a8d4sm1494134wrm.108.2024.04.05.01.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:58:40 -0700 (PDT)
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
 <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-2-99ecdfdc87fc@linaro.org>
 <1jmsq9pmgd.fsf@starbuckisacylon.baylibre.com>
 <2cf79f07-0ae1-4267-ac08-fe40366d87d4@linaro.org>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: neil.armstrong@linaro.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Jagan Teki <jagan@amarulasolutions.com>, Nicolas Belin
 <nbelin@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v12 2/7] clk: meson: add vclk driver
Date: Fri, 05 Apr 2024 09:00:43 +0200
In-reply-to: <2cf79f07-0ae1-4267-ac08-fe40366d87d4@linaro.org>
Message-ID: <1ja5m8p4n4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_015842_836089_A40F4BE5 
X-CRM114-Status: GOOD (  24.85  )
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


On Thu 04 Apr 2024 at 18:59, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> On 04/04/2024 10:13, Jerome Brunet wrote:
>> On Wed 03 Apr 2024 at 09:46, Neil Armstrong <neil.armstrong@linaro.org>
>> wrote:
>> 
>>> The VCLK and VCLK_DIV clocks have supplementary bits.
>>>
>>> The VCLK gate has a "SOFT RESET" bit to toggle after the whole
>>> VCLK sub-tree rate has been set, this is implemented in
>>> the gate enable callback.
>>>
>>> The VCLK_DIV clocks as enable and reset bits used to disable
>>> and reset the divider, associated with CLK_SET_RATE_GATE it ensures
>>> the rate is set while the divider is disabled and in reset mode.
>>>
>>> The VCLK_DIV enable bit isn't implemented as a gate since it's part
>>> of the divider logic and vendor does this exact sequence to ensure
>>> the divider is correctly set.
>> The checkpatch warning is still there. Is it a choice or a mistake ?
>> Documentation says "GPL v2" exists for historic reason which seems to
>> hint "GPL" is preferred, and I suppose this is why checkpatch warns for
>> it.
>
> Well I didn't see this warning, this is what I fixed:
>
> $ scripts/checkpatch.pl --strict drivers/clk/meson/vclk.c
> CHECK: Alignment should match open parenthesis
> #63: FILE: drivers/clk/meson/vclk.c:63:
> +static unsigned long meson_vclk_div_recalc_rate(struct clk_hw *hw,
> +                                                    unsigned long prate)
>
> CHECK: Alignment should match open parenthesis
> #73: FILE: drivers/clk/meson/vclk.c:73:
> +static int meson_vclk_div_determine_rate(struct clk_hw *hw,
> +                                             struct clk_rate_request *req)
>
> CHECK: Alignment should match open parenthesis
> #83: FILE: drivers/clk/meson/vclk.c:83:
> +static int meson_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +                                       unsigned long parent_rate)
>

I would not ask a respin solely for this. It's nice to fix it but I was
mostly after the warning TBH.

> <snip>
>
> It seems that checking a commit triggers an extra check....
>
> $ scripts/checkpatch.pl --strict -G 1bac9f6aa3c3
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #58:
> new file mode 100644
>
> <snip>
>
> WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
> #203: FILE: drivers/clk/meson/vclk.c:141:
> +MODULE_LICENSE("GPL v2");

Hum, I'm running checkpatch against the mail itself, not the commit. I
still get the warning

>
> <snip>
>
> Neil
>
>> 
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   drivers/clk/meson/Kconfig  |   4 ++
>>>   drivers/clk/meson/Makefile |   1 +
>>>   drivers/clk/meson/vclk.c   | 141 +++++++++++++++++++++++++++++++++++++++++++++
>>>   drivers/clk/meson/vclk.h   |  51 ++++++++++++++++
>>>   4 files changed, 197 insertions(+)
>>>
>>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>>> index 29ffd14d267b..8a9823789fa3 100644
>>> --- a/drivers/clk/meson/Kconfig
>>> +++ b/drivers/clk/meson/Kconfig
>>> @@ -30,6 +30,10 @@ config COMMON_CLK_MESON_VID_PLL_DIV
>>>   	tristate
>>>   	select COMMON_CLK_MESON_REGMAP
>>>   +config COMMON_CLK_MESON_VCLK
>>> +	tristate
>>> +	select COMMON_CLK_MESON_REGMAP
>>> +
>>>   config COMMON_CLK_MESON_CLKC_UTILS
>>>   	tristate
>>>   diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
>>> index 9ee4b954c896..9ba43fe7a07a 100644
>>> --- a/drivers/clk/meson/Makefile
>>> +++ b/drivers/clk/meson/Makefile
>>> @@ -12,6 +12,7 @@ obj-$(CONFIG_COMMON_CLK_MESON_PLL) += clk-pll.o
>>>   obj-$(CONFIG_COMMON_CLK_MESON_REGMAP) += clk-regmap.o
>>>   obj-$(CONFIG_COMMON_CLK_MESON_SCLK_DIV) += sclk-div.o
>>>   obj-$(CONFIG_COMMON_CLK_MESON_VID_PLL_DIV) += vid-pll-div.o
>>> +obj-$(CONFIG_COMMON_CLK_MESON_VCLK) += vclk.o
>>>     # Amlogic Clock controllers
>>>   diff --git a/drivers/clk/meson/vclk.c b/drivers/clk/meson/vclk.c
>>> new file mode 100644
>>> index 000000000000..45dc216941ea
>>> --- /dev/null
>>> +++ b/drivers/clk/meson/vclk.c
>>> @@ -0,0 +1,141 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (c) 2024 Neil Armstrong <neil.armstrong@linaro.org>
>>> + */
>>> +
>>> +#include <linux/module.h>
>>> +#include "vclk.h"
>>> +
>>> +/* The VCLK gate has a supplementary reset bit to pulse after ungating */
>>> +
>>> +static inline struct meson_vclk_gate_data *
>>> +clk_get_meson_vclk_gate_data(struct clk_regmap *clk)
>>> +{
>>> +	return (struct meson_vclk_gate_data *)clk->data;
>>> +}
>>> +
>>> +static int meson_vclk_gate_enable(struct clk_hw *hw)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
>>> +
>>> +	meson_parm_write(clk->map, &vclk->enable, 1);
>>> +
>>> +	/* Do a reset pulse */
>>> +	meson_parm_write(clk->map, &vclk->reset, 1);
>>> +	meson_parm_write(clk->map, &vclk->reset, 0);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void meson_vclk_gate_disable(struct clk_hw *hw)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
>>> +
>>> +	meson_parm_write(clk->map, &vclk->enable, 0);
>>> +}
>>> +
>>> +static int meson_vclk_gate_is_enabled(struct clk_hw *hw)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
>>> +
>>> +	return meson_parm_read(clk->map, &vclk->enable);
>>> +}
>>> +
>>> +const struct clk_ops meson_vclk_gate_ops = {
>>> +	.enable = meson_vclk_gate_enable,
>>> +	.disable = meson_vclk_gate_disable,
>>> +	.is_enabled = meson_vclk_gate_is_enabled,
>>> +};
>>> +EXPORT_SYMBOL_GPL(meson_vclk_gate_ops);
>>> +
>>> +/* The VCLK Divider has supplementary reset & enable bits */
>>> +
>>> +static inline struct meson_vclk_div_data *
>>> +clk_get_meson_vclk_div_data(struct clk_regmap *clk)
>>> +{
>>> +	return (struct meson_vclk_div_data *)clk->data;
>>> +}
>>> +
>>> +static unsigned long meson_vclk_div_recalc_rate(struct clk_hw *hw,
>>> +						unsigned long prate)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>>> +
>>> +	return divider_recalc_rate(hw, prate, meson_parm_read(clk->map, &vclk->div),
>>> +				   vclk->table, vclk->flags, vclk->div.width);
>>> +}
>>> +
>>> +static int meson_vclk_div_determine_rate(struct clk_hw *hw,
>>> +					 struct clk_rate_request *req)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>>> +
>>> +	return divider_determine_rate(hw, req, vclk->table, vclk->div.width,
>>> +				      vclk->flags);
>>> +}
>>> +
>>> +static int meson_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
>>> +				   unsigned long parent_rate)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>>> +	int ret;
>>> +
>>> +	ret = divider_get_val(rate, parent_rate, vclk->table, vclk->div.width,
>>> +			      vclk->flags);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	meson_parm_write(clk->map, &vclk->div, ret);
>>> +
>>> +	return 0;
>>> +};
>>> +
>>> +static int meson_vclk_div_enable(struct clk_hw *hw)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>>> +
>>> +	/* Unreset the divider when ungating */
>>> +	meson_parm_write(clk->map, &vclk->reset, 0);
>>> +	meson_parm_write(clk->map, &vclk->enable, 1);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void meson_vclk_div_disable(struct clk_hw *hw)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>>> +
>>> +	/* Reset the divider when gating */
>>> +	meson_parm_write(clk->map, &vclk->enable, 0);
>>> +	meson_parm_write(clk->map, &vclk->reset, 1);
>>> +}
>>> +
>>> +static int meson_vclk_div_is_enabled(struct clk_hw *hw)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>>> +
>>> +	return meson_parm_read(clk->map, &vclk->enable);
>>> +}
>>> +
>>> +const struct clk_ops meson_vclk_div_ops = {
>>> +	.recalc_rate = meson_vclk_div_recalc_rate,
>>> +	.determine_rate = meson_vclk_div_determine_rate,
>>> +	.set_rate = meson_vclk_div_set_rate,
>>> +	.enable = meson_vclk_div_enable,
>>> +	.disable = meson_vclk_div_disable,
>>> +	.is_enabled = meson_vclk_div_is_enabled,
>>> +};
>>> +EXPORT_SYMBOL_GPL(meson_vclk_div_ops);
>>> +
>>> +MODULE_DESCRIPTION("Amlogic vclk clock driver");
>>> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
>>> +MODULE_LICENSE("GPL v2");
>>> diff --git a/drivers/clk/meson/vclk.h b/drivers/clk/meson/vclk.h
>>> new file mode 100644
>>> index 000000000000..20b0b181db09
>>> --- /dev/null
>>> +++ b/drivers/clk/meson/vclk.h
>>> @@ -0,0 +1,51 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Copyright (c) 2024 Neil Armstrong <neil.armstrong@linaro.org>
>>> + */
>>> +
>>> +#ifndef __VCLK_H
>>> +#define __VCLK_H
>>> +
>>> +#include "clk-regmap.h"
>>> +#include "parm.h"
>>> +
>>> +/**
>>> + * struct meson_vclk_gate_data - vclk_gate regmap backed specific data
>>> + *
>>> + * @enable:	vclk enable field
>>> + * @reset:	vclk reset field
>>> + * @flags:	hardware-specific flags
>>> + *
>>> + * Flags:
>>> + * Same as clk_gate except CLK_GATE_HIWORD_MASK which is ignored
>>> + */
>>> +struct meson_vclk_gate_data {
>>> +	struct parm enable;
>>> +	struct parm reset;
>>> +	u8 flags;
>>> +};
>>> +
>>> +extern const struct clk_ops meson_vclk_gate_ops;
>>> +
>>> +/**
>>> + * struct meson_vclk_div_data - vclk_div regmap back specific data
>>> + *
>>> + * @div:	divider field
>>> + * @enable:	vclk divider enable field
>>> + * @reset:	vclk divider reset field
>>> + * @table:	array of value/divider pairs, last entry should have div = 0
>>> + *
>>> + * Flags:
>>> + * Same as clk_divider except CLK_DIVIDER_HIWORD_MASK which is ignored
>>> + */
>>> +struct meson_vclk_div_data {
>>> +	struct parm div;
>>> +	struct parm enable;
>>> +	struct parm reset;
>>> +	const struct clk_div_table *table;
>>> +	u8 flags;
>>> +};
>>> +
>>> +extern const struct clk_ops meson_vclk_div_ops;
>>> +
>>> +#endif /* __VCLK_H */
>> 


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
