Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607F3C7EE22
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 May 2023 08:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpULmIrgs6tH1oDelWyHxGLGkQL2MB4HLx6gCNR+WY4=; b=RsqbpnSXzlw3wLFAQd1jTz19yQ
	fHVqNyI9Jmx3IFGEjBSO1UrbaxXS0VpbBzoOICBfnRUtmSTMT887L+udppm+gjAK7pXw4QTNCAF6Z
	HPIy2X8GbmV4ArJrcmuqLxsRfzr8qY8cRZ9aWC7koQglNkP9p6i4borRqjGpwGfchG0r8xiz83j+5
	X9JKfK/SebeE8EDQjN1bRwumkkFKhXKIwgvfXgVe1/2TfwF/un0w7Dew9cALy8JqWlL2PPqogFrzF
	xqB4HkOXH+si/0ZfVfcIP4eUhLAF8/jhMvm1Di0QoSQfke5B9oea8M6KnliNnairyu/ancuLZFD+g
	P2oe/6FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px1pb-008Fpc-2P;
	Thu, 11 May 2023 08:39:23 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px1pY-008For-1v
	for linux-amlogic@lists.infradead.org;
	Thu, 11 May 2023 08:39:22 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3078cc99232so5229943f8f.3
        for <linux-amlogic@lists.infradead.org>; Thu, 11 May 2023 01:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683794357; x=1686386357;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TBlErrl7gnhIiZO37qzjtqIBcMLNUDzoJ4wQ0ZgBLGw=;
        b=kTDgVm+zIAYKB5YYNqGxK+poZ+fA+0wO1SHPlF1X/qFkaxdX1AuAwOipB4S4e3M2MN
         W7UAzSh1cmQUYrpmruLq4m5Kfxcc8AbVI8GaW5+9JKS7yIJ8IsAH+zX6oNzSn4TXM9ro
         Yqjfo/68312Ekw7V5FNGbF7L9rjBIOMZp8sox89f5E6+IVhSflAANHoJ8L5Tq6DNPKr3
         lnTGtkImYFCkpA9LcbFvQPElRFgthIvdtcGFcuaEyxn43OXF5h5bRm692gK2oW0jtYOw
         woLbVMng6DYG+OuqOcVqDjLjmRepE7PdWU2EI/ZHB/mVaOHBLgqHsS4QczWwa3De7gcy
         iwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683794357; x=1686386357;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TBlErrl7gnhIiZO37qzjtqIBcMLNUDzoJ4wQ0ZgBLGw=;
        b=gzNmoThnLr8Mu5CnfYuel8/bsZ+s9rI/7iNpURSclTSVuZ7NKuyyJwygcEMtkXJHL+
         lGF9SIhgvte1mhl3zUwPTvvw9NdGMG1ssT4Z95xo84MrDQpwCjbV3KrpcndwM3S+MSHO
         hICQnDutN2LtNOz0B6j3UG9/9WP8JLIf9og8ITIxEKdMvAhW8RXjQhYp1zFywq/j7EkZ
         cbzpDCM+6K7rANa8l8526DwA/H4H0Ndbygj6p1OOpeIv/9Bc+CUjztHqQF2gHRo0uZdR
         Bh+AOTTCHupHYtfiHIGPBS2n0aa6uY+yHJVClzCkF5ujWRWiAAUuA6C8NDvy+O5VdEUY
         46ow==
X-Gm-Message-State: AC+VfDzofxB/vXTwseOtedptr29lQ3rg4e3Rd6CMwGiw3yJ0btXEX1DV
	arh5zf97xUfyVq2BfXnMzAmykA==
X-Google-Smtp-Source: ACHHUZ4Zj10EOYnAvH4Gr3kJOCqNVm6j4etcsCQ8ktADUB/UwHDdmfdkqsRgFiHiREwVtFpbTlrEqA==
X-Received: by 2002:adf:e943:0:b0:306:2cf5:79dc with SMTP id m3-20020adfe943000000b003062cf579dcmr16913427wrn.35.1683794357482;
        Thu, 11 May 2023 01:39:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:182d:9e6c:b8ff:5a99? ([2a01:e0a:982:cbb0:182d:9e6c:b8ff:5a99])
        by smtp.gmail.com with ESMTPSA id h5-20020a1ccc05000000b003ee5fa61f45sm24910493wmb.3.2023.05.11.01.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 01:39:17 -0700 (PDT)
Message-ID: <b2bdb00f-63de-40a9-ebe6-32f83607b5d8@linaro.org>
Date: Thu, 11 May 2023 10:39:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH V4] arm64: dts: add support for C3 based Amlogic AW409
Content-Language: en-US
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230510091129.151669-1-xianwei.zhao@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <20230510091129.151669-1-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_013920_634928_2857ED10 
X-CRM114-Status: GOOD (  19.91  )
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

Hi,

On 10/05/2023 11:11, Xianwei Zhao wrote:
> Amlogic C3 is an advanced edge AI processor designed for smart IP camera
> applications.
> 
> Add basic support for the C3 based Amlogic AW409 board, which describes
> the following components: CPU, GIC, IRQ, Timer, UART. It's capable of
> booting up into the serial console.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Link: https://lore.kernel.org/all/20230407102704.1055152-1-kelvin.zhang@amlogic.com
> Link: https://lore.kernel.org/all/20230307222651.2106615-2-martin.blumenstingl@googlemail.com
> 
> V3 -> V4: Move Link under the --- before the changelog.
> V2 -> V3: Remove '256m' from filename;
>            Keep alphabetical order of Makefile.
> V1 -> V2: Remove new arch, and use ARCH_MESON;
>            Modify node name, and delete superfluous blank line.
> ---
>   arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>   .../dts/amlogic/amlogic-c3-c302x-aw409.dts    | 29 +++++++
>   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi   | 86 +++++++++++++++++++
>   3 files changed, 116 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dts
>   create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index cd1c5b04890a..6f61798a109f 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -1,4 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_MESON) += amlogic-c3-c302x-aw409.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-a1-ad401.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j100.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j110-rev-2.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dts b/arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dts
> new file mode 100644
> index 000000000000..edce8850b338
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dts
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "amlogic-c3.dtsi"
> +
> +/ {
> +	model = "Amlogic C302 aw409 Development Board";
> +	compatible = "amlogic,aw409", "amlogic,c3";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		serial0 = &uart_b;
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x0 0x0 0x10000000>;
> +	};
> +};
> +
> +&uart_b {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> new file mode 100644
> index 000000000000..93b335aef605
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a35";
> +			reg = <0x0 0x0>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a35";
> +			reg = <0x0 0x1>;
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
> +		apb4: bus@fe000000 {
> +			compatible = "simple-bus";
> +			reg = <0x0 0xfe000000 0x0 0x480000>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
> +
> +			uart_b: serial@7a000 {
> +				compatible = "amlogic,meson-g12a-uart";

This should be:

	compatible = "amlogic,meson-g12a-uart", "amlogic,meson-gx-uart"

to match the amlogic,meson-uart.yaml bindings.

Please run :
make CHECK_DTBS=1 amlogic/amlogic-c3-c302x-aw409.dtb

With that fixed, please add on v5:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

> +				reg = <0x0 0x7a000 0x0 0x18>;
> +				interrupts = <GIC_SPI 169 IRQ_TYPE_EDGE_RISING>;
> +				status = "disabled";
> +				clocks = <&xtal>, <&xtal>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +			};
> +
> +		};
> +	};
> +};
> 
> base-commit: ae68fb187b59bc8645974320808ab2d7c41b1833


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
