Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AD4C25B78
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 May 2024 08:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8RkzXM6v/9IbpxDx3dbPA6NyEWpzM7yjIhF0Tbyi+M=; b=Xq4/WBnOFDxfnk17tA8CUcGJ6m
	0AdOzMCiARKpy9LS+7h7f1bHfM6c2I3YNd6OnzIyw+nQmYw5PtDVmA+PDzig3kSa9mLgNzJ0FtexV
	cOwIim2VjVgge2wFNz4Bfo//4PPYZY2a+cBePemtXIg9bd4/joyS5KSdlD+3dfsfbYViNZy7jsJdG
	M3WQzWQsp1IbwOdXcWbqI9A7hQfOmv7I+N6xWdZXehL6knxSRRiqCdPCHXTEJ8tj2DcBPMagb5Riz
	nLzvk6mGExzV8dbIkQcF8T7fpa4Gp3L/8qg+2L6otzQbgJ5j9MHjvu4xPiTlqHsj04kC+mXZ1WZN9
	9AAwAJEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBsPD-0000000HWBz-1JIK;
	Tue, 28 May 2024 08:42:03 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBsP9-0000000HWAF-2ztj
	for linux-amlogic@lists.infradead.org;
	Tue, 28 May 2024 08:42:01 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5238b5c080cso658658e87.1
        for <linux-amlogic@lists.infradead.org>; Tue, 28 May 2024 01:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716885717; x=1717490517; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQM6HYhZbxPatU25g9nxoYtgAi0elYZKvX9/9nM9Kkg=;
        b=cUdauURSDemFIqyhUzGEHEimote0dpWZBuHUjJ/PGiwH11X948A44z1uMT/cDPgHn+
         uixd/VMeiGFv/vjlkHpWXm1mB36TPoFHf5gm6zRv+GXjhngfMLROWji2sgztk3zxa2U5
         xV/HRr1AUrqC4P6N/LY3YgyqLMHo8UghaG8Z2Si89OysBfa/OftEDh/k24s4rRylp6EM
         UcsRmk2va7/zV43y8qEB2jFiIOEgWD3VuRcVrF9UprPG8cXo51savLvSWwvdMdLmITcf
         j7XZk3p3oOfRVNZNkras0+upSdqup0SL19k+U8fpcaJdSLr/H9bJFoKc5182sBEj5CIB
         i+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716885717; x=1717490517;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kQM6HYhZbxPatU25g9nxoYtgAi0elYZKvX9/9nM9Kkg=;
        b=aHAAkBcmnAXC0d8rpnh12RgMdE8iuQy85f7w350reCMxmJpkWuQyzOeP6HVO4lonPy
         ROmUr+w1AmMM+fvNz9C4+Nu2ZlkFHG5+9yF0fDKYxFVcmJ7HWl/g1Ep45a6XTJYrJ0bt
         20qOLc9DrEthCu1R3lK6b0XQ2X1wqg8p3frABxahKhXelocUWA+MfELeM1UAGkBsFARA
         e77vkbhZl1Kok/nBHeggOyVoRa2oTURqoJibigRCaFPZ6tBv1ARvZJpvCIPmNzmIINnf
         f6WL2Opd5OdoK2OG3/1WrxYVb+mrkSp9GQWJ7yPteTSpdEUeoaH24vZQzbK4DUwagoxX
         siEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8vBtkblxPBFzgs/eR7udeXuQJ10OoWJBLrPz0jzDBBgLtwsmpajbKh4KusnHFE9gD7NlA8RpcruQlEW9q3F6T4obL01g42BKzm2JyDVm2H4w=
X-Gm-Message-State: AOJu0YyFkODMcBFhqAguYaGreFmZ8nl7iqWHIwqJz9O0lr0u6g7HHbkD
	cKW/hW6WWBpIVm1bDzyB2it0snRO8pT7dTdhb+MrH+J/Gj7uNiKapOI8jlu75Lo=
X-Google-Smtp-Source: AGHT+IHSmbsd+w6NOeeMhcyPQNGVPQBayOgoB5Rg4ZeNC9bV0ohtGlQncUQuOB9hXyz9tT97E7C4MA==
X-Received: by 2002:a05:6512:3e13:b0:524:43b2:d326 with SMTP id 2adb3069b0e04-52964ca75d5mr8748177e87.37.1716885717433;
        Tue, 28 May 2024 01:41:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8f19:f965:3f93:6385? ([2a01:e0a:982:cbb0:8f19:f965:3f93:6385])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4210896676bsm135394835e9.4.2024.05.28.01.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 01:41:57 -0700 (PDT)
Message-ID: <2f074d47-3021-4d81-93cd-c8e4593f0b0f@linaro.org>
Date: Tue, 28 May 2024 10:41:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/3] pmdomain: amlogic: Add support for A4 power domains
 controller
To: xianwei.zhao@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20240528-a4_secpowerdomain-v1-0-2a9d7df9b128@amlogic.com>
 <20240528-a4_secpowerdomain-v1-2-2a9d7df9b128@amlogic.com>
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
In-Reply-To: <20240528-a4_secpowerdomain-v1-2-2a9d7df9b128@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_014159_793984_4667BFA7 
X-CRM114-Status: GOOD (  15.89  )
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

On 28/05/2024 10:39, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add support for A4 power controller. A4 power control
> registers are in secure domain, and should be accessed by SMC.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   drivers/pmdomain/amlogic/meson-secure-pwrc.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> index 4d5bda0d60fc..3a84d8a74a5e 100644
> --- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> @@ -14,6 +14,7 @@
>   #include <dt-bindings/power/amlogic,c3-pwrc.h>
>   #include <dt-bindings/power/meson-s4-power.h>
>   #include <dt-bindings/power/amlogic,t7-pwrc.h>
> +#include <dt-bindings/power/amlogic,a4-pwrc.h>
>   #include <linux/arm-smccc.h>
>   #include <linux/firmware/meson/meson_sm.h>
>   #include <linux/module.h>
> @@ -136,6 +137,24 @@ static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
>   	SEC_PD(RSA,	0),
>   };
>   
> +static struct meson_secure_pwrc_domain_desc a4_pwrc_domains[] = {
> +	SEC_PD(A4_AUDIO,	0),
> +	SEC_PD(A4_SDIOA,	0),
> +	SEC_PD(A4_EMMC,	0),
> +	SEC_PD(A4_USB_COMB,	0),
> +	SEC_PD(A4_ETH,		0),
> +	SEC_PD(A4_VOUT,		0),
> +	SEC_PD(A4_AUDIO_PDM,	0),
> +	/* DMC is for DDR PHY ana/dig and DMC, and should be always on */
> +	SEC_PD(A4_DMC,	GENPD_FLAG_ALWAYS_ON),
> +	/* WRAP is secure_top, a lot of modules are included, and should be always on */
> +	SEC_PD(A4_SYS_WRAP,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(A4_AO_I2C_S,	0),
> +	SEC_PD(A4_AO_UART,	0),
> +	/* IR is wake up trigger source, and should be always on */
> +	SEC_PD(A4_AO_IR,	GENPD_FLAG_ALWAYS_ON),
> +};
> +
>   static struct meson_secure_pwrc_domain_desc c3_pwrc_domains[] = {
>   	SEC_PD(C3_NNA,		0),
>   	SEC_PD(C3_AUDIO,	0),
> @@ -311,6 +330,11 @@ static struct meson_secure_pwrc_domain_data meson_secure_a1_pwrc_data = {
>   	.count = ARRAY_SIZE(a1_pwrc_domains),
>   };
>   
> +static struct meson_secure_pwrc_domain_data amlogic_secure_a4_pwrc_data = {
> +	.domains = a4_pwrc_domains,
> +	.count = ARRAY_SIZE(a4_pwrc_domains),
> +};
> +
>   static struct meson_secure_pwrc_domain_data amlogic_secure_c3_pwrc_data = {
>   	.domains = c3_pwrc_domains,
>   	.count = ARRAY_SIZE(c3_pwrc_domains),
> @@ -331,6 +355,10 @@ static const struct of_device_id meson_secure_pwrc_match_table[] = {
>   		.compatible = "amlogic,meson-a1-pwrc",
>   		.data = &meson_secure_a1_pwrc_data,
>   	},
> +	{
> +		.compatible = "amlogic,a4-pwrc",
> +		.data = &amlogic_secure_a4_pwrc_data,
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
