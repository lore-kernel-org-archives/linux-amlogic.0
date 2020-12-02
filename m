Return-Path: <SRS0=7yak=FG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F35C64E7C
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Dec 2020 15:48:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68578217A0
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Dec 2020 15:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68578217A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:From:References:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeovC0flfCM+eUHPiY8cT2C3d87gWpIKzZpFuJo5A6s=; b=rHp03EH9JcseSSnVhLoILlK5vl
	tainf1zZZ2vkIllfTBkSvgKjhw+kQVOew/oWxOEzedU4Y3jt4vbXI9b2wCUJ+XffIMcz9B6mlMTsk
	BGTpONlV5PqdyYpzia6mhCLocmrkQkKuontiC5wrp8I0+TiyLyU9d6S9kNb4ZX5yPQMxQA8MmzPu8
	/bsRUsEmKIxoc8WQ7OS1/ydAGGGmG4Lfmk/ioiOSnJFOvw6Vz4ovCWPdgp67rsY/kyRl4/FAM4FCt
	MjONj1MW3kIWP4bQyoVFwBan9ePpcrt+2SsQGyGBrK9ootuZ89maqo1keI/YLybF3NbYxNS6G2Z+t
	bF+EExYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkUN2-0004tC-Dr; Wed, 02 Dec 2020 15:48:44 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkUMz-0004rk-Hu
 for linux-amlogic@lists.infradead.org; Wed, 02 Dec 2020 15:48:43 +0000
Received: by mail-wm1-x342.google.com with SMTP id x22so8407443wmc.5
 for <linux-amlogic@lists.infradead.org>; Wed, 02 Dec 2020 07:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:subject:in-reply-to:message-id:date
 :mime-version; bh=aK2Yejuziy9XYpoRYVV6bzgJz5NlgVPwFHDuLLWc9Ug=;
 b=Bdjc1UwJwZGMSn7TM4F4sOv7ZcNypjDjFExNtcI88V83srE3qggHvizPjaeCEbaucL
 +aB/EW09iqQSYC720eeWbk9D2YyMm1mBOk8eFTM7tSacgqqupB3LtwiQRJN1/eP10hDI
 VaRZZ/fodJW9tcsrcSaWEP/slWcVW1cGBa3WzSnuKPIahMzbqPSjzmcmSWNzT8PyobRi
 fQ2WA7OH+P3F3Df8ulVSNXFLyrDpYBHe8nH4ijdrPjZwi/q1CqQmFoDN5h+FeQHXi6iL
 i/kUNrbmoCltJYPmzaJu/Np1q3WAURywvJ/VtHXp4hGtsiYzwD8tWJJ9XXGmiiJoL8jl
 iW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:subject
 :in-reply-to:message-id:date:mime-version;
 bh=aK2Yejuziy9XYpoRYVV6bzgJz5NlgVPwFHDuLLWc9Ug=;
 b=NRsmIvpPM0eymBOGidAHou2dNQYGcyEB1HWznkCPgRUczxsFU5GLujX1HcRc+o3pGy
 K5FotpmtaoiA/lSVMX/ECkJV1RvYLJdyg2+IGp+veDWxZehyczNrmH2ftUpdpVtc99QP
 Tef84BcYUD9RZeX6ZI4dyoXA8OvhxfNdOSEBmClAbB8Z/NwCfYjtLAXrJ6Od+hQXTEOg
 XjdlPDMCiYMNHBEt+8ILAXsB08v+3dwdqkh6SQjetNuJIcwgGQa2ZrLBZeS/HpLkWbQt
 Z9PLUAVyyJRStwGYpER84fMP0qHqSpHP84jw3Wj1MCJCd0jHs8et8ZCXxinQn5qj0vlm
 l0vg==
X-Gm-Message-State: AOAM530inE9S75B0t02okM4mYyHX9uv4epcMZQF68XhBgqkEgBNT15/o
 AzcJhVhahA3a6Of8VdMfmWVpgw==
X-Google-Smtp-Source: ABdhPJz8kyT3Q+GAhoeJvRzlTWJN6+74jd9rSGhZ+vv9wugh+iaHMt7J2oHuytEnrxiyIiI1z63VYg==
X-Received: by 2002:a7b:ca47:: with SMTP id m7mr3774131wml.33.1606924118881;
 Wed, 02 Dec 2020 07:48:38 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id l8sm2630263wmf.35.2020.12.02.07.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 07:48:38 -0800 (PST)
References: <20201116062031.11233-1-christianshewitt@gmail.com>
 <20201116062031.11233-4-christianshewitt@gmail.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman
 <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] arm64: dts: meson: add audio playback to
 khadas-vim2
In-reply-to: <20201116062031.11233-4-christianshewitt@gmail.com>
Message-ID: <1jk0u0p5t6.fsf@starbuckisacylon.baylibre.com>
Date: Wed, 02 Dec 2020 16:48:37 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_104841_755354_70571D3A 
X-CRM114-Status: GOOD (  15.45  )
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


On Mon 16 Nov 2020 at 07:20, Christian Hewitt <christianshewitt@gmail.com> wrote:

> Add initial audio support limited to HDMI i2s.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  .../dts/amlogic/meson-gxm-khadas-vim2.dts     | 44 +++++++++++++++++--
>  1 file changed, 41 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
> index bff8ec2c1c70..d4734220443c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
> @@ -7,9 +7,9 @@
>  
>  /dts-v1/;
>  
> -#include <dt-bindings/input/input.h>
> -
>  #include "meson-gxm.dtsi"
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/sound/meson-aiu.h>

It's ok to do clean up or refactoring but it should not be done silently
or mixed with something unrelated

Same in the previous patch

>  
>  / {
>  	compatible = "khadas,vim2", "amlogic,s912", "amlogic,meson-gxm";
> @@ -145,6 +145,45 @@
>  		clock-frequency = <32768>;
>  		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
>  	};
> +
> +	sound {
> +		compatible = "amlogic,gx-sound-card";
> +		model = "GXM-KHADAS-VIM2";
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
> +			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
> +			dai-format = "i2s";
> +			mclk-fs = <256>;
> +
> +			codec-0 {
> +				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
> +			};
> +		};
> +
> +		dai-link-2 {
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
>  };
>  
>  &cec_AO {
> @@ -154,7 +193,6 @@
>  	hdmi-phandle = <&hdmi_tx>;
>  };
>  
> -

Same here

>  &cpu_cooling_maps {
>  	map0 {
>  		cooling-device = <&gpio_fan THERMAL_NO_LIMIT 1>;


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
