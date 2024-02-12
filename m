Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E977C48297
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Feb 2024 15:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8bF4uB4erkWJBm2TDLwX2pkB/IAJZJrPHp/gSi+lQc=; b=SEsd7gyxbsS3lBFvpCGL6dr3n7
	RD2J4SHs/kQ4sDZ59v+rxs6IJHJPlfamjICg5lQrWZOdiq0F/xKUW6D8LN+KzRV0QSno8FJSKsduE
	ASSq92HqRZbGdaq7KNzhezfOG79rDIPgZmPiXpHNxhVryGTE84UgiRPZaiewxCPyAh8F4c6AuwGHy
	gNMFcI32P/yhplYlxfDT/AWowVc2I1rAOK6SbsSt1U9HnbkWFgtAs9nbRIsmRntk6jSSgRk+rvPlb
	ct/7YPRrAkaIJmFu6CVg0XyIPnEEk0PWU53bBUmoHGKMolQJeEvyzRVJU6DT+Y9+cjtQqd9n867ux
	egD6PWAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZXpf-00000005spZ-1z3U;
	Mon, 12 Feb 2024 15:02:55 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZXpc-00000005sof-1ZvE
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Feb 2024 15:02:53 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-410cd2c7f27so8267885e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Feb 2024 07:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707750170; x=1708354970; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mIRWEDm6h5i0aEXk2izLz4ROYQAZ1PoRscFJzI24z3c=;
        b=EURkENL9B8SGmlbWlDiZ7WuD5m8mnKUP2HW+w6grlgKk8J+lNkSKthUZdlu/cgYuZJ
         QGunOEjgK9DrE/iGriNKp2ujvQIXGUw6EI55R+2Ep2BBfW+K5qpXTtX5PjQTJfi8QSbq
         jsDxQ+G4pN7q/6iiv+lqovrGnxXgwd5XLA/NqsMP7pBOo8QXaR1NLBct6Nw0wMwU3X6s
         9D9dlJru+M301TTnOG0CKkMCNVrYjeIf0Wt3EyXN5UJieXb/DQkRILPvK2dZPLAMG9h5
         sGJ5BHLhB7z0J2KbmhpK3EQ8/B3QSHbgaoVjYbN4O6RGBZZr8Rn/GH7Tp7fcz1jvb4is
         kDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707750170; x=1708354970;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mIRWEDm6h5i0aEXk2izLz4ROYQAZ1PoRscFJzI24z3c=;
        b=kOR/dyBy0apZ/IaTuIWeWYfPpBsRHXXw4QNN9sn6fSCVRxo2Pn4phTYT/drcqe8Wi4
         SXxUpWwJr/ceMpkvz1OjdmHUrtmiO28LT3PRYO2xfivWIKy911qNSAkqivMQeUvpVBys
         uFjxmLVe45/GiA2eMKMoMSBCVntJlXOjzGZGQ7AGHylIdSvDriOchD43WyjrrrO4+0Ud
         11rytVfNBnt7tJ8p+zpuheCCfBT7mbWJyat3CbMtmSlgXNq7+todLQ69BL0TQzw8opae
         PdGVKjKyE+dH79TPwB6VcxfieEbB3yZwzbGg1yfyfiWWKwlbRzBuve/HwM6DvzKSSckK
         ULiA==
X-Forwarded-Encrypted: i=1; AJvYcCWlBxzHrK/1e2jnEcIym27k094+9gND8V0GPU07NZQham83QAFjQ+fwGv/V07Qn6AmHN5IYG621sGehYbTXOnXIKn82i2+CYYa21zDwbgyPV84=
X-Gm-Message-State: AOJu0YwI/fbpR/hjF2BfpKt5qXK7pwKb618mDNOXUF0LtEXqnW1VlsCA
	SCWz0E+ln0DseSnyBJTtdrpIAAso9rD5QccnXmDW301D7zL7HM3zkexWm1mBjUI=
X-Google-Smtp-Source: AGHT+IFh+pVFPAbvo6g79lrwPbn+/Zl7HOPoCDqM/zZ00e/CgPffec7sh8ISXxyHAMIWJdvNSSlz9w==
X-Received: by 2002:a05:600c:5117:b0:40f:df31:6cac with SMTP id o23-20020a05600c511700b0040fdf316cacmr6697375wms.4.1707750170486;
        Mon, 12 Feb 2024 07:02:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUAvmhDqvYFlu6It9fZlStTBc8BRZBjdwuj34Z/s8MjeDVpwFU/bsg2EF4KGtARGSM3WmB1yc8nf1Dz4Ej9coe7ptGP9SLbh022GBRPDE6BE1N55JbpD48skceIYaaa1Gz2OS4l9kryXMupHZttgIewiLdFlsXCbxpKWxdXx0qeZ6vTbm0iSJPumtvorGTq43KtV6ChNx7W4EX9BKBcHpd7sx4vpaKo2+8at1ztXR2QDpBMe5sDAQlgkTxyBbj/JJcyAab2sqRyibW1nXJ2GizTba9F9cxSSidDBcURv4K1hBy6KWuIuddwLdxX7dpWhZ1HKT7qiHUKlF/xSO+im+G4PVzu9Q1bd88GpWsn8JzBRz8Ff527u6ehbS9bWF1D9hBgQgHmkj2ZhSuy9PYNU1yNyyVPqYsmRoNJJh2xKUNBVqzP4xMeQWFfBnUFIUEeegDt2blvn4TqR4DwHL9rrXOuZXNKTtmwpUySS3GLO3J0LdNXHj9hOUEsPLdYYFWgY7+z/KwYcS0UOIZG6vJsRy6Sod72xBc9Ts0R1Ylfic/m2c5sZtJ20eD0X1TIDQ==
Received: from ?IPV6:2a01:e0a:982:cbb0:fcee:f026:296d:135f? ([2a01:e0a:982:cbb0:fcee:f026:296d:135f])
        by smtp.gmail.com with ESMTPSA id fm8-20020a05600c0c0800b0040ef718cf81sm9146044wmb.28.2024.02.12.07.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 07:02:50 -0800 (PST)
Message-ID: <34ee9676-567f-4c07-83b0-f3b8b1e08db9@linaro.org>
Date: Mon, 12 Feb 2024 16:02:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 2/2] arm64: dts: amlogic: axg: initialize default SoC
 capacitance
Content-Language: en-US, fr
To: Dmitry Rokosov <ddrokosov@salutedevices.com>, jbrunet@baylibre.com,
 mturquette@baylibre.com, adeep@lexina.in, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, conor+dt@kernel.org
Cc: kernel@sberdevices.ru, sdfw_system_team@sberdevices.ru,
 rockosov@gmail.com, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240209212816.11187-1-ddrokosov@salutedevices.com>
 <20240209212816.11187-3-ddrokosov@salutedevices.com>
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
In-Reply-To: <20240209212816.11187-3-ddrokosov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_070252_431665_D8C2FAFB 
X-CRM114-Status: GOOD (  16.21  )
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

On 09/02/2024 22:28, Dmitry Rokosov wrote:
> The capacitance value is required for the usage of the cpufreq cooling
> device and power_allocator thermal governor in the appropriate energy
> model.
> 
> It helps to compute the power estimated by the SoC at the appropriate
> frequency. If it is the frequency of an existing OPP, or at the
> frequency of the first OPP above the requested value otherwise.
> 
> The power is estimated as P = C * V^2 * f, with C being the SoC's
> capacitance and V and f respectively representing the voltage and
> frequency of the OPP.
> 
> Since AXG SoC doesn't have SCMI protocol support, we need to initialize
> capacitance using the 'dynamic-power-coefficient' DT entry. Its value is
> retrieved from the vendor kernel, and it gives us the following
> freq2power mapping:
>      +-----------+--------+
>      | frequency,| power, |
>      |    MHz    |   uW   |
>      +-----------+--------+
>      |     100   |  10354 |
>      +-----------+--------+
>      |     250   |  27104 |
>      +-----------+--------+
>      |     500   |  55447 |
>      +-----------+--------+
>      |     667   |  77327 |
>      +-----------+--------+
>      |    1000   | 129024 |
>      +-----------+--------+
>      |    1200   | 164656 |
>      +-----------+--------+
>      |    1296   | 192489 |
>      +-----------+--------+
>      |    1416   | 239870 |
>      +-----------+--------+
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index ea96fef328e8..6d12b760b90f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -74,6 +74,7 @@ cpu0: cpu@0 {
>   			enable-method = "psci";
>   			next-level-cache = <&l2>;
>   			clocks = <&scpi_dvfs 0>;
> +			dynamic-power-coefficient = <140>;
>   			#cooling-cells = <2>;
>   		};
>   
> @@ -84,6 +85,7 @@ cpu1: cpu@1 {
>   			enable-method = "psci";
>   			next-level-cache = <&l2>;
>   			clocks = <&scpi_dvfs 0>;
> +			dynamic-power-coefficient = <140>;
>   			#cooling-cells = <2>;
>   		};
>   
> @@ -94,6 +96,7 @@ cpu2: cpu@2 {
>   			enable-method = "psci";
>   			next-level-cache = <&l2>;
>   			clocks = <&scpi_dvfs 0>;
> +			dynamic-power-coefficient = <140>;
>   			#cooling-cells = <2>;
>   		};
>   
> @@ -104,6 +107,7 @@ cpu3: cpu@3 {
>   			enable-method = "psci";
>   			next-level-cache = <&l2>;
>   			clocks = <&scpi_dvfs 0>;
> +			dynamic-power-coefficient = <140>;
>   			#cooling-cells = <2>;
>   		};
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
