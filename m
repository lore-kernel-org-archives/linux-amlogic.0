Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BF0D4115F
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jan 2026 10:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvLIVg1Hb12+zRUXuEUS7399JMdugIPCFaNEarP3ZF0=; b=kR398EGBT/Yo9Y+ClaBO6AK5l0
	cgYCcoMGk/1bAa5Io9AOphqBaa0cH+Y/A3IalMj861Tq5F5fes/BsItqfTeJ2xxS0KYgXBH7TLxKW
	54Tew8SlUwJesqCAiCfePjr374dOOyFVc/tre6780MMAmyMK9EXzhHFaQKs5bqdsaeU3sl9CTTUmQ
	i4TTJyi5tFfRaKAsp+IdMUJoIwl0N2mqQVGolAjFA8lcbeCP6yhve6RZ7MVN6sRrX1Lp2aVj/nX3x
	kjjvzwrxvJG6vluouZrRBcXoXaSLg/9HoMK69f5WOd+U+d99G+jgh4kC3wfWC8p8O43ttXgFwVGNw
	XKEcgGOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKY2-0000000C9hq-471T;
	Thu, 15 Jan 2026 10:25:50 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKY0-0000000C9g2-1RzB
	for linux-amlogic@lists.infradead.org;
	Thu, 15 Jan 2026 10:25:49 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-432d2c96215so598400f8f.3
        for <linux-amlogic@lists.infradead.org>; Thu, 15 Jan 2026 02:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768472746; x=1769077546; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFSizpn0QWrLEJm04aGvPh5FIfAv/Uy1/FCCcZUEvEQ=;
        b=UeOD63rVn1Y/mo1CnERx/VegOTB03/9BKhR9IhFtGNtcb7HjgCSh4To8xSxxR9RORv
         J4/sqaJEEkWyZA5ARXQqNg5NjMpadXBaNlHF0AfKOy03/pA8Xy1sns5msP8P89IS7oTk
         RdzzIz1UrwXM6U2kXp5nvbZbGbB6/g1BfBSUIE5OgJmzifW7apdu9c22Q0Zxq5WUMrrd
         LEcpp3azF23Q3NdPKe5qWlPnvViGKuY7fyBSzoEgb2v10viTMaJHM6Tm5OW4KziCWoEF
         SIMjdqcBAR8elve87N321ELDw0F0bN9/gbmpP1Yg9KN+5Xt2Edou2gJV0+e2tjwmPYVC
         3YIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472746; x=1769077546;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HFSizpn0QWrLEJm04aGvPh5FIfAv/Uy1/FCCcZUEvEQ=;
        b=loU2VcWbTSadHfne6urpdwQl5RU8dsAPl1eykcT6h1g+XhcVx/H8iTreO/bqc3C3Gf
         KNp4UK7/KaXOr83nxUrxMzepBBcHse+87pLkOrpw3gxqwl2R9j86SakXOHvKraS/8QIa
         ekTfVEeQy35+6lBMfwcSz4xTpVoXiHj0FD95QdiZmXx31vkhJZwQ44EInWqd9gX6Qmg1
         UvL4dwA2vPLtJHoEzf5ZtJ8sqJGV9GCRagiS1MUTX7URvy36WrF1tBSt62DrFcgShckO
         UXXbKTRJuLPFZOCNpGztdTZeL6ghYMpheEOyyu8LIeI3SFoKotkckTmjkkYfgryEnn6b
         RehA==
X-Forwarded-Encrypted: i=1; AJvYcCUhSAQYTQqmTc/V9y1skvsL6qrLn0ZZtPKBrDiEPc1SD36k0lw6xph+xJp1YQpDDwTme7eoUsm3HMsdjhFv@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3u95DKy1vGgcsXLG3E5KYGHPYQusQY3rO3WtNRbiLPqGPEj9/
	u9kQO71miAK7ARQmqCPLp6nr6LNuYS9dSoa8U5dAcyAAZZjVHobZN35+ccRyt20Yj3c=
X-Gm-Gg: AY/fxX7e4MAOhUIaQvVPZY0GMj5E4AtPoxrDXkwuyXWIwaP/3HW/2WRT3gvZY52HcD5
	0/+y54J4awnNjZK+X/OHl2MXgDWIKM5NEzKm55XDaqDJc7WLoqNBnnytPxggklvlVxqsNajC4aV
	tSr8CeR4TiIR2d/0RiKwJNwKI3/LK+obxYMfi8FP8g+DgyYKeytASbr38eiRClw5iiCuQCpoorX
	unjTzTfrtSQbTD8/F1ggki3Seae8Sw0QePECG33psyVcf7duPxBHTGSyFt3mOJT1kewJ7Zp7CDa
	5ikFmufdv08jMAE1OO5EuH/yxQ04qoTJeZmCgv7HTikssaG2SLuthrI3qUslueoNCNFNOvAU8QU
	XD3kaeAiWwLKCR/gAKksOxXS0LneRGReq0s+12j9QpS/IlotteqxtoV5pzTL/COdhJeD+Cy5qQ6
	n1ybRpkqtSfnwGMjp4vSn2S99Gd/Ifv8gMnuuVybv3Mtc1YR5DrcqL7+dGeCMBUc4=
X-Received: by 2002:a05:6000:178e:b0:430:fbad:687a with SMTP id ffacd0b85a97d-4342d38974cmr6987675f8f.13.1768472746306;
        Thu, 15 Jan 2026 02:25:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d? ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af64a778sm5011554f8f.3.2026.01.15.02.25.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 02:25:45 -0800 (PST)
Message-ID: <1b17fb1b-9235-43b5-a57e-6b04fe8f4516@linaro.org>
Date: Thu, 15 Jan 2026 11:25:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 3/3] arm64: dts: meson-s4-s905y4-khadas-vim1s: add
 initial device tree
To: Nick Xie <nick@khadas.com>, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20260115030015.1334517-1-nick@khadas.com>
 <20260115030015.1334517-4-nick@khadas.com>
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
In-Reply-To: <20260115030015.1334517-4-nick@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_022548_436654_C8EAAB07 
X-CRM114-Status: GOOD (  16.35  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, xianwei.zhao@amlogic.com, nick@xieqinick.com, krzk+dt@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 1/15/26 04:00, Nick Xie wrote:
> The Khadas VIM1S uses the Amlogic S905Y4 SoC, based on the
> Amlogic S4 SoC family, on a board with the same form factor as the
> VIM/VIM2/VIM3/VIM4 models. Serial debug console, ethernet, SD card
> work with this initial device tree.
> 
> It features:
>   - 2GB LPDDR4 RAM
>   - 16GB eMMC 5.1 storage
>   - 32MB SPI flash
>   - 100M Ethernet
>   - AP6256 Wireless (802.11 a/b/g/n/ac, BT5.0)
>   - HDMI 2.1 video
>   - 2x USB 2.0 ports
>   - 1x USB-C (power) with USB 2.0 OTG
>   - 2x LED's (1x red, 1x white)
>   - 3x buttons (power, function, reset)
>   - IR receiver
>   - 40pin GPIO Header
>   - 1x micro SD card slot
> 
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>   .../amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 190 ++++++++++++++++++
>   2 files changed, 191 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 219fb088c704d..15f9c817e5023 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -85,6 +85,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-ugoos-am3.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-s4-s805x2-aq222.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-s4-s905y4-khadas-vim1s.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air-gbit.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-bananapi-m2-pro.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
> new file mode 100644
> index 0000000000000..79ffc703a2e99
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2026 Khadas Technology Co., Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-s4.dtsi"
> +
> +/ {
> +	model = "Khadas VIM1S";
> +	compatible = "khadas,vim1s", "amlogic,s905y4", "amlogic,s4";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		mmc0 = &emmc; /* eMMC */
> +		mmc1 = &sd; /* SD card */
> +		mmc2 = &sdio; /* SDIO */
> +		serial0 = &uart_b;
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x0 0x0 0x80000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* 52 MiB reserved for ARM Trusted Firmware */
> +		secmon_reserved: secmon@5000000 {
> +			reg = <0x0 0x05000000 0x0 0x3400000>;
> +			no-map;
> +		};
> +	};
> +
> +	sdio_32k: sdio-32k {
> +		compatible = "pwm-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
> +	};
> +
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
> +		clocks = <&sdio_32k>;
> +		clock-names = "ext_clock";
> +	};
> +
> +	main_5v: regulator-main-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	sd_3v3: regulator-sd-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "SD_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio GPIOD_4 GPIO_ACTIVE_LOW>;
> +		regulator-always-on;
> +	};
> +
> +	vddio_sd: regulator-vddio-sd {
> +		compatible = "regulator-gpio";
> +		regulator-name = "VDDIO_SD";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpios = <&gpio GPIOD_9 GPIO_ACTIVE_HIGH>;
> +		gpios-states = <1>;
> +		states = <1800000 1
> +				3300000 0>;
> +	};
> +
> +	/* SY8120B1ABC DC/DC Regulator. */
> +	vddcpu: regulator-vddcpu {
> +		compatible = "pwm-regulator";
> +
> +		regulator-name = "VDDCPU";
> +		regulator-min-microvolt = <689000>;
> +		regulator-max-microvolt = <1049000>;
> +
> +		vin-supply = <&main_5v>;
> +
> +		pwms = <&pwm_ij 1 1500 0>;
> +		pwm-dutycycle-range = <100 0>;
> +
> +		regulator-boot-on;
> +		regulator-always-on;
> +		/* Voltage Duty-Cycle */
> +		voltage-table = <1049000 0>,
> +				<1039000 3>,
> +				<1029000 6>,
> +				<1019000 9>,
> +				<1009000 12>,
> +				<999000 14>,
> +				<989000 17>,
> +				<979000 20>,
> +				<969000 23>,
> +				<959000 26>,
> +				<949000 29>,
> +				<939000 31>,
> +				<929000 34>,
> +				<919000 37>,
> +				<909000 40>,
> +				<899000 43>,
> +				<889000 45>,
> +				<879000 48>,
> +				<869000 51>,
> +				<859000 54>,
> +				<849000 56>,
> +				<839000 59>,
> +				<829000 62>,
> +				<819000 65>,
> +				<809000 68>,
> +				<799000 70>,
> +				<789000 73>,
> +				<779000 76>,
> +				<769000 79>,
> +				<759000 81>,
> +				<749000 84>,
> +				<739000 87>,
> +				<729000 89>,
> +				<719000 92>,
> +				<709000 95>,
> +				<699000 98>,
> +				<689000 100>;
> +	};
> +};
> +
> +&ethmac {
> +	status = "okay";
> +	phy-handle = <&internal_ephy>;
> +	phy-mode = "rmii";
> +};
> +
> +&ir {
> +	status = "okay";
> +	pinctrl-0 = <&remote_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&pwm_ef {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_e_pins1>;
> +	pinctrl-names = "default";
> +};
> +
> +&pwm_ij {
> +	status = "okay";
> +};
> +
> +&sd {
> +	status = "okay";
> +	pinctrl-0 = <&sdcard_pins>;
> +	pinctrl-1 = <&sdcard_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	max-frequency = <200000000>;
> +	disable-wp;
> +
> +	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
> +
> +	vmmc-supply = <&sd_3v3>;
> +	vqmmc-supply = <&vddio_sd>;
> +};
> +
> +&spicc0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spicc0_pins_x>;
> +	cs-gpios = <&gpio GPIOX_10 GPIO_ACTIVE_LOW>;
> +};
> +
> +&uart_b {
> +	status = "okay";
> +};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
