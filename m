Return-Path: <SRS0=xEby=A5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F1AC433E3
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 08:52:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B73CB22B48
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 08:52:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BtHPGc9A";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="n93979QF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B73CB22B48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CykL7eeNtpiTr8JUhuQe7VIgMnVqLSwOWpJDkq2kCU=; b=BtHPGc9AGz6dIjoBv1PI2ibrpG
	0yBsqS/1IBED0JxF+vLbbHTNCkKgTvbGZAl8T+nGUAQC0HfZWAV97IPTdQyJiwLKPLTyr0hjOaI4f
	SXm9307K7fY89ENGRGwvxybU9YporBdUHVW1m2pKy3E+pKwJdOXY6yuy84rnrShBKsy+yWOTcWFBu
	uhp7RQ4MgZ9IQwZz9YKQib47G+Qw+tMcSMBpyz7DY3kbGOJHtIjFhqTqxbxOe3+OeIprunQ46Ar7g
	7yTFjQ1Ug2mSFd9424JqrR7YpLJRmPEJb9kGrIpE4NmnC3v9pcOJ1Qb8VGYPvV6ujpwjVnUGr+d31
	I+z4F+nQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwia8-0006B5-EY; Sat, 18 Jul 2020 08:52:32 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwia4-00069F-8m
 for linux-amlogic@lists.infradead.org; Sat, 18 Jul 2020 08:52:29 +0000
Received: by mail-wr1-x442.google.com with SMTP id f7so13412240wrw.1
 for <linux-amlogic@lists.infradead.org>; Sat, 18 Jul 2020 01:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding;
 bh=9ayyodkGKOpYivSbbjMTJTNckO5WX56Y6RqfjhxjCBI=;
 b=n93979QFLxxXKf9glRQf3YuTidR5ReP3Bl3WKjAa8NMu+CyyI18OY/AOEZpzMHOXqW
 H+2NEg1ebSLylQVCFKWKZMexiDFTpv7QglvmSm2Sp+POKmqLGjFxw3EcGuXG6lf1kBCp
 b5XWmNdF/k9BTOMAtSsqiR+0ri3CvM/DNd/ihuYDjA3a/1OmgB7dTOgUTjHZuYIM6iFT
 p06J8pZIRaFiZUnlBho+qAk/Hhh1f0n2GvT2peLk+T2MBlopq0HGHa8XsqkZ7/T2Bz5F
 vftWQYLqpoGV63d2c3N+IYAhC+O6/yCwQ6gVzDE30/eJO34l8iJcoaIdx77YRAsSTpYf
 iPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=9ayyodkGKOpYivSbbjMTJTNckO5WX56Y6RqfjhxjCBI=;
 b=jmLpNsNeKjjZ/sZdVHSo8A4he74Az7OklVd1Eh/2P/u386/IlHLtcP/kv2F57uA+UU
 ZTBFyeks37oSBHaW/PcDfli6ZxCciuV0rq0HujUU43lDi8zOTNb3DnBNOEWGnkFUmb8p
 W2qUYecsJL1hFhUr0ZRo0UUohJgbt3jqrGJeF+FE0ZLWodnM3IWMOopdpAYfY8T5SCNc
 RJfNheistEg7bVZrluK/Vn5qFR/yIBk662hG2rT9g2tIDudYhCroYM1g9tLTRYhHwA5M
 wsySOBAQQBX7JihHbruav9v5q9DhGlE2L1EveNi7NxW8HW3sr+jJGbw0zqK4YiJhycEM
 kELA==
X-Gm-Message-State: AOAM533+hSKsl3m2SFwvBjtMxn2UFBn5FX5Y3E1Fk6nXZxS01qHiPPnZ
 7E3Ty47tpk/I4DRXCMBLD4VMGQ==
X-Google-Smtp-Source: ABdhPJxu4y0gjLiyjMK9hGTuvtnSu+8ye3iOWiy3oiNkYI8prBjdwxks3f2RiBU44j7b4u5K1qIlbw==
X-Received: by 2002:adf:9307:: with SMTP id 7mr13579644wro.414.1595062347034; 
 Sat, 18 Jul 2020 01:52:27 -0700 (PDT)
Received: from Armstrongs-MacBook-Pro.local
 ([2a01:e35:2ec0:82b0:9d0:bf63:799d:4aa1])
 by smtp.gmail.com with ESMTPSA id l14sm19932531wrn.18.2020.07.18.01.52.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 18 Jul 2020 01:52:26 -0700 (PDT)
Subject: Re: [PATCH 2/2] arm64: dts: meson: add support for the WeTek Core 2
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20200718050056.1713-1-christianshewitt@gmail.com>
 <20200718050056.1713-2-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <2ab5e28a-77f6-cac1-68ed-f0a23d5f2a24@baylibre.com>
Date: Sat, 18 Jul 2020 10:52:26 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200718050056.1713-2-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_045228_365807_DCCA1F75 
X-CRM114-Status: GOOD (  22.11  )
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



Le 18/07/2020 =E0 07:00, Christian Hewitt a =E9crit :
> The WeTek Core2 is a commercial device based on the Amlogic Q200 reference
> design but with the following differences:
> =

> - 3GB RAM, 32GB eMMC
> - Blue and Red LEDs used to signal on/off status
> - uart_AO can be accessed after opening the case; soldering required
> - USB OTG is not accessible (inside the case)
> - Realtek RTL8152 Ethernet (internal USB connection)
> =

> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>  .../dts/amlogic/meson-gxm-wetek-core2.dts     | 90 +++++++++++++++++++
>  2 files changed, 91 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts
> =

> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/a=
mlogic/Makefile
> index 5cac4d1d487d..4e2239ffcaa5 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxm-q201.dtb
>  dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxm-rbox-pro.dtb
>  dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxm-s912-libretech-pc.dtb
>  dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxm-vega-s96.dtb
> +dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxm-wetek-core2.dtb
>  dtb-$(CONFIG_ARCH_MESON) +=3D meson-sm1-sei610.dtb
>  dtb-$(CONFIG_ARCH_MESON) +=3D meson-sm1-khadas-vim3l.dtb
>  dtb-$(CONFIG_ARCH_MESON) +=3D meson-sm1-odroid-c4.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts b/arch=
/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts
> new file mode 100644
> index 000000000000..44fc5ea38dc0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts
> @@ -0,0 +1,90 @@
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
> +	compatible =3D "wetek,core2", "amlogic,s912", "amlogic,meson-gxm";
> +	model =3D "WeTek Core 2";
> +
> +	memory@0 {
> +		device_type =3D "memory";
> +		reg =3D <0x0 0x0 0x0 0x80000000>; /* 2 GiB or 3 GiB */
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		blue {
> +			color =3D <LED_COLOR_ID_BLUE>;
> +			function =3D LED_FUNCTION_STATUS;
> +			gpios =3D <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "on";
> +		};
> +	};
> +
> +	adc-keys {
> +		compatible =3D "adc-keys";
> +		io-channels =3D <&saradc 0>;
> +		io-channel-names =3D "buttons";
> +		keyup-threshold-microvolt =3D <1710000>;
> +
> +		button-update {
> +			label =3D "update";
> +			linux,code =3D <KEY_VENDOR>;
> +			press-threshold-microvolt =3D <10000>;
> +		};
> +	};
> +
> +	gpio-keys-polled {
> +		compatible =3D "gpio-keys-polled";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		poll-interval =3D <100>;
> +
> +		button-power {
> +			label =3D "power";
> +			linux,code =3D <KEY_POWER>;
> +			gpios =3D <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};
> +
> +/* This is disabled as Realtek RTL8152 USB provides Ethernet */
> +&ethmac {
> +	status =3D "disabled";
> +	phy-mode =3D "rmii";
> +	phy-handle =3D <&internal_phy>;

I think you can remove these 2 lines

> +};
> +
> +&internal_phy {
> +	pinctrl-0 =3D <&eth_link_led_pins>, <&eth_act_led_pins>;
> +	pinctrl-names =3D "default";

Simply add :
status =3D "disabled";

> +};
> +
> +&ir {
> +	linux,rc-map-name =3D "rc-wetek-play2";
> +};
> +
> +/* This is connected to the Bluetooth module: */
> +&uart_A {
> +	status =3D "okay";
> +	pinctrl-0 =3D <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> +	pinctrl-names =3D "default";
> +	uart-has-rtscts;
> +
> +	bluetooth {
> +		compatible =3D "brcm,bcm43438-bt";
> +		enable-gpios =3D <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
> +		max-speed =3D <2000000>;
> +		clocks =3D <&wifi32k>;
> +		clock-names =3D "lpo";
> +	};
> +};
> =



Otherwise looks good

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
