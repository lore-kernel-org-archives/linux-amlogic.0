Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9ED10F2840
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Mar 2026 15:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1FEQNkCgaH0vX95SnNKE67mgXq513bQt5xrK3yX9P3Q=; b=hxXZFc0yCmP0P7/mhC1D8YRR08
	XCCXJ3vNd6aJDFWMRxExOZEAOJFppjnez3pMnwMu0tUlbBN0w+BgPs2W1/rQxRrr3eihNxkdDYxGP
	AcGgRs0h7r6Y8oEBsGJNso2zEVraZfAHiGOaPiGRYs9sWjeSkH0i3sU+wksPvY5MXhkS8Z7AVxM+N
	bqh3OCFW1/lHJESL8is9akYCKeWje2zjrhjKRNqiFM7VBXk1jkho98IVGWmKtgacf5Xulnvx6M+Rf
	EMvmFbV4H5MZsbaHoZSpA4Qa5dG8NLeav4DqOw4ee8mK9j6kGPdcG9bGp6F7InFAI8CxET5PbzW3F
	5Ck9J3pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69Cl-00000007hIp-3RfO;
	Fri, 27 Mar 2026 15:34:35 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69Cj-00000007hHp-40TU
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Mar 2026 15:34:35 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-486b96760easo25447865e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Mar 2026 08:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774625672; x=1775230472; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BtdFcTynAN33HZsmTUqdTq2Imp2W6r28pnCsYrsANI=;
        b=ElbC+ORF4k5ltzV8ht5dZlLpFshhY7is+qMy/7U0R4tW27IEIPOSWCugnfEJ8p1Ype
         PPz2BvHmB9rwGgJp4eppDAfumTsptkH3EYyMKL27c23S8N4Ugx5rlkebXkHXXt8FG3Xn
         fVuLfNCVBvSrhCXrGxzfqCaVHkemqp63OZb26vnxw9/pKM8menxkQRMi1cgiRsZByEF0
         cO8zl3IQIxFvk9tK0B3fPfATUIdDyr6XmwRcil6VkINAJ3EsZ4vytYZFl9BdB0xToPzj
         KKg7gzs7ZTU1tNPzI6YNueMtyOmKe1/orKM8/axPp+sJarPV+UkSxjMEZUAiqLJ0vqMr
         uIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774625672; x=1775230472;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BtdFcTynAN33HZsmTUqdTq2Imp2W6r28pnCsYrsANI=;
        b=gertMhLAHB704aG40r/xaiAXSqBkoxN7dAUeXI/vC275OVeJk63oHxCR2cRhhLyBjy
         T6i4X7i2PkhNsvtmxm03bl+1gBE9s6UQXUVX5jG2GjxKITAunSKsbfF731+t0+k5gjks
         z2GJacUp+EBsMPenherL1S4IvQwUa2vitLiPF4HA9m0MmqqKCYcbP8TPsy069Txj0eKs
         8yTGKy8w2DGAQxgOsdWBlY903Fd12jd+DQl0Sf9hMWdrhYGOKbLiKsG93cg0y9PizdnL
         gfc3huntUHVyz8aBocj+xkgmyMN/hxVkVTmsBka+9zQK+jFIDM5mi1VwGT9cTprHx/Br
         rWHA==
X-Forwarded-Encrypted: i=1; AJvYcCVYW4xUyLz0SVWe2yjg3S5YxR64Y2mugGJt9DqHAUyTg4C41+MdZBeM/l7nwBXYZc85QLEGVT8fwbS7Rbq4@lists.infradead.org
X-Gm-Message-State: AOJu0YxDQxOinCph9lV6jOs760w8G4d4Jv49do47nQZEmyfnjVtzV2ir
	5IUzF1E4ktMQrn4xEGNa0hcx1y9ctnCDO/wtC6jayAUFnVIcJjVme2oW5qTdt1W+qNs=
X-Gm-Gg: ATEYQzyAkon3a9Ml6rBrnYr8eY/d5iKqNBwh2q+xTg79H9isI96ZZNa/7sUBXipSQDL
	XVbc5zv6hMx2RI3/1nBLerLyTehRkf6Nu6F/RMYJHdhLvlMaBKsMaWMXwdkYpV09Au8eNMOiSVx
	NOoV+1wtFzQQEX52aD4lhzMBV37qIa6FnX9aNy/lszHGzIIeR2gkS1BMxcptxALqkjhXoGaLuS6
	b7nUCUY1uJogF7Tsg//SF/0WYILZRCRfCt66CnJtco03ydRy5XagNxvztwTi71aZU76UQaAvwnh
	1WBi9hGuRkPtlwNdy27Myc28dPCYyh03bBpGVL+kwbmRie1/1Ig4DS8isdIr0RY3hYKjR0OZpGd
	jFzHtacmrJA3MHxviPWFVcqjukXf09pFtyDtIayMmUSdyrGthy/Z/clcgm80DwBNed6EZcOI2sh
	8i+TtwNbwiMBk9xt0NB06tnWp9dufy/bMDYMMPXIyTnZArNG92tyES2r8xtAzfNLRwOGdNFDhfh
	z4YsKk=
X-Received: by 2002:a05:600c:c109:b0:486:f9d0:aac8 with SMTP id 5b1f17b1804b1-48727ec776bmr37759315e9.18.1774625671956;
        Fri, 27 Mar 2026 08:34:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:39df:9101:d239:f5dc? ([2a01:e0a:106d:1080:39df:9101:d239:f5dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712acb7sm17860855e9.18.2026.03.27.08.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 08:34:31 -0700 (PDT)
Message-ID: <9d56c5e0-7434-4a5d-8429-f19cc5faf00d@linaro.org>
Date: Fri, 27 Mar 2026 16:34:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 2/3] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 enable HYM8563 RTC
To: Nick Xie <nick@khadas.com>, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, jbrunet@baylibre.com
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260327093016.722095-1-nick@khadas.com>
 <20260327093016.722095-3-nick@khadas.com>
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
In-Reply-To: <20260327093016.722095-3-nick@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_083434_018161_683DA4C5 
X-CRM114-Status: GOOD (  12.25  )
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

On 3/27/26 10:30, Nick Xie wrote:
> The Khadas VIM1S board has an on-board Haoyu Micro HYM8563 Real Time
> Clock (RTC) connected to the I2C1 bus.
> 
> Enable the I2C1 controller and add the RTC child node to support
> hardware clock persistence.
> 
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
>   .../dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
> index 792ab45c4c944..7314e0ab81da3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
> @@ -20,6 +20,8 @@ aliases {
>   		mmc0 = &emmc; /* eMMC */
>   		mmc1 = &sd; /* SD card */
>   		mmc2 = &sdio; /* SDIO */
> +		rtc0 = &rtc;
> +		rtc1 = &vrtc;
>   		serial0 = &uart_b;
>   	};
>   
> @@ -223,6 +225,19 @@ &ethmac {
>   	phy-mode = "rmii";
>   };
>   
> +&i2c1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1_pins2>;
> +	clock-frequency = <100000>;
> +
> +	rtc: rtc@51 {
> +		compatible = "haoyu,hym8563";
> +		reg = <0x51>;
> +		#clock-cells = <0>;
> +	};
> +};
> +
>   &ir {
>   	status = "okay";
>   	pinctrl-0 = <&remote_pins>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
