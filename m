Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000ADCCFA05
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Nov 2025 13:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hFXk49FkBILFV9Syw4uZ73DjdI3XBUWc53iy372l08=; b=W8RdQ4jfzWU9vi+HZSkrCUmohJ
	DTy+Zq45tyyelK8ZcC0D6PZ6meE+mmDk5ItzsyBu5Uwq086ToEiiCYvzmvHSR3W3da/oxmPuREWG8
	YA9h2iyQ8ncQXVS3z/m1uEbj9alTru/lxTC39/12UvpJbb9/CFpe/UJGtADwE3qnL0PLRPXEgTBIJ
	drIf5A/TzSMk8yZ5C5oB5WHpNMIqhmEGyTC+XzSaMbi3LRxmFUj+cJzUwmbFpiTIuFl2+fZpSlOai
	eUgO62w7pRJkaW/ZZPIruuW86oawv8WA6FzWWCTOkK0vQNCZyEB2NAr0JMMkP0mLcAJo/3M6reohI
	qvITChOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzic-0000000FXPU-1V8Y;
	Thu, 06 Nov 2025 13:08:02 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGziY-0000000FXNL-290L
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Nov 2025 13:08:01 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47118259fd8so7139565e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Nov 2025 05:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762434476; x=1763039276; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5QvPSUGb//zRFPRLtsCtC5iw3J3piVlBv6zJlWuYiB0=;
        b=OB9kwMFH58C3hCcHjqBtuBLhEKvZVpJVncOQo8ldvhqtFRp62jZcfymPd4j9xTiX0r
         famfzRdS2njK+e3uemxxm6Fqj1HyTeqlDPUMnkZq04NjvlkvnK5qNP3qihKo9RDjB3KG
         qi0WIbZTh8jXdvoD7VpmyIReoX3tF1SHRH1mDRuEV8xpAi0aqa0hKO4dIQddjVuUfvwN
         s/YIbDPiEBbThaKdz6QQ3Xpuu8Nyju4eHXM4sa9EwiM2RORAkExJK4Y/NAveNZcqjxt/
         Gdb3ZxPNsLxxmx+3wagq3Dxg3kdYcTdh7gozrl2qu8Cs2Z7vsW71e9oAV6wCwEaAvFjL
         ouTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762434476; x=1763039276;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5QvPSUGb//zRFPRLtsCtC5iw3J3piVlBv6zJlWuYiB0=;
        b=GlReL5us9ognb3CTmT+A/4WQL3T2Ip6KTaxC8X4TstoLkeq6cwkAwWBnnOusV2/cVG
         81ec0vCH8KY7/X2BkWwxot5TXsVS/KJuPiMGtD9LYhXB8h/32MNgiXyQlXeGy9lJPZDs
         OLXCLWp8lEklc1+w8+oBO+90O8HhqGMDVv9uPfmYFmvjWk0Ukq9MSt6gyOPoTkd4fUFj
         ob2e2sQ8+LCi792qb6dMZmhwNF70HOeP2eybvi50m/CsJO7GWVLC9qFiSV1MoY9XXQvI
         92mRC4eLShcLlFbczhZNW55wQ3J24giFog7zYzbVCOXN7zEKGdy2X70UC4JIHCFNmdpD
         p9dg==
X-Forwarded-Encrypted: i=1; AJvYcCWd8ni+bQw4dSK9/LIGmS4bQh/XinySPd5d4YP3uoZhOroYmJok938oJFylRGhT3VhonfU7qPc6rqCxwvPh@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7omOX9Atq70DYiNZLNRXuzEAkBQ1TLChjKVQWypK6Tjl6YadW
	NUpD39aQIIrM0AmFatj+EtG93Fn/aNERwkjaWw2g5jj0JwDYL60PpIxF3h7a10LIlxo=
X-Gm-Gg: ASbGncvz/8/13VnIO02yaAG27kVLSFTFbnCqphuYWLcIypGRd0BMoNxMsQIX6mr0yBl
	6KFdgkhPa2P5MjstMB23Mq5xjz/28k5Nq+Hs/gzJ2rLtkTj2aK1aQwbyrUzJm5XofY1nLQTKpiI
	XD18vpbE60yU2iSXnfqINNX8FzAAuqvAFDV76h8WMaJK5Y0LTtiQVYvo8FVGUjIyAklROkOnmh4
	Uo69moMCUu5C84w7DEap0KqaXoeD5muSvx5OU+wFw88ejcU8YeauzbGCDEBaJmO1qmFXRk7Plev
	SdRHKD4qRznfObrIP2BHXRLGVeUCut6pofAchRdyw/tB19kRY3TfkUJc73jXGCe/oEPj6aNq8LL
	WbllPXW1/2FsNa9AXI2/r50TkdePA0hpThHlsQXoAAj/wDwHclGFyzl4Io+wBQ0pVK01vVEqMBB
	kibd11GAc/G7ccCgnEzV1LUIF35QxjO+HoCQ==
X-Google-Smtp-Source: AGHT+IEcA0Q2m/qVvATLPTcfnYahR6FSKXQ5pQBy1S1Zf1wyKWuv6GZxoL1JXLz9q2/EUWawAmfXkQ==
X-Received: by 2002:a05:600c:190a:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-47769d50827mr12690725e9.21.1762434472702;
        Thu, 06 Nov 2025 05:07:52 -0800 (PST)
Received: from [192.168.27.65] (home.rastines.starnux.net. [82.64.67.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47767749916sm25485755e9.4.2025.11.06.05.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 05:07:52 -0800 (PST)
Message-ID: <73e4c1d0-f6a5-4989-a918-ba0d5cc69878@linaro.org>
Date: Thu, 6 Nov 2025 14:07:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/5] arm64: dts: Add gpio_intc node for Amlogic S6 SoCs
To: xianwei.zhao@amlogic.com, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
 <20251105-irqchip-gpio-s6-s7-s7d-v1-3-b4d1fe4781c1@amlogic.com>
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
In-Reply-To: <20251105-irqchip-gpio-s6-s7-s7d-v1-3-b4d1fe4781c1@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_050758_571130_B9C39F14 
X-CRM114-Status: GOOD (  11.96  )
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
>   arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
> index 0dca64a2ef9e..3ee1b563a34a 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
> @@ -199,6 +199,16 @@ gpiocc: gpio@300 {
>   					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
>   				};
>   			};
> +
> +			gpio_intc: interrupt-controller@4080 {
> +				compatible = "amlogic,s6-gpio-intc",
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
