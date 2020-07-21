Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB0EC433DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 09:06:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BB6C20714
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 09:06:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n+UzG4oH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Eyu6z8M9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BB6C20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:From:References:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFBLH59M6LYVceGsiEKUqQ3Cxq9dSU/6w6/E0/r+aHU=; b=n+UzG4oHZXcVXfwRX+0OHucu4m
	v1AvHXC+E7SIwiW30dvucBIN/taG1k6r0SJ6hBI0QNaQ4UXlQrpFpir2QHl3RDrA3kcN27NuEolKU
	x1KV0ocnPwfx2dWa3yZaou06Sw+RvgFdWePZnmSkifxHdpUhGXzb8/kWUqboY2dxi+PiqicZlKyHX
	ejCpvhFqjIwoZZzpHpeOJp0LZOE2ss1/escTJ6x+itcCo4gSvpZOhRlLuxn2yZ5olj8ID1bF59iEE
	0KlV/V+vygAG/IV4Yp0z4YdckC1zjUY94AyOCpww1Rh07ihn2qrpqid+Hf6OQr2Ygu9VbEvzLctt8
	yDYsJ5DQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxoEP-0004Od-Lr; Tue, 21 Jul 2020 09:06:37 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxoEM-0004Nd-Gi
 for linux-amlogic@lists.infradead.org; Tue, 21 Jul 2020 09:06:35 +0000
Received: by mail-wr1-x443.google.com with SMTP id q5so20405211wru.6
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Jul 2020 02:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:subject:in-reply-to:date:message-id
 :mime-version; bh=eJAf5TqY4xjyFfENWpYGA/Sf6LhZbLJdf/d4cczg5I4=;
 b=Eyu6z8M9gQaOHXcaenx5F+YLmsjXbJtvlxZGoPNZBVjN4CdNjdja1O0ku/m7fYa31Q
 wKCp8g4WFPmOcNBAiEVOY5MnHiqry+5IGk8bL/5N/K8cI8fuh1mFyxzjqi20olvVWmKN
 gmy+bQivQpZK/J+WczmaJKGBCqcGPb5RY5RybtJUK2bth1GvYGWJWx1SfK7DOpIsxaJm
 QDJnZIJ5BRk5ML2caba270UXEqUoAwHI7crMzk3111BnUwtIXgWepYSHG0H0XkI+jLrn
 0qD/r6lXLoJHfagDnVytE4r6qx6ggNX+MqA8fgWgzdMAF7taIy9wCAfi+0vXpZ+Lghx7
 A3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:subject
 :in-reply-to:date:message-id:mime-version;
 bh=eJAf5TqY4xjyFfENWpYGA/Sf6LhZbLJdf/d4cczg5I4=;
 b=LDvYG371JvspWID/thjPyNkMSB3s0zRYPADRCcBtJBdL/dxNjkd/teLeeD/oZYdLdl
 cap344CUruj4E9qeOwQlRFZLqkk7PiXS3X3kvn0Ob+HLV1xnxvIi/LJDkQp5a/lYxNFM
 jOk3Z4Ix1mUVffG51vNLh/Z24nDG6xDnBh61vU4Z+kvJAGNC/Uu5kkeCkEfVj7r27V8G
 43AJHkAgettHLLETzku1K50Q8oUCZXMQbOgeh2MYo33VJ6GWEly5JQqit8j5cmMjVdz9
 WGNQKPLY9WWpNIe5YS1zlbuKM+DtEiyEm6mbeB+c/zzK/2gmiLLoSCD4h7WsQ52Ci+Ju
 iQ6w==
X-Gm-Message-State: AOAM531lYQsR8x5UGBDSkJdiKAr9z9E2dowbEylhBBU9h4VXlrxDvujf
 IuNjq7d2edZWsaq1f9y+YNV0ZQ==
X-Google-Smtp-Source: ABdhPJywGux2kv6KdL90QlQsaA3xMg9WqWQcw235f44qd/V9UW4J6TBRO1Bu1eOyB3Bu1X6x/ceaSQ==
X-Received: by 2002:adf:8bd3:: with SMTP id w19mr16194729wra.167.1595322393169; 
 Tue, 21 Jul 2020 02:06:33 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g14sm39750016wrw.83.2020.07.21.02.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 02:06:32 -0700 (PDT)
References: <20200719024548.8940-1-christianshewitt@gmail.com>
 <20200719024548.8940-4-christianshewitt@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: meson: add audio playback to u200
In-reply-to: <20200719024548.8940-4-christianshewitt@gmail.com>
Date: Tue, 21 Jul 2020 11:06:32 +0200
Message-ID: <1jpn8p8cfb.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_050634_619130_FE5EA8F5 
X-CRM114-Status: GOOD (  13.04  )
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


On Sun 19 Jul 2020 at 04:45, Christian Hewitt <christianshewitt@gmail.com> wrote:

> Add initial support limited to HDMI i2s and S/PDIF (LPCM).

Nack.

#1. Same comment as before on spdifout B and SPDIF HDMI input.
#2. the u200 is a special reference device with 2 onboards codecs,
    external connector for audio daugther boards and internal codec.
    I don't see another board using that configuration, which would make
    them incompatible
#3. TDM B is a bad choice on this board as it connected to one of the
    i2s codecs of the board, which won't take 4 lines ine.

>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  .../boot/dts/amlogic/meson-g12a-u200.dts      | 131 ++++++++++++++++++
>  1 file changed, 131 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> index a26bfe72550f..dde7e258a184 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> @@ -8,6 +8,7 @@
>  #include "meson-g12a.dtsi"
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/gpio/meson-g12a-gpio.h>
> +#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>  
>  / {
>  	compatible = "amlogic,u200", "amlogic,g12a";
> @@ -18,6 +19,13 @@
>  		ethernet0 = &ethmac;
>  	};
>  
> +	spdif_dit: audio-codec-1 {
> +		#sound-dai-cells = <0>;
> +		compatible = "linux,spdif-dit";
> +		status = "okay";
> +		sound-name-prefix = "DIT";
> +	};
> +
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> @@ -147,6 +155,91 @@
>  		regulator-boot-on;
>  		regulator-always-on;
>  	};
> +
> +
> +	sound {
> +		compatible = "amlogic,axg-sound-card";
> +		model = "G12A-U200";
> +		audio-aux-devs = <&tdmout_b>;
> +		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
> +				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
> +				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
> +				"TDM_B Playback", "TDMOUT_B OUT",
> +				"SPDIFOUT IN 0", "FRDDR_A OUT 3",
> +				"SPDIFOUT IN 1", "FRDDR_B OUT 3",
> +				"SPDIFOUT IN 2", "FRDDR_C OUT 3";
> +
> +		assigned-clocks = <&clkc CLKID_MPLL2>,
> +				  <&clkc CLKID_MPLL0>,
> +				  <&clkc CLKID_MPLL1>;
> +		assigned-clock-parents = <0>, <0>, <0>;
> +		assigned-clock-rates = <294912000>,
> +				       <270950400>,
> +				       <393216000>;
> +		status = "okay";
> +
> +		dai-link-0 {
> +			sound-dai = <&frddr_a>;
> +		};
> +
> +		dai-link-1 {
> +			sound-dai = <&frddr_b>;
> +		};
> +
> +		dai-link-2 {
> +			sound-dai = <&frddr_c>;
> +		};
> +
> +		/* 8ch hdmi interface */
> +		dai-link-3 {
> +			sound-dai = <&tdmif_b>;
> +			dai-format = "i2s";
> +			dai-tdm-slot-tx-mask-0 = <1 1>;
> +			dai-tdm-slot-tx-mask-1 = <1 1>;
> +			dai-tdm-slot-tx-mask-2 = <1 1>;
> +			dai-tdm-slot-tx-mask-3 = <1 1>;
> +			mclk-fs = <256>;
> +
> +			codec {
> +				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
> +			};
> +		};
> +
> +		/* spdif hdmi or toslink interface */
> +		dai-link-4 {
> +			sound-dai = <&spdifout>;
> +
> +			codec-0 {
> +				sound-dai = <&spdif_dit>;
> +			};
> +
> +			codec-1 {
> +				sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_A>;
> +			};
> +		};
> +
> +		/* spdif hdmi interface */
> +		dai-link-5 {
> +			sound-dai = <&spdifout_b>;
> +
> +			codec {
> +				sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_B>;
> +			};
> +		};
> +
> +		/* hdmi glue */
> +		dai-link-6 {
> +			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
> +
> +			codec {
> +				sound-dai = <&hdmi_tx>;
> +			};
> +		};
> +	};
> +};
> +
> +&arb {
> +	status = "okay";
>  };
>  
>  &cec_AO {
> @@ -163,6 +256,10 @@
>  	hdmi-phandle = <&hdmi_tx>;
>  };
>  
> +&clkc_audio {
> +	status = "okay";
> +};
> +
>  &cpu0 {
>  	cpu-supply = <&vddcpu>;
>  	operating-points-v2 = <&cpu_opp_table>;
> @@ -203,6 +300,18 @@
>  	phy-mode = "rmii";
>  };
>  
> +&frddr_a {
> +	status = "okay";
> +};
> +
> +&frddr_b {
> +	status = "okay";
> +};
> +
> +&frddr_c {
> +	status = "okay";
> +};
> +
>  &hdmi_tx {
>  	status = "okay";
>  	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
> @@ -288,6 +397,28 @@
>  	vqmmc-supply = <&flash_1v8>;
>  };
>  
> +&spdifout {
> +	pinctrl-0 = <&spdif_out_h_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&spdifout_b {
> +	status = "okay";
> +};
> +
> +&tdmif_b {
> +	status = "okay";
> +};
> +
> +&tdmout_b {
> +	status = "okay";
> +};
> +
> +&tohdmitx {
> +	status = "okay";
> +};
> +
>  &uart_AO {
>  	status = "okay";
>  	pinctrl-0 = <&uart_ao_a_pins>;


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
