Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A57CC433E2
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 16:47:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B785E20809
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 16:47:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O2zu6XUz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eGdK2SZE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B785E20809
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5Zt/2yWG4qtFL15usKPuVpPcicNqFxQOyCpe7RJiOk8=; b=O2zu6XUzOWrnjvnhMyoLuMXDU
	GevzwlxYol5tmFtiiwrv3XXxX9EUeOQ7pt04SmPU1fUuZtS7p9e3ZSTKqH/SVAfxiY0q+9EVYJaWn
	01olizYFpCzg846uoC3ubVxnxIm04uNxn26AcTqbCMvESG6rB7vueKx080zRqgCYt+DcYgZAlMcsM
	kmhuTEr6PPrI0NZU0FtO9ZTWFQ5CRx3qfOShdV9rzzSt/uUWMfUqKBbiHmRyJcsHvvlkgk8ikpKJr
	q5E4W2N7eFlQF3PJlA58abnYMKMUfOQKPV+RFs8qypKxrQpt6TCH8nJh8XV2vDp7yc9OxIDKVETlj
	nA6sWhY5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIE6i-0006Qi-KP; Tue, 15 Sep 2020 16:47:04 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIE6f-0006Q6-QD
 for linux-amlogic@lists.infradead.org; Tue, 15 Sep 2020 16:47:03 +0000
Received: by mail-ej1-x644.google.com with SMTP id e23so6059696eja.3
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2020 09:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=2eJ8lWRTrfB3Zw5Bk60TqvII5ysIe8z02iSViAYeC+8=;
 b=eGdK2SZEzPQbHVv2tWHIkDKKBmxZVjHiQYJkicWhidIEkYrbijrJM0gHhcbUPnc3lH
 ujxeLIM0T50m9R3VytIncl7TQBuHRVqwrJuidlNXW2l8jjCe690ZRVc+57BbHFYvSnbM
 VS9DnZ1fzFGAVX0Z5eNKvBXO0wtrU96JT65SOf5ox3bRzj0i3nEQ2ZlxxWJmqwZ9s4H/
 pB9N969NaRc0KSa2XcMtA6RsZpUyz0BGFGsW4gs1Ox2kCK3N04m/Di9QG7yG2PtzjwjA
 9wOqjDcgYO3Gyjm6cz/qLtqQ20DpIiiZS7S7Poq3xwy4ghpO8ZLznjrVKcUXjCXh+aNS
 aiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=2eJ8lWRTrfB3Zw5Bk60TqvII5ysIe8z02iSViAYeC+8=;
 b=np1Ki6fG7JstwgzzY6mNtJ5A3WJR/SMIPNhf7tEjott9NPT/Khw2FpxFIkOQaX0ojh
 1SfhjS+pqQcQDEk5b/j/Er0dPsZ/S//+Fs45exIUfoLN8l4vs09ih/3rrGzR4Vv8Hygl
 SjhX50jVlWMSNZj2b9XpFg4LXaijVWK4pubfJIU9au3uWYCjJEZRg5QgsNoVtrvx0EPS
 3BE5n4va5UZ1dThpCjjKfMmIac8LaB2VfCcVOPGCwSkBL51/nmej3bS6jkbU2r6qtXuS
 sI9NKKpEoUWRsSF10gCU6Z8trck7LgdVQFl2p/0qiThzuyUlACbo6CAo3KriwAKZxxoq
 FaWA==
X-Gm-Message-State: AOAM5323EL5W7F+8H48RhFvXuL0VL1tTpMqMAlD6EVWu0uTiIvb1hYdi
 o0bDZ8vopQZC2CDooQMlt9SZ9w==
X-Google-Smtp-Source: ABdhPJywB5UNVhz4v66VP3MRgtHNkfWSote+so73xe4tP6IBiaX1z3MFBwx6Y+cTVq1OGzBi+N2EpQ==
X-Received: by 2002:a17:906:2659:: with SMTP id
 i25mr20479860ejc.16.1600188420277; 
 Tue, 15 Sep 2020 09:47:00 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id r8sm11965094edy.87.2020.09.15.09.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 09:46:59 -0700 (PDT)
References: <20200915141921.57258-1-jbrunet@baylibre.com>
 <20200915141921.57258-3-jbrunet@baylibre.com>
 <4f67512c-51c7-77ae-af63-4bdd8867c313@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 2/2] arm64: dts: meson: initial support for aml-s905x-cc v2
In-reply-to: <4f67512c-51c7-77ae-af63-4bdd8867c313@baylibre.com>
Date: Tue, 15 Sep 2020 18:46:55 +0200
Message-ID: <1jy2lbt2bk.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_124701_914323_5F1F9692 
X-CRM114-Status: GOOD (  17.80  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Tue 15 Sep 2020 at 16:30, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Hi,
>
> On 15/09/2020 16:19, Jerome Brunet wrote:
>> Add initial support for the libretech aml-s905x-cc (Le Potato) v2
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>>  .../meson-gxl-s905x-libretech-cc-v2.dts       | 318 ++++++++++++++++++
>>  2 files changed, 319 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
>> 
>> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
>> index 4e2239ffcaa5..be5277b7fbf4 100644
>> --- a/arch/arm64/boot/dts/amlogic/Makefile
>> +++ b/arch/arm64/boot/dts/amlogic/Makefile
>> @@ -24,6 +24,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805x-libretech-ac.dtb
>>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-hwacom-amazetv.dtb
>>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-khadas-vim.dtb
>>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc.dtb
>> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc-v2.dtb
>>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
>>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
>>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p230.dtb
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
>> new file mode 100644
>> index 000000000000..675eaa87963e
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
>> @@ -0,0 +1,318 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (c) 2020 BayLibre, SAS.
>> + * Author: Jerome Brunet <jbrunet@baylibre.com>
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/leds/common.h>
>> +#include <dt-bindings/sound/meson-aiu.h>
>> +
>> +#include "meson-gxl-s905x.dtsi"
>> +
>> +/ {
>> +	compatible = "libretech,aml-s905x-cc-v2", "amlogic,s905x",
>> +		     "amlogic,meson-gxl";
>> +	model = "Libre Computer AML-S905X-CC V2";
>> +
>> +	aliases {
>> +		serial0 = &uart_AO;
>> +		ethernet0 = &ethmac;
>> +		spi0 = &spifc;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +
>> +	emmc_pwrseq: emmc-pwrseq {
>> +		compatible = "mmc-pwrseq-emmc";
>> +		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
>> +	};
>> +
>> +	hdmi-connector {
>> +		compatible = "hdmi-connector";
>> +		type = "a";
>> +
>> +		port {
>> +			hdmi_connector_in: endpoint {
>> +				remote-endpoint = <&hdmi_tx_tmds_out>;
>> +			};
>> +		};
>> +	};
>> +
>> +	leds {
>> +		compatible = "gpio-leds";
>> +
>> +		led-blue {
>> +			color = <LED_COLOR_ID_BLUE>;
>> +			function = LED_FUNCTION_STATUS;
>> +			gpios = <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
>> +			linux,default-trigger = "heartbeat";
>> +			panic-indicator;
>> +		};
>> +
>> +		led-green {
>> +			color = <LED_COLOR_ID_GREEN>;
>> +			function = LED_FUNCTION_DISK_ACTIVITY;
>> +			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_HIGH>;
>> +			linux,default-trigger = "disk-activity";
>> +		};
>> +	};
>> +
>> +	memory@0 {
>> +		device_type = "memory";
>> +		reg = <0x0 0x0 0x0 0x80000000>;
>> +	};
>> +
>> +	ao_5v: regulator-ao_5v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "AO_5V";
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		vin-supply = <&dc_in>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	dc_in: regulator-dc_in {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "DC_IN";
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		regulator-always-on;
>> +	};
>> +
>> +
>> +	vcck: regulator-vcck {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "VCCK";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		vin-supply = <&ao_5v>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	vcc_card: regulator-vcc_card {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "VCC_CARD";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		vin-supply = <&vddio_ao3v3>;
>> +
>> +		gpio = <&gpio GPIOCLK_1 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +	};
>> +
>> +	vcc5v: regulator-vcc5v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "VCC5V";
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		vin-supply = <&ao_5v>;
>> +
>> +		gpio = <&gpio GPIOH_3 GPIO_OPEN_DRAIN>;
>> +	};
>> +
>> +	vddio_ao3v3: regulator-vddio_ao3v3 {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "VDDIO_AO3V3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		vin-supply = <&ao_5v>;
>> +		regulator-always-on;
>> +	};
>> +
>> +
>> +	vddio_card: regulator-vddio-card {
>> +		compatible = "regulator-gpio";
>> +		regulator-name = "VDDIO_CARD";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
>> +		gpios-states = <0>;
>> +
>> +		states = <3300000 0>,
>> +			 <1800000 1>;
>> +
>> +		regulator-settling-time-up-us = <200>;
>> +		regulator-settling-time-down-us = <50000>;
>> +	};
>> +
>> +	vddio_ao18: regulator-vddio_ao18 {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "VDDIO_AO18";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +		vin-supply = <&vddio_ao3v3>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	vcc_1v8: regulator-vcc_1v8 {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "VCC 1V8";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +		vin-supply = <&vddio_ao3v3>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	sound {
>> +		compatible = "amlogic,gx-sound-card";
>> +		model = "GXL-LIBRETECH-S905X-CC-V2";
>> +		assigned-clocks = <&clkc CLKID_MPLL0>,
>> +				  <&clkc CLKID_MPLL1>,
>> +				  <&clkc CLKID_MPLL2>;
>> +		assigned-clock-parents = <0>, <0>, <0>;
>> +		assigned-clock-rates = <294912000>,
>> +				       <270950400>,
>> +				       <393216000>;
>> +		status = "okay";
>> +
>> +		dai-link-0 {
>> +			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
>> +		};
>> +
>> +		dai-link-1 {
>> +			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
>> +			dai-format = "i2s";
>> +			mclk-fs = <256>;
>> +
>> +			codec-0 {
>> +				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
>> +			};
>> +		};
>> +
>> +		dai-link-2 {
>> +			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
>> +
>> +			codec-0 {
>> +				sound-dai = <&hdmi_tx>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +
>> +&aiu {
>> +	status = "okay";
>> +};
>> +
>> +&cec_AO {
>> +	status = "okay";
>> +	pinctrl-0 = <&ao_cec_pins>;
>> +	pinctrl-names = "default";
>> +	hdmi-phandle = <&hdmi_tx>;
>> +};
>> +
>> +
>> +&ethmac {
>> +	status = "okay";
>> +};
>> +
>> +&internal_phy {
>> +	pinctrl-0 = <&eth_link_led_pins>, <&eth_act_led_pins>;
>> +	pinctrl-names = "default";
>> +};
>> +
>> +&ir {
>> +	status = "okay";
>> +	pinctrl-0 = <&remote_input_ao_pins>;
>> +	pinctrl-names = "default";
>> +};
>> +
>> +&hdmi_tx {
>> +	status = "okay";
>> +	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
>> +	hdmi-supply = <&vcc5v>;
>> +	pinctrl-names = "default";
>> +};
>> +
>> +&hdmi_tx_tmds_port {
>> +	hdmi_tx_tmds_out: endpoint {
>> +		remote-endpoint = <&hdmi_connector_in>;
>> +	};
>> +};
>> +
>> +&saradc {
>> +	status = "okay";
>> +	vref-supply = <&vddio_ao18>;
>> +};
>> +
>> +/* SD card */
>> +&sd_emmc_b {
>> +	pinctrl-0 = <&sdcard_pins>;
>> +	pinctrl-1 = <&sdcard_clk_gate_pins>;
>> +	pinctrl-names = "default", "clk-gate";
>> +
>> +	bus-width = <4>;
>> +	cap-sd-highspeed;
>> +	sd-uhs-sdr12;
>> +	sd-uhs-sdr25;
>> +	sd-uhs-sdr50;
>> +	sd-uhs-ddr50;
>> +	max-frequency = <100000000>;
>> +	disable-wp;
>> +
>> +	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
>> +
>> +	vmmc-supply = <&vcc_card>;
>> +	vqmmc-supply = <&vddio_card>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +/* eMMC */
>> +&sd_emmc_c {
>> +	pinctrl-0 = <&emmc_pins>;
>> +	pinctrl-1 = <&emmc_clk_gate_pins>;
>> +	pinctrl-names = "default", "clk-gate";
>> +
>> +	bus-width = <8>;
>> +	cap-mmc-highspeed;
>> +	mmc-hs200-1_8v;
>> +	max-frequency = <200000000>;
>> +	disable-wp;
>> +
>> +	mmc-pwrseq = <&emmc_pwrseq>;
>> +	vmmc-supply = <&vddio_ao3v3>;
>> +	vqmmc-supply = <&vcc_1v8>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&spifc {
>> +	status = "okay";
>> +	pinctrl-0 = <&nor_pins>;
>> +	pinctrl-names = "default";
>> +
>> +	nor_4u1: spi-flash@0 {
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		compatible = "jedec,spi-nor";
>> +		reg = <0>;
>> +		spi-max-frequency = <3000000>;
>> +	};
>> +};
>> +
>> +&uart_AO {
>> +	status = "okay";
>> +	pinctrl-0 = <&uart_ao_a_pins>;
>> +	pinctrl-names = "default";
>> +};
>> +
>> +&usb {
>> +	status = "okay";
>> +	dr_mode = "host";
>> +};
>> +
>> +&usb2_phy0 {
>> +	pinctrl-names = "default";
>> +	phy-supply = <&vcc5v>;
>> +};
>> +
>> +&usb2_phy1 {
>> +	phy-supply = <&vcc5v>;
>> +};
>> 
>
> I'm pretty sure most of this can be shared with the v1 via a common dtsi,
> with only the differences this v2 dts (spifc, and ?).

... Sound card, CVBS, several headers ...
The PCB is actually closer to "la frite" than the v1.

I'm considering a common dtsi, possibly including the v1 and la frite.
I'm not yet entirely convinced it is such a good idea, especially
considering all the headers which don't show up (yet) in DT and are
vastly different between v1 and v2. In any case, doing so will require
some clean up in the existing DTs.

This does not need to be done for the start and can considered later on.

> Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
