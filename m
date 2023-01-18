Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02255C32793
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 08:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWkS0YddmNtbSYR3Tg1LHf8F49kcE6hOcY7aO6dVg0g=; b=0sDp9UwTCEt1C6hXJbZcOz4CwS
	WHU1Yc6m4W1gK9kcZt0HG/0vEfvRLk4GS8iO/Hyb1SrZG86ThtTMVKsYB7/E0HnVCTuhXJGnQE5Yd
	3oqJIcpzUPt/jFLcQaF54yP9h1A7HH4aSw5RrO78/5YY2IS9TJVMxMRtMj3bP3L13vpksE4k1ukvS
	vp3/E6gr6SbOHtpwWmnqhVt55BNqAieFFPcTTOyj66onnlFXzKiCyjzEOsHrX2k2AVWgvySJYgemZ
	8jgqP07gEsdeXz19OaTIjFvx6W96zhsgoxnzougugr0AqPFXlNpg9DDikG6bswk+34H4gG23J3Pwp
	ETLk0+gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3mu-00HSWb-Nd; Wed, 18 Jan 2023 08:27:16 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3mk-00HSRk-Ax
	for linux-amlogic@lists.infradead.org; Wed, 18 Jan 2023 08:27:07 +0000
Received: by mail-wm1-x335.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so870878wmb.0
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Jan 2023 00:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wPklGmCKpWXW1sPBjuXeSY81LEryO5M2FkZvwa+g5bk=;
        b=y5gqCfEhei778A0yLVB+OCdWfWYH4YUVgnxsXfj+BGeYXksfO+yeTSKY2uy0sxVUrU
         omBm2V7VGDubcUxAWzkTOGLb0Ire4ccHjLmPu4umxaWM5ik+Zbnt4BH3r9ayP9Qh0nCI
         qp8M0Kus3QEFz9wE+WHvD4yVh0Lmu29N100tn+vM2pdMY+xQ1hj9aAWmHySUwbJXbKmy
         ekrEbPC/NeRt2+1GBu4CGsOpmb+nlyJCzAiA10ephtoEOocCZluoANXREPX7Ucx/lcBK
         6FFZMKO6qyTC5i/VF3PyMXDlKzcFoQm3fYXAfGFi4rx55r8NKVgcJwa6VzbRzKcC+A5c
         l0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPklGmCKpWXW1sPBjuXeSY81LEryO5M2FkZvwa+g5bk=;
        b=yArZ2UFuOBqNwH9y+r0FoJhfM+BsTVyFUmPjgBPdklbu7hhmDlaRaxxvqW2bdISZyD
         v5kCrXc+lhFbdR0bR6vs3Ear2wcLc6IopATQl3UtxMQzpg9/UXiBIVuupCptTyFPaNc9
         YRC2hUwYRWbxXpcx4rkJkB6govnpC0RPKZnmGaPOi06Ku5KFUoLKi8NjFI0Esc/qBNmC
         zC1BonFSJujSyXCMviNTnsa2xlyUn0qg1UTCLloiUvTOSnoEKtGdVUSSJUCvvN3G13X+
         XpZEQSdOKk1pW3YPG6NdPjo8WTprWALC5mskyZmPS//CXKTchJiYynfLX0uvgTTCjScY
         h6MQ==
X-Gm-Message-State: AFqh2kpt5DOwJn+2tngnVNqOVEQtBgsZewl1EXH1bBYkI29zMOtVcCqb
	8NuGVA/AlzCrCfo8NLtEZDnMXQ==
X-Google-Smtp-Source: AMrXdXstS3MtA+pzDnK8u4CMcgqvZDe24SOYcHgjh7I+abxQ/HkeRlggDKfm7mWbesuJ3dS9ey9Fww==
X-Received: by 2002:a05:600c:4e05:b0:3c6:e61e:ae71 with SMTP id b5-20020a05600c4e0500b003c6e61eae71mr6025760wmq.1.1674030423378;
        Wed, 18 Jan 2023 00:27:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:37dc:5071:959c:93e4? ([2a01:e0a:982:cbb0:37dc:5071:959c:93e4])
        by smtp.gmail.com with ESMTPSA id o2-20020a05600c510200b003c6f8d30e40sm1302363wms.31.2023.01.18.00.27.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 00:27:02 -0800 (PST)
Message-ID: <3f0ade86-cab1-1f5a-fd49-326802473b76@linaro.org>
Date: Wed, 18 Jan 2023 09:27:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/9] arm64: dts: amlogic: Used onboard usb hub reset on
 odroid c2
Content-Language: en-US
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, Matthias Kaehlcke <mka@chromium.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230118044418.875-1-linux.amoon@gmail.com>
 <20230118044418.875-4-linux.amoon@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230118044418.875-4-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_002706_385858_B94AD9A4 
X-CRM114-Status: GOOD (  20.29  )
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
> On Odroid c2 previously use gpio-hog to reset the usb hub,
> switch to used on-board usb hub reset to enable the usb hub
> and enable power to hub.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v2 - drop the vendor name from compatible string.
>     - move the hub node to USB controller node.
>     - drop the usb_otg_pwr since it only liked to OTG port
>           and link p5v0 to the vdd-supply.
> ---
>   .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 26 ++++++++-----------
>   1 file changed, 11 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index 201596247fd9..01356437a077 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -250,21 +250,6 @@ eth_phy0: ethernet-phy@0 {
>   	};
>   };
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
>   &hdmi_tx {
>   	status = "okay";
>   	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
> @@ -414,5 +399,16 @@ &usb0 {
>   };
>   
>   &usb1 {
> +	dr_mode = "host";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
>   	status = "okay";
> +
> +	hub@1 {
> +		/* Genesys Logic GL852G USB 2.0 hub */
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
