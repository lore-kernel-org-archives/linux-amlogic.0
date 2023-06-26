Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63491EB64DC
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jun 2023 15:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pl2LgOQ0DKiPH6MezEwq6o/KMW2Qgr0lARwXR84SP7M=; b=lxQIckNrNEB3Bk
	+MXar147LVT0uQWHARaeptgeHq+sRYA2irxRPcctLvIwqTlc3coqTWRhiVJVPDNsLLkgsJ7n0XagH
	Azd92aTqor3+bNGW7mQRsws5ppW9H5EgjJCr9iCT7l0AnQpJmrQsB91L72Iba3bAz1LF0aO4wAUbq
	6ARlDmgX7nsHd+V23hSTcmtZkTXNR3qtjQ6HI4t9BVHjsZP6wa4OwRh/0ps1p8AqHWIAARwluaF+c
	WpiahSEAA5MEAmyN3Zo8q5MR+t/R6BqI1zeLVEYss9MsBU40DaZ9vMXh9Z6VC3jvPA/aRcYdCHyE4
	v5BXZaTrvrFMz5JUdd5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoL7-00AWzj-2L;
	Mon, 26 Jun 2023 15:41:17 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoL2-00AWwy-0m
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Jun 2023 15:41:15 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3112c11fdc9so2962634f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 26 Jun 2023 08:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687794069; x=1690386069;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IcAjUvoJv+soy8lFEBlsPkblkqyu/m9eFd2zpfxjosE=;
        b=tO6OqZdd37AW1NbN6NQLmeeSOF8mOhRK+Jf7ixWOaf8Jw4+hoKjbAgRJy0Fa7HZYKX
         JpY7E0CWUx/CEfmiH8xyXRVC0fPTTLJFnsSP/Fl6Ce52BXSxkvjnTmN6LWj09hv7Bi6f
         iuK0Rs5rHgQQqDvW1TJkZHgZYw58TTjKK781rmUcJHNZiwHXNt+vBEwOftzVo/CAy8vR
         rzJQCcnY3/nsFduTrM0snqMVzxXblztYLr/Pjf2XIfJNhfqUuc+eG3v75PgJ8XlvuX4q
         pR3kXLEfmHWELyrJI7RUI3t9wF6AfT5ezgRnT6+KUmwFuWGxrgqw+N6PwhRePvoITZ1x
         TGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687794069; x=1690386069;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IcAjUvoJv+soy8lFEBlsPkblkqyu/m9eFd2zpfxjosE=;
        b=D9gTdPfoZe4c6P2d8wAi9Vqi9Tc77xph58ZbW30Egh5fMQ6U1F9BaLYg4C8Ljpll8o
         IJGi3yKGjj0LTxQp2xfFJ0CocV3w+AYZyqRQ3oN5YGezOjXCDAosQ+R1jKlmXh+ZNTtb
         xnTs33wd7EwzJQ2iHlk1M1K9J0fuaHseOh+xGQPBEQ6V1KoFlcnPMxLVM3OD+FDSGzI6
         o4i7o2LYOKKX/m0Mi1FCcf8bbijAlD8Ci1MRWpLi3ecepDc9EXCy3brR/1T11z3yccOL
         8eFhRqf+ZX8J3Iz5Zc0vuX2i+lsTgt8aHtj7/eKCJSjZRC/mleW3hEhEq9iVNr725O2d
         3POQ==
X-Gm-Message-State: AC+VfDwu4cIuex6LsQZ9NGl5EMWM94S+biyjBn8U+boprIOjhPnzIZIg
	kCmtnmEt3N7mzOh7f5UZfi+Eng==
X-Google-Smtp-Source: ACHHUZ6SD/+R9QJaeeqkTvuy16RIFBOytcsvos4lluOdTQEOmJM+FBidZX5DmN6xzACs6kG6widqtw==
X-Received: by 2002:adf:f4cc:0:b0:313:ef96:84c8 with SMTP id h12-20020adff4cc000000b00313ef9684c8mr3050240wrp.67.1687794069018;
        Mon, 26 Jun 2023 08:41:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id a25-20020a5d4579000000b003048477729asm7711578wrc.81.2023.06.26.08.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 08:41:08 -0700 (PDT)
Message-ID: <9b49e979-4a24-f628-88c4-fd53f53d46e4@linaro.org>
Date: Mon, 26 Jun 2023 17:41:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] arm64: dts: add support for T7 based Amlogic AN400
Content-Language: en-US
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230626095223.721011-1-xianwei.zhao@amlogic.com>
 <20230626095223.721011-3-xianwei.zhao@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230626095223.721011-3-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_084112_281318_27F5D0E0 
X-CRM114-Status: GOOD (  10.93  )
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

On 26/06/2023 11:52, Xianwei Zhao wrote:
> Amlogic T7 is an advanced application processor designed for smart display.
> 
> Add basic support for the T7 based Amlogic AN400 board, which describes
> the following components: CPU, GIC, IRQ, Timer, UART. It's capable of
> booting up into the serial console.

Few nits.

...

> +				core3 {
> +					cpu = <&cpu7>;
> +				};
> +			};
> +		};
> +
> +		cpu0:cpu@0 {

You miss spaces after labels.

> +			device_type = "cpu";
> +			compatible = "arm,cortex-a73";
> +			reg = <0x0 0x0>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu1:cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a73";
> +			reg = <0x0 0x1>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu2:cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a73";
> +			reg = <0x0 0x2>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu3:cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a73";
> +			reg = <0x0 0x3>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu4:cpu@100 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x100>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu5:cpu@101{
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x101>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu6:cpu@102 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x102>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu7:cpu@103 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x103>;
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
> +		compatible = "arm,psci-0.2";
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
> +			    <0x0 0xfff02000 0 0x0100>;
> +			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
> +		     };

Fix indentation.

> +
> +		apb4: bus@fe000000 {
> +			compatible = "simple-bus";
> +			reg = <0x0 0xfe000000 0x0 0x480000>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
> +
> +			uart_a: serial@78000 {
> +				compatible = "amlogic,meson-s4-uart",
> +					     "amlogic,meson-ao-uart";
> +				reg = <0x0 0x78000 0x0 0x18>;
> +				interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> +				status = "disabled";

Please, don't put status in the middle of properties...



Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
