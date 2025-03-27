Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0722CC3600B
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Mar 2025 10:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFXaSVk1iWjqLhZa8t3FXeAdtpEUmy7S2vitCh7Xvmw=; b=cOSWVukvEJjlhsBq9gncVf5pTb
	072Dh7l0Vx4HdMPq0bshxUO+XB4q/zGKu9X/sfOhZXFGQn42iigqPzCKPIHXE8bWZJwFWy7mToYqy
	UGr7YqPxG2esKGJHNuYRnERpdTTd7zNyFhSnX1w1eYv0hXIzj2dKmjpBBKDNjiT3Ayarvubjws5LW
	r5Dt1sg3z8S6SdLR5faPrG5sGj2y92uTedFQG2yWmJr5SqrGivdUuIvYBGGCyXbzadz3prHOP8+0U
	sz9zrkzeNrvUhhO/+npwsisCBAEeJvWkXVSl6KCzA81Fk7wjG0AdLAQe7nMkDWGFD6cohA+ecZoDf
	P0y5dQpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txkBs-0000000AfW4-02xk;
	Thu, 27 Mar 2025 10:10:24 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txkBo-0000000AfVA-3o4Y
	for linux-amlogic@lists.infradead.org;
	Thu, 27 Mar 2025 10:10:22 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43948021a45so7790375e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 27 Mar 2025 03:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743070219; x=1743675019; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5dVK4MEqf6X0TMeYGVfQUWRHq14IdZfNCfWTmHkdE5g=;
        b=Z14sqz1JFHCAQKa39ZdWJBbxXu+W3e7YWq3/D4uGv1muGSl9wrdM/26Dn/EcXUtTEw
         au4RrdWSHN+QzG79MWYyoz0diIk8IY4J47rPJkjBMzupT0+8NguNHtmHyIEd09nnj0f0
         OyRRpK74MAMFOHK2iialwqWwoq/aWXemJoUqk740Dgm0p2ckQTR/kfF/+hYsx4nuCjOP
         zeLiiR13c1gVNf2EiMgDdwPxOnsJyf2zAm8lZfSXcsN5IjG9dWjOtSxWbNdbWLAV6d+3
         K2WfpY5oWfme1m0FoN2+Y3689CFCO1PoLwSEtfnW8dXH1NlBBBLS2Xyjcv7aHW6z5Q6u
         TZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070219; x=1743675019;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5dVK4MEqf6X0TMeYGVfQUWRHq14IdZfNCfWTmHkdE5g=;
        b=muqaSeF7V9yAiA6jmE7KX3UwPx8apmGZVTM5dR26S6AIpVCtea4yX6YhuwHHDbG4sY
         iISNWHW0crd3Api0HfzL5lWnBwpYXzPs6uOZo6X9U+HLiVueEV9qozcuv9Tk6PIrDxui
         NWf6GIimJQ9OqBxvQYECbphdxjmKj+IrKcyto8TJKE8UXaAn1loUJiWH0SBdkoplI429
         cvw7wvKkNxFyKCisFhzkTb/JpeUeCXxD7C4jc6FwxmsFtob8RECV2E8IY38/NCifsVme
         FyuAx30FD46/DFc8QUMCgI/ZcsmZ2jTRb7Hwl6w+Wq4qHAWQVG22sMGoqhHUXq3SP50g
         i31Q==
X-Forwarded-Encrypted: i=1; AJvYcCWefUPBbV2bytOXsmP5fzwkIf7iJIzzuqya0rg3DKdJD8doInw9uN9v/5tJeLdClheacbhZzZMRdkDMJGda@lists.infradead.org
X-Gm-Message-State: AOJu0Yzltb7Idl9p17L3dvR9RwMZW46cFg7xZrrROn0xoN5br2eBT+k/
	5YkZZ6ryJOu8Wdjgmj+YASoGua310tOKqG5BROpODl7CoGrB94ypiX5jpPZ/H7M=
X-Gm-Gg: ASbGnctiFDZLRlyLeOVzqj0Pa/ZQZUA3aX8NvvGn01jUM2/NWaW/+fhEHM2lKIxBrtw
	1UzZsyv473n+qA+IDkIR2R/f6M3QQ/fxCMYc+g3nS97EpRM6bzmxPXm20o1eoGWO8s2dXzwm8f8
	kMNqF1wZX619VlscMUz3alhUq45XP5KOLN1CZhtFH79aP04IPR/G9URM2RagYELfEMJrgtC3Zya
	J9VvpZzrlE0r0HtIHRUqHbL31HInta7uXvu6B0BMZJ9VNXGocwRGAT/5Ya8uGZYd6AQmw0piBtv
	Z0BnENjIJdkIK0n2UG2/NU1VVr3ebtvXqaE5zRUtFd3NQYfuJRU7fltquclbrKl5yrznDACpLJO
	LYhNcYCX6uUU4AqK7GUmayQ==
X-Google-Smtp-Source: AGHT+IFdm/AJweeb4Ls+JsWWO80Odn3wmJFBflJjpJ8ov4hI0GxODhTug3GPSfXEWpEi5SzYYyG8Fw==
X-Received: by 2002:a05:600c:4fd4:b0:43c:fceb:91f with SMTP id 5b1f17b1804b1-43d84f8b8a2mr35592795e9.11.1743070218550;
        Thu, 27 Mar 2025 03:10:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f1b8:272a:1fa5:f554? ([2a01:e0a:3d9:2080:f1b8:272a:1fa5:f554])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b5939sm19851219f8f.60.2025.03.27.03.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 03:10:18 -0700 (PDT)
Message-ID: <d83eede1-2bf9-4ec1-ac8a-a55328324613@linaro.org>
Date: Thu, 27 Mar 2025 11:10:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: a4: add pinctrl node
To: xianwei.zhao@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250326-pinctrl-node-a4-v1-1-8c30639480f6@amlogic.com>
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
In-Reply-To: <20250326-pinctrl-node-a4-v1-1-8c30639480f6@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_031020_955247_689BABAD 
X-CRM114-Status: GOOD (  15.69  )
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

On 26/03/2025 06:17, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add pinctrl device to support Amlogic A4 and add uart pinconf.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> This commit is based on the Neil's suggestion, rebase the commit on top of
> https://web.git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=for-next
> which merges this commit:
> https://lore.kernel.org/all/20250212-amlogic-pinctrl-v5-4-282bc2516804@amlogic.com/
> with another one:
> https://lore.kernel.org/all/20250321-fix-a4-pinctrl-node-v1-1-5719f9f09932@amlogic.com/
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 125 ++++++++++++++++++++++++++++
>   1 file changed, 125 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> index a06838552f21..c02fa5ee9fd2 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> @@ -5,6 +5,7 @@
>   
>   #include "amlogic-a4-common.dtsi"
>   #include <dt-bindings/power/amlogic,a4-pwrc.h>
> +#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
>   / {
>   	cpus {
>   		#address-cells = <2>;
> @@ -50,6 +51,107 @@ pwrc: power-controller {
>   };
>   
>   &apb {
> +	periphs_pinctrl: pinctrl@4000 {
> +		compatible = "amlogic,pinctrl-a4";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0x0 0x0 0x0 0x4000 0x0 0x280>;
> +
> +		gpiox: gpio@100 {
> +			reg = <0 0x100 0 0x40>, <0 0xc 0 0xc>;
> +			reg-names = "gpio", "mux";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_X<<8) 18>;
> +		};
> +
> +		gpiot: gpio@140 {
> +			reg = <0 0x140 0 0x40>, <0 0x2c 0 0xc>;
> +			reg-names = "gpio", "mux";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_T<<8) 23>;
> +		};
> +
> +		gpiod: gpio@180 {
> +			reg = <0 0x180 0 0x40>, <0 0x40 0 0x8>;
> +			reg-names = "gpio", "mux";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_D<<8) 16>;
> +		};
> +
> +		gpioe: gpio@1c0 {
> +			reg = <0 0x1c0 0 0x40>, <0 0x48 0 0x4>;
> +			reg-names = "gpio", "mux";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_E<<8) 2>;
> +		};
> +
> +		gpiob: gpio@240 {
> +			reg = <0 0x240 0 0x40>, <0 0 0 0x8>;
> +			reg-names = "gpio", "mux";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_B<<8) 14>;
> +		};
> +
> +		func-uart-a {
> +			uart_a_default: group-uart-a-pins1 {
> +				pinmux = <AML_PINMUX(AMLOGIC_GPIO_X, 11, 1)>,
> +					 <AML_PINMUX(AMLOGIC_GPIO_X, 12, 1)>,
> +					 <AML_PINMUX(AMLOGIC_GPIO_X, 13, 1)>,
> +					 <AML_PINMUX(AMLOGIC_GPIO_X, 14, 1)>;
> +			};
> +
> +			group-uart-a-pins2 {
> +				pinmux = <AML_PINMUX(AMLOGIC_GPIO_D, 2, 3)>,
> +					 <AML_PINMUX(AMLOGIC_GPIO_D, 3, 3)>;
> +				bias-pull-up;
> +				drive-strength-microamp = <4000>;
> +			};
> +		};
> +
> +		func-uart-b {
> +			uart_b_default: group-uart-b-pins {
> +				pinmux = <AML_PINMUX(AMLOGIC_GPIO_E, 0, 3)>,
> +					 <AML_PINMUX(AMLOGIC_GPIO_E, 1, 3)>;
> +				bias-pull-up;
> +				drive-strength-microamp = <4000>;
> +			};
> +		};
> +
> +		func-uart-d {
> +			uart_d_default: group-uart-d-pins1 {
> +				pinmux = <AML_PINMUX(AMLOGIC_GPIO_T, 18, 4)>,
> +					 <AML_PINMUX(AMLOGIC_GPIO_T, 19, 4)>;
> +				bias-pull-up;
> +				drive-strength-microamp = <4000>;
> +			};
> +
> +			group-uart-d-pins2 {
> +				pinmux = <AML_PINMUX(AMLOGIC_GPIO_T, 7, 2)>,
> +					 <AML_PINMUX(AMLOGIC_GPIO_T, 8, 2)>,
> +					 <AML_PINMUX(AMLOGIC_GPIO_T, 9, 2)>,
> +					 <AML_PINMUX(AMLOGIC_GPIO_T, 10, 2)>;
> +				bias-pull-up;
> +				drive-strength-microamp = <4000>;
> +			};
> +		};
> +
> +		func-uart-e {
> +			uart_e_default: group-uart-e-pins {
> +				pinmux = <AML_PINMUX(AMLOGIC_GPIO_T, 14, 3)>,
> +					 <AML_PINMUX(AMLOGIC_GPIO_T, 15, 3)>,
> +					 <AML_PINMUX(AMLOGIC_GPIO_T, 16, 3)>,
> +					 <AML_PINMUX(AMLOGIC_GPIO_T, 17, 3)>;
> +				bias-pull-up;
> +				drive-strength-microamp = <4000>;
> +			};
> +		};
> +	};
> +
>   	gpio_intc: interrupt-controller@4080 {
>   		compatible = "amlogic,a4-gpio-intc",
>   			     "amlogic,meson-gpio-intc";
> @@ -60,6 +162,29 @@ gpio_intc: interrupt-controller@4080 {
>   			<10 11 12 13 14 15 16 17 18 19 20 21>;
>   	};
>   
> +	ao_pinctrl: pinctrl@8e700 {
> +		compatible = "amlogic,pinctrl-a4";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0x0 0x0 0x0 0x8e700 0x0 0x80>;
> +
> +		gpioao: gpio@4 {
> +			reg = <0 0x4 0 0x16>, <0 0 0 0x4>;
> +			reg-names = "gpio", "mux";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_AO<<8) 7>;
> +		};
> +
> +		test_n: gpio@44 {
> +			reg = <0 0x44 0 0x20>;
> +			reg-names = "gpio";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
> +		};
> +	};
> +
>   	gpio_ao_intc: interrupt-controller@8e72c {
>   		compatible = "amlogic,a4-gpio-ao-intc",
>   			     "amlogic,meson-gpio-intc";
> 
> ---
> base-commit: 23a708916ec7ab21c8c81d61bdb7cb933f6867d5
> change-id: 20250325-pinctrl-node-a4-a4667d5ec8cb
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
