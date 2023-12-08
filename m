Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFA2C10DCE
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Dec 2023 12:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mzrSaRD9bgGgW1v7R+DohjQYsUwxS9+ChVw0oLA6AI=; b=awf/O43lYQsWJvWis8P2Cmj0oN
	gdUpT7KTDJ2U6J+jGCtCwyjeRoyMysENgnahfrVgYk8PkT8YBz6VMyOhD77XSr9jAPCuwzDf4diW3
	BSsGh6EX4L7AGoavy0N6f7UY91js8JxLpWICGXxHUir/dR4xllFQxQtQDy4w0ABKKt/22rqv28CF0
	A8T5bHKfkSvWNiE30nK2P+O56NiWIvJXgZUxDZTwzrDrD+XvK80Fkui4q/SB2OuGWPuwdEZX83QJD
	BXML9Y100gbiIC/VvZsGZ1C14LyscDMug9WVFQyP1iagDdSBWW6zJHIkzSy/oM8ZgHGQUFpUujWW/
	qKfPog/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBZl5-00FZrd-2c;
	Fri, 08 Dec 2023 12:15:07 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBZl3-00FZpx-0C
	for linux-amlogic@lists.infradead.org;
	Fri, 08 Dec 2023 12:15:06 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40c19467a63so22728475e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 08 Dec 2023 04:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702037701; x=1702642501; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WcN2/CNkPLaayIVBp54DXaFo5UapmHmmRcKwrvSPI0Q=;
        b=vVlhm/HJz/F8g05jPaYNvQHPEVidBmv2z8beuPl+wv3c18UwuhdebVgqeWhDH6Lwti
         JhF6Do9ePCwBE3Pvi4uiOD+lPX4erTAUJldqy878hbDj3wpvsiVJlg53j4y6xBbVR7T9
         Nz9sIU0VQWNbhUBlilxtXrQPf2UmBK+O3hsiFlE12hQPiP+zcRcoeDzRIlOy3ehOQ8+F
         5BtW58cdmP07O3Gd6JJ9islRPyMc8RJ/9AqxdLOKR15qzE/MxZsJgl6b3zGfgH+qa/NN
         gscapGlJYg5dqiT7gH+XFja276itLd6bmGO1vHpOsA4fogOhhBMv7rw48sKAfoHc2i6/
         2F4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702037701; x=1702642501;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WcN2/CNkPLaayIVBp54DXaFo5UapmHmmRcKwrvSPI0Q=;
        b=cLKMSct3ZJ7XQjqvg1/hPNCDxRa5x2i/6wkd2LDSZJOO6WXyh4c9trUvcr6H7jckxa
         O3VEMC/gs+bM2rT7IxNwzRAQ9w10rHAcjXTItuk+7ELeYPQe2+rqp+T7Ksz01agR5u0j
         en5LPlkhTtNH5FHE9tNRolL0jMm4IMJVAttpp+ah4Gp4p7kNsob1qtvr0PxC5j25J/d0
         RtR14y0j1H/R80ANd67GCzjgseuKr7whBAaSvDKBi1woDYtBv5ogaNSeasMpOAHY1hrV
         DOZixyZxRPwchFukyrRvQQp6rIh/7VV8Vff0Sn6zIszfNZ8o5EYRwsSg8ID68C1M7P6J
         DXxA==
X-Gm-Message-State: AOJu0YzzHgYH2zuUsyaOm+rWJpksWGJSxEOTzVLyRgLOy1WpU5mJVGET
	a7ylU22nlBUyleT0aHCDOhYvSQ==
X-Google-Smtp-Source: AGHT+IEkgLxpeFB8kwBjyxn4vVKWtb5JJQWKeakCth+fbGZOcTVD/w1HksEIOL6TEGyrevflf8A7mA==
X-Received: by 2002:a7b:c856:0:b0:40c:32fe:e123 with SMTP id c22-20020a7bc856000000b0040c32fee123mr505489wml.167.1702037701295;
        Fri, 08 Dec 2023 04:15:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8ada:86ec:5358:ef2a? ([2a01:e0a:982:cbb0:8ada:86ec:5358:ef2a])
        by smtp.gmail.com with ESMTPSA id bd19-20020a05600c1f1300b0040839fcb217sm2754513wmb.8.2023.12.08.04.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 04:15:00 -0800 (PST)
Message-ID: <ee82eefc-d979-4183-b679-cb4f79b559fa@linaro.org>
Date: Fri, 8 Dec 2023 13:14:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: amlogic: enable some nodes for board
 AQ222
Content-Language: en-US, fr
To: xianwei.zhao@amlogic.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231208-s4-dts-v2-0-5a93fa356c5d@amlogic.com>
 <20231208-s4-dts-v2-2-5a93fa356c5d@amlogic.com>
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
In-Reply-To: <20231208-s4-dts-v2-2-5a93fa356c5d@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_041505_102874_648A2BBE 
X-CRM114-Status: GOOD (  13.26  )
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

On 08/12/2023 08:16, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add reserved memory for board AQ222 which is used by ATF.
> Enable NAND, SPICC nodes for board AQ222.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 56 ++++++++++++++++++++++
>   1 file changed, 56 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> index c1f322c73982..18789242f05f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> @@ -23,6 +23,17 @@ memory@0 {
>   		reg = <0x0 0x0 0x0 0x40000000>;
>   	};
>   
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* 52 MiB reserved for ARM Trusted Firmware */
> +		secmon_reserved: secmon@5000000 {
> +			reg = <0x0 0x05000000 0x0 0x3400000>;
> +			no-map;
> +		};
> +	};
>   };
>   
>   &uart_B {
> @@ -34,3 +45,48 @@ &ir {
>   	pinctrl-0 = <&remote_pins>;
>   	pinctrl-names = "default";
>   };
> +
> +&nand {
> +	status = "okay";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	pinctrl-0 = <&nand_pins>;
> +	pinctrl-names = "default";
> +
> +	nand@0 {
> +		reg = <0>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		nand-on-flash-bbt;
> +
> +		partition@0 {
> +			label = "boot";
> +			reg = <0x0 0x00200000>;
> +		};
> +		partition@200000 {
> +			label = "env";
> +			reg = <0x00200000 0x00400000>;
> +		};
> +		partition@600000 {
> +			label = "system";
> +			reg = <0x00600000 0x00a00000>;
> +		};
> +		partition@1000000 {
> +			label = "rootfs";
> +			reg = <0x01000000 0x03000000>;
> +		};
> +		partition@4000000 {
> +			label = "media";
> +			reg = <0x04000000 0x8000000>;
> +		};
> +	};
> +};
> +
> +&spicc0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spicc0_pins_x>;
> +	cs-gpios = <&gpio GPIOX_10 GPIO_ACTIVE_LOW>;
> +};
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
