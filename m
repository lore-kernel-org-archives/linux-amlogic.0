Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DBFD3ABFB
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2024 13:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCVvuYNJ3ewqCBiGHxznkaLUtLRqYaEBKg9Q+Yo7psM=; b=tbifU37JUU9tU0jOjekUSC7qnZ
	DUYGN1bMFr+Pb2dzmRFMgyphgJdf9cF4IO362gbab/yXxC/SWABFk61InIs/ESlIkd11jPxbV+gTl
	Yj60HC5XHh+5ZQ0o2YjrcIR9SjKR1TewYZDvWvb0hlB0Es+9kcoGq5MQ5gcllAfI7UGHYgG2OWNOA
	Foxqpl41veRlve+GuZiFuZErJuWksjKbCBmIot11n7r7GI8vvnAZS3KnaxDPQdHzXZZS97G/CoHwT
	PK3HhiUWHq66wRAaUIskEDICNsZ2JbZfMNQ3GTUvKndNerLOC++OIXVu+0K40k4k4hbNf3PQvFf7u
	uwIWa+qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAr0K-00000003ZzH-2xAK;
	Tue, 12 Nov 2024 13:32:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAquw-00000003YaN-3d8A
	for linux-amlogic@lists.infradead.org;
	Tue, 12 Nov 2024 13:26:53 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43159c9f617so44744125e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 12 Nov 2024 05:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731418009; x=1732022809; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRmLbf/bz31mm/eeVY/iGKbUEcxPetAbKwSG1URLvJ0=;
        b=Xw/0xv3yUptElTePLJCpIPeqJ+cRn6zQ8l9LilwzpoEoHg8hnviLfouQ1I5T9pVH1p
         a7zcr30a6w/NrKpPb7AgXRd2jyq0VkiZTZHH28f8xjxL4VBSjgDZrfvLXqdjqIS+Axc1
         gt+9SXbDecSo8hq0mevUB02EidP7DusVX159ieFLHOKIUVgI023LKnIHIJywOki5Iqie
         x/aLiGVRhvURcXILZz66+BCIYum+5tvuBsEIf4km5vQWzAjZf56LnX8WW9HQ6ZL27jr2
         MoRNmKqMgkB7EkbIoXcytm3GvgWHf3P8V2GeE/wDh7nyONjFNHT4qlEds/ITJDWInZuj
         BCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731418009; x=1732022809;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dRmLbf/bz31mm/eeVY/iGKbUEcxPetAbKwSG1URLvJ0=;
        b=gt07eY6Pio4eICyQBXlOJKndvRqcYsl6Uxghg5WrsS8jUhciDWBclHPH+aibWzI59R
         YzEPYCVCUVzu2DW/J8A4mtbtD9lJJdwAgbWZo4+4zoT3122Ly5rt7FD+0NGJGU641+Np
         gVqYH7XOqNAoRwjvcGqY8+ojLjBYaOXtrTiWGIRjPzzswjeH106jTAjhCpf+2KrocXAT
         N6YhzEuZPSlZvPoBT5Bk7N8+KAAd3lhvY4HqvWyFb0rrO8P1rBkLuqBb8tDJ09ph7vxS
         QCUghr/JeVcOFjen3MP0Fmtyy/98FJyM1Qq1iQ5ejAgrHJn0Q0KAN77VYbKA5+ZMol/w
         DxTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNrLiVxQdZWfWKznT2NVSe9eC+GBr6RJ1zKOK2u2wmrA6aOwyus6C2iPDpuYVfGpSSXChYcvcXQ1jay9xp@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/PMO3VN21Mij3SX2Z6ST3LVWGYx2iXG1GEqwBxudeMRloNRHc
	VkQDrFPQ+n4gbydo4jMiAbM5GKMbYQob09l1Xpz7dw/zAtCSBA5ViAqJwnn+HzY=
X-Google-Smtp-Source: AGHT+IFTQlXSukq+djtZ02mrwHjUmWSAl2HtnKbbzOayDUOl3KycAHIOi0rl6/yfP9eUPu5iRkh9QA==
X-Received: by 2002:a05:600c:3514:b0:42f:4f6:f8f3 with SMTP id 5b1f17b1804b1-432b74fde60mr137847665e9.7.1731418009251;
        Tue, 12 Nov 2024 05:26:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:860c:aff4:d0e9:9db8? ([2a01:e0a:982:cbb0:860c:aff4:d0e9:9db8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b0566544sm205123355e9.24.2024.11.12.05.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 05:26:48 -0800 (PST)
Message-ID: <e1b810f6-b5b3-43aa-9cc1-e9601589ddf5@linaro.org>
Date: Tue, 12 Nov 2024 14:26:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 1/5] dt-bindings: pinctrl: modify gpio-cells property
To: xianwei.zhao@amlogic.com, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241112-a4_pinctrl-v5-0-3460ce10c480@amlogic.com>
 <20241112-a4_pinctrl-v5-1-3460ce10c480@amlogic.com>
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
In-Reply-To: <20241112-a4_pinctrl-v5-1-3460ce10c480@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_052651_047712_9F487485 
X-CRM114-Status: GOOD (  13.27  )
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

Hi,

On 12/11/2024 11:26, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Extend the value range of #gpio-cells property, including [2, 3],
> to compatible with Amlogic A4 SoC and later chips's pinctrl module.
> The early GPIO parameter number is 2, and the later GPIO parameter
> number is 3.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml       | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
> index e707c222a07f..6b53577dea59 100644
> --- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
> @@ -36,7 +36,7 @@ $defs:
>         gpio-controller: true
>   
>         "#gpio-cells":
> -        const: 2
> +        enum: [2, 3]
>   
>         gpio-ranges:
>           maxItems: 1
> 

This is not what I expected, this allows 3 cells for all Amlogic pinctrl,
which is wrong.

Instead, remove "#gpio-cells" definition from amlogic,meson-pinctrl-common.yaml
and add them in all amlogic,meson-pinctrl-XXX.yaml with const: 2, and then when you
introduce A4/A5, add a new amlogic,meson-pinctrl-a5.yaml with const: 3.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
