Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219ECC4167B
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Nov 2023 16:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=koypSTc2dd48j96Y5nvX344Q+Lwn5sZToO4QBRVTIcs=; b=WBMT7qQudEihxY
	uqekiTu+Ub45tfV/krMjd2HMjWjW+GzUhemcgwIb4qXKxm+kBDqcGiuyRlOg0cRFY5QblK+wKqjCH
	zzlYqMjPkDOOSAmSVrooNIohgJWdk25q/eir3+PNqcJTnHDsZetow7p3uZoH165NAqb6SfmtNlu+M
	UV71CaCF1O77W+isPBPfZX/i0Rz2Y+Bj4k6Z3HNN0HwQ6T6iSdx9TFvn3afpi2lCYnA3vuIc7NEv/
	4HsKmYU2qoLqEQLSCG+hPCK+SczDJ+UOraXEux59tpNkB3q1EHb43Xbvrauv+jmVHqbCNtsGOILgs
	E4rxkr/pQJmcHxSYmpZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7egB-0032AN-04;
	Mon, 27 Nov 2023 16:41:51 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eg6-00327d-1Z
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Nov 2023 16:41:48 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-332fd81fc8dso1067305f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Nov 2023 08:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701103302; x=1701708102; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=/Icj54IjZp5B4hkXeCz67YIlN6i5tKQ8M88cBBrEKK4=;
        b=axbs/3XqISfvuceP7V6HTse5mbdruVm5SVrgfNul7PYGvQZfyqNgmMSH7if0XyswvO
         ztG0mNVx3m37YF+Ud/QshAG3HKR3lqtbUGhzoxFw4yUj/a5Mop8tl/IZTwClpjk7BjIE
         +dmG0V5nNid4rvABrvYEVUfbCYr9gB4nfk0HFcCH9VzW6V7irNnbQ4wAbcSfdOFF67n5
         BiaF9g0U8LfBEGzr6Vplh4T2z6Fkn2giiuM4bCLLf2NZ+68CZt2bpC1mFMCdQAy8+OVU
         J/6wYv9JGxLqYFhJez/sWqJ6dkL0wWzYVhcMkQHs+cYIE4/2nWoxWiuxmWe9YYgLtL+u
         aQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701103302; x=1701708102;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Icj54IjZp5B4hkXeCz67YIlN6i5tKQ8M88cBBrEKK4=;
        b=PfFIsG7hwX+tBmOH7M5++R7qzwXPyDi0cCqyH8+nHjaF7GN7GS8PwMi85x3XRgIi4L
         4qHw+c9hyslIKd5/EqNAv4/K1vJNfN8UScbaak8qh8PwUtMRZe1WFr/L3o4ecKBalper
         ycsPajnUQ/q2nRgOS6zw1MAiYJpW03uX1xHQG08BL7LnI+4Pewq35qF8TD9R07AblXce
         Duy17yspmBD8I4j0hE5xx3bJruSVxSVb5mcPpk3YpltEXoJXE7tMLta8CtGrHxsZ/S9h
         yp8HBwLoF5ATYqj23cL0jeCyUvP5+LybHj7TXIEJCe4DRayuRvgJR6OA4shKXEEuf4Ta
         ahsg==
X-Gm-Message-State: AOJu0YyPsFWn98i5gBEUGaU889C9a3sNw0So/IFSCrYU8wEwt7TeGbFS
	+Ryibr/VjkV+zEGcF4T1J61D4A==
X-Google-Smtp-Source: AGHT+IHFJl3YREfNRJgTH6qJi9k1kF+E8TGrqHCGdE2czDiGzqH3Az0cJk7/KmShVK5MIed8bqNenw==
X-Received: by 2002:a5d:52ca:0:b0:332:fa1b:9f66 with SMTP id r10-20020a5d52ca000000b00332fa1b9f66mr3648641wrv.59.1701103302575;
        Mon, 27 Nov 2023 08:41:42 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:3675:e2e8:2f93:3d3b])
        by smtp.gmail.com with ESMTPSA id c14-20020a056000104e00b00332f95ab44esm5864136wrx.57.2023.11.27.08.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 08:41:42 -0800 (PST)
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
 <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-7-95256ed139e6@linaro.org>
 <1j7cm7dx1b.fsf@starbuckisacylon.baylibre.com>
 <4e5e33c1-45d5-4c83-b647-bfb603347156@linaro.org>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: neil.armstrong@linaro.org
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
Date: Mon, 27 Nov 2023 17:24:03 +0100
In-reply-to: <4e5e33c1-45d5-4c83-b647-bfb603347156@linaro.org>
Message-ID: <1jfs0rywqi.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_084146_523097_C52E3752 
X-CRM114-Status: GOOD (  27.73  )
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


On Mon 27 Nov 2023 at 17:14, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> On 24/11/2023 15:41, Jerome Brunet wrote:
>> On Fri 24 Nov 2023 at 09:41, Neil Armstrong <neil.armstrong@linaro.org>
>> wrote:
>> 
>>> The VCLK and VCLK_DIV clocks have supplementary bits.
>>>
>>> The VCLK has a "SOFT RESET" bit to toggle after the whole
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
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   drivers/clk/meson/Kconfig  |   5 ++
>>>   drivers/clk/meson/Makefile |   1 +
>>>   drivers/clk/meson/vclk.c   | 141 +++++++++++++++++++++++++++++++++++++++++++++
>>>   drivers/clk/meson/vclk.h   |  51 ++++++++++++++++
>>>   4 files changed, 198 insertions(+)
>>>
>>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>>> index 29ffd14d267b..59a40a49f8e1 100644
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
>>>   @@ -140,6 +144,7 @@ config COMMON_CLK_G12A
>>>   	select COMMON_CLK_MESON_EE_CLKC
>>>   	select COMMON_CLK_MESON_CPU_DYNDIV
>>>   	select COMMON_CLK_MESON_VID_PLL_DIV
>>> +	select COMMON_CLK_MESON_VCLK
>> This particular line belong in the next patch
>> 
>>>   	select MFD_SYSCON
>>>   	help
>>>   	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2
>>> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
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
>>> index 000000000000..47f08a52b49f
>>> --- /dev/null
>>> +++ b/drivers/clk/meson/vclk.c
>>> @@ -0,0 +1,141 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
>>> + */
>>> +
>>> +#include <linux/module.h>
>>> +#include "vclk.h"
>>> +
>>> +/* The VCLK gate has a supplementary reset bit to pulse after ungating */
>>> +
>>> +static inline struct clk_regmap_vclk_data *
>>> +clk_get_regmap_vclk_data(struct clk_regmap *clk)
>>> +{
>>> +	return (struct clk_regmap_vclk_data *)clk->data;
>>> +}
>>> +
>>> +static int clk_regmap_vclk_enable(struct clk_hw *hw)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
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
>>> +static void clk_regmap_vclk_disable(struct clk_hw *hw)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
>>> +
>>> +	meson_parm_write(clk->map, &vclk->enable, 0);
>>> +}
>>> +
>>> +static int clk_regmap_vclk_is_enabled(struct clk_hw *hw)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
>>> +
>>> +	return meson_parm_read(clk->map, &vclk->enable);
>>> +}
>>> +
>>> +const struct clk_ops clk_regmap_vclk_ops = {
>>> +	.enable = clk_regmap_vclk_enable,
>>> +	.disable = clk_regmap_vclk_disable,
>>> +	.is_enabled = clk_regmap_vclk_is_enabled,
>>> +};
>>> +EXPORT_SYMBOL_GPL(clk_regmap_vclk_ops);
>> s/clk_regmap_vclk/meson_vclk at least for what is exported, ideally most
>> all the code.
>> I get clk_regmap_ comes from code copied from clk_regmap.c.
>> The reason the this part is different (and not using parm) if that when
>> I converted amlogic to regmap, I hope we could make this generic,
>> possibly converging between aml and qcom (which was the only other
>> platform using regmap for clock at the time). This is why clk_regmap.c
>> is a bit different from the other driver.
>> For the aml specific drivers, best to look at the mpll or cpu-dyndiv one.
>> 
>>> +
>>> +/* The VCLK Divider has supplementary reset & enable bits */
>>> +
>>> +static inline struct clk_regmap_vclk_div_data *
>>> +clk_get_regmap_vclk_div_data(struct clk_regmap *clk)
>>> +{
>>> +	return (struct clk_regmap_vclk_div_data *)clk->data;
>>> +}
>>> +
>>> +static unsigned long clk_regmap_vclk_div_recalc_rate(struct clk_hw *hw,
>>> +						     unsigned long prate)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
>>> +
>>> +	return divider_recalc_rate(hw, prate, meson_parm_read(clk->map, &vclk->div),
>>> +				   vclk->table, vclk->flags, vclk->div.width);
>>> +}
>>> +
>>> +static int clk_regmap_vclk_div_determine_rate(struct clk_hw *hw,
>>> +					      struct clk_rate_request *req)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
>>> +
>>> +	return divider_determine_rate(hw, req, vclk->table, vclk->div.width,
>>> +				      vclk->flags);
>>> +}
>>> +
>>> +static int clk_regmap_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
>>> +					unsigned long parent_rate)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
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
>>> +static int clk_regmap_vclk_div_enable(struct clk_hw *hw)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
>>> +
>>> +	/* Unreset the divider when ungating */
>>> +	meson_parm_write(clk->map, &vclk->reset, 0);
>>> +	meson_parm_write(clk->map, &vclk->enable, 1);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void clk_regmap_vclk_div_disable(struct clk_hw *hw)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
>>> +
>>> +	/* Reset the divider when gating */
>>> +	meson_parm_write(clk->map, &vclk->enable, 0);
>>> +	meson_parm_write(clk->map, &vclk->reset, 1);
>>> +}
>>> +
>>> +static int clk_regmap_vclk_div_is_enabled(struct clk_hw *hw)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
>>> +
>>> +	return meson_parm_read(clk->map, &vclk->enable);
>>> +}
>>> +
>>> +const struct clk_ops clk_regmap_vclk_div_ops = {
>>> +	.recalc_rate = clk_regmap_vclk_div_recalc_rate,
>>> +	.determine_rate = clk_regmap_vclk_div_determine_rate,
>>> +	.set_rate = clk_regmap_vclk_div_set_rate,
>>> +	.enable = clk_regmap_vclk_div_enable,
>>> +	.disable = clk_regmap_vclk_div_disable,
>>> +	.is_enabled = clk_regmap_vclk_div_is_enabled,
>>> +};
>>> +EXPORT_SYMBOL_GPL(clk_regmap_vclk_div_ops);
>>> +
>>> +MODULE_DESCRIPTION("Amlogic vclk clock driver");
>>> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
>>> +MODULE_LICENSE("GPL v2");
>>> diff --git a/drivers/clk/meson/vclk.h b/drivers/clk/meson/vclk.h
>>> new file mode 100644
>>> index 000000000000..4f25d7ad2717
>>> --- /dev/null
>>> +++ b/drivers/clk/meson/vclk.h
>
> Is vclk.c/h ok ? clk-vclk doesn't look pretty, but I can switch to it to
> keep files organized.

I don't have a strong opinion about it.
I would have suggested vclk-div.c/h - like sclk ... but you do have gate
ops in there, so ... :/

This made me realize that one does not really go without the other.
It is more a coherent block, isn't it ?
Would it make more sense to have these 2 merged in a single clk_ops ?

It's bit late to point this out, sorry about that.

I let you decide whether to merge the ops or not and which name to pick.

If you keep them separated, meson_vclk_gate_ops instead of just
meson_vclk_ops, to make things clear.

>
> Neil
>
>>> @@ -0,0 +1,51 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
>>> + */
>>> +
>>> +#ifndef __VCLK_H
>>> +#define __VCLK_H
>> This is too generic.
>> Please add the MESON prefix like the other clock driver please.
>> 
>>> +
>>> +#include "clk-regmap.h"
>>> +#include "parm.h"
>>> +
>>> +/**
>>> + * struct clk_regmap_vclk_data - vclk regmap backed specific data
>>> + *
>>> + * @enable:	vclk enable field
>>> + * @reset:	vclk reset field
>>> + * @flags:	hardware-specific flags
>>> + *
>>> + * Flags:
>>> + * Same as clk_gate except CLK_GATE_HIWORD_MASK which is ignored
>>> + */
>>> +struct clk_regmap_vclk_data {
>>> +	struct parm enable;
>>> +	struct parm reset;
>>> +	u8 flags;
>>> +};
>>> +
>>> +extern const struct clk_ops clk_regmap_vclk_ops;
>>> +
>>> +/**
>>> + * struct clk_regmap_vclk_div_data - vclk_div regmap back specific data
>>> + *
>>> + * @div:	divider field
>>> + * @enable:	vclk divider enable field
>>> + * @reset:	vclk divider reset field
>>> + * @table:	array of value/divider pairs, last entry should have div = 0
>>> + *
>>> + * Flags:
>>> + * Same as clk_divider except CLK_DIVIDER_HIWORD_MASK which is ignored
>>> + */
>>> +struct clk_regmap_vclk_div_data {
>>> +	struct parm div;
>>> +	struct parm enable;
>>> +	struct parm reset;
>>> +	const struct clk_div_table *table;
>>> +	u8 flags;
>>> +};
>>> +
>>> +extern const struct clk_ops clk_regmap_vclk_div_ops;
>>> +
>>> +#endif /* __VCLK_H */
>> 


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
