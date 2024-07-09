Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78670C2BD09
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jul 2024 08:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52AizNRWcZgRZKHGQPcsR1oemaKXv77AXRpXCun4Eog=; b=GLmcpxbm1pBM9U2VnImUiYxqRD
	AD/i49QyYudHZwJhthG7E12HhTOYTU8Vvau64KCMlxGKZQ/LdewVyR3aQ6Bj12MMoPV0R3gzm51ZM
	LedrOwbHhQAP7HIFC/ZY3/Pz+N19FVP3oL0GC7G82TP3Pr2CR39/QXxdOTftfJt0orLNNdLapKBbg
	gCw8Zrrvl4ZmpvmSfw2VbPpI2TpSJAuNG8AbMfuzQ4gCXZbfQNSGlE2IwRiALGEVL+3g1J746+9dP
	2fvAXvfSIIH64tj5inOExABsBcKg2uhxDLRh3E0FbFtXW+zhk9QljjFHxPgS48vhVBg4l71qeZAQP
	2Av+WSNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR6gr-00000006VnH-1yzR;
	Tue, 09 Jul 2024 08:59:13 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR6gG-00000006VcP-39Za
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Jul 2024 08:58:45 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-52e99060b41so5215719e87.2
        for <linux-amlogic@lists.infradead.org>; Tue, 09 Jul 2024 01:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720515515; x=1721120315; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5V/t+3meFrE06/A4Ix9ucw4QHhHNPHYbOa3q8Ar5d5w=;
        b=W5IRTX/BFVEIGJLZl9xzqWmCyQnKYmQsa6PvB1mutSfWnL+nHGTn7e+5d8/Dg+WyX/
         WxAOqaaw5Qk7OPfGG+TWqubSPnz+ix+lcJujko46oimknLdGKTfZWmZrpkz56ni1fvr8
         mNx4YEWQuvxcxV7HvJ/afblKvAafOu9tv2onLwO6Y1ilgDJfTkYfeq/p5idfAWLdIHNb
         8TkTFBkDEyJ6lIEyLHv+Ew4wi94PF3sbjcy/ALIJdSn5CCHKwW1KerwxiveFaZl0NUxN
         wPcuU4Q/zra9da7c4fmkHXIhl4rcpp9fvWn+fY5N5LHu5DLHbJxBgRkhjWY0y56n1SN/
         mWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720515515; x=1721120315;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5V/t+3meFrE06/A4Ix9ucw4QHhHNPHYbOa3q8Ar5d5w=;
        b=h6OOmhHnEeNlNXunYWDEdNNg8BNC5vFUrAe4Y6Fs14MTxV1ppCQuRyV3lUrfjTyO2s
         yeRSbTKu3gI7JpmcIhnVuEfFi6pgRb8FfcSDIgI23Gc2LeTR/Rhtg7gs4rAoAA0VZpFw
         5vK5bSRyFDo1qNa+FjC/xgTPPrvXQUNvMyp3tBuj6sZDhjlCoTFTA8c2Po7wQLWitVQn
         6ysQEjRZJB/f3cKhqZocjuuyCLGikIxPK2zEk+cp6+i78prMSU+gqh6bNGCjx2Yb73F5
         iT8jaNPwDclIUD5vY4FYemXLfl4jg9LV6hDqMFD32fb9km5KAd76mqJw3mYXjbqLzfy7
         blQA==
X-Forwarded-Encrypted: i=1; AJvYcCXX1v+dCRWluW4gWfD+UVQJ/aEPEvk25OxcUQ95ArrYqfX+MzqzQv0vCocnxwTT/y420HlZJOlhpPADxWfVJC/yjm3CLJ6fOb5EkHEp/MRCPF0=
X-Gm-Message-State: AOJu0YxUCFP14Td5t4T7gEBCjVQBVBP98XFx13EXbUR96sbU5ycrBaar
	tUdfdE4E+ZIZ/pUHiBxKmocXMjtl4l4IhBOzD7cLdvnKe0+L07SzBwjl3QWyoS0=
X-Google-Smtp-Source: AGHT+IG17y+9eHvBGXXOKoXsteB+mAkpljn2ulSXpM2ij/uchHhlZVAGoRmkKWpsanM/2V5dS5uvTQ==
X-Received: by 2002:a19:a414:0:b0:52d:582e:8093 with SMTP id 2adb3069b0e04-52eb9995541mr832557e87.23.1720515514583;
        Tue, 09 Jul 2024 01:58:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:b12a:8461:5e2a:dfe? ([2a01:e0a:cad:2140:b12a:8461:5e2a:dfe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f7361b5sm31043765e9.29.2024.07.09.01.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 01:58:34 -0700 (PDT)
Message-ID: <595ae759-0d5c-4f46-bab2-91bf616acd5c@linaro.org>
Date: Tue, 9 Jul 2024 10:58:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add watchdog node for A4 SoCs
To: xianwei.zhao@amlogic.com, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Huqiang Qin <huqiang.qin@amlogic.com>
References: <20240709-a4-a5_watchdog-v1-0-2ae852e05ec2@amlogic.com>
 <20240709-a4-a5_watchdog-v1-2-2ae852e05ec2@amlogic.com>
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
In-Reply-To: <20240709-a4-a5_watchdog-v1-2-2ae852e05ec2@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_015836_855350_54860374 
X-CRM114-Status: GOOD (  11.26  )
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

On 09/07/2024 10:48, Xianwei Zhao via B4 Relay wrote:
> From: Huqiang Qin <huqiang.qin@amlogic.com>
> 
> Add watchdog device.
> 
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
> index b6106ad4a072..496c3a2bcf25 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
> @@ -52,6 +52,12 @@ apb: bus@fe000000 {
>   			#size-cells = <2>;
>   			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
>   
> +			watchdog@2100 {
> +				compatible = "amlogic,a4-wdt", "amlogic,t7-wdt";
> +				reg = <0x0 0x2100 0x0 0x10>;
> +				clocks = <&xtal>;
> +			};
> +
>   			uart_b: serial@7a000 {
>   				compatible = "amlogic,a4-uart",
>   					     "amlogic,meson-s4-uart";
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
