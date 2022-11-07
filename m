Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B56BC4332F
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Nov 2022 17:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVx78rjUuFN70oFE33mE7is9cq2fYxyPxHchXc5vnEY=; b=GnCuajZxyHSAC/supzlghFOBKm
	tCbHeDLiz4hM9mDSojYvKNRRwsMLt0J6HlbEXn4IfHbz1/xBuDLS3MyLUP1OHv5rkLqiSNvueHCnP
	F9lQGYRTKNvP9vcVOC7vLtADTi+i4HEFzEGAwHVKJaqFQ0c2Dns/PYAVU6U6daN4gz6JN22ArtXx3
	GbwYjpIMNoKFP0TWtIMKpP7r3Soc8i+8g1TXFf8+2ARE0juGNf06Ljwev15XHzdvOW5SiFxd9t3qG
	/5dwxq9KkTJbRGpOYLtYHk7nPf5ffe06oqdSvAfWnv32wwhW5C1f3ZRJ/EtDzA2os1rv2yZUx6SA8
	EHgcQS1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os5u5-00Gfkq-Tg; Mon, 07 Nov 2022 17:27:21 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os5tu-00Gffv-29
	for linux-amlogic@lists.infradead.org; Mon, 07 Nov 2022 17:27:12 +0000
Received: by mail-wm1-x332.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso10108619wma.1
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Nov 2022 09:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/Pcc8LRKgOyNv6WsjXvv239va06IdZNjx9Vjm48MX3I=;
        b=PLmwVV82R5Wj8J0VZxf7f7iWHEEQqSkq3KHI8gpsvXg2CFmMAgjzLBPraztFCHyRoU
         xvYI3cuwIukME3111uI0OL5iMLrEoZAV+zwL5SLn8xGBfE7AAloAmtlsETM11/6c5OvY
         mrcbx5+2SlJVT0raHHxZ+rJxavVscGLpLD4s2dNGhskwBAtkWehBBTETyWBEfhJLP7zO
         EUCpH1bo4cIeoYIH5K50cNP3vz7QukPKTY77f+gEj/Vr9YAIXbXeVLmUDDTu87rMRw77
         2/P5aCzcws0xLi/FBlISevTDKeK3I2TqDWFxW9Oy+WB5DcMpgxhWrFK+95FuGO5Ja84a
         kH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Pcc8LRKgOyNv6WsjXvv239va06IdZNjx9Vjm48MX3I=;
        b=vOad8zQ1gSVXeSUCYWD1SzNLZKUvuoEX1HE8ahtqbJ2t4dbCahR8zhNIlt9BlHJx0j
         PUlJ+t/EW1ofRf4FGSk5QXoiRmF9nMjhILQOLndCAAFEgfoVQmIPxFHRf1H967u82YPE
         VdT4OiWhbm4F560GzwQtJuhrxPV5rwzEydjvf5JvgEakFuLReAh9slauKYnitn4Y+0j+
         kjuAhmvWiEa/zmjrZJuioaQZZGfIjQdlWX1b1ZSTOuaaPa4KSPkyPRm43qw+ThBCmxxN
         xP4vq5wOniSw/eP1Luza90iIoqOFfr9L2VNn4gjLoELgutK9CWQjSzcjx7oBb7om8w2B
         6qLQ==
X-Gm-Message-State: ACrzQf0e7l9i/4lVu+9rzwxfrJS89DNic4McYqkzkv220AHqimeTsNBO
	caFUsCUeu4BD/r3UsFtKUi640w==
X-Google-Smtp-Source: AMsMyM6q6PZGGJUkukBvogL8l9nQiTpwonjfKWwZwZJBCkrL7u7qFaLzMj9WHibspzoBS2eqtJ9qhQ==
X-Received: by 2002:a7b:cc13:0:b0:3cf:8297:d61 with SMTP id f19-20020a7bcc13000000b003cf82970d61mr23045340wmh.160.1667842027294;
        Mon, 07 Nov 2022 09:27:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:64c8:555c:905:adc6? ([2a01:e0a:982:cbb0:64c8:555c:905:adc6])
        by smtp.gmail.com with ESMTPSA id m6-20020a1c2606000000b003c6edc05159sm12139091wmm.1.2022.11.07.09.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 09:27:06 -0800 (PST)
Message-ID: <cb47f89f-00ea-96e8-1e10-ae84406b924b@linaro.org>
Date: Mon, 7 Nov 2022 18:27:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: meson-s4-s805x2: add 12V/3.3V/1.8V/vddcpu
 nodes for Regulator
Content-Language: en-US
To: Chao Zhang <chao.zhang@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>
References: <20221107021116.2732032-1-chao.zhang@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <20221107021116.2732032-1-chao.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_092710_114123_F268A88D 
X-CRM114-Status: GOOD (  15.97  )
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

On 07/11/2022 03:11, Chao Zhang wrote:
> From: "chao.zhang" <chao.zhang@amlogic.com>
> 
> Add 12V/3.3V/1.8V/vddcpu nodes for Regulator on Amlogic S4 SoCs.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Link: https://lore.kernel.org/r/20221004-up-aml-fix-spi-v4-3-0342d8e10c49@baylibre.com
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

I think you did a bad copy paste because those lines comes from another already applied commit.

Please add your own Signed-off-by.

> ---
>   .../dts/amlogic/meson-s4-s805x2-aq222.dts     | 85 +++++++++++++++++++
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |  4 +
>   2 files changed, 89 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> index 8ffbcb2b1ac5..80c959766b79 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> @@ -22,6 +22,91 @@ memory@0 {
>   		device_type = "memory";
>   		reg = <0x0 0x0 0x0 0x40000000>;
>   	};
> +	main_12v: regulator-main_12v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "12V";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		regulator-always-on;
> +	};
> +
> +	vddao_3v3: regulator-vddao_3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDAO_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&main_12v>;
> +		regulator-always-on;
> +	};
> +
> +	vddio_ao1v8: regulator-vddio_ao1v8 {
> +	       compatible = "regulator-fixed";
> +	       regulator-name = "VDDIO_AO1V8";
> +	       regulator-min-microvolt = <1800000>;
> +	       regulator-max-microvolt = <1800000>;
> +	       vin-supply = <&vddao_3v3>;
> +	       regulator-always-on;
> +	};
> +
> +	vddcpu: regulator-vddcpu {
> +		/*
> +		 * SY8120B1ABC DC/DC Regulator.
> +		 */
> +		compatible = "pwm-regulator";
> +
> +		regulator-name = "VDDCPU";
> +		regulator-min-microvolt = <689000>;
> +		regulator-max-microvolt = <1049000>;
> +
> +		vin-supply = <&main_12v>;
> +
> +		pwms = <&pwm_ij 1 1500 0>;

Without the PWM node this won't apply.

> +		pwm-dutycycle-range = <100 0>;
> +
> +		regulator-boot-on;
> +		regulator-always-on;
> +		max-duty-cycle = <1500>;
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

This is wrong, the regulator-min-microvolt and regulator-max-microvolt + pwm-dutycycle-range is enough.

> +		status = "okay";
> +	};
> +
>   
>   };
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index ad50cba42d19..405a5af9ac1d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -17,6 +17,7 @@ cpu0: cpu@0 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x0>;
>   			enable-method = "psci";
> +			cpu-supply = <&vddcpu>;
>   		};
>   
>   		cpu1: cpu@1 {
> @@ -24,6 +25,7 @@ cpu1: cpu@1 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x1>;
>   			enable-method = "psci";
> +			cpu-supply = <&vddcpu>;
>   		};
>   
>   		cpu2: cpu@2 {
> @@ -31,6 +33,7 @@ cpu2: cpu@2 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x2>;
>   			enable-method = "psci";
> +			cpu-supply = <&vddcpu>;
>   		};
>   
>   		cpu3: cpu@3 {
> @@ -38,6 +41,7 @@ cpu3: cpu@3 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x3>;
>   			enable-method = "psci";
> +			cpu-supply = <&vddcpu>;
>   		};
>   	};
>   

Without a clock, this is useless.

Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
