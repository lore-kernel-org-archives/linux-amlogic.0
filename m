Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0C3C52D6F
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Aug 2024 16:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9mJGx8iuOVG0K9bBRB4vZingzB3ElBmSL0nywWF6xps=; b=arwRlVQeVxaFVi
	PEbc0JGhS2FOXWUbNj1bSPPo5xtHJgA8AepN22GOXKejrpl72kRcK1s9+aAP2LRcuB+OWmNYOHTpF
	5KDrjKvwF0/kO6XgjvTVv8uvaMR4yJBEl6UEamSZllmC5gAXnW+73do+znQbF+Yu6U8gKtMx9Czv4
	238PvZ0wGen+Kpecv7NQJEZ27FWiBy4iAQwivULIT0XrnvvU/9/GzBjmt9lojMR7puzkU3+XvAwPp
	IsjSvmpMoi+GJsq8F5FkgJWuu5QoHlbPg1/q591x+XfqtYImm+Wm4vIhQy3Gha85P0obtUxIqsQSq
	1XQEHeaP5l7LWpFUKphg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5jI-00000002Hpp-3fx5;
	Mon, 19 Aug 2024 16:59:40 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5ZJ-00000002ErJ-1eCe
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Aug 2024 16:49:23 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-371b098e699so1742952f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Aug 2024 09:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1724086159; x=1724690959; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sio7EcZBvhMrVmurBCEshWjdi1VcJUT2ygK9dXaZ6/0=;
        b=jMOAIa8B4uHu/kOoWM0fY+xOqD2cJXI6CdeEaPo3gz/EWCWHi0caBCfqxlbhyu49VU
         8hOk9dIED8YIOlj8hHAJ0DmKQnEVsg/Md9WnxXtwKZYCNJNqFVSSnT+AGD5Xl98wz2Cf
         apmk6F/tuUi2w/lBvuOL8HDBvn575nuXSRxL9nXIJ7PTc/5AlkXs9eUAJVSFxPgGhvHj
         PFVfBFDjhKylhV78ol/Zt8ujLqftYMwb94kOidxmO4NVVIDfd1axn1KANUHM1erPhODZ
         tdlRuXKBCVOvvBWhVd4Dn/vBr6EdNuDhQSaUmGjEIy+buGozLeLsJPIPBKffWkoEza41
         HERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724086159; x=1724690959;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sio7EcZBvhMrVmurBCEshWjdi1VcJUT2ygK9dXaZ6/0=;
        b=sxcM0MNqwLp5pCPYztuBz4gClKmWJreBGFVSyRiUtZow0tkuTJjdPeq2Hown2sfEOy
         c9ONySfjS87/ncYmafXcWJ/U/Fu3cnpWHrwAitSEq5g0z801mflUkE4DcGH/r+LLmZRs
         /qmWNPlid0iO+r4IZ4YUTwP5Im1ma9Cua6B+WrAdngL6wXcI5vjVMcIXcy84eXEWGZXJ
         KKgp+SXtopzImmj3eooGNj/b26dFEgBz8WD+gI8LdkyTNo29V3lr3kN1WtkcmKx2/dow
         Fx+uhE59j0KkNdgHO/SFf6Gse2+jmA4bVzM01hBOJV71BpKu8ai0z5SSRs/u/0HBXVRi
         4RMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXQCCGwDPWA0cOPa+AJ8VSOpg1IOPm+Ng9zP/OQpkgxqr5zmusG/fMrfXvEHoXRu+dpkOhf/lpgLrzNz09Bx6T9JiohlWcBGMQ6hy860kBR+o=
X-Gm-Message-State: AOJu0Yy+6TQW5pHb75nyEmQSqNTqpJzNisGKpQoLbvo57TAZulYG6IKm
	KqeKpBFHmGC+Xkztce2mIIBMzRrSVnk4Zvz/Fb5PiKHnJUX1hQXvk0S25mHYws0=
X-Google-Smtp-Source: AGHT+IG9SCmqztz/GPkBbt+X9itkCSqB56ynsjcfSAB2JT0ZUQq+946cPo0gChjft5vwSw7Zfk9k5A==
X-Received: by 2002:a5d:4532:0:b0:36b:c305:5902 with SMTP id ffacd0b85a97d-3719432b55dmr9795462f8f.17.1724086158655;
        Mon, 19 Aug 2024 09:49:18 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:db8f:43f4:9b2e:fb1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37195650163sm8911596f8f.98.2024.08.19.09.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 09:49:18 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,  Stephen Boyd
 <sboyd@kernel.org>,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 8/9] reset: amlogic: split the device core and
 platform probe
In-Reply-To: <812c6ddc-1929-46c4-bac7-4bd0f5ccc213@linaro.org> (Neil
	Armstrong's message of "Mon, 19 Aug 2024 18:33:58 +0200")
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
	<20240808102742.4095904-9-jbrunet@baylibre.com>
	<812c6ddc-1929-46c4-bac7-4bd0f5ccc213@linaro.org>
Date: Mon, 19 Aug 2024 18:49:17 +0200
Message-ID: <1jsev0wj8y.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_094921_483142_B593771E 
X-CRM114-Status: GOOD (  25.79  )
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

On Mon 19 Aug 2024 at 18:33, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> On 08/08/2024 12:27, Jerome Brunet wrote:
>> To prepare the addition of the auxiliary device support, split
>> out the device core function from the probe of the platform device.
>> The device core function will be common to both the platform and
>> auxiliary
>> driver.
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>   drivers/reset/amlogic/Kconfig                 |  10 +-
>>   drivers/reset/amlogic/Makefile                |   3 +-
>>   .../{reset-meson.c => reset-meson-core.c}     | 101 +++---------------
>>   drivers/reset/amlogic/reset-meson-pltf.c      |  92 ++++++++++++++++
>
> Are we still in 1983 ?

I don't quite get that remark or how it is helping the review.

> please use reset-meson-platform and drop pltf completely

You are requesting auxiliary -> aux on the patch.
So which one will it be ?

>
>>   drivers/reset/amlogic/reset-meson.h           |  24 +++++
>>   5 files changed, 143 insertions(+), 87 deletions(-)
>>   rename drivers/reset/amlogic/{reset-meson.c => reset-meson-core.c} (51%)
>>   create mode 100644 drivers/reset/amlogic/reset-meson-pltf.c
>>   create mode 100644 drivers/reset/amlogic/reset-meson.h
>> diff --git a/drivers/reset/amlogic/Kconfig
>> b/drivers/reset/amlogic/Kconfig
>> index 7ed9cf50f038..04c7be0f3165 100644
>> --- a/drivers/reset/amlogic/Kconfig
>> +++ b/drivers/reset/amlogic/Kconfig
>> @@ -1,9 +1,15 @@
>> +config RESET_MESON_CORE
>> +	tristate
>> +	select REGMAP
>> +
>>   config RESET_MESON
>> -	tristate "Meson Reset Driver"
>> +	tristate "Meson Reset Platform Driver"
>>   	depends on ARCH_MESON || COMPILE_TEST
>>   	default ARCH_MESON
>> +	select REGMAP_MMIO
>> +	select RESET_MESON_CORE
>>   	help
>> -	  This enables the reset driver for Amlogic Meson SoCs.
>> +	  This enables the reset platform driver for Amlogic SoCs.
>>     config RESET_MESON_AUDIO_ARB
>>   	tristate "Meson Audio Memory Arbiter Reset Driver"
>> diff --git a/drivers/reset/amlogic/Makefile b/drivers/reset/amlogic/Makefile
>> index 55509fc78513..0f8f9121b566 100644
>> --- a/drivers/reset/amlogic/Makefile
>> +++ b/drivers/reset/amlogic/Makefile
>> @@ -1,2 +1,3 @@
>> -obj-$(CONFIG_RESET_MESON) += reset-meson.o
>> +obj-$(CONFIG_RESET_MESON) += reset-meson-pltf.o
>> +obj-$(CONFIG_RESET_MESON_CORE) += reset-meson-core.o
>>   obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
>> diff --git a/drivers/reset/amlogic/reset-meson.c b/drivers/reset/amlogic/reset-meson-core.c
>> similarity index 51%
>> rename from drivers/reset/amlogic/reset-meson.c
>> rename to drivers/reset/amlogic/reset-meson-core.c
>> index b16d9c32adb1..ea4fc562f7e6 100644
>> --- a/drivers/reset/amlogic/reset-meson.c
>> +++ b/drivers/reset/amlogic/reset-meson-core.c
>> @@ -1,27 +1,17 @@
>>   // SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
>>   /*
>> - * Amlogic Meson Reset Controller driver
>> + * Amlogic Meson Reset core functions
>>    *
>> - * Copyright (c) 2016 BayLibre, SAS.
>> - * Author: Neil Armstrong <narmstrong@baylibre.com>
>
> Hmmm no, I'm still an author
>
>> + * Copyright (c) 2024 BayLibre, SAS.
>
> And Baylibre's Copyright is still from 2016, so use 2016-2024 in this case
>
>> + * Author: Jerome Brunet <jbrunet@baylibre.com>
>>    */
>> -#include <linux/err.h>
>> -#include <linux/init.h>
>> -#include <linux/io.h>
>> -#include <linux/of.h>
>> +
>> +#include <linux/device.h>
>>   #include <linux/module.h>
>> -#include <linux/platform_device.h>
>>   #include <linux/regmap.h>
>>   #include <linux/reset-controller.h>
>> -#include <linux/slab.h>
>> -#include <linux/types.h>
>> -
>> -struct meson_reset_param {
>> -	unsigned int reset_num;
>> -	unsigned int reset_offset;
>> -	unsigned int level_offset;
>> -	bool level_low_reset;
>> -};
>> +
>> +#include "reset-meson.h"
>>     struct meson_reset {
>>   	const struct meson_reset_param *param;
>> @@ -102,84 +92,27 @@ static const struct reset_control_ops meson_reset_ops = {
>>   	.status		= meson_reset_status,
>>   };
>>   -static const struct meson_reset_param meson8b_param = {
>> -	.reset_num	= 256,
>> -	.reset_offset	= 0x0,
>> -	.level_offset	= 0x7c,
>> -	.level_low_reset = true,
>> -};
>> -
>> -static const struct meson_reset_param meson_a1_param = {
>> -	.reset_num	= 96,
>> -	.reset_offset	= 0x0,
>> -	.level_offset	= 0x40,
>> -	.level_low_reset = true,
>> -};
>> -
>> -static const struct meson_reset_param meson_s4_param = {
>> -	.reset_num	= 192,
>> -	.reset_offset	= 0x0,
>> -	.level_offset	= 0x40,
>> -	.level_low_reset = true,
>> -};
>> -
>> -static const struct of_device_id meson_reset_dt_ids[] = {
>> -	 { .compatible = "amlogic,meson8b-reset",    .data = &meson8b_param},
>> -	 { .compatible = "amlogic,meson-gxbb-reset", .data = &meson8b_param},
>> -	 { .compatible = "amlogic,meson-axg-reset",  .data = &meson8b_param},
>> -	 { .compatible = "amlogic,meson-a1-reset",   .data = &meson_a1_param},
>> -	 { .compatible = "amlogic,meson-s4-reset",   .data = &meson_s4_param},
>> -	 { .compatible = "amlogic,c3-reset",   .data = &meson_s4_param},
>> -	 { /* sentinel */ },
>> -};
>> -MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);
>> -
>> -static const struct regmap_config regmap_config = {
>> -	.reg_bits   = 32,
>> -	.val_bits   = 32,
>> -	.reg_stride = 4,
>> -};
>> -
>> -static int meson_reset_probe(struct platform_device *pdev)
>> +int meson_reset_probe(struct device *dev, struct regmap *map,
>> +		      const struct meson_reset_param *param)
>>   {
>> -	struct device *dev = &pdev->dev;
>>   	struct meson_reset *data;
>> -	void __iomem *base;
>>     	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>>   	if (!data)
>>   		return -ENOMEM;
>>   -	base = devm_platform_ioremap_resource(pdev, 0);
>> -	if (IS_ERR(base))
>> -		return PTR_ERR(base);
>> -
>> -	data->param = device_get_match_data(dev);
>> -	if (!data->param)
>> -		return -ENODEV;
>> -
>> -	data->map = devm_regmap_init_mmio(dev, base, &regmap_config);
>> -	if (IS_ERR(data->map))
>> -		return dev_err_probe(dev, PTR_ERR(data->map),
>> -				     "can't init regmap mmio region\n");
>> -
>> -	data->rcdev.owner = THIS_MODULE;
>> -	data->rcdev.nr_resets = data->param->reset_num;
>> +	data->param = param;
>> +	data->map = map;
>> +	data->rcdev.owner = dev->driver->owner;
>> +	data->rcdev.nr_resets = param->reset_num;
>>   	data->rcdev.ops = &meson_reset_ops;
>>   	data->rcdev.of_node = dev->of_node;
>>     	return devm_reset_controller_register(dev, &data->rcdev);
>>   }
>> +EXPORT_SYMBOL_NS_GPL(meson_reset_probe, MESON_RESET);
>>   -static struct platform_driver meson_reset_driver = {
>> -	.probe	= meson_reset_probe,
>> -	.driver = {
>> -		.name		= "meson_reset",
>> -		.of_match_table	= meson_reset_dt_ids,
>> -	},
>> -};
>> -module_platform_driver(meson_reset_driver);
>> -
>> -MODULE_DESCRIPTION("Amlogic Meson Reset Controller driver");
>> +MODULE_DESCRIPTION("Amlogic Meson Reset Core function");
>>   MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
>> -MODULE_LICENSE("Dual BSD/GPL");
>> +MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
>> +MODULE_IMPORT_NS(MESON_RESET);
>> diff --git a/drivers/reset/amlogic/reset-meson-pltf.c b/drivers/reset/amlogic/reset-meson-pltf.c
>> new file mode 100644
>> index 000000000000..97e933b4aa34
>> --- /dev/null
>> +++ b/drivers/reset/amlogic/reset-meson-pltf.c
>> @@ -0,0 +1,92 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
>> +/*
>> + * Amlogic Meson Reset platform driver
>> + *
>> + * Copyright (c) 2016 BayLibre, SAS.
>> + * Author: Neil Armstrong <narmstrong@baylibre.com>
>> + */
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/of.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/reset-controller.h>
>> +
>> +#include "reset-meson.h"
>> +
>> +static const struct meson_reset_param meson8b_param = {
>> +	.reset_num	= 256,
>> +	.reset_offset	= 0x0,
>> +	.level_offset	= 0x7c,
>> +	.level_low_reset = true,
>> +};
>> +
>> +static const struct meson_reset_param meson_a1_param = {
>> +	.reset_num	= 96,
>> +	.reset_offset	= 0x0,
>> +	.level_offset	= 0x40,
>> +	.level_low_reset = true,
>> +};
>> +
>> +static const struct meson_reset_param meson_s4_param = {
>> +	.reset_num	= 192,
>> +	.reset_offset	= 0x0,
>> +	.level_offset	= 0x40,
>> +	.level_low_reset = true,
>> +};
>> +
>> +static const struct of_device_id meson_reset_dt_ids[] = {
>> +	 { .compatible = "amlogic,meson8b-reset",    .data = &meson8b_param},
>> +	 { .compatible = "amlogic,meson-gxbb-reset", .data = &meson8b_param},
>> +	 { .compatible = "amlogic,meson-axg-reset",  .data = &meson8b_param},
>> +	 { .compatible = "amlogic,meson-a1-reset",   .data = &meson_a1_param},
>> +	 { .compatible = "amlogic,meson-s4-reset",   .data = &meson_s4_param},
>> +	 { .compatible = "amlogic,c3-reset",   .data = &meson_s4_param},
>> +	 { /* sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);
>> +
>> +static const struct regmap_config regmap_config = {
>> +	.reg_bits   = 32,
>> +	.val_bits   = 32,
>> +	.reg_stride = 4,
>> +};
>> +
>> +static int meson_reset_pltf_probe(struct platform_device *pdev)
>> +{
>> +	const struct meson_reset_param *param;
>> +	struct device *dev = &pdev->dev;
>> +	struct regmap *map;
>> +	void __iomem *base;
>> +
>> +	base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(base))
>> +		return PTR_ERR(base);
>> +
>> +	param = device_get_match_data(dev);
>> +	if (!param)
>> +		return -ENODEV;
>> +
>> +	map = devm_regmap_init_mmio(dev, base, &regmap_config);
>> +	if (IS_ERR(map))
>> +		return dev_err_probe(dev, PTR_ERR(map),
>> +				     "can't init regmap mmio region\n");
>> +
>> +	return meson_reset_probe(dev, map, param);
>> +}
>> +
>> +static struct platform_driver meson_reset_pltf_driver = {
>> +	.probe	= meson_reset_pltf_probe,
>> +	.driver = {
>> +		.name		= "meson_reset",
>> +		.of_match_table	= meson_reset_dt_ids,
>> +	},
>> +};
>> +module_platform_driver(meson_reset_pltf_driver);
>> +
>> +MODULE_DESCRIPTION("Amlogic Meson Reset Platform Controller driver");
>> +MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
>> +MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
>> +MODULE_LICENSE("Dual BSD/GPL");
>> +MODULE_IMPORT_NS(MESON_RESET);
>> diff --git a/drivers/reset/amlogic/reset-meson.h b/drivers/reset/amlogic/reset-meson.h
>> new file mode 100644
>> index 000000000000..c2e8a5cf2e46
>> --- /dev/null
>> +++ b/drivers/reset/amlogic/reset-meson.h
>> @@ -0,0 +1,24 @@
>> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
>> +/*
>> + * Copyright (c) 2024 BayLibre, SAS.
>> + * Author: Jerome Brunet <jbrunet@baylibre.com>
>> + */
>> +
>> +#ifndef __MESON_RESET_CORE_H
>> +#define __MESON_RESET_CORE_H
>> +
>> +#include <linux/module.h>
>> +#include <linux/regmap.h>
>> +#include <linux/reset-controller.h>
>> +
>> +struct meson_reset_param {
>> +	unsigned int reset_num;
>> +	unsigned int reset_offset;
>> +	unsigned int level_offset;
>> +	bool level_low_reset;
>> +};
>> +
>> +int meson_reset_probe(struct device *dev, struct regmap *map,
>> +		      const struct meson_reset_param *param);
>> +
>> +#endif /* __MESON_RESET_CORE_H */

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
