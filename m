Return-Path: <SRS0=23Bv=N6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30512C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Sep 2021 06:57:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4E2161108
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Sep 2021 06:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4E2161108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9hwrjDYsqpO07Z0rDDbENST1GhUUBUku9MkDZ1NmpaQ=; b=NVVQdpBP8C3btY+GDZIcVeYpPX
	jxOHSJiURmhfPQrnbUX3nTcqvX73dYXf3q/8PNHM7dAwNex1m5AiRwbIA2TmOZ3lLD7C5g88/EZ/E
	N3hrG/UTedrkLkYyD/QRtT5zrla7Z3CBLMJEe8YamCbnEj/t5/t1ZL1Qwy28jvQT0EIhwvAjQJ1BH
	fE2XMcH4PfHt4ECb904NwpR+dWWVsllnJzo6NlpXRN+U/lNjIc+3U0gMEF8XZabG1ynIwVlc35s+K
	Bv6AeL0fljHjEwxeIIUbIcJdHEOua2rAqAe2g/bzHFqKzHvU7hmkSJKGhPjZHeqhxyL695f8T2izI
	vZ907ZMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNrWO-005h2y-BG; Wed, 08 Sep 2021 06:57:24 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNrVL-005gpe-AG
 for linux-amlogic@lists.infradead.org; Wed, 08 Sep 2021 06:56:22 +0000
Received: by mail-wr1-x432.google.com with SMTP id t18so1668532wrb.0
 for <linux-amlogic@lists.infradead.org>; Tue, 07 Sep 2021 23:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PHJwkmBwCtvGqfPlnXiABnlEed2A5LAYxpzeKYrsDSA=;
 b=VPL6NNYWZxkh2XL/rJ++KVBY1+mLi4ZXLLVJZa2tIpJEcx6KMjSKegbDdY4OJsXxOZ
 ZuakYxQKSc0FiJnvX1BREiHkG3q3LYO2BDiYcZWuUQyJD9v0bBWrEg+7cRZMD5/ZgfqG
 CghPq29rwkb6lm2qANAusuThZ8CVFhktws0be2E20BNWMSY80cA565xhO5aU5Jurci7d
 cs8Zc+jzLvlOsAhq0Lm/ApA9FEFztj9ko7nV/bJYtwLLnzzUAaurbhT5uUs3hZ3cRFjs
 bJ+jk2+kCKd4mWJjmP3kY+IpDnSKSxCD/T/7CE+k5m1HFGX4pQrSKdhIfI6Wy5BziZ99
 0VPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=PHJwkmBwCtvGqfPlnXiABnlEed2A5LAYxpzeKYrsDSA=;
 b=NP+8G5l6cT71ni0o+yeEs2LRR5YCGBTg/puKDWm5CHmTCmGxKRPI+4xkoUyYJ9Z5d/
 WuzxucPZYbVrWQKr8KyeqtRIFpRPK/own70VrzmbY7xM9hXbuBG9nbz4iHmZVfXQPvHD
 WgV6q5sEtsZOULq1IT8ABh/tQRHNTE6+VaNzPq6Ky9uSUEX4IdPmacmtci/Rc/6oErTj
 ljnYslds3m8W+N+V7cD5qzQ9LvAXsLH33NwxOk0LcnOl0KawKP6D94ZxCDbvFF9A47nT
 OwTYmUu7kuBAT1oP2L+7fJrfP5xUsVyxJ0J+LbBGgAg04oIPwdgYhtBwPnfbM0rmeozH
 Z6Qw==
X-Gm-Message-State: AOAM530oEVYguxIF/4e9ZTAFHIo76OlPNPl+FaMqf0IR8Z1bXZEjzbH4
 qQVdhkLFIqPdLb0i3V50GTRmGQ==
X-Google-Smtp-Source: ABdhPJxVjfthZMB8MDqxGX6NE9FoJjr4zEKxJdLm8H2bF/RM9dUL66yx/DcGjG0J8LEZu7Yh+J5Ozw==
X-Received: by 2002:adf:9d4c:: with SMTP id o12mr2161179wre.187.1631084176377; 
 Tue, 07 Sep 2021 23:56:16 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:19d:2e13:ec0a:9d59?
 ([2001:861:44c0:66c0:19d:2e13:ec0a:9d59])
 by smtp.gmail.com with ESMTPSA id n20sm1034718wms.15.2021.09.07.23.56.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 23:56:15 -0700 (PDT)
Subject: Re: [PATCH v4 4/4] arm64: dts: meson-axg: add support for JetHub D1
To: Vyacheslav Bocharov <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210907095603.1520109-1-adeep@lexina.in>
 <20210907095603.1520109-5-adeep@lexina.in>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <9c6b69e0-0c3b-c1b9-d74a-c66b7bc5b5c6@baylibre.com>
Date: Wed, 8 Sep 2021 08:56:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907095603.1520109-5-adeep@lexina.in>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_235619_520346_BC92C852 
X-CRM114-Status: GOOD (  23.95  )
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

On 07/09/2021 11:56, Vyacheslav Bocharov wrote:
> JetHome Jethub D1 (http://jethome.ru/jethub-d1) is a home automation
> controller with the following features:
> - DIN Rail Mounting
> - Amlogic A113X (ARM Cortex-A53) quad-core up to 1.5GHz
> - no video out
> - 512Mb/1GB LPDDR4
> - 8/16GB eMMC flash
> - 1 x USB 2.0
> - 1 x 10/100Mbps ethernet
> - WiFi / Bluetooth AMPAK AP6255 (Broadcom BCM43455) IEEE 802.11a/b/g/n/ac,
>   Bluetooth 4.2.
> - TI CC2538 + CC2592 Zigbee Wireless Module with up to 20dBm output power
>   and Zigbee 3.0 support.
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
>  .../amlogic/meson-axg-jethome-jethub-j100.dts | 356 ++++++++++++++++++
>  2 files changed, 357 insertions(+)
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
> index 000000000000..ecffc90d9884
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
> @@ -0,0 +1,356 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2021 Vyacheslav Bocharov <adeep@lexina.in>
> + * Copyright (c) 2020 JetHome
> + * Author: Aleksandr Kazantsev <ak@tvip.ru>
> + * Author: Alexey Shevelkin <ash@tvip.ru>
> + * Author: Vyacheslav Bocharov <adeep@lexina.in>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-axg.dtsi"
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/thermal/thermal.h>
> +
> +/ {
> +	compatible = "jethome,jethub-j100", "amlogic,a113d", "amlogic,meson-axg";
> +	model = "JetHome JetHub J100";
> +	aliases {
> +		serial0 = &uart_AO;   /* Console */
> +		serial1 = &uart_AO_B; /* External UART (Wireless Module) */
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
> +		linux,cma {
> +			size = <0x0 0x400000>;
> +		};
> +	};
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
> +
> +				cpu_hot: cpu-hot {
> +					temperature = <80000>; /* millicelsius */
> +					hysteresis = <2000>; /* millicelsius */
> +					type = "hot";
> +				};
> +
> +				cpu_critical: cpu-critical {
> +					temperature = <100000>; /* millicelsius */
> +					hysteresis = <2000>; /* millicelsius */
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		cpu_cooling_maps: cooling-maps {
> +			map0 {
> +				trip = <&cpu_passive>;
> +				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +			};
> +
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
> +&efuse {
> +	sn: sn@32 {
> +		reg = <0x32 0x20>;
> +	};
> +
> +	eth_mac: eth_mac@0 {
> +		reg = <0x0 0x6>;
> +	};
> +
> +	bt_mac: bt_mac@6 {
> +		reg = <0x6 0x6>;
> +	};
> +
> +	wifi_mac: wifi_mac@c {
> +		reg = <0xc 0x6>;
> +	};
> +
> +	bid: bid@12 {
> +		reg = <0x12 0x20>;
> +	};
> +};
> +
> +&ethmac {
> +	status = "okay";
> +	pinctrl-0 = <&eth_rmii_x_pins>;
> +	pinctrl-names = "default";
> +	phy-handle = <&eth_phy0>;
> +	phy-mode = "rmii";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* ICPlus IP101A/G Ethernet PHY (vendor_id=0x0243, model_id=0x0c54) */
> +		eth_phy0: ethernet-phy@0 {
> +			/* compatible = "ethernet-phy-id0243.0c54";*/
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
> +	pinctrl-0 = <&spi1_x_pins>, <&spi1_ss0_x_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&gpio {
> +	gpio-line-names =
> +		"", "", "", "", "", // 0 - 4
> +		"", "", "", "", "", // 5 - 9
> +		"UserButton", "", "", "", "", // 10 - 14
> +		"", "", "", "", "", // 15 - 19
> +		"", "", "", "", "", // 20 - 24
> +		"", "LedRed", "LedGreen", "Output3", "Output2", // 25 - 29
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
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
