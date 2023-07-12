Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7BAEB64DA
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jul 2023 12:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CcGoPueh/xv5jDAdjIYdrEQZxuFODWmaUM2r0Kau9TA=; b=2QTNPZ1txAdIpi
	4ysPiA2De9OJVL83xhteMSSlJzS5P6Q6Twjc9ClxhDghMG4Vvnc/UkaNUYSnFE+ddP6wfABhlQnQN
	nPJPIxxtpsbUO/tBaT8wSS4l86y4hYOgJjkf0J3URH0X9wRWSA/TeoAL+i1HzzXx/2lJd+O6EJEXq
	pU1yklMowmpsWbMKcvC2tsDWP0cOkkAp8ewsnktHnhfvjRStsG9GSlTv/XvUr8bm/mp1HZpA7egpW
	j1BZD5MK6gFObj0Bjt53LKBNG7Mjzc5ovsWVNT42nOy4Y/Vgp88hzOBnaZFNsOgJ6TQEoBBOvK2ML
	GVv0LUFxcDDI12ZhgpIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJYav-00HTtW-1K;
	Wed, 12 Jul 2023 12:05:21 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJYas-00HTs2-03
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Jul 2023 12:05:20 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fbfcc6daa9so59126985e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 12 Jul 2023 05:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689163515; x=1691755515;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=gmxZeEshRvqM/BRR9ZXtUjCKxif2agi1dlESa2lsMoU=;
        b=QzS2HCB0DYgtvqqOIbnCP2zRcRrP2JmzRZYa7Jqwvq2ugL+0C9wegPY9how926nslD
         bLemtZE9wSrUh5EvjA35wCl03UpS0+pS8Ld9fBiyqGK4hFqfvgwCwDocDFrpBzwCah2i
         S7nQL+n7S1Ho/Z/ozpT05ZPBlde7SWIdDqTZ3SVi5tRxiAqwJGdcqkxHTJNPGI/HVzW4
         HPM79C3A2u7aVi7iNlpRXcM9drr3kKTIozROuVmp4QgiP6O1lw18RyPCJpK0bPGFXd/i
         S+i/Jlf4UGzUWriqTlu/0/J5MwiN677MxXVP0PBiQuqelaqTY42psKsSo8GoxFxvxPka
         Q4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689163515; x=1691755515;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmxZeEshRvqM/BRR9ZXtUjCKxif2agi1dlESa2lsMoU=;
        b=T88o+6IAWbpJ3LbO4HsgvUy2TWHzMSe639a6s46FFSnJ0GcZxYK+AzBwiosMVRAesF
         6GVS+j1ORXzd8paVpHEWurWU/BEvxVDFhFUduJiB5ELFEw5du0pQ/Dd5M02QJTRXpQxj
         oFvcAvUNr58zE2LzR7z91rFF1uTsP0cI0GQH+6hc74NFg7BGfGrwLsrir9nJn5tIHdUs
         9X1PjOJOAA0XM8i0T1z8gm5kBOkDSphuXl9ZoXkQnSjZ6W43fpKBFXLTgQSX+8ZxwDFW
         t9+kSPfpP7U71eOL+7jLD+9FGH5g+5Gx/FDQo+jY+Oghg15zt2tuGSGCYJ/k/3KOiF0z
         iGPQ==
X-Gm-Message-State: ABy/qLb2UPXIrif0EdYxMH8w+loy16lapFkEbUEIZ+HM4Pb9yIyi+X86
	LigX9AHxor2DCtOMCGG67SpR/g==
X-Google-Smtp-Source: APBJJlEW07G2Z9vncF20Zns7VmBUWwFGEgahYbX5gKUkcou8mv0OBM7lDswlVa796IQGkz2649ACDQ==
X-Received: by 2002:a05:600c:2116:b0:3fc:71:fe50 with SMTP id u22-20020a05600c211600b003fc0071fe50mr12927500wml.24.1689163515243;
        Wed, 12 Jul 2023 05:05:15 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb0:33d7:37a9:5cb2:4942])
        by smtp.gmail.com with ESMTPSA id hn32-20020a05600ca3a000b003fbdd5d0758sm4933880wmb.22.2023.07.12.05.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 05:05:14 -0700 (PDT)
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org>
 <20230607-topic-amlogic-upstream-clkid-public-migration-v2-1-38172d17c27a@linaro.org>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 01/19] clk: meson: introduce meson-clkc-utils
Date: Wed, 12 Jul 2023 14:03:19 +0200
In-reply-to: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-1-38172d17c27a@linaro.org>
Message-ID: <1ja5w1xrly.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_050518_266922_CCDFEEBB 
X-CRM114-Status: GOOD (  21.89  )
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


On Mon 12 Jun 2023 at 11:57, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> Let's introduce a new module called meson-clkc-utils that
> will contain shared utility functions for all Amlogic clock
> controller drivers.
>
> The first utility function is a replacement of of_clk_hw_onecell_get
> in order to get rid of the NR_CLKS define in all Amlogic clock
> drivers.
>
> The goal is to move all duplicate probe and init code in this module.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Hi Neil,

checkpatch complains about the MODULE_LICENSE()

WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
#185: FILE: drivers/clk/meson/meson-clkc-utils.c:25:
+MODULE_LICENSE("GPL v2");

I don't mind fixing this up while applying if it is Ok with you.

> ---
>  drivers/clk/meson/Kconfig            |  3 +++
>  drivers/clk/meson/Makefile           |  1 +
>  drivers/clk/meson/meson-clkc-utils.c | 25 +++++++++++++++++++++++++
>  drivers/clk/meson/meson-clkc-utils.h | 19 +++++++++++++++++++
>  4 files changed, 48 insertions(+)
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 8ce846fdbe43..d03adad31318 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -30,6 +30,9 @@ config COMMON_CLK_MESON_VID_PLL_DIV
>  	tristate
>  	select COMMON_CLK_MESON_REGMAP
>  
> +config COMMON_CLK_MESON_CLKC_UTILS
> +	tristate
> +
>  config COMMON_CLK_MESON_AO_CLKC
>  	tristate
>  	select COMMON_CLK_MESON_REGMAP
> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
> index d5288662881d..cd961cc4f4db 100644
> --- a/drivers/clk/meson/Makefile
> +++ b/drivers/clk/meson/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  # Amlogic clock drivers
>  
> +obj-$(CONFIG_COMMON_CLK_MESON_CLKC_UTILS) += meson-clkc-utils.o
>  obj-$(CONFIG_COMMON_CLK_MESON_AO_CLKC) += meson-aoclk.o
>  obj-$(CONFIG_COMMON_CLK_MESON_CPU_DYNDIV) += clk-cpu-dyndiv.o
>  obj-$(CONFIG_COMMON_CLK_MESON_DUALDIV) += clk-dualdiv.o
> diff --git a/drivers/clk/meson/meson-clkc-utils.c b/drivers/clk/meson/meson-clkc-utils.c
> new file mode 100644
> index 000000000000..9a0620bcc161
> --- /dev/null
> +++ b/drivers/clk/meson/meson-clkc-utils.c
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
> + */
> +
> +#include <linux/of_device.h>
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include "meson-clkc-utils.h"
> +
> +struct clk_hw *meson_clk_hw_get(struct of_phandle_args *clkspec, void *clk_hw_data)
> +{
> +	const struct meson_clk_hw_data *data = clk_hw_data;
> +	unsigned int idx = clkspec->args[0];
> +
> +	if (idx >= data->num) {
> +		pr_err("%s: invalid index %u\n", __func__, idx);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	return data->hws[idx];
> +}
> +EXPORT_SYMBOL_GPL(meson_clk_hw_get);
> +
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
> new file mode 100644
> index 000000000000..fe6f40728949
> --- /dev/null
> +++ b/drivers/clk/meson/meson-clkc-utils.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> +/*
> + * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
> + */
> +
> +#ifndef __MESON_CLKC_UTILS_H__
> +#define __MESON_CLKC_UTILS_H__
> +
> +#include <linux/of_device.h>
> +#include <linux/clk-provider.h>
> +
> +struct meson_clk_hw_data {
> +	struct clk_hw	**hws;
> +	unsigned int	num;
> +};
> +
> +struct clk_hw *meson_clk_hw_get(struct of_phandle_args *clkspec, void *clk_hw_data);
> +
> +#endif


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
