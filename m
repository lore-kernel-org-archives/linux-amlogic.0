Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFA7EE645B
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Sep 2024 08:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uuyqcjUXKdaqRLXqRYxUbMlu1QghhWMO0Zpj9kfPpos=; b=UnqW+K6qh0qTke
	4YVKcAWm0fhNVVBrEDLyq+TAn6CWgBj4EHDrrWPaaZocs3t1D+m8or6M4NtuxmaEAi4MXG22Zx2/L
	t3kcyUoihWIsIwdVTqYxHwO8FlzffLE3nW9Z6KaWNUAP5XEVJ1BDye9625qvc94+KqXn9Zim8cx/c
	rqXCuDnQ+NFutSLjzBMMsRCrWDtQNoo7elyaiNS9LOxBkv7rMl8OQnqp85RmfFVneWeFIi7lEf4FY
	ggMoD7f701Ncgp69eltojahaYCZ9eKywmAhy7a9MXeYRO9I9UqYxieKVqBwWtBvyt7TdTq4KLvujO
	WnXtcU1Zgq1YOC5t9b0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soexW-0000000CKCX-1Q8q;
	Thu, 12 Sep 2024 08:13:46 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soew9-0000000CJvb-1hch
	for linux-amlogic@lists.infradead.org;
	Thu, 12 Sep 2024 08:12:22 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1soew3-0006lH-8Z; Thu, 12 Sep 2024 10:12:15 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1soew2-007Kw5-Hn; Thu, 12 Sep 2024 10:12:14 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1soew2-0002SF-1X;
	Thu, 12 Sep 2024 10:12:14 +0200
Message-ID: <8cb81058c8f45e378675e078e296336a2cf74308.camel@pengutronix.de>
Subject: Re: [PATCH v5 8/9] reset: amlogic: split the device core and
 platform probe
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
  linux-kernel@vger.kernel.org
Date: Thu, 12 Sep 2024 10:12:14 +0200
In-Reply-To: <20240910-meson-rst-aux-v5-8-60be62635d3e@baylibre.com>
References: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
	 <20240910-meson-rst-aux-v5-8-60be62635d3e@baylibre.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_011221_449345_5EB589ED 
X-CRM114-Status: GOOD (  18.71  )
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

On Di, 2024-09-10 at 18:32 +0200, Jerome Brunet wrote:
> To prepare the addition of the auxiliary device support, split
> out the device coomon functions from the probe of the platform device.
> 
> The device core function will be common to both the platform and auxiliary
> driver.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/reset/amlogic/Kconfig              |   7 +-
>  drivers/reset/amlogic/Makefile             |   1 +
>  drivers/reset/amlogic/reset-meson-common.c | 121 ++++++++++++++++++++++++++++
>  drivers/reset/amlogic/reset-meson.c        | 122 ++++-------------------------
>  drivers/reset/amlogic/reset-meson.h        |  24 ++++++
>  5 files changed, 167 insertions(+), 108 deletions(-)
> 
> diff --git a/drivers/reset/amlogic/Kconfig b/drivers/reset/amlogic/Kconfig
> index 532e6a4f7865..1d77987088f4 100644
> --- a/drivers/reset/amlogic/Kconfig
> +++ b/drivers/reset/amlogic/Kconfig
> @@ -1,10 +1,15 @@
> +config RESET_MESON_COMMON
> +	tristate
> +	select REGMAP
> +
>  config RESET_MESON
>  	tristate "Meson Reset Driver"
>  	depends on ARCH_MESON || COMPILE_TEST
>  	default ARCH_MESON
>  	select REGMAP_MMIO
> +	select RESET_MESON_COMMON
>  	help
> -	  This enables the reset driver for Amlogic Meson SoCs.
> +	  This enables the reset driver for Amlogic SoCs.
>  
>  config RESET_MESON_AUDIO_ARB
>  	tristate "Meson Audio Memory Arbiter Reset Driver"
> diff --git a/drivers/reset/amlogic/Makefile b/drivers/reset/amlogic/Makefile
> index 55509fc78513..74aaa2fb5e13 100644
> --- a/drivers/reset/amlogic/Makefile
> +++ b/drivers/reset/amlogic/Makefile
> @@ -1,2 +1,3 @@
>  obj-$(CONFIG_RESET_MESON) += reset-meson.o
> +obj-$(CONFIG_RESET_MESON_COMMON) += reset-meson-common.o
>  obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
> diff --git a/drivers/reset/amlogic/reset-meson-common.c b/drivers/reset/amlogic/reset-meson-common.c
> new file mode 100644
> index 000000000000..d57544801ae9
> --- /dev/null
> +++ b/drivers/reset/amlogic/reset-meson-common.c
> @@ -0,0 +1,121 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Amlogic Meson Reset core functions
> + *
> + * Copyright (c) 2016-2024 BayLibre, SAS.
> + * Authors: Neil Armstrong <narmstrong@baylibre.com>
> + *          Jerome Brunet <jbrunet@baylibre.com>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +
> +#include "reset-meson.h"
> +
> +struct meson_reset {
> +	const struct meson_reset_param *param;
> +	struct reset_controller_dev rcdev;
> +	struct regmap *map;
> +};
> +
> +static void meson_reset_offset_and_bit(struct meson_reset *data,
> +				       unsigned long id,
> +				       unsigned int *offset,
> +				       unsigned int *bit)
> +{
> +	unsigned int stride = regmap_get_reg_stride(data->map);
> +
> +	*offset = (id / (stride * BITS_PER_BYTE)) * stride;
> +	*bit = id % (stride * BITS_PER_BYTE);
> +}
> +
> +static int meson_reset_reset(struct reset_controller_dev *rcdev,
> +			     unsigned long id)

checkpatch --strict complains about the alignment here.
I'll fix this up when applying, no need to resend.

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
