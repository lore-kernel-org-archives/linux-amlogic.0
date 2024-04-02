Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47C3CD1284
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Apr 2024 15:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLULeOPAjuPgP4oqk6iD+7RxGiR1OEKfkEEKaT9lSjc=; b=iTuLRNahF7W3lQ
	+BaEjOYCC8lR0rgs66G8bexCNtsoKb7Tf09y6idzVTscvwd+V2QNH09Xrr7M+YI3xg2dZxOv0N93d
	1xhGl5xaXz0mFJlTxhfvdR2HDDfODUCvQOZPNbSi5Q5C3VcIcYsxDCDkXI30HUM/+ZCNk+Ax/56hF
	scmBw9hgVQ4N0dSA5Dyw/RP03QLUgpGuRiCiZctT0EeVouN3yluNzr3b6BObHODC1aMo90IhW9D7e
	Ty/q9vQhqHYiOkZoyfAKtTfn44Oi1Gt6z8tFrM6Ly/ZQEeKxFlLI+awqNdPtcICn/qO7XhwcBvCqB
	9XDLpPWM/ZmeivyEjRgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrffI-0000000BjCm-0uUU;
	Tue, 02 Apr 2024 15:03:08 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrffD-0000000BjAw-0k5G
	for linux-amlogic@lists.infradead.org;
	Tue, 02 Apr 2024 15:03:05 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-34379b447c3so215087f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 02 Apr 2024 08:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712070179; x=1712674979; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=QLh7C2qJ6VxpYlStd0L/XMk/c8rcOEZSbOF06Wx5dco=;
        b=ISv8n8POhHlqg5Bn3HSBgoythqFgjaPTy0JV1zKxCNWa09ip81vefNoSXL89gycroe
         Aghzm6tFihzlAyPKaXcgTp4YK8JijFoU+asOdraQ5Lqumi45gofZvLH8iBt2w/AFxDTM
         olCKbbfKDi47NHP4CXBKyMedbw/w/VsSECo6QqD/jBA8ICveTYZdaAYKeQhj7N3blCYb
         YYzE8wWMlnORk+ki3OmOX9I/c5DLG7WBJFReqsIIG/Et3NeW97NuX3woDwdvut84kYtZ
         I5n8/WkPUv1GwK5aIudR8WEoG7qFcBIQgrFXLZLngNfldWoHLx2z82fXMHaVozZUICAD
         jYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712070179; x=1712674979;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLh7C2qJ6VxpYlStd0L/XMk/c8rcOEZSbOF06Wx5dco=;
        b=BGwkEWTz61tgkcTbcloxVPCiAlVZqX1qNMC1XuiCam3ULEcpoa7RPp6XYjaW4JRxZ4
         6cHUD9/70gguyGxODUC71xv1Dqh5MUWuxh4KPMWZES761uPfmNkq80n533MOEt+PQ9oD
         ErIbzfc58D2kDRGEsEC6SIow7EGUAxj0PbKv3LsV66/mYcdgbE69zyk/d4jCtRjh+vfF
         aby+HecXDAJj8nqwCxWvwN77xgrOX048TmHc5KDFcHtDwHW4poHaeSeRdiCFpn9z4+Z0
         +tLo4HcVvv9wzUJ02SGMuKNgiLuk9jij3RXuDj04DSCY99q47yxtAVHe6LU1iOJPSbuE
         PWww==
X-Forwarded-Encrypted: i=1; AJvYcCVKLKi1m1I84XTeKlXAfw+SQk71AWAF2nSRqZWo4SguvCp9Y3DEsxvUdn6NsrFilDA2gIjk1wqZUyuxROQ7bychB179Di+gOL3ji+T6Snm/55g=
X-Gm-Message-State: AOJu0Yzj1JUz/ZKcnN6TCdpXllpQDUHZsLMbBcPcvrpcUNWztyJJBEbp
	wLJHSy/QHifKDLZf5r62rsCKQSVzJwYLugS3wZL+LPYTkFwadRJN2WQ+n8BYNjc=
X-Google-Smtp-Source: AGHT+IFSgmTd7GB48ZrNjEll1HvnPHtsZpacbfK6tP4nSa5dMUnTT0fGb12JJu2ZFMMjgqoK6U2wzw==
X-Received: by 2002:a5d:5886:0:b0:341:d316:3336 with SMTP id n6-20020a5d5886000000b00341d3163336mr15804446wrf.12.1712070178886;
        Tue, 02 Apr 2024 08:02:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2b3:4f20:7b45:be58])
        by smtp.gmail.com with ESMTPSA id ay33-20020a05600c1e2100b004156a816048sm5381157wmb.35.2024.04.02.08.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 08:02:58 -0700 (PDT)
References: <20240328010831.884487-1-jan.dakinevich@salutedevices.com>
 <20240328010831.884487-2-jan.dakinevich@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, Michael  Turquette <mturquette@baylibre.com>, Rob
  Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH v2 1/5] clk: meson: axg: move reset controller's
 code to separate module
Date: Tue, 02 Apr 2024 16:52:38 +0200
In-reply-to: <20240328010831.884487-2-jan.dakinevich@salutedevices.com>
Message-ID: <1j7chfiz8e.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_080303_491110_E55F4ACA 
X-CRM114-Status: GOOD (  31.84  )
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


On Thu 28 Mar 2024 at 04:08, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> This code will by reused by A1 SoC.

Could expand a bit please ?

>
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>

In general, I like the idea.

We do have a couple a reset registers lost in middle of clocks and this
change makes it possible to re-use the code instead duplicating it.

The exported function would be used by audio clock controllers, but the
module created would be purely about reset.

One may wonder how it ended up in the clock tree, especially since the
kernel as a reset tree too.

I'm not sure if this should move to the reset framework or if it would
be an unnecessary churn. Stephen, Philipp, do you have an opinion on
this ?

> ---
>  drivers/clk/meson/Kconfig            |   5 ++
>  drivers/clk/meson/Makefile           |   1 +
>  drivers/clk/meson/axg-audio.c        |  95 +----------------------
>  drivers/clk/meson/meson-audio-rstc.c | 109 +++++++++++++++++++++++++++
>  drivers/clk/meson/meson-audio-rstc.h |  12 +++
>  5 files changed, 130 insertions(+), 92 deletions(-)
>  create mode 100644 drivers/clk/meson/meson-audio-rstc.c
>  create mode 100644 drivers/clk/meson/meson-audio-rstc.h
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 29ffd14d267b..d6a2fa5f7e88 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -48,6 +48,10 @@ config COMMON_CLK_MESON_CPU_DYNDIV
>  	tristate
>  	select COMMON_CLK_MESON_REGMAP
>  
> +config COMMON_CLK_MESON_AUDIO_RSTC
> +	tristate
> +	select RESET_CONTROLLER
> +
>  config COMMON_CLK_MESON8B
>  	bool "Meson8 SoC Clock controller support"
>  	depends on ARM
> @@ -101,6 +105,7 @@ config COMMON_CLK_AXG_AUDIO
>  	select COMMON_CLK_MESON_PHASE
>  	select COMMON_CLK_MESON_SCLK_DIV
>  	select COMMON_CLK_MESON_CLKC_UTILS
> +	select COMMON_CLK_MESON_AUDIO_RSTC
>  	select REGMAP_MMIO
>  	help
>  	  Support for the audio clock controller on AmLogic A113D devices,
> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
> index 9ee4b954c896..88d94921a4dc 100644
> --- a/drivers/clk/meson/Makefile
> +++ b/drivers/clk/meson/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_COMMON_CLK_MESON_PLL) += clk-pll.o
>  obj-$(CONFIG_COMMON_CLK_MESON_REGMAP) += clk-regmap.o
>  obj-$(CONFIG_COMMON_CLK_MESON_SCLK_DIV) += sclk-div.o
>  obj-$(CONFIG_COMMON_CLK_MESON_VID_PLL_DIV) += vid-pll-div.o
> +obj-$(CONFIG_COMMON_CLK_MESON_AUDIO_RSTC) += meson-audio-rstc.o
>  
>  # Amlogic Clock controllers
>  
> diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
> index ac3482960903..990203a7ad5c 100644
> --- a/drivers/clk/meson/axg-audio.c
> +++ b/drivers/clk/meson/axg-audio.c
> @@ -12,10 +12,10 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
> -#include <linux/reset-controller.h>
>  #include <linux/slab.h>
>  
>  #include "meson-clkc-utils.h"
> +#include "meson-audio-rstc.h"
>  #include "axg-audio.h"
>  #include "clk-regmap.h"
>  #include "clk-phase.h"
> @@ -1648,84 +1648,6 @@ static struct clk_regmap *const sm1_clk_regmaps[] = {
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
> @@ -1745,7 +1667,6 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	const struct audioclk_data *data;
> -	struct axg_audio_reset_data *rst;
>  	struct regmap *map;
>  	void __iomem *regs;
>  	struct clk_hw *hw;
> @@ -1807,18 +1728,8 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
>  	if (!data->reset_num)
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
> +	return meson_audio_rstc_register(dev, map, data->reset_offset,
> +					 data->reset_num);
>  }
>  
>  static const struct audioclk_data axg_audioclk_data = {
> diff --git a/drivers/clk/meson/meson-audio-rstc.c b/drivers/clk/meson/meson-audio-rstc.c
> new file mode 100644
> index 000000000000..2079d24c40f4
> --- /dev/null
> +++ b/drivers/clk/meson/meson-audio-rstc.c
> @@ -0,0 +1,109 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2018 BayLibre, SAS.
> + * Author: Jerome Brunet <jbrunet@baylibre.com>
> + */
> +
> +#include <linux/reset-controller.h>
> +
> +#include "meson-audio-rstc.h"
> +
> +struct meson_audio_reset_data {
> +	struct reset_controller_dev rstc;
> +	struct regmap *map;
> +	unsigned int offset;
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
> +static const struct reset_control_ops meson_audio_rstc_ops = {
> +	.assert = meson_audio_reset_assert,
> +	.deassert = meson_audio_reset_deassert,
> +	.reset = meson_audio_reset_toggle,
> +	.status = meson_audio_reset_status,
> +};
> +
> +int meson_audio_rstc_register(struct device *dev, struct regmap *map,
> +			      unsigned int offset, unsigned int num)
> +{
> +	struct meson_audio_reset_data *rst;
> +
> +	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
> +	if (!rst)
> +		return -ENOMEM;
> +
> +	rst->map = map;
> +	rst->offset = offset;
> +	rst->rstc.nr_resets = num;
> +	rst->rstc.ops = &meson_audio_rstc_ops;
> +	rst->rstc.of_node = dev->of_node;
> +	rst->rstc.owner = THIS_MODULE;
> +
> +	return devm_reset_controller_register(dev, &rst->rstc);
> +}
> +EXPORT_SYMBOL_GPL(meson_audio_rstc_register);
> +
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/clk/meson/meson-audio-rstc.h b/drivers/clk/meson/meson-audio-rstc.h
> new file mode 100644
> index 000000000000..6b441549de03
> --- /dev/null
> +++ b/drivers/clk/meson/meson-audio-rstc.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +
> +#ifndef __MESON_AUDIO_RSTC_H
> +#define __MESON_AUDIO_RSTC_H
> +
> +#include <linux/device.h>
> +#include <linux/regmap.h>
> +
> +int meson_audio_rstc_register(struct device *dev, struct regmap *map,
> +			      unsigned int offset, unsigned int num);
> +
> +#endif /* __MESON_AUDIO_RSTC_H */


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
