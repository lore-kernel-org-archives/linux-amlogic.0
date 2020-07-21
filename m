Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4B4C433E3
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 09:14:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 784D920792
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 09:14:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="thi0nXWg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="shpVXeSI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 784D920792
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JBlVnICXcDullq0qdwOUIp0qk79Rk41bw1xCLpjfIzk=; b=thi0nXWgNvr8UydB0UJtT0ULH
	QFSKCGff5K9D2xeNxwyMvKpFjw/WfQdBXhCik1USOfqAAVus2hlDYA6YAAWoonpHtCaRSkX/OBF/g
	0epddr1zOisUleW8ISepGv4KxUFK00/R86MQj/UikaletXH1jqhyuShpbqMQePSM5PXpYsTG3yP3I
	D0ei82afBuRNpCWUfE69PZqchNdaKLLJTYE23aE9gvfVb4hIunLgRga9lsUabLu6mBIPCO3zytyKX
	R6XcGhYBKUzuRUl53eBa32k5foOF+SkjN65KrYzSvWHqhSTDW83wbEJ2KPkeMW+zWPWYArA/2H5gO
	N+N28hlMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxoLx-00061V-FV; Tue, 21 Jul 2020 09:14:25 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxoLu-0005zt-KH
 for linux-amlogic@lists.infradead.org; Tue, 21 Jul 2020 09:14:23 +0000
Received: by mail-wm1-x344.google.com with SMTP id 17so2130550wmo.1
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Jul 2020 02:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=E59bzjWg+c0MHaEx1BoDiS6FYfnfwzF0HRnaYqe7suo=;
 b=shpVXeSITBS4EKpVLrwdRPEWjlOdVZI6BidG4XTDQW2+wUhpxQei7Cuxq6CAnmZCsU
 S/XaADtHoPl0JNTWMqPJmyDNcqdqFQoX4dVjaxya+6vjdpsQrUUDNk1JN6qkztUdDqcb
 UU866k5p6jMaXdiScY9oJhZZoqvCKO7jIf/88rqW6zragfQ16AfDocaKie1uU10/JLh4
 4c5Vr8Ya6KJd/QZBZxVPOJO/qyaWggf4F497tvpmbOlG0f27ZUdJxnnb1rm5/39fEdxF
 reN5whVwlaP3VIGiYNYmlENFVk/uplllFInFLw8FmPTVYwQGLHzQQPOlZv8buvlNcmuI
 /DxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=E59bzjWg+c0MHaEx1BoDiS6FYfnfwzF0HRnaYqe7suo=;
 b=X4jO1U6ACP15m2PJKE5l8xU3KBsanS37wsiicc7sbA0jpRLpyKvr7lP7cfcmH2JVoy
 p15tXMEB65x9GyguNbXmwAs3lyA+syya8mw2NbDPVH+6e+rWXsZbne/besnMbYGuK0sO
 ZiIoGhbB4S0pwXxi3mcvPkqg+CYij6CB6CJNDHkbl1dD++kuKUs+/TbXlGtSQuZglWru
 b+AJhBbVWsbksibn/y/Nx+IgKaNTmkpPtG3aINUmCobhZ52S+X0AhYEZ3imRETHy2rmN
 zkYXSbHXVP0ekkrRFq45IJvia3SwRngSFKjZakLt5T4KsGasKHP+lBjiPeKk6FLuKCuc
 kVVQ==
X-Gm-Message-State: AOAM530JVUVTt53yB5/RiAmREFAOqDzO1UbhZqLRV6/fjtUw+HTsfANJ
 yNVRN/UaOUnT4z5VWLtXQYpnOA==
X-Google-Smtp-Source: ABdhPJxBbU7EYiACWX6oiDhUp9tR7cuERyVtBjdHxSpkHaSwpStuHoOiCT3EbUH505j9OOrf0KN24A==
X-Received: by 2002:a05:600c:282:: with SMTP id
 2mr3402783wmk.168.1595322860725; 
 Tue, 21 Jul 2020 02:14:20 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id m9sm2516472wml.45.2020.07.21.02.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 02:14:19 -0700 (PDT)
References: <20200719141034.8403-1-christianshewitt@gmail.com>
 <20200719141034.8403-4-christianshewitt@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: meson: add support for the ODROID-N2+
In-reply-to: <20200719141034.8403-4-christianshewitt@gmail.com>
Date: Tue, 21 Jul 2020 11:14:19 +0200
Message-ID: <1jo8o98c2c.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_051422_718451_BE2A2814 
X-CRM114-Status: GOOD (  15.93  )
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
Cc: Dongjin Kim <tobetter@hardkernel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sun 19 Jul 2020 at 16:10, Christian Hewitt <christianshewitt@gmail.com> wrote:

> HardKernel ODROID-N2+ uses an Amlogic S922X rev. C chip capable of higher
> clock speeds than the original ODROID-N2. Hardkernel supports the big cpu
> cluster at 2.4GHz and the little cpu cluster at 2.0GHz. Opp points and
> regulator changess are from the HardKernel Linux kernel sources.
>
> Suggested-by: Dongjin Kim <tobetter@hardkernel.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>  .../dts/amlogic/meson-g12b-odroid-n2-plus.dts | 53 +++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
>
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 5cac4d1d487d..6dc508b80133 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking-pro.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2-plus.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-ugoos-am6.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
> new file mode 100644
> index 000000000000..99e96be509f8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2019 BayLibre, SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-g12b-odroid-n2.dtsi"
> +
> +/ {
> +	compatible = "hardkernel,odroid-n2-plus", "amlogic,s922x", "amlogic,g12b";
> +	model = "Hardkernel ODROID-N2+";
> +
> +	vddcpu_a: regulator-vddcpu-a {
> +		regulator-min-microvolt = <680000>;
> +		regulator-max-microvolt = <1040000>;
> +
> +		pwms = <&pwm_ab 0 1500 0>;
> +	};
> +
> +	vddcpu_b: regulator-vddcpu-b {
> +		regulator-min-microvolt = <680000>;
> +		regulator-max-microvolt = <1040000>;
> +
> +		pwms = <&pwm_AO_cd 1 1500 0>;
> +	};
> +
> +	cpu_opp_table_0: opp-table-0 {
> +		opp-1908000000 {
> +			opp-hz = /bits/ 64 <1908000000>;
> +			opp-microvolt = <1030000>;
> +		};
> +
> +		opp-2016000000 {
> +			opp-hz = /bits/ 64 <2016000000>;
> +			opp-microvolt = <1040000>;
> +		};
> +	};
> +
> +	cpub_opp_table_1: opp-table-1 {
> +		opp-2304000000 {
> +			opp-hz = /bits/ 64 <2304000000>;
> +			opp-microvolt = <1030000>;
> +		};
> +
> +		opp-2400000000 {
> +			opp-hz = /bits/ 64 <2400000000>;
> +			opp-microvolt = <1040000>;
> +		};
> +	};

Are this opp specific to the N2+ or S922x rev C ?
If it is the latter, shouldn't these be in s922x-revC dtsi ?

> +};
> +


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
