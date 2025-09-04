Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C479ACA1002
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Sep 2025 16:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZoZVzi4X8tRIQK0yFlcPKWdaBcHwdAUa6A32TuyVvc=; b=KjtdSN/g6De2zfdyq5bVPhEr3+
	eVotKR2W25iKpRP/eFly5A22QSObyL/MxxE9GBEHu0wxIN9jYe7/SBcdgaEVstP17/fVHQIEg86Zo
	Axv+cBNhLtqWG/fuGf2Siw070/UD1Or21juiQszoe6DgAsmlivqrUtl5Lyon3H30iVPWg6AktJYH7
	TMuO9acPvU/E+QDvvbYIAkbqIeqafMxS6jiVvuzOTN9viQmx0Jw9PFwEUhLntEMZA9y00yUtENM6x
	ax+mV/etD9rbgJbI3X1+kR7YbaDcCubqCa4ka1Z7BVeTRCHSfsyNSOetrohj+KMK+BLrjU2+h9Fbl
	W6NiqmKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCnL-0000000Ctjf-397Z;
	Thu, 04 Sep 2025 16:26:43 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9lc-0000000BnYJ-30aY
	for linux-amlogic@lists.infradead.org;
	Thu, 04 Sep 2025 13:12:46 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3dea538b826so820081f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 04 Sep 2025 06:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756991563; x=1757596363; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q37h+ky8KgDI6nxANYK2Pjj3yAESYs3p69Lz9iQGACo=;
        b=WJ4jyeSC/K6bPkxsFPe+qFTuqSA2U0xb304A02CPgcw8h6N7E1cZGQHrL0Clv6ASli
         WpZYs3hvmwDUjQZ/xbE3pHCyLsAtDIlvADJCdbzeOyQ9cn07Rrgx/wwFOUnUoMq5K25d
         tZNUNvgx2IiaJgPPC7GIH5WjnZbF5VHMbZd0n/nGsBYB22QLSnBTK04Ooe2tmqtEVLcG
         wNHZ0DHBpLmhIi0XR7gl3m3cCK//dfHV1mw6FyANFLA8DmgKRMWaLVmz2dHYJRMGyCL4
         HhXIWaiWXR3rY5RhgNUy6lgzUS5fNOCLx9oJg25tUOrX/u5ONa7DkWktBiKGw81Ly3CW
         1XKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756991563; x=1757596363;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q37h+ky8KgDI6nxANYK2Pjj3yAESYs3p69Lz9iQGACo=;
        b=S1TvOZ50XYs6EMqH+FplDbitwVYhamhvLoga60ZQC/D6m2oLwXDNhTx9dZ1N+7lYWD
         XdnoeroT/jshaItZmAwZx9U+ZWBvECEONi+VSwJX5K2YzLVPfdynkU+0ESwHH9URR/fO
         dsT52tjvuRQvWWstt2CKcseAHrH2LxSw1AcT6AY+8ZWWCicC+vSiTdmI680LIRPhz53h
         j/uASp+ghk6rYqp6PRu4Ogf1qn7VjA1e/kHM72lKddRCtm7ZL2Hvuh8hZRBpN+/PiqNQ
         gpo84DLHSjrLNXckv8tXM1xAyNCx3jwhet0KVggY6f2LE7S9GRz7EwLYsJGgEuWUmxoB
         lM/A==
X-Forwarded-Encrypted: i=1; AJvYcCVk+uykf/QQhQVl2meulNlS4qhKJniUEJnclOm9QHTrMQOWK5X3Rjj3TJuGo8sUE8ysd7uxxfICTq6EsfsY@lists.infradead.org
X-Gm-Message-State: AOJu0YzLv6ft85LXKsOwC/ZTnwQqyhbqDbtufr1ELPLKtMu43xdUZBEA
	H1Jr6wTA5vxqwAQEtza8MdgpCLViF+toMM483GZncDcS8pf0oKKjKNCTFAw+GagHm+s=
X-Gm-Gg: ASbGnct2afiE67VwyoYVFKZE2j3+gUanoiOGxG/KbPnmbpwkC5zh9l8kIU9WT/DkUYr
	m0QA+VKZ+it3q5ziwzx0KEJG5dSag1KU/WPtcqqYFMI3J3/biJtt7+XD5uH5BldwuW8259GP5fZ
	IIKh2sqA6ofiCTRf+wF2ZrjVwDpBGBQzf4Luco0LANdsT+/SJIdrh1O0PvueEEwmHFJo9qEoN7k
	KGEgFq6V+cp6lkdIrGOUxfqE6j+0pj1pdGXpkwwGJLXxccu37znxL8zUDsQ4riAnMrRZadR3wQc
	YxKTik3E7udO0+7DfMyud+mI1CBPehU3wE3CqzbQ4Eq6EIu4GL72a/7kqKcbw/HxZDwGEMdrQRA
	QHa/m07HA02HwkSzYn25FAxlMD19S/ZFc5QZACVKZqqwpH1qrS64LL7ugkfY8JPZJfzjyJ6+UvE
	XYpggglNXiYbxMpfS//dsB
X-Google-Smtp-Source: AGHT+IGiI9xIKpNtw87Z8iocXL4dnNY2WYRgffXXE5zlClWZ1Pvq/OnWmVDZhVEmIgZmS+YQ1COScQ==
X-Received: by 2002:a05:6000:2890:b0:3de:c5b3:dda3 with SMTP id ffacd0b85a97d-3dec5b3e22emr5042055f8f.44.1756991562729;
        Thu, 04 Sep 2025 06:12:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:8c14:335d:24b1:fa98? ([2a01:e0a:3d9:2080:8c14:335d:24b1:fa98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd063fc8dsm16757225e9.7.2025.09.04.06.12.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 06:12:42 -0700 (PDT)
Message-ID: <a36b3ded-23d4-414d-ba3c-485a9fa2fe36@linaro.org>
Date: Thu, 4 Sep 2025 15:12:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/3] thermal: Support Amlogic C3 thermal
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
References: <20250722-c3-thermal-v2-0-b2231b4be79e@amlogic.com>
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
In-Reply-To: <20250722-c3-thermal-v2-0-b2231b4be79e@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_061244_773122_5D9201D0 
X-CRM114-Status: GOOD (  11.01  )
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

Hi,

On 22/07/2025 13:26, Xianwei Zhao via B4 Relay wrote:
> Add Amlogic C3 thermal compatible string, private_data
> of driver and device node.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Changes in v2:
> - Modify the binding file according to Rob's suggestion.
> - Link to v1: https://lore.kernel.org/r/20250718-c3-thermal-v1-0-674f9a991690@amlogic.com
> 
> ---
> Xianwei Zhao (3):
>        dt-bindings: thermal: amlogic: Add compatible string for C3
>        thermal: amlogic: Support C3 thermal controller driver
>        arm64: dts: amlogic: c3: Add tempsensor controller node
> 
>   .../devicetree/bindings/thermal/amlogic,thermal.yaml          |  4 +++-
>   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi                   | 11 +++++++++++
>   drivers/thermal/amlogic_thermal.c                             | 10 ++++++++++
>   3 files changed, 24 insertions(+), 1 deletion(-)
> ---
> base-commit: 58abdca0eb653c1a2e755ba9ba406ee475d87636
> change-id: 20250718-c3-thermal-cfdf0a2bbf52
> 
> Best regards,

Patches 1 & 2 are reviewed and ready to be merged. I'll take patch 3 for next cycle.

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
