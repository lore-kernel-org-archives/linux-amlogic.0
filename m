Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B1AC27C53
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2024 08:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjquJhDc+Eb95zY+mkMSpSoOMoJpv9/eZ0gs0NP/8mM=; b=yHnHdOM3zmZ9asaUQ9grHTbtRt
	W21YdbYPNM3zxyMZLhgDC3gWuyl5SzO5GFGRm1rw+wWuDrUcU6o6/evq5XgkC08LPLyVfVg/5BELs
	Ers4N5WXzKa1xq7vUL0EK11KWyqe11YW8iuH5b7niTPDTThye0ou+pUsR5vFfL/lULEvsEMs29+4D
	BcACmq5vbwurZ74uD/nj3zB1u0hbSLgxOal91g/Z7UJK2u7CCUdVHS2REQivdc5V4ysSWOJb4rVGq
	Kho/su+kKqblA8g3hHJ9zzaqWhQFFrITUdFX6SjZJ2hhPOrimJp+Ryq2kgLoiqX57YngIcMKwX8d6
	4gYZpNsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFUck-0000000D3pd-1nWp;
	Fri, 07 Jun 2024 08:06:58 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFUch-0000000D3nv-0RFJ
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Jun 2024 08:06:56 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2eae2d4da7bso2965531fa.0
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Jun 2024 01:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717747609; x=1718352409; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cs2er2WfjzPxLxlW6i654REXwOLP4BuIdcUwIYww4wQ=;
        b=LZCbNDTOVt3CqQFInQB76gUroyH8KsiornrsNDv+CkS8tHYSqmSneYaQtaC047HEJa
         u9xJMUy7+Q+MWNEaR7+zvNWoP8KlF7IG+QB1FEHG2ULq12Tj14lnSlpkjJuQwi1fQgg7
         cxSxwDXFMAsg/IqdqbN9taqhxvHVTFvpxhu9/HS+ih+LsFocn0dQR+MEfJpJxKI16U8i
         pdKj9AYMDFzKb58B7auIE0oKJpyHDhmwU8u13rZGJIpFlMwu66GRS98zE89Zmi9g55mm
         F7To6tKXQP38tCeMXRU50zmdzDqvS+UL2Rx7/3phzDz1kT71Z5wkCJGizGikHJ7tUycB
         APOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717747609; x=1718352409;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cs2er2WfjzPxLxlW6i654REXwOLP4BuIdcUwIYww4wQ=;
        b=QkeN7l9YNa+hbGdJQieGCPFPFArgNeWv6mW2wjmHmuKc1e/m4WpgVAAF9/jOQ5RR3/
         CWgcGFtEJ1gPx6qj7l9nkawdikCPGyhmQulfgWufKOAwMeNyCGroMhfNbBG0HMlwutbm
         HoyTgi3RdxZay+yASFEHW8N2PPA3BMjW9XGOy0iDj1zG3ZfoIwVYEg9xT84eAeWl8hl2
         dvzg6EfrJCDwQeCeBBL8n/mE8wJ/lO1rjTEUliU8yKkdGfSV/q2MsVYONbmIloGVHC/E
         MEiDPyMXBwqZJKYwPtxJk0JRTcXriS17+UUtYKnunxS8QjAMY4n0qPDUxo7xBulBlTHr
         F+Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVRYMpen570ykqSfvmL+AL4xXIEA1lYq9bMUZfK/n1vEzdip1EfEQkWJZ0CSFsyXahAXcCGYrw5qFGnSV6oBo6qgR0bkAafh3pwRD5QhdL3dZ0=
X-Gm-Message-State: AOJu0Yw5V0+7PdQimZchR2qQ271P01xeck0Cm1NQ5nid837s+M4UzUa7
	o9aykXBi7q9Q8lVT5mgtpCS5OcN9xJZcpIBbRpXPaHx2UzFXTOw6I0LHaJWt2sQ=
X-Google-Smtp-Source: AGHT+IFwdsXDX9nV84DaEReM9mCQuTf41DFFAGNDMQCJPBSgCBroHrE6WkRcbnx6TaEmBS/QxstGjQ==
X-Received: by 2002:a2e:7803:0:b0:2e9:77ec:58eb with SMTP id 38308e7fff4ca-2eadce378c4mr14750241fa.17.1717747608691;
        Fri, 07 Jun 2024 01:06:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7e4b:b0d3:6a34:6404? ([2a01:e0a:982:cbb0:7e4b:b0d3:6a34:6404])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421580fe366sm79507285e9.7.2024.06.07.01.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 01:06:48 -0700 (PDT)
Message-ID: <a8312367-7baa-4969-a98f-cb9829cc42ea@linaro.org>
Date: Fri, 7 Jun 2024 10:06:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: meson: add initial support for Dreambox
 One/Two
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240606094513.3949323-1-christianshewitt@gmail.com>
 <20240606094513.3949323-3-christianshewitt@gmail.com>
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
In-Reply-To: <20240606094513.3949323-3-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_010655_307110_8CC1D2D3 
X-CRM114-Status: GOOD (  16.13  )
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

On 06/06/2024 11:45, Christian Hewitt wrote:
> Dreambox One and Dreambox Two are based on the Amlogic W400 reference
> board with an S922X chip and the following specs:
> 
> - 2GB DDR3 RAM
> - 16GB eMMC
> - 10/100/1000 Base-T Ethernet
> - AP6356 Wireless (802.11 b/g/n/ac, BT 5.0)
> - HDMI 2.1 video
> - S/PDIF optical output
> - 2x DVB-S2/T2
> - Smartcard Reader Slot
> - 2x USB 2.0 port (1x micro-USB for service)
> - 1x USB 3.0 port
> - IR receiver
> - 1x Power LED (blue)
> - 1x Power button (top)
> - 1x Update/Reset button (underside)
> - 1x micro SD card slot
> 
> Dreambox Two differences:
> 
> - 3" Colour LCD display (MIPI-DSI)
> - Common Interface Slot
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile          |   2 +
>   .../dts/amlogic/meson-g12b-dreambox-one.dts   |  17 ++
>   .../dts/amlogic/meson-g12b-dreambox-two.dts   |  20 +++
>   .../boot/dts/amlogic/meson-g12b-dreambox.dtsi | 159 ++++++++++++++++++
>   4 files changed, 198 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dts
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dts
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 0746e01b5853..4addcae2c54e 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -21,6 +21,8 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-ts050.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-cm4io.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-mnt-reform2.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-dreambox-one.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-dreambox-two.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gsking-x.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking-pro.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dts
> new file mode 100644
> index 000000000000..ecfa1c683dde
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2019 Christian Hewitt <christianshewitt@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-g12b-dreambox.dtsi"
> +
> +/ {
> +	compatible = "dream,dreambox-one", "amlogic,s922x", "amlogic,g12b";
> +	model = "Dreambox One";
> +};
> +
> +&sd_emmc_a {
> +	sd-uhs-sdr12;
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dts
> new file mode 100644
> index 000000000000..df0d71983c3d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dts
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2019 Christian Hewitt <christianshewitt@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-g12b-dreambox.dtsi"
> +
> +/ {
> +	compatible = "dream,dreambox-two", "amlogic,s922x", "amlogic,g12b";
> +	model = "Dreambox Two";
> +};
> +
> +&sd_emmc_a {
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi
> new file mode 100644
> index 000000000000..a302b127f32a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi
> @@ -0,0 +1,159 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2021 Christian Hewitt <christianshewitt@gmail.com>
> + */
> +
> +#include "meson-g12b-w400.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
> +
> +/ {
> +	cvbs-connector {
> +		status = "disabled";
> +	};
> +
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&gpio GPIOA_11 GPIO_ACTIVE_LOW>;
> +		clocks = <&wifi32k>;
> +		clock-names = "ext_clock";
> +	};
> +
> +	spdif_dit: audio-codec-1 {
> +		#sound-dai-cells = <0>;
> +		compatible = "linux,spdif-dit";
> +		status = "okay";
> +		sound-name-prefix = "DIT";
> +	};
> +
> +	sound {
> +		compatible = "amlogic,axg-sound-card";
> +		model = "DREAMBOX";
> +		audio-aux-devs = <&tdmout_b>;
> +		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
> +				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
> +				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
> +				"TDM_B Playback", "TDMOUT_B OUT",
> +				"SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
> +				"SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
> +				"SPDIFOUT_A IN 2", "FRDDR_C OUT 3";
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
> +				sound-dai = <&spdif_dit>;
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
> +&clkc_audio {
> +	assigned-clocks = <&clkc CLKID_MPLL2>,
> +			  <&clkc CLKID_MPLL0>,
> +			  <&clkc CLKID_MPLL1>;
> +	assigned-clock-parents = <0>, <0>, <0>;
> +	assigned-clock-rates = <294912000>,
> +			       <270950400>,
> +			       <393216000>;
> +
> +	status = "okay";
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
> +&ir {
> +	linux,rc-map-name = "rc-dreambox";
> +};
> +
> +&saradc {
> +	status = "okay";
> +	vref-supply = <&vddao_1v8>;
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
