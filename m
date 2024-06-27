Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49DFC2BD09
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jun 2024 11:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fGMDQRr/Rd3VYO4ShrjIYtT5ye8lhSHbGKwhXmj4ROA=; b=MDpDO7KD954C9EPOomifoE1P7f
	4C1luzljFo+WBpYp7cf/68t/F1HFB41M/kWm39cntAuOo6r/uRs94bMp4jqlPOr90pKqN6aU0YToq
	1Xb0iVW5HEnGAyYeTNJTzQtgUU1ikDTW6fsuJNWcNN9Bjk7b/3Xngtw+pyCMCCK+U7hCknBIMc7hy
	RFNIGu+18bPwQQx+YRNKuE9ceqYDxuA87V0qzxcObymGbXJ5nS/8BOpmd8SgiKR/ZAVK/Z4x6wzr+
	qtOgaRAiKXnBbiMPJMjmcA3f9nrJ3GrmiJZEFaS3rypP45qMtZ9cS3s/QBKDYekG8FLlNFhJlw2n1
	kztRxM8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnjm-0000000AEm1-1adO;
	Thu, 27 Jun 2024 11:56:26 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnjY-0000000AEZ7-1qOB
	for linux-amlogic@lists.infradead.org;
	Thu, 27 Jun 2024 11:56:18 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ec3f875e68so86645821fa.0
        for <linux-amlogic@lists.infradead.org>; Thu, 27 Jun 2024 04:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719489369; x=1720094169; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C8v4bFj4iSA3BftmxjwpQi84YY85RY3VBaxhTtWxmhU=;
        b=wTdZ+mywHuJU8mdukqP3fxudrB/7EGqNYfD63Qyjww5UfbW1SjNh27DHL5bdgX21WQ
         CQkYW/gM+oV7j5kDxSMmjvg6auX3L292ADy2w80Du5W+rgoi+P1VHbvXzMHt/RGsJwsA
         lyAOhJea//7dv7KV/gwgkQG0+VDo9y/tck+qi1e8TRtx38oROV19NZmj1UUJoI4e6hQH
         YdYKmyH8rVkbRIyk+h7kCPN//joV83EID5zq7HqpgG7jDeLcyDvPx8rkao6nXsnWHvSz
         78R1PGhjPaT5iPEP2MlGw+ZY0YYiXMu1J8PairumksxTdgzUAwgAWy+mahlPHK1EnaWE
         w0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719489369; x=1720094169;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C8v4bFj4iSA3BftmxjwpQi84YY85RY3VBaxhTtWxmhU=;
        b=KW4+aa5QkjtIPeZqLuBmKustH+9cg6gnW7r/vrGYekt9XAR+rDtud1QZbtVP2wM/hU
         h2t4WVqO0XbAjhZX1a36XzXzHE/J6kdkCNdGQaMODOgFMNN0AL7Q7CRvsWB+INrdfYyv
         BtAoT5etdPJHA4CbyOmNXqOlk4y+JnXKjV0hikQLZirtLLKkcGM4Qf1xDPaX72J5kyP9
         ZgOwq4b21MLLEpQaDm6tCoa60hm1nDjaHO6WBqO1cmA74K6k0Tw+ES36J1dsJk0U4pmN
         tGZfbNVZvkclVd5y4sPF95Qiqk7L8Vhj9NsnLdRfJfdKACptwDWWjuUcPwx1oh8VUSCD
         obZg==
X-Forwarded-Encrypted: i=1; AJvYcCVoxbu1Kbb1GT4cubnj03E973Qu61RNxYhIT6VmyrhgIWgbdciBAh9nEUAwhiG1Hl43UQPM/tsBtp6NrG0QjVitQKr8EyiAKm3qU0SkSFWKTJw=
X-Gm-Message-State: AOJu0Yzmvwl1PqwKiPjibTSGnUE7eWLIQ1Pq82IRhpDtjQw5eiB9VaBj
	FeT3S3P90W2bDOZKpEr2urOQb4K5oVwWHdLufk/zFMEjczasxyfylzei6UM8aFk=
X-Google-Smtp-Source: AGHT+IFLPN71sNJnEggE9GCOJ4P9kwk9N//Zz17QnhrpPaDxo5LCeYSPuflBgcBS1lV/RkJD+is4Lg==
X-Received: by 2002:a2e:8297:0:b0:2ec:174b:75bb with SMTP id 38308e7fff4ca-2ec5b38ad36mr76951971fa.28.1719489368486;
        Thu, 27 Jun 2024 04:56:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:feeb:faed:66fa:9e6a? ([2a01:e0a:982:cbb0:feeb:faed:66fa:9e6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c846a8f0sm63980045e9.42.2024.06.27.04.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 04:56:08 -0700 (PDT)
Message-ID: <cb900231-65d6-404c-8895-e1ee548aef4b@linaro.org>
Date: Thu, 27 Jun 2024 13:56:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: a5: add power domain controller
 node
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
 <20240627-a5_secpower-v1-3-1f47dde1270c@amlogic.com>
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
In-Reply-To: <20240627-a5_secpower-v1-3-1f47dde1270c@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_045613_229893_D9848020 
X-CRM114-Status: GOOD (  11.74  )
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
> Add power domain controller node for Amlogic A5 SoC.
> 
> Signed-off-by: Hongyu Chen <hongyu.chen1@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
> index 43f68a7da2f7..17a6316de891 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
> @@ -4,6 +4,7 @@
>    */
>   
>   #include "amlogic-a4-common.dtsi"
> +#include <dt-bindings/power/amlogic,a5-pwrc.h>
>   / {
>   	cpus {
>   		#address-cells = <2>;
> @@ -37,4 +38,13 @@ cpu3: cpu@300 {
>   			enable-method = "psci";
>   		};
>   	};
> +
> +	sm: secure-monitor {
> +		compatible = "amlogic,meson-gxbb-sm";
> +
> +		pwrc: power-controller {
> +			compatible = "amlogic,a5-pwrc";
> +			#power-domain-cells = <1>;
> +		};
> +	};
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
