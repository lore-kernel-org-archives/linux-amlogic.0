Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EC7C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Nov 2021 10:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=atcMULeTmutD6/W/aXe8boKGFqoAq28UcWGxXE99D9A=; b=K8CLzUtuLgBYDpG86F5drnJ5y9
	Eu72sp9kP5WhaSAYf1wajcYXqoXc+s6XZFr0W6mMcf0NPY9iVDjRi3nwF1sODAq3vQa8rcM30ZZ3h
	LMXLPltogtbIUyoVL503hLiMHzM7y9Ft0eVwflCyJSXep9erRG0EEecYaTkNMDtzH3qHHcw0tNNNp
	WS/w3E36ISTSLm3wsupI6mluLkpbGe3tzEdcSKVhK2tw4VLeZDZRBSRaJhsNnVSyg2eqPuDJpJV/i
	eJcyF4S7U5EbYCTQNFu1hhujo/jPmMDqc+fDu1yuxqmsp4syoW7RZzgQda/8GIleQcryU7xeZbQR5
	FVD/Dc5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms0ZU-004gTB-KA; Tue, 30 Nov 2021 10:41:12 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms0ZN-004gOM-NB
 for linux-amlogic@lists.infradead.org; Tue, 30 Nov 2021 10:41:07 +0000
Received: by mail-wr1-x42f.google.com with SMTP id a18so43410306wrn.6
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Nov 2021 02:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7qzW9UQMQ2VXjuo41D1158+LAK858E+IduWje5heL+U=;
 b=HDfh1m2EozUHRanYhD8DdMzrOcIAp/66NvUIbxjWKsl8fgJUCuv3zhs91Q+3hjWMPI
 sayTNq+lKpTBdrZm+Ax9ihSDtvQKLMGirT4RR0KhWydesoJ3yoeEGg1nt87m4djkr1o2
 6vRHkQzodCMhGIj7CNLs1LevA7d+dbWoSo501gzwycvFka4tuffrmfC16IP8Byam4+5w
 5p+pebWBZsYBaat+wGPocZKtXpCPulSqX56buj0ULtwUqGbs7MJUMEKObdXr16ve1VN2
 hJg8khw8ZYVIIWv5Jjvm2fjqpu36G1vP2w6lD7xvzeOA/IToMg2d2jNgHH2o0y8bR8Yv
 QlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7qzW9UQMQ2VXjuo41D1158+LAK858E+IduWje5heL+U=;
 b=HFJwMNNBoSn8MIHMuoXbdjpNn15T2ybPtp5Wi/Xb6LhIaEDPmpSHZnBvqS+I+cGDwo
 Vi9yO/clrFsFDBGLfZ6tja7HCwJ9YFAsodDfObnyFw3Fti0hKAD+2zbM/1gZYIqrG45T
 GcqFCaI0jX7uY4jf7fjXBLef4M/w4x/KWSQ70kkbE0wSCUsFLQRb5Jrcpf7q208k4VZ8
 HhRo52uMyGzCnbXJdUIeLqRsriRUIJ8QjisjRx7RxJBmCwAOgItP7sK2/GJTwRgiTDRw
 X1wH1IQA+T7hvlRcb72XQgHNvTYOTss92KZQacMFNBdorwvaq4l3EKybThnL/Kfrqxnv
 0vFg==
X-Gm-Message-State: AOAM530z5Sy3oSvQ4FCAnsilOSrXYQkeBr5hNSna1eSn8Ctu2Tcjds6N
 csgMnd1exLf7ytHlnX1WoCAMMg==
X-Google-Smtp-Source: ABdhPJxsZa3zaqwvCS+OEOOBth8ZPvuNxO0NgiMmM7vo7pvXK7IqUO6kNwci5xAVdcQB5xouVB12aA==
X-Received: by 2002:a5d:68d2:: with SMTP id p18mr39741394wrw.21.1638268863112; 
 Tue, 30 Nov 2021 02:41:03 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:f80b:b9bd:4d6e:b61a?
 ([2001:861:44c0:66c0:f80b:b9bd:4d6e:b61a])
 by smtp.gmail.com with ESMTPSA id y6sm1906091wma.37.2021.11.30.02.41.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 02:41:02 -0800 (PST)
Subject: Re: [PATCH 2/2] arm64: dts: meson: p241: add sound support
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20211130100159.214489-1-jbrunet@baylibre.com>
 <20211130100159.214489-3-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <54a8cd46-c4cc-1c45-becb-6adab4dd262d@baylibre.com>
Date: Tue, 30 Nov 2021 11:41:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211130100159.214489-3-jbrunet@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_024105_812550_8FD02356 
X-CRM114-Status: GOOD (  15.02  )
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

On 30/11/2021 11:01, Jerome Brunet wrote:
> Add the p241 sound card support. This board can play audio through HDMI
> and the internal DAC.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../boot/dts/amlogic/meson-gxl-s805x-p241.dts | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
> index 9d0684a8264b..ff906becd2ab 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
> @@ -8,6 +8,7 @@
>  /dts-v1/;
>  
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/sound/meson-aiu.h>
>  
>  #include "meson-gxl-s805x.dtsi"
>  
> @@ -21,6 +22,13 @@ aliases {
>  		ethernet0 = &ethmac;
>  	};
>  
> +	au2: analog-amplifier {
> +		compatible = "simple-audio-amplifier";
> +		sound-name-prefix = "AU2";
> +		VCC-supply = <&vcc_5v>;
> +		enable-gpios = <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
> +	};
> +
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> @@ -110,6 +118,68 @@ sdio_pwrseq: sdio-pwrseq {
>  		clocks = <&wifi32k>;
>  		clock-names = "ext_clock";
>  	};
> +
> +	sound {
> +		compatible = "amlogic,gx-sound-card";
> +		model = "GXL-P241";
> +		audio-aux-devs = <&au2>;
> +		audio-widgets = "Line", "Lineout";
> +		audio-routing = "AU2 INL", "ACODEC LOLN",
> +				"AU2 INR", "ACODEC LORN",
> +				"Lineout", "AU2 OUTL",
> +				"Lineout", "AU2 OUTR";
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
> +
> +			codec-1 {
> +				sound-dai = <&aiu AIU_ACODEC CTRL_I2S>;
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
> +
> +		dai-link-3 {
> +			sound-dai = <&aiu AIU_ACODEC CTRL_OUT>;
> +
> +			codec-0 {
> +				sound-dai = <&acodec>;
> +			};
> +		};
> +	};
> +};
> +
> +&acodec {
> +	AVDD-supply = <&vddio_ao18>;
> +	status = "okay";
> +};
> +
> +&aiu {
> +	status = "okay";
>  };
>  
>  &cec_AO {
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
