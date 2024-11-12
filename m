Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1C3D41D7C
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2024 13:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vo9cINWg8wiuy4ZdYJG2fYURSi8qOSjPfV0/o2PtFTg=; b=pUWW1+MGJr+gCv88ycVbLZAoVD
	O+JusOwF7QEoqv1t5yzst7lShgUwQ1Fz1rNOzY3KglBpFja8Mr9MxmwzqLhlfy0ns/xP7MtAUCafb
	sRu5egG7g190qc3xj/8AEtDx7Nj5XMZ9t4JQVGWac6aB5Duyj/2rjRLgbNcBfs/8l8djOHklhI0EC
	r+EQwIIpHB4ii3Okpcz2jrww3PoAK1DYU/qcpAVHNkEyBpK0xnFpdf+tNFtlTngNmAnmByp51woGp
	VvjL/AKfdMCRDFeaRqf/R/jGhXVoJX3UXy5EEtDDMGx0UL32opbe3gNGOe66bnWTF7ttrR4jvlVzm
	LU26qBbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAr8o-00000003cSC-1nes;
	Tue, 12 Nov 2024 13:41:10 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAr18-00000003aaV-1Vbk
	for linux-amlogic@lists.infradead.org;
	Tue, 12 Nov 2024 13:33:17 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so49991615e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 12 Nov 2024 05:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731418392; x=1732023192; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GPw/l+reEkoV+Lu4oU6btG+0aP6lGwA5rjJnh68HFbw=;
        b=szYtS+tkGpxVNIO3BbXU6ZrEvYUV5xfP6vvUtdsQwzY1kp4q1mTz1CCuMnj1j8Zqnu
         V/KSgpi9Mm8FCIlalFRPvMmKeIOGkVqV29BwKOWml+ZtkhvshlElRfRew79wiHUEaVMH
         tSDrUEJpn27ETQpmOJrm+pPYi5GXUD/yAhlv60xqhaSWX5NV61J19FduNbc8Uk0yr+vc
         jCWNOT+Ytt0HleZdaUiVwX70T83mxlOlmOWtxtwF4+Un6gks4PfIFR75bxGZHeaTOq8Q
         hErQoEJe7cOTYg3bst981HRpAsEOxMvc741J/ClbXZBuuW8UCZioHOPpQNmFmFeARvPj
         Vd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731418392; x=1732023192;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GPw/l+reEkoV+Lu4oU6btG+0aP6lGwA5rjJnh68HFbw=;
        b=gp4QqVOh9Goj5ONANJUlXoi0uriVCsUkVU0CfUiQFB6I0HZBAOKjA4kQC1vLbfKGGk
         ZwuAPYzgRfO+uyJ71wsw40dXlC86Kyp7cIxry2DutCAPe1KFW4xuzHSHc6bdCPgrtpaU
         FU8c+EjAOWASNU6kYzCVH6R9fWT30CzPGsHj+jujmP+txfMbhdLQ/RVE/8gQ6BwX+25m
         RLT1IwrhiYJZGakVRs5m3hyrPtuPVZkAi5ZyTE9jTrVZ1dRVKrmys0Cgjziytij7YkCa
         84cGnjGn+SfxJQpIMLAHvbb4FZVRg4+3u4qGwWPCQJclFT8BE4pPryIFzBRZomb6cwB0
         au0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWied1q0Xhu41UKGiGt61L6Fnansxo8J90D9T2rMeR8zp73UvPDwRF6mXKLNBc2IRKhcNkTbWAAFSBRjBNr@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvm3VTkwh9SbOGRNERxocblJ5CR4RRl/r8KhNbYargqHPe8NCp
	mJPALR19qDQtN2QqK2cNPfcO04SxO51Qn0Q4WG4eei6R4VSbg6jqA6CaiWlCFK4=
X-Google-Smtp-Source: AGHT+IHtI83EOKwQElqzf0zLEiSXsg9bq2SemcxgdG+nJ+/NT2acG2uq4owq26USdOdF0uX+SDabNA==
X-Received: by 2002:a05:600c:4f04:b0:431:5f1c:8359 with SMTP id 5b1f17b1804b1-432b75091cdmr119544305e9.15.1731418392516;
        Tue, 12 Nov 2024 05:33:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:860c:aff4:d0e9:9db8? ([2a01:e0a:982:cbb0:860c:aff4:d0e9:9db8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa5b5fb1sm254853375e9.8.2024.11.12.05.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 05:33:12 -0800 (PST)
Message-ID: <5913d10c-cf85-407b-948a-db082b0789ac@linaro.org>
Date: Tue, 12 Nov 2024 14:33:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 4/5] pinctrl: meson: Add driver support for Amlogic A4
 SoCs
To: xianwei.zhao@amlogic.com, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241112-a4_pinctrl-v5-0-3460ce10c480@amlogic.com>
 <20241112-a4_pinctrl-v5-4-3460ce10c480@amlogic.com>
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
In-Reply-To: <20241112-a4_pinctrl-v5-4-3460ce10c480@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_053314_631801_E8158F87 
X-CRM114-Status: GOOD (  18.09  )
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

Hi,

On 12/11/2024 11:26, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add a new pinctrl driver for Amlogic A4 SoCs which share
> the same register layout as the previous Amlogic S4.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   drivers/pinctrl/meson/Kconfig              |    6 +
>   drivers/pinctrl/meson/Makefile             |    1 +
>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 1335 ++++++++++++++++++++++++++++
>   3 files changed, 1342 insertions(+)
> 

<snip>

> +
> +static int a4_of_gpio_xlate(struct gpio_chip *gc,
> +			    const struct of_phandle_args *gpiospec,
> +			    u32 *flags)
> +{
> +	int gpio_num;
> +
> +	u32 bank  = gpiospec->args[0];
> +	u32 offset = gpiospec->args[1];
> +
> +	if (gc->of_gpio_n_cells < 3) {
> +		WARN_ON(1);
> +		return -EINVAL;
> +	}

This check is unnecessary, drop it, it's already done by of_xlate_and_get_gpiod_flags(),
and if you _really_ want to keep it, move it before accessing gpiospec->args array.

> +
> +	if (WARN_ON(gpiospec->args_count < gc->of_gpio_n_cells))
> +		return -EINVAL;

This one aswell, drop it.

> +
> +	switch (bank) {

Just use: switch (gpiospec->args[0]) {

You can even simplify further by dropping offset and using:

int gpio_num = gpiospec->args[1];

and then:

> +	case AMLOGIC_GPIO_B:
> +		if (offset >= GPIOB_NUM)

if (gpio_num >= GPIOB_NUM)

> +			return -EINVAL;
> +		gpio_num = GPIOB_0 + offset;

gpio_num += GPIOB_0;

> +		break;
> +
> +	case AMLOGIC_GPIO_D:
> +		if (offset >= GPIOD_NUM)
> +			return -EINVAL;
> +		gpio_num = GPIOD_0 + offset;
> +		break;
> +
> +	case AMLOGIC_GPIO_E:
> +		if (offset >= GPIOE_NUM)
> +			return -EINVAL;
> +		gpio_num = GPIOE_0 + offset;
> +		break;
> +
> +	case AMLOGIC_GPIO_X:
> +		if (offset >= GPIOX_NUM)
> +			return -EINVAL;
> +		gpio_num = GPIOX_0 + offset;
> +		break;
> +
> +	case AMLOGIC_GPIO_T:
> +		if (offset >= GPIOT_NUM)
> +			return -EINVAL;
> +		gpio_num = GPIOT_0 + offset;
> +		break;
> +
> +	case AMLOGIC_GPIO_TEST_N:
> +		if (offset != 0)
> +			return -EINVAL;
> +		gpio_num = GPIO_TEST_N;
> +		break;
> +
> +	case AMLOGIC_GPIO_AO:
> +		if (offset >= GPIOAO_NUM)
> +			return -EINVAL;
> +		gpio_num = GPIOAO_0 + offset;
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (flags)
> +		*flags = gpiospec->args[2];
> +
> +	return gpio_num;
> +}
> +
> +static const struct meson_pinctrl_data a4_periphs_pinctrl_data = {
> +	.name		= "periphs-banks",
> +	.pins		= a4_periphs_pins,
> +	.groups		= a4_periphs_groups,
> +	.funcs		= a4_periphs_functions,
> +	.banks		= a4_periphs_banks,
> +	.num_pins	= ARRAY_SIZE(a4_periphs_pins),
> +	.num_groups	= ARRAY_SIZE(a4_periphs_groups),
> +	.num_funcs	= ARRAY_SIZE(a4_periphs_functions),
> +	.num_banks	= ARRAY_SIZE(a4_periphs_banks),
> +	.pmx_ops	= &meson_axg_pmx_ops,
> +	.pmx_data	= &a4_periphs_pmx_banks_data,
> +	.parse_dt	= &meson_a1_parse_dt_extra,
> +	.of_gpio_n_cells = 3,
> +	.of_xlate	= &a4_of_gpio_xlate,
> +};
> +
> +static const struct meson_pinctrl_data a4_aobus_pinctrl_data = {
> +	.name		= "aobus-banks",
> +	.pins		= a4_aobus_pins,
> +	.groups		= a4_aobus_groups,
> +	.funcs		= a4_aobus_functions,
> +	.banks		= a4_aobus_banks,
> +	.num_pins	= ARRAY_SIZE(a4_aobus_pins),
> +	.num_groups	= ARRAY_SIZE(a4_aobus_groups),
> +	.num_funcs	= ARRAY_SIZE(a4_aobus_functions),
> +	.num_banks	= ARRAY_SIZE(a4_aobus_banks),
> +	.pmx_ops	= &meson_axg_pmx_ops,
> +	.pmx_data	= &a4_aobus_pmx_banks_data,
> +	.parse_dt	= &meson_a1_parse_dt_extra,
> +	.of_gpio_n_cells = 3,
> +	.of_xlate	= &a4_of_gpio_xlate,
> +};
> +
> +static const struct of_device_id a4_pinctrl_dt_match[] = {
> +	{
> +		.compatible = "amlogic,a4-periphs-pinctrl",
> +		.data = &a4_periphs_pinctrl_data,
> +	},
> +	{
> +		.compatible = "amlogic,a4-aobus-pinctrl",
> +		.data = &a4_aobus_pinctrl_data,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, a4_pinctrl_dt_match);
> +
> +static struct platform_driver a4_pinctrl_driver = {
> +	.probe  = meson_pinctrl_probe,
> +	.driver = {
> +		.name	= "amlogic-a4-pinctrl",
> +		.of_match_table = a4_pinctrl_dt_match,
> +	},
> +};
> +
> +module_platform_driver(a4_pinctrl_driver);
> +
> +MODULE_AUTHOR("Xianwei Zhao <xianwei.zhao@amlogic.com>");
> +MODULE_DESCRIPTION("Pin controller and GPIO driver for Amlogic A4 SoC");
> +MODULE_LICENSE("Dual BSD/GPL");
> 

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
