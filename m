Return-Path: <SRS0=UeA4=NZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC8FC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Sep 2021 12:18:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08540610CE
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Sep 2021 12:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 08540610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oY5pVHmE38sjJaAFs/4PRyfahPw5vtdlbsmoe45Bi+0=; b=jiKzd6Iqv1E7ec
	eYiJz+uln36TV+PVZl+cSm5GV31THxQMdU5b59pXhwMGLOjA8wUjNWkyGG4PeFd52Dau9yfXwaw//
	tTYvZc8etaqjjixUIOOfeR160LGCzp8NdTId21hVVVk3mzRwDQd8A5YyMAgNL7ghhG21CJnbhx58f
	Pk6Q192Ix79lbRrxCB7G2FzAVWkax6VNJDaTW3uRc8eCRlSumWXqs1Lsreco5ioSAa5E/tjf4Nc1O
	zBLwML90vMbL03WUUgPPFd9Tj82ZTD3vgYE4jIYgW9vSuHHm80ninw66Dlj22oAJPEDdXW+itWnba
	s+ySoTGco+VHGpHih1aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM89T-00BszW-Fe; Fri, 03 Sep 2021 12:18:35 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM89E-00BsxP-HQ
 for linux-amlogic@lists.infradead.org; Fri, 03 Sep 2021 12:18:23 +0000
Received: by mail-wr1-x42e.google.com with SMTP id g18so7952336wrc.11
 for <linux-amlogic@lists.infradead.org>; Fri, 03 Sep 2021 05:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=gJPMJG0eBq0LfThk7r5TKlTW6PuUo5YuJeYmkTHTj58=;
 b=oEqxg/iOTlszZ3iRH5PVqRldvdbboM2dzQ7gKRqjzT18OPEIQEd/Q3qVBHwwT09D4b
 e2JONtxnDUD48aWG92h/MCA7hYWGmA0oQxHkja0/YhORIsw9ZgNYkTPPbttA9PEVec+v
 ZoAPSj95MZHHrjNKGJD2VSaU8JRn6St8W/sYO1ffqTk+3a0H1wBg3846gtHfFA3A4uTx
 mqQRLhFDsVT07sSqFCuGb65lCAJQjVatPMEVBVTC/0yn3kJLOlCKqN6SrpsYDqfGk4xI
 TBD+U+oGaDMYJoc/GnP7Pia5NINbJncLwDkDyH2gWzRuqJmyTf+WVtELkbhjzrmGD0nN
 LGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=gJPMJG0eBq0LfThk7r5TKlTW6PuUo5YuJeYmkTHTj58=;
 b=X/l3g3c3YS62hL97/1QhrUWPczErViqzVlrDJMPOO/n80QatkT8ZHcf+FXP03ev73O
 MI4MyQsVhLEPJJIELlT9KzV5NXYfuMvZHT4OlacIGqMBph6z3aW5pu2wQT7fm6fdVagY
 wYiGMSe34LxJv1NPSp36YvUEwDHtWQVkg53OY132HNxF990uJBzjoOy3s8yTLbupgcTS
 RhK6RbcU28v68TU9yMbCLD9PSNfs6ZhmiM5Fu5oLGXekTq9UaNROSBNr/UuhdUHntVd7
 d2uDjalX2mJyFFJtK/kjrbSSQiRUQBbRKkxPqOYiKdWRdNj3dlh7niALFIPVO0dTtVGY
 fhiw==
X-Gm-Message-State: AOAM531URY4akDXGjJR6+GtLdV3LAJ8yK/dyeZdUlJtR3ladc6PzONIa
 bBfdwG+AyJXeW+LKZlS1GyZaog==
X-Google-Smtp-Source: ABdhPJznynnEiJhuoDghrhyxKtbMef3w05fOWOEBMejj8TtxEn25hiIKQsa69zQnrlukD30UeYpgDw==
X-Received: by 2002:a5d:4d8c:: with SMTP id b12mr3703080wru.232.1630671498312; 
 Fri, 03 Sep 2021 05:18:18 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o18sm5481001wrg.23.2021.09.03.05.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 05:18:17 -0700 (PDT)
References: <20210903060035.844758-1-adeep@lexina.in>
 <20210903060035.844758-3-adeep@lexina.in>
User-agent: mu4e 1.6.5; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vyacheslav Bocharov <adeep@lexina.in>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: meson-gxl: add support for JetHub H1
Date: Fri, 03 Sep 2021 14:10:51 +0200
In-reply-to: <20210903060035.844758-3-adeep@lexina.in>
Message-ID: <1jfsulua2e.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_051820_654790_514A136C 
X-CRM114-Status: GOOD (  18.93  )
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


On Fri 03 Sep 2021 at 09:00, Vyacheslav Bocharov <adeep@lexina.in> wrote:

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
>
> Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>  .../meson-gxl-s905w-jethome-jethub-j80.dts    | 241 ++++++++++++++++++
>  2 files changed, 242 insertions(+)
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
> index 000000000000..d67a1bc50f7b
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
> +*/
> +
> +/dts-v1/;
> +
> +#include "meson-gxl.dtsi"
> +
> +/ {
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
> +	sn: sn@14 {
> +		reg = <0x14 0x10>;
> +	};

already defined in meson-gx.dtsi

also, what about a new line between the nodes ?

> +	bt_mac: bt_mac@6 {
> +		reg = <0x6 0x6>;
> +	};
> +	wifi_mac: wifi_mac@C {
> +		reg = <0xc 0x6>;
> +	};
> +	serial: serial@32 {
> +		reg = <0x32 0x20>;
> +	};

Isn't serial and sn the same thing ?

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
> +

Suggest running checkpatch

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


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
