Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFEAC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 15:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tAP+pyJ2Zvwz64LEArZIUbMg3ZaOlD0PVQKZqPsr5l8=; b=BtRvUcJsmlcaGDDcRpx5j9UqeU
	XZKqXoDJIYs9/ZogswxOmijnR2Yhr7w4kEbJzqT1ywYmPXGAERXkyIRtljOQHPiMnUp/Wgc/Qr+0Y
	V3dgIT7PvCYa0LLHTcTcr17XzMFfaFNBxlS2iNt2EdyUoi6AZcWdZ/3WsYF/+1Q4IIv1CjsWM1OJl
	beE3dFswsxT1sWtU8mcM9KM4vcbjlCkHNGkxPZkw8JHeSJ70Lh2GIBNMs/2+tqUyyMhcHU3qHDpkT
	RgOP67wV3ag1CFLAgm872cJXvC+imlLNwWkhvcnIFXli+ftCwbDuWWx+kkBqykO39f3Wz08Dzuw7Z
	sLhzyFyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4P6E-009Ile-9p; Mon, 03 Jan 2022 15:18:14 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4P6B-009Ikw-MQ
 for linux-amlogic@lists.infradead.org; Mon, 03 Jan 2022 15:18:13 +0000
Received: by mail-wr1-x42e.google.com with SMTP id i22so70479372wrb.13
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jan 2022 07:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RCaHyP5ebl213km5STCt5+zOoJt9LjhnFcS42FC3TYI=;
 b=7VDW7DnekEMpLtUjkrLruXmrj7LanTofrDr8lwJYDR6cGPDvRRZ7QaFnt3ti531DGs
 NG6m3a0rGNmqOlLqHynzbAZWpKzrATHOEabLmLbelnzWE8oGaY7eyydvCQSVrTdiIEM/
 sBAP1KaSdVsRX+fM0+AhIMC/53tY8a1sFR7Vzr8kRg9ono/8wqAJfsVtyC19+weX2eay
 iurlsBnuvLe5KfD2yVGBQDFdk2ksuPAVLvlAEp+BoPWvpJFwUZ3OW1LTl+lxHbe0gbKb
 NTFzWKLDxyWDuSHXS6xLDq1gfiw3QqTgoRlaT7+zRfWfhFWKn+47qo1GFBIyFW+jRxv4
 VkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=RCaHyP5ebl213km5STCt5+zOoJt9LjhnFcS42FC3TYI=;
 b=R6npyn51Aast8h7DaAJ/K8FCDm8ZzF8kGmyh9A5O2sQgwst+CVNF54/zeYsjQ45vqr
 gc71VbKe/mI5AH9ktWzZD0y+wN7vFvCGgL8FwcU10yPDftOv4watopFnWS2UIrVtwB6r
 EPCdL9Dh+Z3PLyuW3QEDe6nrf6S+E876udncXjFjfXx0mF6QBewvK8+LYfOz2KmUw2Wk
 Py+WxvJY9+ZWtV7HpWfV9gXAPx1TZb1DKP/frvmGBlnj9ci7DV/h3hiEl76Ta8gQMewi
 a/r7p7chroudL8S9XWWQTZC1Ko2puP1+bBGKRlxoKPWpjFytmZLxw/+96agSbNQEsUJB
 mj6g==
X-Gm-Message-State: AOAM533ShOhEzTzad9T0zP/ayyR6uP/04QnrYfIQ7/z0b6eY4KnZK3XD
 yHTqlaO26eYRdT4qGMCNxtWAKg==
X-Google-Smtp-Source: ABdhPJwbSTS4oam1MAa06aQBgF89Uhw69k911CPsHZgOi4vqcoTlEc/QPIkleuaGl1naux23SCbdHA==
X-Received: by 2002:a5d:6c6c:: with SMTP id r12mr39501803wrz.706.1641223090126; 
 Mon, 03 Jan 2022 07:18:10 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:7c9d:a967:38e2:5220?
 ([2001:861:44c0:66c0:7c9d:a967:38e2:5220])
 by smtp.gmail.com with ESMTPSA id i8sm44072453wry.108.2022.01.03.07.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 07:18:09 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: meson-sm1: add spdifin spdifout nodes
To: Artem Lapkin <email2tema@gmail.com>
Cc: jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 christianshewitt@gmail.com, art@khadas.com, nick@khadas.com, gouwa@khadas.com
References: <20211215030236.340841-1-art@khadas.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <67d8cefc-d7c7-daba-bfe3-5935ded52beb@baylibre.com>
Date: Mon, 3 Jan 2022 16:18:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215030236.340841-1-art@khadas.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_071811_775377_C13CD6D3 
X-CRM114-Status: GOOD (  17.67  )
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

On 15/12/2021 04:02, Artem Lapkin wrote:
> Add spdifin spdifout nodes for Amlogic SM1 SoCs.
> 
> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
> 
> SPDIF IN and SPDIF OUT both tested and works fine for VIM3L (meson-sm1)
> same as for VIM3 (meson-g12)
> 
> SPDIF in and SPDIF OUT both pins available via GPIO header (SPDIF_OUT PIN
> 13 spdif_ao_out_pins and SPDIF_IN PIN 35 - same PWM_F spdif_in_h_pins)
> 
> https://lore.kernel.org/linux-arm-kernel/1jtuhwvqxa.fsf@starbuckisacylon.baylibre.com/t/
> 
> ALSA spdifin test example
> =========================
> 
> # arecord -fS16_LE -r48000 -c2 -Dplug:spdifin
> 
> # cat .asoundrc
> pcm.spdifin {
> type iec958
> slave {
> pcm "hw:0,1"
> format IEC958_SUBFRAME_LE
> }
> }
> 
> DT sound card configs for testing
> =================================
> 
> &spdifout {
>     pinctrl-0 = <&spdif_ao_out_pins>;
>     pinctrl-names = "default";
>     status = "okay";
> };
> 
> &spdifin {
>     pinctrl-0 = <&spdif_in_h_pins>;
>     pinctrl-names = "default";
>     status = "okay";
> };
> 
> ...
>     spdif_dit: audio-codec-1 {
> 	#sound-dai-cells = <0>;
> 	compatible = "linux,spdif-dit";
> 	status = "okay";
> 	sound-name-prefix = "DIT";
>     };
> 
>     spdif_dir: audio-codec-2 {
> 	#sound-dai-cells = <0>;
> 	compatible = "linux,spdif-dir";
> 	status = "okay";
> 	sound-name-prefix = "DIR";
>     };
> ...
> 	audio-routing = ...
> 		"TODDR_B IN 3", "SPDIFIN Capture",
> 		"SPDIFOUT IN 0", "FRDDR_A OUT 3";
> 
> ...
> 	dai-link-10 {
> 	    sound-dai = <&spdifout>;
> 
> 	    codec-0 {
> 		sound-dai = <&spdif_dit>;
> 	    };
> 	};
> 
> 	/* spdif or toslink interface */
> 	dai-link-11 {
> 	    sound-dai = <&spdifin>;
> 
> 	    codec-0 {
> 		sound-dai = <&spdif_dir>;
> 	    };
> 	};
> ...
> 
> ---
>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> index 3d8b1f4f2001..1e0adf259d61 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> @@ -356,6 +356,33 @@ tdmin_lb: audio-controller@3c0 {
>  			status = "disabled";
>  		};
>  
> +		spdifin: audio-controller@400 {
> +			compatible = "amlogic,g12a-spdifin",
> +			"amlogic,axg-spdifin";
> +			reg = <0x0 0x400 0x0 0x30>;
> +			#sound-dai-cells = <0>;
> +			sound-name-prefix = "SPDIFIN";
> +			interrupts = <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
> +			clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
> +			<&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
> +			clock-names = "pclk", "refclk";
> +			resets = <&clkc_audio AUD_RESET_SPDIFIN>;
> +			status = "disabled";
> +		};
> +
> +		spdifout: audio-controller@480 {
> +			compatible = "amlogic,g12a-spdifout",
> +			"amlogic,axg-spdifout";
> +			reg = <0x0 0x480 0x0 0x50>;
> +			#sound-dai-cells = <0>;
> +			sound-name-prefix = "SPDIFOUT";
> +			clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
> +			<&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
> +			clock-names = "pclk", "mclk";
> +			resets = <&clkc_audio AUD_RESET_SPDIFOUT>;
> +			status = "disabled";
> +		};
> +
>  		tdmout_a: audio-controller@500 {
>  			compatible = "amlogic,sm1-tdmout";
>  			reg = <0x0 0x500 0x0 0x40>;
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
