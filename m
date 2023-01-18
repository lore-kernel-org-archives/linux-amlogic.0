Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19741C32793
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 08:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=da0YsqQNWHN7Yd9A5+A4cXf7vspxTleasbfvVTlLeVs=; b=NQ3J+otdD7Gz3rOrizoFVPMLbF
	4VgwXN9pWY/Sn1i5HB8zshO/DbjDuhV9OSBFqvTNO7vihfqMSSq6eroW76BL5I4NbZa4LRBLHIzSh
	RmohH7k/TcCPbYXaaIXriDGxy5QZdwD7duEy/ASS0poq/VfN4j7izFiQAkK3Ar3tN/Z3Kxgqtyr+w
	48MR8S2A5JE2Vf+JNWztH/hSfOU25Gj7UvXfL42wByGaMpVSroug7boiOv5Xkn5XZTNKITGPynN5J
	PGLuO7rejgTIsA1wdzxqX/PDbMfXXOlCzfUV6cRjnJlx7T8LCRK0jZlKF39z/pRmh5zJJ9vBklqQd
	nUGs/FZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3mb-00HSQO-KD; Wed, 18 Jan 2023 08:26:57 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3mQ-00HSNg-Po
	for linux-amlogic@lists.infradead.org; Wed, 18 Jan 2023 08:26:48 +0000
Received: by mail-wm1-x331.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so757638wmq.1
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Jan 2023 00:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HIpUx6UqHWkJ4zuJvTxUu8V93VcUMi8yc/wqvH0Omdg=;
        b=G0l67gl6kvyMGKR4WY+7lC6Fs144ntkeeyy8IBP8BmkT4EtFY763aPrfBV3u1rcI50
         EN+z+Etl4zPqcPxKuYNId0RuMPU5t0sysboAed/ueHM7Mk3sVxDGuli99WnwiS65PoV/
         xYvBBDD5a0fJdIoqRVaQTMRp8ScrDark5XkKaM6XlG5n5j73AF2qON0rBZp2tvC85OFv
         ofS1/eXM/6wSLZFNXvwKew0PKjvszjMv1mnYicA37SknRntqLsHUnnk3VSZRf5mJdyh9
         7mjIx3GhzEgk2N6uoccWW7c37taUlT6YCFNkA/cn1oHrNc3kfg6OiV18gdLABoGfVhjM
         NSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIpUx6UqHWkJ4zuJvTxUu8V93VcUMi8yc/wqvH0Omdg=;
        b=1oGTuhlgdxC2seVo5JWQlXrGoNL2ZnrpfXd26AyPtUyhpT9gUAkNEUKB+T5HPZH1Xl
         FO7fF86vf6Q3TQVge7l4hjxOm9g4EGRNqVZ88y0X5rPfad+zwqxyrv6qPctuepO9CNJ0
         PuiT/0sQpaHKTLY8k5oCXF62mcTKfJkx7JC6hmOA3q4wogiBiZc2GKY4UffPB3CGQFh9
         iAbXdNcL1X+1Je+eN7mCK1r2n7L9aE5DYmLZFe81QrWCoLOdosEOwoIUf5iq1XVipjix
         kMZhQF43Ze6dQ0f/B0WFyQcSHD1NaKbyMJ/iO/gzJKPs6q+0amn+ru4UWIUh6Z8x19+r
         jffQ==
X-Gm-Message-State: AFqh2kpsANYnZo/MF3lG+urtGG7zas88BB9wmYEihgaVqlVs5Q0ksuUo
	k9Jj4mDsSB9TTLQX/bG/bOF9GA==
X-Google-Smtp-Source: AMrXdXtxBm2mv1p0bJ5Nyphmqp547N7dW7SQll7t+PfgPw+rdH+xTpqBsjPzMxXobNsBOaz7fM1eHA==
X-Received: by 2002:a1c:4c0a:0:b0:3db:210:6a24 with SMTP id z10-20020a1c4c0a000000b003db02106a24mr5678854wmf.8.1674030404004;
        Wed, 18 Jan 2023 00:26:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:37dc:5071:959c:93e4? ([2a01:e0a:982:cbb0:37dc:5071:959c:93e4])
        by smtp.gmail.com with ESMTPSA id k14-20020a05600c1c8e00b003d9ed40a512sm1576767wms.45.2023.01.18.00.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 00:26:43 -0800 (PST)
Message-ID: <21daccb8-9e27-af65-4b90-4bae062be559@linaro.org>
Date: Wed, 18 Jan 2023 09:26:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/9] ARM: dts: amlogic: Used onboard usb hub reset to
 enable usb hub
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, Matthias Kaehlcke <mka@chromium.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230118044418.875-1-linux.amoon@gmail.com>
 <20230118044418.875-3-linux.amoon@gmail.com>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <20230118044418.875-3-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_002646_915302_6D6D83E0 
X-CRM114-Status: GOOD (  20.88  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 18/01/2023 05:44, Anand Moon wrote:
> On Odroid c1 previously use gpio-hog to reset the usb hub,
> switch to used on board usb hub reset to enable the usb hub
> and enable power to usb hub.
> 
> Add usb hub regulator as per the schematic.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v2 - drop the vendor name from compatible string.
>     - move the hub node to USB controller node.
>     - drop the usb_otg_pwr since it only liked to OTG port
>       and link p5v0 to the vdd-supply.
> ---
>   arch/arm/boot/dts/meson8b-odroidc1.dts | 24 +++++++++++-------------
>   1 file changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
> index 04356bc639fa..d1f9ce4742a8 100644
> --- a/arch/arm/boot/dts/meson8b-odroidc1.dts
> +++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
> @@ -281,19 +281,6 @@ &gpio_ao {
>   			  "J7 Header Pin 6", "J7 Header Pin 5",
>   			  "J7 Header Pin 7", "HDMI_CEC",
>   			  "SYS_LED", "", "";
> -
> -	/*
> -	 * WARNING: The USB Hub on the Odroid-C1/C1+ needs a reset signal
> -	 * to be turned high in order to be detected by the USB Controller.
> -	 * This signal should be handled by a USB specific power sequence
> -	 * in order to reset the Hub when USB bus is powered down.
> -	 */
> -	usb-hub {
> -		gpio-hog;
> -		gpios = <GPIOAO_4 GPIO_ACTIVE_HIGH>;
> -		output-high;
> -		line-name = "usb-hub-reset";
> -	};
>   };
>   
>   &ir_receiver {
> @@ -381,5 +368,16 @@ &usb1_phy {
>   };
>   
>   &usb1 {
> +	dr_mode = "host";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
>   	status = "okay";
> +
> +	hub@1 {
> +		/* Genesys Logic GL852G usb hub */
> +		compatible = "usb5e3,610";
> +		reg = <1>;
> +		vdd-supply = <&p5v0>;
> +		reset-gpio = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_LOW>;
> +	};
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
