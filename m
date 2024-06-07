Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EE0C27C53
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2024 08:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UD18iqakktLX9CTIU3CYxJGhcaty/yWuefuNsgnVc4=; b=PO0XjmtJ2RhWRGrod5hQ2yAOn4
	DC/mYmHmNqL+60eGqA1HsqwqfiX78zEGP6v8Lx/h4EsMJAwl7HJT+8wzqQtjWDwgWlQPiXZYJXjx0
	WGSdrHPpDAlZbgmKYBl1g9NQGVTCyxg3c+QaoU7YumwfxSxgwCd9IjrD9lLiZFTArQhlN/pKa3ZQE
	L7Q0nQ/Bu1Z8bh413LmNwz2yR2ZjCv0Uhh2thEw1Yjno4En7fRQyJ8exX7lH6Y1C0gKH15UwlWo0r
	Nc3+WUcrwjDCVALvnt4V50xyxSfzUpY2hhBjOpt5lPpB+onPqLyV969GVL/gbQthth/6ILtY/ciZc
	ttDNcmUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFUdU-0000000D45e-3eir;
	Fri, 07 Jun 2024 08:07:44 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFUdS-0000000D44h-1EaB
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Jun 2024 08:07:43 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-35e1fcd0c0fso1884582f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Jun 2024 01:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717747661; x=1718352461; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zm7TFPva0bErQOP/68vGfRmjP0R/5JymFuac9fbRPVw=;
        b=gJNNq/Dywjvn7aGzp5LWQNDvQ/EDXb1mgsh4yH6gTnI3MpQwkv+ZwOMIWmyluzSHh4
         +WXx7Jtq0ID0zJbolzt2uBDz37NVI2469ZmvQEQtGap34zyqxoRuSI8cdw2s+JKOWFBk
         nhVZ9yQ9fzes4WdKeCo200DtnGG94dwJYdEamWH7k7NZ8Qax5hxUxrONX2Tc0pgdPR36
         T1fo8pagTQlRJKB20r6yJLTg1ovmEEFDL5scJeGhEvxy1X4oNqcoesdKz/mFR20z6Gtm
         oMDkC/i9DHBI5U8Xo7On7GJrP8x0m/G95h1CKhhG7ihUDHn6IUjoAsWiuC6SPcq0uW2X
         rrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717747661; x=1718352461;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zm7TFPva0bErQOP/68vGfRmjP0R/5JymFuac9fbRPVw=;
        b=tmt4X6r/YGAANkCFD/RhW1lSrRuV1+wFgmwqXF6R7Gm6bz40KZ6UMt86F3OmULv9jM
         tj2OhyBkP+Os0fxsASCi5kHVlMa+kYI8FzS71P8njnK6cN82OR09fc3G3msqhAFWEYC8
         CSx8WeNeqV43rvw+x6IQJYzquqvvtDWWT6EkaMeuTuD2fUteGgf1WmnfdriMKdjriwey
         ANLgzyHSc20frJLGL/Ly0KCvK3KeZ7if9csEg0tfPD37olLoNvHE1yPU9dNvAXQ1NPhs
         p0AYvkoxDj2XNtvscYqeeV+z15Tz9XMJuVPMc2+beDqzQgxNgdwIBU9JU7shNJUVFg/l
         ke+A==
X-Forwarded-Encrypted: i=1; AJvYcCWyRthaq8oLmGaK76YF+0/I11+tZPFx34aKnPgHBhM+cTbHZ77pay+A3M7ZnKxN46Xa1j0MerMJuFdtCZonTCGvsk0H3gTO1GupvYXaOYbH/9A=
X-Gm-Message-State: AOJu0Yz8t+fiaj/9je57YT6KIWd2n5KC3oVn9WjjXkmkqOq0tm9Hm+i5
	Su9ZF751XcbteJppP5gahyNmEbdi9OZw8zkPU40wKgLcTmCUMBQy7K9ENo+JaaY=
X-Google-Smtp-Source: AGHT+IHqhz5k04ZzyFG1CkhZU4vWzmotulML28MoByYGhj8GH+MxqZaO0+We9+uAJfWY61IYXCGEKQ==
X-Received: by 2002:a5d:6483:0:b0:354:df59:c9a4 with SMTP id ffacd0b85a97d-35efed08bd4mr1647456f8f.9.1717747660655;
        Fri, 07 Jun 2024 01:07:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7e4b:b0d3:6a34:6404? ([2a01:e0a:982:cbb0:7e4b:b0d3:6a34:6404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d297b3sm3443187f8f.11.2024.06.07.01.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 01:07:40 -0700 (PDT)
Message-ID: <7b877bc6-9e26-4bae-934a-ceb9663d751d@linaro.org>
Date: Fri, 7 Jun 2024 10:07:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: meson: add support for OSMC Vero 4K
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240606095419.3950015-1-christianshewitt@gmail.com>
 <20240606095419.3950015-2-christianshewitt@gmail.com>
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
In-Reply-To: <20240606095419.3950015-2-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_010742_385505_3F846C24 
X-CRM114-Status: GOOD (  16.14  )
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

On 06/06/2024 11:54, Christian Hewitt wrote:
> The OSMC Vero 4K device is based on the Amlogic S905X (P212)
> reference design with the following specifications:
> 
> - 2GB DDR4 RAM
> - 16GB eMMC
> - HDMI 2.1 video
> - S/PDIF optical output
> - AV output
> - 10/100 Ethernet
> - AP6255 Wireless (802.11 a/b/g/n/ac, BT 4.2)
> - 2x USB 2.0 ports (1x OTG)
> - IR receiver (internal)
> - IR extender port (external)
> - 1x micro SD card slot
> - 1x Power LED (red)
> - 1x Reset button (in AV jack)
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile          |   7 +
>   .../dts/amlogic/meson-gxl-s905x-vero4k.dts    | 202 ++++++++++++++++++
>   2 files changed, 209 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 4addcae2c54e..78941ddd3136 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -55,6 +55,13 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p231.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-phicomm-n1.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-sml5442tw.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-vero4k-plus.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-hwacom-amazetv.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-khadas-vim.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc-v2.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-vero4k.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-jethome-jethub-j80.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-p281.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-tx3-mini.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dts
> new file mode 100644
> index 000000000000..b325cd75a792
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dts
> @@ -0,0 +1,202 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2024 Christian Hewitt <christianshewitt@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-gxl-s905x-p212.dtsi"
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/sound/meson-aiu.h>
> +
> +/ {
> +	compatible = "osmc,vero4k", "amlogic,s905x", "amlogic,meson-gxl";
> +	model = "OSMC Vero 4K";
> +
> +	reserved-memory {
> +		/* 32 MiB reserved for ARM Trusted Firmware (BL32) */
> +		secmon_reserved_bl32: secmon@5300000 {
> +			reg = <0x0 0x05300000 0x0 0x2000000>;
> +			no-map;
> +		};
> +	};
> +
> +	gpio-keys-polled {
> +		compatible = "gpio-keys-polled";
> +		poll-interval = <20>;
> +
> +		button {
> +			label = "power";
> +			linux,code = <KEY_POWER>;
> +			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-standby {
> +			color = <LED_COLOR_ID_RED>;
> +			function = LED_FUNCTION_POWER;
> +			gpios = <&gpio GPIODV_24 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +			panic-indicator;
> +		};
> +	};
> +
> +	dio2133: analog-amplifier {
> +		compatible = "simple-audio-amplifier";
> +		sound-name-prefix = "AU2";
> +		VCC-supply = <&hdmi_5v>;
> +		enable-gpios = <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	spdif_dit: audio-codec-0 {
> +		#sound-dai-cells = <0>;
> +		compatible = "linux,spdif-dit";
> +		sound-name-prefix = "DIT";
> +	};
> +
> +	cvbs-connector {
> +		compatible = "composite-video-connector";
> +
> +		port {
> +			cvbs_connector_in: endpoint {
> +				remote-endpoint = <&cvbs_vdac_out>;
> +			};
> +		};
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
> +	sound {
> +		compatible = "amlogic,gx-sound-card";
> +		model = "VERO4K";
> +		audio-aux-devs = <&dio2133>;
> +		audio-widgets = "Line", "Lineout";
> +		audio-routing = "AU2 INL", "ACODEC LOLP",
> +				"AU2 INR", "ACODEC LORP",
> +				"AU2 INL", "ACODEC LOLN",
> +				"AU2 INR", "ACODEC LORN",
> +				"Lineout", "AU2 OUTL",
> +				"Lineout", "AU2 OUTR";
> +
> +		dai-link-0 {
> +			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
> +		};
> +
> +		dai-link-1 {
> +			sound-dai = <&aiu AIU_CPU CPU_SPDIF_FIFO>;
> +		};
> +
> +		dai-link-2 {
> +			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
> +			dai-format = "i2s";
> +			mclk-fs = <256>;
> +
> +			codec-0 {
> +				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
> +			};
> +
> +			codec-1 {
> +				sound-dai = <&aiu AIU_ACODEC CTRL_I2S>;
> +			};
> +		};
> +
> +		dai-link-3 {
> +			sound-dai = <&aiu AIU_CPU CPU_SPDIF_ENCODER>;
> +
> +			codec-0 {
> +				sound-dai = <&spdif_dit>;
> +			};
> +		};
> +
> +		dai-link-4 {
> +			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
> +
> +			codec-0 {
> +				sound-dai = <&hdmi_tx>;
> +			};
> +		};
> +
> +		dai-link-5 {
> +			sound-dai = <&aiu AIU_ACODEC CTRL_OUT>;
> +
> +			codec-0 {
> +				sound-dai = <&acodec>;
> +			};
> +		};
> +	};
> +};
> +
> +&acodec {
> +	AVDD-supply = <&vddio_ao18>;
> +	status = "okay";
> +};
> +
> +&aiu {
> +	status = "okay";
> +	pinctrl-0 = <&spdif_out_h_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&cec_AO {
> +	status = "okay";
> +	pinctrl-0 = <&ao_cec_pins>;
> +	pinctrl-names = "default";
> +	hdmi-phandle = <&hdmi_tx>;
> +};
> +
> +&clkc {
> +	assigned-clocks = <&clkc CLKID_MPLL0>,
> +			  <&clkc CLKID_MPLL1>,
> +			  <&clkc CLKID_MPLL2>;
> +	assigned-clock-parents = <0>, <0>, <0>;
> +	assigned-clock-rates = <294912000>,
> +			       <270950400>,
> +			       <393216000>;
> +};
> +
> +&cvbs_vdac_port {
> +	cvbs_vdac_out: endpoint {
> +		remote-endpoint = <&cvbs_connector_in>;
> +	};
> +};
> +
> +&ethmac {
> +	phy-mode = "rmii";
> +	phy-handle = <&internal_phy>;
> +};
> +
> +&hdmi_tx {
> +	status = "okay";
> +	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
> +	pinctrl-names = "default";
> +	hdmi-supply = <&hdmi_5v>;
> +};
> +
> +&hdmi_tx_tmds_port {
> +	hdmi_tx_tmds_out: endpoint {
> +		remote-endpoint = <&hdmi_connector_in>;
> +	};
> +};
> +
> +&internal_phy {
> +	pinctrl-0 = <&eth_link_led_pins>, <&eth_act_led_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +/* This UART is brought out to the DB9 connector */
> +&uart_AO {
> +	status = "okay";
> +};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
