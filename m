Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26D4C25B76
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 10:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vvofrTVf9cJzDAGBXKvstZtAHFyVlt4osWmFi5gNHgU=; b=jiURIj+xe8q65kmG17rFJxF4ve
	ljChuJo9B0D8DnwF9pMjestetaPTX9/q40QqdyS6sLExTgqxJRVEmvWFgjFoDdpTXkNuo8Oo38tpb
	f/E/QDKLtNz6YOgSf5SJYRTM6yeXuH811pIX8JUAYSiqtNiE94U0olfMYEIvfx5tTAm8XYoz5XmYW
	ibsY04eoe9uTSrj4+jvn1fIcTKF/3cytQ7M7RLoUKXor0uEqWQM6iPUtmwMIL/tnhpjAsfD1d2WtZ
	9avtpfGwbrmvmf3kc/4BEtEjE94nz6HfsenstgQhk5qbzuYHwuLRKy0ExdhCYFZe9NOOwsbWhG+G2
	27mg7XrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEnY9-00000005WoB-3USQ;
	Wed, 05 Jun 2024 10:07:21 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEnY6-00000005WmV-4Apx
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jun 2024 10:07:20 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-52b976b5d22so3973580e87.1
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2024 03:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717582036; x=1718186836; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y5v2wvzfpTFQoJgp9Ncwu8fEm9eW+i4elxXXvmKBJ7o=;
        b=kjJR1h7nvIa7NeHw1swZUGoWsN1TVWiItsMqp1yLnY8PopyyUz5EAPyEm7ZG5/acvV
         dC4S5GKPOn7kXhACvHaO1A71vTYoWZfO0qDyRff+D0yLKf9buCIiwVOGkuY2ZhSNL58B
         81aJAeGxoF0qZjX4N4bv1dkilDVS+HqfClsW3zkgXtlwAWcEdPFB0fTzvbAbqOPnMd9f
         1xqayOgrzio5w9ELk+LpyZIYWzyuTKRAy9gEQ/ULiNgrLAkZITwrppfjrOWTo7PBv8dJ
         TtNHZNZ4Yuf9uyHiNJio1cwhOwqg1wmnxeYV06DsMUx3mKh1ayctP4bksPrCzvUeBl0u
         ydBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717582036; x=1718186836;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y5v2wvzfpTFQoJgp9Ncwu8fEm9eW+i4elxXXvmKBJ7o=;
        b=bFiahPriGx53oOV0EnK884Q51mwGzZX5vQdD4i+yVYMXM+qG3yVeHiA+Kn4G+6vghh
         e9+IZP/i+IJbpMwE2llp3hO9q6JOEKRXZzpeLRTP3mgf5rAIWbC5PYenuM6MUqmykKuK
         Cz9/0ZODItTelGYzmM5sHoBuv0KsknVB7ZN2KdXVh4ZvSai/ISfL/SijrC+I5ED8fvOz
         7RkNTt1pDWkSmR+kT2BdQu0eku8qP0wv7T86oiF3op4ejfx0xv3Rasutnx6auMwHcsSZ
         3gySb/Hcy+UyZ1ImX4jVpIblRH5Az3aq4zEGiWuClxfuGWtVOntPqIkbvwl03URGWw3o
         epgA==
X-Forwarded-Encrypted: i=1; AJvYcCW/1t5jVn9SRyHS/o61PHtXInLRIftYqUSMdaL0vR1XKbkj1z57lbe/AQ/ceSglA6HdetsMpeLzrMgCtVoKnToOYib8wHMpYqVrkZovHnlUsKQ=
X-Gm-Message-State: AOJu0YxBcXFqKmJXhlzni+QtaOYFm0ORcg/uqy+KkOLd5FDvv55iqChH
	D9Lbt+3dsh1LKGDFsyxLwK0SDBo+YUM1PuP8MQoQeS10IXzvCfLPZYXrzQO1cLY=
X-Google-Smtp-Source: AGHT+IGxrxdoQDwGY9zNXeTKIBS/v9Z1wrUt9JmYGDol9OBU9lDeSpjdMVHII7s/W6pfdoH+//8YEQ==
X-Received: by 2002:a05:6512:3ca2:b0:52b:8613:9d2d with SMTP id 2adb3069b0e04-52bab4fa5d3mr1438631e87.55.1717582035641;
        Wed, 05 Jun 2024 03:07:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c7ce:7756:462d:a8bd? ([2a01:e0a:982:cbb0:c7ce:7756:462d:a8bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42158111143sm15697925e9.20.2024.06.05.03.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 03:07:14 -0700 (PDT)
Message-ID: <f9350177-6543-4979-94c1-5c08c373c6b8@linaro.org>
Date: Wed, 5 Jun 2024 12:07:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: amlogic: a4: add power domain
 controller node
To: xianwei.zhao@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20240529-a4_secpowerdomain-v2-0-47502fc0eaf3@amlogic.com>
 <20240529-a4_secpowerdomain-v2-3-47502fc0eaf3@amlogic.com>
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
In-Reply-To: <20240529-a4_secpowerdomain-v2-3-47502fc0eaf3@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_030719_077121_B23F1336 
X-CRM114-Status: GOOD (  11.95  )
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

On 29/05/2024 05:10, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add power domain controller node for Amlogic A4 SoC
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> index 73ca1d7eed81..de10e7aebf21 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> @@ -4,6 +4,7 @@
>    */
>   
>   #include "amlogic-a4-common.dtsi"
> +#include <dt-bindings/power/amlogic,a4-pwrc.h>
>   / {
>   	cpus {
>   		#address-cells = <2>;
> @@ -37,4 +38,13 @@ cpu3: cpu@3 {
>   			enable-method = "psci";
>   		};
>   	};
> +
> +	sm: secure-monitor {
> +		compatible = "amlogic,meson-gxbb-sm";
> +
> +		pwrc: power-controller {
> +			compatible = "amlogic,a4-pwrc";
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
