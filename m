Return-Path: <SRS0=3LcN=I4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F441C433DB
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Mar 2021 15:25:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADE41619A7
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Mar 2021 15:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADE41619A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I9s+yxGFpjtQlr13K3W+c+thy74RuyKg+EB07hvlXqk=; b=hzhaMqKoh6KSM8Q3WbvAz7JjK
	XxqGan6e+oZCaG+mk+2G8MRnisNHS6hfO5FneM48AagqNwsPGzOGDnhD5qV4kjN/EAiUiIKnd/1Ot
	lhfKawCbnws4t1H2WVUox0dP50HgF2Pzr/YA1+oOB3ANY4l0p6n5c/NWFuBpQGZZOXHx8HaVsrbiZ
	rVLP6l/0OK2z8tEgMSPoYktNf06aawzvdxX2E1kVWIe/KCabsapbNjr2iOezYX9CKAWTkIpAPmgva
	0D2Zpptl6Fxo3gYNzGy4DsL4BzeeRQwW9oUQEOmuSYanZupYlZaTjJ6vbU+cwz4++RSTrak3YDQOz
	NA74EsY/A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRGFX-004Agl-J3; Tue, 30 Mar 2021 15:25:47 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRGFM-004AaV-Ib
 for linux-amlogic@lists.infradead.org; Tue, 30 Mar 2021 15:25:41 +0000
Received: by mail-wr1-x42d.google.com with SMTP id v11so16608173wro.7
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Mar 2021 08:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ywgOpHHmJzE8c2okgAy3CgLgHwGVL/ryR1hgs5mwKRE=;
 b=I+zjozJIRsmCEqSXpL7d1tRbRF14ErIUUoorEX5jr5sJlLNd9yPi9XIm+nqcqxjPzJ
 EpyFgOKs2fcWMp0otysgpNSUFCRirZgwiNMiP4guxaozu9lSGyM43hfzdwq3D3Az0i4u
 WxUbdXAKlYQ9ZyXTscAlBFnKF0bZM2iaJ4UZy4nNM94bSGDgt0BmMXHdGII+0j+xI1t/
 IqVbY03Tmiv40tg4AJtNri6TpKgzT+fNVxtbB8FFdu2RXxxQnVP2D0Fmw9Nb4z3nuupT
 YJHNHf5hdBC67+bC6ueKL0DDRzdpKu9Wm4/ToipWL/wlyeUvsqCdsCcfSxYpcUdOkV9+
 acDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ywgOpHHmJzE8c2okgAy3CgLgHwGVL/ryR1hgs5mwKRE=;
 b=MdtO8WJ81SZmEyvMB0sP2RZq5SpH1tEcQX52zj3OKcxkfTm2bLT7Ar52m5sGaOIZiA
 Z0IfNn2ZCDHpWfa1LqfmtFObO/2IRHhqqQv8WMY5gCyl7aNm8i/xpYoPPOmmpO1ckUIG
 HlgANX73QKHXjPw0yjP5bPM4/j3BQ6fauHlliQwU48dAFQKHJly2uxA0+6mBWhJZgVny
 MBb7sVevNMmcNpLnz7TO244pCxGXfVfrVJxo86Hb7nsk2oxHYHXxT+4esZVF8DCvTNaE
 I2ePPL+Xu4NdVihNlcpwO50ORyUV5Z7nDqIQ/WWZNmEi6yu3GSxL0IZIpMq2iqd57FlL
 WysQ==
X-Gm-Message-State: AOAM532Y+HXay7CybZz2cqiLqckeCdPaLKzbcJUuIKXaWKwZ1H3zDilc
 gBqkbMx1pzyelgqUbO9gFNqx0Q==
X-Google-Smtp-Source: ABdhPJyoH6BaMzzShTGI11HCAHVH08Ozs7dVldM7aNhCB/mGWcoL8uHqcMF+j7iB+NE8uTLl1JKnsQ==
X-Received: by 2002:a5d:55c4:: with SMTP id i4mr34615417wrw.84.1617117936080; 
 Tue, 30 Mar 2021 08:25:36 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:2d11:7929:c1dd:292?
 ([2a01:e0a:90c:e290:2d11:7929:c1dd:292])
 by smtp.gmail.com with ESMTPSA id x25sm5986292wmj.14.2021.03.30.08.25.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 08:25:35 -0700 (PDT)
Subject: Re: [PATCH 3/3] arm64: dts: meson: add initial device-tree for MeCool
 KIII Pro
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Drazen Spio <drazsp@gmail.com>
References: <20210329154753.30074-1-christianshewitt@gmail.com>
 <20210329154753.30074-4-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <61d67a53-e4d9-e1e9-7af2-671fece668ed@baylibre.com>
Date: Tue, 30 Mar 2021 17:25:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210329154753.30074-4-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_162537_886375_6BD91A5C 
X-CRM114-Status: GOOD (  20.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 29/03/2021 17:47, Christian Hewitt wrote:
> MeCool (Videostrong) KIII Pro is based on the Amlogic Q200 reference
> board with an S912 chip and the following specs:
> 
> - 3GB DDR3 RAM
> - 16GB eMMC
> - 10/100/1000 Base-T Ethernet
> - BCM4335 Wireless (802.11 b/g/n/ac, BT 4.0)
> - DVB-C/T/T2/S/S2 (AVL6862TA demod + R912 tuner)
> - HDMI 2.0a video
> - S/PDIF optical output
> - CVBS/Analogue output
> - 4x USB 2.0 ports
> - IR receiver
> - 1x Power button (with integrated blue LED)
> - 1x Update/Reset button (underside)
> - 1x micro SD card slot
> 
> Tested-by: Drazen Spio <drazsp@gmail.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>  .../dts/amlogic/meson-gxm-mecool-kiii-pro.dts | 113 ++++++++++++++++++
>  2 files changed, 114 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index f8f515c93055..a58ccecfcb55 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -39,6 +39,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-p281.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-tx3-mini.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-libretech-pc.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxm-mecool-kiii-pro.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-minix-neo-u9h.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-nexbox-a1.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q200.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts
> new file mode 100644
> index 000000000000..0651756d7fb5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts
> @@ -0,0 +1,113 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/*
> + * Author: Christian Hewitt <christianshewitt@gmail.com>
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
> +	compatible = "videostrong,gxm-kiii-pro", "amlogic,s912", "amlogic,meson-gxm";
> +	model = "MeCool KIII Pro";
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x0 0x0 0xC0000000>;
> +	};
> +
> +	adc-keys {
> +		compatible = "adc-keys";
> +		io-channels = <&saradc 0>;
> +		io-channel-names = "buttons";
> +		keyup-threshold-microvolt = <1710000>;
> +
> +		button-function {
> +			label = "Update";
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
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		blue {
> +			color = <LED_COLOR_ID_BLUE>;
> +			function = LED_FUNCTION_POWER;
> +			gpios = <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
> +			panic-indicator;
> +		};
> +	};
> +};
> +
> +&ethmac {
> +	pinctrl-0 = <&eth_pins>;
> +	pinctrl-names = "default";
> +
> +	phy-handle = <&external_phy>;
> +
> +	amlogic,tx-delay-ns = <2>;
> +
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
> +	linux,rc-map-name = "rc-mecool-kiii-pro";
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
