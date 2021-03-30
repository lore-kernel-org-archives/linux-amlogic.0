Return-Path: <SRS0=3LcN=I4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09987C433DB
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Mar 2021 15:25:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABAE16196A
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Mar 2021 15:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABAE16196A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4As7Ecuc5skZO0HT0fK1nsSOLoHMyyHi4aYCP99qsZY=; b=Hx5jd/Gm4+SkNL6153q/B+heT
	CS4YShlPWuDZqww1b/yPdgDBC4sOdRI3V3jghaZ5NY5voDGgTr4LGVR9zyL5OBj14abXyTMvMH9Fp
	CT3ub33UxUw1Gv2qc9mnCzxJqj6Fy8+ysCtqFp4uSIiVFmhvReMcsUfe/0GQ3z+QjPFzwCQbU0TdG
	RsjovBGm02SkyX/vS9S4JV8DlJhG6H45f1jQOrnunB0lpxd9/TW6JegoKKqOUu7WCCJtZSWs3CLDX
	cS0dvFMKbQrKFovnTvPmWYPz22AQqv4z6xYDcH8ECMNpSlRsDHJwivfqKx0Msr/v2cqAARRqr+dqp
	MxirX+rOg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRGFT-004AeP-PJ; Tue, 30 Mar 2021 15:25:44 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRGEy-004AMz-SY
 for linux-amlogic@lists.infradead.org; Tue, 30 Mar 2021 15:25:15 +0000
Received: by mail-wr1-x436.google.com with SMTP id z2so16630335wrl.5
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Mar 2021 08:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+bFbGRcM54PcoFFrJNaAyx00F7Jf8sd2b9QRt7gGOII=;
 b=IIL/4TJj1Lc8pQKDI+tV8K0ZmTO+m0lZnMFZtDohRK03yE5MoKAkLuXMXObAy4JlEy
 QhKi90MM/l5f1vW8a0bo79MZZnxgKak4+9zXMuvyrf+oIXwNnrmj4su1xvdRT+If/oyw
 xUxmWwyB8W8b+tHKtO3/jC9X1wG2Fpy4q8HhR60U92CYfUQADP5dYxdUPDj7Kiz+ATgl
 VOm8B526KXObUQD+h2CR3h/tVEjGT775pCxmr4YAznkMj2nUMzkEwbg/GU2Oge5WGAtm
 dPEOdfLmxjqg+07yuyP+rGRXXpa1lNF8s5lfswtgCrkec1AjbZjHFoiqsk2llmx/NHeN
 8kVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+bFbGRcM54PcoFFrJNaAyx00F7Jf8sd2b9QRt7gGOII=;
 b=tJNR0xXFpajFxvqT218c5eE5tfX9LyfedZpHId4jl0Grm5UG9aVoKt6LUKyKMHKoQ7
 j2j0E5k5vOKu7aIQcpw+muzxylvoFY3ypfDzrNYQWf89DLvIvT0I6cUmUkPHNHWR3LgZ
 A2XvC22XxgW0AGDa6Kl+pj1E8Z40lr6Hw8s7effin1nF6DdjKt3UXrNvt/5QI08MHqHI
 Tyf1U8qpGDi3keHaMpVTlYyoePjg5gP00fT9rITySBksZzwLv6snDJzME6mN+ML8lpoO
 +Rxs8C31x33RPLFFXTK8XgD1vsXK49DQilF10hLiwwHUgyH0i3MAez/yB5RjORo4sH+o
 feZg==
X-Gm-Message-State: AOAM531KBWSbMR+Mvd9q8xqZN1/tjSYFoHnFyKCHYsRPcvCE9a8s7+sI
 x77f6eYY7H6nToY20A5QrlLbxw==
X-Google-Smtp-Source: ABdhPJyuvNMOMwv4i8D1t7uU2BOwCCAKUFRLlZ7FlwqJYZTC6jFDPS/G/flc1Tqzwz15W42NUl+cjA==
X-Received: by 2002:a5d:4e43:: with SMTP id r3mr34223616wrt.280.1617117912036; 
 Tue, 30 Mar 2021 08:25:12 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:2d11:7929:c1dd:292?
 ([2a01:e0a:90c:e290:2d11:7929:c1dd:292])
 by smtp.gmail.com with ESMTPSA id a6sm5862970wmm.0.2021.03.30.08.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 08:25:11 -0700 (PDT)
Subject: Re: [PATCH 2/3] arm64: dts: meson: add initial device-tree for MeCool
 KII Pro
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Drazen Spio <drazsp@gmail.com>
References: <20210329154753.30074-1-christianshewitt@gmail.com>
 <20210329154753.30074-3-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <8d1c1ca7-8a90-1369-2046-e52d2c2a54c5@baylibre.com>
Date: Tue, 30 Mar 2021 17:25:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210329154753.30074-3-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_162513_131961_1B2909FB 
X-CRM114-Status: GOOD (  19.51  )
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

On 29/03/2021 17:47, Christian Hewitt wrote:
> MeCool (Videostrong) KII Pro is based on the Amlogic P230 reference
> board with an S905D chip and the following specs:
> 
> - 2GB DDR3 RAM
> - 16GB eMMC
> - 10/100 Base-T Ethernet
> - BCM4335 Wireless (802.11 b/g/n/ac, BT 4.0)
> - DVB-C/T/T2/S/S2 (AVL6862TA demod + R848 tuner)
> - HDMI 2.0a video
> - S/PDIF optical output
> - CVBS/Analogue output
> - 4x USB 2.0 ports
> - IR receiver
> - 1x Power button (with integrated blue LED)
> - 1x micro SD card slot
> 
> Tested-by: Drazen Spio <drazsp@gmail.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>  .../meson-gxl-s905d-mecool-kii-pro.dts        | 86 +++++++++++++++++++
>  2 files changed, 87 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index aebd49c88719..f8f515c93055 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -29,6 +29,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc-v2.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-mecool-kii-pro.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p230.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p231.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-phicomm-n1.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts
> new file mode 100644
> index 000000000000..5ab5d3aa0646
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/*
> + * Author: Christian Hewitt <christianshewitt@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-gxl-s905d.dtsi"
> +#include "meson-gx-p23x-q20x.dtsi"
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	compatible = "videostrong,gxl-kii-pro", "amlogic,s905d", "amlogic,meson-gxl";
> +	model = "MeCool KII Pro";
> +
> +	adc-keys {
> +		compatible = "adc-keys";
> +		io-channels = <&saradc 0>;
> +		io-channel-names = "buttons";
> +		keyup-threshold-microvolt = <1710000>;
> +
> +		button-function {
> +			label = "Update";
> +			linux,code = <KEY_VENDOR>;
> +			press-threshold-microvolt = <10000>;
> +		};
> +	};
> +
> +	gpio-keys-polled {
> +		compatible = "gpio-keys-polled";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		poll-interval = <100>;
> +
> +		button@0 {
> +			label = "power";
> +			linux,code = <KEY_POWER>;
> +			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		blue {
> +			color = <LED_COLOR_ID_BLUE>;
> +			function = LED_FUNCTION_POWER;
> +			gpios = <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
> +			panic-indicator;
> +		};
> +	};
> +};
> +
> +&ethmac {
> +	phy-mode = "rmii";
> +	phy-handle = <&internal_phy>;
> +};
> +
> +&ir {
> +	linux,rc-map-name = "rc-mecool-kii-pro";
> +};
> +
> +&sd_emmc_a {
> +	brcmf: wifi@1 {
> +		reg = <1>;
> +		compatible = "brcm,bcm4329-fmac";
> +	};
> +};
> +
> +&uart_A {
> +	status = "okay";
> +	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> +	pinctrl-names = "default";
> +	uart-has-rtscts;
> +
> +	bluetooth {
> +		compatible = "brcm,bcm43438-bt";
> +		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
> +		max-speed = <2000000>;
> +		clocks = <&wifi32k>;
> +		clock-names = "lpo";
> +	};
> +};
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
