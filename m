Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E034C54E58
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Mar 2024 10:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jWKaoCU66IjAmfAsnJG2X32yLEd0qxkx1EmqLYf8AQg=; b=3Wdry9Mxes7xH6
	Z2IpAHW9PI+q74IocbtcpA+1GlDvUJ6tyHselfZPMeAiCFe57CpmL1AZLfosWxAoz+E4MpA87V5oo
	VI1Kw9nzwQLM1PbE9g/228mQRO9X2/HA/9PUAGLs6U7pm5QP8UaGxWAF48FajnzPIDTUjiFQSX046
	s7HSw6XWCVHwNTyeeaqxYrSw/dfMevb0AW6QwTEYB3sMRonD24qPXUWdUE0fQiZZM/mNm3uV770DN
	mPom33TtgQfQsMzpT4+N3WIJFbko1QCczNPIrS2L96RsMUSk0NoiOTXyiea9Bd2gEiehLg51p1p3j
	1nZAj5yOj1RTDECV6rig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjyys-00000005FqY-1ZnJ;
	Tue, 12 Mar 2024 10:03:34 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjyyn-00000005Fnz-2iVE
	for linux-amlogic@lists.infradead.org;
	Tue, 12 Mar 2024 10:03:32 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-412f1961101so40342835e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 12 Mar 2024 03:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710237806; x=1710842606; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=+6NBK9GZFZcA1mqhksqU9TzRXZJpQpDT2fBbPUtZjzY=;
        b=ZakBzM2Ejry28biTzGHFABxw4ETVOaBUSs+ZKJ0vnL0NgqNGC2381+8cgI1txmXkqM
         mnxiT8moWusfO5yYfUPp4ICWBIi8VHY/OMpC8+09UfPA8tYFQC2geub0p6eadZrvEg4e
         Dlac5ZhTfWCXAs/6sCUtOwR1RBMkBO5A3muUMh5z2U3GW96PqWxHzdhsLPYTXJlxI2T4
         fNLJbQVbiaHCDSrNlqZ8lQ22DMTQlLoVjDCwk62fpvpfz9uf/QTHrwSYFiW/eDUwWunk
         Pf7tDirwIsYU7tcDQj47mAfA30mK0boZPcn33Ut96stTvDgCdirlhkpaGaRS8Qc6MSHv
         45lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710237806; x=1710842606;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6NBK9GZFZcA1mqhksqU9TzRXZJpQpDT2fBbPUtZjzY=;
        b=oQkGnJd4n5/FdCs2ZoyRfZyXpCqMmO+HBSjCiwiTLdjECtf13n48/7TVe0qeRrCDXm
         tcq85u38J3dW81XGSJ0CBAYpsGf7XEWDisMN5hC6QPaX3oHy/9smH+TM7KR46OqOYIE9
         2b1amaCqU/rQqOJZZNAeDn44nMIuLOZO4YVZzv1VzaLsG5PMT6DCU297snYBqT+VcBSA
         iSjiytr/XR2apxTW1JYEPfJmqOVhW/5Fzom4MFIz53JXiSBarZTcQUqeAr6DDMAejmvC
         qSoAa9VHbByi+7ymxqWJmdaim3CPkmBl2PnMgo6OC4DWF3EMkyn1T25r+Y2QPikGHbYD
         WS1w==
X-Forwarded-Encrypted: i=1; AJvYcCWDiRkk0wg8GV2QDbofnTl/vAEf0rEQ/Nyy73YpG/LU1lvukBLO/mQAv83h/olh3gTdbS1hHcW4/7ooqPnEX2dcepgwu67OOh9/iUfa0FSSm8w=
X-Gm-Message-State: AOJu0Yy5Hw6S/oB8FU/AR8tt8iPZEUECK0Z1ezAPT2TdPYIgE9t3cYnm
	qcBBbvmQxv2jNh9RSAAqM2ED0tkbvjZqOR1PanENlgrdTnbBcSjho5N7uN014ds=
X-Google-Smtp-Source: AGHT+IFwmAwXZJLUTdK6OfZHgdYWyHu7gnRIhGHS72jZJ+Xk3H6cq0glt8xuBj/czyH8RrBJrrq57g==
X-Received: by 2002:a05:600c:4f0f:b0:413:117e:fd4a with SMTP id l15-20020a05600c4f0f00b00413117efd4amr6520264wmq.3.1710237805350;
        Tue, 12 Mar 2024 03:03:25 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:af7b:cf60:208b:83f4])
        by smtp.gmail.com with ESMTPSA id h2-20020a056000000200b0033e433cb471sm8660214wrx.79.2024.03.12.03.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 03:03:24 -0700 (PDT)
References: <20240312-basic_dt-v1-0-7f11df3a0896@amlogic.com>
 <20240312-basic_dt-v1-3-7f11df3a0896@amlogic.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 3/4] arm64: dts: add support for A4 based Amlogic BA400
Date: Tue, 12 Mar 2024 10:55:46 +0100
In-reply-to: <20240312-basic_dt-v1-3-7f11df3a0896@amlogic.com>
Message-ID: <1jsf0vephv.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_030329_981696_21ECD74C 
X-CRM114-Status: GOOD (  23.45  )
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


On Tue 12 Mar 2024 at 17:18, Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Amlogic A4 is an application processor designed for smart audio
> and IoT applications.
>
> Add basic support for the A4 based Amlogic BA400 board, which describes
> the following components: CPU, GIC, IRQ, Timer and UART.
> These are capable of booting up into the serial console.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile               |  1 +
>  .../boot/dts/amlogic/amlogic-a4-a113l2-ba400.dts   | 43 ++++++++++
>  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 99 ++++++++++++++++++++++
>  3 files changed, 143 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 1ab160bf928a..9a50ec11bb8d 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_MESON) += amlogic-a4-a113l2-ba400.dtb
>  dtb-$(CONFIG_ARCH_MESON) += amlogic-c3-c302x-aw409.dtb
>  dtb-$(CONFIG_ARCH_MESON) += amlogic-t7-a311d2-an400.dtb
>  dtb-$(CONFIG_ARCH_MESON) += amlogic-t7-a311d2-khadas-vim4.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dts b/arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dts
> new file mode 100644
> index 000000000000..60f9f23858c6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dts
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "amlogic-a4.dtsi"

Could you describe how the a4 and a5 differs from each other ?
The description given in the commit description is the same.

Beside the a53 vs a55, I'm not seeing much of a difference.
Admittedly, there is not much yet but I wonder if a4 and a5 should have
a common dtsi.

> +
> +/ {
> +	model = "Amlogic A113L2 ba400 Development Board";
> +	compatible = "amlogic,ba400","amlogic,a4";
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
> +		reg = <0x0 0x0 0x0 0x40000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* 52 MiB reserved for ARM Trusted Firmware */

That's a lot of memory to blindly reserve.
Any chance we can stop doing that and have u-boot amend reserved memory
zone based on the actual needs of the device ?

> +		secmon_reserved:linux,secmon {
> +			compatible = "shared-dma-pool";
> +			no-map;
> +			alignment = <0x0 0x400000>;
> +			reg = <0x0 0x05000000 0x0 0x3400000>;
> +		};
> +	};
> +};
> +
> +&uart_b {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> new file mode 100644
> index 000000000000..7e8745010b52
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/gpio/gpio.h>
> +/ {
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x0>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x1>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu2: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x2>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu3: cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
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
> +		compatible = "arm,psci-0.2";

Really ? still on the that old version ?

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
> +		apb@fe000000 {
> +			compatible = "simple-bus";
> +			reg = <0x0 0xfe000000 0x0 0x480000>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
> +
> +			uart_b: serial@7a000 {
> +				compatible = "amlogic,meson-s4-uart",
> +					     "amlogic,meson-ao-uart";
> +				reg = <0x0 0x7a000 0x0 0x18>;
> +				interrupts = <GIC_SPI 169 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal>, <&xtal>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
> +			};
> +		};
> +	};
> +};


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
