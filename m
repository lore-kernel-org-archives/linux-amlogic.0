Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C53CC4829A
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 10:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xa4Djg6ex1DV3MzapZ6HTwfkKUATCk01sOGfjmHuM5g=; b=L7AoND7zS/eBCvOgE012wnvOgf
	Hu5hsW6FADURlJ5NnOKIeGk3TTJlzjKL/UaXhjow10YASVpzSygFhpx6BQ5ojOi2CllFYWan1tov3
	5i9wVRAJyG6Y3YUMHig9iRnFzR/me6YLbJjKlqnrIFxcS9JJ8MuR5dvh6Py7I0FpXrFmBjhozAqiN
	xCE2K2nzRjMk9h21V874tZgXorOv2g0BUvAoMHjOwSnHjePuoTuElzeJ+HnDQjuGfVh1EjVhtHtX/
	Az9lBnCcB7vAwbltKakqZXkTI9WG+0pigPNpcRQSxHFN6N7+eZpyibk2ekBJDjwONOJy4LocnIytI
	sWbSZQvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZq0N-00000008p7N-0auX;
	Tue, 13 Feb 2024 10:27:11 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZq0F-00000008p3T-4AVz
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 10:27:09 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2d0a4e8444dso47091691fa.2
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 02:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707820022; x=1708424822; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4c3xyw/xCs2E5+LzzLXM5z0PjXuIuQUQWO5R/iXN6aQ=;
        b=HiOfhSW13b0rv2JJaEUKP1M4PlWQJAs+YWYQ2ZLQdkhQRQaVL3Jp9kftJUioRKetpj
         BbHz2UtNnEoV+QbQXhs/XPoV8PzNsDHqGi5UCAqHB8qKmlH3s0PKi38XtmFL8DcOhHeN
         OJpwFbwKoQ8YOaWdMiSNySsXbLbsXJxy6YCynCIPKLr6VUJe6bIR092psrhRtSmCixXE
         EfBRMbiYqd2IJoOqolbljzFnzaLdOSkVko7zNew4rFZY10RDwFHEaFcT3JCCSfZWazKQ
         QhXDhzeTbHW1C0aTkIY12n0qExNnhtHBTMM6weyBuBlHK54gkYaU2lEzYmD1qWklnsOR
         YgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707820022; x=1708424822;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4c3xyw/xCs2E5+LzzLXM5z0PjXuIuQUQWO5R/iXN6aQ=;
        b=IE4lVW9I2oYDjQ1lM4oIzm9e3EwR5N2I/IDn3t1E1/t8OeRA1xKLW9PtGB8b2NWA+1
         P3ip6CvDofEhCnQBxajXuKH9fBe195ggBHNoRkKvsAw2jh1CX0bpIsJutBYcQvEm2tO2
         72xFBhf85JVVaZHkTV6mEgZIbmUlpnjEhgyKyHmWNIQ0/0CySnM85KbX+ShCX97m5YLU
         Jxt2yboQ5T/r5GeQLn5Fv/A7B0RqPD/+LGXTGYywdWCI3fVc/J8S3IJuAFUQYe3cDAMw
         oQ/Ghn5w3ozQp4/MGUTyOzMmL+L8e1++Oso06j5DamPMhS2rjCigNtr9YVc9+3o1WB5P
         b1VQ==
X-Gm-Message-State: AOJu0YwwFv1AVjHccaTPGJty/Jw/eALaMGM1pd8b557WPF9551JFOoy3
	+MPgq3Ntvk88lLdYmgds/TdoX+96x7MYgR565W9roB86sV2ILQ2c6Sz1QtNQyig=
X-Google-Smtp-Source: AGHT+IHuKNJR46KDTZkQXgqrkgiw2kQoSC8gATB3UY9HLdsK/ekr2G7xO4uo5qQhmNWx/uV2t6T5aQ==
X-Received: by 2002:a05:651c:220c:b0:2d0:d40d:9697 with SMTP id y12-20020a05651c220c00b002d0d40d9697mr2842108ljq.22.1707820021744;
        Tue, 13 Feb 2024 02:27:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVzDhobkhGIrG9q3xJKC52MHcTtp+goBN6WnDQIxmINkGbfXWF5gOZT2IuchNi/rudcx9drENluvxSSxYwPBrVa/Yo0/AWzlRHPOakw/5Bf5hILiF2b9Zv4CqR2CsLOZAqLORBeLd3Zccmw7w2aPDZH7hkWyTGJG8MHPf8ydbI4giufHmVHFdOmR4RzrTqpop1Z++TKxRhTlM0zg0a+5f43yUWASsajh4ug7bha92YREyrHr/JUlHM3Qz3W6MP8PBahCI2WTKCTFU1l1JKrwvSB3tlJco1IEs8ucKtet8HGDQVzg4wzvMZjchnrfUzuHyi3J4r6CQczFl3cYqU2nifdn6niH13N0lo0KmR8NF8A8YJsU1LBWS+yHqAgF1J5MZIM/ZyKjt843pGPFBqcxh2TMF0eKQb4svjyWv3w8bx+I2QazSSvqgIOEFh2rEI5jlDFgM2P1tsnZcnMEXQH2pspXol4oBkMDhCWJHrk8VmIYOk1PDrV4ahV/WFejiGpYlE6zyEY70OAwpCogiEcvS8LlbEryzohGfQQtfKcxyeRlpFDM5pR7YyROzSzXVodK7JKIY5xscPk8IID+Yo2w3TzMGScXrsAC+8/+O8iv8DNbKLqGTg=
Received: from ?IPV6:2a01:e0a:982:cbb0:6dfb:5e62:c51f:304b? ([2a01:e0a:982:cbb0:6dfb:5e62:c51f:304b])
        by smtp.gmail.com with ESMTPSA id m10-20020adff38a000000b0033b0d2ba3a1sm9161150wro.63.2024.02.13.02.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 02:27:01 -0800 (PST)
Message-ID: <01bdaec0-c926-4dbb-884d-2215981299ab@linaro.org>
Date: Tue, 13 Feb 2024 11:26:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] ASoC: meson: add helpers for clk_disable_unprepare
To: Arnd Bergmann <arnd@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20240213101220.459641-1-arnd@kernel.org>
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
Organization: Linaro Developer Services
In-Reply-To: <20240213101220.459641-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_022704_080133_E8CB92EB 
X-CRM114-Status: GOOD (  19.12  )
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

On 13/02/2024 11:11, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Casting between incompatible function types causes a warning with clang-16
> because it breaks control flow integrity (KCFI) rules:
> 
> sound/soc/meson/aiu.c:243:12: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>    243 |                                        (void(*)(void *))clk_disable_unprepare,
>        |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/device.h:406:34: note: expanded from macro 'devm_add_action_or_reset'
>    406 |         __devm_add_action_or_reset(dev, action, data, #action)
>        |                                         ^~~~~~
> sound/soc/meson/t9015.c:274:4: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>    274 |                         (void(*)(void *))clk_disable_unprepare,
>        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/device.h:406:34: note: expanded from macro 'devm_add_action_or_reset'
>    406 |         __devm_add_action_or_reset(dev, action, data, #action)
>        |                                         ^~~~~~
> 
> These two meson drivers cast clk_disable_unprepare() into a different type
> in order to have it automatically called from the driver relase. Add
> trivial helpers to do the same using correct types.
> 
> Fixes: 33901f5b9b16 ("ASoC: meson: add t9015 internal DAC driver")
> Fixes: 6ae9ca9ce986 ("ASoC: meson: aiu: add i2s and spdif support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   sound/soc/meson/aiu.c   | 9 ++++++---
>   sound/soc/meson/t9015.c | 9 ++++++---
>   2 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index 7109b81cc3d0..211f360df284 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -209,6 +209,11 @@ static const char * const aiu_spdif_ids[] = {
>   	[MCLK]	= "spdif_mclk_sel"
>   };
>   
> +static void aiu_clk_disable(void *clk)
> +{
> +	clk_disable_unprepare(clk);
> +}
> +
>   static int aiu_clk_get(struct device *dev)
>   {
>   	struct aiu *aiu = dev_get_drvdata(dev);
> @@ -239,9 +244,7 @@ static int aiu_clk_get(struct device *dev)
>   		return ret;
>   	}
>   
> -	ret = devm_add_action_or_reset(dev,
> -				       (void(*)(void *))clk_disable_unprepare,
> -				       aiu->pclk);
> +	ret = devm_add_action_or_reset(dev, aiu_clk_disable, aiu->pclk);
>   	if (ret)
>   		dev_err(dev, "failed to add reset action on pclk");
>   
> diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
> index 9c6b4dac6893..e0f9a603a5e9 100644
> --- a/sound/soc/meson/t9015.c
> +++ b/sound/soc/meson/t9015.c
> @@ -243,6 +243,11 @@ static const struct regmap_config t9015_regmap_config = {
>   	.max_register		= POWER_CFG,
>   };
>   
> +static void t9015_clk_disable(void *clk)
> +{
> +	clk_disable_unprepare(clk);
> +}
> +
>   static int t9015_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -270,9 +275,7 @@ static int t9015_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> -	ret = devm_add_action_or_reset(dev,
> -			(void(*)(void *))clk_disable_unprepare,
> -			priv->pclk);
> +	ret = devm_add_action_or_reset(dev, t9015_clk_disable, priv->pclk);
>   	if (ret)
>   		return ret;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
