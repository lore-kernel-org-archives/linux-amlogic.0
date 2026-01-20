Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FD7D2ECEF
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Jan 2026 01:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TCyQJNImzfJAtxqjLSFrxEDOquXx1NHjCNd4US7Ibho=; b=q/3C+NM1EdjCJR
	PTrb+0P4uctPGdHfYcrxie1ezydXYEBni/xz5SgxRzogSwYQbMV1qS2sEc49QdRoaQu0Qso8d0ILz
	E/WKEK4ZtVDOkyHA7/X6gI95SqEh7wWTpt4e2t3EUD4YPxZME4KUJK7gJQ6/GDiYlYnriQRBeGuhj
	ptsaP13mRgMdxJWzmNkrcmIcDAZFtFpOCcQHHU/4s896UZt5nZixil4r/AEXuT26jCAuRP9+YEHr2
	6YrrRT/Hsx7HlTjgSvxNw7htUkPyUS/PvU+mL77Wscw2xzSqkteUG2T8oqonSWk5tktekhZkfPHNg
	kzRv3dIQidNMRawFtwhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0bL-000000032Ro-1DTO;
	Tue, 20 Jan 2026 01:32:11 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0bI-000000032Pw-3XQf
	for linux-amlogic@lists.infradead.org;
	Tue, 20 Jan 2026 01:32:10 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b86ed375d37so639579166b.3
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Jan 2026 17:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1768872727; x=1769477527; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oA9EJA38Ao+A32i9rXYjoTfg7C61pSIvbeavCfCz8zc=;
        b=bHH+q0Y6l9LUuBfEfiTOYwOfLdQJe8qDf3DhGNwwRQGyu39t1r3WZG1ZI/leaDQWXL
         N4GBKxEuvLAvAdD1hc88NSOmhgwyulkbvqy+9/yS5sV1DClShoQsylt5PbmPpMZZYiPm
         6houUBjCfNGjYx2J1IUo+9yL2x/w3Lcd7ONBCp2muSfdZE0IRqU31ELumV3vyfAKroXQ
         6aNAURnTfFL1+OO+OeDWFWJWTsfol7YHHdoVbrEK2J+C9KhHGKuX79t+9+9/Z/gtBfuJ
         e0pDcb+mmU3ZYf307gAy7AqRqcyWdROHyjTODieGVygtnaE2jik6zchbjSD9/Qh3EDmo
         lyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768872727; x=1769477527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oA9EJA38Ao+A32i9rXYjoTfg7C61pSIvbeavCfCz8zc=;
        b=tcTwn1H4A8/RoEAmC90/xpNwPHKbt5Y04gkbtSUOyMgcDdtDk9yvjRTsjrPwm9AeZ2
         /Xnls4lPs0xngOguHHtiEFivsJVIUsIL//coIsGmmv21VxtGX0DJLdBdxaEcEFPNWUps
         eSjwcfo/KqqfcYZ/mmkh5Y0eSA9VMdH3bqed/PyxB4k8neYt+RxO7ffaLkjYhm+JDGJB
         tVAigbfH4XxtQ8sDFMym0uC8T/GwSbuCZOwwk06RK/OHfWPyTlOT3SWwsIO1HfwHcKbw
         S1seCTZp7ByuPwcFtFw2AwWbPaV3+pXxER14yQX6j5Hv51Vab9iQumBn5QjdNEq+EN60
         dhGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUy63661FPYO7R4+M4MgojYnAc3XTbuQ0KBZbVj1q4DnMscwv6RHiZ+K0tcgTm7tmSXujAU3DcqPKKKYPP@lists.infradead.org
X-Gm-Message-State: AOJu0YwTu9QPtp85iCQ8Lc31nrC51l4aKZ7W8XQMaS4OCEiFpjyBUsU4
	3eepyfWnmRIBbs5Cn8HIUGDjIsnhdgBrU+7qEP3v65fWZqIJ4+yfC7MWYDBSArbDvw==
X-Gm-Gg: AZuq6aIovY9fq6KtOo1gHBaqcc9ZftuVfX2HAJ/0P0rBINkp7ngl19+E09/h0mV0lZn
	dFkYxS3CWRmAbLTTp9yYg2gkoTFwiiKoLBI4u0vEyANfcUpzEqm7eyKNA3xISnw39NWVG5HF1nt
	0dbf6aQlFFZN4bwkZzjdZ6yhU/vSJKbT3CoZnBVyWvsX4ILPfAez6knxPHZrlX+UX1YT8Cab5jo
	Kgh9HmgJO2KT2IjAAkqlB1TkDvNJkDOpM2AoDTcvUpaSJrqIWEbJZR24AYV/b2cyjPfCt0rHLEL
	6ax+M33CTA2ZnPjH/0GraRAHP+MayR/+sSvxg0Hqseduyq8AfQkF/R0ZD+Gnf0Y0Szk7iNt7lS3
	iMyTSRQPNI7FldP3Hn0sbVJQST8CcuY8kF6H0lM6SUGhGWG6bjJkxNnvY1T8Yv+u5hXOaJGfakg
	wR23bsGB0Ow0hmGYs46q8WxmTyObudhppMnF3puOI5C0BdmdGe/fPDIghwts+lPmNm4e8IV8b3R
	Qewa59pVPwl3uxV9mnvFBX78dMOv2GJBgLPYybqm/8LWpuuUuGbXi2eWA==
X-Received: by 2002:a17:907:fd17:b0:b87:7cb9:c3dc with SMTP id a640c23a62f3a-b880064d660mr16596666b.32.1768872726489;
        Mon, 19 Jan 2026 17:32:06 -0800 (PST)
Received: from ?IPV6:2a02:a466:4d7a:0:6c50:b577:541e:d133? (2a02-a466-4d7a-0-6c50-b577-541e-d133.fixed6.kpn.net. [2a02:a466:4d7a:0:6c50:b577:541e:d133])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795169f10sm1269998766b.26.2026.01.19.17.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 17:32:05 -0800 (PST)
Message-ID: <80837c50-8721-48e7-83bf-223dfc5a3a22@pardini.net>
Date: Tue, 20 Jan 2026 02:32:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Eliminate Odroid HC4 power glitches during boot.
To: Eric.Neulight@linuxdev.slmail.me, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260116-odroid-hc4-dts-v1-1-459b601cd5cf@linuxdev.slmail.me>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <20260116-odroid-hc4-dts-v1-1-459b601cd5cf@linuxdev.slmail.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_173208_930335_69F06B5C 
X-CRM114-Status: GOOD (  23.62  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 17/01/2026 05:02, Eric Neulight via B4 Relay wrote:

> Fix issue with Odroid HC4 (and all meson-sm1-odroid) DTS that causes
> regulator power to momentarily glitch OFF-ON during boot.  Add
> regulator-boot-on to all regulator-fixed and regulator-gpio entries
> that (1) define a gpio AND (2) define regulator-always-on.
> 
> U-boot powers on devices necessary for boot then hands off the DTB to
> the kernel.  During probe, linux drivers/regulator/fixed.c and
> gpio-regulator.c both first set the regulator control gpio (that U-boot
> already turned ON) to default OFF before then setting it to the defined
> (ON) state. This glitches the power to the affected devices, unless
> regulator-boot-on is specified with it.  In fact, U-boot has the same
> behavior.  So, during reboot, a power glitch can actually happen twice:
> once when U-boot reads the DTB and probes the gpio and again when the
> kernel reads the DTB and probes the gpio.
> 
> Problem this fixes: On the Odroid HC4, power to the SATA ports glitches
> during boot and causes some HDDs to do emergency head retract, which
> should be avoided.  On the HC4, power glitches to the SD card, USB,
> SATA, and HDMI interfaces during boot.  These are all boot devices.
> A power glitch can potentially cause a problem for any sensitive devices
> during boot.
> 
> NOTE: This is not limited to just the HC4, likely an issue with ALL DTS
> with regulator-fixed or regulator-gpio entries that (1) define a gpio
> AND (2) define regulator-always-on.  All such entries should also
> include regulator-boot-on in order to avoid potential power glitches.
> At worst, adding regulator-boot-on in such cases is harmless because of
> regulator-always-on, and, at best, it eliminates detrimental power
> glitches during boot.  So, this is best-practice.
> 
> Fixes: 164147f094ec5d0fc2c2098a888f4b50cf3096a7 ("arm64: dts: meson-sm1-odroid-hc4: add regulators controlled by GPIOH_8")
> Fixes: 45d736ab17b44257e15e75e0dba364139fdb0983 ("arm64: dts: meson-sm1-odroid: add 5v regulator gpio")
> Fixes: 1f80a5cf74a60997b92d2cde772edec093bec4d9 ("arm64: dts: meson-sm1-odroid: add missing enable gpio and supply for tf_io regulator")
> Fixes: 88d537bc92ca035e2a9920b0abc750dd62146520 ("arm64: dts: meson: convert meson-sm1-odroid-c4 to dtsi")
> 
> Signed-off-by: Eric Neulight <Eric.Neulight@linuxdev.slmail.me>
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 2 ++
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi    | 3 +++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> index 0170139b8d32f4274ad991b0f3d9a0f6c67969ce..3ece30a0a1fff736c544cf89ed0a8cca0890f128 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> @@ -52,6 +52,7 @@ p12v_0: regulator-p12v-0 {
>   
>   		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
>   		enable-active-high;
> +		regulator-boot-on;
>   		regulator-always-on;
>   	};
>   
> @@ -65,6 +66,7 @@ p12v_1: regulator-p12v-1 {
>   
>   		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
>   		enable-active-high;
> +		regulator-boot-on;
>   		regulator-always-on;
>   	};
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> index c4524eb4f0996dfbccec16ca5b936a5c3b2663a5..0bce4e8d965f2c83e6ba677fef2ede2726de6ed1 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> @@ -37,6 +37,7 @@ tflash_vdd: regulator-tflash-vdd {
>   
>   		gpio = <&gpio_ao GPIOAO_3 GPIO_OPEN_DRAIN>;
>   		enable-active-high;
> +		regulator-boot-on;
>   		regulator-always-on;
>   	};
>   
> @@ -50,6 +51,7 @@ tf_io: gpio-regulator-tf-io {
>   
>   		enable-gpios = <&gpio_ao GPIOE_2 GPIO_OPEN_DRAIN>;
>   		enable-active-high;
> +		regulator-boot-on;
>   		regulator-always-on;
>   
>   		gpios = <&gpio_ao GPIOAO_6 GPIO_OPEN_SOURCE>;
> @@ -81,6 +83,7 @@ vcc_5v: regulator-vcc-5v {
>   		regulator-name = "5V";
>   		regulator-min-microvolt = <5000000>;
>   		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
>   		regulator-always-on;
>   		vin-supply = <&main_12v>;
>   		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
> 
> ---
> base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
> change-id: 20260116-odroid-hc4-dts-54f4254d8554
> 
> Best regards,

Tested with 6.19-rc5 base on an Odroid-HC4 running with a single 2.5" HDD.

This patch does not solve (as I hoped) unrelated/long standing issues 
like the "famous" disk noise at/~around PCIe/AHCI probe time nor the 
fact the 5V rail can't properly power two 5V disks when at least one of 
them is spinning rust -- but also doesn't cause any new problems that I 
can detect (SMART etc).

I hope someone with 12V disks could take a this for a spin and report 
further; I really can't take mine out of "production" anytime soon.

Tested-by: Ricardo Pardini <ricardo@pardini.net> # on Odroid-HC4 5V HDD

Thanks,
Ricardo


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
