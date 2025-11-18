Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790E8CEBF97
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Nov 2025 07:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIkuTzSYCEIQeeCPxQxarihbJyHX1th8fCXP0HaSPck=; b=DCoGCJFHmp6m3zLIcHFv31McUa
	7jACCEz8oH3aJObFayykHZR2RzAKXMShJtgz+nvToW1Ifvxo3KUjqd/13TWTSEI/GZIrqALhEyFA3
	enJaaTonW/gzkYCu6Ob6Zf0m8jLOOZ/PtONVHAUEoVfvmZZZ/KGhG79F/ar2mz8/CcT1hoIiSNkK5
	A6mXOhYhWTv1iEKOk4rY2yr/QGS8B9yWVA1szHmMLbptXOr3JYQGqM6ecsUBax19Ap7qjYIuH8BXu
	235FF5mmV1K07qXvCpMPpJobk6QHtnWfliuF55dLs69MNOZQLyQsYs0LndB3Kc7ZcPJtGxgcwDBH5
	A1CesUUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGbv-000000000lH-2KkJ;
	Tue, 18 Nov 2025 07:58:47 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGbr-000000000iB-41eW
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Nov 2025 07:58:45 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso16812315e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Nov 2025 23:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763452722; x=1764057522; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+I4/4+TloAXBh6SukgFWKCWV0M4BbdYTXgavls713hw=;
        b=xQ6sJfchuwf98EO4z/hZgTSOvora6r0XKEA5tXsIInj5vtYOeCdQNh6LgGp/IATFuv
         L687DEa1gOrmTFi/5BzVRS8WrnctTcO6pTOjV1wqxg1siPspp5o106v1DS5i2mSb0D5f
         BdZqmi2Cmy1pN2Rz6WLVvKtNi95+vOAutwcjf7/r+PJ3X/KhnTbBNX1RV9sE20UcJm7B
         drONpCo3Ozo0oWeNjpb04UWE9+QAQuPKQ1uQAJ3p7+t8pv0kyyBGbq6qdwb2Mv+QkGUb
         h9gi5dXQO4KztnJwuHLajo6UNjJhc7MJc+BjwVnEhfBmQms3/7OmQHklxj+Y1EeJrzZn
         jatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763452722; x=1764057522;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+I4/4+TloAXBh6SukgFWKCWV0M4BbdYTXgavls713hw=;
        b=n0cLUJ0RGSStPcQ9bKIppjk/D3O3fq+xdAZ39Rr1hAf1t/hCoXCZ0tFaQUkL0s8sbM
         dcawNKq0METE9B3dWvoPo70xAMkkyGV6XNFJ/POzRZUrEw5Pj36TkJrDJ6u1PWxumh1G
         T+GGwo6pXDnsrYf0OFA/YzEqohBkOBeGwHNrmBBhuMZepnaIjk9oxwBk27GQiVezWOJp
         uG++YoGIQmocWo6mKq4ypcqX7yIyHuBmEKgosnL0LZkTrJbWjRHx/ve3T1jpW4LSo8fx
         L206nwIFs29ThHdytFhmqYHepdcM7UnGWgFyzc8uIUtL7Hr1wxHPTy0n4GLEBM8DgsT/
         qWwg==
X-Forwarded-Encrypted: i=1; AJvYcCUOloAxS3v+C9KUFDQp896ayISvb1PIYT7Lh/KzpcII0JsfRJfyjD92C3UsAJ/9Ayj0lV+PTH+SMch5TypM@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwv7CtBJRH3tS+urbQkm4gL2q1qB628wl9tKGZUukkWRHdBalI
	8VlnhGMW/Z/FIA/KKNwUO9Opxhe6eDCKAw7zh4KtV8Y7ERyPQh4QZEhLXNxh10cknun1M8V2hcE
	xtJXR
X-Gm-Gg: ASbGnctwp6StKa4jfcll3TdbFK8aK7hhNFpsXmFjF9WoUSW/f7aaBTms7aXtAw8gOkD
	t4ddqTo2MnaTLpUDhWnNA9FPISngJfYpLGdPPxhg7QQpCiHgPBipGcPvAqKXSvZ/NQ/UQ4O+F10
	ME0IO15zFgd9nC5Nc2d9NUqUDsH5MVjfVXyTrGcAfA6H5AFtanzpMKa7f/GUelWiB3M4czjkOBj
	3nvfVHuZo5NoIMfOrJsFy9vNceDAqaX2WGxWymB0h+UWBiJoMY7xSvwuBA0gx0AfRZkvMz9sVyC
	EbbAaLTkdStKCZ76Hmy4Tp4bX3/BfHNGrik0ayfI5mewVBlnKd6dLTZk0i1lS7S33X398EqDJ9s
	R8xBnSupZTNFU1rpSFVaI4iiQFj4NoRe/TxduKNtsiahNjcRnv0FhAvF8PQwOnFWck5bw+YkAqG
	mxTrV7m9wuskalKWJ+h3zYLL9tPOFf+lLmy6UJIewZq7QdlSeaolXCaQtQBUSo+46Y0nHBdB4MM
	g==
X-Google-Smtp-Source: AGHT+IEho2aZMvWABNUWllGMghjBwr4zPQeV8ovJTRmRn0fea2EtKq3PlexeEPnAvGJvcAH1r36AHg==
X-Received: by 2002:a05:600c:45c4:b0:477:df3:1453 with SMTP id 5b1f17b1804b1-4778fea7493mr130718505e9.28.1763452722114;
        Mon, 17 Nov 2025 23:58:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:366e:5264:fffe:1c49? ([2a01:e0a:3d9:2080:366e:5264:fffe:1c49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787daab3fsm377307365e9.0.2025.11.17.23.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 23:58:41 -0800 (PST)
Message-ID: <d6db1166-ea2c-46aa-beeb-218a54e65eb7@linaro.org>
Date: Tue, 18 Nov 2025 08:58:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/5] arm64: dts: amlogic: s7: add ao secure node
To: xianwei.zhao@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251118-soc-info-s6-s7-s7d-v2-0-38e2b31a88d1@amlogic.com>
 <20251118-soc-info-s6-s7-s7d-v2-4-38e2b31a88d1@amlogic.com>
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
In-Reply-To: <20251118-soc-info-s6-s7-s7d-v2-4-38e2b31a88d1@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_235844_049675_8EB73AD7 
X-CRM114-Status: GOOD (  12.26  )
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

On 11/18/25 06:59, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add node for board info registers, which allows getting SoC family and
> board revision.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
> index d0b63d3fc953..dd7e3de2a53d 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
> @@ -221,6 +221,14 @@ gpiocc: gpio@300 {
>   					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
>   				};
>   			};
> +
> +			ao-secure@10220 {
> +				compatible = "amlogic,s7-ao-secure",
> +					     "amlogic,meson-gx-ao-secure",
> +					     "syscon";
> +				reg = <0x0 0x10220 0x0 0x140>;
> +				amlogic,has-chip-id;
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
