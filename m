Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CDBC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 15:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CVjf/AjoDKWT/ue8r6LjtQViz1hN8HBIrcmk5Syumh8=; b=YPvlTdSTrOMxmQ
	V8mRvszqzD/n3NWogZ4S17nfXhIH72ogakB3mVpbclKqI8Ql+G/EKYglhf+iRgLMQIhP+e4yhzJXw
	z8vCI53UvMJbwi0U5EpD6whRVGSOOX53JgJfiCHXBNJweuYTjHuTBCv7VoDp3qX4Gx7Lmc/t+rFIU
	+vCxiK2ZX4KrH9SmpfNYsrc7KKIovbj1oAW0JdwvkPu7DOr/Cg2aSmh1q1Kz7tAso55H35RjYALaa
	Uv0Gx1O96jMTrheQ8QZV1jUXqQ7zJw9t5gzuE3p5lZH05FZQtSf7O0jgfLU0vofFfJMQSKrGBoM28
	6WdQwJ4LxxVR0u8so+1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4PPZ-009NQ1-Mk; Mon, 03 Jan 2022 15:38:13 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4PPM-009NM6-JG
 for linux-amlogic@lists.infradead.org; Mon, 03 Jan 2022 15:38:02 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 g7-20020a7bc4c7000000b00345c4bb365aso18568355wmk.4
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jan 2022 07:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=e7D8OcrNMYt5AXR05zcMqXWeBaERoAiAyxXlq5b2Tro=;
 b=qyfZ/UWDYLYSZ89MGw/VqfX58dPk0V+Tu6T3DOGQFUkCrnDO+soFOfMmGopNO975yt
 Wj5bATAymrGi9/1w8XGbBfpNiRbHRxE4O5Y+b51wKJV4lElM07/Yr8Q9MDE17rXzrJId
 PKOfTlpU5vwqj99YsMrTe2692uUh7kqdRDoBeLBw6GFot1eupOCyDhEk/94BLXX9lyJ0
 pyWnHo2CVYKgyiRPZ+iIEx9A29QYOwezsqVb4gAeNHJKerU+kP/dKQSpwRXNaavXDwXg
 S5hw4oXOquSHIhZzkunoPJkztBdJZJiMlrLcvLjlujlI1DLwu3EWXsJICoODzdzpeAvC
 sYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=e7D8OcrNMYt5AXR05zcMqXWeBaERoAiAyxXlq5b2Tro=;
 b=YyHkGfKsut+9PIkN+PrUfWcDCNErLGkyeCS4bfVZDCeikOfqr3QZ4LCI9uf8l1Flnz
 c8Ro13SxwzU/LLiNCSZxPPu+LKyA5OrXDmwwpbHyum89LUQu9bTZzVOCYS7CjLeqOW5g
 zDtz8LJV7IB5weOxG0toQs5vp9FK1IAN/rPiLK+yxtq+7MkXrDcWRrGuWFjO2PIMIm7o
 akrUlXhun1LCQ4qPNsnZV4QJpfkYy8SiwZpXxLUG++H5KU+cTtm8Xaqx2kj8LU23NU7T
 Pb0XyjemxKKqhBhWa0VrWXukOLa2/bKnI5tRMhakPUfPMipfJcuQPJp2sC1HI7zyoHBp
 T3gA==
X-Gm-Message-State: AOAM531XBgyFeV2gF9Z6aPEJVKJzFINbFn4ntA9WeQRbdMlZd3JGvPd5
 dsHOAHbkOw473If5vOeV+aDB+g==
X-Google-Smtp-Source: ABdhPJwrKfLISt0WrSPCY8r0DcK76beZJqz85d43vUQWC78epqGLtBg9IGMOZW8FDsAeBrq8zQT3fg==
X-Received: by 2002:a05:600c:1e8b:: with SMTP id
 be11mr39690535wmb.51.1641224273795; 
 Mon, 03 Jan 2022 07:37:53 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e13sm37841243wmq.10.2022.01.03.07.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 07:37:53 -0800 (PST)
References: <20211215030236.340841-1-art@khadas.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Artem Lapkin <email2tema@gmail.com>, narmstrong@baylibre.com
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, christianshewitt@gmail.com, art@khadas.com,
 nick@khadas.com, gouwa@khadas.com
Subject: Re: [PATCH] arm64: dts: meson-sm1: add spdifin spdifout nodes
Date: Mon, 03 Jan 2022 16:35:23 +0100
In-reply-to: <20211215030236.340841-1-art@khadas.com>
Message-ID: <1jtuekrfsf.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_073800_676251_186A0075 
X-CRM114-Status: GOOD (  16.28  )
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


On Wed 15 Dec 2021 at 11:02, Artem Lapkin <email2tema@gmail.com> wrote:

> Add spdifin spdifout nodes for Amlogic SM1 SoCs.
             ^ add (same in the title)

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

Node should still be named spdifout_a, even if the spdifout_b is not added yet

> +			compatible = "amlogic,g12a-spdifout",
> +			"amlogic,axg-spdifout";
> +			reg = <0x0 0x480 0x0 0x50>;
> +			#sound-dai-cells = <0>;
> +			sound-name-prefix = "SPDIFOUT";

Same here

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


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
