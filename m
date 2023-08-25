Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B109C71133
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Aug 2023 12:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GzVq3swDHekoursZQHss25ZiHFSDlXugR2fknBpS/6w=; b=akds4GdURwioBGjWIPi6CyKlOw
	tCAwJZv5Wph+PxNQENEh24WGh00gykNSVzkARems7B9j5B/HorU4gFIcbjOc5qBdB6huI/CHXsZIJ
	1MsnB+MQlq4aiuG1szB6KcIXPc+7XqD/x4kEi+iPku3jIXJuf3RTuggvDLjDWTIGrwXLTS5bJhvyy
	+LdEvJF9x86R2AmyhRvr+7TRJg3vkJH8cFK4+Kygh0RynoVwA4n2PpX+CNBSl2ljXdFMAGb9Gd5rS
	0FvURCeZKEPdVJv/XHlHcdzzl1tlQWa+4pE0Jgk39Hmh8KPsqpo7FOtdLMLvXdjgkqc2ccIV55bP3
	5Pmifwcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVk6-005MVx-15;
	Fri, 25 Aug 2023 12:16:46 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVk3-005MUR-0n
	for linux-amlogic@lists.infradead.org;
	Fri, 25 Aug 2023 12:16:44 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fea0640d7aso8052435e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 25 Aug 2023 05:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692965801; x=1693570601;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7W3K6QieOMlEGkELlxavl+PcEL/5xKZFRwCQWMzW5I=;
        b=lGawyDxFUMgbdHeE2koQ5KcxJuXV/iJw3TTRgxmLIObGXulXUhEPJnx0xecUBKAJpA
         Ca2dYbsYwIp9vv86H6MagZ6wXjHjswkjzgzLDeS3SixoIgzYXyrIdc/ulKk2rf652GVp
         TIgSzL0crZ0qhhHXYUQbPPt/5xAKnOCHCtyFU/etBkFFkz5lk2BaWZe3W52Gi+oAdFx8
         06Ws3MZra2x4CxbZSUqyfhCc+b22wJ09FXGpxZUXGBmhF8qJLTDEYUwuf7z0QJDQEMHd
         cvCOVP09pbZXRK6HCJRDNaLg/miI8lvLEw0lxcRxe1HTyN1CHYDMpRaNNnVFEPCHGckQ
         vPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692965801; x=1693570601;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o7W3K6QieOMlEGkELlxavl+PcEL/5xKZFRwCQWMzW5I=;
        b=eh2rWburPSJkqWPXeq1ZSNrst+rAFU+WogIIUZVFRX7iujl98bCrvY1YubiOWRgJcP
         XHS4gTKJAyc1mCxWe52x/f4ycBksxtB2M6/atMV3df7oSsQPlng1gU5iRYWCmciZzetR
         bTovddeIn/vNuGmCXOJnAgllHYzzJTU4Ga8eg3/xNDQbAomcFxdo/eDR9mmsnW3CN31s
         S7/Im+YQpQmKTV96kLvyCnwKZ4uN7PXe+BuQbswHk3RZQqul3KtBqaCgIqcNw0QLXS9W
         ibOQ8k6Oxl8gmEKrQVuDX9dItutQos5JZqKuq3Fwc/S/dFobqLtpN8yiRqG2dISsr1Nj
         A5ZQ==
X-Gm-Message-State: AOJu0Ywv8HkIL7HDyNPN/mHgHwMrAvJOZr2NODoWMnI8Ny99mo1naZZv
	EHfBDd49wEW/nvzUaPUgD6w5ag==
X-Google-Smtp-Source: AGHT+IFatSYfdQ8wgd9jKCT40sM9oeeY/ZuR3qwKdKNIQTZvKeZ8tkb1COEsYjFTJOuKxzoqMamt/Q==
X-Received: by 2002:a1c:7508:0:b0:3fb:a102:6d7a with SMTP id o8-20020a1c7508000000b003fba1026d7amr13978738wmc.28.1692965800627;
        Fri, 25 Aug 2023 05:16:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4e1:71e1:b02b:811e? ([2a01:e0a:982:cbb0:4e1:71e1:b02b:811e])
        by smtp.gmail.com with ESMTPSA id u2-20020a05600c00c200b003fe2a40d287sm2061684wmm.1.2023.08.25.05.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 05:16:40 -0700 (PDT)
Message-ID: <32873c1f-6c8a-425e-8965-a6f727d1408a@linaro.org>
Date: Fri, 25 Aug 2023 14:16:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: meson: add IR controller for Meson-S4 SoC
To: zelong dong <zelong.dong@amlogic.com>, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com, kelvin.zhang@amlogic.com
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
 <20230825115310.39993-4-zelong.dong@amlogic.com>
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
In-Reply-To: <20230825115310.39993-4-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_051643_291846_0FEE8A1C 
X-CRM114-Status: GOOD (  12.79  )
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

On 25/08/2023 13:53, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add the IR controller device of Meson-S4 SoC family.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>   .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts    |  6 ++++++
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi         | 15 +++++++++++++++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> index 8ffbcb2b1ac5..c1f322c73982 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> @@ -28,3 +28,9 @@ memory@0 {
>   &uart_B {
>   	status = "okay";
>   };
> +
> +&ir {
> +	status = "okay";
> +	pinctrl-0 = <&remote_pins>;
> +	pinctrl-names = "default";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index f24460186d3d..5a3abcc08ee5 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -106,6 +106,14 @@ gpio: bank@4000 {
>   					#gpio-cells = <2>;
>   					gpio-ranges = <&periphs_pinctrl 0 0 82>;
>   				};
> +
> +				remote_pins: remote-pin {
> +					mux {
> +						groups = "remote_in";
> +						function = "remote_in";
> +						bias-disable;
> +					};
> +				};
>   			};
>   
>   			gpio_intc: interrupt-controller@4080 {
> @@ -133,6 +141,13 @@ reset: reset-controller@2000 {
>   				reg = <0x0 0x2000 0x0 0x98>;
>   				#reset-cells = <1>;
>   			};
> +
> +			ir: ir@84040 {
> +				compatible = "amlogic,meson-s4-ir";
> +				reg = <0x0 0x84040 0x0 0x30>;
> +				interrupts = <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>;
> +				status = "disabled";
> +			};
>   		};
>   	};
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
