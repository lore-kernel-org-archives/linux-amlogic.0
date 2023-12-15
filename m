Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6F3C46CA2
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Dec 2023 14:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SEueQnsfOuAyvK+cBBg/K55tMJ/fq+aq2TuDtsMVMP0=; b=wwnsk/SOlN46GWR828OQce74t0
	vdunx5JC5ewKnAbFSBF8fqMlSbtgOIiemIcawGVZrhBxPZNdyI2ExnoV7nhLf9iaQx9M2g0G50c5j
	/urx998Dq1hNci+QlNLIxvxVhFmJ7E/v1bCBYZEH0ljAksnVYQjiVjKxq/zcCmyqhFu9jPdwktW49
	DST3q4UJ7MF4Ch36cMQPSBSmt+8Al/FxISvde8N0+/z7TAYmgIW7at37UN1PmZYPr9wBln+jBsP26
	UyiSdGjcMasHd69Z1WcNzJY1exePedxC7yTPRwex3CUxkwWJU/WMXS6iepx+tmW0onDvIk18dVBMO
	crvyslug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE976-003YA1-00;
	Fri, 15 Dec 2023 14:24:28 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE972-003Y8u-39
	for linux-amlogic@lists.infradead.org;
	Fri, 15 Dec 2023 14:24:26 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-336447f240cso460275f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 15 Dec 2023 06:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702650262; x=1703255062; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXEH9VTtT2t/zpTq7X/06JkbyvhU4uSrSHDYcxjTAbc=;
        b=OulB2YQH3IxL8iAF3rk8kQPd0ZwM3Wj75szOQmR8t9uKt0+NhoK45D8+/6iKqnXS/L
         WYAgXAy+gOSrAWCLaJIpEGWjmlyUMD7OmyQz49mu3w+x/lLAYWiAmYgq93hFuFpgWJ+b
         yIH8OQaImqbEKydHoMXnINyYFC1qyTvhtGol2V0oHLBaw5oc9p7JaMoNN2XoFAb6765K
         ZChsx8VTscKUrphZ/V+l3PwOkTsN1ivBFeAOzg49mGbb5PL4o9DPVBL/lsdKjhaoFNvl
         NG9qt51+frqxfmJs8rMm50Y6Zag1wT6JRyPPUarUD20vkf9ZUSMj4zy7tpt/TmXKV6kh
         Kc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702650262; x=1703255062;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FXEH9VTtT2t/zpTq7X/06JkbyvhU4uSrSHDYcxjTAbc=;
        b=MP4lvCznkFlKkMuQDih9dvCus2fzAldubmHcUgsOlfKGcc4yZkGFFvy+Ob9a8TwI7O
         ncLupr0sDsKMD+PyOqUoM/4XGf/OTbRa4P3QvbMscICV30swLATTViZPEzJIGkssCq1b
         in18xzFuqdJ/jXC35X/Ka9RMwLHRc0cyncWQirIQ8nhI2yKL2YNoItnhQzodaRUYKY1/
         XxXv5aT3dnqsG3fRyKbenMea5L48lPdXl8wG+I4ywO4vqaOoOYbrVimNrGib7NHkc5tO
         BoVuiylDk8Zz8kWB5HgCdJ0lFht+k1lBbLrbnTjpWIxMSoNaFtfsJCAa9gZJk6BffYKN
         SfHQ==
X-Gm-Message-State: AOJu0YxkKIX5YfF+ZNiaWnKQsWde4Y24MaRMMBlg2MEf1FcyUtw05WId
	a9W26baOlnXUcEHLDol7yvqF7Q==
X-Google-Smtp-Source: AGHT+IFIN7VWRruPXhKsc7yOugsDaVphWkRdcxKGcCssDSvtvEqV5NLmjGOoy/L7qIs1Ijo3rSEoAQ==
X-Received: by 2002:a5d:484f:0:b0:336:4a0f:8b26 with SMTP id n15-20020a5d484f000000b003364a0f8b26mr1446394wrs.41.1702650262205;
        Fri, 15 Dec 2023 06:24:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bfe9:1376:5584:1682? ([2a01:e0a:982:cbb0:bfe9:1376:5584:1682])
        by smtp.gmail.com with ESMTPSA id h11-20020adffd4b000000b003333298eb4bsm19124207wrs.61.2023.12.15.06.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 06:24:21 -0800 (PST)
Message-ID: <a2c851fe-2c94-4121-87f2-a9b6480c4a6e@linaro.org>
Date: Fri, 15 Dec 2023 15:24:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: fix format for s4 uart node
Content-Language: en-US, fr
To: xianwei.zhao@amlogic.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231215-s4-dts-v1-1-7831ab6972be@amlogic.com>
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
In-Reply-To: <20231215-s4-dts-v1-1-7831ab6972be@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_062425_063100_21A3D3FE 
X-CRM114-Status: GOOD (  12.40  )
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

On 15/12/2023 09:28, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Aliases use lowercase letters and place status in end.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts | 4 ++--
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi             | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> index 18789242f05f..983caddc409c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> @@ -15,7 +15,7 @@ / {
>   	#size-cells = <2>;
>   
>   	aliases {
> -		serial0 = &uart_B;
> +		serial0 = &uart_b;
>   	};
>   
>   	memory@0 {
> @@ -36,7 +36,7 @@ secmon_reserved: secmon@5000000 {
>   	};
>   };
>   
> -&uart_B {
> +&uart_b {
>   	status = "okay";
>   };
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index c6b524e1a1ee..ce90b35686a2 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -455,14 +455,14 @@ nand: nand-controller@8c800 {
>   				status = "disabled";
>   			};
>   
> -			uart_B: serial@7a000 {
> +			uart_b: serial@7a000 {
>   				compatible = "amlogic,meson-s4-uart",
>   					     "amlogic,meson-ao-uart";
>   				reg = <0x0 0x7a000 0x0 0x18>;
>   				interrupts = <GIC_SPI 169 IRQ_TYPE_EDGE_RISING>;
> -				status = "disabled";
>   				clocks = <&xtal>, <&clkc_periphs CLKID_UART_B>, <&xtal>;
>   				clock-names = "xtal", "pclk", "baud";
> +				status = "disabled";
>   			};
>   
>   			reset: reset-controller@2000 {
> 
> ---
> base-commit: 078c5db2a961f674cc27c10f15d15949eece6a49
> change-id: 20231211-s4-dts-4a1805bd56f0
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
