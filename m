Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69910C43334
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Jul 2022 07:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z1S4msYqckvVOJ9rWh/zty6JW84ypjAQNfrCg0CPYAo=; b=0OggGhBoIczDai
	2ADVmt5nZvjn25j3PXWaxy7LKv6ArNFL3LbQAJqrG4HNDO163vhWJ3xwEqbP8nD/40nQyDougSyYw
	P5pEGzFjr8w2dz4j6MH5poK5UoeLask7m0Pn3iHBIe8zEqnaBrOM/CvdWOnsB8USV8Ss6yeXv3MOX
	lvmzPmIk+fWEa5f/84Wrtu1jVNVR1mINJuPl8lCQgDg8NricNwNk9sqDhSh4ISgeUZQMqfMCSEs5g
	HIqRwX0slHvHWZ/uIaGqbVpFI36N95S/jXWgN3JXBGSBT2Cyfnn85fyT1PbnpCUkjktUyRv85dVS+
	R33d4WzbWFmPsr4t6PsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDLdV-00Ba7K-Ns; Mon, 18 Jul 2022 07:57:49 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDLdS-00Ba5V-UU
	for linux-amlogic@lists.infradead.org; Mon, 18 Jul 2022 07:57:48 +0000
Received: by mail-wr1-x436.google.com with SMTP id n12so2974951wrc.8
        for <linux-amlogic@lists.infradead.org>; Mon, 18 Jul 2022 00:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=vEslTCITyimnIbsqLplwjM+NWGFZaT0Hs7X96p81Hkw=;
        b=7RsWumKS/cfYmyRJ4MP3H3gJCDxUZGilhTzh5mFgx2JHv7QQSCOVAoF11HW/UZceyh
         m6TYGjxr/YHwiRCtHvbmEDUO4eqF9SSsjkaP8fiJl0YmP8UU6+l3xLbT0X9UARxcoyRX
         8nqsGx6f0bBGyTgCMbHxPmz+k0A3V7hDKsyjvskTk2KWIMyYbRtniOxmFhvUAVZGWCPa
         3XkWspTkyyfp3FImy7eJ4Ch/xO9+sU0fLLuspGM9oyw+iLig/BpNIBDfNVpnYNnMiq2g
         uoA6LS206TFe5Hun/lOQb9cgEJoj9qoAn5A/qkUkNvnlsOdn0DZflOze/JkimIyev7U4
         3ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=vEslTCITyimnIbsqLplwjM+NWGFZaT0Hs7X96p81Hkw=;
        b=REIaMIAZpHIUBVkl4qXQVtKJFQ45A2yDJbtCE58BshiTW6la3sEAd8/r7BehYc0hrc
         UcePdEvt0IWYPKNWhUhveMADvkMDbeo/EqtVqUnHqHWRXGtPPuxiPIch9KaOrOeKGafE
         6qOLH0XO7CXSxoVp6y2B7FUpFVN6tOb46aaUMmZdbodYylYjshZ3k6YIs6tpJAJ0F99L
         l6JYpm5cVPZpy0IYynPVaM7CSAluDETjPLd2l0B2lmafrnWOIHx4kwV7rs0tQCFezptg
         EZvrybI9UeuL5dKReLTkU9V+xAV0JYiyesQBjYpc9l/3U+BamMghRJajTNBN2F3COTrz
         5GNQ==
X-Gm-Message-State: AJIora+slNI4bKujAOrKO61v3ei4zfNybBvEmsN6BVuEkjgKGuM31Akl
	PSyzUlUebGTWIwWG6H/+dz4MRw==
X-Google-Smtp-Source: AGRyM1t29nFzQjLeYWvn0zyBdJryjDXStwGg7Go31PP+MzU2+XxCaU1TQoV6XTBGcA6KsPOOyHfHDw==
X-Received: by 2002:a5d:5985:0:b0:21d:b6b6:4434 with SMTP id n5-20020a5d5985000000b0021db6b64434mr21345760wri.111.1658131063310;
        Mon, 18 Jul 2022 00:57:43 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:a2b7:375c:fabd:3626? ([2001:861:44c0:66c0:a2b7:375c:fabd:3626])
        by smtp.gmail.com with ESMTPSA id a7-20020adfeec7000000b0021d7050ace4sm5040248wrp.77.2022.07.18.00.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 00:57:42 -0700 (PDT)
Message-ID: <2280fc46-cd0a-6267-ad0f-9916bd0ea146@baylibre.com>
Date: Mon, 18 Jul 2022 09:57:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] arm64: dts: meson: add support for Beelink GT1
 Ultimate
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Furkan Kardame <furkan@fkardame.com>
References: <20220707093954.21716-1-christianshewitt@gmail.com>
 <20220707093954.21716-2-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220707093954.21716-2-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_005747_016048_3578EECF 
X-CRM114-Status: GOOD (  18.49  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 07/07/2022 11:39, Christian Hewitt wrote:
> The Beelink GT1 Ultimate is based on the Amlogic S912 (Q200)
> reference design with the following specifications:
> 
> - 3GB DDR3 RAM
> - 32GB eMMC
> - HDMI 2.1 video
> - S/PDIF optical output
> - 10/100/1000 Ethernet
> - AP6356S Wireless (802.11 a/b/g/n, BT 4.2)
> - 3x USB 2.0 ports
> - IR receiver
> - 1x micro SD card slot
> - 1x Power LED (white)
> - 1x Reset button (internal)
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>   .../dts/amlogic/meson-gxm-gt1-ultimate.dts    | 91 +++++++++++++++++++
>   2 files changed, 92 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 8773211df50e..641399fcbdd9 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -43,6 +43,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc-v2.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxm-gt1-ultimate.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-mecool-kiii-pro.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-minix-neo-u9h.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dts
> new file mode 100644
> index 000000000000..2c267884cc16
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dts
> @@ -0,0 +1,91 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) Christian Hewitt <christianshewitt@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-gxm.dtsi"
> +#include "meson-gx-p23x-q20x.dtsi"
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	compatible = "azw,gt1-ultimate", "amlogic,s912", "amlogic,meson-gxm";
> +	model = "Beelink GT1 Ultimate";
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-white {
> +			color = <LED_COLOR_ID_WHITE>;
> +			function = LED_FUNCTION_POWER;
> +			gpios = <&gpio_ao GPIOAO_9 GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
> +			panic-indicator;
> +		};
> +	};
> +
> +	adc-keys {
> +		compatible = "adc-keys";
> +		io-channels = <&saradc 0>;
> +		io-channel-names = "buttons";
> +		keyup-threshold-microvolt = <1710000>;
> +
> +		button-function {
> +			label = "update";
> +			linux,code = <KEY_VENDOR>;
> +			press-threshold-microvolt = <10000>;
> +		};
> +	};
> +};
> +
> +&ethmac {
> +	pinctrl-0 = <&eth_pins>;
> +	pinctrl-names = "default";
> +	phy-handle = <&external_phy>;
> +	amlogic,tx-delay-ns = <2>;
> +	phy-mode = "rgmii";
> +};
> +
> +&external_mdio {
> +	external_phy: ethernet-phy@0 {
> +		/* Realtek RTL8211F (0x001cc916) */
> +		reg = <0>;
> +		max-speed = <1000>;
> +
> +		reset-assert-us = <10000>;
> +		reset-deassert-us = <80000>;
> +		reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
> +
> +		interrupt-parent = <&gpio_intc>;
> +		/* MAC_INTR on GPIOZ_15 */
> +		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
> +&ir {
> +	linux,rc-map-name = "rc-beelink-gs1";
> +};
> +
> +&sd_emmc_a {
> +	brcmf: wifi@1 {
> +		reg = <1>;
> +		compatible = "brcm,bcm4329-fmac";
> +	};
> +};
> +
> +&uart_A {
> +	status = "okay";
> +	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> +	pinctrl-names = "default";
> +	uart-has-rtscts;
> +
> +	bluetooth {
> +		compatible = "brcm,bcm43438-bt";
> +		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
> +		max-speed = <2000000>;
> +		clocks = <&wifi32k>;
> +		clock-names = "lpo";
> +	};
> +};


Looks fine for me:
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
