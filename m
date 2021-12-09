Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02DEC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Dec 2021 14:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gOBMFgnjQlRsyL/CABNWFeN7CepI8Gj84K7vZC2fdk0=; b=tLKDtUmtdZ0opeq8VXiinwsvzD
	IChaYyGtTe7T1AFqRUEPvBkMeMKLmKedgCzkGQ54cZTDkXn+IWS07szWwA+JxtJfTT9oBilqKcFs9
	+hq4MctrsvpX9KOYBj9quE/WpVkTT5AX3LoEvfawpn3guroccTOdetJWVIx4SZQ+MUY413VezrZoA
	+vquWgiO6bEnxYhEHTfjH2VOHfOR+87gGTFFeImYCP3UcBx375HakUwJE/3hf1L1E+hF4IZL9TR0/
	/LduMTaDDHvzfVYMt8CoEpSq/GirFkLruuidhwZPSoyjwUU5KOW0cJaAuxoSrc3unKqjgCSk8KZ62
	rxrMHOqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvJyL-00GC0v-2K; Thu, 09 Dec 2021 14:00:33 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvJyH-00GBz5-EV
 for linux-amlogic@lists.infradead.org; Thu, 09 Dec 2021 14:00:31 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so4174240wmd.1
 for <linux-amlogic@lists.infradead.org>; Thu, 09 Dec 2021 06:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+dpt8vUL2anIzLDaCapRKN1qxAb7cNA0NVvcaD2Cl1A=;
 b=B4BMPcLElw/QrGtY3jFrf992/46j3vDTB/JLhlrJt7jUYOkM0nW7nBfmWQFeKxQNgB
 NCtGG4tWK1v+70C7ldf8cQeURrBbdOUJJl5EqNG3EtGMH58nPMsbUAb+vYoOuaxNk1Ee
 0q/fB1BjYccjmx/CRsiAoKQO/KwWWUmHhjAh+eD8sbiZr2dYe4NS8o61vdUsOf4W0dwX
 /F8xtjcMW6/Wb7iLmKsqRxgFWhlZ+Guzh2LmFVuajLLt4PAmMYOV3jX2MAQAjoSbWHSn
 31pgx42+7P06vp3VOvFjQifc+PfyTXGKO+v/KlxX3YbuwHSAOnYJrPByiZWcb0tIsFdk
 6Dqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+dpt8vUL2anIzLDaCapRKN1qxAb7cNA0NVvcaD2Cl1A=;
 b=gsyasvtIXFoHQP1G4PmSVeuNlhV7SYj4Gsm88sowt68fEi/VjrIZywj+2z+D9EXxhe
 W8aYH9lRumfK25rVFijX7pA/z/tYDLH+GX9oZ8Oeo6VwNm8HGZd5MIrVJo10/gGdWZZR
 cUlEM00VHgFYDhotFDaSv7kCzHohUXbVFFbHxu8o3bcSAmccyiP4D86vw4iWl7bch9Q2
 49hi0FTitBNaNzUJqONWr1+XRL2zd9OQyaa3InAqoHRj3NMwOtA4EUeFm7in1ZxirmGp
 nuPj6vwxz5//oJ0r4OQbojz6cUXa8+tn0fB5g+1JhQcKXgERtriq0EmtxsO+Vz8Vg3GZ
 csBA==
X-Gm-Message-State: AOAM532yQda4kBY6sMn0SJjfqjuw+Yrtvl2RqAJyrwRXpUUKe4RuUWZx
 PrIoqQhAuT6LpOhO1FmWGEuCOw==
X-Google-Smtp-Source: ABdhPJwSmvHSUsLNntOs0DWvEN3q46Xb/2KT12wtqetfkw3nuKEinZlZPaedYhQluQ1SlJLPOHH9RA==
X-Received: by 2002:a05:600c:214f:: with SMTP id
 v15mr7228541wml.194.1639058427321; 
 Thu, 09 Dec 2021 06:00:27 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:ee1f:92e9:bcbf:be87?
 ([2001:861:44c0:66c0:ee1f:92e9:bcbf:be87])
 by smtp.gmail.com with ESMTPSA id g198sm6070839wme.23.2021.12.09.06.00.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 06:00:26 -0800 (PST)
Subject: Re: [PATCH V2] arm64: dts: add support for S4 based Amlogic AQ222
To: "xianwei.zhao" <xianwei.zhao@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>
References: <20211208064435.14307-1-xianwei.zhao@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <5ad49e05-3925-08de-af5a-c4b4371f711b@baylibre.com>
Date: Thu, 9 Dec 2021 15:00:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211208064435.14307-1-xianwei.zhao@amlogic.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_060029_542005_A22E732B 
X-CRM114-Status: GOOD (  19.38  )
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

On 08/12/2021 07:44, xianwei.zhao wrote:
> Add basic support for the Amlogic S4 based Amlogic AQ222 board:
> which describe components as follows: CPU, GIC, IRQ, Timer, UART.
> It's capable of booting up into the serial console.
> 
> Signed-off-by: xianwei.zhao <xianwei.zhao@amlogic.com>
> ---
> V1 -> V2: cleaned up coding style, modify CPU affinity of timer interrups,
>           and modify GIC reg defintions.
> ---
>  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>  .../dts/amlogic/meson-s4-s805x2-aq222.dts     | 30 ++++++
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi     | 99 +++++++++++++++++++
>  3 files changed, 130 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 5148cd9e5146..faea74a45994 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -57,3 +57,4 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-c4.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-hc4.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-a1-ad401.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-s4-s805x2-aq222.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> new file mode 100644
> index 000000000000..3b340594a125
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-s4.dtsi"
> +
> +/ {
> +	model = "Amlogic Meson S4 AQ222 Development Board";
> +	compatible = "amlogic,aq222";

According to bindings, it should be: compatible = "amlogic,aq222, "meson,s4";

> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		serial0 = &uart_B;
> +	};
> +
> +	memory@00000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x0 0x0 0x40000000>;
> +	};
> +
> +};
> +
> +&uart_B {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> new file mode 100644
> index 000000000000..d7083c93d3d0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	cpus:cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		CPU0:cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a35","arm,armv8";
> +			reg = <0x0 0x0>;
> +			enable-method = "psci";
> +		};
> +
> +		CPU1:cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a35","arm,armv8";
> +			reg = <0x0 0x1>;
> +			enable-method = "psci";
> +		};
> +
> +		CPU2:cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a35","arm,armv8";
> +			reg = <0x0 0x2>;
> +			enable-method = "psci";
> +		};
> +
> +		CPU3:cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a35","arm,armv8";
> +			reg = <0x0 0x3>;
> +			enable-method = "psci";
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	xtal: xtal-clk {
> +		compatible = "fixed-clock";
> +		clock-frequency = <24000000>;
> +		clock-output-names = "xtal";
> +		#clock-cells = <0>;
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		gic: interrupt-controller@fff01000 {
> +			compatible = "arm,gic-400";
> +			#interrupt-cells = <3>;
> +			#address-cells = <0>;
> +			interrupt-controller;
> +			reg = <0x0 0xfff01000 0 0x1000>,
> +			      <0x0 0xfff02000 0 0x2000>,
> +			      <0x0 0xfff04000 0 0x2000>,
> +			      <0x0 0xfff06000 0 0x2000>;
> +			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> +		};
> +
> +		apb4: apb4@fe000000 {
> +			compatible = "simple-bus";
> +			reg = <0x0 0xfe000000 0x0 0x480000>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
> +
> +			uart_B: serial@7a000 {
> +				compatible = "amlogic,meson-s4-uart",
> +					     "amlogic,meson-ao-uart";

When will you send the serial bindings ?

> +				reg = <0x0 0x7a000 0x0 0x18>;
> +				interrupts = <GIC_SPI 169 IRQ_TYPE_EDGE_RISING>;
> +				status = "disabled";
> +				clocks = <&xtal>, <&xtal>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +			};
> +		};
> +	};
> +};
> 
> base-commit: c5468e3c930d4d2937d3a842a85df0f74e95e152
> 

No need to send a v3 until both bindings have been accepted.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
