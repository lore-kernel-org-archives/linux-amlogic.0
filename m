Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69FAC433E5
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 08:21:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B898820714
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 08:21:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WLFPsFJK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TvvwtPFH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B898820714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:From:References:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4PTXN2KG9MtmQiCPUivyY2/BrrPvlmHnqaS0Uv8uqQ=; b=WLFPsFJKDPw4xlBcQx3nn85+hU
	jwLNe1bcKnrWSUIwACWtu0yTsxXV0lTFcrhq+Xj0zyp43sKohO1ZPDFrh+00RkwZyK5O5e4PQgvjo
	aMUXLt1oIPEQ35FBFGavBJWEajOB0Tgm/f+OKDVNHSqHHJXNgiG1ALzBqRHceKvGQ+Kq0xi82fs+F
	eFFjbogEuid3Pix0PbnWcknQcTYTTYTtpIV9hdkj6BdWHNVwmA0fHCpyZeKI8KXXp0UnJ0xajvdl/
	JzvRRKYhPXEIMq3JPwWK/i/YcSlkkUHHgDxlqpoORQIuwmqPXRgokSQqSJMaLEpx1bpTOis/FeFQT
	ISsc2IdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxnWu-00054T-1E; Tue, 21 Jul 2020 08:21:40 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxnWk-00050S-9d
 for linux-amlogic@lists.infradead.org; Tue, 21 Jul 2020 08:21:32 +0000
Received: by mail-wm1-x342.google.com with SMTP id g10so1653080wmc.1
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Jul 2020 01:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:subject:in-reply-to:date:message-id
 :mime-version; bh=uMWFGyYaTk9SRaKtXrAbhRNUe/iVRjZ0CQr2Oah93dc=;
 b=TvvwtPFHKZTUhwEr9W9AXtSlqbKNq06vH+t3GLZT2QS1OMIA96GNjTtRytz3C2Gi5w
 u3Rq95KzXXgL8JGyaQyIVdaKNvOELpTtT6c5FqM6xl83SDIBSB2V++v9f6n16C2enp6R
 lBDDJIoz2oPhubdn47BHyeCSgDAuag+Wqc7jmuXtuVAyQLWOok4RCScH49qQaTDkkiy2
 phywHN1eA411+5AlQP/vD3klsOlgfMF87S5OVp1R2HUgNr2z20/rlg/tfH/4ezLsBEeu
 mUIbMZHvJcUPCHVRvPYYBHK+3l+HaBkOfvZ5WI5y9syy1exLBUcoYhJUmfbUjOgVRZwm
 ty+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:subject
 :in-reply-to:date:message-id:mime-version;
 bh=uMWFGyYaTk9SRaKtXrAbhRNUe/iVRjZ0CQr2Oah93dc=;
 b=B8skcztBcHB6vPkvaiZUOqPAf7BIWFJYjzyCe4dfSI1/6ROK7YvFxS7EzfZR2zoTy1
 hmMhXYA5cZ2g3rYVnX47QKWTFrydMmicw3/J8EHC+qmVq1cMU5GdnDuOaed1I/Lidbqx
 FmOErjA7vrgY/vIlOW4yIp4e2TpO51Mg/bvs44L/XyCu+1LhLEYjCybzKE0SD3GKqeAB
 ob+rG8bNCsfOAgUI11ZvGvOQFfDr2qmlmshCRCT5CU110fLfxiHl0MyzOYaQzXhcsXF8
 dtB+6l19SWDlMHT/cqeTofa9K3HR0FoAVmNRZZc1ZHiBXKVICJ5AfS7HoxnVQAuvQsAT
 /L2A==
X-Gm-Message-State: AOAM532nNPMcbmpLIQM9ZvhkQXEitHsj/oMcyrdIjei4IK2y69SAMlQW
 l2wGs0SqI4nYZ1zpa+b3yzy0NA==
X-Google-Smtp-Source: ABdhPJzRv+7pl9/WdCZxywp6d8aVxlktytPK5D5woF8AKJK9Czov2HPw0/JkawnYD0SQovjvrLrsKQ==
X-Received: by 2002:a1c:750a:: with SMTP id o10mr3065841wmc.165.1595319689264; 
 Tue, 21 Jul 2020 01:21:29 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t202sm2519588wmt.20.2020.07.21.01.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 01:21:28 -0700 (PDT)
References: <20200718065739.7802-1-christianshewitt@gmail.com>
 <20200718065739.7802-10-christianshewitt@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/12] arm64: dts: meson: add audio playback to rbox-pro
In-reply-to: <20200718065739.7802-10-christianshewitt@gmail.com>
Date: Tue, 21 Jul 2020 10:21:27 +0200
Message-ID: <1jv9ih8eig.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_042130_453942_0ACD0235 
X-CRM114-Status: GOOD (  11.07  )
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

> Add initial support limited to HDMI i2s and SPDIF (LPCM).
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  .../boot/dts/amlogic/meson-gxm-rbox-pro.dts   | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
> index c89c9f846fb1..7b23b3da27ff 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
> @@ -14,6 +14,7 @@
>  /dts-v1/;
>  
>  #include "meson-gxm.dtsi"
> +#include <dt-bindings/sound/meson-aiu.h>
>  
>  / {
>  	compatible = "kingnovel,r-box-pro", "amlogic,s912", "amlogic,meson-gxm";
> @@ -33,6 +34,13 @@
>  		reg = <0x0 0x0 0x0 0x80000000>; /* 2 GiB or 3 GiB */
>  	};
>  
> +	spdif_dit: audio-codec-0 {
> +		#sound-dai-cells = <0>;
> +		compatible = "linux,spdif-dit";
> +		status = "okay";
> +		sound-name-prefix = "DIT";
> +	};
> +
>  	leds {
>  		compatible = "gpio-leds";
>  
> @@ -51,6 +59,25 @@
>  		};
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

Same comment here ...

> +
>  	vddio_boot: regulator-vddio-boot {
>  		compatible = "regulator-fixed";
>  		regulator-name = "VDDIO_BOOT";
> @@ -90,6 +117,59 @@
>  		clocks = <&wifi32k>;
>  		clock-names = "ext_clock";
>  	};
> +
> +	sound {
> +		compatible = "amlogic,gx-sound-card";
> +		model = "GXM-RBOX-PRO";
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
>  &ethmac {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
