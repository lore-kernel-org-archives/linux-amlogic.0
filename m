Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E352CA0ED3
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2024 10:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJthuxHKXids6z9geHe1wiF6OXfBPxd9RcJUfwYYNJg=; b=miFXFP1hx8pxnK
	Gt3IFqdcXpDDq8ljZK/l21hxNUHiJfuirQKHG5hmgDvsQFzSg42IqrLtq0D9ThHfx9rX+0rabbt34
	8l28Jg4I6ZZaaHJvzra0CSk7p9kHGNO7woERRocBvnRHSJS5N5+9IOgy4B+mW2pT94aU/nKfjMhB6
	6PGsl7ylGhF1ou4U5pkHFE7uZqwk858Al0T5vwcZ2/T6hE+mq+BtaQR6IMSXhR+KP48juTN74+grN
	niareTUZjqTzFpVy8Dza6fJ6UGHSRqnfXcqwrFB1WjbyD/pSvvWdx17Bn1gZzCVLtAlJa8eYchkhy
	u9cCZNQI8k0BhdDOW+GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl4Qu-0000000DwUk-1GEP;
	Mon, 02 Sep 2024 10:37:16 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl4Qr-0000000DwS3-1kbK
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Sep 2024 10:37:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sl4Qo-0001vg-Lr; Mon, 02 Sep 2024 12:37:10 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sl4Qo-004smB-6C; Mon, 02 Sep 2024 12:37:10 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sl4Qo-000hQ3-0O;
	Mon, 02 Sep 2024 12:37:10 +0200
Message-ID: <8b15609fc6aa00b6bdf38234ccb0beb34e5a428b.camel@pengutronix.de>
Subject: Re: [PATCH v3 8/9] reset: amlogic: split the device core and
 platform probe
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org
Date: Mon, 02 Sep 2024 12:37:10 +0200
In-Reply-To: <20240808102742.4095904-9-jbrunet@baylibre.com>
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
	 <20240808102742.4095904-9-jbrunet@baylibre.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_033713_642929_2FDA2601 
X-CRM114-Status: GOOD (  30.43  )
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

On Do, 2024-08-08 at 12:27 +0200, Jerome Brunet wrote:
> To prepare the addition of the auxiliary device support, split
> out the device core function from the probe of the platform device.
> 
> The device core function will be common to both the platform and auxiliary
> driver.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/reset/amlogic/Kconfig                 |  10 +-
>  drivers/reset/amlogic/Makefile                |   3 +-
>  .../{reset-meson.c => reset-meson-core.c}     | 101 +++---------------
>  drivers/reset/amlogic/reset-meson-pltf.c      |  92 ++++++++++++++++
>  drivers/reset/amlogic/reset-meson.h           |  24 +++++
>  5 files changed, 143 insertions(+), 87 deletions(-)
>  rename drivers/reset/amlogic/{reset-meson.c => reset-meson-core.c} (51%)
>  create mode 100644 drivers/reset/amlogic/reset-meson-pltf.c
>  create mode 100644 drivers/reset/amlogic/reset-meson.h
> 
> diff --git a/drivers/reset/amlogic/Kconfig b/drivers/reset/amlogic/Kconfig
> index 7ed9cf50f038..04c7be0f3165 100644
> --- a/drivers/reset/amlogic/Kconfig
> +++ b/drivers/reset/amlogic/Kconfig
> @@ -1,9 +1,15 @@
> +config RESET_MESON_CORE
> +	tristate
> +	select REGMAP
> +
>  config RESET_MESON
> -	tristate "Meson Reset Driver"
> +	tristate "Meson Reset Platform Driver"

I think this change is unnecessary.

>  	depends on ARCH_MESON || COMPILE_TEST
>  	default ARCH_MESON
> +	select REGMAP_MMIO
> +	select RESET_MESON_CORE
>  	help
> -	  This enables the reset driver for Amlogic Meson SoCs.
> +	  This enables the reset platform driver for Amlogic SoCs.

and this as well.

>  
>  config RESET_MESON_AUDIO_ARB
>  	tristate "Meson Audio Memory Arbiter Reset Driver"
> diff --git a/drivers/reset/amlogic/Makefile b/drivers/reset/amlogic/Makefile
> index 55509fc78513..0f8f9121b566 100644
> --- a/drivers/reset/amlogic/Makefile
> +++ b/drivers/reset/amlogic/Makefile
> @@ -1,2 +1,3 @@
> -obj-$(CONFIG_RESET_MESON) += reset-meson.o
> +obj-$(CONFIG_RESET_MESON) += reset-meson-pltf.o
> +obj-$(CONFIG_RESET_MESON_CORE) += reset-meson-core.o
>  obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
> diff --git a/drivers/reset/amlogic/reset-meson.c b/drivers/reset/amlogic/reset-meson-core.c
> similarity index 51%
> rename from drivers/reset/amlogic/reset-meson.c
> rename to drivers/reset/amlogic/reset-meson-core.c
> index b16d9c32adb1..ea4fc562f7e6 100644
> --- a/drivers/reset/amlogic/reset-meson.c
> +++ b/drivers/reset/amlogic/reset-meson-core.c
> @@ -1,27 +1,17 @@
>  // SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
>  /*
> - * Amlogic Meson Reset Controller driver
> + * Amlogic Meson Reset core functions
>   *
> - * Copyright (c) 2016 BayLibre, SAS.
> - * Author: Neil Armstrong <narmstrong@baylibre.com>
> + * Copyright (c) 2024 BayLibre, SAS.
> + * Author: Jerome Brunet <jbrunet@baylibre.com>
>   */
> -#include <linux/err.h>
> -#include <linux/init.h>
> -#include <linux/io.h>
> -#include <linux/of.h>
> +
> +#include <linux/device.h>
>  #include <linux/module.h>
> -#include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/reset-controller.h>
> -#include <linux/slab.h>
> -#include <linux/types.h>
> -
> -struct meson_reset_param {
> -	unsigned int reset_num;
> -	unsigned int reset_offset;
> -	unsigned int level_offset;
> -	bool level_low_reset;
> -};
> +
> +#include "reset-meson.h"
>  
>  struct meson_reset {
>  	const struct meson_reset_param *param;
> @@ -102,84 +92,27 @@ static const struct reset_control_ops meson_reset_ops = {
>  	.status		= meson_reset_status,
>  };
>  
> -static const struct meson_reset_param meson8b_param = {
> -	.reset_num	= 256,
> -	.reset_offset	= 0x0,
> -	.level_offset	= 0x7c,
> -	.level_low_reset = true,
> -};
> -
> -static const struct meson_reset_param meson_a1_param = {
> -	.reset_num	= 96,
> -	.reset_offset	= 0x0,
> -	.level_offset	= 0x40,
> -	.level_low_reset = true,
> -};
> -
> -static const struct meson_reset_param meson_s4_param = {
> -	.reset_num	= 192,
> -	.reset_offset	= 0x0,
> -	.level_offset	= 0x40,
> -	.level_low_reset = true,
> -};
> -
> -static const struct of_device_id meson_reset_dt_ids[] = {
> -	 { .compatible = "amlogic,meson8b-reset",    .data = &meson8b_param},
> -	 { .compatible = "amlogic,meson-gxbb-reset", .data = &meson8b_param},
> -	 { .compatible = "amlogic,meson-axg-reset",  .data = &meson8b_param},
> -	 { .compatible = "amlogic,meson-a1-reset",   .data = &meson_a1_param},
> -	 { .compatible = "amlogic,meson-s4-reset",   .data = &meson_s4_param},
> -	 { .compatible = "amlogic,c3-reset",   .data = &meson_s4_param},
> -	 { /* sentinel */ },
> -};
> -MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);
> -
> -static const struct regmap_config regmap_config = {
> -	.reg_bits   = 32,
> -	.val_bits   = 32,
> -	.reg_stride = 4,
> -};
> -
> -static int meson_reset_probe(struct platform_device *pdev)
> +int meson_reset_probe(struct device *dev, struct regmap *map,
> +		      const struct meson_reset_param *param)

I'd rename this to something other than *_probe, as this is not a
complete probe function to be used as a .probe callback anymore.
meson_reset_probe_common() or meson_reset_controller_register(), maybe?

>  {
> -	struct device *dev = &pdev->dev;
>  	struct meson_reset *data;
> -	void __iomem *base;
>  
>  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
>  		return -ENOMEM;
>  
> -	base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(base))
> -		return PTR_ERR(base);
> -
> -	data->param = device_get_match_data(dev);
> -	if (!data->param)
> -		return -ENODEV;
> -
> -	data->map = devm_regmap_init_mmio(dev, base, &regmap_config);
> -	if (IS_ERR(data->map))
> -		return dev_err_probe(dev, PTR_ERR(data->map),
> -				     "can't init regmap mmio region\n");
> -
> -	data->rcdev.owner = THIS_MODULE;
> -	data->rcdev.nr_resets = data->param->reset_num;
> +	data->param = param;
> +	data->map = map;
> +	data->rcdev.owner = dev->driver->owner;
> +	data->rcdev.nr_resets = param->reset_num;
>  	data->rcdev.ops = &meson_reset_ops;
>  	data->rcdev.of_node = dev->of_node;
>  
>  	return devm_reset_controller_register(dev, &data->rcdev);
>  }
> +EXPORT_SYMBOL_NS_GPL(meson_reset_probe, MESON_RESET);
>  
> -static struct platform_driver meson_reset_driver = {
> -	.probe	= meson_reset_probe,
> -	.driver = {
> -		.name		= "meson_reset",
> -		.of_match_table	= meson_reset_dt_ids,
> -	},
> -};
> -module_platform_driver(meson_reset_driver);
> -
> -MODULE_DESCRIPTION("Amlogic Meson Reset Controller driver");
> +MODULE_DESCRIPTION("Amlogic Meson Reset Core function");
>  MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
> -MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
> +MODULE_IMPORT_NS(MESON_RESET);
> diff --git a/drivers/reset/amlogic/reset-meson-pltf.c b/drivers/reset/amlogic/reset-meson-pltf.c
> new file mode 100644
> index 000000000000..97e933b4aa34
> --- /dev/null
> +++ b/drivers/reset/amlogic/reset-meson-pltf.c

I'd keep the reset-meson.c name for this file.

> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Amlogic Meson Reset platform driver

I thought "Amlogic Meson Reset Controller driver" was pretty
descriptive. Let's keep that.

> + *
> + * Copyright (c) 2016 BayLibre, SAS.
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + */
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +
> +#include "reset-meson.h"
> +
> +static const struct meson_reset_param meson8b_param = {
> +	.reset_num	= 256,
> +	.reset_offset	= 0x0,
> +	.level_offset	= 0x7c,
> +	.level_low_reset = true,
> +};
> +
> +static const struct meson_reset_param meson_a1_param = {
> +	.reset_num	= 96,
> +	.reset_offset	= 0x0,
> +	.level_offset	= 0x40,
> +	.level_low_reset = true,
> +};
> +
> +static const struct meson_reset_param meson_s4_param = {
> +	.reset_num	= 192,
> +	.reset_offset	= 0x0,
> +	.level_offset	= 0x40,
> +	.level_low_reset = true,
> +};
> +
> +static const struct of_device_id meson_reset_dt_ids[] = {
> +	 { .compatible = "amlogic,meson8b-reset",    .data = &meson8b_param},
> +	 { .compatible = "amlogic,meson-gxbb-reset", .data = &meson8b_param},
> +	 { .compatible = "amlogic,meson-axg-reset",  .data = &meson8b_param},
> +	 { .compatible = "amlogic,meson-a1-reset",   .data = &meson_a1_param},
> +	 { .compatible = "amlogic,meson-s4-reset",   .data = &meson_s4_param},
> +	 { .compatible = "amlogic,c3-reset",   .data = &meson_s4_param},
> +	 { /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);
> +
> +static const struct regmap_config regmap_config = {
> +	.reg_bits   = 32,
> +	.val_bits   = 32,
> +	.reg_stride = 4,
> +};
> +
> +static int meson_reset_pltf_probe(struct platform_device *pdev)

s/pltf_//

> +{
> +	const struct meson_reset_param *param;
> +	struct device *dev = &pdev->dev;
> +	struct regmap *map;
> +	void __iomem *base;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	param = device_get_match_data(dev);
> +	if (!param)
> +		return -ENODEV;
> +
> +	map = devm_regmap_init_mmio(dev, base, &regmap_config);
> +	if (IS_ERR(map))
> +		return dev_err_probe(dev, PTR_ERR(map),
> +				     "can't init regmap mmio region\n");
> +
> +	return meson_reset_probe(dev, map, param);
> +}
> +
> +static struct platform_driver meson_reset_pltf_driver = {

s/pltf_//

> +	.probe	= meson_reset_pltf_probe,

s/pltf_//

> +	.driver = {
> +		.name		= "meson_reset",
> +		.of_match_table	= meson_reset_dt_ids,
> +	},
> +};
> +module_platform_driver(meson_reset_pltf_driver);

s/pltf_//

> +
> +MODULE_DESCRIPTION("Amlogic Meson Reset Platform Controller driver");

s/Platform //

> +MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
> +MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
> +MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_IMPORT_NS(MESON_RESET);
> diff --git a/drivers/reset/amlogic/reset-meson.h b/drivers/reset/amlogic/reset-meson.h
> new file mode 100644
> index 000000000000..c2e8a5cf2e46
> --- /dev/null
> +++ b/drivers/reset/amlogic/reset-meson.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
> +/*
> + * Copyright (c) 2024 BayLibre, SAS.
> + * Author: Jerome Brunet <jbrunet@baylibre.com>
> + */
> +
> +#ifndef __MESON_RESET_CORE_H
> +#define __MESON_RESET_CORE_H
> +
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +
> +struct meson_reset_param {
> +	unsigned int reset_num;
> +	unsigned int reset_offset;
> +	unsigned int level_offset;
> +	bool level_low_reset;
> +};
> +
> +int meson_reset_probe(struct device *dev, struct regmap *map,
> +		      const struct meson_reset_param *param);
> +
> +#endif /* __MESON_RESET_CORE_H */

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
