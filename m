Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05741C531DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2024 15:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZqvsQFLST507bjn6E5fX3GrGQ9wad0pj9z6Vlz2hs4=; b=267uU0d7Oei6iTUazIPsSmA2jw
	tJaouwLS6SbOfD1fPbRD9oIRfEv+fZDhnsI2iYKpvDVEEat2AgGPvY7TjvFZgXB9tdzsvTXRfJ5mF
	OtOu0NDIPoCTbEXoHdQpFP2ql5kbhKs+bA5vHuCb8MpmZEhXVUHwHs7nHBq26YdHF7rZ0Fb7TkEA+
	PRzkAGL+lmsnZMIWQME34Kxy8tekyNtOCejgSNzNYTWPM1edh1d11olzYwxBqV84WbBAF3GWmAFKq
	YZRlCmwRZ68/qqzbBzjoUfUbVC9BNzuRF80S+WtG3fx0F9otOdAaXO9pz//ZGu/uOhzbWoXwISecU
	DZ0+LYdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQlj-00000005ojq-214H;
	Tue, 20 Aug 2024 15:27:35 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQgR-00000005mkA-0dYk
	for linux-amlogic@lists.infradead.org;
	Tue, 20 Aug 2024 15:22:09 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-428e0d184b4so43594855e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2024 08:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724167325; x=1724772125; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzugJgR+8dmQOIAh0WQosLWvLWzRvu2cPFFIL1RJ5cQ=;
        b=ScTymOw3Hw9vS+b8Pqdd1ejI+mx9VNzOBJep8KXAD/xCec9/MLh9dvv/HJTZSn9Rm2
         sTWzJueshBveR5tWNjOVTqzFkG2AX72o5XzJAwl2LNkDMk8UWZxDdfYZKA60AK14o4lg
         Vm0qpHd0USQaB8O3w7CiErf35TCVFgsC5qW1Je5KOfhvlZKTNtTnneglhbuy64IT8vFl
         Sd0DV58U0g2RC5KX2xY+ZiYWe+Leh3tL27Fvn7wAxBVQj2tOup/4dUYGsqIXerABlT6m
         /L9sQvLY6DXM3taGPA5rEnFmYsTZMCVUVBumMSbwWK5IkDm7h6YUpyOz1zDW5Wqcwjto
         zzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724167325; x=1724772125;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YzugJgR+8dmQOIAh0WQosLWvLWzRvu2cPFFIL1RJ5cQ=;
        b=dNXDp25LX7N8qjuOm+NiHW0j+ajD4sIOX0DlrYWVzFXUkjF0JJdWJWMPB8FEkCOnbP
         BOoCB8SLH+fJgg2e0yBD3vXkeu1alaLPtHRXD8tC7ohZV5hXsF59qToC0Am0YelnWxhB
         mnBVsOTzfQg6qum0tL0gxetpcaodBXglUjgE9Es9gztLH25KMaNAMu6BBbZ7Ad97aEej
         3u/7Q8bD5NY3/vYJSK4QQ+mECVFv4QYvk5l8G6PhDpMwGogm6AzfuckU5LVmEuxN4Djv
         L67f23RxlLVCEIho4h20y/hJU4OUQnpgi0PWc6EtJ6QemhsdvjoVJTO8P7Bw+JfALMhs
         ug2w==
X-Forwarded-Encrypted: i=1; AJvYcCXGXNmtTAibEqcNeEEqwsMbhkhBgpfyUXvKgSBYUDLC7MKlk332gyh/RFsf2ct5RwabTMNaf2JNH5TNP2dBzy2RRGFrYPMeWkTiknTTeYgEq4o=
X-Gm-Message-State: AOJu0Yz8UCfyzUvqO/CtLyLmXaUmyiuCUTVqvHfFuAwJ1K7qjn9Xd3ac
	XhDKEiLvfL0g7tYe5XcC0eG5Ii9zEvvnqqV/pFFJBhVNvIFu0YzM3/kUHwr6YWE=
X-Google-Smtp-Source: AGHT+IGT7Ebr9AwtadFIFoAnoAydSWj6eILIKDt+uZ7DaKVxmAwk4Lo21SmVVWR88uMXGKR5VRyMnQ==
X-Received: by 2002:a5d:5110:0:b0:34d:ae98:4e7 with SMTP id ffacd0b85a97d-3719469531fmr9139813f8f.41.1724167324790;
        Tue, 20 Aug 2024 08:22:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ebdf:8de4:37af:6aad? ([2a01:e0a:982:cbb0:ebdf:8de4:37af:6aad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189897926sm13395385f8f.87.2024.08.20.08.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 08:22:03 -0700 (PDT)
Message-ID: <2e2fc3fc-33bc-4019-a3e5-9095cd7247c3@linaro.org>
Date: Tue, 20 Aug 2024 17:22:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 2/2] arm64: dts: amlogic: add support for Radxa ZERO 2
 Pro
To: FUKAUMI Naoki <naoki@radxa.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <20240712215111.687478-1-naoki@radxa.com>
 <20240712215111.687478-2-naoki@radxa.com>
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
In-Reply-To: <20240712215111.687478-2-naoki@radxa.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_082207_246644_BE8A4C5C 
X-CRM114-Status: GOOD (  18.61  )
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

On 12/07/2024 23:51, FUKAUMI Naoki wrote:
> Radxa ZERO 2 Pro is a ultra tiny high performance SBC[1] using the
> Amlogic A311D chip that ships in a number of eMMC configurations:
> 
> - Amlogic A311D SoC
> - Quad A73 + Dual A53 CPU
> - Mali G52-MP4 GPU
> - NPU (5 TOPs)
> - 4GB LPDDR4 RAM
> - 32/64/128GB eMMC
> - micro SD Card slot
> - Wi-Fi 5 and BT 5.0
> - 1x USB 2.0 Type-C port (OTG)
> - 1x USB 3.0 Type-C port (Host)
> - Micro HDMI 2.0
> - MIPI DSI
> - MIPI CSI
> - 40 Pin GPIO header
> 
> [1] https://radxa.com/products/zeros/zero2pro
> 
> Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
> ---
> Changes in v3:
> - fix file name and compatible string to use "zero-2-pro"
> - add missing --- in commit message
> Changes in v2:
> - fix dtb build error
> ---
>   arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>   .../amlogic/meson-g12b-radxa-zero-2-pro.dts   |  14 +
>   .../dts/amlogic/meson-g12b-radxa-zero2.dts    | 527 +-----------------
>   ...-zero2.dts => meson-g12b-radxa-zero2.dtsi} |   6 +-
>   4 files changed, 30 insertions(+), 518 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero-2-pro.dts
>   rewrite arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts (98%)
>   copy arch/arm64/boot/dts/amlogic/{meson-g12b-radxa-zero2.dts => meson-g12b-radxa-zero2.dtsi} (98%)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 29417f04f886..9708abdadd7c 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -31,6 +31,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-go-ultra.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2-plus.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2l.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-radxa-zero-2-pro.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-radxa-zero2.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-bananapi-m2s.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero-2-pro.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero-2-pro.dts
> new file mode 100644
> index 000000000000..5c9959cd60c6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero-2-pro.dts
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include "meson-g12b-radxa-zero2.dtsi"
> +
> +/ {
> +	compatible = "radxa,zero-2-pro", "amlogic,a311d", "amlogic,g12b";
> +	model = "Radxa ZERO 2 Pro";
> +};
> +
> +&sound {
> +	model = "RADXA-ZERO2PRO";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> dissimilarity index 98%
> index 8445701100d0..b4734cb63aaa 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> @@ -1,513 +1,14 @@
> -// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> -/*
> - * Copyright (c) 2019 BayLibre, SAS
> - * Author: Neil Armstrong <narmstrong@baylibre.com>
> - * Copyright (c) 2019 Christian Hewitt <christianshewitt@gmail.com>
> - * Copyright (c) 2022 Radxa Limited
> - * Author: Yuntian Zhang <yt@radxa.com>
> - */
> -
> -/dts-v1/;
> -
> -#include "meson-g12b-a311d.dtsi"
> -#include <dt-bindings/input/input.h>
> -#include <dt-bindings/leds/common.h>
> -#include <dt-bindings/gpio/meson-g12a-gpio.h>
> -#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
> -
> -/ {
> -	compatible = "radxa,zero2", "amlogic,a311d", "amlogic,g12b";
> -	model = "Radxa Zero2";
> -
> -	aliases {
> -		serial0 = &uart_AO;
> -		serial2 = &uart_A;
> -	};
> -
> -	chosen {
> -		stdout-path = "serial0:115200n8";
> -	};
> -
> -	memory@0 {
> -		device_type = "memory";
> -		reg = <0x0 0x0 0x0 0x80000000>;
> -	};
> -
> -	fan0: pwm-fan {
> -		compatible = "pwm-fan";
> -		#cooling-cells = <2>;
> -		cooling-levels = <0 64 128 192 255>;
> -		pwms = <&pwm_AO_ab 0 40000 0>;
> -	};
> -
> -	gpio-keys-polled {
> -		compatible = "gpio-keys-polled";
> -		poll-interval = <100>;
> -		power-button {
> -			label = "power";
> -			linux,code = <KEY_POWER>;
> -			gpios = <&gpio_ao GPIOAO_3 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> -		};
> -	};
> -
> -	leds {
> -		compatible = "gpio-leds";
> -
> -		led-green {
> -			color = <LED_COLOR_ID_GREEN>;
> -			function = LED_FUNCTION_STATUS;
> -			gpios = <&gpio GPIOA_12 GPIO_ACTIVE_HIGH>;
> -			linux,default-trigger = "heartbeat";
> -		};
> -	};
> -
> -	hdmi-connector {
> -		compatible = "hdmi-connector";
> -		type = "a";
> -
> -		port {
> -			hdmi_connector_in: endpoint {
> -				remote-endpoint = <&hdmi_tx_tmds_out>;
> -			};
> -		};
> -	};
> -
> -	emmc_pwrseq: emmc-pwrseq {
> -		compatible = "mmc-pwrseq-emmc";
> -		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
> -	};
> -
> -	sdio_pwrseq: sdio-pwrseq {
> -		compatible = "mmc-pwrseq-simple";
> -		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
> -		clocks = <&wifi32k>;
> -		clock-names = "ext_clock";
> -	};
> -
> -	ao_5v: regulator-ao-5v {
> -		compatible = "regulator-fixed";
> -		regulator-name = "AO_5V";
> -		regulator-min-microvolt = <5000000>;
> -		regulator-max-microvolt = <5000000>;
> -		regulator-always-on;
> -	};
> -
> -	vcc_1v8: regulator-vcc-1v8 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "VCC_1V8";
> -		regulator-min-microvolt = <1800000>;
> -		regulator-max-microvolt = <1800000>;
> -		vin-supply = <&vcc_3v3>;
> -		regulator-always-on;
> -	};
> -
> -	vcc_3v3: regulator-vcc-3v3 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "VCC_3V3";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		vin-supply = <&vddao_3v3>;
> -		regulator-always-on;
> -		/* FIXME: actually controlled by VDDCPU_B_EN */
> -	};
> -
> -	vddao_1v8: regulator-vddao-1v8 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "VDDIO_AO1V8";
> -		regulator-min-microvolt = <1800000>;
> -		regulator-max-microvolt = <1800000>;
> -		vin-supply = <&vddao_3v3>;
> -		regulator-always-on;
> -	};
> -
> -	vddao_3v3: regulator-vddao-3v3 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "VDDAO_3V3";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		vin-supply = <&ao_5v>;
> -		regulator-always-on;
> -	};
> -
> -	vddcpu_a: regulator-vddcpu-a {
> -		/*
> -		 * MP8756GD Regulator.
> -		 */
> -		compatible = "pwm-regulator";
> -
> -		regulator-name = "VDDCPU_A";
> -		regulator-min-microvolt = <730000>;
> -		regulator-max-microvolt = <1022000>;
> -
> -		pwm-supply = <&ao_5v>;
> -
> -		pwms = <&pwm_ab 0 1250 0>;
> -		pwm-dutycycle-range = <100 0>;
> -
> -		regulator-boot-on;
> -		regulator-always-on;
> -	};
> -
> -	vddcpu_b: regulator-vddcpu-b {
> -		/*
> -		 * Silergy SY8120B1ABC Regulator.
> -		 */
> -		compatible = "pwm-regulator";
> -
> -		regulator-name = "VDDCPU_B";
> -		regulator-min-microvolt = <730000>;
> -		regulator-max-microvolt = <1022000>;
> -
> -		pwm-supply = <&ao_5v>;
> -
> -		pwms = <&pwm_AO_cd 1 1250 0>;
> -		pwm-dutycycle-range = <100 0>;
> -
> -		regulator-boot-on;
> -		regulator-always-on;
> -	};
> -
> -	sound {
> -		compatible = "amlogic,axg-sound-card";
> -		model = "RADXA-ZERO2";
> -		audio-aux-devs = <&tdmout_b>;
> -		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
> -				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
> -				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
> -				"TDM_B Playback", "TDMOUT_B OUT";
> -
> -		assigned-clocks = <&clkc CLKID_MPLL2>,
> -				  <&clkc CLKID_MPLL0>,
> -				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
> -		assigned-clock-rates = <294912000>,
> -				       <270950400>,
> -				       <393216000>;
> -
> -		dai-link-0 {
> -			sound-dai = <&frddr_a>;
> -		};
> -
> -		dai-link-1 {
> -			sound-dai = <&frddr_b>;
> -		};
> -
> -		dai-link-2 {
> -			sound-dai = <&frddr_c>;
> -		};
> -
> -		/* 8ch hdmi interface */
> -		dai-link-3 {
> -			sound-dai = <&tdmif_b>;
> -			dai-format = "i2s";
> -			dai-tdm-slot-tx-mask-0 = <1 1>;
> -			dai-tdm-slot-tx-mask-1 = <1 1>;
> -			dai-tdm-slot-tx-mask-2 = <1 1>;
> -			dai-tdm-slot-tx-mask-3 = <1 1>;
> -			mclk-fs = <256>;
> -
> -			codec {
> -				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
> -			};
> -		};
> -
> -		/* hdmi glue */
> -		dai-link-4 {
> -			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
> -
> -			codec {
> -				sound-dai = <&hdmi_tx>;
> -			};
> -		};
> -	};
> -
> -	wifi32k: clock-0 {
> -		compatible = "pwm-clock";
> -		#clock-cells = <0>;
> -		clock-frequency = <32768>;
> -		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
> -	};
> -};
> -
> -&arb {
> -	status = "okay";
> -};
> -
> -&cec_AO {
> -	pinctrl-0 = <&cec_ao_a_h_pins>;
> -	pinctrl-names = "default";
> -	status = "disabled";
> -	hdmi-phandle = <&hdmi_tx>;
> -};
> -
> -&cecb_AO {
> -	pinctrl-0 = <&cec_ao_b_h_pins>;
> -	pinctrl-names = "default";
> -	status = "okay";
> -	hdmi-phandle = <&hdmi_tx>;
> -};
> -
> -&clkc_audio {
> -	status = "okay";
> -};
> -
> -&cpu0 {
> -	cpu-supply = <&vddcpu_b>;
> -	operating-points-v2 = <&cpu_opp_table_0>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
> -};
> -
> -&cpu1 {
> -	cpu-supply = <&vddcpu_b>;
> -	operating-points-v2 = <&cpu_opp_table_0>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
> -};
> -
> -&cpu100 {
> -	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
> -};
> -
> -&cpu101 {
> -	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
> -};
> -
> -&cpu102 {
> -	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
> -};
> -
> -&cpu103 {
> -	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
> -};
> -
> -&cpu_thermal {
> -	trips {
> -		cpu_active: cpu-active {
> -			temperature = <70000>; /* millicelsius */
> -			hysteresis = <2000>; /* millicelsius */
> -			type = "active";
> -		};
> -	};
> -
> -	cooling-maps {
> -		map2 {
> -			trip = <&cpu_active>;
> -			cooling-device = <&fan0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> -		};
> -	};
> -};
> -
> -&frddr_a {
> -	status = "okay";
> -};
> -
> -&frddr_b {
> -	status = "okay";
> -};
> -
> -&frddr_c {
> -	status = "okay";
> -};
> -
> -&gpio {
> -	gpio-line-names =
> -		/* GPIOZ */
> -		"PIN_27", "PIN_28", "PIN_7", "PIN_11", "PIN_13", "PIN_15", "PIN_18", "PIN_40",
> -		"", "", "", "", "", "", "", "",
> -		/* GPIOH */
> -		"", "", "", "", "PIN_19", "PIN_21", "PIN_24", "PIN_23",
> -		"",
> -		/* BOOT */
> -		"", "", "", "", "", "", "", "",
> -		"", "", "", "", "EMMC_PWRSEQ", "", "", "",
> -		/* GPIOC */
> -		"", "", "", "", "", "", "SD_CD", "PIN_36",
> -		/* GPIOA */
> -		"PIN_32", "PIN_12", "PIN_35", "", "", "PIN_38", "", "",
> -		"", "", "", "", "LED_GREEN", "PIN_31", "PIN_3", "PIN_5",
> -		/* GPIOX */
> -		"", "", "", "", "", "", "SDIO_PWRSEQ", "",
> -		"", "", "", "", "", "", "", "",
> -		"", "BT_SHUTDOWN", "", "";
> -};
> -
> -&gpio_ao {
> -	gpio-line-names =
> -		/* GPIOAO */
> -		"PIN_8", "PIN_10", "", "BTN_POWER", "", "", "", "PIN_29",
> -		"PIN_33", "PIN_37", "FAN", "",
> -		/* GPIOE */
> -		"", "", "";
> -};
> -
> -&hdmi_tx {
> -	status = "okay";
> -	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
> -	pinctrl-names = "default";
> -	hdmi-supply = <&ao_5v>;
> -};
> -
> -&hdmi_tx_tmds_port {
> -	hdmi_tx_tmds_out: endpoint {
> -		remote-endpoint = <&hdmi_connector_in>;
> -	};
> -};
> -
> -&ir {
> -	status = "disabled";
> -	pinctrl-0 = <&remote_input_ao_pins>;
> -	pinctrl-names = "default";
> -};
> -
> -&pwm_ab {
> -	pinctrl-0 = <&pwm_a_e_pins>;
> -	pinctrl-names = "default";
> -	clocks = <&xtal>;
> -	clock-names = "clkin0";
> -	status = "okay";
> -};
> -
> -&pwm_ef {
> -	pinctrl-0 = <&pwm_e_pins>;
> -	pinctrl-names = "default";
> -	clocks = <&xtal>;
> -	clock-names = "clkin0";
> -	status = "okay";
> -};
> -
> -&pwm_AO_ab {
> -	pinctrl-0 = <&pwm_ao_a_pins>;
> -	pinctrl-names = "default";
> -	clocks = <&xtal>;
> -	clock-names = "clkin0";
> -	status = "okay";
> -};
> -
> -&pwm_AO_cd {
> -	pinctrl-0 = <&pwm_ao_d_e_pins>;
> -	pinctrl-names = "default";
> -	clocks = <&xtal>;
> -	clock-names = "clkin1";
> -	status = "okay";
> -};
> -
> -&saradc {
> -	status = "okay";
> -	vref-supply = <&vddao_1v8>;
> -};
> -
> -/* SDIO */
> -&sd_emmc_a {
> -	status = "okay";
> -	pinctrl-0 = <&sdio_pins>;
> -	pinctrl-1 = <&sdio_clk_gate_pins>;
> -	pinctrl-names = "default", "clk-gate";
> -	#address-cells = <1>;
> -	#size-cells = <0>;
> -
> -	bus-width = <4>;
> -	cap-sd-highspeed;
> -	max-frequency = <100000000>;
> -
> -	non-removable;
> -	disable-wp;
> -
> -	/* WiFi firmware requires power to be kept while in suspend */
> -	keep-power-in-suspend;
> -
> -	mmc-pwrseq = <&sdio_pwrseq>;
> -
> -	vmmc-supply = <&vddao_3v3>;
> -	vqmmc-supply = <&vddao_1v8>;
> -
> -	brcmf: wifi@1 {
> -		reg = <1>;
> -		compatible = "brcm,bcm4329-fmac";
> -	};
> -};
> -
> -/* SD card */
> -&sd_emmc_b {
> -	status = "okay";
> -	pinctrl-0 = <&sdcard_c_pins>;
> -	pinctrl-1 = <&sdcard_clk_gate_c_pins>;
> -	pinctrl-names = "default", "clk-gate";
> -
> -	bus-width = <4>;
> -	cap-sd-highspeed;
> -	max-frequency = <50000000>;
> -	disable-wp;
> -
> -	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
> -	vmmc-supply = <&vddao_3v3>;
> -	vqmmc-supply = <&vddao_3v3>;
> -};
> -
> -/* eMMC */
> -&sd_emmc_c {
> -	status = "okay";
> -	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_8b_pins>, <&emmc_ds_pins>;
> -	pinctrl-1 = <&emmc_clk_gate_pins>;
> -	pinctrl-names = "default", "clk-gate";
> -
> -	bus-width = <8>;
> -	cap-mmc-highspeed;
> -	mmc-ddr-1_8v;
> -	mmc-hs200-1_8v;
> -	max-frequency = <200000000>;
> -	disable-wp;
> -
> -	mmc-pwrseq = <&emmc_pwrseq>;
> -	vmmc-supply = <&vcc_3v3>;
> -	vqmmc-supply = <&vcc_1v8>;
> -};
> -
> -&tdmif_b {
> -	status = "okay";
> -};
> -
> -&tdmout_b {
> -	status = "okay";
> -};
> -
> -&tohdmitx {
> -	status = "okay";
> -};
> -
> -&uart_A {
> -	status = "okay";
> -	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> -	pinctrl-names = "default";
> -	uart-has-rtscts;
> -
> -	bluetooth {
> -		compatible = "brcm,bcm43438-bt";
> -		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
> -		max-speed = <2000000>;
> -		clocks = <&wifi32k>;
> -		clock-names = "lpo";
> -	};
> -};
> -
> -&uart_AO {
> -	status = "okay";
> -	pinctrl-0 = <&uart_ao_a_pins>;
> -	pinctrl-names = "default";
> -};
> -
> -&usb {
> -	status = "okay";
> -};
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include "meson-g12b-radxa-zero2.dtsi"
> +
> +/ {
> +	compatible = "radxa,zero2", "amlogic,a311d", "amlogic,g12b";
> +	model = "Radxa ZERO2";
> +};
> +
> +&sound {
> +	model = "RADXA-ZERO2";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dtsi
> similarity index 98%
> copy from arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> copy to arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dtsi
> index 8445701100d0..b73c4a423dfd 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dtsi
> @@ -16,9 +16,6 @@
>   #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>   
>   / {
> -	compatible = "radxa,zero2", "amlogic,a311d", "amlogic,g12b";
> -	model = "Radxa Zero2";
> -
>   	aliases {
>   		serial0 = &uart_AO;
>   		serial2 = &uart_A;
> @@ -167,9 +164,8 @@ vddcpu_b: regulator-vddcpu-b {
>   		regulator-always-on;
>   	};
>   
> -	sound {
> +	sound: sound {
>   		compatible = "amlogic,axg-sound-card";
> -		model = "RADXA-ZERO2";
>   		audio-aux-devs = <&tdmout_b>;
>   		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
>   				"TDMOUT_B IN 1", "FRDDR_B OUT 1",

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
