Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A538FE51FB
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Apr 2026 09:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgR9qD5fKstZnx9MiXrBrMl3GdSo3qPaeBFClUpcwsw=; b=K2L184dIHyINWwmXdlZxlge30L
	QVxint8uPm0jeqTHMd2OBmiF7XZzIGVB7dUI21Q3FNH1jqdWUTR7ajt/onTTK7x2EexFtKoYRpn6B
	FDLcRD32QiXx2OMbdRxvxhltb9j/CWCO6vgCFZpHUXIY4Tj7TfMF1HKeyuydyYpoxePTZYM0J0Zj3
	ZuBoCzpRbeYj5ey7HWSbk5p2cwveZFQIZKHaOPU2rLX56Z1d2sujpoBgmpGidCjR02Iah4b6J3sbB
	zHaQktWoAgASXLvvt5bLuvLKVd/CnyKVBKeTepEOc4MPUxE3n7kTpXdj0HDqJL6pEtA9a0vY1b2gF
	dpzEUVSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDFQ-0000000CyIh-0EoC;
	Fri, 24 Apr 2026 09:54:56 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDFN-0000000CyHs-1fbB
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Apr 2026 09:54:54 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso104432695e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Apr 2026 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024491; x=1777629291; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zThJ7xka7GAiMGXQLkoAOIUMVtbjQJo7uYiMR3WUXDc=;
        b=PXnECEHEF51N2+Uki9OuxqGX33ciFTTiXQZmu6g3LCjdKRqNjmHhuZBSCQCl/X88XU
         NOxgvvr5vqtwajovr2yc6HwO7bebwYp/RB0BUDI+24tIb0grtg5MDMF6AqzoUV/kOiYo
         kmRdLbUh0coiKuK4gl22bmxND5+TnbfKZKL7SXigN4xnw/GRcJYhme0jt56H6ttXMDJh
         kUghADhjOlNHRcoQXskxYUAqQcuMkqdWEI33kZBXW/IwJgFENHH3xcpoN0/NjrkzPe9Y
         yrV9gRRjCM1jH+QClg3R/nWMgGuf1j6EGJHiDrkSzN+/81Saj7dQGjuYXtNM1EwB2D60
         ZURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024491; x=1777629291;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zThJ7xka7GAiMGXQLkoAOIUMVtbjQJo7uYiMR3WUXDc=;
        b=Jtqj5Qj2/wNZ85eaCLUXXy32isHVWUEDOVKoRcbcXDtqpPncuu3GoQFNe7bRYx/6ue
         SVpqf+gL8FA7QsCKhI+dzAcdNXsOQrd2IM4ThY/WFtqfAfDEem0efUqV6+rKUJOoHqIj
         2rbD7hQT+MISv8XvS2vW7bbN4a9j33cR2F3BGpULyzBcHg4hlNkd4uwhtDQrqzW1y+um
         8YUUFPbAYQP6xI6fh3HCLKKEsnW7z0nj1l9BKyCDv6XVO1tzfsfV8AfPUaaHVyLFzWyp
         hhUE9PoNJOUd5Q4nY7nV6LVkq4F1GldYWEl7QgGHaLJgHSNZHcY2cwITINOMWkUNX/vu
         Ehyg==
X-Gm-Message-State: AOJu0YwzRaRz9jFOXsv7SjCr++UKdLdti+NSBiDwk7Rnrrp5iCR7fw21
	acJxpSmLLzgT7dl5oCEKCByMXQOtpPK6xa3bvxFAnXwzSF5KF1HjHwjDJ5PLdWj3fyBvO0tGtjM
	usrEHCO0=
X-Gm-Gg: AeBDievWrZ16UcFybHRqSfCuR0EqFWOBuujriIavOicgpKe7KCmF/xNOONDSpFmQCnf
	OBmAil/liQbOPek9v/AUn2iX60O0ycCJz47MQ0Wb/1CWYLwQg/qpW++hG7b2//+j5WLJHFOWyIO
	vfSEkXorCh+mTIXpkfr1E4ZRiEmoN/e0uiU1A33Sbur27sMjGgW4cgxWbHjft9M/J6EplmdEARR
	3BNGn2iC4l2X4yOCfuNlH7q8dOkasH7UE6CwU/msqS+POwaL+4jo1FBmJ0iLRHMHYaj7uRdBCAq
	TepjTd+H66Nml0uyHLUXQH/OMRod9hBKJCE4NbjefGvcAto0LaY811ChmzuW1SaqclrKYzfBhZa
	IWH21lT19d9ri2zztPcyhz/Sx/DUptrnUSWfQ0ieWjiAdZilp2zB54bLpQOu4S9J7zTwEyZ4GLh
	NwS5q0wE3T5BtahUgtNCjQ12fSeEqKLv2hoXhyAedaL2/PxE2zoNp7ZJEk04bnCWCuKX/G8PxOe
	JxRkRXqIN1Yk+EOmQ==
X-Received: by 2002:a05:600c:3412:b0:489:284:44ab with SMTP id 5b1f17b1804b1-489028446fbmr209624225e9.12.1777024491461;
        Fri, 24 Apr 2026 02:54:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb77b001sm276714125e9.3.2026.04.24.02.54.50
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:54:51 -0700 (PDT)
Message-ID: <bab0f4be-31e1-4fe7-8e90-5131b1ae44b2@linaro.org>
Date: Fri, 24 Apr 2026 11:54:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: fix deadlock issue
To: linux-amlogic@lists.infradead.org
References: <20260422-fix-pinconf-v1-1-abb4d2e0da55@amlogic.com>
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
In-Reply-To: <20260422-fix-pinconf-v1-1-abb4d2e0da55@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_025453_472617_8CCE15B6 
X-CRM114-Status: GOOD (  14.44  )
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

On 4/22/26 13:44, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Accessing the pinconf-pins sysfs node may deadlock.
> 
> pinconf_pins_show() holds pctldev->mutex, and the platform driver
> calls pinctrl_find_gpio_range_from_pin(), which tries to acquire
> the same mutex again, leading to a deadlock.
> 
> Use pinctrl_find_gpio_range_from_pin_nolock() to fix this issue.
> 
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Fix deadlock issue.
> ---
>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> index e2293a872dcb..35d27626a336 100644
> --- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> @@ -292,7 +292,7 @@ static int aml_calc_reg_and_bit(struct pinctrl_gpio_range *range,
>   static int aml_pinconf_get_pull(struct aml_pinctrl *info, unsigned int pin)
>   {
>   	struct pinctrl_gpio_range *range =
> -			 pinctrl_find_gpio_range_from_pin(info->pctl, pin);
> +			 pinctrl_find_gpio_range_from_pin_nolock(info->pctl, pin);
>   	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
>   	unsigned int reg, bit, val;
>   	int ret, conf;
> @@ -326,7 +326,7 @@ static int aml_pinconf_get_drive_strength(struct aml_pinctrl *info,
>   					  u16 *drive_strength_ua)
>   {
>   	struct pinctrl_gpio_range *range =
> -			 pinctrl_find_gpio_range_from_pin(info->pctl, pin);
> +			 pinctrl_find_gpio_range_from_pin_nolock(info->pctl, pin);
>   	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
>   	unsigned int reg, bit;
>   	unsigned int val;
> @@ -365,7 +365,7 @@ static int aml_pinconf_get_gpio_bit(struct aml_pinctrl *info,
>   				    unsigned int reg_type)
>   {
>   	struct pinctrl_gpio_range *range =
> -			 pinctrl_find_gpio_range_from_pin(info->pctl, pin);
> +			 pinctrl_find_gpio_range_from_pin_nolock(info->pctl, pin);
>   	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
>   	unsigned int reg, bit, val;
>   	int ret;
> 
> ---
> base-commit: bd7fd288490c64835a74c05e631c102ce056d5e1
> change-id: 20260422-fix-pinconf-42be1cc2f5af
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
