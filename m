Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0816AEB64DC
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jul 2023 09:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3MbQc9MYBGqq4BoeIsHE/TEySWFW4VvcAif1nbTtfhY=; b=E6vG1xdU09H54RFGQ4avRLqtD9
	8bdtpbN8nT5FjAybHs6awyyK7qNghq+IpoUIteMEzisD+NSQ+11/czrQbir5l7VckMkKV11UMOeGN
	uzP0TdBDea8QmpXjXlzI1S80NF7CGpXbWxZm8fwJGQHtOEJRDdDyOYu3/7zzfNf/B9gOzKiflp4Jc
	FAWKuDVuziF7giwwahUSSF4uabgbFLLZReG5w7iEtBt+2by4NQPwI6re0wmlhbo/cKM5P41WQ+y/0
	Dcv/r+nEWmD3egrv+OlFA/IXZL1/91ZSmMOnB+yEk00SSP85zL5YkSt2156pblt2R//xwA0IGfr1W
	uhI4b3QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGFzr-009xYS-0Q;
	Mon, 03 Jul 2023 09:37:27 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGFzo-009xW2-0u
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Jul 2023 09:37:25 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fba8e2aa52so50681165e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 03 Jul 2023 02:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688377040; x=1690969040;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ihTbCun4m+ho6AEDQkdBj4vFa1yLDFnjMiegSaF3Lgs=;
        b=mSz2kD+vUyNEVyLP8wUfifCReANU5u8zb/wrrVLVlq8q34v+Oi//s/VrAvKM9rkKUu
         7r8KaNcCMe2oIOgIi5OEf+tcWy9W6mYyMVA4CNtrmpazBKHvEg6GGDnPgEAOXaFPDrC9
         pLSnvIp8AHopksIrtktua6FoGTIXggbr3QHH9LUbG0WHMHPP0KV0fOE0cjHzvdoE2g8X
         o6xo874ZWEzlu+WX9oRkQubFUYVxrcIgrf+B9nQ7kYG0EKHg9tEo4XhBcwSAZZk2kVYB
         gDCXdJtOwg4ebpDNYpDkCGdZkBSdKmY1Qfn3rjYjk/1IjRHOG7LK7wdXjaDTTlHbNKh+
         eJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688377040; x=1690969040;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ihTbCun4m+ho6AEDQkdBj4vFa1yLDFnjMiegSaF3Lgs=;
        b=iCF/pYRr+Qh6JtLm6x5AKxNpypIEZSi1QS2AVl6mce0cDmEHZHQMlBEYj644PsJowr
         ZiQyUev1NGA9i3syZ83EstyX/IQShaitiOZK2ZvvlgPVsk3TD6zWtDYyQHJ/LtquOY27
         W+mPnZ6nX+MFcBdmY+px40nkqJ951K43o10dm7tLFyJJkuVU6EcEgyH6sGyI7l5Qt66P
         0l6ya/FArEiH9gBu+6PDykEPXqRYG7RAxvmSuPZONW234f71cyhmoY1pDum9qNasxWnv
         sivb3cjAck18sX690x9hex4cAgkaSRrzkmKKsBZ9LuS0ykUduzkCOBVPNZjXBIrxBtX0
         qsow==
X-Gm-Message-State: ABy/qLZi3kKyANUY+jnq+sAZ/8Sc6yf0FvaEkMTC2tOiqjhbE36xp5F7
	MGFAVk/UTT8crs6ycpkwO1mtgA==
X-Google-Smtp-Source: APBJJlESbVf7A61/9x58C6tfg8DKWV6DOYbErFAGLmhnW+1WnCwGjUBpm+ka4jPC9NgLRnvzYVc0nw==
X-Received: by 2002:a05:600c:c8:b0:3fb:c990:3b2 with SMTP id u8-20020a05600c00c800b003fbc99003b2mr7065191wmm.34.1688377040397;
        Mon, 03 Jul 2023 02:37:20 -0700 (PDT)
Received: from [192.168.7.21] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id z6-20020a7bc7c6000000b003fbda7d2d41sm1777767wmk.48.2023.07.03.02.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 02:37:19 -0700 (PDT)
Message-ID: <29c1a0ed-f09b-aeaf-8e2f-206c10ec2ad8@linaro.org>
Date: Mon, 3 Jul 2023 11:37:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 4/4] arm64: dts: amlogic-t7-a311d2-khadas-vim4: add
 initial device-tree
Content-Language: en-US
To: Lucas Tanure <tanure@linux.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Nick <nick@khadas.com>, Artem <art@khadas.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20230629073419.207886-1-tanure@linux.com>
 <20230629073419.207886-5-tanure@linux.com>
Organization: Linaro Developer Services
In-Reply-To: <20230629073419.207886-5-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_023724_320557_70EAA8E8 
X-CRM114-Status: GOOD (  18.36  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 29/06/2023 09:34, Lucas Tanure wrote:
> The Khadas VIM4 uses the Amlogic A311D2 SoC, based on the Amlogic T7 SoC
> family, on a board with the same form factor as the VIM3 models.
> 
> - 8GB LPDDR4X 2016MHz
> - 32GB eMMC 5.1 storage
> - 32MB SPI flash
> - 10/100/1000 Base-T Ethernet
> - AP6275S Wireless (802.11 a/b/g/n/ac/ax, BT5.1)
> - HDMI 2.1 video
> - HDMI Input
> - 1x USB 2.0 + 1x USB 3.0 ports
> - 1x USB-C (power) with USB 2.0 OTG
> - 3x LED's (1x red, 1x blue, 1x white)
> - 3x buttons (power, function, reset)
> - M2 socket with PCIe, USB, ADC & I2C
> - 40pin GPIO Header
> - 1x micro SD card slot
> 
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>   .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts |  54 ++++++
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 155 ++++++++++++++++++
>   3 files changed, 210 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>   create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index cd1c5b04890a..166fec1e4229 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -1,4 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_MESON) += amlogic-t7-a311d2-khadas-vim4.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-a1-ad401.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j100.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j110-rev-2.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> new file mode 100644
> index 000000000000..fffdab96b12e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2022 Wesion, Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "amlogic-t7.dtsi"
> +
> +/ {
> +	model = "Khadas vim4";
> +	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
> +
> +	aliases {
> +		serial0 = &uart_a;
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x0 0x2 0x0>; /* 8 GB */
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* 3 MiB reserved for ARM Trusted Firmware (BL31) */
> +		secmon_reserved: secmon@5000000 {
> +			reg = <0x0 0x05000000 0x0 0x300000>;
> +			no-map;
> +		};
> +
> +		/* 32 MiB reserved for ARM Trusted Firmware (BL32) */
> +		secmon_reserved_bl32: secmon@5300000 {
> +			reg = <0x0 0x05300000 0x0 0x2000000>;
> +			no-map;
> +		};
> +	};
> +
> +	xtal: xtal-clk {
> +		compatible = "fixed-clock";
> +		clock-frequency = <24000000>;
> +		clock-output-names = "xtal";
> +		#clock-cells = <0>;
> +	};
> +
> +};
> +
> +&uart_a {
> +	status = "okay";
> +	clocks = <&xtal>, <&xtal>, <&xtal>;
> +	clock-names = "xtal", "pclk", "baud";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> new file mode 100644
> index 000000000000..1423d4a79156
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -0,0 +1,155 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus {
> +		#address-cells = <0x2>;
> +		#size-cells = <0x0>;
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu100>;
> +				};
> +				core1 {
> +					cpu = <&cpu101>;
> +				};
> +				core2 {
> +					cpu = <&cpu102>;
> +				};
> +				core3 {
> +					cpu = <&cpu103>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +				core2 {
> +					cpu = <&cpu2>;
> +				};
> +				core3 {
> +					cpu = <&cpu3>;
> +				};
> +			};
> +		};
> +
> +		cpu100: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x100>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu101: cpu@101{
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x101>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu102: cpu@102 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x102>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu103: cpu@103 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x103>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a73";
> +			reg = <0x0 0x0>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a73";
> +			reg = <0x0 0x1>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu2: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a73";
> +			reg = <0x0 0x2>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu3: cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a73";
> +			reg = <0x0 0x3>;
> +			enable-method = "psci";
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	sm: secure-monitor {
> +		compatible = "amlogic,meson-gxbb-sm";
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
> +			      <0x0 0xfff02000 0 0x0100>;
> +			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
> +		};
> +
> +		apb4: bus@fe000000 {
> +			compatible = "simple-bus";
> +			reg = <0x0 0xfe000000 0x0 0x480000>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
> +
> +			uart_a: serial@78000 {
> +				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
> +				reg = <0x0 0x78000 0x0 0x18>;
> +				interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> +				status = "disabled";
> +			};
> +		};
> +
> +	};
> +};
> --
> 2.41.0
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
