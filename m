Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22443EDE990
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Sep 2023 08:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7KRafdUz2nWLj//GPsbEYmb5CHyJS0fOmaoV7L+bfk=; b=l1/ZnfO75VS45n+AoKXzvLJ71w
	qLlPPSFB081QfXzWeVn+5sbzpz+fTpBcxDD/lQmZ96JVzMM1B15Br55GFpKk0wQuv8zEwgfUzqKc3
	Z7MOvRSuBt1a6tkHXjle4Qe2FFLP9CEDfG9evfpmD1N9LgYG37FgPTdTB1l1EDQA32ev1vDqcUFtp
	weSH0vxbSTo/tOPjniDQfCwXxdxyQl+AxNjPbVwi4A0yaHdQOEUTfjvLw1KOBtyu0d2fgq0aR0qNh
	8iH94ER6MzBY3FHzCVO1d/c+meassj/KPbrIGc6Pq2Ijn83GsF5il/YOkH5qSQRGMaLK9HTT6c7Ro
	51+8rnCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qghgO-007hHY-1M;
	Thu, 14 Sep 2023 08:26:40 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qghgK-007hGN-1e
	for linux-amlogic@lists.infradead.org;
	Thu, 14 Sep 2023 08:26:37 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-402cc6b8bedso7571225e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 14 Sep 2023 01:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694679995; x=1695284795; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ozhl2662G3rZuXjhqsyxszQ7KuzNUqIVHYGmBfOpI3w=;
        b=u/SFrv1dZW+ldhzUlHopaRzUQfBoVt9S+XgdIk91PtKARaci2qu9pXWkQOfRPS/ORt
         jWMwMmd59yAvATu2wDRDRl+628OxQbBj6M/OLSTuu0AIxN2y7aVZn/HmrQ1CtPJjAqYO
         0WbT4uZ5tv6sM3heC4Ef8Xxzsh7q9hqZKzDq2QNXLbnbyjaUht5TKphUKs/ltRKJAWD3
         mUWV2o++pgLhMd5ZNIDS2NkHlDNX3/VdSuSI14lXeWtlhy1Gl6rxi7BU16b62Q6ZrziB
         bIMFVjwHWG28pIOPpLGUA5+eWKZPffiVXLMXPEE/83w8C1EySuRbFZECibFeUrDoucJT
         I0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694679995; x=1695284795;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ozhl2662G3rZuXjhqsyxszQ7KuzNUqIVHYGmBfOpI3w=;
        b=xRb01D/prniyTn/h4FEi0SKJbp0AtO90R/ls5glXA9dr7F88OF7OUdOetnZ8nl2EP8
         /0OxJ1mYnedZX71WZMUAGGAUiArxm8vBjKxAVLagYHDGR7uw+0hBRXZLUriBh2cWcspC
         Put0lykXbchG5XYHWP8PUs0YPHFd9Q3D3hb6jkehetUgMxrIJCJCWUFJ1grcbaaWTUfl
         oDItHfIUcG5IqQvFlseWlN9t5J8ENbprlDh+AZHYTVUR4Po7x/NPqbm59xzWlQfjQOl4
         OUBPGoSz1C9V8Te9W4sDcoRWQAOF1b48bolvLLi5cbG/iGgrRyIPd4l3TiblkwOEjO8m
         CQBw==
X-Gm-Message-State: AOJu0YwNDdd87pHJZytKirhyUzz8KCna57wQP+5y4usHRAL01UpPPdpx
	SN61VjrsR7DpRwmPGxpzRgTOMQ==
X-Google-Smtp-Source: AGHT+IHCLs8m/SAS10M6PicX6kviDEG2v5YMQyuDzcsCpjnm5kBayz0bF2uCzwwp9dshmCx5Y3WdaQ==
X-Received: by 2002:a05:600c:108b:b0:401:bf56:8bb2 with SMTP id e11-20020a05600c108b00b00401bf568bb2mr3729900wmd.10.1694679994725;
        Thu, 14 Sep 2023 01:26:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c61:ffb9:3ed9:c494? ([2a01:e0a:982:cbb0:c61:ffb9:3ed9:c494])
        by smtp.gmail.com with ESMTPSA id w16-20020adfec50000000b003141a3c4353sm1091493wrn.30.2023.09.14.01.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 01:26:34 -0700 (PDT)
Message-ID: <93bb0a7e-3f58-4755-bf31-a694e60760d0@linaro.org>
Date: Thu, 14 Sep 2023 10:26:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/3] irqchip: Add support for Amlogic-T7 SoCs
Content-Language: en-US, fr
To: Huqiang Qin <huqiang.qin@amlogic.com>, tglx@linutronix.de,
 maz@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, hkallweit1@gmail.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20230913080924.3336391-1-huqiang.qin@amlogic.com>
 <20230913080924.3336391-3-huqiang.qin@amlogic.com>
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
In-Reply-To: <20230913080924.3336391-3-huqiang.qin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_012636_572296_96AE1C06 
X-CRM114-Status: GOOD (  14.50  )
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

On 13/09/2023 10:09, Huqiang Qin wrote:
> The Amlogic-T7 SoCs support 12 GPIO IRQ lines compared with previous
> serial chips and have something different, details are as below.
> 
> IRQ Number:
> - 156      1 pin  on bank TESTN
> - 155:148  8 pins on bank H
> - 147:129 19 pins on bank Y
> - 128:115 14 pins on bank M
> - 114:91  24 pins on bank T
> - 90:77   14 pins on bank Z
> - 76:70    7 pins on bank E
> - 69:57   13 pins on bank D
> - 56:40   17 pins on bank W
> - 39:20   20 pins on bank X
> - 19:13    7 pins on bank C
> - 12:0    13 pins on bank B
> 
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
> ---
>   drivers/irqchip/irq-meson-gpio.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
> index f88df39f4129..9a1791908598 100644
> --- a/drivers/irqchip/irq-meson-gpio.c
> +++ b/drivers/irqchip/irq-meson-gpio.c
> @@ -154,6 +154,10 @@ static const struct meson_gpio_irq_params c3_params = {
>   	INIT_MESON_S4_COMMON_DATA(55)
>   };
>   
> +static const struct meson_gpio_irq_params t7_params = {
> +	INIT_MESON_S4_COMMON_DATA(157)
> +};
> +
>   static const struct of_device_id meson_irq_gpio_matches[] __maybe_unused = {
>   	{ .compatible = "amlogic,meson8-gpio-intc", .data = &meson8_params },
>   	{ .compatible = "amlogic,meson8b-gpio-intc", .data = &meson8b_params },
> @@ -165,6 +169,7 @@ static const struct of_device_id meson_irq_gpio_matches[] __maybe_unused = {
>   	{ .compatible = "amlogic,meson-a1-gpio-intc", .data = &a1_params },
>   	{ .compatible = "amlogic,meson-s4-gpio-intc", .data = &s4_params },
>   	{ .compatible = "amlogic,c3-gpio-intc", .data = &c3_params },
> +	{ .compatible = "amlogic,t7-gpio-intc", .data = &t7_params },
>   	{ }
>   };
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
