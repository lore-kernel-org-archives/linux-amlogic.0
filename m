Return-Path: <SRS0=tLoi=NY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BBFC432BE
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 13:28:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E148F60F42
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 13:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E148F60F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mQ2KCW4Z12wdbOeRN4qo83DhqdPimGhl422nvDeNBcI=; b=gsZ+7ShSddvRfh0uZ6dbvD/EE0
	9BJ2zCx3Ijv6uzOMxicCn/1VwWBTyl0LVcy7iMl6igUzWyKnoNGLgA0YkfwGXYLaUOMBFn/0y6Umu
	SxDHXF4Vr/YyPojcD+rAcToexTpsCwKTuYisAXckXc8adx5h9m8R9eDCQwyzeJYkIw7s6Vuy6mf0A
	dWF7V2H0/gry0CJZYiZl1r7DxS0MZ+zTzNd3G4A1Uofp5eBektxKlguBdXr6tASzOm5KiQKnZowk/
	4Xca0+sJvLZXP34G+rvTLDTIM9euwq1Ys7GL45mLIBlNqNyOedbmW4mIAQZTrUChUPtFwnQ8Tsd5t
	rpPArv5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLmlI-009hZq-Tp; Thu, 02 Sep 2021 13:28:12 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLml2-009hXv-GR
 for linux-amlogic@lists.infradead.org; Thu, 02 Sep 2021 13:28:00 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so1131042wmh.1
 for <linux-amlogic@lists.infradead.org>; Thu, 02 Sep 2021 06:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=41iInlP0qtV7FfTJrQwV4wjvKaXbX/VARiMGZp0eTBc=;
 b=Gk1wey6hIkkCVbnVAy8vbVLogOQwicuG9NyJEXA6zGzIEZdfPL1suUboUmMujm/1Ok
 IzBdPuHh7edJSanwNZxgDZN7iRVbKlYCa3pphKBF9KP6xqiNsAmDuy43tNr6XWdevxez
 tgYUdaYqE6pUsYbbLu+tet7WzF+nCxs8j+scR3ub8hROwo/jIlsDjda6B5zLJtIqnjOq
 bNZyRikM9uDb2F8ZWmTGjBqRxCrL2dsxe2teHRX6/YupX4Zux+V9YN9rSduuH8dYQLNx
 DaMH9vYLjf3R6iuYqT8BlXGZP62DYmubbSA7mnoM67fsRafIrCSzBWi8NY5Zc4f6Ndtp
 BGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=41iInlP0qtV7FfTJrQwV4wjvKaXbX/VARiMGZp0eTBc=;
 b=SRN0vtqk/FZKLDAEuESVYiBeqLcBeb8KLFYN2hu2jJuYUHZMJ/1VMsonfmz5ZPkt7Y
 q/icKxOcZMBsLBoi2zPUnc8vLHrB4TzAuXIxR3GdxE8fK9UJT2rbhvwDXuWTAFV9k7Q0
 JWKDKhW5XY5inCu6IEGdrIajgvIQVz47LsWR9IuQV5K3VVn0dPO1vayG2smTU4659nNb
 yJzk60clsrcJshN5QG8gPG4V2qTur/RQaAFWXeuV4kq83m3qNice4xFSjZDVEjOPak9w
 0bvhsH2+A/gXU5kyh00g49kWyiMUy64MtRPFgqa0Ni7lc52ck5yv1DQQkVqUpIKia3fA
 KfFg==
X-Gm-Message-State: AOAM531gT5bilO7XBWiyuHtiP4i6lg2vahgJameCZvDQBprZoSm1zbYF
 CrqNBS8/dMxR8PkvP+CZAE555w==
X-Google-Smtp-Source: ABdhPJxG7LWAQ8pO0S2DWQR3pXrXIMqOl53eD26NvAtdjJL0epwu9pTE1pvv65lGt3dRAzwpGSKybQ==
X-Received: by 2002:a1c:4d10:: with SMTP id o16mr3234162wmh.60.1630589274290; 
 Thu, 02 Sep 2021 06:27:54 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:98:6312:3c8:6531?
 ([2001:861:44c0:66c0:98:6312:3c8:6531])
 by smtp.gmail.com with ESMTPSA id o7sm1590888wmc.46.2021.09.02.06.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 06:27:53 -0700 (PDT)
Subject: Re: [PATCH 2/3] arm64: dts: meson-axg: add support for JetHub D1
To: Vyacheslav Bocharov <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210902130516.3892452-1-adeep@lexina.in>
 <20210902130516.3892452-3-adeep@lexina.in>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <71edb4ed-f57a-e384-22f9-4e0a6799c10f@baylibre.com>
Date: Thu, 2 Sep 2021 15:27:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210902130516.3892452-3-adeep@lexina.in>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_062756_588237_A8D13D42 
X-CRM114-Status: GOOD (  27.67  )
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

Hi,


On 02/09/2021 15:05, Vyacheslav Bocharov wrote:
> JetHome Jethub D1 (http://jethome.ru/jethub-d1) is a home automation controller with the following features:
> - DIN Rail Mounting
> - Amlogic A113X (ARM Cortex-A53) quad-core up to 1.5GHz
> - no video out
> - 512Mb/1GB LPDDR4
> - 8/16GB eMMC flash
> - 1 x USB 2.0
> - 1 x 10/100Mbps ethernet
> - WiFi / Bluetooth AMPAK AP6255 (Broadcom BCM43455) IEEE 802.11a/b/g/n/ac, Bluetooth 4.2.
> - TI CC2538 + CC2592 Zigbee Wireless Module with up to 20dBm output power and Zigbee 3.0 support.
> - 2 x gpio LEDS
> - GPIO user Button
> - 1 x 1-Wire
> - 2 x RS-485
> - 4 x dry contact digital GPIO inputs
> - 3 x relay GPIO outputs
> - DC source with a voltage of 9 to 56 V / Passive POE
> 
> Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>  .../amlogic/meson-axg-jethome-jethub-j100.dts | 439 ++++++++++++++++++
>  2 files changed, 440 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 2c3ce7c401a5..3ba6f58b9833 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_MESON) += meson-axg-s400.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j100.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12a-sei510.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
> new file mode 100644
> index 000000000000..68d688528c86
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
> @@ -0,0 +1,439 @@

Please add a proper SPDX Licence identifier.

Don't you want to add a proper copyright header ?

> +
> +/dts-v1/;
> +
> +#include "meson-axg.dtsi"
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/thermal/thermal.h>
> +
> +/ {
> +	compatible = "jethome,j100", "amlogic,a113d", "amlogic,meson-axg";
> +	model = "JetHome JetHub J100";
> +	amlogic-dt-id = "axg_jethubj100_v1";

This attribute hasn't any upstream bindings, please remove it.

> +
> +	aliases {
> +		serial0 = &uart_AO;   /* Console */
> +		serial1 = &uart_B;    /* Bluetooth */

Usually we don't add an alias for a serial port with a subnode (here bluetooth).

> +		serial2 = &uart_AO_B; /* External UART (Wireless Module) */
> +		ethernet0 = &ethmac;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	/* 1024MB RAM */
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x0 0x0 0x40000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			reusable; size = <0x0 0x400000>;
> +			alignment = <0x0 0x400000>;
> +			linux,cma-default;
> +		};
> +	};

If you want to reduce the cma pool size, simply add:

reserved-memory {
	linux,cma {
		size = <0x0 0x400000>;
	};
};

> +
> +	emmc_pwrseq: emmc-pwrseq {
> +		compatible = "mmc-pwrseq-emmc";
> +		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	vcc_3v3: regulator-vcc_3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vddao_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	vcc_5v: regulator-vcc_5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	vddao_3v3: regulator-vddao_3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDAO_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc_5v>;
> +		regulator-always-on;
> +	};
> +
> +	vddio_ao18: regulator-vddio_ao18 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDIO_AO18";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vddao_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	vddio_boot: regulator-vddio_boot {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDIO_BOOT";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vddao_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	usb_pwr: regulator-usb_pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USB_PWR";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc_5v>;
> +		regulator-always-on;
> +	};
> +
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&gpio GPIOX_7 GPIO_ACTIVE_LOW>;
> +		clocks = <&wifi32k>;
> +		clock-names = "ext_clock";
> +	};
> +
> +	wifi32k: wifi32k {
> +		compatible = "pwm-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		pwms = <&pwm_ab 0 30518 0>; /* PWM_A at 32.768KHz */
> +	};
> +
> +	partitions: partitions {
> +		parts = <1>;
> +		part-0 = <&rootfs>;
> +		rootfs: rootfs {
> +			pname = "rootfs";
> +			size = <0xffffffff 0xffffffff>;
> +			mask = <4>;
> +		};
> +	};

This node hasn't any upstream bindings, please remove it.

> +
> +	efusekey: efusekey {
> +		keynum = <5>;
> +		key0 = <&key_0>;
> +		key1 = <&key_1>;
> +		key2 = <&key_2>;
> +		key3 = <&key_3>;
> +		key4 = <&key_4>;
> +
> +		key_0: key_0 {
> +			keyname = "mac";
> +			offset = <0>;
> +			size = <6>;
> +		};
> +		key_1: key_1 {
> +			keyname = "mac_bt";
> +			offset = <6>;
> +			size = <6>;
> +		};
> +		key_2: key_2 {
> +			keyname = "mac_wifi";
> +			offset = <12>;
> +			size = <6>;
> +		};
> +		key_3: key_3 {
> +			keyname = "usid";
> +			offset = <18>;
> +			size = <32>;
> +		};
> +		key_4: key_4 {
> +			keyname = "serial";
> +			offset = <50>;
> +			size = <32>;
> +		};
> +	}; //End efusekey

This node hasn't any upstream bindings, please remove it.

> +
> +	unifykey {
> +		compatible = "amlogic, unifykey";
> +		status = "ok";
> +		unifykey-num = <6>;
> +		unifykey-index-0 = <&keysn_0>;
> +		unifykey-index-1 = <&keysn_1>;
> +		unifykey-index-2 = <&keysn_2>;
> +		unifykey-index-3 = <&keysn_3>;
> +		unifykey-index-4 = <&keysn_4>;
> +		unifykey-index-5 = <&keysn_5>;
> +
> +		keysn_0: key_0 {
> +			key-name = "usid";
> +			key-device = "normal";
> +			key-permit = "read";
> +		};
> +		keysn_1: key_1 {
> +			key-name = "mac";
> +			key-device = "normal";
> +			key-permit = "read";
> +		};
> +		keysn_2: key_2 {
> +			key-name = "mac_bt";
> +			key-device = "normal";
> +			key-permit = "read","write","del";
> +			key-type  = "mac";
> +		};
> +		keysn_3: key_3 {
> +			key-name = "mac_wifi";
> +			key-device = "normal";
> +			key-permit = "read","write","del";
> +			key-type = "mac";
> +		};
> +		keysn_4: key_4 {
> +			key-name = "serial";
> +			key-device = "normal";
> +			key-permit = "read";
> +		};
> +		keysn_5:key_5 {
> +			key-name = "deviceid";
> +			key-device = "normal";
> +			key-permit = "read","write","del";
> +		};
> +	}; //End unifykey

This node hasn't any upstream bindings, please remove it.

> +
> +	thermal-zones {
> +		cpu_thermal: cpu-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +			thermal-sensors = <&scpi_sensors 0>;
> +			trips {
> +				cpu_passive: cpu-passive {
> +					temperature = <70000>; /* millicelsius */
> +					hysteresis = <2000>; /* millicelsius */
> +					type = "passive";
> +				};
> +				cpu_hot: cpu-hot {
> +					temperature = <80000>; /* millicelsius */
> +					hysteresis = <2000>; /* millicelsius */
> +					type = "hot";
> +				};
> +				cpu_critical: cpu-critical {
> +					temperature = <100000>; /* millicelsius */
> +					hysteresis = <2000>; /* millicelsius */
> +					type = "critical";
> +				};
> +			};
> +		};
> +		cpu_cooling_maps: cooling-maps {
> +			map0 {
> +				trip = <&cpu_passive>;
> +				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +			};
> +			map1 {
> +				trip = <&cpu_hot>;
> +				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +			};
> +		};
> +	};
> +};
> +
> +&ethmac {
> +	status = "okay";
> +	pinctrl-0 = <&eth_rmii_x_pins>;
> +	pinctrl-names = "default";
> +	phy-handle = <&eth_phy0>;
> +	phy-mode = "rmii";
> +	internal_phy=<0>;

This attribute hasn't any upstream bindings, please remove it.

> +	interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;

This is already defined in meson-axg.dtsi

> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* ICPlus IP101A/G Ethernet PHY (vendor_id=0x0243, model_id=0x0c54) */
> +		eth_phy0: ethernet-phy@0 {
> +			compatible = "ethernet-phy-id0243.0c54";

Is there an issue with autodetection of the PHY ? if no you can remove the compatible here.

> +			max-speed = <100>;
> +			reg = <0>;
> +
> +			reset-assert-us = <10000>;
> +			reset-deassert-us = <10000>;
> +			reset-gpios = <&gpio GPIOZ_5 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};
> +
> +/* Internal I2C bus (on CPU module) */
> +&i2c1 {
> +	status = "okay";
> +	pinctrl-0 = <&i2c1_z_pins>;
> +	pinctrl-names = "default";
> +
> +	/* RTC */
> +	pcf8563: pcf8563@51 {
> +		compatible = "nxp,pcf8563";
> +		reg = <0x51>;
> +		status = "okay";
> +	};
> +};
> +
> +/* Peripheral I2C bus (on motherboard) */
> +&i2c_AO {
> +	status = "okay";
> +	pinctrl-0 = <&i2c_ao_sck_10_pins>, <&i2c_ao_sda_11_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&pwm_ab {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_a_x20_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +/* wifi module */
> +&sd_emmc_b {
> +	status = "okay";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	pinctrl-0 = <&sdio_pins>;
> +	pinctrl-1 = <&sdio_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	sd-uhs-sdr104;
> +	max-frequency = <200000000>;
> +	non-removable;
> +	disable-wp;
> +
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +
> +	vmmc-supply = <&vddao_3v3>;
> +	vqmmc-supply = <&vddio_boot>;
> +
> +	brcmf: wifi@1 {
> +		reg = <1>;
> +		compatible = "brcm,bcm4329-fmac";
> +	};
> +};
> +
> +/* emmc storage */
> +&sd_emmc_c {
> +	status = "okay";
> +	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
> +	pinctrl-1 = <&emmc_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +
> +	bus-width = <8>;
> +	cap-mmc-highspeed;
> +	max-frequency = <200000000>;
> +	non-removable;
> +	disable-wp;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +
> +	mmc-pwrseq = <&emmc_pwrseq>;
> +
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&vddio_boot>;
> +};
> +
> +/* UART Bluetooth */
> +&uart_B {
> +	status = "okay";
> +	pinctrl-0 = <&uart_b_z_pins>, <&uart_b_z_cts_rts_pins>;
> +	pinctrl-names = "default";
> +	uart-has-rtscts;
> +
> +	bluetooth {
> +		compatible = "brcm,bcm43438-bt";
> +		shutdown-gpios = <&gpio GPIOZ_7 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +/* UART Console */
> +&uart_AO {
> +	status = "okay";
> +	pinctrl-0 = <&uart_ao_a_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +/* UART Wireless module */
> +&uart_AO_B {
> +	status = "okay";
> +	pinctrl-0 = <&uart_ao_b_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&usb {
> +	status = "okay";
> +	phy-supply = <&usb_pwr>;
> +};
> +
> +&spicc1 {
> +	status = "okay";
> +};
> +
> +&audio {
> +	status = "disabled";
> +};

This is brutal, all the externally connected nodes are only disabled, so you can avoid disabling the bus entirely.

> +
> +&efuse {
> +	status = "okay";
> +	compatible = "amlogic,meson-gxbb-efuse", "amlogic, efuse";
> +	read_cmd = <0x82000030>;
> +	write_cmd = <0x82000031>;
> +	get_max_cmd = <0x82000033>;
> +	key = <&efusekey>;
> +	clock-names = "efuse_clk";
> +};

Looking at Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt :
remove "amlogic, efuse", and all the other attributes.

> +
> +&gpio {
> +	interrupt-parent = <&gpio_intc>;
> +	interrupt-controller;
> +	#interrupt-cells = <2>;

This is not supported on upstream bindings, please remove.

> +	gpio-line-names = 
> +		"", "", "", "", "", // 0 - 4
> +		"", "", "", "", "", // 5 - 9
> +		"UserButton", "", "", "", "", // 10 - 14
> +		"", "", "", "", "", // 15 - 19
> +		"", "", "", "", "", // 20 - 24
> +		"", "LEDRED", "LEDGREEN", "Output3", "Output2", // 25 - 29
> +		"Output1", "", "", "", "", // 30 - 34
> +		"", "ZigBeeBOOT", "", "", "", // 35 - 39
> +		"", "ZigBeeRESET", "", "Input4", "Input3", // 40 - 44
> +		"Input2", "Input1", "", "", "", // 45 - 49
> +		"", "", "", "", "", // 50 - 54
> +		"", "", "", "", "", // 55 - 59
> +		"", "", "", "", "", // 60 - 64
> +		"", "", "", "", "", // 65 - 69
> +		"", "", "", "", "", // 70 - 74
> +		"", "", "", "", "", // 75 - 79
> +		"", "", "", "", "", // 80 - 84
> +		"", ""; // 85-86
> +};
> +
> +&cpu0 {
> +	#cooling-cells = <2>;
> +};
> +
> +&cpu1 {
> +	#cooling-cells = <2>;
> +};
> +
> +&cpu2 {
> +	#cooling-cells = <2>;
> +};
> +
> +&cpu3 {
> +	#cooling-cells = <2>;
> +};
> +
> 

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
