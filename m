Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26EACCD4F52
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2026 14:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sKnaITQ8vNF7uuG4Pc0sK5XHgQ4S+qYjKG+hG9ooBLw=; b=x78r53eLLoD5HL+Z8aTsw4bwxH
	tC8VbTYCell8Nc2KHWcKpeW2nKt1238E3CUR40HfVBbJP1aB2JZsYMHOUZkEAbwtdln7Z8l5uGTiw
	jS/6uOHo4kQwxe/xhCVuPs+Ntm5igl+m4g1xgQYaT58gEcKmTe1LI2u3e68VJyGMWFuwmi2qIki9p
	L7SZ+4AMW2GnKajDjpsbzS+zn/8IwPOoGinbaAjqJqm/lIg/TSeJuwc0JgdfJTwG+rMA6GXiaWxp0
	BDBEKZeGdH5CV9U0KFPDpqrFWvwbV3sZPK1qvzewP6DhPYX6sbQZFBl89BFHbnt9v0tUwayqVYgvA
	1cgX1l8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz0o-0000000Fz6R-3ASO;
	Mon, 18 May 2026 14:32:06 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz0l-0000000Fz3e-36Qc
	for linux-amlogic@lists.infradead.org;
	Mon, 18 May 2026 14:32:04 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so13555995e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 18 May 2026 07:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779114722; x=1779719522; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4rDUc5EqEKFX11/kqxVh1oXm8vbkQVcvmcoTJm6o8g=;
        b=EivV4mMmmhCoQfSfrVddiH2WrO4c2QMGe96PfBjfhmFUX+HSDSbLoZgVJgto4MzUZA
         fqBSpwaTZukoW3zf/Y2dQLT2ziNzvyo1nTIhx6zf4SW2HD2fHlPsVhHHPI+pDCOSQcK1
         OpqQAtiuxxlEzl4PrfaK5FBVqiP/0OJfRIV15dgi7CH46VSWJQ1oDQbDQMmWHK0tq/57
         SwBPHyFzCwlQBFHzsMToLe6wk/wln1saH4/wd1kPxamuYQHKI9n0MySzfwT8nsO+U3nD
         t0XeFO/4dQsVUrJvSS7wZok4KySf30K7bWatba/8F9I5XSNnn5ziYwFK9zaQ7ra5kjTX
         4yYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114722; x=1779719522;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4rDUc5EqEKFX11/kqxVh1oXm8vbkQVcvmcoTJm6o8g=;
        b=Fe3/8En7h80ow0RxLHgmU+pusH/RxKuv2THZcxcdOKKqeAfL4cowlSfewaRQqez1v2
         A9ybFdsT+yQMgopyoXHE3Efv+T2YUtGHPusM9yTfp437pmYJELW31/o+TTRYdUBAfQ5W
         fb6d3hVqDJ4+IEFDYaAPlKRfVaAa+XE/cjlgIbjPjyCT3KPihVrcqP1Wcppop8xe+Y+h
         /luPrtjwVRsUwC4969/s+9OSMYoa5jU84Dz48285v0ydriuc3UixzjX9/r37+9Z/I+tm
         CvKz6t73BFk1uuaC+MAu1arN6Uz8li+H6SHafPrtCXjR5InzDi8vUI1/y3W5IKC9htOx
         T6Zw==
X-Gm-Message-State: AOJu0YxXPKNpTPwR7Ui7VCoeH2EDrHvhGELsU1MlToBtWnzAFpmmi9SR
	xjNyYuciwJjU4phdzM9WSH2LjIPvVlA8GfbOQ6y7On4RS5xnLV2vr8wJihRlHLrqQto=
X-Gm-Gg: Acq92OHQbVTukXjt8Vb4JryJZk8tEx0L2p2/Z3otXf8tiWOjiCnjMnlfrE5qbsvV6e5
	lzfMJSzAVg7RwnB6vqsei+CDevYJgEb/3l3WwRjj319rWvEctqmjBC97d7hVmZz/aoxKR3/BIcd
	2bjf9OadgRT02ET9DETPFQos0iwFbMYstVA12oqKBDqHZgkOFXOP9ITQlcvRe9V1PNOGsotjiYB
	kL5q6m5ZVhybaNdYVe+xPGD2xpLDKxqjrkHIwBoAwzE6Y1cdKptyUmls2zeCWET8gY59DYuN2VT
	40ZOE1yXEhfyU2995iQm8GLWW8jqf/jOHpyI2QTee/QJU8xoErv20xH3PKQBUEFyI+MIirzWh7b
	6Q7EpOqfZSxZ3Jl6/+ldnPe1CFZhtx2CUQ26P6mudTXxueNQwhkYolhxTkNZCXlA+duF5yk9iId
	dhFh00Zxsyxl42fEYZs6CWbV7F4STGr8Vwk6hhGPmBApk7KyFDdI0lqk1/Ih8Z39yEHouN11C3D
	gziSX4=
X-Received: by 2002:a05:600c:4851:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48feea99dc7mr117236255e9.7.1779114721755;
        Mon, 18 May 2026 07:32:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1029:e3c5:362e:1250? ([2a01:e0a:106d:1080:1029:e3c5:362e:1250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4dac000sm265809055e9.0.2026.05.18.07.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 07:32:01 -0700 (PDT)
Message-ID: <72b341e6-5ada-48e9-a9c1-a442810b15da@linaro.org>
Date: Mon, 18 May 2026 16:32:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: fix gpio output glitch
To: xianwei.zhao@amlogic.com, Linus Walleij <linusw@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260518-fix-set-value-glitch-v1-1-d350732dc934@amlogic.com>
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
In-Reply-To: <20260518-fix-set-value-glitch-v1-1-d350732dc934@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_073203_827135_E5094C68 
X-CRM114-Status: GOOD (  18.31  )
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

On 5/18/26 10:26, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> When the system transitions from bootloader to kernel, the GPIO is
> expected to keep driving high.
> 
> However, the Linux kernel first configures the pin direction and then
> sets the output value. This may cause a brief low-level glitch on the
> GPIO line, which can be problematic for regulator control.
> 
> By configuring the output value before switching the pin direction to
> output, the glitch can be avoided.
> 
> This commit fixes the issue by swapping the configuration order.
> 
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> fix one issue when set gpio line high.
> ---
>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> index 35d27626a336..1bd58fbbd26a 100644
> --- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> @@ -548,11 +548,11 @@ static int aml_pinconf_set_output_drive(struct aml_pinctrl *info,
>   {
>   	int ret;
>   
> -	ret = aml_pinconf_set_output(info, pin, true);
> +	ret = aml_pinconf_set_drive(info, pin, high);
>   	if (ret)
>   		return ret;
>   
> -	return aml_pinconf_set_drive(info, pin, high);
> +	return aml_pinconf_set_output(info, pin, true);
>   }
>   
>   static int aml_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
> @@ -921,15 +921,14 @@ static int aml_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
>   	unsigned int bit, reg;
>   	int ret;
>   
> -	aml_gpio_calc_reg_and_bit(bank, AML_REG_DIR, gpio, &reg, &bit);
> -	ret = regmap_update_bits(bank->reg_gpio, reg, BIT(bit), 0);
> +	aml_gpio_calc_reg_and_bit(bank, AML_REG_OUT, gpio, &reg, &bit);
> +	ret = regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
> +				 value ? BIT(bit) : 0);
>   	if (ret < 0)
>   		return ret;
>   
> -	aml_gpio_calc_reg_and_bit(bank, AML_REG_OUT, gpio, &reg, &bit);
> -
> -	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
> -				  value ? BIT(bit) : 0);
> +	aml_gpio_calc_reg_and_bit(bank, AML_REG_DIR, gpio, &reg, &bit);
> +	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit), 0);
>   }
>   
>   static int aml_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
> 
> ---
> base-commit: 73d4991a6949eedb51e442d4e81415017d85975b
> change-id: 20260518-fix-set-value-glitch-f43cd366c295
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
