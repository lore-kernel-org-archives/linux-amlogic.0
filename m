Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B693CD6901
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Oct 2023 08:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TdGTY3I3/PjVOxz1BW+ZOkEFh2j9TE9SIyb5LUnlV70=; b=ionRjj3UychZHbG3DhuqHMYSUX
	vMNITk21pclYWKstiopw45YbqwOjLVtjVPdKklX47EI0S3/20bxbyb6B2ZJuQYVGbVmZwswUu3c7b
	FzN4bboRWDGTkvJbHuTxqdRmTP/fPwOlygimTRseBdFyVBduWr7bMXLEG5EuuoCnQMI005a4Ji26z
	N1WWi/CTMayJ+h03U9LJ7dUJBeCydEu9tLcuRnC9kcQt+3fKm2WVAOwPZQunKG54V4XK0kWGNEezE
	UBy20Eia8h71gz3JbxBvvngNrdR78qBUo2UXzbfzq6xBP8a1x/7QukM41ZZSU5F5ie5IOs2FYJ31+
	7LkUEgow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq7pb-00Cnmc-36;
	Tue, 10 Oct 2023 08:11:07 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq7pW-00Cnky-2m
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Oct 2023 08:11:06 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c008042211so65005151fa.2
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Oct 2023 01:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696925457; x=1697530257; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1a48CmyL9ZDxqT8GaS516AQ8gzDOMjf9YgIiThoGiys=;
        b=v4qvF7jP7nCQzXSuYRmwBa2sulQO1AofEqsCAQDK5RmwdgXxB+G3ZxTlltLAqizXZo
         qLsiwagwGEhYteoiLBb3UkVwFUa1chM/1bSpv2aFMzEl/hjbBVaz+kcltwMh7bRT3ir1
         zlgrdu8EiuZobgkV4BzdD0nh0L03yYsh+XlcABDv6+ogj4pwJPmSEI7peMXFZHLYaGq9
         FdLoRINol9m90LdinPnKzryNOYh3aVSIno3vPhDAftEu14H0rTmPg2puAQEozrFNXnM7
         GwTc7N1ZTpHF5VYvJ5NO4SPI5QbzeLQyeQarJun57uJjsmrlWQuvIrP3MKeFpHI2rTbi
         n3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696925457; x=1697530257;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1a48CmyL9ZDxqT8GaS516AQ8gzDOMjf9YgIiThoGiys=;
        b=rWVzs96cZZ24Vv2F4L8cTmv2aMMTK5i8D4wA1dYAfKwnAy21OSUg7eB47vjg00UIpD
         6Xza9ajo4Ozhs3gkeh1BHfIBB+kpk5V1K/WWbnBVvdLHZlqbr0OfE2iuJ4GOeDAhz5kN
         /q4YbOfVC4Moxfhz8H3nIdC1MXZpkWJACwsGoS8iTQK8I4Tz3iphuohuVCgYaZjsjLG9
         2Ut0ouwXeXbgVmmHBTGBOUUYML3d9UteehqvTh5S40+YVPJNIufOsJOTtPL1hy2u8pOp
         heIEcB0WOGQmvkpE9YUYgR0N5gM5A7JS3UcEt1uFcOpia+lDFxuGHH/p8UR0/rxuu2BE
         Z03w==
X-Gm-Message-State: AOJu0YwzHSNmB03zywq4AyPSJ8EWB626yQjSckPEAn6vKHsaBQNSOOa0
	itaBkXycpga5PhJvQpzwddpISQ==
X-Google-Smtp-Source: AGHT+IH2EG3+O/1Qs0XpA1QByo9hC1ybArnKOkeeU3N5GC1Yqu4n5+ax+pQS2hcoI9oYEWdqf7rZ7g==
X-Received: by 2002:a2e:9455:0:b0:2bd:19c5:3950 with SMTP id o21-20020a2e9455000000b002bd19c53950mr14597002ljh.33.1696925457458;
        Tue, 10 Oct 2023 01:10:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:2eac:5b51:e0a4:4807? ([2a01:e0a:982:cbb0:2eac:5b51:e0a4:4807])
        by smtp.gmail.com with ESMTPSA id v11-20020a5d6b0b000000b00324853fc8adsm11818176wrw.104.2023.10.10.01.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 01:10:57 -0700 (PDT)
Message-ID: <9fe7d0d2-3582-4b62-be9b-aa9134c18023@linaro.org>
Date: Tue, 10 Oct 2023 10:10:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1] arm64: dts: amlogic: Used onboard usb hub reset on
 odroid n2
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231010032446.3194-1-linux.amoon@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20231010032446.3194-1-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_011102_924081_87329DE1 
X-CRM114-Status: GOOD (  19.20  )
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

Hi,

On 10/10/2023 05:24, Anand Moon wrote:
> On Odroid n2/n2+ previously use gpio-hog to reset the usb hub,
> switch to used on-board usb hub reset to enable the usb hub
> and enable power to hub.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>   .../dts/amlogic/meson-g12b-odroid-n2.dtsi     | 36 ++++++++++++-------
>   1 file changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> index 91c9769fda20..9e671444eca6 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> @@ -31,6 +31,30 @@ hub_5v: regulator-hub_5v {
>   		enable-active-high;
>   	};
>   
> +	/* USB hub supports both USB 2.0 and USB 3.0 root hub */
> +	usb-hub {
> +		dr_mode = "host";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* 2.0 hub on port 1 */
> +		hub_2_0: hub@1 {
> +			compatible = "usb5e3,610";
> +			reg = <1>;
> +			peer-hub = <&hub_3_0>;

It seems peer-hub is missing from Documentation/devicetree/bindings/usb/genesys,gl850g.yaml, could you add it ?

Thanks,
Neil

> +			vdd-supply = <&usb_pwr_en>;
> +		};
> +
> +		/* 3.0 hub on port 4 */
> +		hub_3_0: hub@2 {
> +			compatible = "usb5e3,620";
> +			reg = <2>;
> +			peer-hub = <&hub_2_0>;
> +			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> +			vdd-supply = <&vcc_5v>;
> +		};
> +	};
> +
>   	sound {
>   		compatible = "amlogic,axg-sound-card";
>   		model = "ODROID-N2";
> @@ -234,18 +258,6 @@ &gpio {
>   		"PIN_3",  /* GPIOX_17 */
>   		"PIN_5",  /* GPIOX_18 */
>   		"PIN_36"; /* GPIOX_19 */
> -	/*
> -	 * WARNING: The USB Hub on the Odroid-N2 needs a reset signal
> -	 * to be turned high in order to be detected by the USB Controller
> -	 * This signal should be handled by a USB specific power sequence
> -	 * in order to reset the Hub when USB bus is powered down.
> -	 */
> -	usb-hub-hog {
> -		gpio-hog;
> -		gpios = <GPIOH_4 GPIO_ACTIVE_HIGH>;
> -		output-high;
> -		line-name = "usb-hub-reset";
> -	};
>   };
>   
>   &i2c3 {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
