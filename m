Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B818CCFA03
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Nov 2025 13:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHMjSnuSs6WcJZYwMANTTdMtlWFgiNrcvT7G+En0vh0=; b=IFDs0OoormdR/LazGRgYKr7wyN
	iA61OhHLHk3i05aPvOIfzAv7GpkWRJ32M6AQM/s0+KkCk24uafAPkXA6G6QcyqGpdVcFKbAoz59NQ
	diAPXtVyONGF0y5CvQFIqjLnl3wSVkBshrqPQCQry4usXlIM92UCpAz/NvHgGyIygUc5UQrkwIxtj
	5L43OOdzU8j3ZySuhpilIIKkQRriT4qWgqCRCMOzzBgHXWK8p5jkzdQd/WLDFzoGjgcqcnCHi+JnQ
	usyGE1MuemgFA/S+tA0vDQenc42FK0Ehaz7kE2Z2PQeu84FDKp6i/dwccNcKxnUuyu5hMbKJW4pwb
	lf7Lb9Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzj7-0000000FXfL-0XXt;
	Thu, 06 Nov 2025 13:08:33 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzj0-0000000FXbH-2Ape
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Nov 2025 13:08:31 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-421851bcb25so508227f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Nov 2025 05:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762434504; x=1763039304; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQZIJ2xmoJurErGMsCLrLKrgFZo/Q7nS6WUoDhpVWxM=;
        b=OzSwMAxxroubVQJGOvUko07qoFvOPXgUR8RaAy+xAu8v41imQ0CpPX8aQ0w7QC9C39
         ikvSkW3IXVXrTHxYCucGEyu35IYR7dHLw8a6TWzzTBpyVTcYtsZY1Qp/Yc2VY3zJUa2Y
         EvEYBpkBERFAEqSjZY0CwhuqGMaBo5JZRRXcq0SHmQD1j7fk/M97MaHNFKrHInL3X+U6
         0YMzK4qxV6ZLkxKfManr37NtPmVfBYgT5pAFNALwq1TNdFmjBzYmqxc59X2Xfkuq5Exb
         Kca365VZNflCHvYEDsUTTod8Ax5WMrXwje9Y0INl/N0T7s/+LYbfWZ18B2o4vYv0iKOa
         hn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762434504; x=1763039304;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VQZIJ2xmoJurErGMsCLrLKrgFZo/Q7nS6WUoDhpVWxM=;
        b=Os385fIw5VcdntD1z+S4EFv2/CzkucQBtXSizNSfgQnx3Zi0bEnJ/xFfGHmBbVzrES
         zfxefKZcLzVdsPd/0OCZDkCHfa8278ppt5hlzWdPqNV57oUF6+SM158m/ngZWv8qhutk
         5btrSQZV2WUGDZuso6KEVuoozHgLA/gAop1Y6MIWrw9RDekEXbcc25U1pFQRWwk1Bb+D
         3e8YnxV+ZBNwOIaYvwvNky/xEzvMy+sr0do9u6a6Oz7zoGMdDFOZcgiDnp+6n89VVPED
         lWxDQ7rAlRVsD8NlkIPZnhz2GdBLQknHjn/vQMTzcQHaRFSvKf5REeWFF4aqVntAQeXd
         IWTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4193NRmRFPKLIlvRH7GBzh91SQQsFrJoNBxT2eFegXmle6p39JE5Gon1UcAe2S7TCLXl9agZzfxJY0lS3@lists.infradead.org
X-Gm-Message-State: AOJu0YyFzVRCU0kkBhhUqedmk8VSPvsZli3dzL1jguqHgp0j6NDcpQ51
	SrLOQzPpZuLVwD/RBfEP24fNoyfT3CXadRbYAROcSapl00WQgD1brXC+U8AjIg5drIw=
X-Gm-Gg: ASbGncu9pF3njHuKUZEz3yE4J5pl7diiVEVYpVcQ79D0gTRNrWXczHItByqtv4DCO9g
	sNQqNo5DobxZACkrq9+P2sbWBDA3S4v2m0wY0+y+9AdgItWKWn3Ah2ySDtLB/0zY/W7oNvgBjz4
	/1CUvvB4mOYDNdloPSfGxjb7TNfifsR+QWU2b3Ov5RKhlKX0j8Kz6wvxjhPZ//Jfft8UCaw1TtX
	dGlbIjeE8Mofg2eO0HGGYjTjNQK84j6S4GUTe0gE32HcvLGv8RMD3A0+0/7hcVM3fKFQ3k+9fwf
	TE+0uo2R0N8nk3WJBpmoeI6fg5eYvmkU4Zyf5RXVUf18w7cK2BtJWBe/lIQGQFEkyofhEH8Z35Z
	UxDJzN00nWNiJMB0nfG6AYu/yEUreVsDQGFiD/iUa53yyblZLdH9zNkbOp8+mn4nHa2TLh34RPU
	dFozxpVpmdJDBiNejD5UJFZkV0L4H7hhNvSg==
X-Google-Smtp-Source: AGHT+IF6rma8OU9HRh/m1faNu+JTKdeQ+7jkSzOE0//gI7xuL2wV4a8q3sJmgGwU6sR3gY3jWLa43A==
X-Received: by 2002:a05:6000:40c9:b0:429:dc9a:ed34 with SMTP id ffacd0b85a97d-429e32f482cmr6817722f8f.27.1762434504030;
        Thu, 06 Nov 2025 05:08:24 -0800 (PST)
Received: from [192.168.27.65] (home.rastines.starnux.net. [82.64.67.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb4771e6sm4956316f8f.28.2025.11.06.05.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 05:08:23 -0800 (PST)
Message-ID: <b40e91e1-589f-4c6f-ae22-feca5f292c75@linaro.org>
Date: Thu, 6 Nov 2025 14:08:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/5] arm64: dts: Add gpio_intc node for Amlogic S7D SoCs
To: xianwei.zhao@amlogic.com, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
 <20251105-irqchip-gpio-s6-s7-s7d-v1-5-b4d1fe4781c1@amlogic.com>
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
In-Reply-To: <20251105-irqchip-gpio-s6-s7-s7d-v1-5-b4d1fe4781c1@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_050828_709526_1267161A 
X-CRM114-Status: GOOD (  11.76  )
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
>   arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
> index f1c2e91ec6c5..74f98fae7dac 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
> @@ -194,6 +194,16 @@ gpiocc: gpio@300 {
>   					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
>   				};
>   			};
> +
> +			gpio_intc: interrupt-controller@4080 {
> +				compatible = "amlogic,s7d-gpio-intc",
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
