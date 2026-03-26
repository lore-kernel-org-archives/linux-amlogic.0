Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CFA106F303
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2026 08:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mL12yVRMWtW6+5c0NljIEGWjVumGtDTb6elrqHy9B6g=; b=OJ9OB/tChExizNYeJbhBPQD1QE
	OTc3qeibjkXOH6vBfvn0LQPQ248b2UFGVYWATfYhVzDPavHE+iqHPADhoDqmImOtQL4s7m38N2ymE
	j9xzuHhgqzRXafTJhIKMsF4Qcdq+IicCpc5TlYD/t7//iXGxqrmYgOM7hGTAeWRh6eSMMonYJULIm
	V3QpopUBzNOZ2PXtNcV5DGwPSc0PqQnfWI03pP7xQZLQLv4ClG1TscmvI/Z1dtAjwUGe6qttPM9GN
	BVFFsViTYwjEabPUqM2xB0y/Py1ZkO5GYpI33+QNmpP+5eflxwWVbtEgY27BTv5HqMRLypQoxvYLE
	NO/TqzLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gT7-000000054Gq-3OaO;
	Thu, 26 Mar 2026 08:53:34 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gT4-000000054E7-0zXF
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Mar 2026 08:53:32 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so6616935e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Mar 2026 01:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515208; x=1775120008; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E0QdGIGJmrLd5pDRPLgO89nIX7dVoELnsj1kn655mmo=;
        b=G+RLE02J420KZsE55pLLFd/DeKpR3C0ksHe157rZvzgLY/6lM9BVjfauDsbMFf5bQ/
         evwh0g/PdERNpxLAImY2ig9aIHbrFPlFZGzBBE0gK0F/8Xfs9oM50ALdbNkkjXASz7E1
         sLygtvBr6jw3codSquU41k8eUQgFnKPDtCNtPf+TlegzkJcJOalM2hoGfFaad2+8hZT7
         Fe6rD8Bx6sZkzDsIGksGNrvcwUwYLVsiCHicraMMIyFedLS+nE5FVaV53QA6BoQWbcKv
         P23mV+ac6jIfOxCpeVswbM8zCqLasBLyza14ySB9Q/FAYlnfCjp9jlPKqld8L7ZZ6lWk
         tsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515208; x=1775120008;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0QdGIGJmrLd5pDRPLgO89nIX7dVoELnsj1kn655mmo=;
        b=H5VdiSmq75Z8k8W4jglOFaQ18C56GgCm0IG/jWJLX9RTbGqB2DgDoD/kahbzC8xQmO
         Q3nE2izFosE0SqQAUIjQ6vikzD4E93BeHlHdUbL8efLzdqBnGix1RImLVcEnFWub/wZV
         INwExMQFAc1x4eUM7CshzX5IIHVi4LnQI5dOXDAup5epttD/tvGzApPnD1drx2tTmXUb
         MUT/g7Kc1J4pysUg/gxqwodo1Te6PIEZtBgnu8seJFVkUhuV46B/ayMfxL2fgh2t5H34
         cihHhzMJx3BOuxkmYSFvlUNvRLukIYuvPFMPZrB5NUwZ4f7LYUSibtGVeE2XPBUxokZn
         jIQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI3ksT4uFyIDYVuFpBOZeVpT55i1XSwo1KpeKG2ZqTp3UOVaVqBWjVe64PhrgOefVoVCJf0Bnp8Le1rc87@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0DVkUj18NY97pq+F27fM6wvLWQjWfkQRJsrEa7VYMBaC4b3Uc
	xfV4LOAMubVnHbSAzgZ7zKIwfXG2SDL0m8ZtyMJhYumyRoy0vejnb7O0BovWgzysQAU=
X-Gm-Gg: ATEYQzy+cJyuBHW2OhKqHfL8rm/3Ht30DumhQ5vSleAOUp70svG1PoOyvhecq6cu8M2
	1WEa7J+gSiGd+GwN1oP20e8qBuWI9bp+xFhAYxwQhl1ACpMSMNxErqPIMBvRJrkzWGWFF4zfoNh
	UzMD15btLkqyFLkQFN1xYfhf5fY6fVCYCPX+aZu8xkj0+4LA+XcgaEwwdLEMyG8kOM0PtKAtm+L
	D09hBBXyufwKYevaShXGspqu0ppKvVckGwDoAJs8ubmNvk4A0PuewYVSiowEFEimXFwPEQsCmi6
	4KwrkPjg81Rt+AXB8MJeCs7LPZUFKQsjRRRY71KCaKucoSOiCM30G14pqTkOfwxYTip/ewNKvNC
	asXDcr0oVPAl4vD/I0VG1hIRDqmQYSScHy0kbykv7GQLRGH2bQ/1q3wu6h5tUOVcMvid8Sz4sAS
	G1KDK9wghzVYHiZ4cPWkYwdX/Yyyo24FyE7xo/xljQG/tj4d6imEFoUXER5CjFwyMkQ1H5bu5+v
	51lyII=
X-Received: by 2002:a05:600c:4705:b0:486:fc4a:2951 with SMTP id 5b1f17b1804b1-48716083231mr103005895e9.28.1774515208194;
        Thu, 26 Mar 2026 01:53:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8431:f88b:714d:f78d? ([2a01:e0a:106d:1080:8431:f88b:714d:f78d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c65989sm29792335e9.2.2026.03.26.01.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 01:53:27 -0700 (PDT)
Message-ID: <3780aa8e-5082-4494-aa9e-ca84544bbdb2@linaro.org>
Date: Thu, 26 Mar 2026 09:53:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 6/9] arm64: dts: amlogic: t7: khadas-vim4: Add power
 regulators
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org
References: <20260325-add-emmc-t7-vim4-v4-0-44c7b4a5e459@aliel.fr>
 <20260325-add-emmc-t7-vim4-v4-6-44c7b4a5e459@aliel.fr>
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
In-Reply-To: <20260325-add-emmc-t7-vim4-v4-6-44c7b4a5e459@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_015330_320963_2137AE42 
X-CRM114-Status: GOOD (  12.52  )
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

On 3/25/26 10:15, Ronald Claveau wrote:
> Add voltage regulator nodes describing the VIM4 power tree,
> required by peripheral nodes such as the SD card controller.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 90 ++++++++++++++++++++++
>   1 file changed, 90 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index fffdab96b12eb..2450084d37642 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -6,6 +6,8 @@
>   /dts-v1/;
>   
>   #include "amlogic-t7.dtsi"
> +#include <dt-bindings/gpio/amlogic,t7-periphs-pinctrl.h>
> +#include <dt-bindings/gpio/gpio.h>
>   
>   / {
>   	model = "Khadas vim4";
> @@ -45,6 +47,94 @@ xtal: xtal-clk {
>   		#clock-cells = <0>;
>   	};
>   
> +	dc_in: regulator-dc-in {
> +		compatible = "regulator-fixed";
> +		regulator-name = "DC_IN";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	sd_3v3: regulator-sdcard-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "SD_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vddao_3v3>;
> +		gpio = <&gpio GPIOD_11 GPIO_ACTIVE_LOW>;
> +		regulator-boot-on;
> +		enable-active-low;
> +		regulator-always-on;
> +	};
> +
> +	vcc5v: regulator-vcc-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&dc_in>;
> +
> +		gpio = <&gpio GPIOH_4 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	vcc5v0_usb: regulator-vcc-usb {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC5V0_USB";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc5v>;
> +
> +		gpio = <&gpio GPIOY_5 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	vddao_1v8: regulator-vddao-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDAO_1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vddao_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	vddao_3v3: regulator-vddao-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDAO_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&dc_in>;
> +		regulator-always-on;
> +	};
> +
> +	vddio_1v8: regulator-vddio-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDIO_1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vddio_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	vddio_3v3: regulator-vddio-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDIO_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vddao_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	vddio_c: regulator-gpio-c {
> +		compatible = "regulator-gpio";
> +		regulator-name = "VDDIO_C";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vddio_3v3>;
> +		gpios = <&gpio GPIOD_9 GPIO_ACTIVE_HIGH>;
> +		states = <1800000 1
> +			  3300000 0>;
> +	};
>   };
>   
>   &uart_a {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
