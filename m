Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7ACDCED278
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2024 07:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1dTFiUpmtyzLAa2K5n12rLCv8mRNv8RTjKkkjCa8s0=; b=Z6VzGEzOHunWGS4hEYgj7ZsYyy
	3VLXgSmMZ5Cqqk5iMUOapDH/f7+gftn/+hffte4Jw9NKe3BAoMJe/M1rc/OtAdoJdCYjGgsd/ibal
	9DmJixf0/cfSdbfKe7qEHEIrMIc9w0mFf2zfjshtFBfAzme1abTXbEToG4V0ZfkpK4gM/JxiuAsjU
	KPiQ9RwvGOoSIivY8yIxSxe9dKZSajCSQR7ErsfMLBPDPMRVi077lvzF03BIXPeVgtFTiUvZsZjmr
	M4kPgQEXvxpgZDKGeCHfNOWg347I+ekFMs4npYUHNg2at6iyM/7vcZjRiupfTuukf5ayjM3tMmveU
	oCxrX1PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy56y-00000004uir-3pbl;
	Tue, 08 Oct 2024 07:58:28 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy52G-00000004sxb-1mjw
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Oct 2024 07:53:38 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-42cd74c0d16so54532225e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Oct 2024 00:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728374015; x=1728978815; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6RX7qopexhbVavnycdQHirFwBWrFUkZRiDzEyQ/1rf4=;
        b=EvstJlWe3I7XM/lY2mkSNbtSSooM/gacGFdoFDbc4CEi+Th0fmFN4eTqUH2twYdat9
         J216R8TI2aSsSwhP8YJVpleu14U+ppcYVsX0baKQIN4dYgeEI70BIOu4qD4lndSXH2bt
         ZGx3S3n4m/sD2d9CCZdeBpFHpg8+HIrku6cwMz7DJevTqMugTI0kam1V0nW52ygAPofD
         JbdyqEqoErEtP7laoTPg28KI4vJcvnfTpiTUuNcO/3jaEMvtHYxnR5uH3krR2SI1yU7J
         rVdVw0xeIPaJCrsGSeIlB28z5XWamBbWp6OHHl0k9Hjxn7jdFXOIAuLpqaF83czpmfOP
         6APg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728374015; x=1728978815;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6RX7qopexhbVavnycdQHirFwBWrFUkZRiDzEyQ/1rf4=;
        b=TDLyH7A1XNA+G2ic6aQ03vbRMoOAclEKUo/VGigkuaul2OnUvJDbOo0VkURSTkEAme
         /JFrPWnZ+Ymd3WX3aQH6fE6UVMtOSl6CY4Xe10B3/9TrVMDbGU5wQNB3h+hSYN80CUOi
         /XP+Ig7+WgPn021J8x5IL1kCuQDM1jtN6Lad4wX2/yeFEYsNPTdzNN72iE2rXGkxd63C
         34ySNK3RvsWLD6opJ2C8uZLV0nldqsXN8pb/qBg4xBEF2DOnKlI+1A0F8QVmhbcjtdTj
         RDmiSe9VoZw1szFDNB6w9cFjJnOGLgxQU+rKFkZWA8lpftZ5RWsLXdm3OIDlJOEbU2ny
         eMxg==
X-Gm-Message-State: AOJu0Yx021oupbWJNoJmC4R8g0Ti/dYHQZGq5GhGiBPb3D89U7og2WOb
	VJqCkULmsqcP0h+kl1rPu1/Joqbckc/CH8qAo1rLrq9U1ksZPy9tVl8lgPMyfkM=
X-Google-Smtp-Source: AGHT+IGFHv5Ry+zY2n31M2dmAbybEJIH7Gv8mL9ahXAy4Ch9T/yTPyxZKVo+lTwb3AEZenLkHlRfNA==
X-Received: by 2002:a05:600c:19c9:b0:428:10d7:a4b1 with SMTP id 5b1f17b1804b1-42f85ae92f4mr110971835e9.25.1728374014302;
        Tue, 08 Oct 2024 00:53:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4595:23ef:4ba2:2d19? ([2a01:e0a:982:cbb0:4595:23ef:4ba2:2d19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f89ed957asm100379075e9.44.2024.10.08.00.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 00:53:33 -0700 (PDT)
Message-ID: <f9fc8247-331e-4cdb-992e-bc2f196aa12c@linaro.org>
Date: Tue, 8 Oct 2024 09:53:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] clk: amlogic: axg-audio: use the auxiliary reset
 driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241008-meson-clk-rst-aux-v2-1-682ab9151f4f@baylibre.com>
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
In-Reply-To: <20241008-meson-clk-rst-aux-v2-1-682ab9151f4f@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_005336_500499_5AEFF020 
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 08/10/2024 09:48, Jerome Brunet wrote:
> Remove the implementation of the reset driver in axg audio
> clock driver and migrate to the one provided by the reset framework
> on the auxiliary bus
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> Change in v2:
> * Rebase on the applied version of amlogic auxiliary reset driver
> * Link to v1: https://lore.kernel.org/r/20240719094910.3986450-1-jbrunet@baylibre.com
> ---
>   drivers/clk/meson/Kconfig     |   1 +
>   drivers/clk/meson/axg-audio.c | 109 ++++--------------------------------------
>   2 files changed, 10 insertions(+), 100 deletions(-)
> 
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 78f648c9c97d..7cb21fc223b0 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -106,6 +106,7 @@ config COMMON_CLK_AXG_AUDIO
>   	select COMMON_CLK_MESON_SCLK_DIV
>   	select COMMON_CLK_MESON_CLKC_UTILS
>   	select REGMAP_MMIO
> +	imply RESET_MESON_AUX
>   	help
>   	  Support for the audio clock controller on AmLogic A113D devices,
>   	  aka axg, Say Y if you want audio subsystem to work.
> diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
> index beda86349389..7714bde5ffc0 100644
> --- a/drivers/clk/meson/axg-audio.c
> +++ b/drivers/clk/meson/axg-audio.c
> @@ -15,6 +15,8 @@
>   #include <linux/reset-controller.h>
>   #include <linux/slab.h>
>   
> +#include <soc/amlogic/reset-meson-aux.h>
> +
>   #include "meson-clkc-utils.h"
>   #include "axg-audio.h"
>   #include "clk-regmap.h"
> @@ -1678,84 +1680,6 @@ static struct clk_regmap *const sm1_clk_regmaps[] = {
>   	&sm1_earcrx_dmac_clk,
>   };
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
>   static struct regmap_config axg_audio_regmap_cfg = {
>   	.reg_bits	= 32,
>   	.val_bits	= 32,
> @@ -1766,16 +1690,14 @@ struct audioclk_data {
>   	struct clk_regmap *const *regmap_clks;
>   	unsigned int regmap_clk_num;
>   	struct meson_clk_hw_data hw_clks;
> -	unsigned int reset_offset;
> -	unsigned int reset_num;
>   	unsigned int max_register;
> +	const char *rst_drvname;
>   };
>   
>   static int axg_audio_clkc_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	const struct audioclk_data *data;
> -	struct axg_audio_reset_data *rst;
>   	struct regmap *map;
>   	void __iomem *regs;
>   	struct clk_hw *hw;
> @@ -1834,22 +1756,11 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> -	/* Stop here if there is no reset */
> -	if (!data->reset_num)
> -		return 0;
> -
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
> +	/* Register auxiliary reset driver when applicable */
> +	if (data->rst_drvname)
> +		ret = devm_meson_rst_aux_register(dev, map, data->rst_drvname);
>   
> -	return devm_reset_controller_register(dev, &rst->rstc);
> +	return ret;
>   }
>   
>   static const struct audioclk_data axg_audioclk_data = {
> @@ -1869,9 +1780,8 @@ static const struct audioclk_data g12a_audioclk_data = {
>   		.hws = g12a_audio_hw_clks,
>   		.num = ARRAY_SIZE(g12a_audio_hw_clks),
>   	},
> -	.reset_offset = AUDIO_SW_RESET,
> -	.reset_num = 26,
>   	.max_register = AUDIO_CLK_SPDIFOUT_B_CTRL,
> +	.rst_drvname = "rst-g12a",
>   };
>   
>   static const struct audioclk_data sm1_audioclk_data = {
> @@ -1881,9 +1791,8 @@ static const struct audioclk_data sm1_audioclk_data = {
>   		.hws = sm1_audio_hw_clks,
>   		.num = ARRAY_SIZE(sm1_audio_hw_clks),
>   	},
> -	.reset_offset = AUDIO_SM1_SW_RESET0,
> -	.reset_num = 39,
>   	.max_register = AUDIO_EARCRX_DMAC_CLK_CTRL,
> +	.rst_drvname = "rst-sm1",
>   };
>   
>   static const struct of_device_id clkc_match_table[] = {
> 
> ---
> base-commit: 0e2d37252dd525b117bda4e4e0e6fac178ba569d
> change-id: 20241008-meson-clk-rst-aux-b118809e53d6
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
