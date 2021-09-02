Return-Path: <SRS0=tLoi=NY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1A2C432BE
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 13:19:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E7746108B
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 13:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E7746108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gSU5o4vjidA1HEoe1g20o7+junBzKtzLe6JCSZRkUqE=; b=lR3IDtzQ+R6ILCcoK7gxU+AP/b
	TAj+Xijzqr5jk496Q6e632b1EdbqvUTr05Y+Hq4DBBiDmiod4JUbN8KmoBYrYJ/S5YO9rcaiE8mtw
	PhtlFPH5QTRJerefHSnrpSel2FS2p6QpsdDYJEnEfH6LhjSZc65s7MqbpVKBUFGOzstBMAG4ugXiQ
	TJ+Qq++NK0THEuuzcu+5L912o4WRiLKEHSUbLp2rbT+RpDKV+OAwV5zoCoYKC/2MX6bM1Rk48EAFj
	A8F8aGv8JmPR/pagmOCjDOibJMKWPJFWL/QS6eCzy/gveq/6JuA9apiPQj71PZ4T6PQNGCNWV3AUB
	E+gg9bcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLmcw-009gZ0-VZ; Thu, 02 Sep 2021 13:19:34 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLmci-009gXS-DO
 for linux-amlogic@lists.infradead.org; Thu, 02 Sep 2021 13:19:24 +0000
Received: by mail-wm1-x32e.google.com with SMTP id e26so1266958wmk.2
 for <linux-amlogic@lists.infradead.org>; Thu, 02 Sep 2021 06:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zwMnIW+8aBEuFpIkL2gH05aG0DkWnEDuuhYGJ3rTyUA=;
 b=rL7LXy8hTCz7qQYLsGAA6iNJVXQxkAQSA/TpJRiU3cM5hc7cRwLkal9+eyGchtRa2k
 Bkb2mGSwTWex8mBFlk0wLWEcfyLft9vOotdZvVNGylhdMAtEBdlAiC/JwmBN8cvAneV8
 SLmxkjB9fxtWGquOa9/r9nOhmCePqj4tfCk6ZnEVxlQ57KMnL29qMceoznoz7coaGzlk
 l4pQfrHXk4Cwt1XSxRdp5fnYne8PHkIoMAlotwfxB5Yu1HZXzVdpYsYeeDWZbJxt8ea2
 b2bBOUn6Jpy3PkBncdXq0abwRhK/f1i8u3pJPheUIQCKhp4SupTEC6QX5u/homf3H8HZ
 gjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=zwMnIW+8aBEuFpIkL2gH05aG0DkWnEDuuhYGJ3rTyUA=;
 b=k8BTmYrEMfNGmn/1+HsHRb0z7Xz5SsWr0iy+mnZWSZFNc+o/XxPRVOAbtUajBNpFwL
 npSvdRzJI4PUYflqnnWU5QQASuQLnbvJKI+pcJspLeTBasuLjdQOaRvDATts3/sLpP+1
 gEcQsHY0zejUvmoXc2YoPEvAVtfWVNFUIan5Lwzz1VvIMPa/4/6mcUeK3HAlCUga7rj9
 hmZHh2caSWXwKsEIKrirB/x4E4R7APYVFxsK/A7HVv0nJATO6fHEOAECpczyehDnOM0p
 EDKImz4ihs5ANYF6PpzB6k6f+0igv7Y8c8lFrvD8YC1qbqqxrPf5S7wAThzFPmALR1E5
 2f1g==
X-Gm-Message-State: AOAM532ePstPP7yHSXr9vv+4xZG5nb693yOniKfz3iySyl5eP1fwtJoA
 Fzxh1w2u5bm9MFLGlEaODQp1VJQax1vC2PjH
X-Google-Smtp-Source: ABdhPJy8cv4sTOUo7KyJ3wCCZh93/f57bmoN+0yaQJeZV0H0yGX20GeyCNh5OsmV9vKGNy8Un9i+YQ==
X-Received: by 2002:a05:600c:4152:: with SMTP id
 h18mr3085857wmm.55.1630588757467; 
 Thu, 02 Sep 2021 06:19:17 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:98:6312:3c8:6531?
 ([2001:861:44c0:66c0:98:6312:3c8:6531])
 by smtp.gmail.com with ESMTPSA id f17sm2144766wrt.63.2021.09.02.06.19.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 06:19:17 -0700 (PDT)
Subject: Re: [PATCH 1/3] arm64: dts: meson-gxl: add support for JetHub H1
To: Vyacheslav Bocharov <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210902130516.3892452-1-adeep@lexina.in>
 <20210902130516.3892452-2-adeep@lexina.in>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <48238ebf-842d-b752-8b9a-f6f408e57dd2@baylibre.com>
Date: Thu, 2 Sep 2021 15:19:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210902130516.3892452-2-adeep@lexina.in>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_061920_491407_79B93AEB 
X-CRM114-Status: GOOD (  25.91  )
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
> JetHome Jethub H1 (http://jethome.ru/jethub-h1) is a home automation controller with the following features:
> 
> - square plastic case
> - Amlogic S905W (ARM Cortex-A53) quad-core up to 1.5GHz
> - no video out
> - 1GB LPDDR4
> - 8/16GB eMMC flash
> - 2 x USB 2.0
> - 1 x 10/100Mbps ethernet
> - WiFi / Bluetooth RTL8822CS IEEE 802.11a/b/g/n/ac, Bluetooth 5.0.
> - TI CC2538 + CC2592 Zigbee Wireless Module with up to 20dBm output power and Zigbee 3.0 support.
> - MicroSD 2.x/3.x/4.x DS/HS cards.
> - 1 x gpio LED
> - ADC user Button
> - DC source 5V microUSB

Thanks for submitting a new board !

> 
> Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>  .../meson-gxl-s905w-jethome-jethub-j80.dts    | 325 ++++++++++++++++++
>  2 files changed, 326 insertions(+)
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
> index 000000000000..7b14c7c4eed5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
> @@ -0,0 +1,325 @@

Please add a proper SPDX Licence identifier.

Don't you want to add a proper copyright header ?

> +
> +/dts-v1/;
> +
> +#include "meson-gxl.dtsi"
> +
> +/ {
> +	compatible = "jethome,j80", "amlogic,s905w", "amlogic,meson-gxl";
> +	model = "JetHome JetHub J80";
> +	amlogic-dt-id = "gxl_jethubj80_v1";

This attribute hasn't any upstream bindings, please remove it.

> +
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
> +			key-device = "efuse";
> +			key-permit = "read","write";
> +		};
> +		keysn_1: key_1 {
> +			key-name = "mac";
> +			key-device = "efuse";
> +			key-permit = "read","write";
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
> +			key-device = "efuse";
> +			key-permit = "read","write";
> +		};
> +		keysn_5:key_5 {
> +			key-name = "deviceid";
> +			key-device = "normal";
> +			key-permit = "read","write","del";
> +		};
> +	}; //End unifykey
> +};


This node hasn't any upstream bindings, please remove it.

> +
> +&usb {
> +	status = "okay";
> +	dr_mode = "host";
> +};
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
> +/* S905X only has access to its internal PHY */

Did you mean S905W ?

> +&ethmac {
> +	reg = <0x0 0xc9410000 0x0 0x10000
> +		0x0 0xc8834540 0x0 0x4
> +		0x0 0xc8834558 0x0 0xc
> +		0x0 0xc1104408 0x0 0x4>;
> +	amlogic,eth-leds = <0x91>;

This attribute isn't defined in upstream bindings.

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
> +	pinctrl-names="default";
> +	pinctrl-0=<&i2c_b_pins>;

Please add spaces before and after the "=".

> +
> +	pcf8563: pcf8563@51 {
> +		compatible = "nxp,pcf8563";
> +		reg = <0x51>;
> +		status = "okay";
> +	};
> +};
> +
> 

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
