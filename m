Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46B1C4345F
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Apr 2024 07:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D1QLZcY3AbhqEZcpv1QHEKgYxFQVmaIDrLbDuBc8EFk=; b=otfUmXDDyaKZmb
	bSCch2URgAnUZ0jUaufvkm+v+Gt5YHHbGZRKCgPUVLIx/xYQCQ1Ntg0Jqdu7vWAFSDD+rc7szID48
	1XKQkIsceHTWEWBYVZ5UeSC0WehXhj1400aZSf7hflmPoWq2WqdO7VoftHrQ4m6a6p6zD+QmEOdjM
	g3plcQCDOC9iyJqiU+nVR8GYyY+24y3psfcYQbxUIViGwhyI0F+z9m0N8J93AcHymK3V378eAgFrM
	0H4vNkeyxvKZiArrxc8wG9g8KClBmjCgtjrCBhHZCjm9xsfpRnBpOWKwuZBdV1d0qux0dlN6DEEOc
	N/p1wyulDaBr7aE1i3vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryoUP-0000000CWOQ-0oKv;
	Mon, 22 Apr 2024 07:53:25 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryoUL-0000000CWH3-1llL
	for linux-amlogic@lists.infradead.org;
	Mon, 22 Apr 2024 07:53:23 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-41a5b68ed5cso5476575e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 22 Apr 2024 00:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713772383; x=1714377183; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=4jGjfwgF7TyQMRv12TtcmSPfCodeSwoGNJ55HvwtMeQ=;
        b=vnYBls1y/km8QXkYYVa44UdBqaYJkwt8K+Z/dIoiUeAIuoYxbXT420orsSH0nylCHO
         ZegkTB76gyzs0dIyWAK1cRUFT5KLdfh/CO/tk8C1w1xgSnkagyd9kNN7g+u8vmDP4u98
         acbPv7Ub/dw+D3gsiexAsyGrcPZkYrR2yisvguivqJvFRcF5Zf2m9eYcMVTAvEL9choW
         AvX1A/e3+AcOJam6aL+vN2nC0yJIMaPJmHIIhVbTv+gcse4Gl4YEvl7v9Q6aTQE+5wCj
         C3QKr/XQsw8tswAlCGVawAGER1o0RdGSrZh4TKh4wIwe2kA5mYZcUYDDpSYiK2tl5L03
         bF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713772383; x=1714377183;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jGjfwgF7TyQMRv12TtcmSPfCodeSwoGNJ55HvwtMeQ=;
        b=FTsXVrjKF+G4kkPObdcdcNg0a/mlqZ6ZoLjCroNzhBxcmjLnVzowpRY/4+HJp1Rszy
         VxTfII/WtQyl5WMLonWqn4WEkxrY6UiXBwhrSf8VFKlvlq6grUktMNHSmpoyQrL7T7Xq
         C9JKwUXt751xkvPeCd1VABi3uQquxSGPp4m5w0iBbeNte9GaES44odwYv2r30iVHKY1W
         fOtMfMcUiXe34PogA+9oOTnZHLTtk+75wpBw0lA2ipro0GgDmH8WSjPIJN5ZyyIdhYoa
         cVUFvAe5xESz/z3kbC8Ap21fSNDPS+mhDSf/ugJCV0NU5/IEsmRxSq0PXFdkK6aHjcdh
         /6Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVO+7gVj7sWy/yePSjH3WKt8EllwA8Ql74kFB77CZraoviJLJ2kxyw366UcxIpCXLl/Acqw7Im2H/VIR7X/RHW0WneJzYCh60xNpl03qlM/IYA=
X-Gm-Message-State: AOJu0YyC8JvGnlvio2wakoHcTR9OpVxi6fvxKIo6P5rpeHYsGT7V+jrI
	0rP1BcjmdV+FbKxOTsQpOcCL1KSdLgXs6/hEwgMdVxuwJrq8Eorz6xt9kyDAArk=
X-Google-Smtp-Source: AGHT+IHnAHq7UbeP632AWGtLrRm4Wi/yaGG11GCMmRkMCaECGE9BPz64Y0OIYfXnkIPNFYWuZajQaw==
X-Received: by 2002:a05:600c:45ca:b0:41a:66b1:3922 with SMTP id s10-20020a05600c45ca00b0041a66b13922mr948452wmo.19.1713772382759;
        Mon, 22 Apr 2024 00:53:02 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a619:ccb0:5f40:262c])
        by smtp.gmail.com with ESMTPSA id j13-20020a05600c190d00b00418a386c17bsm19450021wmq.12.2024.04.22.00.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 00:53:02 -0700 (PDT)
References: <20240419125812.983409-1-jan.dakinevich@salutedevices.com>
 <20240419125812.983409-2-jan.dakinevich@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, Michael  Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob  Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor  Dooley <conor+dt@kernel.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin  Blumenstingl
 <martin.blumenstingl@googlemail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jiucheng Xu <jiucheng.xu@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH v3 1/6] reset: reset-meson-audio: introduce separate
 driver
Date: Mon, 22 Apr 2024 09:46:50 +0200
In-reply-to: <20240419125812.983409-2-jan.dakinevich@salutedevices.com>
Message-ID: <1j8r15bzqa.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_005321_529287_7B4835D6 
X-CRM114-Status: GOOD (  34.46  )
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


On Fri 19 Apr 2024 at 15:58, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> Typically, Amlogic Meson SoCs have a couple a reset registers lost in
> middle of audio clock controller. Reset controller on top of them was
> implemented inside audio clock controller driver. This patch moves reset
> functionality of this controller to auxiliary driver. There are at least
> two reasons for this:
>
>   - architecturally it is more convenient;
>
>   - reusing the code of reset controller for new SoCs becomes easier.
>
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  drivers/clk/meson/Kconfig               |   2 +
>  drivers/clk/meson/axg-audio.c           | 106 +------------
>  drivers/reset/Kconfig                   |   7 +
>  drivers/reset/Makefile                  |   1 +
>  drivers/reset/reset-meson-audio.c       | 197 ++++++++++++++++++++++++
>  include/soc/amlogic/meson-audio-reset.h |  10 ++

You must an effort to touch a single subsystem per series.
Making a series about a single subsystem makes like a lot easier for
maintainers. clk, reset and dt and different subsystems

That constraints relaxed for RFCs but mixing subsystems within a single
patch is a red flag, unless you really have a good reason ... and you
don't have one here.

Nothing blocks introducting support in reset, then use it in clocks.

You could also have allowed a bit more time before reposting since I
said I would look at the reset issue.

I doubt introducing a separate driver for this is required since since
the current amlogic reset driver is fairly close.

>  6 files changed, 224 insertions(+), 99 deletions(-)
>  create mode 100644 drivers/reset/reset-meson-audio.c
>  create mode 100644 include/soc/amlogic/meson-audio-reset.h
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 29ffd14d267b..33614f8b8cf7 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -101,6 +101,8 @@ config COMMON_CLK_AXG_AUDIO
>  	select COMMON_CLK_MESON_PHASE
>  	select COMMON_CLK_MESON_SCLK_DIV
>  	select COMMON_CLK_MESON_CLKC_UTILS
> +	select RESET_CONTROLLER
> +	select RESET_MESON_AUDIO
>  	select REGMAP_MMIO
>  	help
>  	  Support for the audio clock controller on AmLogic A113D devices,
> diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
> index ac3482960903..9cd6b5c3aa7e 100644
> --- a/drivers/clk/meson/axg-audio.c
> +++ b/drivers/clk/meson/axg-audio.c
> @@ -12,9 +12,10 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
> -#include <linux/reset-controller.h>
>  #include <linux/slab.h>
>  
> +#include <soc/amlogic/meson-audio-reset.h>
> +
>  #include "meson-clkc-utils.h"
>  #include "axg-audio.h"
>  #include "clk-regmap.h"
> @@ -1648,84 +1649,6 @@ static struct clk_regmap *const sm1_clk_regmaps[] = {
>  	&sm1_sysclk_b_en,
>  };
>  
> -struct axg_audio_reset_data {
> -	struct reset_controller_dev rstc;
> -	struct regmap *map;
> -	unsigned int offset;
> -};
> -
> -static void axg_audio_reset_reg_and_bit(struct axg_audio_reset_data *rst,
> -					unsigned long id,
> -					unsigned int *reg,
> -					unsigned int *bit)
> -{
> -	unsigned int stride = regmap_get_reg_stride(rst->map);
> -
> -	*reg = (id / (stride * BITS_PER_BYTE)) * stride;
> -	*reg += rst->offset;
> -	*bit = id % (stride * BITS_PER_BYTE);
> -}
> -
> -static int axg_audio_reset_update(struct reset_controller_dev *rcdev,
> -				unsigned long id, bool assert)
> -{
> -	struct axg_audio_reset_data *rst =
> -		container_of(rcdev, struct axg_audio_reset_data, rstc);
> -	unsigned int offset, bit;
> -
> -	axg_audio_reset_reg_and_bit(rst, id, &offset, &bit);
> -
> -	regmap_update_bits(rst->map, offset, BIT(bit),
> -			assert ? BIT(bit) : 0);
> -
> -	return 0;
> -}
> -
> -static int axg_audio_reset_status(struct reset_controller_dev *rcdev,
> -				unsigned long id)
> -{
> -	struct axg_audio_reset_data *rst =
> -		container_of(rcdev, struct axg_audio_reset_data, rstc);
> -	unsigned int val, offset, bit;
> -
> -	axg_audio_reset_reg_and_bit(rst, id, &offset, &bit);
> -
> -	regmap_read(rst->map, offset, &val);
> -
> -	return !!(val & BIT(bit));
> -}
> -
> -static int axg_audio_reset_assert(struct reset_controller_dev *rcdev,
> -				unsigned long id)
> -{
> -	return axg_audio_reset_update(rcdev, id, true);
> -}
> -
> -static int axg_audio_reset_deassert(struct reset_controller_dev *rcdev,
> -				unsigned long id)
> -{
> -	return axg_audio_reset_update(rcdev, id, false);
> -}
> -
> -static int axg_audio_reset_toggle(struct reset_controller_dev *rcdev,
> -				unsigned long id)
> -{
> -	int ret;
> -
> -	ret = axg_audio_reset_assert(rcdev, id);
> -	if (ret)
> -		return ret;
> -
> -	return axg_audio_reset_deassert(rcdev, id);
> -}
> -
> -static const struct reset_control_ops axg_audio_rstc_ops = {
> -	.assert = axg_audio_reset_assert,
> -	.deassert = axg_audio_reset_deassert,
> -	.reset = axg_audio_reset_toggle,
> -	.status = axg_audio_reset_status,
> -};
> -
>  static const struct regmap_config axg_audio_regmap_cfg = {
>  	.reg_bits	= 32,
>  	.val_bits	= 32,
> @@ -1737,15 +1660,13 @@ struct audioclk_data {
>  	struct clk_regmap *const *regmap_clks;
>  	unsigned int regmap_clk_num;
>  	struct meson_clk_hw_data hw_clks;
> -	unsigned int reset_offset;
> -	unsigned int reset_num;
> +	const char *reset_name;
>  };
>  
>  static int axg_audio_clkc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	const struct audioclk_data *data;
> -	struct axg_audio_reset_data *rst;
>  	struct regmap *map;
>  	void __iomem *regs;
>  	struct clk_hw *hw;
> @@ -1804,21 +1725,10 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	/* Stop here if there is no reset */
> -	if (!data->reset_num)
> +	if (!data->reset_name)
>  		return 0;
>  
> -	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
> -	if (!rst)
> -		return -ENOMEM;
> -
> -	rst->map = map;
> -	rst->offset = data->reset_offset;
> -	rst->rstc.nr_resets = data->reset_num;
> -	rst->rstc.ops = &axg_audio_rstc_ops;
> -	rst->rstc.of_node = dev->of_node;
> -	rst->rstc.owner = THIS_MODULE;
> -
> -	return devm_reset_controller_register(dev, &rst->rstc);
> +	return meson_audio_reset_register(dev, data->reset_name);
>  }
>  
>  static const struct audioclk_data axg_audioclk_data = {
> @@ -1837,8 +1747,7 @@ static const struct audioclk_data g12a_audioclk_data = {
>  		.hws = g12a_audio_hw_clks,
>  		.num = ARRAY_SIZE(g12a_audio_hw_clks),
>  	},
> -	.reset_offset = AUDIO_SW_RESET,
> -	.reset_num = 26,
> +	.reset_name = "g12a",
>  };
>  
>  static const struct audioclk_data sm1_audioclk_data = {
> @@ -1848,8 +1757,7 @@ static const struct audioclk_data sm1_audioclk_data = {
>  		.hws = sm1_audio_hw_clks,
>  		.num = ARRAY_SIZE(sm1_audio_hw_clks),
>  	},
> -	.reset_offset = AUDIO_SM1_SW_RESET0,
> -	.reset_num = 39,
> +	.reset_name = "sm1",
>  };
>  
>  static const struct of_device_id clkc_match_table[] = {
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 7112f5932609..98106694566f 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -138,6 +138,13 @@ config RESET_MESON
>  	help
>  	  This enables the reset driver for Amlogic Meson SoCs.
>  
> +config RESET_MESON_AUDIO
> +	tristate "Meson Audio Reset Driver"
> +	depends on ARCH_MESON || COMPILE_TEST
> +	select AUXILIARY_BUS
> +	help
> +	  This enables the audio reset driver for Amlogic Meson SoCs.
> +
>  config RESET_MESON_AUDIO_ARB
>  	tristate "Meson Audio Memory Arbiter Reset Driver"
>  	depends on ARCH_MESON || COMPILE_TEST
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index fd8b49fa46fc..8ee7a57ccf03 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
>  obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
>  obj-$(CONFIG_RESET_MCHP_SPARX5) += reset-microchip-sparx5.o
>  obj-$(CONFIG_RESET_MESON) += reset-meson.o
> +obj-$(CONFIG_RESET_MESON_AUDIO) += reset-meson-audio.o
>  obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
>  obj-$(CONFIG_RESET_NPCM) += reset-npcm.o
>  obj-$(CONFIG_RESET_NUVOTON_MA35D1) += reset-ma35d1.o
> diff --git a/drivers/reset/reset-meson-audio.c b/drivers/reset/reset-meson-audio.c
> new file mode 100644
> index 000000000000..aaea9931cfe2
> --- /dev/null
> +++ b/drivers/reset/reset-meson-audio.c
> @@ -0,0 +1,197 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2018 BayLibre, SAS.
> + * Author: Jerome Brunet <jbrunet@baylibre.com>
> + */
> +
> +#include <linux/regmap.h>
> +#include <linux/auxiliary_bus.h>
> +#include <linux/reset-controller.h>
> +
> +#include <soc/amlogic/meson-audio-reset.h>
> +
> +struct meson_audio_reset_data {
> +	struct reset_controller_dev rstc;
> +	struct regmap *map;
> +	unsigned int offset;
> +};
> +
> +struct meson_audio_reset_info {
> +	unsigned int reset_offset;
> +	unsigned int reset_num;
> +};
> +
> +static void meson_audio_reset_reg_and_bit(struct meson_audio_reset_data *rst,
> +					  unsigned long id,
> +					  unsigned int *reg,
> +					  unsigned int *bit)
> +{
> +	unsigned int stride = regmap_get_reg_stride(rst->map);
> +
> +	*reg = (id / (stride * BITS_PER_BYTE)) * stride;
> +	*reg += rst->offset;
> +	*bit = id % (stride * BITS_PER_BYTE);
> +}
> +
> +static int meson_audio_reset_update(struct reset_controller_dev *rcdev,
> +				    unsigned long id, bool assert)
> +{
> +	struct meson_audio_reset_data *rst =
> +		container_of(rcdev, struct meson_audio_reset_data, rstc);
> +	unsigned int offset, bit;
> +
> +	meson_audio_reset_reg_and_bit(rst, id, &offset, &bit);
> +
> +	regmap_update_bits(rst->map, offset, BIT(bit),
> +			assert ? BIT(bit) : 0);
> +
> +	return 0;
> +}
> +
> +static int meson_audio_reset_status(struct reset_controller_dev *rcdev,
> +				    unsigned long id)
> +{
> +	struct meson_audio_reset_data *rst =
> +		container_of(rcdev, struct meson_audio_reset_data, rstc);
> +	unsigned int val, offset, bit;
> +
> +	meson_audio_reset_reg_and_bit(rst, id, &offset, &bit);
> +
> +	regmap_read(rst->map, offset, &val);
> +
> +	return !!(val & BIT(bit));
> +}
> +
> +static int meson_audio_reset_assert(struct reset_controller_dev *rcdev,
> +				    unsigned long id)
> +{
> +	return meson_audio_reset_update(rcdev, id, true);
> +}
> +
> +static int meson_audio_reset_deassert(struct reset_controller_dev *rcdev,
> +				      unsigned long id)
> +{
> +	return meson_audio_reset_update(rcdev, id, false);
> +}
> +
> +static int meson_audio_reset_toggle(struct reset_controller_dev *rcdev,
> +				    unsigned long id)
> +{
> +	int ret;
> +
> +	ret = meson_audio_reset_assert(rcdev, id);
> +	if (ret)
> +		return ret;
> +
> +	return meson_audio_reset_deassert(rcdev, id);
> +}
> +
> +static const struct reset_control_ops meson_audio_reset_ops = {
> +	.assert = meson_audio_reset_assert,
> +	.deassert = meson_audio_reset_deassert,
> +	.reset = meson_audio_reset_toggle,
> +	.status = meson_audio_reset_status,
> +};
> +
> +static int meson_audio_reset_probe(struct auxiliary_device *adev,
> +				  const struct auxiliary_device_id *id)
> +{
> +	struct device *dev = &adev->dev;
> +	struct meson_audio_reset_info *info =
> +		(struct meson_audio_reset_info *)id->driver_data;
> +	struct meson_audio_reset_data *rst;
> +
> +	dev_info(dev, "%s, reset_offset = %#x, reset_num = %u", __func__,
> +		 info->reset_offset, info->reset_num);
> +
> +	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
> +	if (!rst)
> +		return -ENOMEM;
> +
> +	rst->map = dev_get_regmap(dev->parent, NULL);
> +	if (!rst->map)
> +		return -ENODEV;
> +
> +	rst->offset = info->reset_offset;
> +	rst->rstc.ops = &meson_audio_reset_ops;
> +	rst->rstc.of_node = dev->parent->of_node;
> +	rst->rstc.nr_resets = info->reset_num;
> +	rst->rstc.owner = THIS_MODULE;
> +
> +	return devm_reset_controller_register(dev, &rst->rstc);
> +}
> +
> +static void meson_audio_reset_adev_release(struct device *dev)
> +{
> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +
> +	kfree(adev);
> +}
> +
> +static void meson_audio_reset_adev_unregister(void *_adev)
> +{
> +	struct auxiliary_device *adev = _adev;
> +
> +	auxiliary_device_delete(adev);
> +	auxiliary_device_uninit(adev);
> +}
> +
> +static const struct meson_audio_reset_info meson_audio_reset_info_g12a = {
> +	.reset_offset = 0x024,
> +	.reset_num = 26,
> +};
> +
> +static const struct meson_audio_reset_info meson_audio_reset_info_sm1 = {
> +	.reset_offset = 0x028,
> +	.reset_num = 39,
> +};
> +static const struct auxiliary_device_id meson_audio_reset_id[] = {
> +	{
> +		.name = "reset_meson_audio.g12a",
> +		.driver_data = (kernel_ulong_t)&meson_audio_reset_info_g12a,
> +	},
> +	{
> +		.name = "reset_meson_audio.sm1",
> +		.driver_data = (kernel_ulong_t)&meson_audio_reset_info_sm1,
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(auxiliary, meson_audio_reset_id);
> +
> +static struct auxiliary_driver meson_audio_reset_driver = {
> +	.probe = meson_audio_reset_probe,
> +	.id_table = meson_audio_reset_id,
> +};
> +
> +module_auxiliary_driver(meson_audio_reset_driver);
> +
> +int meson_audio_reset_register(struct device *dev, const char *name)
> +{
> +	struct auxiliary_device *adev;
> +	int ret;
> +
> +	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
> +	if (!adev)
> +		return -ENOMEM;
> +
> +	adev->name = name;
> +	adev->dev.parent = dev;
> +	adev->dev.release = meson_audio_reset_adev_release;
> +	adev->id = 0;
> +
> +	ret = auxiliary_device_init(adev);
> +	if (ret)
> +		return ret;
> +
> +	ret = auxiliary_device_add(adev);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(dev, meson_audio_reset_adev_unregister,
> +					adev);
> +}
> +EXPORT_SYMBOL_GPL(meson_audio_reset_register);
> +
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/soc/amlogic/meson-audio-reset.h b/include/soc/amlogic/meson-audio-reset.h
> new file mode 100644
> index 000000000000..279c6a2197ec
> --- /dev/null
> +++ b/include/soc/amlogic/meson-audio-reset.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +
> +#ifndef __MESON_AUDIO_RESET_H
> +#define __MESON_AUDIO_RESET_H
> +
> +#include <linux/device.h>
> +
> +int meson_audio_reset_register(struct device *dev, const char *name);
> +
> +#endif /* __MESON_AUDIO_RESET_H */


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
