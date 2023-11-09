Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD43AC4167B
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Nov 2023 09:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ze4GU3FQn63+BeaBmOk/p6MfDpJZhbmFMLhvqe/YeAU=; b=k4BdwzDOCSfTix05xr5GnWgJcG
	EsOp8lAdrAyvXAy//ZWf8yoS+mDsDdZ7TS6XcY3SKaOmw6QhCYQZrWh9MOnhzaZalrMRiA/ugRAsz
	Ck6saGyrVQv0EpkLOBXd7i8xFAKrMjXVSJgBtkEkRfH0po9EgRtldQvtqh0mMtVwsBSq31BdD+E6o
	kLKS+aPIenRGTaD+FJEXFQeD1ZdAUFZMz7seZq03XiYg9PG2qc15Tv3dQfnj27Tf2ZocXePlbaZS5
	kAfUF2glZge2UFV+a9JrgKxeAPw1BFE3inhZJ+yilCSHp/GsSu1nFCQ0LyRQhmERfyFEEz4oNS5IZ
	nmgOy1wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r10yQ-005j0W-0Y;
	Thu, 09 Nov 2023 09:05:14 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r10yN-005izL-2u
	for linux-amlogic@lists.infradead.org;
	Thu, 09 Nov 2023 09:05:13 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c6b30acacdso6837861fa.2
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Nov 2023 01:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699520710; x=1700125510; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EwXeCr4WJrMiVz1N0BRYm+ZyoJe1l9iKn/4uLGie6Ww=;
        b=KWoBF8nPONlJM4sP1d95Sd6q+x1IvRR0lDTzfu6WlTJGpR621z3o7y4h3CeNiahV6i
         fQNXJiAjSPHvUT9j25tI45S3VIb5B2yJqKzIIF1JlAozR+L40k98Br6saEcdAKnCOxWs
         oL6v9y4Q6nH69gY9Ej3kTGBABPzsUTHDie3jAyLIlMPwrlK6V2fbzeYdTaa3Xj62K5Vo
         eAiLaqpoXRRXKYkoQ9wPhmqISrEROFHIIanFQ7T/StjMTlFJLMnJf+fWiAoWdVfV0DfD
         srX2NhHaCVphDBVhIymx3wkHHpmt5wR5oC8dw7YbYsouhuDvib6MA6W+ZPRiQDNSb9cI
         m34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699520710; x=1700125510;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EwXeCr4WJrMiVz1N0BRYm+ZyoJe1l9iKn/4uLGie6Ww=;
        b=Br8oJgdg6f1S0Cj1AxFR7i7rzn7farGv6xkVr4flEfjyLzcgY3y3kyw3VtnY6fLwsC
         rAs6o4G/Onl87DcTYrZKjxMDvqS4S4R/TytOQOVUkPYqe1F8Z3SGfsBl25+s8SU1jJPm
         I3NLt5vqS6feaJKV7fFM8fZXJZFe8l2WXgTU3IGiF7ZLtj1uS0j1wLdIZaLroNfIK1Zx
         cbu/05sZf8R5iOOgsQagNO3RRSm+J24b0aCxXb9RGnnLzz+d/Uycaxm0mmFSqKxWddZg
         yup1QJD0nevcfd1NqWtEoe9wVHNWJWbQwmfGqzt9kKE93Ypfut9LUcn5P5NocOUAYQYD
         YoiA==
X-Gm-Message-State: AOJu0Yz85Ko+2DDhWdEQ3+mfk/D5wwHnWV372rMWRUFZA9JRpx8dVlvi
	0Sm850nvqeYxnR35GCGucfD84g==
X-Google-Smtp-Source: AGHT+IF0tpaWBQijHfpYa1G4eCyN/CBUwGg2+EyirhnHCL+6Rn8FIHsbybgcgnceb2Re9bKtUvTxQA==
X-Received: by 2002:a2e:930d:0:b0:2bd:1000:431d with SMTP id e13-20020a2e930d000000b002bd1000431dmr3509911ljh.10.1699520680538;
        Thu, 09 Nov 2023 01:04:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8f4c:8054:506f:f04b? ([2a01:e0a:982:cbb0:8f4c:8054:506f:f04b])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c229100b003fe1fe56202sm1409881wmf.33.2023.11.09.01.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 01:04:39 -0800 (PST)
Message-ID: <18960bc4-de01-4a72-855a-b8696390a4d4@linaro.org>
Date: Thu, 9 Nov 2023 10:04:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH V3 2/3] arm64: dts: Add watchdog node for Amlogic C3 SoCs
Content-Language: en-US, fr
To: Huqiang Qin <huqiang.qin@amlogic.com>, wim@linux-watchdog.org,
 linux@roeck-us.net, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231027104358.342861-1-huqiang.qin@amlogic.com>
 <20231027104358.342861-3-huqiang.qin@amlogic.com>
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
In-Reply-To: <20231027104358.342861-3-huqiang.qin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_010511_939633_24325725 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

On 27/10/2023 12:43, Huqiang Qin wrote:
> Add watchdog device.
> 
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> index 998f5050795c..2ad1f8eef199 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> @@ -81,6 +81,12 @@ apb4: bus@fe000000 {
>   			#size-cells = <2>;
>   			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
>   
> +			watchdog@2100 {
> +				compatible = "amlogic,c3-wdt", "amlogic,t7-wdt";
> +				reg = <0x0 0x2100 0x0 0x10>;
> +				clocks = <&xtal>;
> +			};
> +
>   			periphs_pinctrl: pinctrl@4000 {
>   				compatible = "amlogic,c3-periphs-pinctrl";
>   				#address-cells = <2>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
