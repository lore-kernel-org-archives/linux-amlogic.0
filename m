Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38093C48BEB
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Feb 2024 09:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTJsE0LIVHCys2ElylifesWWrbQukzs9bhfUb4sTvJ4=; b=zh0CD6pdghrK+8GMLH3qpCRMP+
	Iz0C23hPqixHavRcN3b6HwauhpDBUjVAxcjDcl9hivxB8Yd6NK+PZFNFlNYI93n5voQNI6aegUubW
	qgD+zj/3+0n0Pyf9cZrGINqyi0S70dnUBwY9UXTh6aBBATdjZd+kCuujKM61i+K/TJ4Psw5AgG2Rk
	WHDRR1M4BBlVtCgjVWULmXYvuhwcpO+DAVd0Jtz6YHHLs725bnkm1IbraOf9CIpCAmAsSaN+TsI/P
	6o2fw2Hh853mNcuwwCz3/I1ai/djIerywA+SozVBsgPvzWs7cl9icemkRy/N0L3wcuBUU5XBrwACt
	ejlg+1Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBs2-0000000CR2V-2aBh;
	Wed, 14 Feb 2024 09:48:02 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBrz-0000000CR1S-30pG
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Feb 2024 09:48:01 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-411ef179d2eso2004785e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Feb 2024 01:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707904077; x=1708508877; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSuVj+jbjDBpUS6t8xOIUdYVO200EmHxi/94a8qnAv8=;
        b=Y5LFB0SDt+z6dLCDNaETtJQit2yoE9G49PfW8cw+Tj29Mh/m6C/nSmRBvDSo3Fh57+
         2Nzn2fZ4md/RloC+l1E8cUseJtZI11rGQUEDKuZrwggWcOjUja1oUw9Z8laLt9eAps8l
         ykEJ/VaDDB3gflC8WfvMMe3ywyrz7Wd+3leDlHrsFbPEse6OSacMIifeuYOIEHtJyr8X
         YQaCkie59R1InYDYtBBFEgsS+eD8oB1wwyT9gJVz2ZQ5/lNo0auiDPEVJl3IK9yF5TGQ
         npg7Ee2jrZjFCchvw4WoRmGPUNavgz8ucqGgA4n3lzPonsTqaeGic/qBCTY2AzG+tSFY
         rQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707904077; x=1708508877;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uSuVj+jbjDBpUS6t8xOIUdYVO200EmHxi/94a8qnAv8=;
        b=hJ2NtMot8lgZJPOoIPpO1nUMzBxNQcrguO00muF0OW199KLmmXRRuRvVwN5rIK4KZV
         4QsLQOa4+R81JtgrQ6OjCwN8tyAO54PqJQxyjeq9C4k7bkyYatfJjSgy5Y4KKP4aR0hB
         MXmQ8/rkWlTn7HKJCLpVEtRqTI3IBflhhXsYYZPPgBG9Zx061E90qirr/WZNAgQ6mwza
         7u82m9eKrjvi8ELK4blvlYmrsmTPpn7FLEpSe11h/IDKW711yRKwhttpqS+q8Zki8+nU
         XoY46LF/CDwQCLBigRHI6JSANnqXS568KdH84jdkv/FiST5bn0r/ZztyiUq/iBS29/RE
         FZww==
X-Forwarded-Encrypted: i=1; AJvYcCWP8fIVW3BqKTakHd+BilmB/ZiriOEX3JOxpy3rn58zvV1FgdqgZm0B8Jzd22suaYA8yAj7CDoFdamxbg8B3R1FwGviiIexAK9PxWnwoIszik8=
X-Gm-Message-State: AOJu0Yz960lyT37bbGPKADUwEWm4aX8/hIOfBjs4hVhZZhCOru6Kg+wg
	CzYZlBdcVQLvhjpZfqJTMGII6i1Ydr+BEmQmyQ4IKoXxzmsVO++a5WaujlNfmVQ=
X-Google-Smtp-Source: AGHT+IEp6MgTJq+5iTVJvLK1LW2DIy5gRkBC54vIBWz2gEVbchEhOytEQE2J+8uJfbFFTyvSkQvgnQ==
X-Received: by 2002:a05:600c:a49:b0:410:d3d9:91a1 with SMTP id c9-20020a05600c0a4900b00410d3d991a1mr1563124wmq.10.1707904076824;
        Wed, 14 Feb 2024 01:47:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:31aa:ecd:7a9f:63a1? ([2a01:e0a:982:cbb0:31aa:ecd:7a9f:63a1])
        by smtp.gmail.com with ESMTPSA id x17-20020a05600c21d100b00410b98a5c77sm1383011wmj.32.2024.02.14.01.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 01:47:56 -0800 (PST)
Message-ID: <54b4e810-754e-481a-bbc8-984f859b116d@linaro.org>
Date: Wed, 14 Feb 2024 10:47:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 4/4] arm64: dts: amlogic: add fbx8am DT overlays
Content-Language: en-US, fr
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <07f7a695-18a0-4211-82e9-b1e2c7166969@freebox.fr>
 <79ba726d-d02c-44b9-b6f6-59b17ba9755c@freebox.fr>
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
In-Reply-To: <79ba726d-d02c-44b9-b6f6-59b17ba9755c@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_014759_946660_2E4B9C9E 
X-CRM114-Status: GOOD (  14.66  )
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

On 13/02/2024 18:14, Marc Gonzalez wrote:
> From: Pierre-Hugues Husson <phhusson@freebox.fr>
> 
> Add support for two variants of the fbx8am board.
> 
> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile                       |  6 ++++++
>   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso    | 35 ++++++++++++++++++++++++++++++++++
>   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso | 25 ++++++++++++++++++++++++
>   3 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index cc8b34bd583d8..1ab160bf928ae 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -8,6 +8,8 @@ dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j100.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j110-rev-2.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j110-rev-3.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-axg-s400.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12a-fbx8am-brcm.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12a-fbx8am-realtek.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12a-radxa-zero.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12a-sei510.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
> @@ -80,3 +82,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-hc4.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air-gbit.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
> +
> +# Overlays
> +meson-g12a-fbx8am-brcm-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-brcm.dtbo
> +meson-g12a-fbx8am-realtek-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-realtek.dtbo
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso
> new file mode 100644
> index 0000000000000..ed79809b15859
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (c) 2024 Freebox SAS
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/gpio/meson-g12a-gpio.h>
> +
> +/ {
> +	compatible = "freebox,fbx8am-brcm", "freebox,fbx8am", "amlogic,g12a";

This looks fine but I'm unsure if those new compatible should be documented of not since they are in an overlay

Neil

> +};
> +
> +&uart_A {
> +	bluetooth {
> +		compatible = "brcm,bcm43438-bt";
> +		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
> +		max-speed = <2000000>;
> +		clocks = <&wifi32k>;
> +		clock-names = "lpo";
> +		vbat-supply = <&vddao_3v3>;
> +		vddio-supply = <&vddio_ao1v8>;
> +	};
> +};
> +
> +&sd_emmc_a {
> +	/* Per mmc-controller.yaml */
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	/* NB: may be either AP6398S or AP6398SR3 wifi module */
> +	brcmf: wifi@1 {
> +		reg = <1>;
> +		compatible = "brcm,bcm4329-fmac";
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso
> new file mode 100644
> index 0000000000000..5da88fb94fb98
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (c) 2024 Freebox SAS
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/gpio/meson-g12a-gpio.h>
> +
> +/ {
> +	compatible = "freebox,fbx8am-realtek", "freebox,fbx8am", "amlogic,g12a";
> +};
> +
> +&uart_A {
> +	bluetooth {
> +		compatible = "realtek,rtl8822cs-bt";
> +		enable-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
> +		host-wake-gpios = <&gpio GPIOX_19 GPIO_ACTIVE_HIGH>;
> +		device-wake-gpios = <&gpio GPIOX_18 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +&sd_emmc_a {
> +	/* No explicit compatible for rtl8822cs sdio */
> +};

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
