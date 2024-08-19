Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB70CC52D6F
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Aug 2024 16:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mi8FuZNm5n6hCLymqdxg902z4iuUmorUZVhK2lFkbeA=; b=tw5FV/+2Q6eTPT5ckAVNW4QuL3
	0I4kudatSjcp9+YXsRMcyOJMFbNBiIr88xjzdLpeFFU43CludcFc/usd/ohoVEL71TIqP8FAxdb6j
	V5tpXrPb91FPC973dyd41RZf8b/21t7hc8jJ3pcl59RYXKOxO7LhWH30CyrXQDfkk+iHOpa6eUoZX
	sUMslubIWaPa+HRO8y4th2pa9ZBIzZxlz71Oi1U4d8AnuWd+LP0EvIWOA78mcbQHV8G81u4AN1cDx
	IYe+uRsNJvbnBHtwVP6ekKMJKfeP7ukUR81n4OmX9KuE/x/U1HEYrVAq2aekTdOCXGK2R0Ai0yx0M
	k0F7SWtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5I1-00000002BVS-1wl5;
	Mon, 19 Aug 2024 16:31:29 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5Hx-00000002BT4-2hk4
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Aug 2024 16:31:27 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3717de33d58so2895115f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Aug 2024 09:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724085083; x=1724689883; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1vzoPvkrxUYmA4vkG1jLM7RsiBC+ves8hqeyXsMQo4=;
        b=vEmcQ39quFsxKlLKoQTrS/yGf1tQnZvXNqLJQhpNAdR7NqAxls3sgI9mTp6gSYpWps
         X0xBWZO69fXHtkQV3Cv5S0afJmHI0neDNLEIty3cNHoaLNUrPqzafr9naUrsOIn52i1h
         +Bn7IHVK42hAhQQ3prqMrbL0VB4kZpzutdQsdZQv3alGVt4EHn8sLpwXg2oUyCqIoksl
         ez2209ikiNWaStDvBpU2zzSDpC4lUBvlGOTawvO116fSxGHpCucG+02OSl4j2Q1akO89
         5M+1yZV+hwRO2a5pyQCg4fJ3oVGVICHPC9f6soow+4OZLzpMX+xbpesUa8ERpkMcVFjv
         6ZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724085083; x=1724689883;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g1vzoPvkrxUYmA4vkG1jLM7RsiBC+ves8hqeyXsMQo4=;
        b=lhKgTSYoO48+Hyj3wzYWGQCoUnMtpytzLqv4MHDY4JTzKNYr1dyABPQSkKAjRi1XXP
         FLhTuUMF7eal+XpyI0xAngVDB1lCNDwW+WRoJF5oa0pLiCOXv/CQ3Ei68Bax94AOkPPQ
         H3dtNaqghrp70zJw+S7mUP0GZK29hgY30+3IKpu0oRzIaWipHjYpBYLu9PaOSVVyrQY1
         4HsTl70E2OyIYzIJ+kPlnhRwPPSpvpOiR0RYxK4Tyvj23M5c3vKtsBCJ9lQLmODwD+NQ
         RC9Gi9mN5cWDg23XRWHtDN1P0obP1F3Q9zmsD34RlJq6K4t+oRrFTADV22pXnx4xGMGp
         GYhw==
X-Forwarded-Encrypted: i=1; AJvYcCVRmPotVvBb0xBlr1oQbCouXs3GZRl34jB0fR2xkYDORMnpfNL9i8bw4PzFbMnFq3LpfDg1dAFEtmSt9Z7YOc1BNyUum9WMaAJulXL/dwn6d0I=
X-Gm-Message-State: AOJu0YzS8WaMmsnTMDltgcyXgvMVNzENOZGe+vhB9M4J5+WkCOwa0GkN
	wXteg1Pz0Xu2niHKECocNZb1OjCBGeEF5z2ofsS1Sbuu17lVF6lZV+SOZ0nrs7E=
X-Google-Smtp-Source: AGHT+IEF3YD7UktYIbb2X2tK1RtPMDnoN1l5z4W+kscLDEtPDSFERgrFEcwC+UYnpXBLNPRmVEowLg==
X-Received: by 2002:a05:6000:1112:b0:368:714e:5a5e with SMTP id ffacd0b85a97d-3719431764cmr7859133f8f.2.1724085083063;
        Mon, 19 Aug 2024 09:31:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727? ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898ab469sm10965515f8f.100.2024.08.19.09.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 09:31:22 -0700 (PDT)
Message-ID: <ef485c77-e68b-48b9-9560-159d933bbbc0@linaro.org>
Date: Mon, 19 Aug 2024 18:31:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 7/9] reset: amlogic: move drivers to a dedicated
 directory
To: Jerome Brunet <jbrunet@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
 <20240808102742.4095904-8-jbrunet@baylibre.com>
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
In-Reply-To: <20240808102742.4095904-8-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_093125_735840_8776F6AA 
X-CRM114-Status: GOOD (  18.66  )
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
> The meson reset driver will be split in two part, one implemeting the ops,
> the other providing the platform driver support. This will be done to
> facilitate the addition of the auxiliary bus support.
> 
> To avoid making a mess in drivers/reset/ while doing so, move the amlogic
> reset drivers to a dedicated directory.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/reset/Kconfig                             | 15 +--------------
>   drivers/reset/Makefile                            |  3 +--
>   drivers/reset/amlogic/Kconfig                     | 13 +++++++++++++
>   drivers/reset/amlogic/Makefile                    |  2 ++
>   .../reset/{ => amlogic}/reset-meson-audio-arb.c   |  0
>   drivers/reset/{ => amlogic}/reset-meson.c         |  0
>   6 files changed, 17 insertions(+), 16 deletions(-)
>   create mode 100644 drivers/reset/amlogic/Kconfig
>   create mode 100644 drivers/reset/amlogic/Makefile
>   rename drivers/reset/{ => amlogic}/reset-meson-audio-arb.c (100%)
>   rename drivers/reset/{ => amlogic}/reset-meson.c (100%)
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 67bce340a87e..0c092ae1b411 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -140,20 +140,6 @@ config RESET_MCHP_SPARX5
>   	help
>   	  This driver supports switch core reset for the Microchip Sparx5 SoC.
>   
> -config RESET_MESON
> -	tristate "Meson Reset Driver"
> -	depends on ARCH_MESON || COMPILE_TEST
> -	default ARCH_MESON
> -	help
> -	  This enables the reset driver for Amlogic Meson SoCs.
> -
> -config RESET_MESON_AUDIO_ARB
> -	tristate "Meson Audio Memory Arbiter Reset Driver"
> -	depends on ARCH_MESON || COMPILE_TEST
> -	help
> -	  This enables the reset driver for Audio Memory Arbiter of
> -	  Amlogic's A113 based SoCs
> -
>   config RESET_NPCM
>   	bool "NPCM BMC Reset Driver" if COMPILE_TEST
>   	default ARCH_NPCM
> @@ -343,6 +329,7 @@ config RESET_ZYNQMP
>   	help
>   	  This enables the reset controller driver for Xilinx ZynqMP SoCs.
>   
> +source "drivers/reset/amlogic/Kconfig"
>   source "drivers/reset/starfive/Kconfig"
>   source "drivers/reset/sti/Kconfig"
>   source "drivers/reset/hisilicon/Kconfig"
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 27b0bbdfcc04..bf089176c9f4 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -1,5 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   obj-y += core.o
> +obj-y += amlogic/
>   obj-y += hisilicon/
>   obj-y += starfive/
>   obj-y += sti/
> @@ -20,8 +21,6 @@ obj-$(CONFIG_RESET_K210) += reset-k210.o
>   obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
>   obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
>   obj-$(CONFIG_RESET_MCHP_SPARX5) += reset-microchip-sparx5.o
> -obj-$(CONFIG_RESET_MESON) += reset-meson.o
> -obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
>   obj-$(CONFIG_RESET_NPCM) += reset-npcm.o
>   obj-$(CONFIG_RESET_NUVOTON_MA35D1) += reset-ma35d1.o
>   obj-$(CONFIG_RESET_PISTACHIO) += reset-pistachio.o
> diff --git a/drivers/reset/amlogic/Kconfig b/drivers/reset/amlogic/Kconfig
> new file mode 100644
> index 000000000000..7ed9cf50f038
> --- /dev/null
> +++ b/drivers/reset/amlogic/Kconfig
> @@ -0,0 +1,13 @@
> +config RESET_MESON
> +	tristate "Meson Reset Driver"
> +	depends on ARCH_MESON || COMPILE_TEST
> +	default ARCH_MESON
> +	help
> +	  This enables the reset driver for Amlogic Meson SoCs.
> +
> +config RESET_MESON_AUDIO_ARB
> +	tristate "Meson Audio Memory Arbiter Reset Driver"
> +	depends on ARCH_MESON || COMPILE_TEST
> +	help
> +	  This enables the reset driver for Audio Memory Arbiter of
> +	  Amlogic's A113 based SoCs
> diff --git a/drivers/reset/amlogic/Makefile b/drivers/reset/amlogic/Makefile
> new file mode 100644
> index 000000000000..55509fc78513
> --- /dev/null
> +++ b/drivers/reset/amlogic/Makefile
> @@ -0,0 +1,2 @@
> +obj-$(CONFIG_RESET_MESON) += reset-meson.o
> +obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
> diff --git a/drivers/reset/reset-meson-audio-arb.c b/drivers/reset/amlogic/reset-meson-audio-arb.c
> similarity index 100%
> rename from drivers/reset/reset-meson-audio-arb.c
> rename to drivers/reset/amlogic/reset-meson-audio-arb.c
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/amlogic/reset-meson.c
> similarity index 100%
> rename from drivers/reset/reset-meson.c
> rename to drivers/reset/amlogic/reset-meson.c

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
