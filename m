Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24FFC35FFA
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Mar 2025 08:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9kEpRxmz7SrYYgQJpWdajsvFGyAuBDPAYz5hs6iACw=; b=0u8ESvD5Iy+0Zy
	rPqMx6SMGWx+2pTI8dVh+AGkG8qUwcNBcBIHsgYJ9gEWF4qkFcDMGhyM2tBtUbz1KwLo/zszoyjYz
	+jyfd1FvB6/eX7DH1tP7s4P3c0YqaqY9LknoszYTf2NCdau8daG5bYmJJS0zCWXYe9QDYUaFHLy6+
	Qewx+8RiS1w+HBD/mlwH/zvkxkPUZvCmUW5f/TRBgt+2qQsK8nWrgp3FqCB8QBk2L9mDTYzuQZbJJ
	V4mEIFN2ddq825ylI0/CLGcB0YTrF3EIVIyeviRxiL5Bi0Fl90ZV8dQ0gKIZZ8GUeljdHQQ1HtqEJ
	giaN9JgZkvoTFDd3gRQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuolt-00000008LVe-0QtL;
	Wed, 19 Mar 2025 08:27:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuol3-00000008LNk-1Fxj;
	Wed, 19 Mar 2025 08:26:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 83F725C5A5A;
	Wed, 19 Mar 2025 08:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42ACEC4CEEF;
	Wed, 19 Mar 2025 08:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742372796;
	bh=rU8+WkMYfMbYGpZkfzJ96Y2lKsnKTuKpexBprl+FdL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iD1Q8F9SxEXHSwXQ1X2w7c3ld3gV/mL5RfjN7hAaqzoyXEImk03FucbmYTiLOF1/u
	 g0fDh1IbMn0C8FwiWcxb/EVy9hblcEpfUSERUkgftXppqOrI26KCxrxi/f4encpSJE
	 vVBtTaghWd6YD+YWKqSCoeI9lETXJDXCxyzYdAnXOZ0I09UGvtdtJ//Ch0jlfZb/cL
	 VptXpjYUTop3ncVYD+Q6+AdCzFpDdTmlMGrhklmSFIIL51TDTpf7dwZGN3mIOHj4v9
	 h6E6qIHTl4iiQ+29rBXbzKFnpGKPNtIP30R6+FpchxFascpfS0oQvCg5VleMat6kAr
	 9tEn9ZYUSRPPw==
Date: Wed, 19 Mar 2025 09:26:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: jiebing chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, jian.xu@amlogic.com, 
	shuai.li@amlogic.com, zhe.wang@amlogic.com
Subject: Re: [PATCH v4 6/6] arm64: dts: amlogic: Add Amlogic S4 Audio
Message-ID: <20250319-quizzical-coyote-of-assurance-d4c91d@krzk-bin>
References: <20250319-audio_drvier-v4-0-686867fad719@amlogic.com>
 <20250319-audio_drvier-v4-6-686867fad719@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250319-audio_drvier-v4-6-686867fad719@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_012637_516962_A0420A14 
X-CRM114-Status: GOOD (  16.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Mar 19, 2025 at 03:04:49PM +0800, jiebing chen wrote:
> Add basic audio driver support for the Amlogic S4 based
> Amlogic AQ222 board. use hifipll pll (1179648000) to
> support 768k sample rate and 24 bit (s24_le), 24bit sclk
> is 48fs, use mpll0 (270950400) to support 705.6k sample
> rate and 32bit, use mpll1 (338688000) to support 705.6k
> and 24bit.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>

...

> +
> +		dai-link-12 {
> +			sound-dai = <&toacodec TOACODEC_OUT>;
> +
> +			codec {
> +				sound-dai = <&acodec>;
> +			};
> +		};
> +	};
> +

Do not add stray blank lines.

>  };
>  
>  &pwm_ef {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 957577d986c0675a503115e1ccbc4387c2051620..83edafc2646438e3e6b1945fa1c4b327254a4131 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -11,7 +11,11 @@
>  #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>  #include <dt-bindings/power/meson-s4-power.h>
>  #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
> -

Why?

> +#include <dt-bindings/clock/axg-audio-clkc.h>
> +#include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
> +#include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
> +#include <dt-bindings/sound/meson-g12a-toacodec.h>
> +#include <dt-bindings/sound/meson-g12a-tohdmitx.h>

Old style was correct.

>  / {
>  	cpus {
>  		#address-cells = <2>;
> @@ -46,6 +50,36 @@ cpu3: cpu@3 {
>  		};
>  	};
>  
> +	tdmif_a: audio-controller-0 {
> +		compatible = "amlogic,axg-tdm-iface";
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "TDM_A";
> +		clocks = <&clkc_audio AUD_CLKID_MST_A_SCLK>,
> +			 <&clkc_audio AUD_CLKID_MST_A_LRCLK>,
> +			 <&clkc_audio AUD_CLKID_MST_A_MCLK>;
> +		clock-names = "sclk", "lrclk","mclk";
> +	};
> +
> +	tdmif_b: audio-controller-1 {
> +		compatible = "amlogic,axg-tdm-iface";
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "TDM_B";
> +		clocks = <&clkc_audio AUD_CLKID_MST_A_SCLK>,
> +			 <&clkc_audio AUD_CLKID_MST_B_LRCLK>,
> +			 <&clkc_audio AUD_CLKID_MST_B_MCLK>;
> +		clock-names = "sclk", "lrclk","mclk";
> +	};
> +
> +	tdmif_c: audio-controller-2 {
> +		compatible = "amlogic,axg-tdm-iface";
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "TDM_C";
> +		clocks = <&clkc_audio AUD_CLKID_MST_C_SCLK>,
> +			 <&clkc_audio AUD_CLKID_MST_C_LRCLK>,
> +			 <&clkc_audio AUD_CLKID_MST_C_MCLK>;
> +		clock-names = "sclk", "lrclk","mclk";
> +	};
> +
>  	timer {
>  		compatible = "arm,armv8-timer";
>  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> @@ -101,7 +135,6 @@ apb4: bus@fe000000 {
>  			#address-cells = <2>;
>  			#size-cells = <2>;
>  			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
> -

Why? What is happening in this patch - why are you changing so many
other pieces?

>  			clkc_periphs: clock-controller@0 {
>  				compatible = "amlogic,s4-peripherals-clkc";
>  				reg = <0x0 0x0 0x0 0x49c>;
> @@ -134,6 +167,17 @@ clkc_pll: clock-controller@8000 {
>  				#clock-cells = <1>;
>  			};
>  
> +			acodec: audio-controller@1a000 {
> +				compatible = "amlogic,t9015";
> +				reg = <0x0 0x1A000 0x0 0x14>;
> +				#sound-dai-cells = <0>;
> +				sound-name-prefix = "ACODEC";
> +				clocks = <&clkc_periphs CLKID_ACODEC>;
> +				clock-names = "pclk";
> +				resets = <&reset RESET_ACODEC>;
> +				AVDD-supply = <&vddio_ao1v8>;
> +			};
> +
>  			watchdog@2100 {
>  				compatible = "amlogic,s4-wdt", "amlogic,t7-wdt";
>  				reg = <0x0 0x2100 0x0 0x10>;
> @@ -850,3 +894,327 @@ emmc: mmc@fe08c000 {
>  		};
>  	};
>  };
> +
> +&apb4 {
> +	audio: bus@330000 {
> +		compatible = "simple-bus";
> +		reg = <0x0 0x330000 0x0 0x1000>;

That's not a simple bus in such case.

NAK


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
