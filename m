Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B497C25B76
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 08:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHOMH9RhrRZo3t2LQ5hXpwik5FlR+fICAYyigPFFFi8=; b=xlw2XAzZRcNip3K0wbchv4FVKK
	ykHkAzAMQAkSSjM3Km0XhY7DFToKO28iApGSmWBax/PlGDgiiD90WdYclpYO7h85QnPZTdpTXj81N
	a9dh3G4nGF5MLjEslKTgiU5PepZHX6chxSVvudLv7YTclpfynOOeA1PFwLNU5rruFxw0jQKExOCXR
	VTAhJ4rOWKVwFHfzrvntCvEnNBJh4o+MWiEdUmNgjsXVpVZ2ZefoqCnIdWdZrR46V7o8LS7evRjz3
	j7slnsWRNLbj1YrgIpUP4DJo6zNAgd+SDNJAHpW+DU3rCXEVLDVNjXKcERjTwC0DJPt8erL98IeNc
	StIeTOHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEmHn-00000005HGR-2f07;
	Wed, 05 Jun 2024 08:46:23 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEmHk-00000005HF0-1dVL
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jun 2024 08:46:21 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-35dcd5377c4so5611674f8f.2
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2024 01:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717577175; x=1718181975; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cghILI8ZJPm9SL1zceBvs6FK9GtRFOI4Hps8zLPbyaI=;
        b=dvU7AFk6FGUMD+/+IXCq29LeFn8mDpO8lbjlKBkr7myCOyesZGjiUwwNrqWwfzupT8
         P0VEfVuZUS2yNOJyFn+zNH2JLrmf6PaCrbwZyeD+ZA4EYpU3ebvRbqRZ9Dn9JR9Q8/2A
         iT33zxq9SM7Rs0yYYhMXg07fXMx1doIKdpz8zPXsGCk9xyx5uwa7IPCNUAstfrThFInQ
         l+bLlYRt1spoT+mhg8QFYjDc4nYaaIq0Kq70+IzkBs4zgOs+wvmmKBefAE3Fs9JdowrD
         s3nsFvt8tCsqb5qC86GQ2AXeWNVXa8rvh3kN2fH1QGydin2B8u0FInFVn4CY5qlotot1
         zxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717577175; x=1718181975;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cghILI8ZJPm9SL1zceBvs6FK9GtRFOI4Hps8zLPbyaI=;
        b=lE4cfHRTJqzOF63QsXxJv3Nv3KAUssrCzw153gaCq3d+uOJfvOZSZLON/a8kK6Va40
         800d1uKunCp6Wzq/vUHUPoMtkKlqinS6IBYGe7cSzRs/A4rxZwIenlOTsShTjnBEgNGf
         YlnY7js19bL0xCrvawiXbzxyWbwJqOB8LZGHdw6G7cWdyRBhBc4upcMeu9JNrlJu3god
         iJM/x2+rk8tt5gEIRMl48iS4Xy5sA8hvgIYNZnbdb+4DzzhLKg2G3UMfLQkdaMh6Pf+M
         k82ly9P663eGzorKwWQlxSATcsCL+ZtHqnOQQ6GciumYJncGzhXFVvIXAOWgBnW4x0z9
         jPZw==
X-Forwarded-Encrypted: i=1; AJvYcCVkCv0mOvAB5wZB2xysE17/g8kCwLUZTUFIsUoVvZgTNzfXDnWHOEWZaE5jLO3BoVLrYXcRU9WE6wS+727BS9AOdPMez2GGLC4StZVLo26t28w=
X-Gm-Message-State: AOJu0YyZogCNNWBsWxfDn0iHN8LkeVHrL+oLXTlKqyuw7rxtob1zLhqQ
	wzEAc9XI0TWF1sch5CZwIndHTuesTOlAlgQgoT26i9lGSpG/68SPHYYot3RCdnk=
X-Google-Smtp-Source: AGHT+IFY5ACIs0f3ebBqrJnsM1HHTH2Jm8Tl0u6MGK+JdFZj5Lc+Q99ZElmnnfOqiOiP8idM0ErvwQ==
X-Received: by 2002:adf:e7c1:0:b0:354:f815:8b85 with SMTP id ffacd0b85a97d-35e8ef94374mr1276637f8f.67.1717577174518;
        Wed, 05 Jun 2024 01:46:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c7ce:7756:462d:a8bd? ([2a01:e0a:982:cbb0:c7ce:7756:462d:a8bd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd062edbcsm13787599f8f.84.2024.06.05.01.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 01:46:14 -0700 (PDT)
Message-ID: <c66846c6-d5d6-4d4d-98d4-ffb907521c09@linaro.org>
Date: Wed, 5 Jun 2024 10:46:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: meson: add GXLX/S905L/p271 support
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240604084134.3315841-1-christianshewitt@gmail.com>
 <20240604084134.3315841-2-christianshewitt@gmail.com>
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
In-Reply-To: <20240604084134.3315841-2-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_014620_440802_61FED8DB 
X-CRM114-Status: GOOD (  17.58  )
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

On 04/06/2024 10:41, Christian Hewitt wrote:
> Add a device-tree for the GXLX Amlogic P271 (S905L) reference design
> board. This is a low-cost design similar to P281 (S905W) but with
> silicon differences to omit VP9 and use Mali 450-MP2 (not MP3). The
> SoC is marked with S905L and "2" (believed to denote MP2) resulting
> in chip distributor stock lists and Android STB marketing sometimes
> describing it as an S905L2 chip.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> NOTE: This patch depends upon the following submitted patches for
> VDEC [0] and SARADC [1] support:
> 
> [0] https://patchwork.kernel.org/project/linux-amlogic/list/?series=858514
> [1] https://patchwork.kernel.org/project/linux-amlogic/list/?series=858525
> 
> CHECK_DTBS generates some warnings for pre-existing issues inherited
> from common dtsi files. The patch does not add any new issues.
> 
>   arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>   .../dts/amlogic/meson-gxlx-s905l-p271.dts     | 51 +++++++++++++++++++
>   2 files changed, 52 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 0f29517da5ec..0746e01b5853 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -62,6 +62,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc-v2.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxlx-s905l-p271.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-gt1-ultimate.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-mecool-kiii-pro.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts b/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts
> new file mode 100644
> index 000000000000..1221f4545130
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2024 Christian Hewitt <christianshewitt@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-gxl-s905x.dtsi"
> +#include "meson-gx-p23x-q20x.dtsi"
> +
> +/ {
> +	compatible = "amlogic,p271", "amlogic,s905l", "amlogic,meson-gxlx";
> +	model = "Amlogic Meson GXLX (S905L) P271 Development Board";
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x0 0x0 0x40000000>;
> +	};
> +
> +	sound {
> +		model = "P271";
> +	};
> +};
> +
> +&apb {
> +	mali: gpu@c0000 {
> +		/* Mali 450-MP2 */
> +		interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "gp", "gpmmu", "pp", "pmu",
> +			"pp0", "ppmmu0", "pp1", "ppmmu1";
> +	};
> +};
> +
> +&saradc {
> +	compatible = "amlogic,meson-gxlx-saradc", "amlogic,meson-saradc";
> +};
> +
> +&usb {
> +	dr_mode = "host";
> +};
> +
> +&vdec {
> +	compatible = "amlogic,gxlx-vdec", "amlogic,gx-vdec";
> +};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
