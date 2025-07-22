Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712FAC83F27
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jul 2025 10:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DWppuobT8kbvh9WquAYPf8uDI5nyNc6Wy2tZij1LAk=; b=3SdxZLcnsUpXBb+7Vki63waHk8
	nJ8ps8CMQCBzbLGS6nQt32tWDeh9QO9DUEOW5E7iwW3e8JgRl6rBIIdNew2hdZQfvk0xMWAhTh6+2
	zuEPMxSXmo7koUpiYOwXsTSCYWtBMeFP1eZkRndLKIiOT8/W4fq6TNIr3q84r+3C3/roTJTfFZIyU
	VGOdjDLhbLWuXiKVYz/9USa8XNii9+DmGHu87IRRWyN879/CeIqx3W9SJG+BW3OM5VHzP6XGWXHCG
	fBSaMbVD3pAruD9lpRmnOcSLE3M0RhRB2y9cd2Aff4PATClY74kl7P9WucMCV3eJyxQPn7HlaABma
	xja7de1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueA1B-000000028DC-1AQf;
	Tue, 22 Jul 2025 10:14:41 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9rP-0000000267x-1906
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Jul 2025 10:04:36 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4561ca74829so58264795e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Jul 2025 03:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753178674; x=1753783474; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=th8LkjBfkv7nYvFuNNGaT8FWdqcCdRHWy+pWo6pVRT4=;
        b=Q2anXAKrnoEru4X3dvRfdOubp9NzXxaS6vNXtHGCzxn6udwZbm7mi5BOTQlu1a7Gv2
         Fq8/ktRIqh9Vfwx8uZRrhTZUnNv9fHNf4G3A5Dv0fGKtaBaYAE7AjU1+yzg40uBMrl/X
         Yx5cUbPeex9rI11mEI45VCi6buZ5AVvkt/K51GVnNLa4j7Dct00jEDawKLvztwjRaIup
         qqnBeEfq5Y4O5PUttCrRE+altxbvEbbgW/tDUvRlBXTNDDF2QyyRUUgV63ISR0thjUOK
         UYZzVnZ9cYCgKr7LXKvR76BGThvLx5F6MlU5xmXQmpDKVDvnCA7R4sL2qc9UWqw5T0No
         Ckbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753178674; x=1753783474;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=th8LkjBfkv7nYvFuNNGaT8FWdqcCdRHWy+pWo6pVRT4=;
        b=esDOq7vt0X9lZuAN6WUztLuvCA003rITU3jHB2N65nY4u3t0wF9hJ2zPu29rSRr2vK
         J2Uv4gzmkVm5KV3EFxt44on8au6BQcE/eOIbR/9/Aily+1iH7K8gUCzWQxqzANjZ88GB
         pwenoW/7BxvA74n4ls8tLz50/qEUzD8iLwzb+xYw+fh5dGQm3FjwA2FMctKXIWTYDxnI
         5A+tljuffmeDu1qHl6C/LgtBuE+gaJWm2XW1B6mmQ7/KK18ZPMm62kyMIIt9Uv4SrMzF
         28Auv0qhQ1cMUWmsDv9sNuLOAdteo8UhhZ9pjUxhIwWvqGa4ObF+V5WKXjwSHnOTmubL
         ETPw==
X-Forwarded-Encrypted: i=1; AJvYcCXhGI+Zr9kCWD2Qg9Myl9cYkFpT6GTscAlnQB32+ocsKRJYRUozZuF6lEranBTTLxSkhEO63DhJAIIBNcAM@lists.infradead.org
X-Gm-Message-State: AOJu0YxSa0T4hEALEEi2TGUO3GkfXzKpoudhEgPaDUzXoeBqt5G42bQq
	RCWcB8l/L5gsn+8YIqDUXa/UT9mXuD1LUFhJFi5nhGme/XA2FvvmcIOu5sppNh5Y0Ao=
X-Gm-Gg: ASbGncvHr2tKt0/OpdvqPubaSHjatcU+ecC3DmghosvdgQCpk59a2G4CsPE0DTjZJHi
	v23aO/8F62UGApMlpsYHd43oQJ23EaCdXxjrLRLcvhUDBdhJh3CTHgj6XLozw7uDbb6MvakC6f/
	u5jCc4Sb0YHOQDEuYrx7zdAP2TWwt6lgiqqIpCApjC2Sshot3wmDnpFyakyJ85LxKu4ajUdiKQC
	rWIEb4y/ygzjB6RQ4PIy5KhNlmjWLK+uVL4MVGyEqnf2ovcwRlaPVpCFXTyR0Erx4rW/fpEb6Hy
	Xop4FU47tDjDPlu0hm6gpiUQ5yxMQjOEGhD85gnmrbCPqq/CdVgbh43zIuP2Htgo9FNyw97l6iA
	lkCfITdGL+7BMyAdNPwbtSEy3drBKOhmnsQ+yAsuIOnwiBxnQ3sGR9i1o/F10wBXgh9NyxrFfWb
	A=
X-Google-Smtp-Source: AGHT+IFejVtWV8JytlClgGlAbQ/sASXBqbtoY0roVwh48A/QZMJB/xCFqE4nYCMj0t7+saAYfB6ttw==
X-Received: by 2002:a05:600c:4688:b0:456:a1b:e906 with SMTP id 5b1f17b1804b1-4562e3cbb03mr196476655e9.33.1753178673594;
        Tue, 22 Jul 2025 03:04:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bce4:725d:6922:d1ba? ([2a01:e0a:3d9:2080:bce4:725d:6922:d1ba])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e7f33f0sm184133915e9.2.2025.07.22.03.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 03:04:33 -0700 (PDT)
Message-ID: <942aa300-fc49-47e8-93b7-85fd1e1fd123@linaro.org>
Date: Tue, 22 Jul 2025 12:04:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/3] thermal: amlogic: Support C3 thermal controller
 driver
To: xianwei.zhao@amlogic.com, Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Liming Xue <liming.xue@amlogic.com>
References: <20250718-c3-thermal-v1-0-674f9a991690@amlogic.com>
 <20250718-c3-thermal-v1-2-674f9a991690@amlogic.com>
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
In-Reply-To: <20250718-c3-thermal-v1-2-674f9a991690@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_030435_332252_7525833E 
X-CRM114-Status: GOOD (  15.40  )
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

On 18/07/2025 08:37, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add the thermal controller driver for the C3 SoC family.
> 
> The main difference compared to other Amlogic chips lies in the
> offset of the sec_ao base (referred to as u_efuse_off), which is
> handled differently. Everything else remains consistent.
> 
> Signed-off-by: Liming Xue <liming.xue@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   drivers/thermal/amlogic_thermal.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
> index 5448d772db12..d1b08119c818 100644
> --- a/drivers/thermal/amlogic_thermal.c
> +++ b/drivers/thermal/amlogic_thermal.c
> @@ -226,6 +226,12 @@ static const struct amlogic_thermal_data amlogic_thermal_a1_cpu_param = {
>   	.regmap_config = &amlogic_thermal_regmap_config_g12a,
>   };
>   
> +static const struct amlogic_thermal_data amlogic_thermal_c3_cpu_param = {
> +	.u_efuse_off = 0x108,
> +	.calibration_parameters = &amlogic_thermal_g12a,
> +	.regmap_config = &amlogic_thermal_regmap_config_g12a,
> +};
> +
>   static const struct of_device_id of_amlogic_thermal_match[] = {
>   	{
>   		.compatible = "amlogic,g12a-ddr-thermal",
> @@ -239,6 +245,10 @@ static const struct of_device_id of_amlogic_thermal_match[] = {
>   		.compatible = "amlogic,a1-cpu-thermal",
>   		.data = &amlogic_thermal_a1_cpu_param,
>   	},
> +	{
> +		.compatible = "amlogic,c3-cpu-thermal",
> +		.data = &amlogic_thermal_c3_cpu_param,
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, of_amlogic_thermal_match);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
