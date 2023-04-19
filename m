Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B02C77B73
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Apr 2023 10:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Di94i8MBa9TndrLKO1Az2T+d2iJ1kbt+xFU35fSWHOc=; b=3vpfm1ZMN6gefwJuCpnG6Prr5J
	4aMS5Hjq+vImYeecowveotKL8dD8Ct+iSIDHTXOIFjNg7gvuYAPnM1gwRrnVPaAbcj8ckE2yyAdmX
	H9O5fgMv4Efr7PbfA5iPAkrw/QuA5mz9idWtCPjmErw+REOOtbZ/xjX4aawEunYS/44xHQeHBXcZo
	+lNM5gtk+JCSMVbxrdE6cgjApHuTXsHWex8vt5U4f7f48TUu5fhwn0P+tap3k5R2y1tTD1noLl//C
	lo85S162dWHkXvLPq1dN6aRpl26J1vr2Pb47Ws3HQ8J97YIkmqwWdoVsjQM1hUHWYtX1kSmMLPpeF
	HnKo34kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp4y7-004tLO-2r;
	Wed, 19 Apr 2023 10:23:19 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp4y5-004tK6-0k
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Apr 2023 10:23:18 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-2f62b1385e3so1949928f8f.2
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Apr 2023 03:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681899794; x=1684491794;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3ioAyY8RGrXbjvCXiCKBcEBzSxxEkaY/2GP7GDNgr34=;
        b=nsrGj2Ho0buyoG7/Xfags+aOJIgs3ohO9hSfyzyLrrWZZ2OWBJZ5CuWGclXKPBau3c
         KDa3qmjifYUMDsRJCrhk6x8qAkRV8kIstzFLEiYN38upAyNjG++iRUhLG1bJ/SUp8Ue7
         2WoHcgBBPPOU8uODXDGjtwVuUW45rPiOf+NfS58TvGlyqaW4DZ9N/VWC38V2a1Mo0owh
         Wk+LjKx2MuNCg4hGSgq/Hcyo+jyYqbFyHx2f+KajU0kxnSDbJGpB5wlDrkX/fbxQcMvH
         rBeI0YZrIt17/LLJTMK4VrzjV2l2gJp82Lmek6UVPKmGdh+odM0rGjbwolePJzf0f7xN
         AH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681899794; x=1684491794;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ioAyY8RGrXbjvCXiCKBcEBzSxxEkaY/2GP7GDNgr34=;
        b=I69C/+kIgxTwAcyaxR6igOOO1t4EjyRxM4xUBv64FvVMxL4cg41z06u08bk1qulZpH
         yhUznWiW8EqFnkwyre0ray71M3wtzqyS4oXHabEMrR1xIC29FqR9ebSLAypTkfdndL/H
         1SBgxqpt1JL6To/4jB5FfdlTNVQyMMqXIpgbdhcwcOEgwPF+tOun7wvGZa0veKmduOLG
         /Kr1m60eBomlo84FFOo9w/Gneo2nHBRhDlFfABa/OYS5JpEH6BuHeLVSI1oIi0JQaUyv
         zKimlik7uNcFxMXmzdumx+8fe16F5NzF9htwQRKVA1ZY7ra1hsQexzW0Zhbf8K4UAFVb
         LdBw==
X-Gm-Message-State: AAQBX9dHXZjKPuVZElWR5qiJsSlndgeO7xIWABSNbTf4eSX9ISmZkDOh
	5KqrZSQi5Pxr5ql11Lcura9tkg==
X-Google-Smtp-Source: AKy350bpFF4pDkcxxEFnCc/zMJXchxri6m/i+bBHHoWotPzN9sJJxDDT0raJLXIquFUePmwsubeDsw==
X-Received: by 2002:a05:6000:1a52:b0:2f6:c5bd:ba13 with SMTP id t18-20020a0560001a5200b002f6c5bdba13mr3763450wry.42.1681899794695;
        Wed, 19 Apr 2023 03:23:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:1360:9fbb:dfd6:2db4? ([2a01:e0a:982:cbb0:1360:9fbb:dfd6:2db4])
        by smtp.gmail.com with ESMTPSA id j13-20020a5d452d000000b002fe33e42c85sm2952144wra.72.2023.04.19.03.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 03:23:14 -0700 (PDT)
Message-ID: <022c40f9-b102-8fbb-4d9a-55b8f1c520ad@linaro.org>
Date: Wed, 19 Apr 2023 12:23:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH 2/2] arm64: dts: add support for C3 based Amlogic
 AW409
Content-Language: en-US
To: =Xianwei Zhao <xianwei.zhao@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230419073834.972273-1-xianwei.zhao@amlogic.com>
 <20230419073834.972273-3-xianwei.zhao@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <20230419073834.972273-3-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_032317_266690_B1C513A2 
X-CRM114-Status: GOOD (  19.41  )
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

On 19/04/2023 09:38, =Xianwei Zhao wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Amlogic C3 is an advanced edge AI processor designed for smart IP camera
> applications.
> 
> Add basic support for the C3 based Amlogic AW409 board, which describes
> the following components: CPU, GIC, IRQ, Timer, UART. It's capable of
> booting up into the serial console.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>   .../amlogic/amlogic-c3-c302x-aw409-256m.dts   | 30 +++++++
>   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi   | 87 +++++++++++++++++++
>   3 files changed, 118 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409-256m.dts
>   create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index cd1c5b04890a..d2b5d0d750bc 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -74,3 +74,4 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-hc4.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air-gbit.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
> +dtb-$(CONFIG_ARCH_AMLIPC) += amlogic-c3-c302x-aw409-256m.dtb

It's pointless to only build the c3 DTs here.

Neil

> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409-256m.dts b/arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409-256m.dts
> new file mode 100644
> index 000000000000..38ca98a32181
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409-256m.dts
> @@ -0,0 +1,30 @@
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
> +		serial0 = &uart_B;
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x0 0x0 0x10000000>;
> +	};
> +
> +};
> +
> +&uart_B {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> new file mode 100644
> index 000000000000..c69072ac57f5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> @@ -0,0 +1,87 @@
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
> +
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
> +				compatible = "amlogic,meson-g12a-uart";
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


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
