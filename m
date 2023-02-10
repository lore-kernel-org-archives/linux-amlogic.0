Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733E7C636CD
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Feb 2023 15:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2GNBam+K6kEgpzL6/q3D7dBeb/Gg0jZ1G5+P3/ZtqM=; b=jT+8GhKqsCWnYFZ9mdJUCGmWKD
	EvlkBDlGqTISaUn17ri3TfMQby+P+wWnLBqlq7KBjrmuWA1+gUcWHNPvz+IJq5e0W5TDcdQT8GNZV
	ixsl3KCmYOncAn+3VqHn9fp2/FTa1q6d+Eqi6yJxJjW9jzStmY5l5t0fyXFgZWwH7koDUSiiVmtTd
	N32V6e2nyKesQxFxctm2WjnVkOLLhpslwZLrVGIZtevYIpf9zGckVtRKeCA0qCgFA8Cf9IsalpEsy
	gCdStlEYJUB6yKhc3nCvgr7gvMAdHlL9tC3REtL9ts1Zy1lSiFaYrWvufLjH0+aZJcZoiZgyFDs4/
	DiEsY26Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQV6a-006FzR-8r; Fri, 10 Feb 2023 15:14:28 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQV6W-006FwY-4w
	for linux-amlogic@lists.infradead.org; Fri, 10 Feb 2023 15:14:25 +0000
Received: by mail-wm1-x332.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so6512074wmb.2
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Feb 2023 07:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9lQ8uRKJ4zCzCOi0nvl4MdqLTZxWppuqi+n32H1GYQ=;
        b=hj+QMza7DNox+OyZeLzPOOElr4SfHk8jgodB8hWRJ6+a8D8Eh6Xvi77s88yqWbBi3W
         n7WdDWWT9O+csAALJl9qRSBRtxZ8IaNIiFnKHrZXgp9aN4K2DQ+nfe1s+SGQFy+duAKg
         YspdHEwrU+C0OGIFrnwqSoLvsuAp7iwJ6wL/w3X97iH+zN13FzijZ6R6AWsQKIdVuPTQ
         KCepheNg2tciPuxLQOoTBPul0SCSlvNFCGA2/nxm5Zh0vYhOidGQpOWLhzMKPt2XX0p9
         tB8FVhSgfrmWDvRPk9eQ3VAD9dVnfxAupV/e3ChK6k9L0F98lR6862aeCr6ffrFshILP
         A3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9lQ8uRKJ4zCzCOi0nvl4MdqLTZxWppuqi+n32H1GYQ=;
        b=hnzggAvw/dZmTanUu4NSIdmxa8ClRWtm5MwrEdqMNpbDxvdJS4mrU1LgK6aHZygagE
         e6EhVsqmFjK7bfj5CFR+NzV7u/lhsNIvuI5hpJKQRzVmfqXK6vUUVBSQquQusXYjYkUG
         zOx/ZbHvnsPXD3ROXpVBJzcG6gqLa4VpAf4Da9yiH79QoXDUYVOiOFe4nAiGifQT3b/9
         dLo5Y/i5kGIAoYRgphY2yhkpCqOB+ijs0rQ60XphX0sA5okru/6BQup3z7xCAywD8YGE
         R6gmxjxQhWoJgImknrXNrN0NOWRe4ABtWq2dsM/O4je1rXRgMn+vOOgFaDQSIbHGDYpp
         FZUQ==
X-Gm-Message-State: AO0yUKXItBdCp6rSoiWCfmD8hISVvVH5sFxcUH+NcHvYqEEw2YPNQ2eg
	FiY6OfGiY5Bb0Jb7oE71R04i5g==
X-Google-Smtp-Source: AK7set8V+rKzNRUCEWjmI4sIj9cMaVcPbkVCCfL/z2U9yBJmXJS4axHG6YC1utnnaC8o5nwW8NpjJg==
X-Received: by 2002:a05:600c:18a6:b0:3e0:e77:3056 with SMTP id x38-20020a05600c18a600b003e00e773056mr13187148wmp.30.1676042062768;
        Fri, 10 Feb 2023 07:14:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a65:5553:55cf:3027? ([2a01:e0a:982:cbb0:5a65:5553:55cf:3027])
        by smtp.gmail.com with ESMTPSA id j37-20020a05600c1c2500b003daf6e3bc2fsm13887109wms.1.2023.02.10.07.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 07:14:21 -0800 (PST)
Message-ID: <3184693a-93c2-6c86-d960-a578e8486e89@linaro.org>
Date: Fri, 10 Feb 2023 16:14:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/3] arm64: dts: meson: gxbb-kii-pro: sort and tidy the
 dts
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Ferass El Hafidi <vitali64pmemail@protonmail.com>
References: <20230210122817.1027765-1-christianshewitt@gmail.com>
 <20230210122817.1027765-2-christianshewitt@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230210122817.1027765-2-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_071424_248683_219EFC24 
X-CRM114-Status: GOOD (  13.27  )
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

On 10/02/2023 13:28, Christian Hewitt wrote:
> Alpha-sort the nodes, move the default line in the LED node to where it's
> normally found, and remove excess spacing. No functional changes.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Tested-by: Ferass El Hafidi <vitali64pmemail@protonmail.com>
> ---
>   .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 32 ++++++++-----------
>   1 file changed, 14 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> index 6d8cc00fedc7..9bfdb54d912a 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> @@ -6,21 +6,22 @@
>   /dts-v1/;
>   
>   #include "meson-gxbb-p20x.dtsi"
> -
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/input/input.h>
>   #include <dt-bindings/leds/common.h>
> +
>   / {
>   	compatible = "videostrong,kii-pro", "amlogic,meson-gxbb";
>   	model = "Videostrong KII Pro";
>   
>   	leds {
>   		compatible = "gpio-leds";
> +
>   		status {
>   			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
> -			default-state = "off";
>   			color = <LED_COLOR_ID_RED>;
>   			function = LED_FUNCTION_STATUS;
> +			default-state = "off";
>   		};
>   	};
>   
> @@ -34,24 +35,8 @@ button-reset {
>   			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
>   		};
>   	};
> -
> -};
> -
> -
> -
> -&uart_A {
> -	status = "okay";
> -	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> -	pinctrl-names = "default";
> -	uart-has-rtscts;
> -
> -	bluetooth {
> -		compatible = "brcm,bcm4335a0";
> -	};
>   };
>   
> -
> -
>   &ethmac {
>   	status = "okay";
>   	pinctrl-0 = <&eth_rmii_pins>;
> @@ -78,3 +63,14 @@ eth_phy0: ethernet-phy@0 {
>   &ir {
>   	linux,rc-map-name = "rc-videostrong-kii-pro";
>   };
> +
> +&uart_A {
> +	status = "okay";
> +	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> +	pinctrl-names = "default";
> +	uart-has-rtscts;
> +
> +	bluetooth {
> +		compatible = "brcm,bcm4335a0";
> +	};
> +};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
