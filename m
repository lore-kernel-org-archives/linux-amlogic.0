Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCD9C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Feb 2022 09:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YWWGqwht0SYhdySe0tchnSYBgMzlvoDSOMcuWXmiuzo=; b=GKIsavI8JGN7+8
	pf2T7RulTgkIzkqMQ8n9Kx9Is7AgYpOPpWp+VUaYxCA3YXWuFpQ2HZzlJINjng1on946Ldk2JWqz/
	lHC2MEiG5pXO2BFjehpzfuJj+GSWIpWTuW66tARstyYqGk25wRkaZWi0ayBuQ913XX4FY04+r+c0J
	rH6LPIGZwuHTsoYN4q+AzYgLaj+tSqXd+h4wwZDH3m43105+x5DqPynXPfCwvfUOtzlHzQkyjUKvb
	I1sPKQoYwTX/Lx3tKi3qgQa4zNQAechzAn9tIUEobLOkNpUPqMzMCyoxaHw9kwuVpAwiP8p9MfHHQ
	HCXiugwVxJYNX/a0lCNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI5oz-003I76-Hj; Thu, 10 Feb 2022 09:33:01 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI5oi-003I0S-7O
 for linux-amlogic@lists.infradead.org; Thu, 10 Feb 2022 09:32:47 +0000
Received: by mail-wr1-x433.google.com with SMTP id q7so8323765wrc.13
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Feb 2022 01:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sE0UL3RxSE/XJwN6exUr6SQxpMt4J1dNpCV9VXj5qB8=;
 b=6Kvxn9CF7vvjwlRNBuSRaIYc2kaAdU1NmBJa906mzcnrZ3FTns1jEzSgTmAwcB2sIN
 StbgTTyjH6gacUtZ6pRLAeMyE0yJGwYZxu2ar12FNkG9KOtq833+FRvgoGnM8fz1ZQzR
 B25G1FKvtWeQA+mLRHzIrAIHZNopGVG1emKPOtYQffrz9NFZo4I+64xOdg+kjOWswvCc
 jJ/dpqKBndGKD8G9Xjh3gJBupYFiL4lRdXXgUtFVaqs+D4zdrzObABtsRpHcU4Tb7fjD
 RoekasqX2NLZZd2I0G0Pb1xqo1QADJEGag6iaY0iRqBRbVuuvfKOPB+vQnEvI/5KmQsL
 7Hrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sE0UL3RxSE/XJwN6exUr6SQxpMt4J1dNpCV9VXj5qB8=;
 b=4Jg+/6QYtf7zl5dQbDNIiK0rheyUMBGwVkDxJ7bU/WWeC/AQkVgPzHrbpwAaDQK7sN
 Yo/kmZjsqUs1W1zU7Jzv+3pimjh0XTMWq+EYfpIP45hOD7h7kao0BDD/frdvgEOEgyPG
 FtvdW5RowaMSSf9hNtVBqbkVm4g63a5TaKv0x7czbNubAyeMd0qg8wAd6bjm+/T5U0fN
 DGwQ2Z4uz4DkT8Wn2e6TZ/y4goGVckgQOV6gI60GJcKBsrcxQYFty1hu6kQTzMrUKm/b
 XW484k7jIEmih0HVCPHL2U3UJWcrADVYZyg970HJe/YR7sShLuwFretcUyHgPWz6+9ja
 jx/w==
X-Gm-Message-State: AOAM533JDZqP+yTCqdiZlZH2i2qQdmeel08O8XIb4J7M1SNX80xC4erR
 +pUJW+TL5f2HQuNE8gLGti4pPQ==
X-Google-Smtp-Source: ABdhPJxaCP++lYv4VszneZqW6IJlYjugiCxUlqoeqTy7SNnnwKM/Nht7WY1oUkjYp5khbO6cggUJpg==
X-Received: by 2002:a05:6000:184a:: with SMTP id
 c10mr5611390wri.212.1644485561888; 
 Thu, 10 Feb 2022 01:32:41 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:76d9:bf0e:e516:58a9?
 ([2001:861:44c0:66c0:76d9:bf0e:e516:58a9])
 by smtp.gmail.com with ESMTPSA id bk5sm6690872wrb.10.2022.02.10.01.32.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 01:32:41 -0800 (PST)
Message-ID: <c2be608a-9ce0-4125-3414-d5f05c1cc528@baylibre.com>
Date: Thu, 10 Feb 2022 10:32:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] arm64: dts: meson: add support for OSMC Vero 4K+
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Sam Nazarko <email@samnazarko.co.uk>, Chad Wagner <wagnerch42@gmail.com>
References: <20220210044647.14443-1-christianshewitt@gmail.com>
 <20220210044647.14443-4-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220210044647.14443-4-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_013244_404088_114DB3E5 
X-CRM114-Status: GOOD (  21.13  )
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

Hi,

On 10/02/2022 05:46, Christian Hewitt wrote:
> The OSMC Vero 4K+ device is based on the Amlogic S905D (P230)
> reference design with the following specifications:
> 
> - 2GB DDR4 RAM
> - 16GB eMMC
> - HDMI 2.1 video
> - S/PDIF optical output
> - AV output
> - 10/100/1000 Ethernet
> - AP6255 Wireless (802.11 a/b/g/n/ac, BT 4.2)
> - 2x USB 2.0 ports (1x OTG)
> - IR receiver (internal)
> - IR extender port (external)
> - 1x micro SD card slot
> - 1x Power LED (red)
> - 1x Reset button (in AV jack)
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Tested-by: Chad Wagner <wagnerch42@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>   .../amlogic/meson-gxl-s905d-vero4k-plus.dts   | 125 ++++++++++++++++++
>   2 files changed, 126 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 13f73ca700ef..0eec18678311 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -36,6 +36,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p230.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p231.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-phicomm-n1.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-sml5442tw.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-vero4k-plus.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805x-p241.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-p281.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-tx3-mini.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dts
> new file mode 100644
> index 000000000000..453d51a4b77e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dts
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Author: Christian Hewitt <christianshewitt@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-gxl-s905d.dtsi"
> +#include "meson-gx-p23x-q20x.dtsi"
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	compatible = "osmc,vero4k-plus", "amlogic,s905d", "amlogic,meson-gxl";
> +	model = "OSMC Vero 4K Plus";
> +
> +	reserved-memory {
> +		/* 32 MiB reserved for ARM Trusted Firmware (BL32) */
> +		secmon_reserved_bl32: secmon@5300000 {
> +			reg = <0x0 0x05300000 0x0 0x2000000>;
> +			no-map;
> +		};
> +	};

This can be dropped since I applied your "arm64: dts: meson-gx: add ATF BL32 reserved-memory region"

> +
> +	gpio-keys-polled {
> +		compatible = "gpio-keys-polled";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		poll-interval = <20>;
> +
> +		button@0 {
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
> +			gpios = <&gpio_ao GPIOAO_9 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +			panic-indicator;
> +		};
> +	};
> +};
> +
> +&ethmac {
> +	pinctrl-0 = <&eth_pins>;
> +	pinctrl-names = "default";
> +
> +	phy-mode = "rgmii-txid";
> +	phy-handle = <&external_phy>;
> +
> +	amlogic,tx-delay-ns = <0>;
> +};
> +
> +&external_mdio {
> +	external_phy: ethernet-phy@0 {
> +		/* Realtek RTL8211F (0x001cc916) */
> +		pinctrl-0 = <&eth_phy_irq_pin>;
> +		pinctrl-names = "default";
> +
> +		reg = <0>;
> +		max-speed = <1000>;
> +
> +		/* External PHY reset is shared with internal PHY Led signal */

I don't think this comment is necessary

> +		reset-assert-us = <10000>;
> +		reset-deassert-us = <80000>;
> +		reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
> +
> +		interrupt-parent = <&gpio_intc>;
> +		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
> +&pinctrl_periphs {
> +	eth_phy_irq_pin: eth-phy-irq {
> +		mux {
> +			groups = "GPIOZ_15";
> +			function = "gpio_periphs";
> +			bias-disable;
> +			output-disable;
> +		};
> +	};
> +};

Add a comment here to specify why you disable bias for the eth irq line.

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
> +
> +&usb {
> +	dr_mode = "host";
> +};
> +
> +&usb2_phy0 {
> +	/* HDMI_5V also supplies the USB VBUS */
> +	phy-supply = <&hdmi_5v>;
> +};
> +
> +&usb2_phy0 {
> +	/* HDMI_5V also supplies the USB VBUS */
> +	phy-supply = <&hdmi_5v>;
> +};

With those changes, you can add my:

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
