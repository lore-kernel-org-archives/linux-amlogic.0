Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1CFEDE9A8
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Sep 2023 11:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qW24AzhB5ghT7LRFNYnvWX2jY2mggEfIqPBYuMzYybc=; b=cK9XVmm6hcHPfq8Lbm+XQk/D92
	yR0/DcR6rxymZ6N/Yz4ocZeRq0eyvDgNeSuGZmUmHJ8WnlRikkC7M+A/6dqMk+A5zL1BfVRtcmRsX
	aWrna3EG9dotpGepEIScUt0DldEez1J+Tmfz6k3ogmm65BMNVmdjidJdxDIAfoVqBxuHuqab6o21U
	Gp4mmb73FYSDzl+5802MEBjPAE3dC0rzgEziVQKDc29IHegApFss5kE2QceTX6wLSse7wQesspqC8
	bFPTZfKOUDLXnpLp4X/m4mnofmzCHFZFhwPlBQcQviVlOrNKd2MtPasmy2KJBnADpOOYSRNEmIHtM
	6n7EoOug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgksV-008Gqq-1w;
	Thu, 14 Sep 2023 11:51:23 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgksT-008Gpo-07
	for linux-amlogic@lists.infradead.org;
	Thu, 14 Sep 2023 11:51:22 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-404573e6c8fso5642955e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 14 Sep 2023 04:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694692276; x=1695297076; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1mqJPJDpys3PXut3MF0xg/8K+gdK10b2MkZh7aNYlm0=;
        b=B7xPw+JxQxvkNDnTM/5lEe7Qosh3lvE5cCadmlpAZk6bTJxL9AkGv7Lvm2aTKLDH/4
         vJ1EvUVZioczwItQNztEzLlPfFjUhQvu2JqUZ/8a1mWcwpNIRKLW6cJK1fXeZMdvVS/P
         IADgDeShQnQjzzRYQiFXS/exZngdc23kTxqB8AWJ/KPjJIgTcvQK9FkRiKS85lumoncW
         eJExkUMuUt2U0zR15cPpw1REngpRPriuXqeZAN6CcqnRtrruOohf8MT3jV2moh+BCnwf
         3wyzXS5EVhQaWP4G8+99iu2iea5EGzzjRcJFYuO3wRYRzCYJwJJ6q4WW9TKNlyV3fzAB
         +jmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694692276; x=1695297076;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1mqJPJDpys3PXut3MF0xg/8K+gdK10b2MkZh7aNYlm0=;
        b=KB7pCG/jTCMqc7P4XUoBkOlnWTGe676bhjQ2wK67bk9wG9BF+cRiTimPx1wuLahN90
         DTdGxOpeUJTWlYyIDPPrtgg+VpL3cWeNc1W1qC3P9p9z/1zNHFgUhRkeyEyShffwwpa9
         lso3BZfflto8cM0fvXzkZ+JDTxX/hEaSCd8O8jozPSh+v4pyCpg984hK0qLHYMd7O7zV
         FoZD8LlcOhUWpo+dzUsfFvwxNAl15j7Lw5ymeJDrp7issp9KVT2n+fXQQJJByxse1DQz
         iCYClCRCctRUyuDXXvXd9chvPoExyp74+cJgi2dTPqdW1pGI1+0zUKQmfUcdD8sC6G2y
         wLYw==
X-Gm-Message-State: AOJu0YwFpUHy00l5d+JKQAZgo0eBQ22h6XjYWL6IqnIWyMsDyRoFHXSL
	OXzjHOfcQoBSxzlFDH7KuQ789w==
X-Google-Smtp-Source: AGHT+IFhiLSyyl4rWajoECxKPRXZ7SGT5X6B80cq1J5IpphvEE2zx+AAn5qstiTw0pJGSRf9KFzTOQ==
X-Received: by 2002:a7b:ce0d:0:b0:401:daf2:2737 with SMTP id m13-20020a7bce0d000000b00401daf22737mr4998074wmc.30.1694692276302;
        Thu, 14 Sep 2023 04:51:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c61:ffb9:3ed9:c494? ([2a01:e0a:982:cbb0:c61:ffb9:3ed9:c494])
        by smtp.gmail.com with ESMTPSA id n12-20020a05600c294c00b003ff3b964a9asm4640351wmd.39.2023.09.14.04.51.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 04:51:15 -0700 (PDT)
Message-ID: <85947a27-cae5-4466-b2dc-b12d63bd8e4d@linaro.org>
Date: Thu, 14 Sep 2023 13:51:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 03/17] pmdomain: amlogic: Move Kconfig options to the
 pmdomain subsystem
Content-Language: en-US, fr
To: Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
References: <20230914111702.586501-1-ulf.hansson@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <20230914111702.586501-1-ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_045121_072729_FF684836 
X-CRM114-Status: GOOD (  15.62  )
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

On 14/09/2023 13:17, Ulf Hansson wrote:
> The Kconfig options belongs closer to the corresponding implementations,
> hence let's move them from the soc subsystem to the pmdomain subsystem.
> 
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: <linux-amlogic@lists.infradead.org>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>   drivers/pmdomain/Kconfig         |  1 +
>   drivers/pmdomain/amlogic/Kconfig | 39 ++++++++++++++++++++++++++++++++
>   drivers/soc/amlogic/Kconfig      | 35 ----------------------------
>   3 files changed, 40 insertions(+), 35 deletions(-)
>   create mode 100644 drivers/pmdomain/amlogic/Kconfig
> 
> diff --git a/drivers/pmdomain/Kconfig b/drivers/pmdomain/Kconfig
> index 8acb10bcdec9..07d2f8165abe 100644
> --- a/drivers/pmdomain/Kconfig
> +++ b/drivers/pmdomain/Kconfig
> @@ -2,5 +2,6 @@
>   menu "Power Domains Support"
>   
>   source "drivers/pmdomain/actions/Kconfig"
> +source "drivers/pmdomain/amlogic/Kconfig"
>   
>   endmenu
> diff --git a/drivers/pmdomain/amlogic/Kconfig b/drivers/pmdomain/amlogic/Kconfig
> new file mode 100644
> index 000000000000..ee1affffbce6
> --- /dev/null
> +++ b/drivers/pmdomain/amlogic/Kconfig
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menu "Amlogic Power Domains"
> +
> +config MESON_GX_PM_DOMAINS
> +	tristate "Amlogic Meson GX Power Domains driver"
> +	depends on ARCH_MESON || COMPILE_TEST
> +	depends on PM && OF
> +	default ARCH_MESON
> +	select PM_GENERIC_DOMAINS
> +	select PM_GENERIC_DOMAINS_OF
> +	help
> +	  Say yes to expose Amlogic Meson GX Power Domains as
> +	  Generic Power Domains.
> +
> +config MESON_EE_PM_DOMAINS
> +	tristate "Amlogic Meson Everything-Else Power Domains driver"
> +	depends on ARCH_MESON || COMPILE_TEST
> +	depends on PM && OF
> +	default ARCH_MESON
> +	select PM_GENERIC_DOMAINS
> +	select PM_GENERIC_DOMAINS_OF
> +	help
> +	  Say yes to expose Amlogic Meson Everything-Else Power Domains as
> +	  Generic Power Domains.
> +
> +config MESON_SECURE_PM_DOMAINS
> +	tristate "Amlogic Meson Secure Power Domains driver"
> +	depends on (ARCH_MESON || COMPILE_TEST) && MESON_SM
> +	depends on PM && OF
> +	depends on HAVE_ARM_SMCCC
> +	default ARCH_MESON
> +	select PM_GENERIC_DOMAINS
> +	select PM_GENERIC_DOMAINS_OF
> +	help
> +	  Support for the power controller on Amlogic A1/C1 series.
> +	  Say yes to expose Amlogic Meson Secure Power Domains as Generic
> +	  Power Domains.
> +
> +endmenu
> diff --git a/drivers/soc/amlogic/Kconfig b/drivers/soc/amlogic/Kconfig
> index 174a9b011461..d08e398bdad4 100644
> --- a/drivers/soc/amlogic/Kconfig
> +++ b/drivers/soc/amlogic/Kconfig
> @@ -26,41 +26,6 @@ config MESON_GX_SOCINFO
>   	  Say yes to support decoding of Amlogic Meson GX SoC family
>   	  information about the type, package and version.
>   
> -config MESON_GX_PM_DOMAINS
> -	tristate "Amlogic Meson GX Power Domains driver"
> -	depends on ARCH_MESON || COMPILE_TEST
> -	depends on PM && OF
> -	default ARCH_MESON
> -	select PM_GENERIC_DOMAINS
> -	select PM_GENERIC_DOMAINS_OF
> -	help
> -	  Say yes to expose Amlogic Meson GX Power Domains as
> -	  Generic Power Domains.
> -
> -config MESON_EE_PM_DOMAINS
> -	tristate "Amlogic Meson Everything-Else Power Domains driver"
> -	depends on ARCH_MESON || COMPILE_TEST
> -	depends on PM && OF
> -	default ARCH_MESON
> -	select PM_GENERIC_DOMAINS
> -	select PM_GENERIC_DOMAINS_OF
> -	help
> -	  Say yes to expose Amlogic Meson Everything-Else Power Domains as
> -	  Generic Power Domains.
> -
> -config MESON_SECURE_PM_DOMAINS
> -	tristate "Amlogic Meson Secure Power Domains driver"
> -	depends on (ARCH_MESON || COMPILE_TEST) && MESON_SM
> -	depends on PM && OF
> -	depends on HAVE_ARM_SMCCC
> -	default ARCH_MESON
> -	select PM_GENERIC_DOMAINS
> -	select PM_GENERIC_DOMAINS_OF
> -	help
> -	  Support for the power controller on Amlogic A1/C1 series.
> -	  Say yes to expose Amlogic Meson Secure Power Domains as Generic
> -	  Power Domains.
> -
>   config MESON_MX_SOCINFO
>   	bool "Amlogic Meson MX SoC Information driver"
>   	depends on (ARM && ARCH_MESON) || COMPILE_TEST

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
