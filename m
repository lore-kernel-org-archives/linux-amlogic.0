Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F26C4167B
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Dec 2022 15:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5giyQYWg/dploj8SonqTSEOrluf+vpH07gr0kTqIv50=; b=XNeoZqVDxRTuGj
	2HkvkKtMwAjyNcghksewL7YXqYTnnvRvv3MXxjUXBQFy6EqFt8F+2lt8BZDGq8BbcE1L2ZfZjE3Ge
	3j2/NQAgEEDZp0GGjAfzTaQNMM2Nj6s4ZF6qKK1qFq0562yHQlzJ9JPd7VERVUFFAW/2/Z5UxLHK5
	TzQXEcR4uZImwfL67B4Cqd9K6P94GZINrYbenWGRw3E258VY4mHZAiffXyYY91NK8DseJV/NzihZ/
	MNy978j5Q4kQ3NkbPeHLbp3Pjdf40Hb+0gbw1gqynMbjtzFqQEqsRHx8ZbEyroZTC9H+nu3bEQgwa
	pcnk8OWOKW3yR/zgtGZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAY3H-005ouZ-0g; Wed, 28 Dec 2022 15:09:07 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAY3D-005os0-Ub
	for linux-amlogic@lists.infradead.org; Wed, 28 Dec 2022 15:09:05 +0000
Received: by mail-lf1-x132.google.com with SMTP id f34so23953385lfv.10
        for <linux-amlogic@lists.infradead.org>; Wed, 28 Dec 2022 07:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gmtzdmo2KThie2rygVM6gP58Xp8wt3BXaHi7Yl4AiAo=;
        b=aIEQthuYYFP2u5JfqSwCIwrX6pmtwHj4uKu/TPmyjwKjHetmAFuw1XODvI1ksigK6G
         lz4x4V1+LYWrS69Y7O4l7UAptRwq8w54nAbS3h4FHQU60AdvnHf5zIHeMwDi2Hl8tzIY
         8BD6fwiT1k3PCDLPgDc0TTRJsFUy9jE9qZ3KsBOaY0BuqnIvtYZar456VJkxwhR14T9C
         r+QfzJY/nYQ1YPRC/chI+6lsVhqlvOY+unQY3iiY/CDbz/PJ32LxMjdPrpKdpcpcqeEJ
         /gVcMA3swWTHHi8wD7MCjpw2nnZVBNrwNGQkM3unZSatZm2JCRD6kGqJVggh70z6FKUC
         mqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gmtzdmo2KThie2rygVM6gP58Xp8wt3BXaHi7Yl4AiAo=;
        b=GAZO6tyL0BsgMnbVfMJqbVVc8WNPvaXu94nn6lqpHKKyt5f8W74GarkEkPcgKI9dUn
         epz5xkHVz1UgzQIMg8SIVGe6jozGjlD0PR5lPQ0lwDNRuWaUAP3bjCrjUcTx10woCBbv
         lq53VWq38pS0S0mCX1YL+uniSiYHvbnhg25cWiIMAnkRiew/z0JN91n/2YSx4CLo0sTJ
         pFc//Q3bGL3wg5AHuj5KrByBgeR8vizrq2zBlZjaG/wM9vrlFnZtFDMqltSS/LTIgB3b
         ded9nUSsqgVv2SqzA6WERe3lapc0vvlCeQ6kz6RxUitZk4wMPsHPjxkp3L2LglFO/xMN
         418g==
X-Gm-Message-State: AFqh2kq+Yg/9pU56dwCYbmaM3dOyqI2XEUaW8g2BlqeJ1ZR0tD9HmBxZ
	jdxQX6u1wiRpERTf5yXjgUc2TA==
X-Google-Smtp-Source: AMrXdXtpRI5PKCqyRot0pgpuz1wAaTYR67+7gZgy3rUY+4sjGmfy+SH5CBZzaltjcR2FFjL39uNMfw==
X-Received: by 2002:a05:6512:2008:b0:4b6:ed8b:4f17 with SMTP id a8-20020a056512200800b004b6ed8b4f17mr6598667lfb.51.1672240140575;
        Wed, 28 Dec 2022 07:09:00 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p9-20020ac24ec9000000b004caffc90c29sm232333lfr.55.2022.12.28.07.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 07:09:00 -0800 (PST)
Message-ID: <c5b0e7e3-7e74-308f-a64b-f472acd670eb@linaro.org>
Date: Wed, 28 Dec 2022 16:08:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 02/11] ARM: dts: amlogic: Used onboard usb hub reset to
 enable usb hub
Content-Language: en-US
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221228100321.15949-1-linux.amoon@gmail.com>
 <20221228100321.15949-3-linux.amoon@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221228100321.15949-3-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_070904_033996_09BE2DCA 
X-CRM114-Status: GOOD (  15.15  )
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

On 28/12/2022 11:03, Anand Moon wrote:
> On Odroid c1 previously use gpio-hog to reset the usb hub,
> switch to used on board usb hub reset to enable the usb hub
> and enable power to usb hub.
> 
> Add usb hub regulator as per the schematic.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  arch/arm/boot/dts/meson8b-odroidc1.dts | 40 +++++++++++++++++---------
>  1 file changed, 27 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
> index 04356bc639fa..3b29169aac43 100644
> --- a/arch/arm/boot/dts/meson8b-odroidc1.dts
> +++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
> @@ -185,6 +185,33 @@ vdd_rtc: regulator-vdd-rtc {
>  
>  		vin-supply = <&vcc_3v3>;
>  	};
> +
> +	usb_otg_pwr: regulator-usb-pwrs {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USB_OTG_PWR";
> +
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +
> +		/* signal name from schematics: PWREN */
> +		gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		vin-supply = <&p5v0>;
> +	};
> +
> +	usb {
> +		dr_mode = "host";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		hub@1 {
> +			/* Genesys Logic GL852G-OHG usb hub */
> +			compatible = "genesys,usb5e3,610";

Wrong compatible. Does not match pattern in usb-device.yaml.


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
