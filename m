Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D4AC433DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 09:58:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55BBD20729
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 09:58:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nuiM7gKa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Is3ZO80E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55BBD20729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mcaKOy59DvMCf56Fm4f4unD7f9QzENARTNVbRAl4Kno=; b=nuiM7gKa4AdzRSamNK31r/yOu
	F0uAuNtAkeEVoDFN2okPHlygl4Is4sirh5ajJLRuHcg4w5wJTCl67Quzyis6n8MzYdBlXfn5odKak
	80/4zFpS3BEMqpNklRceKXfs4LrSMxOJLtkm1r/HhZb2MaLEpW97/W4mET575QjkSXqks564qCHpp
	Ddg3d/iHFdeT5lCkq5PpPF2rH5p4tBURnV31K79Urgh+UlVI21/0pfXUreI6QxhVLqSlWUBdJ3D60
	ffnJ5AQg9lv5X09n3j0Uc82U+kb//RqI5szNe6bz64mZdX2nyij3IOLIfhBvvQBaXEg2oKsYl/8JK
	NMEr9dxSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxp2X-0004hl-Va; Tue, 21 Jul 2020 09:58:26 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxp2T-0004ge-Ur; Tue, 21 Jul 2020 09:58:22 +0000
Received: by mail-wr1-x441.google.com with SMTP id f7so20587727wrw.1;
 Tue, 21 Jul 2020 02:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=uQnhIuf4xfOnC38xqH6WdF/IwObbq5YHuPCxVqakQOQ=;
 b=Is3ZO80EuUuGJQl50+Q3Q28jYd7EBEJflzDKoC9uUMKwkdHBva83bhxF7Mh2bHAC04
 1ELE4/iZTPMU3KzPCQsede9BSVUYwZHJsT1jGwyf7ifSL4yTvn1OrxcbtkfwhCuaj6rC
 K0eJNkt4S255E6kb4wzy5JpDQNv3wS4luBxrnTZjsFlBv/I3lzUbHHL5lZPt5m0PuMHv
 dnd7Rqf7m4JAJnP5LOYlrpcVMUEb0/0uwEQs8c4HBQxA4TyaaV7bGFLaRcvjIuRwL+tu
 R1vzIci92T1aVyQMToT4xAEJQmOlk9KS96dhmx0vxeXiSq8ErrtFJrfXRtbWQBn/WHIl
 eylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=uQnhIuf4xfOnC38xqH6WdF/IwObbq5YHuPCxVqakQOQ=;
 b=YRgok2DRax7I1rxuxqTxTKxoLerO46nzyZ9uhlsdVAwZy5QqphbW15XuWdCSlvdRGc
 UDE3miL9jOqJoJQ5xa0B3UTsY/0GLq/KMmMUYwSgTJI2mQ4iu3Zf8K8u5RzvyvXfJOH+
 ydP5UHfqXykCCr/jz5m4VJD/41ji0tALandM3s8V99XVm6wk16yCqj48P7DSd7JjJ11P
 AXkSwUww6dH/ktXhGGEEnVG8K4COFaWvJw7q61ZGC5tFKrt/z7+waCvCQ5AkOwnBZsNR
 U9QRZytTzvXWjaeaXmgfM5Mp7Kwj3X/YgQbdPlFqM0Ruz5qO2wonoGmGuGFU6iS35tZs
 nWNA==
X-Gm-Message-State: AOAM532bY5Ec0Z+WQ6gPbMeEcqKwdRa5XWiitpq9I2Aluo4bQyWDEmMN
 hMaApgUys5NA0VdzQTaVyZM=
X-Google-Smtp-Source: ABdhPJyfdvD/kATKHtgQiw1J5nkCvpWkT+B1WdiQKjZHwXlEbW+rjhyO2ucEqZVbpcMZIJo+AeMQcg==
X-Received: by 2002:a5d:4b4f:: with SMTP id w15mr25338306wrs.84.1595325501024; 
 Tue, 21 Jul 2020 02:58:21 -0700 (PDT)
Received: from [10.182.202.153] ([87.201.30.26])
 by smtp.gmail.com with ESMTPSA id u20sm2612045wmc.42.2020.07.21.02.58.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Jul 2020 02:58:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.14\))
Subject: Re: [PATCH 3/3] arm64: dts: meson: add support for the ODROID-N2+
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <fc679db1-be92-c384-0fe2-3b06c920ea75@baylibre.com>
Date: Tue, 21 Jul 2020 13:58:17 +0400
Message-Id: <3A598AB3-635D-4110-AC1C-94379E036586@gmail.com>
References: <20200719141034.8403-1-christianshewitt@gmail.com>
 <20200719141034.8403-4-christianshewitt@gmail.com>
 <90da2697-9dcc-1d75-eded-bf4bdc4b594b@baylibre.com>
 <fc679db1-be92-c384-0fe2-3b06c920ea75@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailer: Apple Mail (2.3445.104.14)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_055822_032843_FD66EBDA 
X-CRM114-Status: GOOD (  13.94  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Dongjin Kim <tobetter@hardkernel.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


> On 21 Jul 2020, at 12:19 pm, Neil Armstrong <narmstrong@baylibre.com> wrote:
> 
> On 21/07/2020 10:10, Neil Armstrong wrote:
>> On 19/07/2020 16:10, Christian Hewitt wrote:
>>> HardKernel ODROID-N2+ uses an Amlogic S922X rev. C chip capable of higher
>>> clock speeds than the original ODROID-N2. Hardkernel supports the big cpu
>>> cluster at 2.4GHz and the little cpu cluster at 2.0GHz. Opp points and
>>> regulator changess are from the HardKernel Linux kernel sources.
>>> 
>>> Suggested-by: Dongjin Kim <tobetter@hardkernel.com>
>>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>>> ---
>>> arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>>> .../dts/amlogic/meson-g12b-odroid-n2-plus.dts | 53 +++++++++++++++++++
>>> 2 files changed, 54 insertions(+)
>>> create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
>>> 
>>> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
>>> index 5cac4d1d487d..6dc508b80133 100644
>>> --- a/arch/arm64/boot/dts/amlogic/Makefile
>>> +++ b/arch/arm64/boot/dts/amlogic/Makefile
>>> @@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking-pro.dtb
>>> dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
>>> dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
>>> dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
>>> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2-plus.dtb
>>> dtb-$(CONFIG_ARCH_MESON) += meson-g12b-ugoos-am6.dtb
>>> dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
>>> dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
>>> new file mode 100644
>>> index 000000000000..99e96be509f8
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
>>> @@ -0,0 +1,53 @@
>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>> +/*
>>> + * Copyright (c) 2019 BayLibre, SAS
>>> + * Author: Neil Armstrong <narmstrong@baylibre.com>
>>> + */
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include "meson-g12b-odroid-n2.dtsi"
>>> +
>>> +/ {
>>> +	compatible = "hardkernel,odroid-n2-plus", "amlogic,s922x", "amlogic,g12b";
>>> +	model = "Hardkernel ODROID-N2+";
>>> +
>>> +	vddcpu_a: regulator-vddcpu-a {
>>> +		regulator-min-microvolt = <680000>;
>>> +		regulator-max-microvolt = <1040000>;
>>> +
>>> +		pwms = <&pwm_ab 0 1500 0>;
>>> +	};
>>> +
>>> +	vddcpu_b: regulator-vddcpu-b {
>>> +		regulator-min-microvolt = <680000>;
>>> +		regulator-max-microvolt = <1040000>;
>>> +
>>> +		pwms = <&pwm_AO_cd 1 1500 0>;
>>> +	};
>>> +
>>> +	cpu_opp_table_0: opp-table-0 {
>>> +		opp-1908000000 {
>>> +			opp-hz = /bits/ 64 <1908000000>;
>>> +			opp-microvolt = <1030000>;
>>> +		};
>>> +
>>> +		opp-2016000000 {
>>> +			opp-hz = /bits/ 64 <2016000000>;
>>> +			opp-microvolt = <1040000>;
>>> +		};
>>> +	};
>>> +
>>> +	cpub_opp_table_1: opp-table-1 {
>>> +		opp-2304000000 {
>>> +			opp-hz = /bits/ 64 <2304000000>;
>>> +			opp-microvolt = <1030000>;
>>> +		};
>>> +
>>> +		opp-2400000000 {
>>> +			opp-hz = /bits/ 64 <2400000000>;
>>> +			opp-microvolt = <1040000>;
>>> +		};
>>> +	};
>>> +};
>>> +
>>> 
>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>> 
> 
> Wait no, it should be:
> 
> / {
> 	compatible = "hardkernel,odroid-n2-plus", "amlogic,s922x", "amlogic,g12b";
> 	model = "Hardkernel ODROID-N2+";
> };
> 
> &vddcpu_a {
> 	regulator-min-microvolt = <680000>;
> 	regulator-max-microvolt = <1040000>;
> 
> 	pwms = <&pwm_ab 0 1500 0>;
> };
> 
> &vddcpu_b {
> 	regulator-min-microvolt = <680000>;
> 	regulator-max-microvolt = <1040000>;
> 
> 	pwms = <&pwm_AO_cd 1 1500 0>;
> };
> 
> &cpu_opp_table_0 {
> 		opp-1908000000 {
> 		opp-hz = /bits/ 64 <1908000000>;
> 		opp-microvolt = <1030000>;
> 	};
> 
> 	opp-2016000000 {
> 		opp-hz = /bits/ 64 <2016000000>;
> 		opp-microvolt = <1040000>;
> 	};
> };
> 
> &cpub_opp_table_1 {
> 	opp-2304000000 {
> 		opp-hz = /bits/ 64 <2304000000>;
> 		opp-microvolt = <1030000>;
> 	};
> 
> 	opp-2400000000 {
> 		opp-hz = /bits/ 64 <2400000000>;
> 		opp-microvolt = <1040000>;
> 	};
> };
> 
> Neil

Okay, I will send corrected v2 and with model name changed.

Christian
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
