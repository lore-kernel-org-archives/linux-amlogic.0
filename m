Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E036C3DA4A
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Aug 2024 16:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSUq28T01UDIoXwtsrWz5Wk+KmJGCxEwNnJ8CYgr6Y8=; b=Xv3x3ujVGLAj63iBfkvO9QP0ft
	md5bQ+Gxkqwv1O6/aWsSpI9vxPDcT1NI28pEK1maD3llCZWGLnqLnYpgsMSwP5udkQZHga4KdU/3h
	+8+kZ2Y0QAv5WDiyeen4wqE5MCgEOUKeKIGsQd5RNaeanqR+g0Z+9ghPs69aYbWCXt7sDy0sQrECr
	sko1mZDCSFaPWDWyXiT259+Q/jdoU61bfffo40ezDamL7qodDs465rovbB/IYZ340Kbfkd4mr9Mqx
	43cFI9ujTJp/4k0n3K87Ygdhg5gGP0uCjNb5NTHuXiv+LZ7/1GqzXiSskoiP07mDQBCWvrnUFqnkG
	YOfSrotg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5Km-00000002Bzb-1x4b;
	Mon, 19 Aug 2024 16:34:20 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5KT-00000002Bwt-45o1
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Aug 2024 16:34:04 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-428119da952so36385305e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Aug 2024 09:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724085240; x=1724690040; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6TbNiYeotx4JMHFWDRCviKRIbCDiCXMgbxMfsVo33a4=;
        b=tFlk78N6LptUunTcBz2LMdmwI9Ts/Uoq9NmxwFtC3twmAiYS/+S0OcDPOPPjNVhmjN
         2ZtvwnQKnxrTPxSNil1Oex3qzoCHUhNvCZFXu4pqGqKrg8glKI8uPoqPz9gIMAaqRzjG
         MwdA8nEOEAgTPnfmbro54HgL9dohy4IkhIa952OnkWid6oBxrEFeizLqiYoHxf22LrWP
         CM7yYNgn7CA1yrV0dHT9HdMozXS8obn8bupEiL27BlH1Yo6MsjPnOT3xAvugFdlLLOE5
         QxhGZXd1yB4vGh/HZr3yeY4R0YrE47JvSfPIhEFnpmAxXL5ZExgDlWH3GFcbVFwUnMyK
         TkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724085240; x=1724690040;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6TbNiYeotx4JMHFWDRCviKRIbCDiCXMgbxMfsVo33a4=;
        b=QIAfdnApElMWQRCEyn8JHEBujVJvdMkiOkUTXCB8Re2FHpsZDQmy2d/Qs+kQQi3rEu
         eNgX55UuqW12D+pZ5g/6Wbe+zOoAbI8biJq+SVMCybsIs1tdfikXCX8I0C3F71g10GG2
         TrjNL1OPhYg3oz4+9hEmwQK+wE6Ce2D2srehDCx7o5Jk1AwZHywh7Iff0Ms9VE6h1v+N
         YmbwHbQb6gLmaThxnvGoMdnYrI545luSwQ/aXgLVmSahS2/5JRroRofpTufP5FxXNiax
         6HRHt3SkkkgpAbZOeiPZDaYdPjJbnuvSzGNAzcGNRo0fCnMMnu1Iw5XAq7Mg0eitIKwB
         +3Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXlwW04yDGq9yf01Jytnw/IjAGFoaub5w0WrNnk26dduQtlB4b+ezPFqS4egN5PnpBV4cJP/P2TvQicANh+meLS+EsqGptfWB7ZPkbSgCARETI=
X-Gm-Message-State: AOJu0YypEBOJAw6bsXSINElWSIWWAKEC3OKjBKvIRbe9Zh47prSOKtgP
	4uaoQmEv2V0Spa4IEQ3cRZ22yzi9/FlFbuzVFOX8qeBdVnmn6oO/z7QtzDjoyQeqAFKBqAJgDsf
	d
X-Google-Smtp-Source: AGHT+IGk3FqUsFgwKkMf1cqD0dnuYbpapf7NoI602tzg5cCA8u0y3gpvfviwf9cqCyTSuX8KgpbNew==
X-Received: by 2002:a05:600c:a45:b0:426:6edb:7e14 with SMTP id 5b1f17b1804b1-429ed7d34fdmr71034285e9.35.1724085239944;
        Mon, 19 Aug 2024 09:33:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727? ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898aa393sm10885172f8f.90.2024.08.19.09.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 09:33:59 -0700 (PDT)
Message-ID: <812c6ddc-1929-46c4-bac7-4bd0f5ccc213@linaro.org>
Date: Mon, 19 Aug 2024 18:33:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 8/9] reset: amlogic: split the device core and platform
 probe
To: Jerome Brunet <jbrunet@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
 <20240808102742.4095904-9-jbrunet@baylibre.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240808102742.4095904-9-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_093402_061850_E5235841 
X-CRM114-Status: GOOD (  28.42  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 08/08/2024 12:27, Jerome Brunet wrote:
> To prepare the addition of the auxiliary device support, split
> out the device core function from the probe of the platform device.
> 
> The device core function will be common to both the platform and auxiliary
> driver.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/reset/amlogic/Kconfig                 |  10 +-
>   drivers/reset/amlogic/Makefile                |   3 +-
>   .../{reset-meson.c => reset-meson-core.c}     | 101 +++---------------
>   drivers/reset/amlogic/reset-meson-pltf.c      |  92 ++++++++++++++++

Are we still in 1983 ? please use reset-meson-platform and drop pltf completely

>   drivers/reset/amlogic/reset-meson.h           |  24 +++++
>   5 files changed, 143 insertions(+), 87 deletions(-)
>   rename drivers/reset/amlogic/{reset-meson.c => reset-meson-core.c} (51%)
>   create mode 100644 drivers/reset/amlogic/reset-meson-pltf.c
>   create mode 100644 drivers/reset/amlogic/reset-meson.h
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
>   config RESET_MESON
> -	tristate "Meson Reset Driver"
> +	tristate "Meson Reset Platform Driver"
>   	depends on ARCH_MESON || COMPILE_TEST
>   	default ARCH_MESON
> +	select REGMAP_MMIO
> +	select RESET_MESON_CORE
>   	help
> -	  This enables the reset driver for Amlogic Meson SoCs.
> +	  This enables the reset platform driver for Amlogic SoCs.
>   
>   config RESET_MESON_AUDIO_ARB
>   	tristate "Meson Audio Memory Arbiter Reset Driver"
> diff --git a/drivers/reset/amlogic/Makefile b/drivers/reset/amlogic/Makefile
> index 55509fc78513..0f8f9121b566 100644
> --- a/drivers/reset/amlogic/Makefile
> +++ b/drivers/reset/amlogic/Makefile
> @@ -1,2 +1,3 @@
> -obj-$(CONFIG_RESET_MESON) += reset-meson.o
> +obj-$(CONFIG_RESET_MESON) += reset-meson-pltf.o
> +obj-$(CONFIG_RESET_MESON_CORE) += reset-meson-core.o
>   obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
> diff --git a/drivers/reset/amlogic/reset-meson.c b/drivers/reset/amlogic/reset-meson-core.c
> similarity index 51%
> rename from drivers/reset/amlogic/reset-meson.c
> rename to drivers/reset/amlogic/reset-meson-core.c
> index b16d9c32adb1..ea4fc562f7e6 100644
> --- a/drivers/reset/amlogic/reset-meson.c
> +++ b/drivers/reset/amlogic/reset-meson-core.c
> @@ -1,27 +1,17 @@
>   // SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
>   /*
> - * Amlogic Meson Reset Controller driver
> + * Amlogic Meson Reset core functions
>    *
> - * Copyright (c) 2016 BayLibre, SAS.
> - * Author: Neil Armstrong <narmstrong@baylibre.com>

Hmmm no, I'm still an author

> + * Copyright (c) 2024 BayLibre, SAS.

And Baylibre's Copyright is still from 2016, so use 2016-2024 in this case

> + * Author: Jerome Brunet <jbrunet@baylibre.com>
>    */
> -#include <linux/err.h>
> -#include <linux/init.h>
> -#include <linux/io.h>
> -#include <linux/of.h>
> +
> +#include <linux/device.h>
>   #include <linux/module.h>
> -#include <linux/platform_device.h>
>   #include <linux/regmap.h>
>   #include <linux/reset-controller.h>
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
>   struct meson_reset {
>   	const struct meson_reset_param *param;
> @@ -102,84 +92,27 @@ static const struct reset_control_ops meson_reset_ops = {
>   	.status		= meson_reset_status,
>   };
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
>   {
> -	struct device *dev = &pdev->dev;
>   	struct meson_reset *data;
> -	void __iomem *base;
>   
>   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>   	if (!data)
>   		return -ENOMEM;
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
>   	data->rcdev.ops = &meson_reset_ops;
>   	data->rcdev.of_node = dev->of_node;
>   
>   	return devm_reset_controller_register(dev, &data->rcdev);
>   }
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
>   MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
> -MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
> +MODULE_IMPORT_NS(MESON_RESET);
> diff --git a/drivers/reset/amlogic/reset-meson-pltf.c b/drivers/reset/amlogic/reset-meson-pltf.c
> new file mode 100644
> index 000000000000..97e933b4aa34
> --- /dev/null
> +++ b/drivers/reset/amlogic/reset-meson-pltf.c
> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Amlogic Meson Reset platform driver
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
> +	.probe	= meson_reset_pltf_probe,
> +	.driver = {
> +		.name		= "meson_reset",
> +		.of_match_table	= meson_reset_dt_ids,
> +	},
> +};
> +module_platform_driver(meson_reset_pltf_driver);
> +
> +MODULE_DESCRIPTION("Amlogic Meson Reset Platform Controller driver");
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


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
