Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87124CCF2D0
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Jan 2026 09:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5JlfuBKp3afIfJ3mGPt/nmzpWq/hIyYA1DYFnyNzVZ8=; b=HDNPhPh+ZaEIFdknOho9FEg/8A
	+DBWYI0xJdcuAlOhFlpd5XCfAm88om9zlytv56G8C6DhdGJhjMzz3vDpntVpXcEmlDoU5coCQVkLY
	oyrdoNQjuOwdn6/sPlsAqR0CV2LBGoTd9tc8+ufgiTHAP8MjZTwWQjHLv2SwKlKQE8H7H5J986TSz
	CTfGOMP9wuaKs8trgyRCo+j2mi0HwVdvXm6/OYtegiTiiqs3hxbMvKn3FeUU0Hw9Hjj7sAPOdC/Zd
	F7ot9goIG8DpALfQN6hTytHhuWD6/6s0rm38yUBp+e+H6vj4M7O/kxBXOxdtoQkxMZ5ZUhODFQbF+
	NxFlS/kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhlGA-00000001bXu-10g6;
	Mon, 19 Jan 2026 09:09:18 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhlG7-00000001bWw-1F0h
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Jan 2026 09:09:17 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4801bc32725so18682315e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Jan 2026 01:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768813753; x=1769418553; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2qyChUcZ0ALXhZnLJMM6QJGa1Ir92G1VwHYl/E5QOo=;
        b=L0asUpoX4iyaW+8gISRqZif/xvtY3h5tg7t0g44od1y2SogaTdBzgbjkloyHI4ytwP
         ESKg+81UWMQn76RfRxdFLpDUl32URlKPtevhOJbiZkHHJYt+J3uGVgmLcdEpeKvZTYsS
         gNaX3mGNd+vK86Tl2bVjZMMNsfy0F77XcrDO09n1ITAOwTqngyERVKgTxn/pJV3HuZEc
         X10cXV147T8va10rhrMshEmad2D97aly/O0iv3elXecj83JNaTvmHrsWB6Lnbog48cvM
         z+EpsRvWgBbNZMZiBPbOKiO/yzKMYa94lo9qDet0c/JU5fCkdcDLgz8LVC8KTjhlIh5g
         VfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768813753; x=1769418553;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X2qyChUcZ0ALXhZnLJMM6QJGa1Ir92G1VwHYl/E5QOo=;
        b=QaWL+d6GWf2W9YE47FscvDgtSW2wXIkR/u8ghrwlPmzMpmsEoyrFp/yi1DHEJ+gaGQ
         096PSIe62ijhWz9BC5GgyjTydicae6GUE/QhvmJi1koXM+B6LJH8cvgZdQoP4amEuVhr
         /tRbfNBfZz0OXssRmonZ7pvejumUg7HFA788djPhx9DUpCgRPhpLisq5g8AzDJrSzhtI
         1TbTgSdqoFBcXrLr58q0eAqbTIbiQsjWdHGbp6RQepzayrDXCaLoa/AkYUNZpBH8uuff
         4BUlE7tr1i1m76PJd1DzyeimIXjVLGJLo4eoZQ+zkwZ62ARggYbeu6u1GrHkcZ2FXml2
         h0iA==
X-Forwarded-Encrypted: i=1; AJvYcCXgcilS6bj7xB1VEuzDNxP/cGGBAp6rTXNbeJnXsm0qbrBsGnGKs7QNLY8E8KpBtJ4pYMc5xRHifUKIwhIN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0z5LEITsSbB0V28M4h9BMmQj8zMFCSCKd53qmvrzs5JNTD32V
	01ecNtu6SLCD+LAgFYT3AXdSwswohzMLVMtFgJEPNiJwQptrNCTH0yLx444TaOP3Z6E=
X-Gm-Gg: AY/fxX4DAw8CKjZPJQSKDSysLsAwKokOoimJWXwASGjxzJpmk55OZ/GrQp8cK7izKf1
	AKKWHyDX+h+u4RDaIwVCgoxWHR5w+hrUw4SmXwRXkYHGVRgYsJi9E83R/p0a4bm+kRMtsmIrT4b
	KHJIGALxnWww/vfOVHgkiPk05kYqKAtu3juJqtmoYXPndExeQWMwm4L95iteIhKvaiYo6ExwggB
	xpRXreS53t7zcM7q4xDCNXA5cuC6vWFMDrfJs3TNi6SJk35t3+J6qAnEdHN7swVVFHteHpt3rDu
	RJ1TQ/uDlMMnPIKjizZf5SR2dn85Dk4aG8RCVi2mAXNCb2LIsARTARhErh9hYKpcN6Z2QFwhjSf
	lfBMI7XFs1yPjeLYBh7C0vuqXsCSwxB57ecyIBxVIP5L0wmpJT4BxRFErpmMicLIzONsxGlzDLQ
	MGnOx698np2iikD+B0chgTqmYeITiTmcFl89p7hIZAQHeafpRm5MO14tMEOTKpJp8=
X-Received: by 2002:a05:600c:1c1c:b0:47a:814c:ee95 with SMTP id 5b1f17b1804b1-4802319ad40mr128271065e9.12.1768813753236;
        Mon, 19 Jan 2026 01:09:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:a458:3e86:7822:1c2c? ([2a01:e0a:3d9:2080:a458:3e86:7822:1c2c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4289b789sm240369035e9.1.2026.01.19.01.09.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 01:09:12 -0800 (PST)
Message-ID: <0c753e87-0848-4d54-82f6-18c610657471@linaro.org>
Date: Mon, 19 Jan 2026 10:09:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] Eliminate Odroid HC4 power glitches during boot.
To: Eric.Neulight@linuxdev.slmail.me, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260116-odroid-hc4-dts-v1-1-459b601cd5cf@linuxdev.slmail.me>
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
Organization: Linaro
In-Reply-To: <20260116-odroid-hc4-dts-v1-1-459b601cd5cf@linuxdev.slmail.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_010915_365044_E3A9220F 
X-CRM114-Status: GOOD (  21.17  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 1/17/26 05:02, Eric Neulight via B4 Relay wrote:
> From: Eric Neulight <Eric.Neulight@linuxdev.slmail.me>
> 
> Fix issue with Odroid HC4 (and all meson-sm1-odroid) DTS that causes
> regulator power to momentarily glitch OFF-ON during boot.  Add
> regulator-boot-on to all regulator-fixed and regulator-gpio entries
> that (1) define a gpio AND (2) define regulator-always-on.
> 
> U-boot powers on devices necessary for boot then hands off the DTB to
> the kernel.  During probe, linux drivers/regulator/fixed.c and
> gpio-regulator.c both first set the regulator control gpio (that U-boot
> already turned ON) to default OFF before then setting it to the defined
> (ON) state. This glitches the power to the affected devices, unless
> regulator-boot-on is specified with it.  In fact, U-boot has the same
> behavior.  So, during reboot, a power glitch can actually happen twice:
> once when U-boot reads the DTB and probes the gpio and again when the
> kernel reads the DTB and probes the gpio.
> 
> Problem this fixes: On the Odroid HC4, power to the SATA ports glitches
> during boot and causes some HDDs to do emergency head retract, which
> should be avoided.  On the HC4, power glitches to the SD card, USB,
> SATA, and HDMI interfaces during boot.  These are all boot devices.
> A power glitch can potentially cause a problem for any sensitive devices
> during boot.
> 
> NOTE: This is not limited to just the HC4, likely an issue with ALL DTS
> with regulator-fixed or regulator-gpio entries that (1) define a gpio
> AND (2) define regulator-always-on.  All such entries should also
> include regulator-boot-on in order to avoid potential power glitches.
> At worst, adding regulator-boot-on in such cases is harmless because of
> regulator-always-on, and, at best, it eliminates detrimental power
> glitches during boot.  So, this is best-practice.
> 
> Fixes: 164147f094ec5d0fc2c2098a888f4b50cf3096a7 ("arm64: dts: meson-sm1-odroid-hc4: add regulators controlled by GPIOH_8")
> Fixes: 45d736ab17b44257e15e75e0dba364139fdb0983 ("arm64: dts: meson-sm1-odroid: add 5v regulator gpio")
> Fixes: 1f80a5cf74a60997b92d2cde772edec093bec4d9 ("arm64: dts: meson-sm1-odroid: add missing enable gpio and supply for tf_io regulator")
> Fixes: 88d537bc92ca035e2a9920b0abc750dd62146520 ("arm64: dts: meson: convert meson-sm1-odroid-c4 to dtsi")
> 
> Signed-off-by: Eric Neulight <Eric.Neulight@linuxdev.slmail.me>
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 2 ++
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi    | 3 +++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> index 0170139b8d32f4274ad991b0f3d9a0f6c67969ce..3ece30a0a1fff736c544cf89ed0a8cca0890f128 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> @@ -52,6 +52,7 @@ p12v_0: regulator-p12v-0 {
>   
>   		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
>   		enable-active-high;
> +		regulator-boot-on;
>   		regulator-always-on;
>   	};
>   
> @@ -65,6 +66,7 @@ p12v_1: regulator-p12v-1 {
>   
>   		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
>   		enable-active-high;
> +		regulator-boot-on;
>   		regulator-always-on;
>   	};
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> index c4524eb4f0996dfbccec16ca5b936a5c3b2663a5..0bce4e8d965f2c83e6ba677fef2ede2726de6ed1 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> @@ -37,6 +37,7 @@ tflash_vdd: regulator-tflash-vdd {
>   
>   		gpio = <&gpio_ao GPIOAO_3 GPIO_OPEN_DRAIN>;
>   		enable-active-high;
> +		regulator-boot-on;
>   		regulator-always-on;
>   	};
>   
> @@ -50,6 +51,7 @@ tf_io: gpio-regulator-tf-io {
>   
>   		enable-gpios = <&gpio_ao GPIOE_2 GPIO_OPEN_DRAIN>;
>   		enable-active-high;
> +		regulator-boot-on;
>   		regulator-always-on;
>   
>   		gpios = <&gpio_ao GPIOAO_6 GPIO_OPEN_SOURCE>;
> @@ -81,6 +83,7 @@ vcc_5v: regulator-vcc-5v {
>   		regulator-name = "5V";
>   		regulator-min-microvolt = <5000000>;
>   		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
>   		regulator-always-on;
>   		vin-supply = <&main_12v>;
>   		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
> 
> ---
> base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
> change-id: 20260116-odroid-hc4-dts-54f4254d8554
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
