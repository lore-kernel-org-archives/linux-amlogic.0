Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 696D8C433F4
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 08:18:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 325C32080D
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 08:18:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FugTrJNM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zIIeo0cQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 325C32080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:From:References:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mtn9H6g1AbgBunrnt6m8fMwUtRhtACs9aVpK3QuElmM=; b=FugTrJNM7TzNCZyinInaU+3maj
	UzYgefUqSm1kIjWlAhW8FKsKEAHW0VviPW9oqcnQoDTVFRRJ3Hl3rp8tp0JIx4U5NNbezRirpOB3j
	KFYPXxogz1dphus39BAeWJqrluy8wRA7t+CyDeHj5NU2PlH5q+0SsCVWCbXCmZxCbmlXWlE7obp+7
	Ju6VkSx4YnqIQ4QMVqkSdV2W4uYHyOSpK1HX35Ykn2ZOQiNpSHt/2HSEeVHbNczLR0dGRvEmUFUhd
	jEcmVw6qfGyAm1Ob0x12g+gnzW9RNkP9EYrgdIhZhcG/2du/ZLhWF0TnhW51gh9MZZ6m8Y6KW489l
	K3mCiL9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxnTq-0004EE-5k; Tue, 21 Jul 2020 08:18:30 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxnTn-0004Ce-Dy
 for linux-amlogic@lists.infradead.org; Tue, 21 Jul 2020 08:18:28 +0000
Received: by mail-wm1-x341.google.com with SMTP id f18so1954353wml.3
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Jul 2020 01:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:subject:in-reply-to:date:message-id
 :mime-version; bh=uFols3Vwy8k+lqla1bufgTAtZft6D6LnLJ5Qc7u5vII=;
 b=zIIeo0cQiwEviByTgiHHNai5h5U5Rf782O2PWltyl3GbkQSbOanQbppvj3h0oSMWs1
 aKSrWnY895L/0WDPl4eqql+Hc2jz4xYDL0cdoy7YLcodAvW9U6dso7m3+X/fR6OvZPxe
 K3jQymDXl1HhwsU/GFhhOtifl9XS+5QmAMgmvmPSAzQwQHjUhu8317u7r4ZBuMnXt+TM
 FqP3+uK46+hYVyNzneHw/6aWzl0SSfzURKz2ovPhosS9ayCOBpw6vP4j2Pf3ABflegml
 mZAdA/jq7a4B1jlXP95xs2NEXfBdEr5tenut24DCP3N02+31flVpnC63sNnQViGAjXFA
 GFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:subject
 :in-reply-to:date:message-id:mime-version;
 bh=uFols3Vwy8k+lqla1bufgTAtZft6D6LnLJ5Qc7u5vII=;
 b=k9Hu2RQIeRtatdIPmcWtE1ADNUjgyD0nAr7hB2f6Fc4JIKw9DwV2BE6wDCMEFD3VEi
 UIwfP6tkBjLHfYFdWseC3czalAg/auSycA1LCk+/f9qnxl6fqcVIbFGv8Z2wVXSOd1QI
 pCvk7kRT5TSP08lzWWOBqOMUSqq5GleBAqOqWxGRXtRgjbLjSqgvQkUqv3Q4sXp1dD+3
 Zdx1ApEslfdbGPzChevFqEmVfHAjCw7Wdc6nKNcNZhqGENK0VvPZzQvSXH3hjtHcPGeD
 w1hlFxg7foVYkZtf/OsW3Apf6+EDKWtw+llF8G5iw91aNA/ixcZkwl7AQnJhYSkXUkhQ
 ZsiQ==
X-Gm-Message-State: AOAM533KxdcKuFJpqg70gdwHmOkL1omEJVWTvbYquAw6w6/XSztzxgfm
 ZDjl+YPFPMakVcimBfSiGT6NiA==
X-Google-Smtp-Source: ABdhPJxaxh+KiYHr8PnZ0bN843vkvicXfutHx9gtMYIJpxCBwkEhTh9yheXqd/6ys9g0Xahm9ORLDg==
X-Received: by 2002:a7b:ca52:: with SMTP id m18mr2924047wml.92.1595319506349; 
 Tue, 21 Jul 2020 01:18:26 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id u20sm2313872wmc.42.2020.07.21.01.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 01:18:25 -0700 (PDT)
References: <20200718065739.7802-1-christianshewitt@gmail.com>
 <20200718065739.7802-5-christianshewitt@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/12] arm64: dts: meson: add audio playback to nexbox-a1
In-reply-to: <20200718065739.7802-5-christianshewitt@gmail.com>
Date: Tue, 21 Jul 2020 10:18:25 +0200
Message-ID: <1jwo2x8eni.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_041827_509630_BF232DEA 
X-CRM114-Status: GOOD (  11.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sat 18 Jul 2020 at 08:57, Christian Hewitt <christianshewitt@gmail.com> wrote:

> Add initial support is limited to HDMI i2s and SPDIF (LPCM).
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  .../boot/dts/amlogic/meson-gxm-nexbox-a1.dts  | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
> index 83eca3af44ce..faca6fafc164 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
> @@ -10,6 +10,7 @@
>  /dts-v1/;
>  
>  #include "meson-gxm.dtsi"
> +#include <dt-bindings/sound/meson-aiu.h>
>  
>  / {
>  	compatible = "nexbox,a1", "amlogic,s912", "amlogic,meson-gxm";
> @@ -24,11 +25,37 @@
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	spdif_dit: audio-codec-0 {
> +		#sound-dai-cells = <0>;
> +		compatible = "linux,spdif-dit";
> +		status = "okay";
> +		sound-name-prefix = "DIT";
> +	};
> +
>  	memory@0 {
>  		device_type = "memory";
>  		reg = <0x0 0x0 0x0 0x80000000>;
>  	};
>  
> +	vddio_ao18: regulator-vddio_ao18 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDIO_AO18";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	hdmi_5v: regulator-hdmi-5v {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "HDMI_5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +
> +		gpio = <&gpio GPIOH_3 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};

Please explain how this is related to change decribed in the commit
description.

> +
>  	vddio_boot: regulator-vddio-boot {
>  		compatible = "regulator-fixed";
>  		regulator-name = "VDDIO_BOOT";
> @@ -75,6 +102,59 @@
>  			};
>  		};
>  	};
> +
> +	sound {
> +		compatible = "amlogic,gx-sound-card";
> +		model = "GXM-NEXBOX-A1";
> +		assigned-clocks = <&clkc CLKID_MPLL0>,
> +				  <&clkc CLKID_MPLL1>,
> +				  <&clkc CLKID_MPLL2>;
> +		assigned-clock-parents = <0>, <0>, <0>;
> +		assigned-clock-rates = <294912000>,
> +				       <270950400>,
> +				       <393216000>;
> +		status = "okay";
> +
> +		dai-link-0 {
> +			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
> +		};
> +
> +		dai-link-1 {
> +			sound-dai = <&aiu AIU_CPU CPU_SPDIF_FIFO>;
> +		};
> +
> +		dai-link-2 {
> +			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
> +			dai-format = "i2s";
> +			mclk-fs = <256>;
> +
> +			codec-0 {
> +				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
> +			};
> +		};
> +
> +		dai-link-3 {
> +			sound-dai = <&aiu AIU_CPU CPU_SPDIF_ENCODER>;
> +
> +			codec-0 {
> +				sound-dai = <&spdif_dit>;
> +			};
> +		};
> +
> +		dai-link-4 {
> +			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
> +
> +			codec-0 {
> +				sound-dai = <&hdmi_tx>;
> +			};
> +		};
> +	};
> +};
> +
> +&aiu {
> +	status = "okay";
> +	pinctrl-0 = <&spdif_out_h_pins>;
> +	pinctrl-names = "default";
>  };
>  
>  &cec_AO {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
