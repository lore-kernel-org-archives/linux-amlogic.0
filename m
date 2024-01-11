Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE9AC4707B
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jan 2024 08:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mf5wHXQRvn+Os9gxSe/QwZrs0PRMYM/WRzf7GRtASvo=; b=tNOEv/N5sSNfUF+zvunhuLFix3
	atuS17FjiedeKHSpepVEkgDaWM7EYTyn2zHWsxlZ1ATJ9U6AR/3w5lg6Wo9VgjWZYsVwpSm/pA1kj
	nU9AlcygdOgflIehNzV3oIH4qt653DkpEhxHDKE6DG0euZgHvKnh57qDp/evFW1in/a5rINQ/zQmn
	pOFfsJGnwrawkxJMzaTkQw8K51KsJ8NR/yBSef3stpRsRXyNgf/yOhs3PvXDBsg3/Z4Xw46r7I8a+
	QR34pq73P7+7zk14XXr63o1/u6ffUwfj/WtvofqYJaT+MLllhO13EZgM2MpaGp7Mqzx+nwpvKxStZ
	ZISPVF/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNqES-00GRv7-1q;
	Thu, 11 Jan 2024 08:16:08 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNqEP-00GRse-16
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jan 2024 08:16:06 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40e5afc18f5so8621365e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 11 Jan 2024 00:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704960962; x=1705565762; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucZYjQafMIKHoLE/R0AnbQMYTAjIxNebYPWwbqvXZWA=;
        b=CZJ+orIRb3QBL5X94KL9mtFfyGafcXtzIVsek3MQScxaCSc1BpiE4Yfohl9sD3zLCn
         CtOVP1PCuuRR4ljNWTgmlUJlz6khZFNYowFjyOmK3tbgPe8jkFOve1aQ2vMf+DYwslnE
         JK+2iCNbwgBf8TM43ikSjrfJiGnWZLmU+4YFo3/GyFopeAtlcTnXN8ziXsP/LYtHp/ZC
         vqeTcw6sY7dwJWD/vmAwgF48P2DQTrilPOK8XEhzs3knvgMKVrpNuMyNg+fgO3vnHfxc
         X3ef4UYUKFzaR4WSW5MiFjiO8rpdhydRVRzUo6PqvopEEnMiA6Zny6AXjoz5XDbcktuK
         zcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704960962; x=1705565762;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ucZYjQafMIKHoLE/R0AnbQMYTAjIxNebYPWwbqvXZWA=;
        b=KfisxqvKCqbCtWkI8BnDZdFQVKJhDtFWPeCPu94AniPP/PYOiXUkGhss4h1xFvCyb1
         vzGjeFnV/W8yTe0l7HRNpIs1KMlxGVHXVeVIPSWLRNttCBkNWuLi24KxmDoSsYuhYCdL
         BLoPO0X3BCREa2JBP5/k8eMQW/P/3eS+41QTh6xeU3yGqZYbY4r8Jy8nswAXhng+k14/
         qgGyJ/B7sVLeWPZRquOjLQ5xdN85IyhMo+CXSf+/8xLGdUI7B4mUNWdIBboEi6mRi3Rv
         KP8iJQVjHLOg/GyyGZfntJRLkFte28C4z/nfK8eooB17xYApVHcWsvS50601U6mISPur
         skmQ==
X-Gm-Message-State: AOJu0YzGS/kqW1ttrqIW2XWqJrLdz4GssHAW/7YxTKxQGfPqs90cwF6+
	ydlkAN2YEvYOuk73f6jYpA0c1w94gXmUsw==
X-Google-Smtp-Source: AGHT+IH87WgS1yK9VKo2iOZzHy0Ibve5OOd1/gKkKchhicjR8afbKzVMmi3wCXF9AUr8mS7ZTrYrTw==
X-Received: by 2002:a05:600c:5199:b0:40e:61ff:1d52 with SMTP id fa25-20020a05600c519900b0040e61ff1d52mr16310wmb.128.1704960962098;
        Thu, 11 Jan 2024 00:16:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:a5aa:e466:ae57:5a26? ([2a01:e0a:982:cbb0:a5aa:e466:ae57:5a26])
        by smtp.gmail.com with ESMTPSA id o21-20020a05600c4fd500b0040e34ca648bsm955660wmq.0.2024.01.11.00.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 00:16:01 -0800 (PST)
Message-ID: <2fcf851c-a39a-4471-a705-6bfe9f4b975e@linaro.org>
Date: Thu, 11 Jan 2024 09:16:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 17/24] arch: arm64: dts: meson: a1: add crypto node
Content-Language: en-US, fr
To: Alexey Romanov <avromanov@salutedevices.com>, narmstrong@baylibre.com,
 clabbe@baylibre.com, herbert@gondor.apana.org.au, davem@davemloft.net,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com, artin.blumenstingl@googlemail.com
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com
References: <20240110201216.18016-1-avromanov@salutedevices.com>
 <20240110201216.18016-18-avromanov@salutedevices.com>
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
In-Reply-To: <20240110201216.18016-18-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_001605_378808_07EBD010 
X-CRM114-Status: GOOD (  13.06  )
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

On 10/01/2024 21:11, Alexey Romanov wrote:
> This patch adds a crypto node declaration. With the
> Amlogic crypto driver we can use HW implementation
> of SHA1/224/256 and AES algo.
> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index cf150f568335..879e0ce0b2ea 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -653,6 +653,14 @@ sd_emmc: sd@10000 {
>   				power-domains = <&pwrc PWRC_SD_EMMC_ID>;
>   				status = "disabled";
>   			};
> +
> +			crypto: crypto@6000 {
> +				compatible = "amlogic,g12a-crypto";
> +				reg = <0x0 0x6000 0x0 0x48>;
> +				interrupts = <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>;
> +				power-domains = <&pwrc PWRC_DMA_ID>;
> +				status = "disabled";

Why disabled ? Usually we always leave the embedded HW enabled by default.

The comment is valid for the other dtsi changes,

Neil

> +			};
>   		};
>   
>   		usb: usb@fe004400 {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
