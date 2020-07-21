Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D566C433E4
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 08:06:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18E9A21702
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 08:06:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G/f0r8A9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pAphUZe4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18E9A21702
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TwD7S6pgyvpQs8EtKCZeddKfHO8vu9aiATTSBUn/DoQ=; b=G/f0r8A9P6HKY7AKPUtK1liAdb
	av/+vq4yCs0A2uAUvW5f12t4LtJiMG/5ojpzpeFtOJ6UNXhMnVvcJVdUWHfDSFJwkiBjHGqQojSRx
	cnLpnze6Grxmd/teOGNKnsBNOxaAGgv64P/nQXtGvkAzmmp/LsBD52259vY9cdpWX2xR8m6PPiDUO
	dtp7rZfEeNoBq6kY+0poG5AUfhQzY7ADSIDrHA/dnXIJZC+r4OhuruIGMB/UZXShrKf19mSwdCZG9
	ivOEdmfU/OADq7irNaeBAqNjABbrHAb969id0vgvKlmp/pTMIpirKxF0hVc7UIKVCqaqwgvuZx+MJ
	la2RLGeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxnI8-00010g-M0; Tue, 21 Jul 2020 08:06:24 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxnHg-0000pD-G9
 for linux-amlogic@lists.infradead.org; Tue, 21 Jul 2020 08:05:58 +0000
Received: by mail-wr1-x443.google.com with SMTP id z15so20201195wrl.8
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Jul 2020 01:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V1/WiSj/e4KNtzTBAgt0YeCvDXNH1b4xS3BHNVivhP4=;
 b=pAphUZe4DCNQ+qe/JtdmhPcxLhem9rq19kUwRZETAt6pf1t/CrSNeo6SvSwociaUuT
 jIMq0LF5zfHxa683D2D4hXuuwk8CvXSLGUp9flaeCGItc4gmPrVjQamc52LwRgRHY+Ak
 wGhjflknuLgAh/lZugPe3W53uMlPLZxhfzWbvpsm41Bs+kQ7H2p2xHP51qyrcH7z/cR6
 +TADGPCT/ftmYZEYt9cyL7MPvD+A6foVvbPFGVXub3gPk9jYNy1T7RAIwbJpa5+drAkX
 EN0tXHf5LbPB2+cNzxjCTZAa4nPi8o0warGsGw6akADLRUSHDwbuMxZtpXw0VkAjv5B3
 QKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=V1/WiSj/e4KNtzTBAgt0YeCvDXNH1b4xS3BHNVivhP4=;
 b=R3aZamepX32JBfhQ+AZVRljw/DDn1F8uAUNeveJ0i4L/eN1CyrtZstHqd2tNy5LQ7h
 H0KE11JPSWyrtrQ7xEYhUDmND/0yXe9x9btrVIw8CgdE4wXnf/+v4PXgJbDJP0JdOx08
 UmqRGKBFRhEFe87TgRqnYFYAgkgTPgm3jaBnQ2zO/gghoSsHVSR6Vj2tzB0FapxvckiP
 QxTwfEYNW0n0oCstsTfYZCe+lyzyRK6PzsB2LpjNoPuCrKJBQBhrU+rlaDt1wwi8C3bO
 QBkmsjwq3RNiW1/93E2RHEFZ/fTlXCFo0Vwz5AG20WuQOaZ4sAFjlolvEwpIMsNc7pRb
 gJOw==
X-Gm-Message-State: AOAM530UqCnepUWJHyCWA6PH/bYLQhhAFUNoADREShe5o+M+a1WgsB+7
 kj/qfIwbOn26hlid/SisfXTKMQ==
X-Google-Smtp-Source: ABdhPJxVagj8kEvl9/UFCcw3KbVwV2SWsU3D7wYzRagQ0nooo02Sg3CrHfgNArZpWFGgMMKlrj4vDw==
X-Received: by 2002:adf:ee0b:: with SMTP id y11mr26958008wrn.360.1595318754914; 
 Tue, 21 Jul 2020 01:05:54 -0700 (PDT)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g144sm2215674wme.2.2020.07.21.01.05.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 01:05:53 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] arm64: dts: meson: add support for the WeTek Core 2
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20200719021421.7959-1-christianshewitt@gmail.com>
 <20200719021421.7959-3-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <84f58117-f088-71a6-e6dc-fd81a3e8bcd6@baylibre.com>
Date: Tue, 21 Jul 2020 10:05:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200719021421.7959-3-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_040556_611844_E72E2B7E 
X-CRM114-Status: GOOD (  21.87  )
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

On 19/07/2020 04:14, Christian Hewitt wrote:
> The WeTek Core2 is a commercial device based on the Amlogic Q200 reference
> design but with the following differences:
> 
> - 3GB RAM, 32GB eMMC
> - Blue and Red LEDs used to signal on/off status
> - uart_AO can be accessed after opening the case; soldering required
> - USB OTG is not accessible (inside the case)
> - Realtek RTL8152 Ethernet (internal USB connection)
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>  .../dts/amlogic/meson-gxm-wetek-core2.dts     | 87 +++++++++++++++++++
>  2 files changed, 88 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 5cac4d1d487d..4e2239ffcaa5 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q201.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-rbox-pro.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-s912-libretech-pc.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-khadas-vim3l.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-c4.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts
> new file mode 100644
> index 000000000000..ec794c134c15
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts
> @@ -0,0 +1,87 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2020 Christian Hewitt <christianshewitt@gmail.com>
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
> +	compatible = "wetek,core2", "amlogic,s912", "amlogic,meson-gxm";
> +	model = "WeTek Core 2";
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x0 0x0 0x80000000>; /* 2 GiB or 3 GiB */
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		blue {
> +			color = <LED_COLOR_ID_BLUE>;
> +			function = LED_FUNCTION_STATUS;
> +			gpios = <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
> +		};
> +	};
> +
> +	adc-keys {
> +		compatible = "adc-keys";
> +		io-channels = <&saradc 0>;
> +		io-channel-names = "buttons";
> +		keyup-threshold-microvolt = <1710000>;
> +
> +		button-update {
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
> +		button-power {
> +			label = "power";
> +			linux,code = <KEY_POWER>;
> +			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};
> +
> +/* Disabled as Realtek RTL8152 USB provides Ethernet */
> +&ethmac {
> +	status = "disabled";
> +};
> +
> +&internal_phy {
> +	status = "disabled";
> +};
> +
> +&ir {
> +	linux,rc-map-name = "rc-wetek-play2";
> +};
> +
> +/* This is connected to the Bluetooth module: */
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
