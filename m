Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878ECC2BD09
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jul 2024 09:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRKiR+aQ0DDKF+qcoxSsR9LcpHQGGc9F/vF4w/Bq3oc=; b=R/X7whuy3yAEES09lIJrom8Nf5
	h4dOzvzjVhBrsdDcZTRWvUjR3FNqE4YLorxJR1mm4qdsNdMt4vCHLqaQRa9HKD392Ti7eiZViCHgJ
	sxo1l+BduTpYCzuYMLvEhx75gxJ55BMWJivQ+PUgOp0cp9ml55mzMkhpz63yYTvkNZiUz+7hFm3YK
	Ggdxtx/UXJwp4lBegHQ2qW7tMtvRATGFy3Yq302is9m2m2Zk7pV6kl2vGfG0nt53VDMh1c4BNK+Z7
	yTIMl619GbnWKUJB+9+9ZiAq9vWoUvSVMvC+a3yxrsBSmjbcjKkRP2F7EGpFrIaPGlYTNo9nf3VpA
	wUcicLQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR6pv-00000006Xpj-2auQ;
	Tue, 09 Jul 2024 09:08:35 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR6pt-00000006Xoq-050h
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Jul 2024 09:08:34 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2ee910d6a8bso43334751fa.0
        for <linux-amlogic@lists.infradead.org>; Tue, 09 Jul 2024 02:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720516111; x=1721120911; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CmdthfUB0lCia3+pjHR/TlqzyKmsnOAaiH7zcFhwtHw=;
        b=Dp4X/79S4U07PqUFpTBGAoPFJW+1zpKKcGEZPg3lC4ASD2UMdN1P1ACIMcJBPOGgKQ
         IDpTCshwaTarsq1SQE3pRzjWYOyAywTq3Hf8C+dvlwaPlkTaKzRGYzjmvvvPPqo+Pz/p
         TTuP51jmzAUNlzXCFiTdpVJ6btIm4itXq94IGcV6nl74f7JdjXV2eyzCRS6seCfu0+UP
         L0QiyogFGnFrw86j3ZSE/HtEbQ9/zAfC5S2W2UlWBEBb2MbVNndIz+B4YJ5DJLI+/h65
         sYoLG4Z2PNaxi+GlRIGogwivxxVy0XuJeZPlXK++LiE7mP2OVertEvO8F4MnzJCTqyLB
         hwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720516111; x=1721120911;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CmdthfUB0lCia3+pjHR/TlqzyKmsnOAaiH7zcFhwtHw=;
        b=u9tNCSpe/gIOYLWhrp+2qfXOkAOt0XSMoHib4rT1I7SDMCFk72+xXwT7j/ei89wLmN
         CLH1cXaZR1+1f9r9DzL/MmvNN2JWWSidX1YCdnxLS9xnqEXW3+rXz5IKsO1vIzKYpkVL
         Y8KEP77YkYBZ5Ki/qq3zVaLTC3nQYLWL3hM2IhRBLkih5Vmf9XriXc0J2gg0oGYC8IBN
         crDJbdSNxPeAmfCcJu0hoaXt6Ovn152lSM001u7xyUHi2aOYYcf/JcNFK1SndzduL+Bc
         zMsRP+60wGSX9MuKvWuBCq0BnCrkUp4OMgwmYo7lNhxWLKkobd7yO/RDB2lv2aoVzeFb
         H8Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUW7P+WAMV8tKLYAT/in2Xgth84fU+yp9WQLJVpdfYrOpeYDVjYMjeUjhTvuTuIHaE7rceCnmy6Aw064DAstfHDWhlENY2BXKgb1GH8/BIlmGg=
X-Gm-Message-State: AOJu0YzSvj3GL42DpyvU3SyFEpMt99IaJ+WHeXO2xv2pm46fLdYBi9mU
	/QjFPqfdY1wXw3bmhVVScdH3ukz+Zg9Me3X9JKxD5N0bFXjTNgqBROHqLGzd1nU=
X-Google-Smtp-Source: AGHT+IEtJIiE86xhBgxBKeQv7zMaRRuPXmv/jRIb3QypyrUCqGULk6d0VIimsfliwDU5MxU0qIHW4A==
X-Received: by 2002:a2e:9903:0:b0:2ec:5fe1:c762 with SMTP id 38308e7fff4ca-2eeb3197c6fmr12601331fa.46.1720516110918;
        Tue, 09 Jul 2024 02:08:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:b12a:8461:5e2a:dfe? ([2a01:e0a:cad:2140:b12a:8461:5e2a:dfe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f74462esm30643605e9.48.2024.07.09.02.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 02:08:30 -0700 (PDT)
Message-ID: <f4a17dbc-07f3-4335-8e0c-ec64e2f80727@linaro.org>
Date: Tue, 9 Jul 2024 11:08:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: enable some device nodes for S4
To: xianwei.zhao@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240705-s4_node-v1-1-646ca7ac4f09@amlogic.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240705-s4_node-v1-1-646ca7ac4f09@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_020833_128364_54D2D9DA 
X-CRM114-Status: GOOD (  14.83  )
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

On 05/07/2024 07:39, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Enable some device nodes for AQ222 base S4, including
> SD, regulator and ethnernet node.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 146 +++++++++++++++++++++
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 128 ++++++++++++++++++
>   2 files changed, 274 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> index 983caddc409c..2ab685d9bd1d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> @@ -34,6 +34,112 @@ secmon_reserved: secmon@5000000 {
>   			no-map;
>   		};
>   	};
> +
> +	sdio_32k: sdio-32k {
> +		compatible = "pwm-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
> +	};
> +
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
> +		clocks = <&sdio_32k>;
> +		clock-names = "ext_clock";
> +	};
> +
> +	main_12v: regulator-main-12v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "12V";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		regulator-always-on;
> +	};
> +
> +	vddao_3v3: regulator-vddao-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDAO_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&main_12v>;
> +		regulator-always-on;
> +	};
> +
> +	vddio_ao1v8: regulator-vddio-ao1v8 {
> +	       compatible = "regulator-fixed";
> +	       regulator-name = "VDDIO_AO1V8";
> +	       regulator-min-microvolt = <1800000>;
> +	       regulator-max-microvolt = <1800000>;
> +	       vin-supply = <&vddao_3v3>;
> +	       regulator-always-on;
> +	};
> +
> +	/* SY8120B1ABC DC/DC Regulator. */
> +	vddcpu: regulator-vddcpu {
> +		compatible = "pwm-regulator";
> +
> +		regulator-name = "VDDCPU";
> +		regulator-min-microvolt = <689000>;
> +		regulator-max-microvolt = <1049000>;
> +
> +		vin-supply = <&main_12v>;
> +
> +		pwms = <&pwm_ij 1 1500 0>;
> +		pwm-dutycycle-range = <100 0>;
> +
> +		regulator-boot-on;
> +		regulator-always-on;
> +		/* Voltage Duty-Cycle */
> +		voltage-table = <1049000 0>,
> +				<1039000 3>,
> +				<1029000 6>,
> +				<1019000 9>,
> +				<1009000 12>,
> +				<999000 14>,
> +				<989000 17>,
> +				<979000 20>,
> +				<969000 23>,
> +				<959000 26>,
> +				<949000 29>,
> +				<939000 31>,
> +				<929000 34>,
> +				<919000 37>,
> +				<909000 40>,
> +				<899000 43>,
> +				<889000 45>,
> +				<879000 48>,
> +				<869000 51>,
> +				<859000 54>,
> +				<849000 56>,
> +				<839000 59>,
> +				<829000 62>,
> +				<819000 65>,
> +				<809000 68>,
> +				<799000 70>,
> +				<789000 73>,
> +				<779000 76>,
> +				<769000 79>,
> +				<759000 81>,
> +				<749000 84>,
> +				<739000 87>,
> +				<729000 89>,
> +				<719000 92>,
> +				<709000 95>,
> +				<699000 98>,
> +				<689000 100>;
> +		status = "okay";

You can drop status=okay here

> +	};
> +};
> +
> +&pwm_ef {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_e_pins1>;
> +	pinctrl-names = "default";
> +};
> +
> +&pwm_ij {
> +	status = "okay";
>   };
>   
>   &uart_b {
> @@ -46,6 +152,40 @@ &ir {
>   	pinctrl-names = "default";
>   };
>   
> +&sdio {
> +	pinctrl-0 = <&sdio_pins>;
> +	pinctrl-1 = <&sdio_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	max-frequency = <200000000>;
> +	non-removable;
> +	disable-wp;
> +	no-sd;
> +	no-mmc;
> +	vmmc-supply = <&vddao_3v3>;
> +	vqmmc-supply = <&vddio_ao1v8>;
> +};
> +
> +&sd {
> +	status = "okay";
> +	pinctrl-0 = <&sdcard_pins>;
> +	pinctrl-1 = <&sdcard_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	max-frequency = <200000000>;
> +	disable-wp;
> +
> +	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
> +	vmmc-supply = <&vddao_3v3>;
> +	vqmmc-supply = <&vddao_3v3>;
> +};
> +
>   &nand {
>   	status = "okay";
>   	#address-cells = <1>;
> @@ -90,3 +230,9 @@ &spicc0 {
>   	pinctrl-0 = <&spicc0_pins_x>;
>   	cs-gpios = <&gpio GPIOX_10 GPIO_ACTIVE_LOW>;
>   };
> +
> +&ethmac {
> +	status = "okay";
> +	phy-handle = <&internal_ephy>;
> +	phy-mode = "rmii";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index b686eacb9662..c11c947fa18c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -10,6 +10,7 @@
>   #include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
>   #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>   #include <dt-bindings/power/meson-s4-power.h>
> +#include <dt-bindings/reset/amlogic,meson-s4-reset.h>
>   
>   / {
>   	cpus {
> @@ -466,6 +467,93 @@ mux {
>   					};
>   				};
>   
> +				sdcard_pins: sdcard-pins {
> +					mux {
> +						groups = "sdcard_d0_c",
> +							 "sdcard_d1_c",
> +							 "sdcard_d2_c",
> +							 "sdcard_d3_c",
> +							 "sdcard_clk_c",
> +							 "sdcard_cmd_c";
> +						function = "sdcard";
> +						bias-pull-up;
> +						drive-strength-microamp = <4000>;
> +					};
> +				};
> +
> +				sdcard_clk_gate_pins: sdcard-clk-gate-pins {
> +					mux {
> +						groups = "GPIOC_4";
> +						function = "gpio_periphs";
> +						bias-pull-down;
> +						drive-strength-microamp = <4000>;
> +					};
> +				};
> +
> +				emmc_pins: emmc-pins {
> +					mux-0 {
> +						groups = "emmc_nand_d0",
> +							 "emmc_nand_d1",
> +							 "emmc_nand_d2",
> +							 "emmc_nand_d3",
> +							 "emmc_nand_d4",
> +							 "emmc_nand_d5",
> +							 "emmc_nand_d6",
> +							 "emmc_nand_d7",
> +							 "emmc_cmd";
> +						function = "emmc";
> +						bias-pull-up;
> +						drive-strength-microamp = <4000>;
> +					};
> +					mux-1 {
> +						groups = "emmc_clk";
> +						function = "emmc";
> +						bias-pull-up;
> +						drive-strength-microamp = <4000>;
> +					};
> +				};
> +
> +				emmc_ds_pins: emmc-ds-pins {
> +					mux {
> +						groups = "emmc_nand_ds";
> +						function = "emmc";
> +						bias-pull-down;
> +						drive-strength-microamp = <4000>;
> +					};
> +				};
> +
> +				emmc_clk_gate_pins: emmc-clk-gate-pins {
> +					mux {
> +						groups = "GPIOB_8";
> +						function = "gpio_periphs";
> +						bias-pull-down;
> +						drive-strength-microamp = <4000>;
> +					};
> +				};
> +
> +				sdio_pins: sdio-pins {
> +					mux {
> +						groups = "sdio_d0",
> +							 "sdio_d1",
> +							 "sdio_d2",
> +							 "sdio_d3",
> +							 "sdio_clk",
> +							 "sdio_cmd";
> +						function = "sdio";
> +						bias-pull-up;
> +						drive-strength-microamp = <4000>;
> +					};
> +				};
> +
> +				sdio_clk_gate_pins: sdio-clk-gate-pins {
> +					mux {
> +						groups = "GPIOX_4";
> +						function = "gpio_periphs";
> +						bias-pull-down;
> +						drive-strength-microamp = <4000>;
> +					};
> +				};
> +
>   				spicc0_pins_x: spicc0-pins_x {
>   					mux {
>   						groups = "spi_a_mosi_x",
> @@ -712,5 +800,45 @@ mdio0: mdio {
>   				compatible = "snps,dwmac-mdio";
>   			};
>   		};
> +
> +		sdio: mmc@fe088000 {
> +			compatible = "amlogic,meson-axg-mmc";
> +			reg = <0x0 0xfe088000 0x0 0x800>;
> +			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clkc_periphs CLKID_SDEMMC_A>,
> +				 <&xtal>,
> +				 <&clkc_pll CLKID_FCLK_DIV2>;
> +			clock-names = "core", "clkin0", "clkin1";
> +			resets = <&reset RESET_SD_EMMC_A>;
> +			cap-sdio-irq;
> +			keep-power-in-suspend;
> +			status = "disabled";
> +		};
> +
> +		sd: mmc@fe08a000 {
> +			compatible = "amlogic,meson-axg-mmc";
> +			reg = <0x0 0xfe08a000 0x0 0x800>;
> +			interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
> +			clocks = <&clkc_periphs CLKID_SDEMMC_B>,
> +				 <&clkc_periphs CLKID_SD_EMMC_B>,
> +				 <&clkc_pll CLKID_FCLK_DIV2>;
> +			clock-names = "core", "clkin0", "clkin1";
> +			resets = <&reset RESET_SD_EMMC_B>;
> +			status = "disabled";
> +		};
> +
> +		emmc: mmc@fe08c000 {
> +			compatible = "amlogic,meson-axg-mmc";
> +			reg = <0x0 0xfe08c000 0x0 0x800>;
> +			interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
> +			clocks = <&clkc_periphs CLKID_NAND>,
> +				 <&xtal>,
> +				 <&clkc_pll CLKID_FCLK_DIV2>;
> +			clock-names = "core", "clkin0", "clkin1";
> +			resets = <&reset RESET_NAND_EMMC>;
> +			no-sdio;
> +			no-sd;
> +			status = "disabled";
> +		};
>   	};
>   };
> 
> ---
> base-commit: 338c92a5d1956f1841f84b86923087676d1d0cea
> change-id: 20240705-s4_node-8110e3286c0c
> 
> Best regards,

With that fixed:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
