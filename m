Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24D5C433E6
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 08:09:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 638EB2080D
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 08:09:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jSec8jVp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pOt1GBD7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 638EB2080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:From:References:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=liaj35dbEnWdKWAYEzFU0ygd8UxwATET99efdGtDA8o=; b=jSec8jVpWOWNob+HzeesYywOGO
	rLGbscLQqJ6sUKu3Vt1UW/nrlHy1K3+DzdA2F8B7ERgFSKphhSMcofD3BvzJ6dNncDuo3a6aiKeug
	cQwts08QSeV21nxx23wvG4o78shaWeHDpSVyqYHVtmNdhQKQrt7YV498+l80kxkWwoR5erzRPBkGU
	asaj23QufXO1g08RT4JZHLexEFck2fjmL2YglnVBo4rFVioAAt15KIJdj8JRiIG3hMvmdlMuE78+L
	XNV2HaCyctMcYLZ7yJXFKn1ZqcpCYuVqhvPTeL2oaGOz6vS+G4JrUm3/eV+bcP3CQz9Wfb6BdIrss
	GFB+iEUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxnLB-0002Bg-OG; Tue, 21 Jul 2020 08:09:33 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxnL4-00027o-8f
 for linux-amlogic@lists.infradead.org; Tue, 21 Jul 2020 08:09:27 +0000
Received: by mail-wr1-x441.google.com with SMTP id f2so20205913wrp.7
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Jul 2020 01:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:subject:in-reply-to:date:message-id
 :mime-version; bh=DGQiBnudDDICkkg4xVI7HW77Z0RigV8LIlLadbU+EEQ=;
 b=pOt1GBD79wodpEEnJKqsbHLQBYjgXCYPSIAtjLHVfjAvHSMCpGXHkNl2hiqSRHV4Dn
 i/dmGtoz8SVUHBJkkOpMzfkuQ0Uhkt06fasqf3Fzw+r+05rKMbbkb1QLbZi3iZh3kmrR
 d7CS5BPoQdV1a9V7+A2DAzJ4TKkYm6qeWip4sv5yORePAserRGanXb1s9gkB6k684EFk
 0WBYLSmIyAN0aPhuUX8PkLYWU3au4Cej8zBjetTQ+zqMc6TT5ep3qTmgvxJJh+aV5tLc
 1bnQcrX3REmhzdl1gweGYyDwBqtfANbyKSKUIb9irV18E2pMKxusDYUYzqQDLq+8XwRY
 8f+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:subject
 :in-reply-to:date:message-id:mime-version;
 bh=DGQiBnudDDICkkg4xVI7HW77Z0RigV8LIlLadbU+EEQ=;
 b=BiscXL+gnXMDiMZ7dOaD/RxUDG77WlFIglltdjhwGlb8Cn60cffwcneyTIkdiMnF7c
 n91FfpR6f/WMJGZxzuXMhHa0gxKcFB4xl1061upxpc2ZORtVlUaX2UVvwj7lrmFH1TPa
 Yb0gWZLnEbjSE9T5hCdciigf/95Dcu01zpUjBIbJDM/+MCR2pw5ubo7vIGe1RaxIaux7
 BT0qU0OsR9g69IqzmnhGeHbBfv93kEso2cCrm7Go+P9uf+ym9eaxrSbNl6XkxSezN2iz
 wLDw0FZ6+7a0/QUDIVy5+w0XoXpuWqRNz5LV3/95K1FQS2N/QcsC1NU2WRR4UAV//I9J
 izjQ==
X-Gm-Message-State: AOAM530z6lebpmu0WiVGUySSie6nzN4Unv0S7EqiVWhC7LYmvNZq/L3n
 UsZanRhkgeAU+FcsWaa79RwdjFIGpfE=
X-Google-Smtp-Source: ABdhPJx/gcL0C20PlaU7xNS8FDsl7n66y1Y9HoeAVCVF/CO4s1gXYPovy87PbavDyBgnD3TTrt0DHw==
X-Received: by 2002:a5d:4bc8:: with SMTP id l8mr24973415wrt.159.1595318963399; 
 Tue, 21 Jul 2020 01:09:23 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c24sm11466819wrb.11.2020.07.21.01.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 01:09:21 -0700 (PDT)
References: <20200718052258.2890-1-christianshewitt@gmail.com>
 <20200718052258.2890-2-christianshewitt@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: meson: add initial Beelink GS-King-X
 device-tree
In-reply-to: <20200718052258.2890-2-christianshewitt@gmail.com>
Date: Tue, 21 Jul 2020 10:09:20 +0200
Message-ID: <1jy2nd8f2n.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_040926_343231_27DE34E4 
X-CRM114-Status: GOOD (  15.94  )
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


On Sat 18 Jul 2020 at 07:22, Christian Hewitt <christianshewitt@gmail.com> wrote:

> The Shenzen AZW (Beelink) GS-King-X is based on the Amlogic W400 reference
> board with an S922X-H chip.
>
> - 4GB LPDDR4 RAM
> - 64GB eMMC storage
> - 10/100/1000 Base-T Ethernet
> - AP6356S Wireless (802.11 a/b/g/n/ac, BT 4.1)
> - HDMI 2.1 video
> - S/PDIF optical output
> - 2x ESS9018 audio DACs
> - 4x Ricor RT6862 audio amps
> - Analogue headphone output
> - 1x USB 2.0 OTG port
> - 3x USB 3.0 ports
> - IR receiver
> - 1x micro SD card slot (internal)
> - USB SATA controller with 2x 3.5" drive bays
> - 1x Power on/off button
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>  .../boot/dts/amlogic/meson-g12b-gsking-x.dts  | 170 ++++++++++++++++++
>  2 files changed, 171 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
>
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 5cac4d1d487d..99a6e8e0b644 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -3,6 +3,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-axg-s400.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12a-sei510.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gsking-x.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking-pro.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
> new file mode 100644
> index 000000000000..60b681d6cfe3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
> @@ -0,0 +1,170 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2019 BayLibre, SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + * Copyright (c) 2019 Christian Hewitt <christianshewitt@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-g12b-w400.dtsi"
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
> +
> +/ {
> +	compatible = "azw,gsking-x", "amlogic,g12b";
> +	model = "Beelink GS-King X";
> +
> +	gpio-keys-polled {
> +		compatible = "gpio-keys-polled";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		poll-interval = <100>;
> +
> +		power-button {
> +			label = "power";
> +			linux,code = <KEY_POWER>;
> +			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		blue {
> +			color = <LED_COLOR_ID_BLUE>;
> +			function = LED_FUNCTION_STATUS;
> +			gpios = <&gpio_ao GPIOAO_11 GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
> +		};
> +	};
> +
> +	spdif_dit: audio-codec-1 {
> +		#sound-dai-cells = <0>;
> +		compatible = "linux,spdif-dit";
> +		status = "okay";
> +		sound-name-prefix = "DIT";
> +	};
> +
> +	sound {
> +		compatible = "amlogic,axg-sound-card";
> +		model = "G12B-GSKING-X";
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

This can't have been tested, it is not not supported by the HDMI
controller. Also spdifout B is not even connected to a FIFO interface,
there is not route to it

Please drop the HDMI-SPDIF related stuff, include spdifout_b

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
> +};
> +
> +&clkc_audio {
> +	status = "okay";
> +};
> +
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


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
