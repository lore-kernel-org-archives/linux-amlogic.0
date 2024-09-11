Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D418EE4990
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Sep 2024 10:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4KCYmF+DCuE8TuOzOu/QxDhBhFQziAGTn0+UVGbTuJs=; b=TW7CyNZCapctAp/mhuTE+uKV9M
	1JEbXAYaFShI6+vdIisbm/rY6k9MMpZtTIaMosAzvv/i7ykDfl70sLSHdVnjyKQVEWt+nCWoqKLbe
	F3D2bTsw+/B7zYoOZVl5BfOnqJ2BY4RxRZynF2uBy3QOUC+KlzYPm4RYKgbeIyGYzQdjmAEtB6xZD
	QV15utzWhu8N0it1nVXJI4K2iQ68xeD/sMMbzRRAnKhwWc2PWdX4rzER7XCjV5kPQiuW3sbrVRIxQ
	MlvahrPqYckke5tycwDyMaKxNSOjQqIBeYhOq1LezAhG0gLOItyAux/oPKpAk+TPZ8oQwixR6EmcV
	cfJ9Lyiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKaL-000000095Yz-3DzG;
	Wed, 11 Sep 2024 10:28:29 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKWR-000000094jB-1E3s
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Sep 2024 10:24:28 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42cb2191107so29790675e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Sep 2024 03:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726050266; x=1726655066; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1p2Kghc9F07rZv6GeXN0Ax8XfKEuSrNMI56gggny5o=;
        b=Kp/wRPN4NrK/KRMhK9R1ciqINbghXw2rp0cPkJe2LfS6O04+6vcY1dYTGFjhC+5Zjs
         7LxkJhhCbFrPm7TEtG0JSpLfVzcxh2/A1tmUKI2Y4X1g1gxJBqeNiUXf0nDswYg7omwA
         WbT1YMPyKcvC4w3ARBG8+A5m9n5hfZJL1gbkBZ6O+0hy4kkiuJFgCMTXDy4Jq3n782n+
         rKq/yJwgz0wwAfRu4zHTqQv3u87MvVRR2Gk3DyGZ0FyqXzyTmlczQp8k0D8kLah4jbmn
         EOk1/+IFMuop272MKs46TrGk2Kfc950O6Nnr/4C1RQeAdqwjoquXsbfWriQGJsaXLXTc
         Keuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726050266; x=1726655066;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y1p2Kghc9F07rZv6GeXN0Ax8XfKEuSrNMI56gggny5o=;
        b=KKHc++wbWkBLYErWRvELBHFyRJsCcHhNqtbRlHac1phwKTxfkm+hQ4c2CqSH8CKlC9
         UpANwhDe3L+XhOwlBU1MZGT4hSfLH7ZZmatsUpFWFNbs2MSYhX0bkg18YZgR8DEBT8Bg
         nlHq9zwAGHWjutUVlOKdGMf69kFbkAdttTuKBcZJ6kjIBhtxIk7le8lXS2AfZy/HlMyK
         Cu6N2I6NN9eObLpUXNgTlxOKB8jWsevP00Ww1/8DieFjfpdV3jtGxF7NcwtzK6dUmuvF
         kL0C2W2YUX8k1gCrD8xEjkLGsoPAl0QbYhGi194cVIHwYljetEjyHxNAGCE9Xbs2a6ly
         m/vQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4b7pgbXUX2tpR+dGwHmNr2lpZmorCut+eOeYFNnRaV3P4MxJzVqxdR1VwaYEC2Zh0GLvT0cmJu4b0VGI9@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj+bX4uxIC4WyAKkrzmnPgFHoBqRh8WXJqGQZDBuZKBJ/PV096
	K6H2Gm54UgEcQ13JG8RpkS1RompT8nXtQqLsRuq7iTFdfsU8PttwUDP9ngmMTsM=
X-Google-Smtp-Source: AGHT+IEvw+TxASFreeZMqwmzYNJcmgZSNQyuyaRrF6/PT6JVBOGjSuvX9b5ao1/6FZHfc0zcaiAt7Q==
X-Received: by 2002:a05:600c:450b:b0:426:60b8:d8ba with SMTP id 5b1f17b1804b1-42cad87efc7mr102971705e9.28.1726050265347;
        Wed, 11 Sep 2024 03:24:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:1680:3625:e94b:7c21? ([2a01:e0a:982:cbb0:1680:3625:e94b:7c21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ccdb23c56sm20976745e9.4.2024.09.11.03.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 03:24:25 -0700 (PDT)
Message-ID: <fd4528df-c54a-4d85-81a9-dc711732df48@linaro.org>
Date: Wed, 11 Sep 2024 12:24:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 8/9] reset: amlogic: split the device core and platform
 probe
To: Jerome Brunet <jbrunet@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
 <20240910-meson-rst-aux-v5-8-60be62635d3e@baylibre.com>
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
In-Reply-To: <20240910-meson-rst-aux-v5-8-60be62635d3e@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_032427_386149_903EAB82 
X-CRM114-Status: GOOD (  25.00  )
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

On 10/09/2024 18:32, Jerome Brunet wrote:
> To prepare the addition of the auxiliary device support, split
> out the device coomon functions from the probe of the platform device.
> 
> The device core function will be common to both the platform and auxiliary
> driver.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/reset/amlogic/Kconfig              |   7 +-
>   drivers/reset/amlogic/Makefile             |   1 +
>   drivers/reset/amlogic/reset-meson-common.c | 121 ++++++++++++++++++++++++++++
>   drivers/reset/amlogic/reset-meson.c        | 122 ++++-------------------------
>   drivers/reset/amlogic/reset-meson.h        |  24 ++++++
>   5 files changed, 167 insertions(+), 108 deletions(-)
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
>   config RESET_MESON
>   	tristate "Meson Reset Driver"
>   	depends on ARCH_MESON || COMPILE_TEST
>   	default ARCH_MESON
>   	select REGMAP_MMIO
> +	select RESET_MESON_COMMON
>   	help
> -	  This enables the reset driver for Amlogic Meson SoCs.
> +	  This enables the reset driver for Amlogic SoCs.
>   
>   config RESET_MESON_AUDIO_ARB
>   	tristate "Meson Audio Memory Arbiter Reset Driver"
> diff --git a/drivers/reset/amlogic/Makefile b/drivers/reset/amlogic/Makefile
> index 55509fc78513..74aaa2fb5e13 100644
> --- a/drivers/reset/amlogic/Makefile
> +++ b/drivers/reset/amlogic/Makefile
> @@ -1,2 +1,3 @@
>   obj-$(CONFIG_RESET_MESON) += reset-meson.o
> +obj-$(CONFIG_RESET_MESON_COMMON) += reset-meson-common.o
>   obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
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
> +{
> +	struct meson_reset *data =
> +		container_of(rcdev, struct meson_reset, rcdev);
> +	unsigned int offset, bit;
> +
> +	meson_reset_offset_and_bit(data, id, &offset, &bit);
> +	offset += data->param->reset_offset;
> +
> +	return regmap_write(data->map, offset, BIT(bit));
> +}
> +
> +static int meson_reset_level(struct reset_controller_dev *rcdev,
> +			    unsigned long id, bool assert)
> +{
> +	struct meson_reset *data =
> +		container_of(rcdev, struct meson_reset, rcdev);
> +	unsigned int offset, bit;
> +
> +	meson_reset_offset_and_bit(data, id, &offset, &bit);
> +	offset += data->param->level_offset;
> +	assert ^= data->param->level_low_reset;
> +
> +	return regmap_update_bits(data->map, offset,
> +				  BIT(bit), assert ? BIT(bit) : 0);
> +}
> +
> +static int meson_reset_status(struct reset_controller_dev *rcdev,
> +			      unsigned long id)
> +{
> +	struct meson_reset *data =
> +		container_of(rcdev, struct meson_reset, rcdev);
> +	unsigned int val, offset, bit;
> +
> +	meson_reset_offset_and_bit(data, id, &offset, &bit);
> +	offset += data->param->level_offset;
> +
> +	regmap_read(data->map, offset, &val);
> +	val = !!(BIT(bit) & val);
> +
> +	return val ^ data->param->level_low_reset;
> +}
> +
> +static int meson_reset_assert(struct reset_controller_dev *rcdev,
> +			      unsigned long id)
> +{
> +	return meson_reset_level(rcdev, id, true);
> +}
> +
> +static int meson_reset_deassert(struct reset_controller_dev *rcdev,
> +				unsigned long id)
> +{
> +	return meson_reset_level(rcdev, id, false);
> +}
> +
> +static const struct reset_control_ops meson_reset_ops = {
> +	.reset		= meson_reset_reset,
> +	.assert		= meson_reset_assert,
> +	.deassert	= meson_reset_deassert,
> +	.status		= meson_reset_status,
> +};
> +
> +int meson_reset_controller_register(struct device *dev, struct regmap *map,
> +				    const struct meson_reset_param *param)
> +{
> +	struct meson_reset *data;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->param = param;
> +	data->map = map;
> +	data->rcdev.owner = dev->driver->owner;
> +	data->rcdev.nr_resets = param->reset_num;
> +	data->rcdev.ops = &meson_reset_ops;
> +	data->rcdev.of_node = dev->of_node;
> +
> +	return devm_reset_controller_register(dev, &data->rcdev);
> +}
> +EXPORT_SYMBOL_NS_GPL(meson_reset_controller_register, MESON_RESET);
> +
> +MODULE_DESCRIPTION("Amlogic Meson Reset Core function");
> +MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
> +MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
> +MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_IMPORT_NS(MESON_RESET);
> diff --git a/drivers/reset/amlogic/reset-meson.c b/drivers/reset/amlogic/reset-meson.c
> index af690d3012ec..feb19bf6da77 100644
> --- a/drivers/reset/amlogic/reset-meson.c
> +++ b/drivers/reset/amlogic/reset-meson.c
> @@ -2,106 +2,20 @@
>   /*
>    * Amlogic Meson Reset Controller driver
>    *
> - * Copyright (c) 2016 BayLibre, SAS.
> - * Author: Neil Armstrong <narmstrong@baylibre.com>
> + * Copyright (c) 2016-2024 BayLibre, SAS.
> + * Authors: Neil Armstrong <narmstrong@baylibre.com>
> + *          Jerome Brunet <jbrunet@baylibre.com>
>    */
> +
>   #include <linux/err.h>
> -#include <linux/init.h>
>   #include <linux/io.h>
>   #include <linux/of.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
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
> -
> -struct meson_reset {
> -	const struct meson_reset_param *param;
> -	struct reset_controller_dev rcdev;
> -	struct regmap *map;
> -};
> -
> -static void meson_reset_offset_and_bit(struct meson_reset *data,
> -				       unsigned long id,
> -				       unsigned int *offset,
> -				       unsigned int *bit)
> -{
> -	unsigned int stride = regmap_get_reg_stride(data->map);
> -
> -	*offset = (id / (stride * BITS_PER_BYTE)) * stride;
> -	*bit = id % (stride * BITS_PER_BYTE);
> -}
> -
> -static int meson_reset_reset(struct reset_controller_dev *rcdev,
> -			     unsigned long id)
> -{
> -	struct meson_reset *data =
> -		container_of(rcdev, struct meson_reset, rcdev);
> -	unsigned int offset, bit;
> -
> -	meson_reset_offset_and_bit(data, id, &offset, &bit);
> -	offset += data->param->reset_offset;
> -
> -	return regmap_write(data->map, offset, BIT(bit));
> -}
> -
> -static int meson_reset_level(struct reset_controller_dev *rcdev,
> -			    unsigned long id, bool assert)
> -{
> -	struct meson_reset *data =
> -		container_of(rcdev, struct meson_reset, rcdev);
> -	unsigned int offset, bit;
> -
> -	meson_reset_offset_and_bit(data, id, &offset, &bit);
> -	offset += data->param->level_offset;
> -	assert ^= data->param->level_low_reset;
>   
> -	return regmap_update_bits(data->map, offset,
> -				  BIT(bit), assert ? BIT(bit) : 0);
> -}
> -
> -static int meson_reset_status(struct reset_controller_dev *rcdev,
> -			      unsigned long id)
> -{
> -	struct meson_reset *data =
> -		container_of(rcdev, struct meson_reset, rcdev);
> -	unsigned int val, offset, bit;
> -
> -	meson_reset_offset_and_bit(data, id, &offset, &bit);
> -	offset += data->param->level_offset;
> -
> -	regmap_read(data->map, offset, &val);
> -	val = !!(BIT(bit) & val);
> -
> -	return val ^ data->param->level_low_reset;
> -}
> -
> -static int meson_reset_assert(struct reset_controller_dev *rcdev,
> -			      unsigned long id)
> -{
> -	return meson_reset_level(rcdev, id, true);
> -}
> -
> -static int meson_reset_deassert(struct reset_controller_dev *rcdev,
> -				unsigned long id)
> -{
> -	return meson_reset_level(rcdev, id, false);
> -}
> -
> -static const struct reset_control_ops meson_reset_ops = {
> -	.reset		= meson_reset_reset,
> -	.assert		= meson_reset_assert,
> -	.deassert	= meson_reset_deassert,
> -	.status		= meson_reset_status,
> -};
> +#include "reset-meson.h"
>   
>   static const struct meson_reset_param meson8b_param = {
>   	.reset_num	= 256,
> @@ -151,33 +65,25 @@ static const struct regmap_config regmap_config = {
>   
>   static int meson_reset_probe(struct platform_device *pdev)
>   {
> +	const struct meson_reset_param *param;
>   	struct device *dev = &pdev->dev;
> -	struct meson_reset *data;
> +	struct regmap *map;
>   	void __iomem *base;
>   
> -	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> -	if (!data)
> -		return -ENOMEM;
> -
>   	base = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(base))
>   		return PTR_ERR(base);
>   
> -	data->param = device_get_match_data(dev);
> -	if (!data->param)
> +	param = device_get_match_data(dev);
> +	if (!param)
>   		return -ENODEV;
>   
> -	data->map = devm_regmap_init_mmio(dev, base, &regmap_config);
> -	if (IS_ERR(data->map))
> -		return dev_err_probe(dev, PTR_ERR(data->map),
> +	map = devm_regmap_init_mmio(dev, base, &regmap_config);
> +	if (IS_ERR(map))
> +		return dev_err_probe(dev, PTR_ERR(map),
>   				     "can't init regmap mmio region\n");
>   
> -	data->rcdev.owner = THIS_MODULE;
> -	data->rcdev.nr_resets = data->param->reset_num;
> -	data->rcdev.ops = &meson_reset_ops;
> -	data->rcdev.of_node = dev->of_node;
> -
> -	return devm_reset_controller_register(dev, &data->rcdev);
> +	return meson_reset_controller_register(dev, map, param);
>   }
>   
>   static struct platform_driver meson_reset_driver = {
> @@ -191,4 +97,6 @@ module_platform_driver(meson_reset_driver);
>   
>   MODULE_DESCRIPTION("Amlogic Meson Reset Controller driver");
>   MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
> +MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
>   MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_IMPORT_NS(MESON_RESET);
> diff --git a/drivers/reset/amlogic/reset-meson.h b/drivers/reset/amlogic/reset-meson.h
> new file mode 100644
> index 000000000000..4e1dbd7569c5
> --- /dev/null
> +++ b/drivers/reset/amlogic/reset-meson.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
> +/*
> + * Copyright (c) 2024 BayLibre, SAS.
> + * Author: Jerome Brunet <jbrunet@baylibre.com>
> + */
> +
> +#ifndef __MESON_RESET_H
> +#define __MESON_RESET_H
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
> +int meson_reset_controller_register(struct device *dev, struct regmap *map,
> +				    const struct meson_reset_param *param);
> +
> +#endif /* __MESON_RESET_H */
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
