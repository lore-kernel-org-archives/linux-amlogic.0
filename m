Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37567C4345F
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2024 13:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oz7/M9fOmGzM9fV6UVrtSqKdE2fYMbCCK/XfO9uiQcU=; b=EQLUZ0jyBqdzAT5vlchReZXVHY
	JrhPNkZLVU2Qw0/vYAEjhoeUDLPBhDTKc3209VGCi+57G2yetd41/k8W5SwBpUTpgRtcxG51MWhA2
	kqtSQLsNpX9dkItoVR6lZYfsUrN+JmQBG6cTQ7kFbF7bPixfj3arrQFhFBXYLlG8ADm2cMd2XLCBy
	PyXWwTSrW333nEX4ALLHE05o/xdEhEpp1z71OKQIj6Ggq6RqRbLz2e8LabnyJBDTzYkVHKJYqFEgk
	Fq5DG6HoZYLBkIaHa8U3OARdNK5TJKsb5NAMey8b3lpfo4ZPDeGyDNA1ofAOIeuP+gph2AMcA/3eQ
	zZqlfA+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvGej-0000000HEyw-2tez;
	Fri, 12 Apr 2024 13:09:25 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvGef-0000000HEwd-3wGO
	for linux-amlogic@lists.infradead.org;
	Fri, 12 Apr 2024 13:09:23 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-417f81ef467so5347535e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2024 06:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712927360; x=1713532160; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mV7BMke1UIa5mb95gKPd8HhIzp2MCcM69xRq4po3gY=;
        b=Jr7t+Oi1UeCvNydEt8/lu1uAWy18Bk3jJuTSU9Lr4VR8aqCUOitx+OPcRnXkxMfUId
         55VMXZeSqDPJv/utRtKrZUbeIGeDnQLiButqVAGaamkbmPm60gFQvPpcDDOOZ7IWX1Cl
         1MYtNmqTcBhwSA61QyBTpajte/qriekfPNXvzwksIrGPUQnkAUbRYNEuH63JW+0tdpzb
         1lq7Af/33O/YT+f7yJw38sPPLNvJN0zf9xIqoeUcysR6HVZBVdGuTZqU9QMgWBpe+nqA
         ak0jiCfaPrFPh+FYHqqV6VdMIfjqDCwM+HzlBYPOjDkTS+e8GE9L46Y8WL2Gjku69Tp0
         hHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712927360; x=1713532160;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/mV7BMke1UIa5mb95gKPd8HhIzp2MCcM69xRq4po3gY=;
        b=o/POidC7p8tvQr7XrhbC83wth8pyL/CcksMcxPoiMBCkmjd1UNx30zl3liUn3OOoml
         nlkjsZNNj+34MWbjNaOq1CCuZniKYkMHfb6ovea2cATCwUlxT/2KbiRQ7fbu/wDQNOfG
         C/e+It7qZ+h8YBibWL7fNGSmUzhiQSRFY4touIjsqkB946HaUGlEP2XfLbSRwLwojyIv
         27NcsX4t5FGUlJ0oYNmaRReGpYnNPC6Ovnw0c6a2J4Aik8nmiWKNW+sWpHvnaUhBZaew
         JX6jSoTIFc2VQZJOm0Rh8i2Dty941xx10Wiq4AhbyA30cOh7/rCDehq05sIzL2zssGxH
         dLTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdFdCzSz30+hweZeUcTGdzC2ycM6Sd3LuI4gDyLjagkxzV3AxRXbnfwV1E6Oco06gBC3eKO93QdHDfhOWl00DeHzyZgylk1p8qep/yNS73DLc=
X-Gm-Message-State: AOJu0Yyci374vFy/0WLuYghBamQZRhdDDANvUpAkbc4CeQpMhmOeUOg8
	JrzIkP6jdw9e80+U9hfRuBob9ZFVuhr+bRbH+j8Bqlze/6vTuQxDXwB5tUbcfQM=
X-Google-Smtp-Source: AGHT+IEAyK9cKqRWpSgxfI0K1PfDcNfIPSuyV7Xa16+5eyFSd02DJFnbu/C6yLCsxNJauPE0X8SWWg==
X-Received: by 2002:a05:600c:1f93:b0:416:bc18:2a00 with SMTP id je19-20020a05600c1f9300b00416bc182a00mr1973759wmb.38.1712927359295;
        Fri, 12 Apr 2024 06:09:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:986c:54c:12ce:a121? ([2a01:e0a:982:cbb0:986c:54c:12ce:a121])
        by smtp.gmail.com with ESMTPSA id j24-20020a05600c1c1800b0041643c9cb0dsm8907068wms.42.2024.04.12.06.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Apr 2024 06:09:18 -0700 (PDT)
Message-ID: <ea89f2c5-c9da-46d8-b431-5fc83b1a1738@linaro.org>
Date: Fri, 12 Apr 2024 15:09:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 5/5] arm64: dts: add support for A5 based Amlogic AV400
To: xianwei.zhao@amlogic.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-serial@vger.kernel.org
References: <20240401-basic_dt-v3-0-cb29ae1c16da@amlogic.com>
 <20240401-basic_dt-v3-5-cb29ae1c16da@amlogic.com>
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
In-Reply-To: <20240401-basic_dt-v3-5-cb29ae1c16da@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_060922_125750_17962F32 
X-CRM114-Status: GOOD (  18.32  )
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

On 01/04/2024 12:10, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Amlogic A5 is an application processor designed for smart audio
> and IoT applications.
> 
> Add basic support for the A5 based Amlogic AV400 board, which describes
> the following components: CPU, GIC, IRQ, Timer and UART.
> These are capable of booting up into the serial console.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile               |  1 +
>   .../boot/dts/amlogic/amlogic-a5-a113x2-av400.dts   | 42 ++++++++++++++++++++++
>   arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 40 +++++++++++++++++++++
>   3 files changed, 83 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 9a50ec11bb8d..154c9efb26e4 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -1,5 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   dtb-$(CONFIG_ARCH_MESON) += amlogic-a4-a113l2-ba400.dtb
> +dtb-$(CONFIG_ARCH_MESON) += amlogic-a5-a113x2-av400.dtb
>   dtb-$(CONFIG_ARCH_MESON) += amlogic-c3-c302x-aw409.dtb
>   dtb-$(CONFIG_ARCH_MESON) += amlogic-t7-a311d2-an400.dtb
>   dtb-$(CONFIG_ARCH_MESON) += amlogic-t7-a311d2-khadas-vim4.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5-a113x2-av400.dts b/arch/arm64/boot/dts/amlogic/amlogic-a5-a113x2-av400.dts
> new file mode 100644
> index 000000000000..11d8b88c1ce5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a5-a113x2-av400.dts
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "amlogic-a5.dtsi"
> +
> +/ {
> +	model = "Amlogic A113X2 av400 Development Board";
> +	compatible = "amlogic,av400", "amlogic,a5";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		serial0 = &uart_b;
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x0 0x0 0x40000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* 10 MiB reserved for ARM Trusted Firmware */
> +		secmon_reserved: secmon@5000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0x05000000 0x0 0xa00000>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +&uart_b {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
> new file mode 100644
> index 000000000000..43f68a7da2f7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
> @@ -0,0 +1,40 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> + */
> +
> +#include "amlogic-a4-common.dtsi"
> +/ {
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x0 0x0>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu1: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x0 0x100>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu2: cpu@200 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x0 0x200>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu3: cpu@300 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x0 0x300>;
> +			enable-method = "psci";
> +		};
> +	};
> +};
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
