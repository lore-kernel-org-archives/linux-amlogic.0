Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36B5C47BCA
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jan 2026 08:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YMHsdBMuAp+ctFjbRuEZ7kbCm1ORW4Uw4Be1g6A7PpU=; b=r0aPQ6I/FApX3rjPZrjlyBE5/n
	BQyds27BFfMb0bCw0BqOrI5L6NC8/cizyjx9ahJs/Ct9fx1nDLqA+3Xzdzg3+bVFv6XXM5fYzRZtn
	uwQO3/KQIRNI/mnuFSipbrKLkZj9zKVwwQR/UJaOIjoLCKJ4hFFT6A7aN2rcv38PqJNTHi96tX+Gl
	ZbhVW2Vl4HYDKxvTLpeTE/Lpezei6d6gaXFmUdGar/q0xkZ3uhIt3T0TzSLeijuBfRbHlh6/hotOX
	1w/pXJOEkR74s5jQ21IicEOBdKQcGdONO9lGWmZPPhx6qJY6oj/F3JV9phiS7FgTHzo8gRVx03Nt5
	V5Q0pBpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2s4-0000000CeTS-1lBe;
	Tue, 06 Jan 2026 08:56:56 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2rz-0000000CeSe-1DSx
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Jan 2026 08:56:54 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-42e2e77f519so426052f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Jan 2026 00:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767689809; x=1768294609; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5XIBpzljoHQjxZKC8ws+REqtExLjvp1kVGJG4on0yQ=;
        b=a39mbopZl83iWR7H2m4Ci4h2DQ99zigffoLIy0NGUnjFokpsMI28DZvYYWZdOE34s0
         I4tmPjA0YOHJ4iZIQ+cYKPyyva9m2Fff3hEqfFouFJBfXoJbOFoduEFiJHhnA58Tr/aX
         cKoI2xoMmOfufVZn5to9EP2pIDNHkqwD77Voq923wPP6VZC4tF9/mTl49BCkvc6XX8WD
         C6M9aeYQ9ZAz7sLm3l4oFVVJjc0929amukOv3jvhLwEDVQc6ugoWk6t/Rc5tvCkFdthZ
         QgLWJs05y1RDTWe7tlATtQ5vHuKQc6qm06umkW6wBxgCIVoFijJw9pTALuNkapeN1fKX
         MQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767689809; x=1768294609;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5XIBpzljoHQjxZKC8ws+REqtExLjvp1kVGJG4on0yQ=;
        b=RLDTuU3vzDITZW2+3T+VtO3GpqG6h0HSyy76dIn9VUI9Slkiec7sZy5JZ88EZex/8g
         0B19GNcA8UfRUG70CG3hRNMxpzz0pPZ1qMZZISse9Wb6thbC50fWsHsMXdE2Lq3KZ+Hl
         YAmekVmoFQ2Eas9SEABuFIc2LKv+iyxDqvhSSH+yiXq+R80ku8TpuXEIpxswCHkc+gMM
         EyBf7t8+6ids55NUkzf1Xl095MfcbF2TzUKlCgRsyqutSxeQfF/CR4VGo9RCU0usAgHy
         FgVDQfek+Ovx6hmfHtfBLrMaoKLSg554epJ8G3dUoIDlpu21kAZ/fTd+v1x+tgANeFAh
         lMYg==
X-Forwarded-Encrypted: i=1; AJvYcCVWKk6Y03PTEE42lZi6iHanZzvoWyyV2+h3KClkqpD97A3Hw8yDYSiSdEvKkQe9ZHOf3Lz3JkqlMV9u4N2c@lists.infradead.org
X-Gm-Message-State: AOJu0YzcnK2PHmzNLv0vj5MlAQmcItzu0YTvMSB4Px9lsZb+Gwx8wKl3
	XrESlX89lImRrmzWT6FZ7wIcbv2/KIFZZPGzOxRVeIX7Ahld6JqgFDU8je0WsHLXsgU=
X-Gm-Gg: AY/fxX7ndE7rrxBxPuFAU1V2kIOp6Wxs1nPstVYvkmTlsUnnDc9CLVwi1aBWZCKifCW
	Mb+NnKbebXs2ojs3ZegOEn43LkUhItVUrfs7WUwkYu2JKg+XzF5pFVTOvNj/nLGQAZ3t6LQThmp
	aai+c4NrKuXabarsluvC6qShM5orB0K/6e+LPGm30kXiNMMZkEjSD8Bt338gMbeqJdkTMeXTsLX
	SYYx3Ip4inFA0McMymCCMiFvIwQdHVtjhU+AsXmp0HeP8RuMCu3PCb9LMk1f5YixfgA9TTmt03t
	8N2C+Ijf4HeahE2/UPonlWoY48DOE7vECvLvqW5Okg+sHrxjlkuAF8x37HwwJq4NoieIlZRuNVV
	4TCRuGY6k08wcRuRMEZqBhe5/jm+gUSZTv+7g/ZkEs9BDVy8asT9fauMRYnKIKNl995y1IU58wP
	7f7/tdAF2hOcJ6MTZ7Azgubp+YNmxElD9BjictaTAbC/wZYvQfM/hR0ReLlADP0lU=
X-Google-Smtp-Source: AGHT+IHVhcrD4cFn15kBjA+uODwKV5wK2G+r23W9N60bAGfWDxnPZimvr/c08dbGWpVozMUlUFTokA==
X-Received: by 2002:a05:6000:2302:b0:430:f742:fbb9 with SMTP id ffacd0b85a97d-432bc9d0f80mr3076920f8f.23.1767689809193;
        Tue, 06 Jan 2026 00:56:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d? ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee24esm3109698f8f.33.2026.01.06.00.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 00:56:48 -0800 (PST)
Message-ID: <728220d3-f093-4252-a0be-c45bf0dab597@linaro.org>
Date: Tue, 6 Jan 2026 09:56:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] pinctrl: meson: extend build coverage with COMPILE_TEST=y
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260106085520.21129-1-bartosz.golaszewski@oss.qualcomm.com>
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
In-Reply-To: <20260106085520.21129-1-bartosz.golaszewski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_005651_366658_8A51C862 
X-CRM114-Status: GOOD (  13.91  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 1/6/26 09:55, Bartosz Golaszewski wrote:
> We currently only build these drivers on ARM but there's nothing that
> should stop us from building it with allmodconfig on other
> architectures. Extend the build coverage for all meson drivers.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>   drivers/pinctrl/meson/Kconfig | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
> index 0315e224bce6..ce6aeec2fc79 100644
> --- a/drivers/pinctrl/meson/Kconfig
> +++ b/drivers/pinctrl/meson/Kconfig
> @@ -15,25 +15,25 @@ if PINCTRL_MESON
>   
>   config PINCTRL_MESON8
>   	bool "Meson 8 SoC pinctrl driver"
> -	depends on ARM
> +	depends on ARM || COMPILE_TEST
>   	select PINCTRL_MESON8_PMX
>   	default ARCH_MESON
>   
>   config PINCTRL_MESON8B
>   	bool "Meson 8b SoC pinctrl driver"
> -	depends on ARM
> +	depends on ARM || COMPILE_TEST
>   	select PINCTRL_MESON8_PMX
>   	default ARCH_MESON
>   
>   config PINCTRL_MESON_GXBB
>   	tristate "Meson gxbb SoC pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	select PINCTRL_MESON8_PMX
>   	default ARCH_MESON
>   
>   config PINCTRL_MESON_GXL
>   	tristate "Meson gxl SoC pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	select PINCTRL_MESON8_PMX
>   	default ARCH_MESON
>   
> @@ -42,7 +42,7 @@ config PINCTRL_MESON8_PMX
>   
>   config PINCTRL_MESON_AXG
>   	tristate "Meson axg Soc pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	select PINCTRL_MESON_AXG_PMX
>   	default ARCH_MESON
>   
> @@ -51,25 +51,25 @@ config PINCTRL_MESON_AXG_PMX
>   
>   config PINCTRL_MESON_G12A
>   	tristate "Meson g12a Soc pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	select PINCTRL_MESON_AXG_PMX
>   	default ARCH_MESON
>   
>   config PINCTRL_MESON_A1
>   	tristate "Meson a1 Soc pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	select PINCTRL_MESON_AXG_PMX
>   	default ARCH_MESON
>   
>   config PINCTRL_MESON_S4
>   	tristate "Meson s4 Soc pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	select PINCTRL_MESON_AXG_PMX
>   	default ARCH_MESON
>   
>   config PINCTRL_AMLOGIC_A4
>   	bool "AMLOGIC pincontrol"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	default ARCH_MESON
>   	help
>   	  This is the driver for the pin controller found on Amlogic SoCs.
> @@ -80,13 +80,13 @@ config PINCTRL_AMLOGIC_A4
>   
>   config PINCTRL_AMLOGIC_C3
>   	tristate "Amlogic C3 SoC pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	select PINCTRL_MESON_AXG_PMX
>   	default ARCH_MESON
>   
>   config PINCTRL_AMLOGIC_T7
>   	tristate "Amlogic T7 SoC pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>   	select PINCTRL_MESON_AXG_PMX
>   	default ARCH_MESON
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
