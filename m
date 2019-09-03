Return-Path: <SRS0=0xNA=W6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0196FC3A5A2
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 07:30:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C67DC22CF8
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 07:30:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C/1Wz2+L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tgRlscW4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C67DC22CF8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HNRXl+OnG/hB4bAnP0FYUeDfEjwooC1FrFPAK35d96o=; b=C/1Wz2+L8J7AGr
	jn9Q+gNpmewv5ibMDJul7pdWeqC9LsoH3PpSqreILa3LPlKfykpvbFhqN5jGviTJ7mqfX75IdYDv+
	uFhowq+pww+Lmx6YhRjpaaUXhxNilXlSUPoh4bUIGOI3steMD4JIBNXw0VTkCp+BpJfB63K8Mbe74
	EuNkoo5iGqKM7xuPjtBV5OPEmN3eN9KOENZcwkhP6XobxfdBcBGx4saLVg5YhijDpvte+t/RO7o1z
	xk7u4awikmVzJsz+6V+IQ6/Vrr/vv2zwfyLfhLUwkvQOJITpKQ3YAYEAoyupvFJxIiljtcX/UXi8U
	PPEKwg55wkhCYd48Cgjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i53GX-0007fb-T8; Tue, 03 Sep 2019 07:30:14 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i53GT-0007Qs-GP
 for linux-amlogic@lists.infradead.org; Tue, 03 Sep 2019 07:30:11 +0000
Received: by mail-wr1-x442.google.com with SMTP id y8so16211570wrn.10
 for <linux-amlogic@lists.infradead.org>; Tue, 03 Sep 2019 00:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=pSCJycaKVh704Ac0S4neijcFEZ9GmBRQLJR3eMBbbCU=;
 b=tgRlscW4dUEuVCGbWnPgzT9V8/L4/03gpsjK0WJYLO1GlhohBzsTHDNVvNhUqWJHJF
 l4kW9qic54u3Tp/nztHukXAIMLr69gPXvNwznen0UWvLlNlaWbueEjHs0ZfwDYl0B89T
 Q9DdfEFk6qFtx7hgB39DPC34CfIOizzxryX0dBVk7xRj47FeVyxBiICifGjhB5Xrvwj2
 VaCrafQfyGgkJuvV441WC5KhYspZAv+q6G30TMkR4cLVMkwDPgZaup74kGIwPQIHdmw4
 cCnBBUCLoKhHBnJUgmOiMQmlTzK9pV7Ok6edfvL7a/sRu7YTVZEhOG9pYuObis2oaL+y
 8fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=pSCJycaKVh704Ac0S4neijcFEZ9GmBRQLJR3eMBbbCU=;
 b=IYJqJylu5Mp08PrApz8YZ0G6B4FG2yoMVJsw1+xBoNFwyONSNUd1yl3dTzSyoBJQeO
 vVNZBJBp22vNrtVX4BTLX9gH1zyOK1tjl6NlNZLfBEFXwmc1aKbckMkg5TVGeNKnwaZo
 hLzEdaq4hhJ7jUqgGhPErCNBnyelRG+KobHoQgP6oyExXGeYv8744GTQDJ76Z5A4BkUh
 NMZ9FscT+W6U+NpN8EQoiXKK68GhTXR7ZcgSIIqs0qbdfPbdN5Ufv61uVf6DAhFskpx+
 cnlWequ0KEGLZwbyyB1M1qPidNVfZZml3zjYE4RwNX3ppJw1rJUO3yKrqWc6FAMgNMvu
 WR2g==
X-Gm-Message-State: APjAAAVqmVmNC15qN1ouwt/OrVWcZ1qSk2Z94j5GDf8C2cG+g8WwvG8j
 k7svzsmlNVptvyha1heS5ieLjQ==
X-Google-Smtp-Source: APXvYqz4ooGnpbFcyZaSbyrgA6PANL0nccU1Lisypx0A74u9MR9WVmFK+4ohxfGtbbbqQaeYbOzJHQ==
X-Received: by 2002:adf:de0d:: with SMTP id b13mr16181290wrm.140.1567495807765; 
 Tue, 03 Sep 2019 00:30:07 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t198sm25856153wmt.39.2019.09.03.00.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 00:30:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jianxin Pan <jianxin.pan@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 4/4] arm64: dts: add support for A1 based Amlogic AD401
In-Reply-To: <1567493475-75451-5-git-send-email-jianxin.pan@amlogic.com>
References: <1567493475-75451-1-git-send-email-jianxin.pan@amlogic.com>
 <1567493475-75451-5-git-send-email-jianxin.pan@amlogic.com>
Date: Tue, 03 Sep 2019 09:30:06 +0200
Message-ID: <1jef0xrg5d.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_003009_576393_8801D385 
X-CRM114-Status: GOOD (  14.02  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, Qiufang Dai <qiufang.dai@amlogic.com>,
 Rob Herring <robh+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, Carlo Caione <carlo@caione.org>,
 Tao Zeng <tao.zeng@amlogic.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue 03 Sep 2019 at 02:51, Jianxin Pan <jianxin.pan@amlogic.com> wrote:

> Add basic support for the Amlogic A1 based Amlogic AD401 board:
> which describe components as follows: Reserve Memory, CPU, GIC, IRQ,
> Timer, UART. It's capable of booting up into the serial console.
>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile           |   1 +
>  arch/arm64/boot/dts/amlogic/meson-a1-ad401.dts |  30 ++++++
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi      | 121 +++++++++++++++++++++++++
>  3 files changed, 152 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-a1-ad401.dts
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index edbf128..1720c45 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -36,3 +36,4 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-rbox-pro.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-khadas-vim3l.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-a1-ad401.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1-ad401.dts b/arch/arm64/boot/dts/amlogic/meson-a1-ad401.dts
> new file mode 100644
> index 00000000..3c05cc0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1-ad401.dts
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-a1.dtsi"
> +
> +/ {
> +	compatible = "amlogic,ad401", "amlogic,a1";
> +	model = "Amlogic Meson A1 AD401 Development Board";
> +
> +	aliases {
> +		serial0 = &uart_AO_B;
> +	};

Newline here please

> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};

same

> +	memory@0 {
> +		device_type = "memory";
> +		linux,usable-memory = <0x0 0x0 0x0 0x8000000>;
> +	};
> +};
> +
> +&uart_AO_B {
> +	status = "okay";
> +	/*pinctrl-0 = <&uart_ao_a_pins>;*/
> +	/*pinctrl-names = "default";*/

Remove the commented code please

> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> new file mode 100644
> index 00000000..b98d648
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -0,0 +1,121 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	compatible = "amlogic,a1";
> +
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus {
> +		#address-cells = <0x2>;
> +		#size-cells = <0x0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a35";
> +			reg = <0x0 0x0>;
> +			enable-method = "psci";
> +			next-level-cache = <&l2>;
> +		};
> +
> +		cpu1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a35";
> +			reg = <0x0 0x1>;
> +			enable-method = "psci";
> +			next-level-cache = <&l2>;
> +		};
> +
> +		l2: l2-cache0 {
> +			compatible = "cache";
> +		};
> +	};

New line here please

With this minor comments adressed, looks good.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			reusable;
> +			size = <0x0 0x800000>;
> +			alignment = <0x0 0x400000>;
> +			linux,cma-default;
> +		};
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
> +		uart_AO: serial@fe001c00 {
> +			compatible = "amlogic,meson-gx-uart",
> +				     "amlogic,meson-ao-uart";
> +			reg = <0x0 0xfe001c00 0x0 0x18>;
> +			interrupts = <GIC_SPI 25 IRQ_TYPE_EDGE_RISING>;
> +			clocks = <&xtal>, <&xtal>, <&xtal>;
> +			clock-names = "xtal", "pclk", "baud";
> +			status = "disabled";
> +		};
> +
> +		uart_AO_B: serial@fe002000 {
> +			compatible = "amlogic,meson-gx-uart",
> +				     "amlogic,meson-ao-uart";
> +				     reg = <0x0 0xfe002000 0x0 0x18>;
> +			interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
> +			clocks = <&xtal>, <&xtal>, <&xtal>;
> +			clock-names = "xtal", "pclk", "baud";
> +			status = "disabled";
> +		};
> +
> +		gic: interrupt-controller@ff901000 {
> +			compatible = "arm,gic-400";
> +			reg = <0x0 0xff901000 0x0 0x1000>,
> +			      <0x0 0xff902000 0x0 0x2000>,
> +			      <0x0 0xff904000 0x0 0x2000>,
> +			      <0x0 0xff906000 0x0 0x2000>;
> +			interrupt-controller;
> +			interrupts = <GIC_PPI 9
> +				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
> +			#interrupt-cells = <3>;
> +			#address-cells = <0>;
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13
> +			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14
> +			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11
> +			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10
> +			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +
> +	xtal: xtal-clk {
> +		compatible = "fixed-clock";
> +		clock-frequency = <24000000>;
> +		clock-output-names = "xtal";
> +		#clock-cells = <0>;
> +	};
> +};
> -- 
> 2.7.4

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
