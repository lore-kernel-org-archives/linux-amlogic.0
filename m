Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F968C369A2
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Apr 2025 14:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94+P5pwM5u/1o6/d5OXFLIgA7eMTp3yu8Ewl/gNWvUI=; b=Eh6A7za8kdAwWqf1mP3GwhNvSZ
	i3DC+9KJGyGSjH2iHjZ+swPdesHjlOwJQGtwBtEnG3WmPV2lvhO7FDM0ZjxZ18KwSwRqQCenjk4am
	JxgknhKkry4u9Dqf0j6hqEdYZl734iTY5S8keByZcz4Lxvvq9OW0iN7rVOUqAHdoI2sFL+Fz2rnzi
	NWaD6sMhOrSaZFbuictDkaNevZ2WeIfCUTUTcrPqfNiRfYan2ceInMd7FjdYgbKYuyFZt7DuB7u2/
	W5iPFJ3VHeHwS2BRN0AJgN7XJmdKPlauATEj1W+Ek03Vv+FXHmD5UoOpJXu9tRH1sKdvtJ+i87fLh
	fQFPwsXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29xX-00000004OAb-0WPR;
	Tue, 08 Apr 2025 14:29:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29vV-00000004NVM-33Ha
	for linux-amlogic@bombadil.infradead.org;
	Tue, 08 Apr 2025 14:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=F6HfW0vkjtlkAm7uksKgsKqVu9qIf8mOl8bnZ7ef7cg=; b=pcj3DWdWHnsxNskiwyVZkMg396
	mhW8qpHrNBz+1WYhsNMbAeMvc+JxaRwsKYQjAHyOAGb42qfgQH2Pq9w1DwtQQhPyuCygOf9fr8+Ij
	S7hYUDvpJ0Yq+Ek8DGGXVJDESeMt/djllCiqbBVY8Ijj2g9yNJL9ofStH0r65pmiKaRE30rqsdV9a
	MRxhp4uMs24PcxiQllDKDO80Un7UOoyjGFasDrwXk9voe4szGy6w93YD4RsElZxMS4J43pzcPNzIw
	ZNpvX/WhTMmRsMML8MLaiHVEkU675pI4mO+Q+LlNwBLb1CtG491wIVwW9sBKOOPpYBoBAkCQFqEar
	qEjxkmTg==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29vS-00000008Jvd-2OJU
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Apr 2025 14:27:44 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so44389805e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Apr 2025 07:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744122460; x=1744727260; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6HfW0vkjtlkAm7uksKgsKqVu9qIf8mOl8bnZ7ef7cg=;
        b=vGybNqhmbby6gM9mPhNcOCl+BjcSwqfW2NVQAoKAm+vcqxVqHreQJaSA/ShRVScniO
         eUZovLngOR1gwRP0DunN0H8LzMM3cweEY8ic4VNjND1dVsl1NR2yjzK1H/uaypKXpJ/r
         OEwK1anSzY5HfSMZks11J+pshAeuN7KoSINgp9skr89+lZsuzw8BRYgYe3zNxGnxcV3+
         00LHjkSqdJSUH6BF9Qvk6I/ACkZR71mZ92V2gmjQ/FGDD/E9EnmAk3rJjH22NDQF1HBK
         FZNqqG5jwjBpaYU1WcEvRVW8HIMDr8OInHwwBUMqmbjVvrygLwwkeJxDxh+8f6G5L/Th
         yoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744122460; x=1744727260;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F6HfW0vkjtlkAm7uksKgsKqVu9qIf8mOl8bnZ7ef7cg=;
        b=cGl3o0ZkeMVgeOwABFzmoodAog4mHZZX++gCv2QKbVZumQCC5EQlpGixI1fRbYQ156
         1WcSk6JNtqjMrHK9xMcV1CDP9cGXSZaa2VlAPdYYSmExcRlJtVAJlgbsMAi4rCObyhQL
         5CvLcDMSFss+/B2rIHz8+x1aHdtsgPSaVw4cFX1badEGri8AzXsN9bYNEVA2ArMD+CFL
         /RxvQ0iPNQxnBKhiz560fgkSYMSc6ysCxC0mfZhxxWMzYnKLktOzBLEXP8+dbzrY4ex0
         Jl7BcB3gYSjYsdF8G7kurY2GGDYzpFILBGOiNrGLcI3yrhWdK99UxjYCbTTXM1g5IcMs
         6FeA==
X-Forwarded-Encrypted: i=1; AJvYcCX3/ucEbOYataOJ0/3WmtDeYdPhm3jiXcAfJXHlx120J/6e1ownNOSgRAfHxAyIqF83sFvN3NRor1NAAljC@lists.infradead.org
X-Gm-Message-State: AOJu0YyUtYvFkETHVdTFBm7rEox0vpq9UxPGv3DPcELly8F1cFiHJ0dr
	vo0UByZblH1YeLKW0HGgaPk0o5uMDyxGywN4HVoH+c3W26pFjyUAK2wCjMpbrVI=
X-Gm-Gg: ASbGnctyFKlHY1HtvVcCyvaRlmV5m5EfxZmdiyS9Qo4Fjc2EcpDjToXfAy6fZUA/RxL
	OSmDT56iGG6P5cKpTWEOV1h4wVeYtz8t5TV1MkCUOXHs7yu5w6A7GC/naA6pL2a9wytmNCAHko4
	BpxrNMkHnQs6xlX4/rMv5BFW91SvisQLV26zf2UKP78K4rdcGipjsv181p7V7ax7wWDaZnMplE4
	LVqESuQNZR9E3lyoR79F8mpnNfbX9Qh1EG5JJZgtaEHIgr80I9aD93w4/gAKIjbkTyibrKQj3LT
	NHgILt2hYIG3o3FhTewPQlzURuy3xtyIY969ua7uwsupILQgvtoe18RpOuF9U1jHoLejWPKfkCo
	2lnk1O6QIX0UGQllpriMC0A==
X-Google-Smtp-Source: AGHT+IEFzSlrXkuwJ4BeZNVJDc79m98CBMUnaDEEBTa0PE1ADYZ4JU0DGBnfFovWynU4GuvtS6T8sQ==
X-Received: by 2002:a05:600c:5346:b0:43c:f597:d582 with SMTP id 5b1f17b1804b1-43eda5d8460mr90477265e9.1.1744122460377;
        Tue, 08 Apr 2025 07:27:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3daa:5b6d:6ccb:4c71? ([2a01:e0a:3d9:2080:3daa:5b6d:6ccb:4c71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3429f67sm169744825e9.7.2025.04.08.07.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 07:27:40 -0700 (PDT)
Message-ID: <ba7e31ff-5744-4409-921f-e2014f23151b@linaro.org>
Date: Tue, 8 Apr 2025 16:27:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 08/10] pinctrl: sx150x: use new GPIO line value setter
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
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-8-c9d521d7c8c7@linaro.org>
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
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-8-c9d521d7c8c7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_152742_846641_5763F81F 
X-CRM114-Status: GOOD (  18.27  )
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
>   drivers/pinctrl/pinctrl-sx150x.c | 23 ++++++++++++-----------
>   1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
> index 98262b8ce43a..d3a12c1c0de2 100644
> --- a/drivers/pinctrl/pinctrl-sx150x.c
> +++ b/drivers/pinctrl/pinctrl-sx150x.c
> @@ -432,24 +432,25 @@ static int sx150x_gpio_oscio_set(struct sx150x_pinctrl *pctl,
>   			    (value ? 0x1f : 0x10));
>   }
>   
> -static void sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
> -			    int value)
> +static int sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +			   int value)
>   {
>   	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
>   
>   	if (sx150x_pin_is_oscio(pctl, offset))
> -		sx150x_gpio_oscio_set(pctl, value);
> -	else
> -		__sx150x_gpio_set(pctl, offset, value);
> +		return sx150x_gpio_oscio_set(pctl, value);
> +
> +	return __sx150x_gpio_set(pctl, offset, value);
>   }
>   
> -static void sx150x_gpio_set_multiple(struct gpio_chip *chip,
> -				     unsigned long *mask,
> -				     unsigned long *bits)
> +static int sx150x_gpio_set_multiple(struct gpio_chip *chip,
> +				    unsigned long *mask,
> +				    unsigned long *bits)
>   {
>   	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
>   
> -	regmap_write_bits(pctl->regmap, pctl->data->reg_data, *mask, *bits);
> +	return regmap_write_bits(pctl->regmap, pctl->data->reg_data, *mask,
> +				 *bits);
>   }
>   
>   static int sx150x_gpio_direction_input(struct gpio_chip *chip,
> @@ -1175,7 +1176,7 @@ static int sx150x_probe(struct i2c_client *client)
>   	pctl->gpio.direction_input = sx150x_gpio_direction_input;
>   	pctl->gpio.direction_output = sx150x_gpio_direction_output;
>   	pctl->gpio.get = sx150x_gpio_get;
> -	pctl->gpio.set = sx150x_gpio_set;
> +	pctl->gpio.set_rv = sx150x_gpio_set;
>   	pctl->gpio.set_config = gpiochip_generic_config;
>   	pctl->gpio.parent = dev;
>   	pctl->gpio.can_sleep = true;
> @@ -1190,7 +1191,7 @@ static int sx150x_probe(struct i2c_client *client)
>   	 * would require locking that is not in place at this time.
>   	 */
>   	if (pctl->data->model != SX150X_789)
> -		pctl->gpio.set_multiple = sx150x_gpio_set_multiple;
> +		pctl->gpio.set_multiple_rv = sx150x_gpio_set_multiple;
>   
>   	/* Add Interrupt support if an irq is specified */
>   	if (client->irq > 0) {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
