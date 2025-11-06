Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182DACCFA05
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Nov 2025 13:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XxRg3rmukdI9tDw3bN/oTqWYmMNxqSKijoDVUvx+/ew=; b=fu9E3Vrrn4QHhdzxOp5sgMnE2P
	e0e4aIURinn4Wy/KeQMsbmtrgUYqIxPKjOy7bES4RuAf4+E2y7bHnbtkLdLtpZ2yz1NuqFK8c+gSR
	jC7QicyjXRxpOmEtHcuZWh39EZ/oR/WDOhrjnyfYvLaEoHecysnyJ7u+R9TvK6eFvMTi9XEOh3M4V
	SKzoTXTM3kmqMgyF4I1udfpMG/P07cGnrmsAd1/7LpOIH8n8cBvQQKCeEJdlZYlOoozyhzu34yPsQ
	j12SAB8Mkxwvmupzr2dnKQ8TNaR1IS69lG7US79BPJeGsXbO9lFlQBT5Q+c4qnPifqSKN2xzhF4fQ
	C9TOGL+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzio-0000000FXVL-2iN4;
	Thu, 06 Nov 2025 13:08:14 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzim-0000000FXTg-1L1K
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Nov 2025 13:08:13 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-429c8632fcbso736254f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Nov 2025 05:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762434490; x=1763039290; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xM6GMXLJyNdCfp1spw3gFkLCPiBNpoRjwTrxljsiMiY=;
        b=e3WkBUd7JMs3Xt63AepJeKzC7kDbLMioSyA49pydBTax0/doOFxAeHkp4WFJHy5g6g
         y28E7RGQkR2DkymlDi7b6v3iiX6DtaVRqkXD0MHuR9R/qWwTqA7w7vbUleZjtjJkE4ev
         6A6QRV1v7oBgPZ7vv6i5bttgjm822T5qFXRKgUcFvZERSivXttYnSgqavdCZ27DxkQIt
         qiJN+RmveOluTW0ixYOgtuL1dek3rAYtOGy0L+hu3sJpRuFtFjmSEy1tN1y2q2dsgxnV
         nXRsTIYJmdiFAEyM3L8DQlNcz4Q2NHNsNGbGFq7xoEU4xCk8bdy1f4i/ewFtoBwtApVx
         WoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762434490; x=1763039290;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xM6GMXLJyNdCfp1spw3gFkLCPiBNpoRjwTrxljsiMiY=;
        b=Xh4HaHX/S/rllXUNKYGVvx61WrIwvu7ZKpngnoSbmJXbFt5wZxd8VV94Nzc55rs8Qd
         nFk9iUIK1OADzVpPmNWzUlW/sP3rzZRhlRqYtmTv0Kh90KG9oOBs1NZ53wCv/5AFkUbj
         eK3baC00oJ4xMXLcE79Xy5Jz7a0qwyYrAqax0OnoaoUQdOOp5ohrAOMawpjKsISKVcMF
         LSPY5o1JzJJkM2wd9hC257gagj4lsLy1YiU6AT9e5kgWj4QTCa3JGp93gcY2Z9F8vE/H
         E9KrRMshEUiHiySBiPHjd3mVkeE00FvNeY6AvxNEZCCq6oQeNY3xjwtQLNAMbSm0Eh3S
         Fyng==
X-Forwarded-Encrypted: i=1; AJvYcCUjKd65KRLofsurxS0gjME1La7OR7HyvmxQ7KrSY/uU+TqQLYqeUw5FamfVKIQI0xrEBefayNX1jdrl6cNe@lists.infradead.org
X-Gm-Message-State: AOJu0YwhbyAu7zhaixUQs3t1FQOQkOPfrwe8bzW+T8MwciCootDBlOEr
	DwIWYl28ynKnmJITgVUp4Sgk23Ri/doWuDYSwTwV8SqjTU8HXuvnXHIkdrIs7yTHcrk=
X-Gm-Gg: ASbGncvdeIsYtiSjFbmTDddFSWPpib7W2rjOMsT6s0wh8ucyhqTzq5taxCThp11rPJn
	TgOCuRpG3mksrH3nQ8r1tc+QESe8Fnm9A/iQ3AfKoboOiAg8WHDtN/eUBfFLbeQecoPrhUYcgYr
	hjtZGJet8U1LVIcjhDJRKkexvRqG6/TJ3UPZ0UPT2asHNW1slPTozjzAqFItES9qGh942On4fcJ
	Mc9hqljedEZuRk1QF7/s+h0bsNmUgNWDCIdDamEaXHnhaAQkmdg5IyZ4XBNMFowoo4EYmsUGc1A
	JuT2yvRIYd9qWXQ7YqCaxnhlfwGljb+HIwkyvPM3W+AeakaGfJKIbQJUNl/81uLuRRAmnW07IKt
	iaewh431Lk/jaS+YwXo38JvHJi6iZKzaIoE3iRH5UB2L9YGkVlDxisK12SgpatKymQYOv9vFn01
	ypFO+m2fYA
X-Google-Smtp-Source: AGHT+IEy7P24juH5NWkGNhcb6f0zLE3X5b1IWrue/unb+8l1A51kZb+NzLO5Aj+QJDEaQfeiJrvygw==
X-Received: by 2002:a05:6000:657:b0:427:a05:2ff with SMTP id ffacd0b85a97d-429e330788amr5626816f8f.33.1762434489827;
        Thu, 06 Nov 2025 05:08:09 -0800 (PST)
Received: from [192.168.27.65] ([82.64.67.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb3951c6sm5150893f8f.0.2025.11.06.05.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 05:08:09 -0800 (PST)
Message-ID: <efdfbca7-d1b5-4b7f-a657-af4386cf0037@linaro.org>
Date: Thu, 6 Nov 2025 14:08:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/5] arm64: dts: Add gpio_intc node for Amlogic S7 SoCs
To: xianwei.zhao@amlogic.com, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
 <20251105-irqchip-gpio-s6-s7-s7d-v1-4-b4d1fe4781c1@amlogic.com>
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
In-Reply-To: <20251105-irqchip-gpio-s6-s7-s7d-v1-4-b4d1fe4781c1@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_050812_495919_FB739F3C 
X-CRM114-Status: GOOD (  11.80  )
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

On 11/5/25 10:45, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add GPIO interrupt controller device.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
> index d0b63d3fc953..aef7aad95667 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
> @@ -221,6 +221,16 @@ gpiocc: gpio@300 {
>   					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
>   				};
>   			};
> +
> +			gpio_intc: interrupt-controller@4080 {
> +				compatible = "amlogic,s7-gpio-intc",
> +					     "amlogic,meson-gpio-intc";
> +				reg = <0x0 0x4080 0x0 0x20>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				amlogic,channel-interrupts =
> +					<10 11 12 13 14 15 16 17 18 19 20 21>;
> +			};
>   		};
>   	};
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
