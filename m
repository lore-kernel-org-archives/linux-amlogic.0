Return-Path: <SRS0=2xsp=N4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05286C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Sep 2021 12:28:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC49760F92
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Sep 2021 12:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC49760F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rjk2lQfSvCqfjYTT0GM06KZlcGy5Rdl4yXTE5kig/QM=; b=xfvIPvcBdivP+8x2h5xgazepPR
	lsoAgvzM7dbwJNjpl1FbDl1mXQjFUw/vkBmry7juLQbskZSC8a/wsUB+kV3lRlI5xhVe5qRQdwy7Q
	5aFYBfkMzcJJIiv0F0zurEDDPCWobmP93IKOIwkAa/hhl8DcSwKC3iSq8jUEIJ8tpNs9u9GmdiAmQ
	6g85zwIQ5hOGt/1h/MoFFrEblRrEnSL11r3krGFasKHqnv62wOl6ZivUcbS6NNeHYD7VDBHphNb1b
	iA7pJH4mW1pV6xbRYx3trwNTlIEwoVnO79bhhdlaXcbUcSEbeK9Z7ZYV33Pb4qvYv6PLmrXCyIM6E
	xrgSmwWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNDjM-000mlW-Sz; Mon, 06 Sep 2021 12:28:08 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNDif-000mTB-08
 for linux-amlogic@lists.infradead.org; Mon, 06 Sep 2021 12:27:28 +0000
Received: by mail-wm1-x32a.google.com with SMTP id n39so2757032wms.1
 for <linux-amlogic@lists.infradead.org>; Mon, 06 Sep 2021 05:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1EqX+rMbdPQD+zwvvVtTVW5CqzHHJoy5CPj3FYZbCsE=;
 b=k5a9zObQOfypKm+x6UEKt0dxoZpqRWhUdI46bwVw6DMclezQrHKPeaa96zGfvLCMGR
 QYcR0ijiXl3LD0zM/U0qe19A1s4++BiRSV1CI7D9uiTuwrsy8Phv97L82BaiAInlTZGM
 sMpTh3YNlF29S5MfNwNIj+f0ZpMnJrZZcArLuwPfRzQPqNBh2kgboFFGvEvGnOrbjf0x
 d2vBo698l+ArNyug0kFWwuHcxkxWmqn/LjkaGKASKHPuGwM8NyEiPqAnnqPhVmwlc4ND
 +xBF6koXUxRDgjcCV6hRNgMOq7mV5mRjPpFAJ2M4k/NlTT93b9cecAMNq3UP28HDkxvT
 /aSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=1EqX+rMbdPQD+zwvvVtTVW5CqzHHJoy5CPj3FYZbCsE=;
 b=lxO7cYO/hdmSn/+weO2AF0MCKtHkhWuGz6IOr+1qchivv7JKdFduQ8yTgXnDHKW2Vz
 T/Rb/qOl974AT3dZcmSgHSLAJ78HZMpzDfm6dHBJCuoZ7sTQtPTavrHq4mLNd1uB7Qb8
 ch5hnqMCbY+g0jjhm8AKagRIxzSBH2ID2Xv1TKlrFTtfg35GpfvOb8Fjdsmuc0JvrPJ1
 fVppmUrLYv41gyYGCQg04ZcfxcECbzXRxBnZKiyvglWNHnCfyS6z7CQBTjus41JOOayu
 6c4v6S7/cQ85v3GvE1vTDStfieSPVUfI7N/WtOWVD9qydmNG4J3OsenAjzLQEaeVVi0o
 VWAw==
X-Gm-Message-State: AOAM530VcEgB0w9SUw3mE+WwnE0uOREvIsrisu3LxqQadrHLtUfLCvPL
 HUjze9i2/puJ2L9jLxiwDK3P3A==
X-Google-Smtp-Source: ABdhPJwLVUFEeOANoNcfzwMiKuteC05qw5MpcUXWpd6iXIs846kBIW0mJdHqM3B8PV7rGFnw3lqkKg==
X-Received: by 2002:a05:600c:3213:: with SMTP id
 r19mr11240970wmp.11.1630931242665; 
 Mon, 06 Sep 2021 05:27:22 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:9afb:57ba:5ea:2010?
 ([2001:861:44c0:66c0:9afb:57ba:5ea:2010])
 by smtp.gmail.com with ESMTPSA id l16sm5349973wrh.44.2021.09.06.05.27.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 05:27:22 -0700 (PDT)
Subject: Re: [PATCH v3 3/4] arm64: dts: meson-gxl: add support for JetHub H1
To: Vyacheslav Bocharov <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210904142745.183875-1-adeep@lexina.in>
 <20210904142745.183875-4-adeep@lexina.in>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <9af007f5-c644-a625-1779-7d30a2dda853@baylibre.com>
Date: Mon, 6 Sep 2021 14:27:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210904142745.183875-4-adeep@lexina.in>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_052725_096211_0EC86728 
X-CRM114-Status: GOOD (  21.53  )
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

On 04/09/2021 16:27, Vyacheslav Bocharov wrote:
> JetHome Jethub H1 (http://jethome.ru/jethub-h1) is a home automation
> controller with the following features:
> 
> - square plastic case
> - Amlogic S905W (ARM Cortex-A53) quad-core up to 1.5GHz
> - no video out
> - 1GB LPDDR4
> - 8/16GB eMMC flash
> - 2 x USB 2.0
> - 1 x 10/100Mbps ethernet
> - WiFi / Bluetooth RTL8822CS IEEE 802.11a/b/g/n/ac, Bluetooth 5.0.
> - TI CC2538 + CC2592 Zigbee Wireless Module with up to 20dBm output power
>   and Zigbee 3.0 support.
> - MicroSD 2.x/3.x/4.x DS/HS cards.
> - 1 x gpio LED
> - ADC user Button
> - DC source 5V microUSB
> 
> Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>  .../meson-gxl-s905w-jethome-jethub-j80.dts    | 241 ++++++++++++++++++
>  2 files changed, 241 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index faa0a79a34f5..2c3ce7c401a5 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -38,6 +38,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805x-p241.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-p281.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-tx3-mini.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-libretech-pc.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-jethome-jethub-j80.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-mecool-kiii-pro.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-minix-neo-u9h.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
> new file mode 100644
> index 000000000000..cccf483bd9e4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
> @@ -0,0 +1,241 @@
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
> +#include "meson-gxl.dtsi"
> +
> +/ {
> +	compatible = "jethome,jethub-j80", "amlogic,s905w", "amlogic,meson-gxl";
> +	model = "JetHome JetHub J80";
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x0 0x0 0x40000000>;
> +	};
> +
> +	reserved-memory {
> +		linux,cma {
> +			size = <0x0 0x1000000>;
> +		};
> +	};
> +
> +	aliases {
> +		serial0 = &uart_AO;   /* Console */
> +		serial1 = &uart_A;    /* Bluetooth */
> +		serial2 = &uart_AO_B; /* Wireless module 1 */
> +		serial3 = &uart_C;    /* Wireless module 2 */
> +		ethernet0 = &ethmac;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	vddio_ao18: regulator-vddio_ao18 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDIO_AO18";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	vddio_boot: regulator-vddio_boot {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDIO_BOOT";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	vddao_3v3: regulator-vddao_3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDAO_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	vcc_3v3: regulator-vcc_3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	emmc_pwrseq: emmc-pwrseq {
> +		compatible = "mmc-pwrseq-emmc";
> +		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	wifi32k: wifi32k {
> +		compatible = "pwm-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
> +	};
> +
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
> +		clocks = <&wifi32k>;
> +		clock-names = "ext_clock";
> +	};
> +};
> +
> +&efuse {
> +	bt_mac: bt_mac@6 {
> +		reg = <0x6 0x6>;
> +	};
> +
> +	wifi_mac: wifi_mac@C {
> +		reg = <0xc 0x6>;
> +	};
> +};
> +
> +&sn {
> +	reg = <0x32 0x20>;
> +};
> +
> +&eth_mac {
> +	reg = <0x0 0x6>;
> +};
> +
> +&bid {
> +	reg = <0x12 0x20>;
> +};
> +
> +&usb {
> +	status = "okay";
> +	dr_mode = "host";
> +};
> +
> +&pwm_ef {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_e_pins>;
> +	pinctrl-names = "default";
> +	clocks = <&clkc CLKID_FCLK_DIV4>;
> +	clock-names = "clkin0";
> +};
> +
> +&saradc {
> +	status = "okay";
> +	vref-supply = <&vddio_ao18>;
> +};
> +
> +/* Wireless SDIO Module */
> +&sd_emmc_a {
> +	status = "okay";
> +	pinctrl-0 = <&sdio_pins>;
> +	pinctrl-1 = <&sdio_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	max-frequency = <50000000>;
> +
> +	non-removable;
> +	disable-wp;
> +
> +	/* WiFi firmware requires power to be kept while in suspend */
> +	keep-power-in-suspend;
> +
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +
> +	vmmc-supply = <&vddao_3v3>;
> +	vqmmc-supply = <&vddio_boot>;
> +};
> +
> +/* SD card */
> +&sd_emmc_b {
> +	status = "okay";
> +	pinctrl-0 = <&sdcard_pins>;
> +	pinctrl-1 = <&sdcard_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	max-frequency = <50000000>;
> +	disable-wp;
> +
> +	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
> +
> +	vmmc-supply = <&vddao_3v3>;
> +	vqmmc-supply = <&vddio_boot>;
> +};
> +
> +/* eMMC */
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
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&vddio_boot>;
> +};
> +
> +/* Console UART */
> +&uart_AO {
> +	status = "okay";
> +	pinctrl-0 = <&uart_ao_a_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +/* S905W only has access to its internal PHY */
> +&ethmac {
> +	status = "okay";
> +	phy-mode = "rmii";
> +	phy-handle = <&internal_phy>;
> +};
> +
> +&internal_phy {
> +	status = "okay";
> +	pinctrl-0 = <&eth_link_led_pins>, <&eth_act_led_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&uart_A {
> +	status = "okay";
> +	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> +	pinctrl-names = "default";
> +	uart-has-rtscts;
> +};
> +
> +&uart_C {
> +	status = "okay";
> +	pinctrl-0 = <&uart_c_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&uart_AO_B {
> +	status = "okay";
> +	pinctrl-0 = <&uart_ao_b_pins>, <&uart_ao_b_cts_rts_pins>;
> +	pinctrl-names = "default";
> +	uart-has-rtscts;
> +};
> +
> +&i2c_B {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c_b_pins>;
> +
> +	pcf8563: pcf8563@51 {
> +		compatible = "nxp,pcf8563";
> +		reg = <0x51>;
> +		status = "okay";
> +	};
> +};
> 

Looks good

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
