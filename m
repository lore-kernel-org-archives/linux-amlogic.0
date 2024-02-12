Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277CAC48297
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Feb 2024 15:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SesTXZHi70JYCSIQxPa8ubwFwfpC02rZu2qIg4Rf9/k=; b=PeytDaIQYkzoQGqqJeC6pQaf+5
	n/9sXFQ8hwgLSUZkKbgdg3zrIbYhnFs6jBM4BQjpC+EfNoUo4zzo5h9sWMG7chLoPqjERf72Bd0Yi
	QPuchoGpcG8Uo3nGIBBqpVWYyQg35KUi9MnsnXHc9iiQLzHeyIOunk8ky0UbN62bB6NMu478F4ca2
	Za5Fn9pHuhDUxML43fig5PCTDn61kzpjQAJE0iWktIw0XUlNHsxKx1aXKJJti+jQY0VrzH6IQExRs
	H3Wf/dr2I1EB+rTfG7e5UnGPkTSWtgL33bKjCnZFXfseazXiG45uPPkmjYGmkddakroifAAj/Ku8K
	8d8Tw9RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZXpp-00000005srj-0J1l;
	Mon, 12 Feb 2024 15:03:05 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZXpm-00000005sqT-36Ks
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Feb 2024 15:03:04 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-511531f03f6so3840119e87.0
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Feb 2024 07:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707750181; x=1708354981; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/662BTTNue4FgSV7ZIVHuGcGkzpnWLOBzkvEKQKYY5c=;
        b=N5ALKkvkwTEQMuD0RfT1+LKVKiLSjbb39O8YVwjevjUYbCl5uOqWWLxgQCzbMjtZFk
         WCu259V4x0OQkthQ8D47jVJIdhjJbFtoOo1ju043hiKfBpp1/pJ9ADmVjK+NJ52k8E5p
         UMCxSLTHJY89hdsTXdvhQf7/x6wdHjjmJn/1TzkjXWtWRO5XFAfor7e0eMfIZL8TUdzh
         f7RAHMXlix8KCL+muIv8T8MLPZukUyhHGJFA7kUK5TJr/8JKWqTkCmTYM1NgcH/5yEB8
         WTxcod165481Pd5XFuAVIf/YKeC2p3bJzCrT+HxKb8K5Frdl3DEgOBQGazZLWh+HRXvJ
         MQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707750181; x=1708354981;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/662BTTNue4FgSV7ZIVHuGcGkzpnWLOBzkvEKQKYY5c=;
        b=JFICzElgWEDyLGUl941bm9AKus/JTB0ney9+9szHfCEnfMf+0094jvnbAPBONJ4X2X
         bhtmO/QSFTy5I+TaZK3YWkHB8wC0JoZyQST13lR8SUD+mF7Co/qNCUhtiNavWuCe8CuN
         onMGGhHkUvsC8j5vNNt+suAoXY7xLwdz6tHsHUxdrwl08BG/jX2oLW9FCnNreJVLpOfn
         WaVT9W+HFOmltzHWgIOHvh8/yfPYBuluKFm3I+UQXenQ5gHzL5UtVpFClWw2NUovBC8x
         0ZzLt1nC1HCx+8dlZZuyBzQmhrxw9qIQvzwXOHFY3gzkrB6AkmAWQAYSnf+kj3I684PV
         mrwQ==
X-Gm-Message-State: AOJu0YwRcOt0SJXg2TC0QEOV29G3t8xXbmACpplpFYag3djaGzkOcViv
	MDI7YMY8BFKZNwwVIGSHI5oq17xbXlA6KWIi1XahHps14QwWWTgSgTbV3Kgn/5Sn97UYFVOllGG
	89eN00g==
X-Google-Smtp-Source: AGHT+IHSVn6saEc+8g+EJruureTFWLvP1jCapP+oPZ7JM5PMzHmO/rA6779OUV+XcReclPSaEIsGxA==
X-Received: by 2002:ac2:5477:0:b0:511:67ee:3946 with SMTP id e23-20020ac25477000000b0051167ee3946mr4551139lfn.29.1707750180626;
        Mon, 12 Feb 2024 07:03:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUt4JHf6lEB4bjIGhGNlkYerjl9WriXzWrAOiih4tkkDe3/KKaCBxYaX3+LX9tj6zUkICBDuM3LjORHPPtepNeGuOsn1sORZBMgI3WycKHTnDWvetKcBfDeqPPlOqEEsc1PJETBv6XRzm4XX2M5a1brlvuDiBlrnq/15WcswXLlkN3vujgQkOk1ljJA7KdKEXQRq9VFKwAPz+ieprrjiaYoF9Hp7IJsh2/qGTev1vfuvb+Zd5HYv9eeUVO4FsFHlrWdAufdzR68PgmolSVNmcHikh2cEc+8ch2QLvvIbhn32WAq5rAGTTEA+SfFEytF2Altf5v2kGK8jF0KTZzmza1nR1nwdPoNy9E/rXTYH5wG8+zhnz1WBHDaBRtsMHq8OvWjaUjLU2cFwtiRLGYlrCHaDigl+XUHZhE5HGyRuWWfWOfl9oa72JJfVBUrMAt53RP+CGrk9gVUP1g2U7GUfeNa4tfZhxG7WxB1g3WvCVnWswwDPK1xKivkPzVEgoGH0VLfwRCAzCymmW5g4W+ycrkq5/0IOxcIon9FY69earrxN2DwuN+dWat21J2G/Q==
Received: from ?IPV6:2a01:e0a:982:cbb0:fcee:f026:296d:135f? ([2a01:e0a:982:cbb0:fcee:f026:296d:135f])
        by smtp.gmail.com with ESMTPSA id fm8-20020a05600c0c0800b0040ef718cf81sm9146044wmb.28.2024.02.12.07.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 07:03:00 -0800 (PST)
Message-ID: <ceb6a93d-39e0-4d12-b2bf-d27acab83a28@linaro.org>
Date: Mon, 12 Feb 2024 16:02:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 1/2] arm64: dts: amlogic: axg: move cpu cooling-cells
 to common dtsi
Content-Language: en-US, fr
To: Dmitry Rokosov <ddrokosov@salutedevices.com>, jbrunet@baylibre.com,
 mturquette@baylibre.com, adeep@lexina.in, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, conor+dt@kernel.org
Cc: kernel@sberdevices.ru, sdfw_system_team@sberdevices.ru,
 rockosov@gmail.com, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240209212816.11187-1-ddrokosov@salutedevices.com>
 <20240209212816.11187-2-ddrokosov@salutedevices.com>
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
In-Reply-To: <20240209212816.11187-2-ddrokosov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_070302_836000_D4788020 
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 09/02/2024 22:28, Dmitry Rokosov wrote:
> The CPU cooling-cells property should be located in the meson-axg common
> dtsi, as it is required for all AXG-based boards with DVFS.
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>   .../amlogic/meson-axg-jethome-jethub-j1xx.dtsi   | 16 ----------------
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi       |  4 ++++
>   2 files changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
> index db605f3a22b4..55802fb03a46 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
> @@ -332,19 +332,3 @@ &gpio {
>   		"", "", "", "", "", // 80 - 84
>   		"", ""; // 85-86
>   };
> -
> -&cpu0 {
> -	#cooling-cells = <2>;
> -};
> -
> -&cpu1 {
> -	#cooling-cells = <2>;
> -};
> -
> -&cpu2 {
> -	#cooling-cells = <2>;
> -};
> -
> -&cpu3 {
> -	#cooling-cells = <2>;
> -};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index 7e5ac9db93f8..ea96fef328e8 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -74,6 +74,7 @@ cpu0: cpu@0 {
>   			enable-method = "psci";
>   			next-level-cache = <&l2>;
>   			clocks = <&scpi_dvfs 0>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		cpu1: cpu@1 {
> @@ -83,6 +84,7 @@ cpu1: cpu@1 {
>   			enable-method = "psci";
>   			next-level-cache = <&l2>;
>   			clocks = <&scpi_dvfs 0>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		cpu2: cpu@2 {
> @@ -92,6 +94,7 @@ cpu2: cpu@2 {
>   			enable-method = "psci";
>   			next-level-cache = <&l2>;
>   			clocks = <&scpi_dvfs 0>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		cpu3: cpu@3 {
> @@ -101,6 +104,7 @@ cpu3: cpu@3 {
>   			enable-method = "psci";
>   			next-level-cache = <&l2>;
>   			clocks = <&scpi_dvfs 0>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		l2: l2-cache0 {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
