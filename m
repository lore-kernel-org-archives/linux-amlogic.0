Return-Path: <SRS0=lUps=HM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CEBC433DB
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Feb 2021 08:12:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96EB864DD8
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Feb 2021 08:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96EB864DD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jv/M4IQULYN6NtHDQvp7WeilBLJWxMIJdAaE1nMwGUg=; b=fPkl0ZBeKobQbXk5mg4dsQKdq+
	Xc5KGJpxmPiHAHd3nw3fyDlqQjT40v7Y7S1Pl410zByCb/Goy+ns2NSRATku9XCiXu/GbKR1ZQaek
	KjXs4SGtQk8AUhjiFSFby8/3C+H1W/UoS017IvbD4Mu3outCTAo5c9YcoIZZ8rylBMop4a/pdEfA1
	ndFaanKWBlh69qS2SwwsmrR+SVvjvaSU6BnSF0nlUMTWoKH0MfclcS47mVC/eX1RlCX6O8YV4f8Sr
	CdPxc1eMepx8gnJdGfLVNd0Ffu2zK1/f9gOG251DLYAhErb5h5EvIYqIU2KNir+YCx5qdUHQJXpm5
	wzfdU8JA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9kbY-0002HE-VS; Wed, 10 Feb 2021 08:12:09 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9kbV-0002Fq-DL
 for linux-amlogic@lists.infradead.org; Wed, 10 Feb 2021 08:12:06 +0000
Received: by mail-wm1-x332.google.com with SMTP id j21so1046491wmj.0
 for <linux-amlogic@lists.infradead.org>; Wed, 10 Feb 2021 00:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A9US22jrA5hZzbGcN6O/Yi1EA8ioR21bQjPEQ1IuBAc=;
 b=Ov3fVcUfe1VNVoTr47vHxDZyI3HO1mFcdpgc9OxfUi0f3Z7+YLrZ9jAYUsEDZ6L+gX
 VF+nqXyRRMQVxl1hyjbwW+xAQdVlcnINSz2MbC23S9BFS8PaT4jWAu21/eNE9vR7+zG6
 zLizMQt1RovMN0h2eCtnXDvLcXdE1KPKacdzR0a5Ta506qRPooAYkx9R5LDgjLUtgAM0
 RWb2RE4AKHZT57nXOLKrOMqeNW+Fwpc2ZCJUH66v7jPljKyrl25gDYA0hvZcpaGpUl3T
 xFisP2JF2ilopPIYFWqbZSMXVUUwNzFA/A3D3BccXvhGpa7Aoo4LwsdxO7VEXotiK9MZ
 5MLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=A9US22jrA5hZzbGcN6O/Yi1EA8ioR21bQjPEQ1IuBAc=;
 b=lAHDL5SOYIvk+mZir00+ykJQifu98jy42hxXmSLxhBjBw35IK3xfymhSswx09Uu+mg
 +DEXN8x7mIqkInLUwFBNYJQ6ZJo+GXJSfv0b/IT2akCQU8kRqcbIa90d3QhI/np8UERx
 OX8hihkS/Xqtk1CP4SML6ecQNxztT+PLtwsLwPDtIwdIOovfuAIGD2uzpDOMoNvM4TYQ
 GGbdrUK3PLP+e1fPHXVikxM5uQ6ms6hdu/b85+D3bnImFpdrMTQf0s21E8bmmvZolHH6
 SFbabaLwpUGulVQn1U7RobTRDvmjVDyL0T76h5lzviXd65qgXusJ4K1QMZOamdAR8jIO
 PCXg==
X-Gm-Message-State: AOAM5331/8Q7Ys8yVcczYAfVw69nCm7+FgD9K8noVcw6ZNKSH0eJCep+
 oQm+wkfhTDWaOSV0ZNMt5RsS4A==
X-Google-Smtp-Source: ABdhPJwVJAszhc/t2BZag/R6A0nwR2CHLj5C7N8POLNEtDLba8rIKQSnu/tnDMoy2dv4IwLMLaeGWw==
X-Received: by 2002:a1c:dd55:: with SMTP id u82mr1809135wmg.135.1612944694343; 
 Wed, 10 Feb 2021 00:11:34 -0800 (PST)
Received: from ?IPv6:2a01:e0a:90c:e290:d403:f5fa:8912:cba5?
 ([2a01:e0a:90c:e290:d403:f5fa:8912:cba5])
 by smtp.gmail.com with ESMTPSA id f2sm1800913wrt.7.2021.02.10.00.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 00:11:33 -0800 (PST)
Subject: Re: [PATCH 2/2] arm64: dts: meson: add initial device-tree for Minix
 NEO U9-H
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210201210508.1528-1-christianshewitt@gmail.com>
 <20210201210508.1528-2-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <35942a39-517a-2437-8f53-f885d7f6d274@baylibre.com>
Date: Wed, 10 Feb 2021 09:11:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210201210508.1528-2-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_031205_510223_B7CA636D 
X-CRM114-Status: GOOD (  20.51  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 01/02/2021 22:05, Christian Hewitt wrote:
> Minix NEO U9-H is based on the Amlogic Q200 reference board with an
> S912-H chip and the following specs:
> 
> - 2GB DDR3 RAM
> - 16GB eMMC
> - 10/100/1000 Base-T Ethernet
> - AP6356S Wireless (802.11 a/b/g/n/ac, BT 4.1)
> - RTC chip
> - HDMI 2.1 video
> - S/PDIF optical output
> - ES8323 audio codec
> - Analogue headphone output
> - 3x USB 2.0 ports (1x OTG)
> - IR receiver
> - 1x Power LED (white)
> - 1x Power button (rear)
> - 1x Update/Reset button (underside)
> - 1x micro SD card slot
> 
> Tested-by: Wes Bradley <komplex@live.ie>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>  .../dts/amlogic/meson-gxm-minix-neo-u9h.dts   | 120 ++++++++++++++++++
>  2 files changed, 121 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index dce41cd3f347..46e67de3d6d2 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -38,6 +38,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-p281.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-tx3-mini.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-libretech-pc.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxm-minix-neo-u9h.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-nexbox-a1.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q200.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q201.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts
> new file mode 100644
> index 000000000000..a414cd39c2b1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts
> @@ -0,0 +1,120 @@
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
> +	compatible = "minix,neo-u9h", "amlogic,s912", "amlogic,meson-gxm";
> +	model = "Minix Neo U9-H";
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		white {
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
> +
> +	gpio-keys-polled {
> +		compatible = "gpio-keys-polled";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		poll-interval = <100>;
> +
> +		button@0 {
> +			label = "power";
> +			linux,code = <KEY_POWER>;
> +			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
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
> +	linux,rc-map-name = "rc-minix-neo";
> +};
> +
> +&i2c_B {
> +	status = "okay";
> +	pinctrl-0 = <&i2c_b_pins>;
> +	pinctrl-names = "default";
> +
> +	rtc: rtc@51 {
> +		status = "okay";
> +		compatible = "haoyu,hym8563";
> +		reg = <0x51>;
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		clock-output-names = "xin32k";
> +		wakeup-source;
> +	};
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
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
