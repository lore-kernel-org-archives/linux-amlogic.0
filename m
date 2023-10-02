Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E121AE748F8
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Oct 2023 16:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLTgbj6HduOHs8cMyGRITdfQh3QAQ1vwrjPOkAJOI8w=; b=B3uQzfSqd5jgCtLDl7bK02dEVf
	omO3QzJ3GRQbNsUi7sYwm8eaPOAsEX9OSj1H2/e+v6zg4XbUcNaPsgjX8chOmnUDG7O2c+VVL70Sp
	ifCySMmZWZCY3FCs0h030vPhRzY2nB5LijAbgYGZ0m2XqzcT0AIGYgv0CemByBU0dk87WzekwwpyZ
	L/EpUOMzw8Zzv+oRMpU8ZKVqh7BMZ0wmeQIQe5zk/y51blSc2rzbSdbCG1bhC8t8Bfsgx5q9l6jIC
	EFyXXDtTkh9rBVlPT+neumVqGMjXIMj4pEQM3cv0bmVnz/YMAUak8Owt94PnSGNxwe+gdpKsvXxQ4
	++5VYClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnM3W-00D5mn-2w;
	Mon, 02 Oct 2023 16:46:02 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnM3T-00D5mU-0s
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Oct 2023 16:46:02 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so16181949f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Oct 2023 09:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696265156; x=1696869956; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzMODQs5idBTm5+46AjU4kUTFjR2RHxfMye72I0Y4O4=;
        b=YWW0BtYpgxReRCelP4Dmn+qr7PC7MtZpaLX4jsjHxOPzDdzuN+7lIUzXuwnktoytPE
         RODPMDFcZ0QrK0XDhPWGXzqfBN1OwJJifSpjhZVxIHQfaA9texsvFCMTbnA0+GJbRXWp
         Cut3XiGc88czXfhej6huEBBS3zwMtGdGjP4gJ1yExjaX7vVUQXc5BX0gS+a4WygVfVSC
         Hyw2PluuY4KejTLQzO39+iXXppwHM1IQvW05OQTiaSwAK676LruU4wqbRk9+XMX5q4m7
         Sz9rkzTVF289fow4R2M+U2ruICWzwNQgMWPaMuEtm8HUbdSKtw1Y27HQSIv5Sczbmf1r
         kEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696265156; x=1696869956;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TzMODQs5idBTm5+46AjU4kUTFjR2RHxfMye72I0Y4O4=;
        b=iewOFQ/qduuMA+2ZTgcSvG0BPwPl+g4zmim6l0MkWgUQb3LVMaXwSlaT+YkbdHUwtc
         QwAg8jB0GWzwn5vhODipqfDAIoNDtDJpv8lFo+XdKVE/8gdJ1TKa5hmlFBLXqu2uWUS2
         /J7XrvH3NaqgmWg/c+zKfei56PlO7MWbJGFGCaTlIGpjF0EnOFoa9s8Ho2YvuX0pZSA1
         /PPXb8PxhyDcmnkApIeTYJVyMTp2Gtd7FT50v/tzrGjCrr7jkUOq+k514DE2Y99sbkKj
         h5XpVMTCJbpWzfrNXolJRmO77aXQoXywDPwZwpq0QuIHCzTc48byH2+4nG+scDIbxmlU
         qZmQ==
X-Gm-Message-State: AOJu0YwN+27FHb5mTfBSDRRZxhBVqrFi6fMqSh1JJRqM4KNdkW+XeHRY
	1KBbTqYZxlhNWzpVaZZ0fkYvlg==
X-Google-Smtp-Source: AGHT+IHtbmGszyzAxfVHrr27EFBaRxcitG/MWhfcc1mV9MoVulVPh6rDsH4xjB3VXqs96M7kGtL/PQ==
X-Received: by 2002:a5d:568e:0:b0:321:5d9f:2d9f with SMTP id f14-20020a5d568e000000b003215d9f2d9fmr10194430wrv.47.1696265155996;
        Mon, 02 Oct 2023 09:45:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8861:9b54:432d:d4f5? ([2a01:e0a:982:cbb0:8861:9b54:432d:d4f5])
        by smtp.gmail.com with ESMTPSA id x11-20020a5d650b000000b00318147fd2d3sm28451720wru.41.2023.10.02.09.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 09:45:55 -0700 (PDT)
Message-ID: <b81a296d-0640-4b2e-aab6-c9de37d10206@linaro.org>
Date: Mon, 2 Oct 2023 18:45:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add libretech cottonwood support
Content-Language: en-US, fr
To: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Da Xue <da.xue@libretech.co>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <20231002141020.2403652-1-jbrunet@baylibre.com>
 <20231002141020.2403652-3-jbrunet@baylibre.com>
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
In-Reply-To: <20231002141020.2403652-3-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_094559_342265_3266517D 
X-CRM114-Status: GOOD (  17.68  )
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

On 02/10/2023 16:10, Jerome Brunet wrote:
> Add support for the Libretech cottonwood board family.
> These 2 boards are based on the same PCB, with an RPi B form factor.
> 
> The "Alta" board uses an a311d while the "Solitude" variant uses an s905d3.
> 
> Co-developed-by: Da Xue <da.xue@libretech.co>
> Signed-off-by: Da Xue <da.xue@libretech.co>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile          |   2 +
>   .../amlogic/meson-g12b-a311d-libretech-cc.dts | 133 ++++
>   .../amlogic/meson-libretech-cottonwood.dtsi   | 610 ++++++++++++++++++
>   .../amlogic/meson-sm1-s905d3-libretech-cc.dts |  89 +++
>   4 files changed, 834 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 4ce401d17b63..cc8b34bd583d 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-cm4io.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gsking-x.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking-pro.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-libretech-cc.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-go-ultra.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2-plus.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
> @@ -73,6 +74,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-bananapi-m2-pro.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-bananapi-m5.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-h96-max.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-khadas-vim3l.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-sm1-s905d3-libretech-cc.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-c4.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-hc4.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
> new file mode 100644
> index 000000000000..fc890e235dbd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
> @@ -0,0 +1,133 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2023 BayLibre, SAS.
> + * Author: Jerome Brunet <jbrunet@baylibre.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/clock/g12a-clkc.h>
> +#include "meson-g12b-a311d.dtsi"
> +#include "meson-libretech-cottonwood.dtsi"
> +
> +/ {
> +	compatible = "libretech,aml-a311d-cc", "amlogic,a311d", "amlogic,g12b";
> +	model = "Libre Computer AML-A311D-CC Alta";
> +
> +	vddcpu_a: regulator-vddcpu-a {
> +		compatible = "pwm-regulator";
> +		regulator-name = "VDDCPU_A";
> +		regulator-min-microvolt = <730000>;
> +		regulator-max-microvolt = <1011000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		pwm-supply = <&dc_in>;
> +		pwms = <&pwm_ab 0 1250 0>;
> +		pwm-dutycycle-range = <100 0>;
> +	};
> +
> +	sound {
> +		model = "Alta";

I think those sound model properties should be coherent with the
other Libre Computer boards:
arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi:         model = "LIBRETECH-PC";
arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts:           model = "LIBRETECH-AC";
arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts:                model = "LIBRETECH-CC-V2";
arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts:           model = "LIBRETECH-CC";

It's ok to change the scheme since it's tried to keep the name under the 15 characters limit,
will the next board keep this naming ?


> +		audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
> +				"TDMOUT_A IN 1", "FRDDR_B OUT 0",
> +				"TDMOUT_A IN 2", "FRDDR_C OUT 0",
> +				"TDM_A Playback", "TDMOUT_A OUT",
> +				"TDMOUT_B IN 0", "FRDDR_A OUT 1",
> +				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
> +				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
> +				"TDM_B Playback", "TDMOUT_B OUT",
> +				"TDMOUT_C IN 0", "FRDDR_A OUT 2",
> +				"TDMOUT_C IN 1", "FRDDR_B OUT 2",
> +				"TDMOUT_C IN 2", "FRDDR_C OUT 2",
> +				"TDM_C Playback", "TDMOUT_C OUT",
> +				"TDMIN_A IN 0", "TDM_A Capture",
> +				"TDMIN_B IN 0", "TDM_A Capture",
> +				"TDMIN_C IN 0", "TDM_A Capture",
> +				"TDMIN_A IN 3", "TDM_A Loopback",
> +				"TDMIN_B IN 3", "TDM_A Loopback",
> +				"TDMIN_C IN 3", "TDM_A Loopback",
> +				"TDMIN_A IN 1", "TDM_B Capture",
> +				"TDMIN_B IN 1", "TDM_B Capture",
> +				"TDMIN_C IN 1", "TDM_B Capture",
> +				"TDMIN_A IN 4", "TDM_B Loopback",
> +				"TDMIN_B IN 4", "TDM_B Loopback",
> +				"TDMIN_C IN 4", "TDM_B Loopback",
> +				"TDMIN_A IN 2", "TDM_C Capture",
> +				"TDMIN_B IN 2", "TDM_C Capture",
> +				"TDMIN_C IN 2", "TDM_C Capture",
> +				"TDMIN_A IN 5", "TDM_C Loopback",
> +				"TDMIN_B IN 5", "TDM_C Loopback",
> +				"TDMIN_C IN 5", "TDM_C Loopback",
> +				"TODDR_A IN 0", "TDMIN_A OUT",
> +				"TODDR_B IN 0", "TDMIN_A OUT",
> +				"TODDR_C IN 0", "TDMIN_A OUT",
> +				"TODDR_A IN 1", "TDMIN_B OUT",
> +				"TODDR_B IN 1", "TDMIN_B OUT",
> +				"TODDR_C IN 1", "TDMIN_B OUT",
> +				"TODDR_A IN 2", "TDMIN_C OUT",
> +				"TODDR_B IN 2", "TDMIN_C OUT",
> +				"TODDR_C IN 2", "TDMIN_C OUT",
> +				"Lineout", "ACODEC LOLP",
> +				"Lineout", "ACODEC LORP";
> +	};
> +};
> +
> +&cpu_opp_table_0 {
> +		opp-1800000000 {
> +			opp-hz = /bits/ 64 <1800000000>;
> +			opp-microvolt = <1001000>;
> +		};
> +
> +		opp-2016000000 {
> +			opp-hz = /bits/ 64 <2016000000>;
> +			opp-microvolt = <1011000>;
> +		};
> +};
> +
> +&cpu0 {
> +	cpu-supply = <&vddcpu_b>;
> +	operating-points-v2 = <&cpu_opp_table_0>;
> +	clocks = <&clkc CLKID_CPU_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu1 {
> +	cpu-supply = <&vddcpu_b>;
> +	operating-points-v2 = <&cpu_opp_table_0>;
> +	clocks = <&clkc CLKID_CPU_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu100 {
> +	cpu-supply = <&vddcpu_a>;
> +	operating-points-v2 = <&cpub_opp_table_1>;
> +	clocks = <&clkc CLKID_CPUB_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu101 {
> +	cpu-supply = <&vddcpu_a>;
> +	operating-points-v2 = <&cpub_opp_table_1>;
> +	clocks = <&clkc CLKID_CPUB_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu102 {
> +	cpu-supply = <&vddcpu_a>;
> +	operating-points-v2 = <&cpub_opp_table_1>;
> +	clocks = <&clkc CLKID_CPUB_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu103 {
> +	cpu-supply = <&vddcpu_a>;
> +	operating-points-v2 = <&cpub_opp_table_1>;
> +	clocks = <&clkc CLKID_CPUB_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&pwm_ab {
> +	pinctrl-0 = <&pwm_a_e_pins>, <&pwm_b_x7_pins>;
> +	clocks = <&xtal>, <&xtal>;
> +	clock-names = "clkin0", "clkin1";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi b/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
> new file mode 100644
> index 000000000000..a7fc8963ff54
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
> @@ -0,0 +1,610 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2023 BayLibre, SAS.
> + * Author: Jerome Brunet <jbrunet@baylibre.com>
> + */
> +
> +#include <dt-bindings/clock/g12a-clkc.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/gpio/meson-g12a-gpio.h>
> +#include <dt-bindings/sound/meson-g12a-toacodec.h>
> +#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
> +
> +/ {
> +	aliases {
> +		serial0 = &uart_AO;
> +		ethernet0 = &ethmac;
> +		spi0 = &spifc;
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x0 0x0 0x80000000>;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	dioo2133: audio-amplifier-0 {
> +		compatible = "simple-audio-amplifier";
> +		enable-gpios = <&gpio GPIOX_0 GPIO_ACTIVE_HIGH>;
> +		VCC-supply = <&vcc_5v>;
> +		sound-name-prefix = "10U2";
> +	};
> +
> +	/* TOFIX: handle CVBS_DET on SARADC channel 0 */
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
> +	leds-pwm {
> +		compatible = "pwm-leds";
> +
> +		led-green {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_STATUS;
> +			linux,default-trigger = "default-on";
> +			panic-indicator;
> +			max-brightness = <255>;
> +			pwms = <&pwm_cd 1 1250 0>;
> +			active-low;
> +		};
> +
> +		led-blue {
> +			color = <LED_COLOR_ID_BLUE>;
> +			function = LED_FUNCTION_ACTIVITY;
> +			linux,default-trigger = "activity";
> +			max-brightness = <255>;
> +			pwms = <&pwm_ab 1 1250 0>;
> +			active-low;
> +		};
> +	};
> +
> +	leds-gpio {
> +		compatible = "gpio-leds";
> +
> +		led-orange {
> +			color = <LED_COLOR_ID_AMBER>;
> +			function = LED_FUNCTION_STANDBY;
> +			gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	dc_in: regulator-dc-in {
> +		compatible = "regulator-fixed";
> +		regulator-name = "5V_IN";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	flash_1v8: regulator-flash-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "FLASH_1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +		vin-supply = <&vcc_3v3>;
> +	};
> +
> +	vcc_card: regulator-vcc-card {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_CARD";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vddao_3v3>;
> +		gpio = <&gpio GPIOX_2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		enable-active-high;
> +		gpio-open-drain;
> +	};
> +
> +	vcc_3v3: regulator-vcc-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +		vin-supply = <&vddao_3v3>;
> +
> +		/* FIXME: controlled by TEST_N */
> +	};
> +
> +	vcc_5v: regulator-vcc-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +		vin-supply = <&dc_in>;
> +		gpio = <&gpio GPIOH_8 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		enable-active-high;
> +		gpio-open-drain;
> +	};
> +
> +	vddao_3v3: regulator-vddao_3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDAO_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +		vin-supply = <&dc_in>;
> +	};
> +
> +	vddcpu_b: regulator-vddcpu-b {
> +		compatible = "pwm-regulator";
> +		regulator-name = "VDDCPU_B";
> +		regulator-min-microvolt = <730000>;
> +		regulator-max-microvolt = <1011000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		pwm-supply = <&dc_in>;
> +		pwms = <&pwm_AO_cd 1 1250 0>;
> +		pwm-dutycycle-range = <100 0>;
> +	};
> +
> +	vddio_ao18: regulator-vddio_ao18 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDIO_AO18";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +		vin-supply = <&vddao_3v3>;
> +	};
> +
> +	vddio_c: regulator-vddio_c {
> +		compatible = "regulator-gpio";
> +		regulator-name = "VDDIO_C";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-settling-time-up-us = <200>;
> +		regulator-settling-time-down-us = <50000>;
> +		vin-supply = <&vddao_3v3>;
> +		gpios = <&gpio GPIOX_4 GPIO_ACTIVE_HIGH>;
> +		states = <3300000 0>,
> +			 <1800000 1>;
> +	};
> +
> +	sound {
> +		compatible = "amlogic,axg-sound-card";
> +		audio-widgets = "Line", "Lineout";
> +		audio-aux-devs = <&tdmout_a>, <&tdmout_b>, <&tdmout_c>,
> +				 <&tdmin_a>, <&tdmin_b>, <&tdmin_c>,
> +				 <&dioo2133>;
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
> +		dai-link-3 {
> +			sound-dai = <&toddr_a>;
> +		};
> +
> +		dai-link-4 {
> +			sound-dai = <&toddr_b>;
> +		};
> +
> +		dai-link-5 {
> +			sound-dai = <&toddr_c>;
> +		};
> +
> +		/*
> +		 * Audio setup: The 40 pins header provides access to 2 TDMs,
> +		 * SPDIF In/Out and PDM inputs.
> +		 * - TDM A: 2 lanes
> +		 *    D0:    40/X9
> +		 *    D1:    38/X8
> +		 *    BCLK:  12/X11
> +		 *    FS:    35/X10
> +		 * - TDM B: 4 lanes
> +		 *    D0:    37/A3
> +		 *    D1:    16/A4
> +		 *    D2:    18/A5 or 7/AO6
> +		 *    D3:    22/A6 or 21/H5
> +		 *    BCLK:  29/A1 or 8/AO8
> +		 *    FS:    31/A2 or 11/AO7
> +		 * - 2 Master Clocks:
> +		 *    MCLK0: 15/A0 or 10/AO9
> +		 *    MCLK1: 33/X15
> +		 * - SPDIF:
> +		 *    OUT:   32/A11
> +		 *    IN:    21/H5
> +		 * - PDM Input:
> +		 *    DO:    13/A8
> +		 *    D1:    26/A9
> +		 *    D2:    22/A6
> +		 *    D3:    18/A5
> +		 *    DCLK:  36/A7
> +		 *
> +		 * TDM C is not usable on the 40 pins connector so it is
> +		 * setup for the HDMI 4 lanes i2s.
> +		 *
> +		 * No pinctrl is enabled by default to preserve the
> +		 * genericity of the 40 pins header. Many configurations are
> +		 * possible based on the desired use case. Please adjust TDM
> +		 * masks, clock setups and pinctrl accordingly.
> +		 */
> +
> +		dai-link-6 {
> +			sound-dai = <&tdmif_a>;
> +			dai-format = "dsp_a";
> +			dai-tdm-slot-tx-mask-0 = <1 1>;
> +			mclk-fs = <256>;
> +
> +			codec-0 {
> +				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_A>;
> +			};
> +
> +			codec-1 {
> +				sound-dai = <&toacodec TOACODEC_IN_A>;
> +			};
> +		};
> +
> +		dai-link-7 {
> +			sound-dai = <&tdmif_b>;
> +			dai-format = "i2s";
> +			dai-tdm-slot-tx-mask-0 = <1 1>;
> +			dai-tdm-slot-rx-mask-1 = <1 1>;
> +			mclk-fs = <256>;
> +
> +			codec-0 {
> +				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
> +			};
> +
> +			codec-1 {
> +				sound-dai = <&toacodec TOACODEC_IN_B>;
> +			};
> +		};
> +
> +		dai-link-8 {
> +			sound-dai = <&tdmif_c>;
> +			dai-format = "i2s";
> +			dai-tdm-slot-tx-mask-0 = <1 1>;
> +			dai-tdm-slot-tx-mask-1 = <1 1>;
> +			dai-tdm-slot-tx-mask-2 = <1 1>;
> +			dai-tdm-slot-tx-mask-3 = <1 1>;
> +			mclk-fs = <256>;
> +
> +			codec-0 {
> +				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_C>;
> +			};
> +
> +			codec-1 {
> +				sound-dai = <&toacodec TOACODEC_IN_C>;
> +			};
> +		};
> +
> +		dai-link-9 {
> +			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
> +
> +			codec {
> +				sound-dai = <&hdmi_tx>;
> +			};
> +		};
> +
> +		dai-link-10 {
> +			sound-dai = <&toacodec TOACODEC_OUT>;
> +
> +			codec {
> +				sound-dai = <&acodec>;
> +			};
> +		};
> +	};
> +};
> +
> +&acodec {
> +	status = "okay";
> +	AVDD-supply = <&vddio_ao18>;
> +};
> +
> +&arb {
> +	status = "okay";
> +};
> +
> +&cecb_AO {
> +	status = "okay";
> +	pinctrl-0 = <&cec_ao_b_h_pins>;
> +	pinctrl-names = "default";
> +	hdmi-phandle = <&hdmi_tx>;
> +};
> +
> +&clkc_audio {
> +	status = "okay";
> +};
> +
> +&cvbs_vdac_port {
> +	cvbs_vdac_out: endpoint {
> +		remote-endpoint = <&cvbs_connector_in>;
> +	};
> +};
> +
> +&ethmac {
> +	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>, <&eth_phy_irq_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +	phy-mode = "rgmii";
> +	phy-handle = <&external_phy>;
> +	amlogic,tx-delay-ns = <2>;
> +};
> +
> +&ext_mdio {
> +	external_phy: ethernet-phy@0 {
> +		/* Realtek RTL8211F (0x001cc916) */
> +		reg = <0>;
> +		max-speed = <1000>;
> +
> +		reset-assert-us = <100000>;
> +		reset-deassert-us = <100000>;
> +		reset-gpios = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
> +
> +		interrupt-parent = <&gpio_intc>;
> +		/* MAC_INTR on GPIOZ_14 */
> +		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
> +	};
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
> +&hdmi_tx {
> +	status = "okay";
> +	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
> +	pinctrl-names = "default";
> +	hdmi-supply = <&vcc_5v>;
> +};
> +
> +&hdmi_tx_tmds_port {
> +	hdmi_tx_tmds_out: endpoint {
> +		remote-endpoint = <&hdmi_connector_in>;
> +	};
> +};
> +
> +&ir {
> +	status = "okay";
> +	pinctrl-0 = <&remote_input_ao_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&npu {
> +	status = "okay";
> +};

Are you sure you want this enabled ?
AFAIK if etnaviv is enabled, it will be used first as a render node by mesa and fail.

> +
> +&periphs_pinctrl {
> +	spi_cs_disable_pins: spi-cs-disable {
> +		mux {
> +			groups = "BOOT_14";
> +			function = "gpio_periphs";
> +			bias-disable;
> +			output-high;
> +		};
> +	};
> +
> +	eth_phy_irq_pins: eth-phy-irq {
> +		mux {
> +			groups = "GPIOZ_14";
> +			function = "gpio_periphs";
> +			bias-pull-up;
> +			output-disable;
> +		};
> +	};
> +};
> +
> +&pwm_AO_cd {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_ao_d_e_pins>;
> +	pinctrl-names = "default";
> +	clocks = <&xtal>;
> +	clock-names = "clkin1";
> +};
> +
> +&pwm_ab {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_b_x7_pins>;
> +	pinctrl-names = "default";
> +	clocks = <&xtal>;
> +	clock-names = "clkin1";
> +};
> +
> +&pwm_cd {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_d_x3_pins>;
> +	pinctrl-names = "default";
> +	clocks = <&xtal>;
> +	clock-names = "clkin1";
> +};
> +
> +&saradc {
> +	status = "okay";
> +	vref-supply = <&vddio_ao18>;
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
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	max-frequency = <200000000>;
> +	disable-wp;
> +
> +	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
> +	vmmc-supply = <&vcc_card>;
> +	vqmmc-supply = <&vddio_c>;
> +};
> +
> +/*
> + * EMMC_D4, EMMC_D5, EMMC_D6 and EMMC_D7 pins are shared between SPI NOR CS
> + * and eMMC Data 4 to 7 pins.
> + * Replace emmc_data_8b_pins to emmc_data_4b_pins from sd_emmc_c pinctrl-0,
> + * and change bus-width to 4 then spifc can be enabled.
> + */
> +&sd_emmc_c {
> +	status = "okay";
> +	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_8b_pins>, <&emmc_ds_pins>,
> +		    <&spi_cs_disable_pins>;
> +	pinctrl-1 = <&emmc_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +
> +	bus-width = <8>;
> +	cap-mmc-highspeed;
> +	mmc-hs200-1_8v;
> +	max-frequency = <200000000>;
> +	disable-wp;
> +
> +	mmc-pwrseq = <&emmc_pwrseq>;
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&flash_1v8>;
> +};
> +
> +&spifc {
> +	status = "disabled";
> +	pinctrl-0 = <&nor_pins>;
> +	pinctrl-names = "default";
> +	cs-gpios = <&gpio BOOT_14 GPIO_ACTIVE_LOW>;
> +
> +	w25lq128d: flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		spi-max-frequency = <80000000>;
> +	};
> +};
> +
> +&tdmif_a {
> +	status = "okay";
> +};
> +
> +&tdmif_b {
> +	status = "okay";
> +};
> +
> +&tdmif_c {
> +	status = "okay";
> +};
> +
> +&tdmin_a {
> +	status = "okay";
> +};
> +
> +&tdmin_b {
> +	status = "okay";
> +};
> +
> +&tdmin_c {
> +	status = "okay";
> +};
> +
> +&tdmout_a {
> +	status = "okay";
> +};
> +
> +&tdmout_b {
> +	status = "okay";
> +};
> +
> +&tdmout_c {
> +	status = "okay";
> +};
> +
> +&toacodec {
> +	status = "okay";
> +};
> +
> +&toddr_a {
> +	status = "okay";
> +};
> +
> +&toddr_b {
> +	status = "okay";
> +};
> +
> +&toddr_c {
> +	status = "okay";
> +};
> +
> +&tohdmitx {
> +	status = "okay";
> +};
> +
> +&uart_AO {
> +	status = "okay";
> +	pinctrl-0 = <&uart_ao_a_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&usb2_phy1 {
> +	phy-supply = <&dc_in>;
> +};
> +
> +&usb3_pcie_phy {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	phy-supply = <&vcc_5v>;
> +
> +	hub: hub@1 {
> +		compatible = "usb5e3,626";
> +		reg = <1>;
> +		reset-gpios = <&gpio GPIOC_7 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
> +	};

Not sure the PHY is the right place to put the USB HUB,
and it's probable the HUB is connected to both the USB2 and USB3 lines
so you should have both USB IDs in DT like it'd done for the Odroid-C4:

/ {
...
          /* USB hub supports both USB 2.0 and USB 3.0 root hub */
          usb-hub {
                  dr_mode = "host";
                  #address-cells = <1>;
                  #size-cells = <0>;

                  /* 2.0 hub on port 1 */
                  hub_2_0: hub@1 {
                          compatible = "usb2109,2817";
                          reg = <1>;
                          peer-hub = <&hub_3_0>;
                          reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
                          vdd-supply = <&vcc_5v>;
                  };

                  /* 3.1 hub on port 4 */
                  hub_3_0: hub@2 {
                          compatible = "usb2109,817";
                          reg = <2>;
                          peer-hub = <&hub_2_0>;
                          reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
                          vdd-supply = <&vcc_5v>;
                  };
          };
...
};

if it only has a single USB ID, then it should go under the dwc3 node.

> +};
> +
> +&usb {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts
> new file mode 100644
> index 000000000000..077e7506ce4f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2023 BayLibre, SAS.
> + * Author: Jerome Brunet <jbrunet@baylibre.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/clock/g12a-clkc.h>
> +#include "meson-sm1.dtsi"
> +#include "meson-libretech-cottonwood.dtsi"
> +
> +/ {
> +	compatible = "libretech,aml-s905d3-cc", "amlogic,sm1";
> +	model = "Libre Computer AML-S905D3-CC Solitude";
> +
> +	sound {
> +		model = "Solitude";
> +		audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
> +				"TDMOUT_A IN 1", "FRDDR_B OUT 0",
> +				"TDMOUT_A IN 2", "FRDDR_C OUT 0",
> +				"TDM_A Playback", "TDMOUT_A OUT",
> +				"TDMOUT_B IN 0", "FRDDR_A OUT 1",
> +				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
> +				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
> +				"TDM_B Playback", "TDMOUT_B OUT",
> +				"TDMOUT_C IN 0", "FRDDR_A OUT 2",
> +				"TDMOUT_C IN 1", "FRDDR_B OUT 2",
> +				"TDMOUT_C IN 2", "FRDDR_C OUT 2",
> +				"TDM_C Playback", "TDMOUT_C OUT",
> +				"TDMIN_A IN 0", "TDM_A Capture",
> +				"TDMIN_B IN 0", "TDM_A Capture",
> +				"TDMIN_C IN 0", "TDM_A Capture",
> +				"TDMIN_A IN 13", "TDM_A Loopback",
> +				"TDMIN_B IN 13", "TDM_A Loopback",
> +				"TDMIN_C IN 13", "TDM_A Loopback",
> +				"TDMIN_A IN 1", "TDM_B Capture",
> +				"TDMIN_B IN 1", "TDM_B Capture",
> +				"TDMIN_C IN 1", "TDM_B Capture",
> +				"TDMIN_A IN 14", "TDM_B Loopback",
> +				"TDMIN_B IN 14", "TDM_B Loopback",
> +				"TDMIN_C IN 14", "TDM_B Loopback",
> +				"TDMIN_A IN 2", "TDM_C Capture",
> +				"TDMIN_B IN 2", "TDM_C Capture",
> +				"TDMIN_C IN 2", "TDM_C Capture",
> +				"TDMIN_A IN 15", "TDM_C Loopback",
> +				"TDMIN_B IN 15", "TDM_C Loopback",
> +				"TDMIN_C IN 15", "TDM_C Loopback",
> +				"TODDR_A IN 0", "TDMIN_A OUT",
> +				"TODDR_B IN 0", "TDMIN_A OUT",
> +				"TODDR_C IN 0", "TDMIN_A OUT",
> +				"TODDR_A IN 1", "TDMIN_B OUT",
> +				"TODDR_B IN 1", "TDMIN_B OUT",
> +				"TODDR_C IN 1", "TDMIN_B OUT",
> +				"TODDR_A IN 2", "TDMIN_C OUT",
> +				"TODDR_B IN 2", "TDMIN_C OUT",
> +				"TODDR_C IN 2", "TDMIN_C OUT",
> +				"Lineout", "ACODEC LOLP",
> +				"Lineout", "ACODEC LORP";
> +	};
> +};
> +
> +&cpu0 {
> +	cpu-supply = <&vddcpu_b>;
> +	operating-points-v2 = <&cpu_opp_table>;
> +	clocks = <&clkc CLKID_CPU_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu1 {
> +	cpu-supply = <&vddcpu_b>;
> +	operating-points-v2 = <&cpu_opp_table>;
> +	clocks = <&clkc CLKID_CPU1_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu2 {
> +	cpu-supply = <&vddcpu_b>;
> +	operating-points-v2 = <&cpu_opp_table>;
> +	clocks = <&clkc CLKID_CPU2_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu3 {
> +	cpu-supply = <&vddcpu_b>;
> +	operating-points-v2 = <&cpu_opp_table>;
> +	clocks = <&clkc CLKID_CPU3_CLK>;
> +	clock-latency = <50000>;
> +};

Apart that, it looks fine,


Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
