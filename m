Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37563C04A94
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Aug 2023 21:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I6QOwFVoE+71fM+MTgcCWtiYbfybYM2Hi6z2csuJpHw=; b=OjbQsFn++04B0z
	TpBibC2Up/N6jb7xDFNFK+PoxpPAQn0DI1x8QY1Gu44Q3g1dtnNXKv4sMqukNJslbWph4USH0UpSS
	3K9higgegRU1dU5lzyNHY6Zkb9Q6igpap01Nq5chA7xr3IS9xhZQir1CCN6Es7D2BjNiq98+LnM7g
	6bqJwPuQSZpFOA4goNZa6O4cH7hWR94nho/AR7idBNT/qXg2RRJyhdDY5uwMYMtRV0Rzzkio8zGgh
	wB61nJ9jW9te6OQSItZwbITFRAxF7osYciRtkdqEk04E/+c/IxqWs/Ge2XBxoS4cDAi/wDgQ1braG
	GbPJk22hnXABMamjdA0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRJ3h-005tuN-1q;
	Wed, 02 Aug 2023 21:07:05 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRJ3f-005ttg-0N;
	Wed, 02 Aug 2023 21:07:04 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7683cdabd8fso14841985a.3;
        Wed, 02 Aug 2023 14:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691010418; x=1691615218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=crZnLksKhXHygAFAt6KtbbotkkwISuLwd1MjzY9iUSY=;
        b=Ez/qmwAEpI8zAgjFfoEc2jA+TVE0h8CbBD0jcdPZOcUAxdNhXhj9dfL61QWXF4SdOL
         awrU41bM3y/pGxIoj5R80VFaHlU3JDeD+/UCYe/MjSXO1kSxTNYpdVyz/d0j8yBXQChD
         gSc3dX5Z1MN1XESRxjk8tHKHnsDfG6VszQkMav6o/L4fmzroAQYLPcYIq/5Vw50/w/IW
         jMmlVJJfbBqB2fIC3zS+/DSueXN9czpd3SMUXNf6DiYT+RPUqhG0RTYf00CCl2THyExR
         rArKBmT8tI9SmxAJCL/Lr2H+BvzS2jNu2QcFg0w73rXZkQrU+eroTc/MBCh1Cfl43DtO
         kgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691010418; x=1691615218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crZnLksKhXHygAFAt6KtbbotkkwISuLwd1MjzY9iUSY=;
        b=I8cWMneS4ERslj+IbOY4bnXIKjV1mwHgvQVckoi8T5Kbz5bsskkumuz/iZlREA9M3v
         WnROx9d9v/YZSXjmX1jpXZMyTXWNMe7VQKnYn/OLuDrXWyClVXNuaSoz2rKt5ucHHeIf
         3lIudaIyg1PmlrYkz98cd6fbFBeS9qUdp16jz8Py7cuD9FFR+YVBvFqoO7mCMYKy2ZI6
         91mvVqKEjJSdXZHs5uiijAPqt5JPURcXHwndVrz2PkeVAl7R/cz1p/3dWd9S4vObF9TD
         rMo/+Op0+oA6x9TVkpclalalldWnp3TCoTxMl3ZrsfJGhgH5s+8Juhd868QzVhsQ2L9H
         rjdg==
X-Gm-Message-State: ABy/qLbyS6ukPqRIaC7bUMLxwOAiJuHYBjZp9hiOVOqJ/EYSa2lnUcdI
	94xbV1eeYRaor58+epChWZM=
X-Google-Smtp-Source: APBJJlHoS5d3Ipe2H7XAm7BBbIZRwGBIiVdazN/gCWbw8Q7xM1OS6zSlh4WLA2gIzX6CTF3heoL2Wg==
X-Received: by 2002:a05:6214:313:b0:63c:d6f1:7bcb with SMTP id i19-20020a056214031300b0063cd6f17bcbmr9115831qvu.41.1691010418587;
        Wed, 02 Aug 2023 14:06:58 -0700 (PDT)
Received: from Dell-Inspiron-15 ([2601:18c:8380:74b0:e8e5:f40c:d741:8f07])
        by smtp.gmail.com with ESMTPSA id s18-20020a0cdc12000000b0063d3fef54c6sm5558313qvk.77.2023.08.02.14.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 14:06:58 -0700 (PDT)
Date: Wed, 2 Aug 2023 17:06:55 -0400
From: Ben Wolsieffer <benwolsieffer@gmail.com>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	Matthias Kaehlcke <mka@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/9] arm64: dts: amlogic: Used onboard usb hub reset
 on odroid c2
Message-ID: <ZMrFb7H1ynwwBSCA@Dell-Inspiron-15>
References: <20230121175639.12818-1-linux.amoon@gmail.com>
 <20230121175639.12818-4-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230121175639.12818-4-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_140703_155548_DE85C431 
X-CRM114-Status: GOOD (  27.39  )
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

On Sat, Jan 21, 2023 at 05:56:31PM +0000, Anand Moon wrote:
> On Odroid c2 previously use gpio-hog to reset the usb hub,
> switch to used on-board usb hub reset to enable the usb hub
> and enable power to hub.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v3 - Add rev by Neil.
>      droped dr_mode
> v2 - drop the vendor name from compatible string.
>    - move the hub node to USB controller node.
>    - drop the usb_otg_pwr since it only liked to OTG port
>          and link p5v0 to the vdd-supply.
> ---
>  .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 25 ++++++++-----------
>  1 file changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index 201596247fd9..70b10934a811 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -250,21 +250,6 @@ eth_phy0: ethernet-phy@0 {
>  	};
>  };
>  
> -&gpio_ao {
> -	/*
> -	 * WARNING: The USB Hub on the Odroid-C2 needs a reset signal
> -	 * to be turned high in order to be detected by the USB Controller
> -	 * This signal should be handled by a USB specific power sequence
> -	 * in order to reset the Hub when USB bus is powered down.
> -	 */
> -	hog-0 {
> -		gpio-hog;
> -		gpios = <GPIOAO_4 GPIO_ACTIVE_HIGH>;
> -		output-high;
> -		line-name = "usb-hub-reset";
> -	};
> -};
> -
>  &hdmi_tx {
>  	status = "okay";
>  	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
> @@ -414,5 +399,15 @@ &usb0 {
>  };
>  
>  &usb1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
>  	status = "okay";
> +
> +	hub@1 {
> +		/* Genesys Logic GL852G USB 2.0 hub */
> +		compatible = "usb5e3,610";
> +		reg = <1>;
> +		vdd-supply = <&p5v0>;
> +		reset-gpio = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_LOW>;
> +	};
>  };
> -- 
> 2.38.1
> 

Hello,

This patch breaks USB support on the ODROID-C2. As soon as the
onboard_usb_hub module is loaded, all USB devices disconnect.
Blacklisting onboard_usb_hub makes USB work as expected.

I tried to reproduce the problem by manually toggling the reset line,
but the problem seems to be specific to this driver. When reset is
asserted manually, the devices disconnect, but they all enumerate again
as soon as reset is released.

Also, I have been unable to make USB work again (until the next reboot)
even after unloading onboard_usb_hub.

Ben

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
