Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E877C4828D
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 13:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXjO+zgo7UhX8GhhOd9jCp9O52qY3+KjhIEXmfm3I0o=; b=zsrtMgLpH4YlSu5bG/UBIpl/Dg
	akKdypp08g9OiO8yHDocpFjBaoTamWuvW2CHafOnggX5yj8//JjcEZafriQF28y8n5R5AHLSepAKk
	mI7XxTIs7D5a8Cclz0lYT91SGmfoZGAOf5rHsztZ7KT7iN+nrSExVdhJd2GBihK7iKrI/0lNKVhDM
	qk2YLkWpop8IygLRUkuNMphNNVBLdKfjES0g7E9qo7ICUhAWr+oNiE/ZOuxI8xnED19Slrqd3iTt9
	JbzNa6cEYOXc3ysXICSP9UsZUYfnSqL8KRFeC/3ffEVxBcA+HNQX/sKdSVx8RPANI/+XwZL0LzPBa
	kgZkOzIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXLep-00000007k4t-0RGz;
	Tue, 06 Feb 2024 13:38:39 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXLel-00000007k4V-3jfN
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Feb 2024 13:38:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40fe79f1aaaso3909345e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Feb 2024 05:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707226714; x=1707831514; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjzl3rG5xcOi8ws05JYrROZb+rqJVfjOL9ONkfP2O+c=;
        b=BN8ThJXHV7l0O26ltMbN70di3D4BMVgmM7HXVesRuL57auf4e6tWtjCJSrSd7+C59v
         5//cVU8o5bKEXc25i55M/D38TKxoXbIi0CYA1sItSQlH7+Sx6V5FE9JpHIwB1ORFlxYz
         rSzjC7SSjEDX4Tr+eeENMnjKBmx8FJCSHHUrrbt4anCMROjdEssZGoPUMEKN0ndfGCLC
         RGZbgrlp69BPObp1shWejJfTpDZ1rYQlUH2VlNPSVHE//dCoxkEYtoxtnp/0MLHTvquX
         7wqFuhlTEMKDFTKbFVjA6WmDZmmar2BI/cGgF1EKGbOg+x735K7JXKSav5ClzCNERH1G
         CVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707226714; x=1707831514;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kjzl3rG5xcOi8ws05JYrROZb+rqJVfjOL9ONkfP2O+c=;
        b=X9XQ8zR53NgL4LZnzN7X3xtkF5pRfDxySE4No1EsGiovAemd+FQP4Z3T6mMCsg37dG
         q9OmmST4+uJASwFkvTgc5utFvpWyW/Mad1CLHgOcsozjT6PvX7HSt3EPAG8L45XxArqa
         3YOQ3PEL4JMnh9IrQOOhFfQthGrzOZdZzGCOIonZOqPFfhJrE3pifaSn/Yocn58sM0hB
         k8Ssrh3WxIvow0sbjtTU8sOLEl8UdW7Anf18SYOf8mOPJ1/2GbcI17ZdwUROBFbm8pbT
         LKv490qZfmfwQGo3hZagQDWQRDlOjeUe/qQES9x+xHlHWpoKY0/pXGwBZQPW5vJNITgB
         rsjA==
X-Gm-Message-State: AOJu0YyTc6tq7yXyT/M46fL5i0gXhAVan/eHc7b/n+a4k0/WzrXW/Fw3
	aF5d/tSf3JOOrHiQxzZ9KySUw/BMgq6i1OLvZDgafQADCMqxlbCMMWEBnFHXkfQ=
X-Google-Smtp-Source: AGHT+IF2CsZ9Pvugpez5X0ZjXFSe3/tf02Nyaln5AqjHzRzSsdxIwGSps89DYyt7LczHVUiN3fCrtQ==
X-Received: by 2002:a05:600c:3595:b0:40f:d432:c4a0 with SMTP id p21-20020a05600c359500b0040fd432c4a0mr2222724wmq.27.1707226714218;
        Tue, 06 Feb 2024 05:38:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXZsyceuRrzddRTIRPILAcRvfSxTNyviJ4ctNxrVZut1CelV4XywwvjJ2bXYIiuGCXGsjpAf3uZEtlmfj/FDGjlTFtlJ2Q7T2rmbJEw5mfu47XOP49Jh8NtN7Vw6fgx73FbmABO7xIqLWBHn1pZwQmeCMfPbF3dy7lGJvW4Jo8lI1KE5eonCff3TkUh7pC43Qy7FL1Tii9so6NjSQzIeeoEnzdlWIAkxW2BnSG1rhOE/aEmx+HajNW7YnZSX1UfKXCcPb9fp6nDBsx1M+/2+3SnELeB47VGYNPWd6IW/hkQV7lLCrco+SebAD3E6zwTCp1vurgyokRcL9ffb7qpgylC59e7DlBwdFs=
Received: from ?IPV6:2a01:e0a:982:cbb0:ba23:8574:fa8:28dd? ([2a01:e0a:982:cbb0:ba23:8574:fa8:28dd])
        by smtp.gmail.com with ESMTPSA id u20-20020a05600c19d400b0040fddd8de88sm2089350wmq.15.2024.02.06.05.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 05:38:33 -0800 (PST)
Message-ID: <2149edc1-e19d-4aae-851d-df35b91bcd98@linaro.org>
Date: Tue, 6 Feb 2024 14:38:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH v1] arm64: dts: amlogic: Add Freebox fbx8am boards
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
References: <8c865c62-cd80-4c78-9fc5-c85491c037ca@freebox.fr>
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
In-Reply-To: <8c865c62-cd80-4c78-9fc5-c85491c037ca@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_053835_996663_BA145A1C 
X-CRM114-Status: GOOD (  22.41  )
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

Hi Marc, Pierre-Hugues,
On 06/02/2024 14:12, Marc Gonzalez wrote:
> From: Pierre-Hugues Husson <phhusson@freebox.fr>
> 
> The fbx8am boards are based on the Amlogic Meson G12A S905X2 SoC,
> and the SEI510 board design.
> 
> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
> Request For Comments to spot obvious mistakes before formal submission
> NB: on IRC, narmstrong mentioned:
>> adding dtbos for variants seems to be the new preferred way to handle such case
>> the fdtoverlay utility works well for this case

Thanks for this RFC, first please split it in at least 4 patches:
- vendor prefix
- bindings
- _base_ dt
- variant DT

For the variant DT, indeed I think DTBOs should be the new preferred way
to handle that, for reference I pushed a patch for the DSI panel support
of the Khadas VIM3 as a DTBO:
https://lore.kernel.org/all/20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-6-dc06073d5330@linaro.org/

It would greatly simplify your handling of current and future variants,
reduce the size of builds DTs and make it more flexible.

> ---
>   Documentation/devicetree/bindings/arm/amlogic.yaml        |   8 +
>   Documentation/devicetree/bindings/vendor-prefixes.yaml    |   2 +
>   arch/arm64/boot/dts/amlogic/Makefile                      |   2 +
>   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dts    |  30 +++
>   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dts |  23 ++
>   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dtsi        | 465 ++++++++++++++++++++++++++++++++++
>   6 files changed, 530 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> index caab7ceeda45a..2d9cce35d6f1d 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -150,6 +150,14 @@ properties:
>                 - seirobotics,sei510
>             - const: amlogic,g12a
>   
> +      - description: Freebox Boards with the Amlogic Meson G12A S905D2/X2/Y2 SoC
> +        items:
> +          - enum:
> +              - freebox,fbx8am-brcm
> +              - freebox,fbx8am-realtek
> +          - const: freebox,fbx8am
> +          - const: amlogic,g12a
> +
>         - description: Boards with the Amlogic Meson G12B A311D SoC
>           items:
>             - enum:
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 1a0dc04f1db47..4f5a1f4e6689a 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -500,6 +500,8 @@ patternProperties:
>       description: FocalTech Systems Co.,Ltd
>     "^forlinx,.*":
>       description: Baoding Forlinx Embedded Technology Co., Ltd.
> +  "^freebox,.*":
> +    description: Freebox SAS
>     "^freecom,.*":
>       description: Freecom Gmbh
>     "^frida,.*":
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index cc8b34bd583d8..dd99ee3efec61 100644
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
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dts
> new file mode 100644
> index 0000000000000..1bf39d2d1eeb3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dts
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (c) 2024 Freebox SAS
> +
> +/dts-v1/;
> +
> +#include "meson-g12a-fbx8am.dtsi"
> +
> +/ {
> +	compatible = "freebox,fbx8am-brcm", "freebox,fbx8am", "amlogic,g12a";
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
> +	/* NB: may be either AP6398S or AP6398SR3 wifi module */
> +	brcmf: wifi@1 {
> +		reg = <1>;
> +		compatible = "brcm,bcm4329-fmac";
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dts
> new file mode 100644
> index 0000000000000..dc268b8f5d169
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dts
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (c) 2024 Freebox SAS
> +
> +/dts-v1/;
> +
> +#include "meson-g12a-fbx8am.dtsi"
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
> +	// No explicit compatible for rtl8822cs sdio
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dtsi
> new file mode 100644
> index 0000000000000..5e98d0cd61998
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dtsi
> @@ -0,0 +1,465 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (c) 2024 Freebox SAS
> +
> +/*
> + * Codename for this board was SEI530FB.

Why was ? it's no more it's codename ?

> + * It is based on SEI510.
> + */
> +
> +#include "meson-g12a.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/gpio/meson-g12a-gpio.h>
> +#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
> +
> +/ {
> +	compatible = "freebox,fbx8am", "amlogic,g12a";
> +	model = "Freebox Player Pop";

You could add `chassis-type = "chassis-type";`

> +
> +	firmware {
> +		optee {
> +			compatible = "linaro,optee-tz";
> +			method = "smc";
> +		};
> +	};
> +
> +	gpio-keys-polled {
> +		compatible = "gpio-keys-polled";
> +		poll-interval = <100>;
> +
> +		/* Physical user-accessible reset button near USB port */
> +		power-button {
> +			label = "Reset";
> +			linux,code = <BTN_MISC>;
> +			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	spdif_dit: audio-codec-2 {
> +		#sound-dai-cells = <0>;
> +		compatible = "linux,spdif-dit";
> +		status = "okay";
> +		sound-name-prefix = "DIT";
> +	};
> +
> +	aliases {
> +		serial0 = &uart_AO;
> +		ethernet0 = &ethmac;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	emmc_pwrseq: emmc-pwrseq {
> +		compatible = "mmc-pwrseq-emmc";
> +		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_connector_in: endpoint {
> +				remote-endpoint = <&hdmi_tx_tmds_out>;
> +			};
> +		};
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x0 0x0 0x80000000>;
> +	};
> +
> +	ao_5v: regulator-ao_5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "AO_5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&dc_in>;
> +		regulator-always-on;
> +	};
> +
> +	dc_in: regulator-dc_in {
> +		compatible = "regulator-fixed";
> +		regulator-name = "DC_IN";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		regulator-always-on;
> +	};
> +
> +	emmc_1v8: regulator-emmc_1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "EMMC_1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vddao_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	vddao_3v3: regulator-vddao_3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDAO_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&ao_5v>;
> +		regulator-always-on;
> +	};
> +
> +	vddao_3v3_t: regultor-vddao_3v3_t {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDAO_3V3_T";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vddao_3v3>;
> +		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
> +		enable-active-high;
> +	};
> +
> +	vddcpu: regulator-vddcpu {
> +		/*
> +		 * SY8120B1ABC DC/DC Regulator.
> +		 */
> +		compatible = "pwm-regulator";
> +
> +		regulator-name = "VDDCPU";
> +		regulator-min-microvolt = <721000>;
> +		regulator-max-microvolt = <1022000>;
> +
> +		pwm-supply = <&ao_5v>;
> +
> +		pwms = <&pwm_AO_cd 1 1250 0>;
> +		pwm-dutycycle-range = <100 0>;
> +
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vddio_ao1v8: regulator-vddio_ao1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDIO_AO1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vddao_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
> +		post-power-on-delay-ms = <10>; /* required for 43752 */
> +		clocks = <&wifi32k>;
> +		clock-names = "ext_clock";
> +	};
> +
> +	wifi32k: wifi32k {
> +		compatible = "pwm-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
> +	};
> +
> +	sound {
> +		compatible = "amlogic,axg-sound-card";
> +		model = "SEI510";

Please use a proper audio model ID

> +		audio-aux-devs = <&tdmout_b>;
> +		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
> +				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
> +				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
> +				"TDM_B Playback", "TDMOUT_B OUT",
> +				"SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
> +				"SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
> +				"SPDIFOUT_A IN 2", "FRDDR_C OUT 3";
> +
> +		assigned-clocks = <&clkc CLKID_MPLL2>,
> +				  <&clkc CLKID_MPLL0>,
> +				  <&clkc CLKID_MPLL1>;
> +		assigned-clock-parents = <0>, <0>, <0>;
> +		assigned-clock-rates = <294912000>,
> +				       <270950400>,
> +				       <393216000>;
> +
> +		dai-link-0 {
> +			sound-dai = <&frddr_a>;
> +		};
> +
> +		dai-link-1 {
> +			sound-dai = <&frddr_b>;
> +		};
> +
> +		dai-link-2 {
> +			sound-dai = <&frddr_c>;
> +		};
> +
> +		/* 8ch hdmi interface */
> +		dai-link-3 {
> +			sound-dai = <&tdmif_b>;
> +			dai-format = "i2s";
> +			dai-tdm-slot-tx-mask-0 = <1 1>;
> +			dai-tdm-slot-tx-mask-1 = <1 1>;
> +			dai-tdm-slot-tx-mask-2 = <1 1>;
> +			dai-tdm-slot-tx-mask-3 = <1 1>;
> +			mclk-fs = <256>;
> +
> +			codec {
> +				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
> +			};
> +		};
> +
> +		/* spdif hdmi or toslink interface */
> +		dai-link-4 {
> +			sound-dai = <&spdifout_a>;
> +
> +			codec-0 {
> +			sound-dai = <&spdif_dit>;
> +			};
> +
> +			codec-1 {
> +				sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_A>;
> +			};
> +		};
> +
> +		/* spdif hdmi interface */
> +		dai-link-5 {
> +			sound-dai = <&spdifout_b>;
> +
> +			codec {
> +				sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_B>;
> +			};
> +		};
> +
> +		/* hdmi glue */
> +		dai-link-6 {
> +			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
> +
> +			codec {
> +				sound-dai = <&hdmi_tx>;
> +			};
> +		};
> +	};
> +};
> +
> +&arb {
> +	status = "okay";
> +};
> +
> +&cec_AO {
> +	pinctrl-0 = <&cec_ao_a_h_pins>;
> +	pinctrl-names = "default";
> +	status = "disabled";
> +	hdmi-phandle = <&hdmi_tx>;
> +};
> +
> +&cecb_AO {
> +	pinctrl-0 = <&cec_ao_b_h_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +	hdmi-phandle = <&hdmi_tx>;
> +};
> +
> +&clkc_audio {
> +	status = "okay";
> +};
> +
> +&cpu0 {
> +	cpu-supply = <&vddcpu>;
> +	operating-points-v2 = <&cpu_opp_table>;
> +	clocks = <&clkc CLKID_CPU_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu1 {
> +	cpu-supply = <&vddcpu>;
> +	operating-points-v2 = <&cpu_opp_table>;
> +	clocks = <&clkc CLKID_CPU_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu2 {
> +	cpu-supply = <&vddcpu>;
> +	operating-points-v2 = <&cpu_opp_table>;
> +	clocks = <&clkc CLKID_CPU_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu3 {
> +	cpu-supply = <&vddcpu>;
> +	operating-points-v2 = <&cpu_opp_table>;
> +	clocks = <&clkc CLKID_CPU_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&ethmac {
> +	status = "okay";
> +	phy-handle = <&internal_ephy>;
> +	phy-mode = "rmii";
> +};
> +
> +&frddr_a {
> +	status = "okay";
> +};
> +
> +&frddr_b {
> +	status = "okay";
> +};
> +
> +&frddr_c {
> +	status = "okay";
> +};
> +
> +&spdifout_a {
> +	pinctrl-0 = <&spdif_out_h_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&spdifout_b {
> +	status = "okay";
> +};
> +
> +&hdmi_tx {
> +	status = "okay";
> +	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&hdmi_tx_tmds_port {
> +	hdmi_tx_tmds_out: endpoint {
> +		remote-endpoint = <&hdmi_connector_in>;
> +	};
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&ir {
> +	status = "okay";
> +	pinctrl-0 = <&remote_input_ao_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&pwm_AO_cd {
> +	pinctrl-0 = <&pwm_ao_d_e_pins>;
> +	pinctrl-names = "default";
> +	clocks = <&xtal>;
> +	clock-names = "clkin1";
> +	status = "okay";
> +};
> +
> +&pwm_ef {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_e_pins>;
> +	pinctrl-names = "default";
> +	clocks = <&xtal>;
> +	clock-names = "clkin0";
> +};
> +
> +&pdm {
> +	pinctrl-0 = <&pdm_din0_z_pins>, <&pdm_din1_z_pins>,
> +		    <&pdm_din2_z_pins>, <&pdm_din3_z_pins>,
> +		    <&pdm_dclk_z_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&saradc {
> +	status = "okay";
> +	vref-supply = <&vddio_ao1v8>;
> +};
> +
> +/* SDIO */
> +&sd_emmc_a {
> +	status = "okay";
> +	pinctrl-0 = <&sdio_pins>;
> +	pinctrl-1 = <&sdio_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	sd-uhs-sdr50;
> +	max-frequency = <100000000>;
> +
> +	non-removable;
> +	disable-wp;
> +
> +	/* WiFi firmware requires power to be kept while in suspend */
> +	keep-power-in-suspend;
> +
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +
> +	vmmc-supply = <&vddao_3v3>;
> +	vqmmc-supply = <&vddio_ao1v8>;
> +};
> +
> +/* SD card */
> +&sd_emmc_b {
> +	status = "okay";
> +	pinctrl-0 = <&sdcard_c_pins>;
> +	pinctrl-1 = <&sdcard_clk_gate_c_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	max-frequency = <50000000>;
> +	disable-wp;
> +
> +	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
> +	vmmc-supply = <&vddao_3v3>;
> +	vqmmc-supply = <&vddao_3v3>;
> +};
> +
> +/* eMMC */
> +&sd_emmc_c {
> +	status = "okay";
> +	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_8b_pins>, <&emmc_ds_pins>;
> +	pinctrl-1 = <&emmc_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +
> +	bus-width = <8>;
> +	cap-mmc-highspeed;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	max-frequency = <200000000>;
> +	non-removable;
> +	disable-wp;
> +
> +	mmc-pwrseq = <&emmc_pwrseq>;
> +	vmmc-supply = <&vddao_3v3>;
> +	vqmmc-supply = <&emmc_1v8>;
> +};
> +
> +&tdmif_b {
> +	status = "okay";
> +};
> +
> +&tdmout_b {
> +	status = "okay";
> +};
> +
> +&tohdmitx {
> +	status = "okay";
> +};
> +
> +&uart_A {
> +	status = "okay";
> +	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> +	pinctrl-names = "default";
> +	uart-has-rtscts;
> +};
> +
> +&uart_AO {
> +	status = "okay";
> +	pinctrl-0 = <&uart_ao_a_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&usb {
> +	status = "okay";
> +	dr_mode = "host";
> +};

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
