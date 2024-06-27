Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20188C3064D
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jun 2024 11:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u72oS0px4uDfMR3v60Sf+ZfjLN24ZQL2W1/+WSaA3FE=; b=CyZTDGcPdD8LVAGGtHeYtmfQ53
	sYtjPcrHnxl3UhZhCfNuN/SFnmkAI6O/1d+FVTgXnBLchdeoC+mSFATh6mPMeLwk6VoVp9riuiHYI
	MuyhgwuzmOgnrYpLsuXHX9pi+j2Rfj5j+lfplMYT/KDoj2aWjFd2cXuSMQRLxUMdxNLx34OdCde0Y
	cso4OLtTVo+8NUg6vodXL3H2vrD+TwoBafoC3blaCa0/Nnb3pE8ZVDB3g2Y7BbVK2sFc5kxahHz23
	9t+HF2zQfAJfV6UHn2p0lT8v5Rp54YN4foIovqaaGmrMRcDtn7Lyr/s4g7IMOulo/mrK6MYcwz3tI
	AzbXNh2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnjk-0000000AEk7-1a31;
	Thu, 27 Jun 2024 11:56:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnjY-0000000AEYk-12NT
	for linux-amlogic@lists.infradead.org;
	Thu, 27 Jun 2024 11:56:17 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-424acfff613so22048705e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 27 Jun 2024 04:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719489360; x=1720094160; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9KU4qzH+h7V/7aVO802pijoB5rQAb96UeWF6ZLoDpqs=;
        b=dJlllXQ8/gbNfYLiDdg71E0tn/Wwj3Xp2qWMZYh2ETVQzdDWVQ9A13O0rBCZlQlyvr
         JyHYrQKTT4WIX9CdtZkaW1C8bIJiayN/IwDaR+73ZYM2dkmJBPtAjL/MgVdlrzr6PLL1
         ViAcJo+Tq0VavQ35MWYMY9Dx+OL40iUM4sd4CsVw8HQDkGDoGu02tBYNbYB9M9ybvmDG
         T5UztyzwqlxqUIFNAIVTrY2HYQTG890qWj2tw8OB6Q98R0Bj2E8pbJmlBxGEg7+Uqc9r
         7sxVkgmrvlPy+jrKW3somi0XQ1B9X4UsYaZ2yxjRPLibFnf9Tgz0nxUgudE905hLM4xy
         eslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719489360; x=1720094160;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9KU4qzH+h7V/7aVO802pijoB5rQAb96UeWF6ZLoDpqs=;
        b=DrX+0hAEicmG/seY3GTvzd9mOkOlG5/nco5TafhIw1/0jG8yZYPErBp7H5mkBkq3k2
         VW0YqfBG2yyysypsp3nY6ka3ILGucSyc9e443hW1IBleS2ttpRstd/5gPLhmxyO37zCR
         2ow5qyLbZWkpmaxVWva56AeQNsVkvxERmNGMizSC/cYoBeim30umXKYsuOMUOgvmfVRL
         Es+qjBtv1NJZjWpYKeF8wELCMGZyK/EBMPJTwoHYRTBW6WgucipWUjlJaPZ1zG/Exw7q
         cRIw3Qx/RYw6t+oCO6uniTI5bl8w+TJfa7wXg0Oj/snglQ1hFpIBYzea3JxMZrsm7hWL
         0Bbg==
X-Forwarded-Encrypted: i=1; AJvYcCW718fC2KE3wzAtT9rERInjrQ3gl2PH/Bxu8G5PcQoaMaBFLANBJ/ww5iLMIf9BlceqQnJCUj3hqRsWwA+zoRUrIuJf7771vqw1KV/yofy4xkM=
X-Gm-Message-State: AOJu0YxP97E8HMq3Boe99865XGmGGeCXDPNNmALVaUSlbzVpA7x+xEX7
	jG3HgNiMl+3o99yFmFpEo5JoD+w00Q3cNwDlnXuaRFdZYRJ/h0M3yilcHktxAtI=
X-Google-Smtp-Source: AGHT+IGBQCwpcaZZygnFzFlfZfQDzSHbl0uIqHSmT2U3e/bWD6hKD6LiSAzVdptAdejwJkAZgCRqiQ==
X-Received: by 2002:a5d:410a:0:b0:367:437f:1785 with SMTP id ffacd0b85a97d-367437f198dmr1106036f8f.13.1719489359780;
        Thu, 27 Jun 2024 04:55:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:feeb:faed:66fa:9e6a? ([2a01:e0a:982:cbb0:feeb:faed:66fa:9e6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3674369eb94sm1595939f8f.98.2024.06.27.04.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 04:55:59 -0700 (PDT)
Message-ID: <6c9a791b-aaef-4ad0-a10d-ec3acb42ac32@linaro.org>
Date: Thu, 27 Jun 2024 13:55:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/3] pmdomain: amlogic: Add support for A5 power domains
 controller
To: xianwei.zhao@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, Hongyu Chen <hongyu.chen1@amlogic.com>
References: <20240627-a5_secpower-v1-0-1f47dde1270c@amlogic.com>
 <20240627-a5_secpower-v1-2-1f47dde1270c@amlogic.com>
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
In-Reply-To: <20240627-a5_secpower-v1-2-1f47dde1270c@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_045613_137282_9198B49B 
X-CRM114-Status: GOOD (  15.21  )
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

On 27/06/2024 13:47, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add support for the A5 power controller, whose registers are
> in the secure domain and should be accessed via SMC.
> 
> Signed-off-by: Hongyu Chen <hongyu.chen1@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   drivers/pmdomain/amlogic/meson-secure-pwrc.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> index df5567418226..f6729eea6b8c 100644
> --- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> @@ -15,6 +15,7 @@
>   #include <dt-bindings/power/meson-s4-power.h>
>   #include <dt-bindings/power/amlogic,t7-pwrc.h>
>   #include <dt-bindings/power/amlogic,a4-pwrc.h>
> +#include <dt-bindings/power/amlogic,a5-pwrc.h>
>   #include <linux/arm-smccc.h>
>   #include <linux/firmware/meson/meson_sm.h>
>   #include <linux/module.h>
> @@ -155,6 +156,22 @@ static struct meson_secure_pwrc_domain_desc a4_pwrc_domains[] = {
>   	SEC_PD(A4_AO_IR,	GENPD_FLAG_ALWAYS_ON),
>   };
>   
> +static struct meson_secure_pwrc_domain_desc a5_pwrc_domains[] = {
> +	SEC_PD(A5_NNA,		0),
> +	SEC_PD(A5_AUDIO,	0),
> +	SEC_PD(A5_SDIOA,	0),
> +	SEC_PD(A5_EMMC,		0),
> +	SEC_PD(A5_USB_COMB,	0),
> +	SEC_PD(A5_ETH,		0),
> +	SEC_PD(A5_RSA,		0),
> +	SEC_PD(A5_AUDIO_PDM,	0),
> +	/* DMC is for DDR PHY ana/dig and DMC, and should be always on */
> +	SEC_PD(A5_DMC,		GENPD_FLAG_ALWAYS_ON),
> +	/* WRAP is secure_top, a lot of modules are included, and should be always on */
> +	SEC_PD(A5_SYS_WRAP,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(A5_DSPA,		0),
> +};
> +
>   static struct meson_secure_pwrc_domain_desc c3_pwrc_domains[] = {
>   	SEC_PD(C3_NNA,		0),
>   	SEC_PD(C3_AUDIO,	0),
> @@ -335,6 +352,11 @@ static struct meson_secure_pwrc_domain_data amlogic_secure_a4_pwrc_data = {
>   	.count = ARRAY_SIZE(a4_pwrc_domains),
>   };
>   
> +static struct meson_secure_pwrc_domain_data amlogic_secure_a5_pwrc_data = {
> +	.domains = a5_pwrc_domains,
> +	.count = ARRAY_SIZE(a5_pwrc_domains),
> +};
> +
>   static struct meson_secure_pwrc_domain_data amlogic_secure_c3_pwrc_data = {
>   	.domains = c3_pwrc_domains,
>   	.count = ARRAY_SIZE(c3_pwrc_domains),
> @@ -359,6 +381,10 @@ static const struct of_device_id meson_secure_pwrc_match_table[] = {
>   		.compatible = "amlogic,a4-pwrc",
>   		.data = &amlogic_secure_a4_pwrc_data,
>   	},
> +	{
> +		.compatible = "amlogic,a5-pwrc",
> +		.data = &amlogic_secure_a5_pwrc_data,
> +	},
>   	{
>   		.compatible = "amlogic,c3-pwrc",
>   		.data = &amlogic_secure_c3_pwrc_data,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
