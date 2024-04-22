Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D936DC07E8F
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Apr 2024 07:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKaiD2/pX6r9cHj3PnyrpMc/J4pBsd5YjPBm01yhsv0=; b=J02IfTOCEWb/xt
	zenFX4OXkveLeDkoaopQnVfVYewf5OcJ54xVv1KfKDgtJgWhuGcheoZNnul7adNQooz9zZ3k9Ttkp
	FmglFxWYbUTxC7A5noYjbPrl/Nf5liAsnIZiidInzKoQ+BSYrFAVahNSA9ounIj9DDa/vJLEiruSE
	RDzLg5GlSdvNtp82q/QgdT3Shfsd1PClvx4C2IeXDRzNwUzLkv+8bCf6z0cholrosebqiuY/JdDP8
	6u7IVASFTPp1lwgksEy6wfHqfKoNb8jTvSN636J9utaqUm2aoqBgvdniffomuwvyo/WWlHDI3k50Y
	oZSyInEh0kCeDLkZhaZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryoYK-0000000CXV4-2lok;
	Mon, 22 Apr 2024 07:57:28 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryoYG-0000000CXU5-0qlH
	for linux-amlogic@lists.infradead.org;
	Mon, 22 Apr 2024 07:57:26 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-34a00533d08so2495988f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 22 Apr 2024 00:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713772641; x=1714377441; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=sFYfGCZs1Pp7YeOGZn2C8BdGAZNNcbKzv09+peDZTuQ=;
        b=z7e9AuNF6SwgO/A8Bx23xWFFzVomv2yxb+XM0jff6ysVfJr3gd4dAbMX/dRmdMPvKV
         Nok4C37W3Z3SQxOSkdlo59F1yy8IGee0mCwYrJuJdS6p+NCIS41FjoU5gFn1IC9kBf5k
         jFymHgpemk4+RnvWewpxD+SdAwaMzAb0D7ggfmBpHMz4mpkzWWOAaJHZiUs4lyScRsEG
         hgak+f/GetDtEyx/Nf2ryD3q6KNkDWH6OACUrKdyAusNMVwGwA355G47FgnuLw/iG2dd
         QyGsUh2u+LXGgkL0o/cXZc6zmtTFEn21j6ixcDzNGNX3ep3vPO/e4o60cESObYNaqOYU
         lGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713772641; x=1714377441;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFYfGCZs1Pp7YeOGZn2C8BdGAZNNcbKzv09+peDZTuQ=;
        b=fuC2ZXQ+8cbLgQ6RWnRLo+EicJm/dTY7nBtV0i1HLT6M53UN8GNDP7Co7pGVPWC1px
         f0rLyVDcOb52WaXtMRCzsN5afge9q4IZxFqfuOC5f2kMqJZtoigVtNIEa/JRGrCvktfW
         Ny0iqb1Td47DJ2QBQdoIz0K0Ao0++JNF35sniKhayBZ0KzqNY9n0LS2HCmFc+J6LhejP
         1+pLqfZ6cvJ5yWDPG42yMVjesDSGDbs7Dxpx9UCLEutskzlkgBKtRIZPlnYhJ4gKzDJG
         SUYI13pRNlIR5dcHXzmw/kc9/AL3m2BPzaW0RYiKfKlBYLXlTXV1qablYxtbvZ724voZ
         yoJw==
X-Forwarded-Encrypted: i=1; AJvYcCVXRUphX2vvl24pDmS4CcC54iyGs/63CLrb2j8w0Sz9NsRSSGvyMS8Py0xb8wq7bXhpK75xNaJJleQ0XkzII2q/8G7pVc5EtFfjRJDYUw9SX/A=
X-Gm-Message-State: AOJu0YwqW367aekgzDOGhzEtXG1BOMbm25mzFNhRovZuu3SzB+EemiGe
	zP36P4ukvGXbo+hc4MPZvdG1+fzBwwjnfyxTOuQTNM7yilvosHwX+vv8BKrxUdw=
X-Google-Smtp-Source: AGHT+IF6A+X2EjE6WUazWlrjUjmkxV0IJZrQbB5QH3YW2peQuaN4LE+bfZ+Y8XMw88VXuePMAd/+MA==
X-Received: by 2002:adf:e307:0:b0:341:89da:540c with SMTP id b7-20020adfe307000000b0034189da540cmr7307901wrj.26.1713772640495;
        Mon, 22 Apr 2024 00:57:20 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a619:ccb0:5f40:262c])
        by smtp.gmail.com with ESMTPSA id q2-20020adff942000000b00346bda84bf9sm11401588wrr.78.2024.04.22.00.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 00:57:20 -0700 (PDT)
References: <20240419125812.983409-1-jan.dakinevich@salutedevices.com>
 <20240419125812.983409-6-jan.dakinevich@salutedevices.com>
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
Subject: Re: [RFC PATCH v3 5/6] clk: meson: a1: add the audio clock
 controller driver
Date: Mon, 22 Apr 2024 09:53:29 +0200
In-reply-to: <20240419125812.983409-6-jan.dakinevich@salutedevices.com>
Message-ID: <1j4jbtbzj4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_005724_291086_88885471 
X-CRM114-Status: GOOD (  23.30  )
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

> This controller provides clocks and reset functionality for audio
> peripherals on Amlogic A1 SoC family.
>
> The driver is almost identical to 'axg-audio', however it would be better
> to keep it separate due to following reasons:
>
>  - significant amount of bits has another definition. I will bring there
>    a mess of new defines with A1_ suffixes.
>
>  - registers of this controller are located in two separate regions. It
>    will give a lot of complications for 'axg-audio' to support this.
>
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  drivers/clk/meson/Kconfig         |  14 +
>  drivers/clk/meson/Makefile        |   1 +
>  drivers/clk/meson/a1-audio.c      | 651 ++++++++++++++++++++++++++++++
>  drivers/reset/reset-meson-audio.c |  10 +
>  4 files changed, 676 insertions(+)
>  create mode 100644 drivers/clk/meson/a1-audio.c
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 33614f8b8cf7..8aa2b38914fc 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -130,6 +130,20 @@ config COMMON_CLK_A1_PERIPHERALS
>  	  device, A1 SoC Family. Say Y if you want A1 Peripherals clock
>  	  controller to work.
>  
> +config COMMON_CLK_A1_AUDIO
> +	tristate "Amlogic A1 SoC Audio clock controller support"
> +	depends on ARM64
> +	select COMMON_CLK_MESON_REGMAP
> +	select COMMON_CLK_MESON_CLKC_UTILS
> +	select COMMON_CLK_MESON_PHASE
> +	select COMMON_CLK_MESON_SCLK_DIV
> +	select RESET_CONTROLLER
> +	select RESET_MESON_AUDIO
> +	help
> +	  Support for the Audio clock controller on Amlogic A113L based
> +	  device, A1 SoC Family. Say Y if you want A1 Audio clock controller
> +	  to work.
> +
>  config COMMON_CLK_G12A
>  	tristate "G12 and SM1 SoC clock controllers support"
>  	depends on ARM64
> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
> index 9ee4b954c896..5e0260cef111 100644
> --- a/drivers/clk/meson/Makefile
> +++ b/drivers/clk/meson/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_COMMON_CLK_AXG) += axg.o axg-aoclk.o
>  obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
>  obj-$(CONFIG_COMMON_CLK_A1_PLL) += a1-pll.o
>  obj-$(CONFIG_COMMON_CLK_A1_PERIPHERALS) += a1-peripherals.o
> +obj-$(CONFIG_COMMON_CLK_A1_AUDIO) += a1-audio.o
>  obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
>  obj-$(CONFIG_COMMON_CLK_G12A) += g12a.o g12a-aoclk.o
>  obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o meson8-ddr.o
> diff --git a/drivers/clk/meson/a1-audio.c b/drivers/clk/meson/a1-audio.c
> new file mode 100644
> index 000000000000..bf08e354f32d
> --- /dev/null
> +++ b/drivers/clk/meson/a1-audio.c
> @@ -0,0 +1,651 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2024, SaluteDevices. All Rights Reserved.
> + *
> + * Author: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/init.h>
> +#include <linux/of_device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/reset-controller.h>
> +#include <linux/slab.h>
> +
> +#include <soc/amlogic/meson-audio-reset.h>
> +#include <dt-bindings/clock/amlogic,a1-audio-clkc.h>
> +
> +#include "meson-clkc-utils.h"
> +#include "meson-audio.h"
> +#include "clk-regmap.h"
> +#include "clk-phase.h"
> +#include "sclk-div.h"
> +
> +#define AUDIO_CLK_GATE_EN0		0x000
> +#define AUDIO_MCLK_A_CTRL		0x008
> +#define AUDIO_MCLK_B_CTRL		0x00c
> +#define AUDIO_MCLK_C_CTRL		0x010
> +#define AUDIO_MCLK_D_CTRL		0x014
> +#define AUDIO_SW_RESET0			0x028
> +#define AUDIO_MST_A_SCLK_CTRL0		0x040
> +#define AUDIO_MST_A_SCLK_CTRL1		0x044
> +#define AUDIO_MST_B_SCLK_CTRL0		0x048
> +#define AUDIO_MST_B_SCLK_CTRL1		0x04c
> +#define AUDIO_MST_C_SCLK_CTRL0		0x050
> +#define AUDIO_MST_C_SCLK_CTRL1		0x054
> +#define AUDIO_MST_D_SCLK_CTRL0		0x058
> +#define AUDIO_MST_D_SCLK_CTRL1		0x05c
> +#define AUDIO_CLK_TDMIN_A_CTRL		0x080
> +#define AUDIO_CLK_TDMIN_B_CTRL		0x084
> +#define AUDIO_CLK_TDMIN_LB_CTRL		0x08c
> +#define AUDIO_CLK_TDMOUT_A_CTRL		0x090
> +#define AUDIO_CLK_TDMOUT_B_CTRL		0x094
> +#define AUDIO_CLK_SPDIFIN_CTRL		0x09c
> +#define AUDIO_CLK_RESAMPLEA_CTRL	0x0a4
> +#define AUDIO_CLK_LOCKER_CTRL		0x0a8
> +#define AUDIO_CLK_EQDRC_CTRL		0x0c0
> +
> +#define AUDIO2_CLK_GATE_EN0		0x00c
> +#define AUDIO2_MCLK_VAD_CTRL		0x040
> +#define AUDIO2_CLK_VAD_CTRL		0x044
> +#define AUDIO2_CLK_PDMIN_CTRL0		0x058
> +#define AUDIO2_CLK_PDMIN_CTRL1		0x05c
> +
> +static const struct clk_parent_data a1_pclk_pdata[] = {
> +	{ .fw_name = "pclk" },
> +};
> +
> +#define AUD_PCLK_GATE(_name, _reg, _bit) {				\
> +	.data = &(struct clk_regmap_gate_data){				\
> +		.offset = (_reg),					\
> +		.bit_idx = (_bit),					\
> +	},								\
> +	.hw.init = &(struct clk_init_data) {				\
> +		.name = "aud_"#_name,					\
> +		.ops = &clk_regmap_gate_ops,				\
> +		.parent_data = a1_pclk_pdata,				\
> +		.num_parents = 1,					\
> +	},								\
> +}
> +
> +struct clk_regmap aud_ddr_arb =
> +	AUD_PCLK_GATE(ddr_arb, AUDIO_CLK_GATE_EN0, 0);
> +struct clk_regmap aud_tdmin_a =
> +	AUD_PCLK_GATE(tdmin_a, AUDIO_CLK_GATE_EN0, 1);
> +struct clk_regmap aud_tdmin_b =
> +	AUD_PCLK_GATE(tdmin_b, AUDIO_CLK_GATE_EN0, 2);
> +struct clk_regmap aud_tdmin_lb =
> +	AUD_PCLK_GATE(tdmin_lb, AUDIO_CLK_GATE_EN0, 3);
> +struct clk_regmap aud_loopback =
> +	AUD_PCLK_GATE(loopback, AUDIO_CLK_GATE_EN0, 4);
> +struct clk_regmap aud_tdmout_a =
> +	AUD_PCLK_GATE(tdmout_a, AUDIO_CLK_GATE_EN0, 5);
> +struct clk_regmap aud_tdmout_b =
> +	AUD_PCLK_GATE(tdmout_b, AUDIO_CLK_GATE_EN0, 6);
> +struct clk_regmap aud_frddr_a =
> +	AUD_PCLK_GATE(frddr_a, AUDIO_CLK_GATE_EN0, 7);
> +struct clk_regmap aud_frddr_b =
> +	AUD_PCLK_GATE(frddr_b, AUDIO_CLK_GATE_EN0, 8);
> +struct clk_regmap aud_toddr_a =
> +	AUD_PCLK_GATE(toddr_a, AUDIO_CLK_GATE_EN0, 9);
> +struct clk_regmap aud_toddr_b =
> +	AUD_PCLK_GATE(toddr_b, AUDIO_CLK_GATE_EN0, 10);
> +struct clk_regmap aud_spdifin =
> +	AUD_PCLK_GATE(spdifin, AUDIO_CLK_GATE_EN0, 11);
> +struct clk_regmap aud_resample =
> +	AUD_PCLK_GATE(resample, AUDIO_CLK_GATE_EN0, 12);
> +struct clk_regmap aud_eqdrc =
> +	AUD_PCLK_GATE(eqdrc, AUDIO_CLK_GATE_EN0, 13);
> +struct clk_regmap aud_audiolocker =
> +	AUD_PCLK_GATE(audiolocker, AUDIO_CLK_GATE_EN0, 14);
> +
> +struct clk_regmap aud_vad_ddr_arb =
> +	AUD_PCLK_GATE(vad_ddr_arb, AUDIO2_CLK_GATE_EN0, 0);
> +struct clk_regmap aud_vad_pdm =
> +	AUD_PCLK_GATE(vad_pdm, AUDIO2_CLK_GATE_EN0, 1);
> +struct clk_regmap aud_vad_tdmin_vad =
> +	AUD_PCLK_GATE(vad_tdmin_vad, AUDIO2_CLK_GATE_EN0, 2);
> +struct clk_regmap aud_vad_toddr_vad =
> +	AUD_PCLK_GATE(vad_toddr_vad, AUDIO2_CLK_GATE_EN0, 3);
> +struct clk_regmap aud_vad =
> +	AUD_PCLK_GATE(vad, AUDIO2_CLK_GATE_EN0, 4);
> +struct clk_regmap aud_vad_audiotop =
> +	AUD_PCLK_GATE(vad_audiotop, AUDIO2_CLK_GATE_EN0, 7);
> +
> +static const struct clk_parent_data a1_mst_pdata[] = {
> +	{ .fw_name = "dds_in" },
> +	{ .fw_name = "fclk_div2" },
> +	{ .fw_name = "fclk_div3" },
> +	{ .fw_name = "hifi_pll" },
> +	{ .fw_name = "xtal" },
> +};
> +
> +#define AUD_MST_MCLK_MUX(_name, _reg)					\
> +	AUD_MUX(_name##_sel, _reg, 0x7, 24, CLK_MUX_ROUND_CLOSEST,	\
> +		a1_mst_pdata, 0)
> +#define AUD_MST_MCLK_DIV(_name, _reg)					\
> +	AUD_DIV(_name##_div, _reg, 0, 16, CLK_DIVIDER_ROUND_CLOSEST,	\
> +		aud_##_name##_sel, CLK_SET_RATE_PARENT)
> +#define AUD_MST_MCLK_GATE(_name, _reg)					\
> +	AUD_GATE(_name, _reg, 31, aud_##_name##_div,			\
> +		 CLK_SET_RATE_PARENT)
> +
> +struct clk_regmap aud_mst_a_mclk_sel =
> +	AUD_MST_MCLK_MUX(mst_a_mclk, AUDIO_MCLK_A_CTRL);
> +struct clk_regmap aud_mst_a_mclk_div =
> +	AUD_MST_MCLK_DIV(mst_a_mclk, AUDIO_MCLK_A_CTRL);
> +struct clk_regmap aud_mst_a_mclk =
> +	AUD_MST_MCLK_GATE(mst_a_mclk, AUDIO_MCLK_A_CTRL);
> +
> +struct clk_regmap aud_mst_b_mclk_sel =
> +	AUD_MST_MCLK_MUX(mst_b_mclk, AUDIO_MCLK_B_CTRL);
> +struct clk_regmap aud_mst_b_mclk_div =
> +	AUD_MST_MCLK_DIV(mst_b_mclk, AUDIO_MCLK_B_CTRL);
> +struct clk_regmap aud_mst_b_mclk =
> +	AUD_MST_MCLK_GATE(mst_b_mclk, AUDIO_MCLK_B_CTRL);
> +
> +struct clk_regmap aud_mst_c_mclk_sel =
> +	AUD_MST_MCLK_MUX(mst_c_mclk, AUDIO_MCLK_C_CTRL);
> +struct clk_regmap aud_mst_c_mclk_div =
> +	AUD_MST_MCLK_DIV(mst_c_mclk, AUDIO_MCLK_C_CTRL);
> +struct clk_regmap aud_mst_c_mclk =
> +	AUD_MST_MCLK_GATE(mst_c_mclk, AUDIO_MCLK_C_CTRL);
> +
> +struct clk_regmap aud_mst_d_mclk_sel =
> +	AUD_MST_MCLK_MUX(mst_d_mclk, AUDIO_MCLK_D_CTRL);
> +struct clk_regmap aud_mst_d_mclk_div =
> +	AUD_MST_MCLK_DIV(mst_d_mclk, AUDIO_MCLK_D_CTRL);
> +struct clk_regmap aud_mst_d_mclk =
> +	AUD_MST_MCLK_GATE(mst_d_mclk, AUDIO_MCLK_D_CTRL);
> +
> +struct clk_regmap aud_spdifin_clk_sel =
> +	AUD_MST_MCLK_MUX(spdifin_clk, AUDIO_CLK_SPDIFIN_CTRL);
> +struct clk_regmap aud_spdifin_clk_div =
> +	AUD_MST_MCLK_DIV(spdifin_clk, AUDIO_CLK_SPDIFIN_CTRL);
> +struct clk_regmap aud_spdifin_clk =
> +	AUD_MST_MCLK_GATE(spdifin_clk, AUDIO_CLK_SPDIFIN_CTRL);
> +
> +struct clk_regmap aud_eqdrc_clk_sel =
> +	AUD_MST_MCLK_MUX(eqdrc_clk, AUDIO_CLK_EQDRC_CTRL);
> +struct clk_regmap aud_eqdrc_clk_div =
> +	AUD_MST_MCLK_DIV(eqdrc_clk, AUDIO_CLK_EQDRC_CTRL);
> +struct clk_regmap aud_eqdrc_clk =
> +	AUD_MST_MCLK_GATE(eqdrc_clk, AUDIO_CLK_EQDRC_CTRL);
> +
> +struct clk_regmap aud_resample_clk_sel =
> +	AUD_MUX(resample_clk_sel, AUDIO_CLK_RESAMPLEA_CTRL, 0xf, 24,
> +		CLK_MUX_ROUND_CLOSEST, a1_mst_pdata, 0);
> +struct clk_regmap aud_resample_clk_div =
> +	AUD_DIV(resample_clk_div, AUDIO_CLK_RESAMPLEA_CTRL, 0, 8,
> +		CLK_DIVIDER_ROUND_CLOSEST, aud_resample_clk_sel,
> +		CLK_SET_RATE_PARENT);
> +struct clk_regmap aud_resample_clk =
> +	AUD_GATE(resample_clk, AUDIO_CLK_RESAMPLEA_CTRL, 31,
> +		 aud_resample_clk_div, CLK_SET_RATE_PARENT);
> +
> +struct clk_regmap aud_locker_in_clk_sel =
> +	AUD_MUX(locker_in_clk_sel, AUDIO_CLK_LOCKER_CTRL, 0xf, 8,
> +		CLK_MUX_ROUND_CLOSEST, a1_mst_pdata, 0);
> +struct clk_regmap aud_locker_in_clk_div =
> +	AUD_DIV(locker_in_clk_div, AUDIO_CLK_LOCKER_CTRL, 0, 8,
> +		CLK_DIVIDER_ROUND_CLOSEST, aud_locker_in_clk_sel,
> +		CLK_SET_RATE_PARENT);
> +struct clk_regmap aud_locker_in_clk =
> +	AUD_GATE(locker_in_clk, AUDIO_CLK_LOCKER_CTRL, 15,
> +		 aud_locker_in_clk_div, CLK_SET_RATE_PARENT);
> +
> +struct clk_regmap aud_locker_out_clk_sel =
> +	AUD_MUX(locker_out_clk_sel, AUDIO_CLK_LOCKER_CTRL, 0xf, 24,
> +		CLK_MUX_ROUND_CLOSEST, a1_mst_pdata, 0);
> +struct clk_regmap aud_locker_out_clk_div =
> +	AUD_DIV(locker_out_clk_div, AUDIO_CLK_LOCKER_CTRL, 16, 8,
> +		CLK_DIVIDER_ROUND_CLOSEST, aud_locker_out_clk_sel,
> +		CLK_SET_RATE_PARENT);
> +struct clk_regmap aud_locker_out_clk =
> +	AUD_GATE(locker_out_clk, AUDIO_CLK_LOCKER_CTRL, 31,
> +		 aud_locker_out_clk_div, CLK_SET_RATE_PARENT);
> +
> +struct clk_regmap aud_vad_mclk_sel =
> +	AUD_MST_MCLK_MUX(vad_mclk, AUDIO2_MCLK_VAD_CTRL);
> +struct clk_regmap aud_vad_mclk_div =
> +	AUD_MST_MCLK_DIV(vad_mclk, AUDIO2_MCLK_VAD_CTRL);
> +struct clk_regmap aud_vad_mclk =
> +	AUD_MST_MCLK_GATE(vad_mclk, AUDIO2_MCLK_VAD_CTRL);
> +
> +struct clk_regmap aud_vad_clk_sel =
> +	AUD_MST_MCLK_MUX(vad_clk, AUDIO2_CLK_VAD_CTRL);
> +struct clk_regmap aud_vad_clk_div =
> +	AUD_MST_MCLK_DIV(vad_clk, AUDIO2_CLK_VAD_CTRL);
> +struct clk_regmap aud_vad_clk =
> +	AUD_MST_MCLK_GATE(vad_clk, AUDIO2_CLK_VAD_CTRL);
> +
> +struct clk_regmap aud_vad_pdm_dclk_sel =
> +	AUD_MST_MCLK_MUX(vad_pdm_dclk, AUDIO2_CLK_PDMIN_CTRL0);
> +struct clk_regmap aud_vad_pdm_dclk_div =
> +	AUD_MST_MCLK_DIV(vad_pdm_dclk, AUDIO2_CLK_PDMIN_CTRL0);
> +struct clk_regmap aud_vad_pdm_dclk =
> +	AUD_MST_MCLK_GATE(vad_pdm_dclk, AUDIO2_CLK_PDMIN_CTRL0);
> +
> +struct clk_regmap aud_vad_pdm_sysclk_sel =
> +	AUD_MST_MCLK_MUX(vad_pdm_sysclk, AUDIO2_CLK_PDMIN_CTRL1);
> +struct clk_regmap aud_vad_pdm_sysclk_div =
> +	AUD_MST_MCLK_DIV(vad_pdm_sysclk, AUDIO2_CLK_PDMIN_CTRL1);
> +struct clk_regmap aud_vad_pdm_sysclk =
> +	AUD_MST_MCLK_GATE(vad_pdm_sysclk, AUDIO2_CLK_PDMIN_CTRL1);
> +
> +#define AUD_MST_SCLK_PRE_EN(_name, _reg, _pname)			\
> +	AUD_GATE(_name##_pre_en, _reg, 31,				\
> +		 aud_##_pname, 0)
> +#define AUD_MST_SCLK_DIV(_name, _reg)					\
> +	AUD_SCLK_DIV(_name##_div, _reg, 20, 10, 0, 0,			\
> +		     aud_##_name##_pre_en, CLK_SET_RATE_PARENT)
> +#define AUD_MST_SCLK_POST_EN(_name, _reg)				\
> +	AUD_GATE(_name##_post_en, _reg, 30,				\
> +		 aud_##_name##_div, CLK_SET_RATE_PARENT)
> +#define AUD_MST_SCLK(_name, _reg)					\
> +	AUD_TRIPHASE(_name, _reg, 1, 0, 2, 4,				\
> +		     aud_##_name##_post_en, CLK_SET_RATE_PARENT)
> +
> +struct clk_regmap aud_mst_a_sclk_pre_en =
> +	AUD_MST_SCLK_PRE_EN(mst_a_sclk, AUDIO_MST_A_SCLK_CTRL0, mst_a_mclk);
> +struct clk_regmap aud_mst_a_sclk_div =
> +	AUD_MST_SCLK_DIV(mst_a_sclk, AUDIO_MST_A_SCLK_CTRL0);
> +struct clk_regmap aud_mst_a_sclk_post_en =
> +	AUD_MST_SCLK_POST_EN(mst_a_sclk, AUDIO_MST_A_SCLK_CTRL0);
> +struct clk_regmap aud_mst_a_sclk =
> +	AUD_MST_SCLK(mst_a_sclk, AUDIO_MST_A_SCLK_CTRL1);
> +
> +struct clk_regmap aud_mst_b_sclk_pre_en =
> +	AUD_MST_SCLK_PRE_EN(mst_b_sclk, AUDIO_MST_B_SCLK_CTRL0, mst_b_mclk);
> +struct clk_regmap aud_mst_b_sclk_div =
> +	AUD_MST_SCLK_DIV(mst_b_sclk, AUDIO_MST_B_SCLK_CTRL0);
> +struct clk_regmap aud_mst_b_sclk_post_en =
> +	AUD_MST_SCLK_POST_EN(mst_b_sclk, AUDIO_MST_B_SCLK_CTRL0);
> +struct clk_regmap aud_mst_b_sclk =
> +	AUD_MST_SCLK(mst_b_sclk, AUDIO_MST_B_SCLK_CTRL1);
> +
> +struct clk_regmap aud_mst_c_sclk_pre_en =
> +	AUD_MST_SCLK_PRE_EN(mst_c_sclk, AUDIO_MST_C_SCLK_CTRL0, mst_c_mclk);
> +struct clk_regmap aud_mst_c_sclk_div =
> +	AUD_MST_SCLK_DIV(mst_c_sclk, AUDIO_MST_C_SCLK_CTRL0);
> +struct clk_regmap aud_mst_c_sclk_post_en =
> +	AUD_MST_SCLK_POST_EN(mst_c_sclk, AUDIO_MST_C_SCLK_CTRL0);
> +struct clk_regmap aud_mst_c_sclk =
> +	AUD_MST_SCLK(mst_c_sclk, AUDIO_MST_C_SCLK_CTRL1);
> +
> +struct clk_regmap aud_mst_d_sclk_pre_en =
> +	AUD_MST_SCLK_PRE_EN(mst_d_sclk, AUDIO_MST_D_SCLK_CTRL0, mst_d_mclk);
> +struct clk_regmap aud_mst_d_sclk_div =
> +	AUD_MST_SCLK_DIV(mst_d_sclk, AUDIO_MST_D_SCLK_CTRL0);
> +struct clk_regmap aud_mst_d_sclk_post_en =
> +	AUD_MST_SCLK_POST_EN(mst_d_sclk, AUDIO_MST_D_SCLK_CTRL0);
> +struct clk_regmap aud_mst_d_sclk =
> +	AUD_MST_SCLK(mst_d_sclk, AUDIO_MST_D_SCLK_CTRL1);
> +
> +#define AUD_MST_LRCLK_DIV(_name, _reg, _pname)				\
> +	AUD_SCLK_DIV(_name##_div, _reg, 0, 10, 10, 10,			\
> +		     aud_##_pname, 0)
> +#define AUD_MST_LRCLK(_name, _reg)					\
> +	AUD_TRIPHASE(_name, _reg, 1, 1, 3, 5,				\
> +		     aud_##_name##_div, CLK_SET_RATE_PARENT)
> +
> +struct clk_regmap aud_mst_a_lrclk_div =
> +	AUD_MST_LRCLK_DIV(mst_a_lrclk, AUDIO_MST_A_SCLK_CTRL0,
> +			  mst_a_sclk_post_en);
> +struct clk_regmap aud_mst_a_lrclk =
> +	AUD_MST_LRCLK(mst_a_lrclk, AUDIO_MST_A_SCLK_CTRL1);
> +
> +struct clk_regmap aud_mst_b_lrclk_div =
> +	AUD_MST_LRCLK_DIV(mst_b_lrclk, AUDIO_MST_B_SCLK_CTRL0,
> +			  mst_b_sclk_post_en);
> +struct clk_regmap aud_mst_b_lrclk =
> +	AUD_MST_LRCLK(mst_b_lrclk, AUDIO_MST_B_SCLK_CTRL1);
> +
> +struct clk_regmap aud_mst_c_lrclk_div =
> +	AUD_MST_LRCLK_DIV(mst_c_lrclk, AUDIO_MST_C_SCLK_CTRL0,
> +			  mst_c_sclk_post_en);
> +struct clk_regmap aud_mst_c_lrclk =
> +	AUD_MST_LRCLK(mst_c_lrclk, AUDIO_MST_C_SCLK_CTRL1);
> +
> +struct clk_regmap aud_mst_d_lrclk_div =
> +	AUD_MST_LRCLK_DIV(mst_d_lrclk, AUDIO_MST_D_SCLK_CTRL0,
> +			  mst_d_sclk_post_en);
> +struct clk_regmap aud_mst_d_lrclk =
> +	AUD_MST_LRCLK(mst_d_lrclk, AUDIO_MST_D_SCLK_CTRL1);
> +
> +static const struct clk_parent_data a1_mst_sclk_pdata[] = {
> +	{ .hw = &aud_mst_a_sclk.hw, .index = -1 },
> +	{ .hw = &aud_mst_b_sclk.hw, .index = -1 },
> +	{ .hw = &aud_mst_c_sclk.hw, .index = -1 },
> +	{ .hw = &aud_mst_d_sclk.hw, .index = -1 },
> +	{ .fw_name = "slv_sclk0" },
> +	{ .fw_name = "slv_sclk1" },
> +	{ .fw_name = "slv_sclk2" },
> +	{ .fw_name = "slv_sclk3" },
> +	{ .fw_name = "slv_sclk4" },
> +	{ .fw_name = "slv_sclk5" },
> +	{ .fw_name = "slv_sclk6" },
> +	{ .fw_name = "slv_sclk7" },
> +	{ .fw_name = "slv_sclk8" },
> +	{ .fw_name = "slv_sclk9" },
> +};
> +
> +static u32 a1_mst_sclk_table[] = {
> +	0, 1, 2, 3, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
> +};

This is a clear indication that the bindings of axg and a1 are indeed
the same. Master clocks are optional.

> +
> +static const struct clk_parent_data a1_mst_lrclk_pdata[] = {
> +	{ .hw = &aud_mst_a_lrclk.hw, .index = -1 },
> +	{ .hw = &aud_mst_b_lrclk.hw, .index = -1 },
> +	{ .hw = &aud_mst_c_lrclk.hw, .index = -1 },
> +	{ .hw = &aud_mst_d_lrclk.hw, .index = -1 },
> +	{ .fw_name = "slv_lrclk0" },
> +	{ .fw_name = "slv_lrclk1" },
> +	{ .fw_name = "slv_lrclk2" },
> +	{ .fw_name = "slv_lrclk3" },
> +	{ .fw_name = "slv_lrclk4" },
> +	{ .fw_name = "slv_lrclk5" },
> +	{ .fw_name = "slv_lrclk6" },
> +	{ .fw_name = "slv_lrclk7" },
> +	{ .fw_name = "slv_lrclk8" },
> +	{ .fw_name = "slv_lrclk9" },
> +};
> +
> +static u32 a1_mst_lrclk_table[] = {
> +	0, 1, 2, 3, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
> +};
> +
> +#define AUD_TDM_SCLK_MUX(_name, _reg)					\
> +	AUD_MUX_TABLE(_name##_sel, _reg, a1_mst_sclk_table, 0xf, 24,	\
> +		      CLK_MUX_ROUND_CLOSEST, a1_mst_sclk_pdata, 0)
> +#define AUD_TDM_SCLK_PRE_EN(_name, _reg)				\
> +	AUD_GATE(_name##_pre_en, _reg, 31,				\
> +		 aud_##_name##_sel, CLK_SET_RATE_PARENT)
> +#define AUD_TDM_SCLK_POST_EN(_name, _reg)				\
> +	AUD_GATE(_name##_post_en, _reg, 30,				\
> +		 aud_##_name##_pre_en, CLK_SET_RATE_PARENT)
> +#define AUD_TDM_SCLK_WS(_name, _reg)					\
> +	AUD_SCLK_WS(_name, _reg, 1, 29, 28,				\
> +		    aud_##_name##_post_en,				\
> +		    CLK_DUTY_CYCLE_PARENT | CLK_SET_RATE_PARENT)
> +
> +#define AUD_TDM_LRLCK(_name, _reg)					\
> +	AUD_MUX_TABLE(_name, _reg, a1_mst_lrclk_table, 0xf, 20,		\
> +		      CLK_MUX_ROUND_CLOSEST, a1_mst_lrclk_pdata,	\
> +		      CLK_SET_RATE_PARENT)
> +
> +struct clk_regmap aud_tdmin_a_sclk_sel =
> +	AUD_TDM_SCLK_MUX(tdmin_a_sclk, AUDIO_CLK_TDMIN_A_CTRL);
> +struct clk_regmap aud_tdmin_a_sclk_pre_en =
> +	AUD_TDM_SCLK_PRE_EN(tdmin_a_sclk, AUDIO_CLK_TDMIN_A_CTRL);
> +struct clk_regmap aud_tdmin_a_sclk_post_en =
> +	AUD_TDM_SCLK_POST_EN(tdmin_a_sclk, AUDIO_CLK_TDMIN_A_CTRL);
> +struct clk_regmap aud_tdmin_a_sclk =
> +	AUD_TDM_SCLK_WS(tdmin_a_sclk, AUDIO_CLK_TDMIN_A_CTRL);
> +struct clk_regmap aud_tdmin_a_lrclk =
> +	AUD_TDM_LRLCK(tdmin_a_lrclk, AUDIO_CLK_TDMIN_A_CTRL);
> +
> +struct clk_regmap aud_tdmin_b_sclk_sel =
> +	AUD_TDM_SCLK_MUX(tdmin_b_sclk, AUDIO_CLK_TDMIN_B_CTRL);
> +struct clk_regmap aud_tdmin_b_sclk_pre_en =
> +	AUD_TDM_SCLK_PRE_EN(tdmin_b_sclk, AUDIO_CLK_TDMIN_B_CTRL);
> +struct clk_regmap aud_tdmin_b_sclk_post_en =
> +	AUD_TDM_SCLK_POST_EN(tdmin_b_sclk, AUDIO_CLK_TDMIN_B_CTRL);
> +struct clk_regmap aud_tdmin_b_sclk =
> +	AUD_TDM_SCLK_WS(tdmin_b_sclk, AUDIO_CLK_TDMIN_B_CTRL);
> +struct clk_regmap aud_tdmin_b_lrclk =
> +	AUD_TDM_LRLCK(tdmin_b_lrclk, AUDIO_CLK_TDMIN_B_CTRL);
> +
> +struct clk_regmap aud_tdmin_lb_sclk_sel =
> +	AUD_TDM_SCLK_MUX(tdmin_lb_sclk, AUDIO_CLK_TDMIN_LB_CTRL);
> +struct clk_regmap aud_tdmin_lb_sclk_pre_en =
> +	AUD_TDM_SCLK_PRE_EN(tdmin_lb_sclk, AUDIO_CLK_TDMIN_LB_CTRL);
> +struct clk_regmap aud_tdmin_lb_sclk_post_en =
> +	AUD_TDM_SCLK_POST_EN(tdmin_lb_sclk, AUDIO_CLK_TDMIN_LB_CTRL);
> +struct clk_regmap aud_tdmin_lb_sclk =
> +	AUD_TDM_SCLK_WS(tdmin_lb_sclk, AUDIO_CLK_TDMIN_LB_CTRL);
> +struct clk_regmap aud_tdmin_lb_lrclk =
> +	AUD_TDM_LRLCK(tdmin_lb_lrclk, AUDIO_CLK_TDMIN_LB_CTRL);
> +
> +struct clk_regmap aud_tdmout_a_sclk_sel =
> +	AUD_TDM_SCLK_MUX(tdmout_a_sclk, AUDIO_CLK_TDMOUT_A_CTRL);
> +struct clk_regmap aud_tdmout_a_sclk_pre_en =
> +	AUD_TDM_SCLK_PRE_EN(tdmout_a_sclk, AUDIO_CLK_TDMOUT_A_CTRL);
> +struct clk_regmap aud_tdmout_a_sclk_post_en =
> +	AUD_TDM_SCLK_POST_EN(tdmout_a_sclk, AUDIO_CLK_TDMOUT_A_CTRL);
> +struct clk_regmap aud_tdmout_a_sclk =
> +	AUD_TDM_SCLK_WS(tdmout_a_sclk, AUDIO_CLK_TDMOUT_A_CTRL);
> +struct clk_regmap aud_tdmout_a_lrclk =
> +	AUD_TDM_LRLCK(tdmout_a_lrclk, AUDIO_CLK_TDMOUT_A_CTRL);
> +
> +struct clk_regmap aud_tdmout_b_sclk_sel =
> +	AUD_TDM_SCLK_MUX(tdmout_b_sclk, AUDIO_CLK_TDMOUT_B_CTRL);
> +struct clk_regmap aud_tdmout_b_sclk_pre_en =
> +	AUD_TDM_SCLK_PRE_EN(tdmout_b_sclk, AUDIO_CLK_TDMOUT_B_CTRL);
> +struct clk_regmap aud_tdmout_b_sclk_post_en =
> +	AUD_TDM_SCLK_POST_EN(tdmout_b_sclk, AUDIO_CLK_TDMOUT_B_CTRL);
> +struct clk_regmap aud_tdmout_b_sclk =
> +	AUD_TDM_SCLK_WS(tdmout_b_sclk, AUDIO_CLK_TDMOUT_B_CTRL);
> +struct clk_regmap aud_tdmout_b_lrclk =
> +	AUD_TDM_LRLCK(tdmout_b_lrclk, AUDIO_CLK_TDMOUT_B_CTRL);
> +
> +static struct clk_hw *a1_audio_hw_clks[] = {
> +	[AUD_CLKID_DDR_ARB]		= &aud_ddr_arb.hw,
> +	[AUD_CLKID_TDMIN_A]		= &aud_tdmin_a.hw,
> +	[AUD_CLKID_TDMIN_B]		= &aud_tdmin_b.hw,
> +	[AUD_CLKID_TDMIN_LB]		= &aud_tdmin_lb.hw,
> +	[AUD_CLKID_LOOPBACK]		= &aud_loopback.hw,
> +	[AUD_CLKID_TDMOUT_A]		= &aud_tdmout_a.hw,
> +	[AUD_CLKID_TDMOUT_B]		= &aud_tdmout_b.hw,
> +	[AUD_CLKID_FRDDR_A]		= &aud_frddr_a.hw,
> +	[AUD_CLKID_FRDDR_B]		= &aud_frddr_b.hw,
> +	[AUD_CLKID_TODDR_A]		= &aud_toddr_a.hw,
> +	[AUD_CLKID_TODDR_B]		= &aud_toddr_b.hw,
> +	[AUD_CLKID_SPDIFIN]		= &aud_spdifin.hw,
> +	[AUD_CLKID_RESAMPLE]		= &aud_resample.hw,
> +	[AUD_CLKID_EQDRC]		= &aud_eqdrc.hw,
> +	[AUD_CLKID_LOCKER]		= &aud_audiolocker.hw,
> +	[AUD_CLKID_MST_A_MCLK_SEL]	= &aud_mst_a_mclk_sel.hw,
> +	[AUD_CLKID_MST_A_MCLK_DIV]	= &aud_mst_a_mclk_div.hw,
> +	[AUD_CLKID_MST_A_MCLK]		= &aud_mst_a_mclk.hw,
> +	[AUD_CLKID_MST_B_MCLK_SEL]	= &aud_mst_b_mclk_sel.hw,
> +	[AUD_CLKID_MST_B_MCLK_DIV]	= &aud_mst_b_mclk_div.hw,
> +	[AUD_CLKID_MST_B_MCLK]		= &aud_mst_b_mclk.hw,
> +	[AUD_CLKID_MST_C_MCLK_SEL]	= &aud_mst_c_mclk_sel.hw,
> +	[AUD_CLKID_MST_C_MCLK_DIV]	= &aud_mst_c_mclk_div.hw,
> +	[AUD_CLKID_MST_C_MCLK]		= &aud_mst_c_mclk.hw,
> +	[AUD_CLKID_MST_D_MCLK_SEL]	= &aud_mst_d_mclk_sel.hw,
> +	[AUD_CLKID_MST_D_MCLK_DIV]	= &aud_mst_d_mclk_div.hw,
> +	[AUD_CLKID_MST_D_MCLK]		= &aud_mst_d_mclk.hw,
> +	[AUD_CLKID_RESAMPLE_CLK_SEL]	= &aud_resample_clk_sel.hw,
> +	[AUD_CLKID_RESAMPLE_CLK_DIV]	= &aud_resample_clk_div.hw,
> +	[AUD_CLKID_RESAMPLE_CLK]	= &aud_resample_clk.hw,
> +	[AUD_CLKID_LOCKER_IN_CLK_SEL]	= &aud_locker_in_clk_sel.hw,
> +	[AUD_CLKID_LOCKER_IN_CLK_DIV]	= &aud_locker_in_clk_div.hw,
> +	[AUD_CLKID_LOCKER_IN_CLK]	= &aud_locker_in_clk.hw,
> +	[AUD_CLKID_LOCKER_OUT_CLK_SEL]	= &aud_locker_out_clk_sel.hw,
> +	[AUD_CLKID_LOCKER_OUT_CLK_DIV]	= &aud_locker_out_clk_div.hw,
> +	[AUD_CLKID_LOCKER_OUT_CLK]	= &aud_locker_out_clk.hw,
> +	[AUD_CLKID_SPDIFIN_CLK_SEL]	= &aud_spdifin_clk_sel.hw,
> +	[AUD_CLKID_SPDIFIN_CLK_DIV]	= &aud_spdifin_clk_div.hw,
> +	[AUD_CLKID_SPDIFIN_CLK]		= &aud_spdifin_clk.hw,
> +	[AUD_CLKID_EQDRC_CLK_SEL]	= &aud_eqdrc_clk_sel.hw,
> +	[AUD_CLKID_EQDRC_CLK_DIV]	= &aud_eqdrc_clk_div.hw,
> +	[AUD_CLKID_EQDRC_CLK]		= &aud_eqdrc_clk.hw,
> +	[AUD_CLKID_MST_A_SCLK_PRE_EN]	= &aud_mst_a_sclk_pre_en.hw,
> +	[AUD_CLKID_MST_A_SCLK_DIV]	= &aud_mst_a_sclk_div.hw,
> +	[AUD_CLKID_MST_A_SCLK_POST_EN]	= &aud_mst_a_sclk_post_en.hw,
> +	[AUD_CLKID_MST_A_SCLK]		= &aud_mst_a_sclk.hw,
> +	[AUD_CLKID_MST_B_SCLK_PRE_EN]	= &aud_mst_b_sclk_pre_en.hw,
> +	[AUD_CLKID_MST_B_SCLK_DIV]	= &aud_mst_b_sclk_div.hw,
> +	[AUD_CLKID_MST_B_SCLK_POST_EN]	= &aud_mst_b_sclk_post_en.hw,
> +	[AUD_CLKID_MST_B_SCLK]		= &aud_mst_b_sclk.hw,
> +	[AUD_CLKID_MST_C_SCLK_PRE_EN]	= &aud_mst_c_sclk_pre_en.hw,
> +	[AUD_CLKID_MST_C_SCLK_DIV]	= &aud_mst_c_sclk_div.hw,
> +	[AUD_CLKID_MST_C_SCLK_POST_EN]	= &aud_mst_c_sclk_post_en.hw,
> +	[AUD_CLKID_MST_C_SCLK]		= &aud_mst_c_sclk.hw,
> +	[AUD_CLKID_MST_D_SCLK_PRE_EN]	= &aud_mst_d_sclk_pre_en.hw,
> +	[AUD_CLKID_MST_D_SCLK_DIV]	= &aud_mst_d_sclk_div.hw,
> +	[AUD_CLKID_MST_D_SCLK_POST_EN]	= &aud_mst_d_sclk_post_en.hw,
> +	[AUD_CLKID_MST_D_SCLK]		= &aud_mst_d_sclk.hw,
> +	[AUD_CLKID_MST_A_LRCLK_DIV]	= &aud_mst_a_lrclk_div.hw,
> +	[AUD_CLKID_MST_A_LRCLK]		= &aud_mst_a_lrclk.hw,
> +	[AUD_CLKID_MST_B_LRCLK_DIV]	= &aud_mst_b_lrclk_div.hw,
> +	[AUD_CLKID_MST_B_LRCLK]		= &aud_mst_b_lrclk.hw,
> +	[AUD_CLKID_MST_C_LRCLK_DIV]	= &aud_mst_c_lrclk_div.hw,
> +	[AUD_CLKID_MST_C_LRCLK]		= &aud_mst_c_lrclk.hw,
> +	[AUD_CLKID_MST_D_LRCLK_DIV]	= &aud_mst_d_lrclk_div.hw,
> +	[AUD_CLKID_MST_D_LRCLK]		= &aud_mst_d_lrclk.hw,
> +	[AUD_CLKID_TDMIN_A_SCLK_SEL]	= &aud_tdmin_a_sclk_sel.hw,
> +	[AUD_CLKID_TDMIN_A_SCLK_PRE_EN]	= &aud_tdmin_a_sclk_pre_en.hw,
> +	[AUD_CLKID_TDMIN_A_SCLK_POST_EN] = &aud_tdmin_a_sclk_post_en.hw,
> +	[AUD_CLKID_TDMIN_A_SCLK]	= &aud_tdmin_a_sclk.hw,
> +	[AUD_CLKID_TDMIN_A_LRCLK]	= &aud_tdmin_a_lrclk.hw,
> +	[AUD_CLKID_TDMIN_B_SCLK_SEL]	= &aud_tdmin_b_sclk_sel.hw,
> +	[AUD_CLKID_TDMIN_B_SCLK_PRE_EN]	= &aud_tdmin_b_sclk_pre_en.hw,
> +	[AUD_CLKID_TDMIN_B_SCLK_POST_EN] = &aud_tdmin_b_sclk_post_en.hw,
> +	[AUD_CLKID_TDMIN_B_SCLK]	= &aud_tdmin_b_sclk.hw,
> +	[AUD_CLKID_TDMIN_B_LRCLK]	= &aud_tdmin_b_lrclk.hw,
> +	[AUD_CLKID_TDMIN_LB_SCLK_SEL]	= &aud_tdmin_lb_sclk_sel.hw,
> +	[AUD_CLKID_TDMIN_LB_SCLK_PRE_EN] = &aud_tdmin_lb_sclk_pre_en.hw,
> +	[AUD_CLKID_TDMIN_LB_SCLK_POST_EN] = &aud_tdmin_lb_sclk_post_en.hw,
> +	[AUD_CLKID_TDMIN_LB_SCLK]	= &aud_tdmin_lb_sclk.hw,
> +	[AUD_CLKID_TDMIN_LB_LRCLK]	= &aud_tdmin_lb_lrclk.hw,
> +	[AUD_CLKID_TDMOUT_A_SCLK_SEL]	= &aud_tdmout_a_sclk_sel.hw,
> +	[AUD_CLKID_TDMOUT_A_SCLK_PRE_EN] = &aud_tdmout_a_sclk_pre_en.hw,
> +	[AUD_CLKID_TDMOUT_A_SCLK_POST_EN] = &aud_tdmout_a_sclk_post_en.hw,
> +	[AUD_CLKID_TDMOUT_A_SCLK]	= &aud_tdmout_a_sclk.hw,
> +	[AUD_CLKID_TDMOUT_A_LRCLK]	= &aud_tdmout_a_lrclk.hw,
> +	[AUD_CLKID_TDMOUT_B_SCLK_SEL]	= &aud_tdmout_b_sclk_sel.hw,
> +	[AUD_CLKID_TDMOUT_B_SCLK_PRE_EN] = &aud_tdmout_b_sclk_pre_en.hw,
> +	[AUD_CLKID_TDMOUT_B_SCLK_POST_EN] = &aud_tdmout_b_sclk_post_en.hw,
> +	[AUD_CLKID_TDMOUT_B_SCLK]	= &aud_tdmout_b_sclk.hw,
> +	[AUD_CLKID_TDMOUT_B_LRCLK]	= &aud_tdmout_b_lrclk.hw,
> +};
> +
> +static struct clk_hw *a1_audio_vad_hw_clks[] = {
> +	[AUD_CLKID_VAD_DDR_ARB]		= &aud_vad_ddr_arb.hw,
> +	[AUD_CLKID_VAD_PDM]		= &aud_vad_pdm.hw,
> +	[AUD_CLKID_VAD_TDMIN]		= &aud_vad_tdmin_vad.hw,
> +	[AUD_CLKID_VAD_TODDR]		= &aud_vad_toddr_vad.hw,
> +	[AUD_CLKID_VAD]			= &aud_vad.hw,
> +	[AUD_CLKID_VAD_AUDIOTOP]	= &aud_vad_audiotop.hw,
> +	[AUD_CLKID_VAD_MCLK_SEL]	= &aud_vad_mclk_sel.hw,
> +	[AUD_CLKID_VAD_MCLK_DIV]	= &aud_vad_mclk_div.hw,
> +	[AUD_CLKID_VAD_MCLK]		= &aud_vad_mclk.hw,
> +	[AUD_CLKID_VAD_CLK_SEL]		= &aud_vad_clk_sel.hw,
> +	[AUD_CLKID_VAD_CLK_DIV]		= &aud_vad_clk_div.hw,
> +	[AUD_CLKID_VAD_CLK]		= &aud_vad_clk.hw,
> +	[AUD_CLKID_VAD_PDM_DCLK_SEL]	= &aud_vad_pdm_dclk_sel.hw,
> +	[AUD_CLKID_VAD_PDM_DCLK_DIV]	= &aud_vad_pdm_dclk_div.hw,
> +	[AUD_CLKID_VAD_PDM_DCLK]	= &aud_vad_pdm_dclk.hw,
> +	[AUD_CLKID_VAD_PDM_SYSCLK_SEL]	= &aud_vad_pdm_sysclk_sel.hw,
> +	[AUD_CLKID_VAD_PDM_SYSCLK_DIV]	= &aud_vad_pdm_sysclk_div.hw,
> +	[AUD_CLKID_VAD_PDM_SYSCLK]	= &aud_vad_pdm_sysclk.hw,
> +};

Again, I asked you to make separate driver for the a1 and a1-vad.

To be clear: different files for a1 and a1-vad.

> +
> +struct a1_audio_data {
> +	struct meson_clk_hw_data hw_clks;
> +	const char *reset_name;
> +};
> +
> +static const struct regmap_config a1_audio_regmap_cfg = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +};
> +
> +static int a1_audio_clkc_probe(struct platform_device *pdev)
> +{
> +	const struct a1_audio_data *data;
> +	struct regmap *map;
> +	void __iomem *base;
> +	struct clk *clk;
> +	unsigned int i;
> +	int ret;
> +
> +	data = of_device_get_match_data(&pdev->dev);
> +	if (!data)
> +		return -EINVAL;
> +
> +	clk = devm_clk_get_enabled(&pdev->dev, "pclk");
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	map = devm_regmap_init_mmio(&pdev->dev, base, &a1_audio_regmap_cfg);
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);
> +
> +	for (i = 0; i < data->hw_clks.num; i++) {
> +		struct clk_hw *hw = data->hw_clks.hws[i];
> +		struct clk_regmap *clk_regmap = to_clk_regmap(hw);
> +
> +		if (!hw)
> +			continue;
> +
> +		clk_regmap->map = map;
> +
> +		ret = devm_clk_hw_register(&pdev->dev, hw);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = devm_of_clk_add_hw_provider(&pdev->dev, meson_clk_hw_get,
> +					  (void *)&data->hw_clks);
> +	if (ret)
> +		return ret;
> +
> +	if (!data->reset_name)
> +		return 0;
> +
> +	return meson_audio_reset_register(&pdev->dev, data->reset_name);
> +}
> +
> +struct a1_audio_data a1_audio_data = {
> +	.hw_clks = {
> +		.hws = a1_audio_hw_clks,
> +		.num = ARRAY_SIZE(a1_audio_hw_clks),
> +	},
> +	.reset_name = "a1",
> +};
> +
> +struct a1_audio_data a1_audio_vad_data = {
> +	.hw_clks = {
> +		.hws = a1_audio_vad_hw_clks,
> +		.num = ARRAY_SIZE(a1_audio_vad_hw_clks),
> +	},
> +};
> +
> +static const struct of_device_id a1_audio_clkc_match_table[] = {
> +	{
> +		.compatible = "amlogic,a1-audio-clkc",
> +		.data = &a1_audio_data,
> +	},
> +	{
> +		.compatible = "amlogic,a1-audio-vad-clkc",
> +		.data = &a1_audio_vad_data,
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, a1_audio_clkc_match_table);
> +
> +static struct platform_driver a1_audio_clkc_driver = {
> +	.probe = a1_audio_clkc_probe,
> +	.driver = {
> +		.name = "a1-audio-clkc",
> +		.of_match_table = a1_audio_clkc_match_table,
> +	},
> +};
> +module_platform_driver(a1_audio_clkc_driver);
> +
> +MODULE_DESCRIPTION("Amlogic A1 Audio Clock driver");
> +MODULE_AUTHOR("Jan Dakinevich <jan.dakinevich@salutedevices.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/reset/reset-meson-audio.c b/drivers/reset/reset-meson-audio.c
> index aaea9931cfe2..faf098012721 100644
> --- a/drivers/reset/reset-meson-audio.c
> +++ b/drivers/reset/reset-meson-audio.c
> @@ -145,6 +145,12 @@ static const struct meson_audio_reset_info meson_audio_reset_info_sm1 = {
>  	.reset_offset = 0x028,
>  	.reset_num = 39,
>  };
> +
> +static const struct meson_audio_reset_info meson_audio_reset_info_a1 = {
> +	.reset_offset = 0x028,
> +	.reset_num = 32,
> +};
> +
>  static const struct auxiliary_device_id meson_audio_reset_id[] = {
>  	{
>  		.name = "reset_meson_audio.g12a",
> @@ -154,6 +160,10 @@ static const struct auxiliary_device_id meson_audio_reset_id[] = {
>  		.name = "reset_meson_audio.sm1",
>  		.driver_data = (kernel_ulong_t)&meson_audio_reset_info_sm1,
>  	},
> +	{
> +		.name = "reset_meson_audio.a1",
> +		.driver_data = (kernel_ulong_t)&meson_audio_reset_info_a1,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(auxiliary, meson_audio_reset_id);


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
