Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE44C3600C
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Apr 2025 07:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GM1nglS/UllWKtgFhnPnnM2K1MPP6fGpucCDZ+0wHY=; b=GD6EbG10NMv9/rflHmDVevvZof
	T7+b1gnN/cOdu5fviko1wZgSXO8pdRFzbNQU8vwQbP9Xi62LymRWibZCv9lb8ASL8+XdMLcCk5jn/
	zUisw4IWu2cJ6XBZDSxdgF9e4LxA29JTwUahP/0CAxfRlWEimzJmlLDAXhSYyCWxYUyevtuJ/YcCe
	aD9rtAV2kBdawk+2YOM5kN6zaQBiMJEaICCKIyvRmJs0m6e/EhRJzCmGIc77/b/B5SEiX/pnb6BoQ
	2HgXYKLRsAgr0UBgAtc1Tb9WuAEL492KW2Qd+0XeicrA+3GsbNxSdIZcShWn/GvoGoQ07OIp+M8GB
	HCjiHZAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23io-000000039KU-0G8R;
	Tue, 08 Apr 2025 07:50:14 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23am-000000037Zp-3k7u
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Apr 2025 07:42:00 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so26582975e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Apr 2025 00:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744098115; x=1744702915; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQBx3vMQCN7LC3XtCmwPt8309d/psSSD/2A8vw8TijU=;
        b=wgDGw/9DQ9KSsdXN0DSBKHzXM4uN7UVJD+N0RZzLCxJQDKkn7ZgJ7Izp6OIrltdhEm
         gOV+7xq8wu1LyYuM+8ZTR0WSI+X45sIJ1Lao3b5vBsBT6KSxCW8KDXqgUBFwXsEn1jYf
         dZcCbrj30C9Ykc3f0FjjyKJG9cojIgqLJUbiVoaQmXFRsYQHVTWYZstyTwFrmCnr2O+1
         cVOPDUX7wvjDz3SyvJRxYmkOlr8Z2UlgnuXc7eq9bxN5ksc8j3jzH24pENNe/uAvhQLs
         Hktt9rl67UD30fap5hPNDHW3B9ZXEZHls219iHGcZw4gG7x1CNL1oCoFgTT4xCwMrKO4
         u7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744098115; x=1744702915;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tQBx3vMQCN7LC3XtCmwPt8309d/psSSD/2A8vw8TijU=;
        b=UJkJEJKPwhQ83xANydEuyHiCTNJIxQTw8wHqsMcbvjDszvxVRFbDlHz3X9jWa4SjQ2
         C6jwZAYA67IOUnx1Zz1SR09yGYNbcEFJBETJuhCCrHHEh6ZVM6tzeBN908wqsPwqF7Hn
         1Rt3A9ODOoL5GtMJAIxm2WnE/Z9pw82a/Cvaj92iDSfWLgowRWFUgRD8350XFEHz+W7z
         DgzvRnAWDq04XGX0ee8KFuKSgBYmbpQB8Bbp7Yn1bcIMWckExLKm65x5Toq7xLZiuOjj
         2xVLldl60EnjHDt/9xpw11nzt1HBk814mZy3ZlIwho8KYp5IEe5YFUTt4sgAtZCoEVAt
         uEpg==
X-Forwarded-Encrypted: i=1; AJvYcCW80q9G7j/xMS5enCEXJNPhpU0LYNNvR9eXiBrp/cvid0WG0cpLJ4aqBDd97fOIUdpVXy+Chkw7zUCRD7jR@lists.infradead.org
X-Gm-Message-State: AOJu0YxzFRk7bH0ta+Wbvqo5IRm9y/LBPymz8UNjMKEbf3UEb/PeGfUr
	qy1xOioHW93oaYoQJfOmUkJ0Ry0ECBac1/4JQfq14rKlntn+L3gppXSWe8f9vwM=
X-Gm-Gg: ASbGncuaq/m5tUe0+QsiFTn6U9jWA8Foh21v4C5lH9T3Fhv2TpSyeP7An1SaMo2yKTC
	/Fg6TkFQw9muYuMtOdM4zNVfknWgcgEqH2Czf/Qc3HsX41Fz+DqQjr1lxuQmpFt5nCq64EIGRg9
	wm7mmFH/Pgf8UKojPjS0nDALrD4zxUHh3DEkv23HIIp3XXsD0X3XRcwRU1Msz1k7VNYFyCvDGDX
	rCRji/6HWR1pT6q3N4A8VDik0Sc6jtUaMFBi1PhUqdjQmAm9iCyE6AWRxeADn+jY6ukwSDwafn0
	bZAonw5Z14Bz/tAlnz25nFYbSJfbJzC95y8SipnEGwztLUqfsPgEuGTXBa3g0WZ7hlMfEJGf+my
	r1/qoXcShPnxuJ0Ygc8N6Pg==
X-Google-Smtp-Source: AGHT+IFByldQ5+nIkIPUYqBDt+YbeQyC/TXD+J4hkwGfx+xeCVHaOyZ6wcecOFkR7gObrVdmBOHTrg==
X-Received: by 2002:a5d:648b:0:b0:39a:d336:16 with SMTP id ffacd0b85a97d-39cb35aa6ffmr13189979f8f.34.1744098114336;
        Tue, 08 Apr 2025 00:41:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3daa:5b6d:6ccb:4c71? ([2a01:e0a:3d9:2080:3daa:5b6d:6ccb:4c71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096b9csm14163670f8f.13.2025.04.08.00.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 00:41:54 -0700 (PDT)
Message-ID: <1b0f322d-94b7-4ba5-8423-eecd835db07a@linaro.org>
Date: Tue, 8 Apr 2025 09:41:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 06/10] pinctrl: amlogic-a4: use new GPIO line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-6-c9d521d7c8c7@linaro.org>
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
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-6-c9d521d7c8c7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_004156_947854_4BA12E93 
X-CRM114-Status: GOOD (  14.82  )
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

On 08/04/2025 09:17, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> index ee7bbc72f9b3..a76f266b4b94 100644
> --- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> @@ -806,15 +806,15 @@ static int aml_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
>   				  value ? BIT(bit) : 0);
>   }
>   
> -static void aml_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
> +static int aml_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
>   {
>   	struct aml_gpio_bank *bank = gpiochip_get_data(chip);
>   	unsigned int bit, reg;
>   
>   	aml_gpio_calc_reg_and_bit(bank, AML_REG_OUT, gpio, &reg, &bit);
>   
> -	regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
> -			   value ? BIT(bit) : 0);
> +	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
> +				  value ? BIT(bit) : 0);
>   }
>   
>   static int aml_gpio_get(struct gpio_chip *chip, unsigned int gpio)
> @@ -832,7 +832,7 @@ static const struct gpio_chip aml_gpio_template = {
>   	.request		= gpiochip_generic_request,
>   	.free			= gpiochip_generic_free,
>   	.set_config		= gpiochip_generic_config,
> -	.set			= aml_gpio_set,
> +	.set_rv			= aml_gpio_set,
>   	.get			= aml_gpio_get,
>   	.direction_input	= aml_gpio_direction_input,
>   	.direction_output	= aml_gpio_direction_output,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
