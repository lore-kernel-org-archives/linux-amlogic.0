Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262BFC4332F
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Nov 2023 09:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0HGFjIWYm3Ojll7A69e9DrBL3Aj36Ixay3TwlpqwiU=; b=exzQruktb0KZIu+HxPK4H/+vJX
	XsdUKqK91QIolX5XPl3P4NI3UexbT9jMG1ngUfiyPlFndKZdT3gdIj/DWjrTHdYNyP1o58ltn3oFQ
	ID/JdWxRy9ow7zqL7HWf51JWa5C6KDJmp3+SGjr0St3iQSZVajmDhlfmmqlMIeg9rMzP2oBURLdMA
	SzEnOEXJgnwLrx6ROkPsR+UtgLkz6MPtFxOSGhUTy73kFxUjfz/2yVOCKGqauumEtrMsqfQXyq/5S
	ASNaCoFwCndj9/3/h5NA9gLyzq1yZ5iLwq91cmXRYS8B49gYtw5RqsMDQXzQ4HUEEJsSrUcnGzRAV
	f43FqlSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r10y1-005itt-3C;
	Thu, 09 Nov 2023 09:04:49 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r10xy-005it4-2Y
	for linux-amlogic@lists.infradead.org;
	Thu, 09 Nov 2023 09:04:48 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40850b244beso3986975e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Nov 2023 01:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699520685; x=1700125485; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHnsQJ4XpMcktv/vRmuqIsVKlG0FfHcOCkAwJxWxXr4=;
        b=yP5Vl2hWmk2QRVnJP2dE9SEKRysfF+oDLMJlyStcC0uZQx0umsqVJXU0dNRXmWdqnd
         /NwFfZWniKE9rPtEdhiDqbaHe6A7jTeSffWRg4ytiVp1NSD20YxLnxxsrU7ws/uKklcG
         D4f8RS4R7CK1acEpSU4SfuIJmEOv3mA57bJp65zpnAc4DIRmaA39vcIuE370cWT87tVQ
         uiq+YFK/6aEEm0h72NGAbB4FqWGU0t7MyqD6dDo7+igK5a80L1IjrMddNReDZOpf8L9k
         GrdRhp6dTvuCXPOWN5zEEi+7R8hEe0fFtqpq6IU6eGKupdaCjVEpQsJ/nMiQ4NHEVnel
         /W/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699520685; x=1700125485;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hHnsQJ4XpMcktv/vRmuqIsVKlG0FfHcOCkAwJxWxXr4=;
        b=Vqvet/3hpST3q/Md1f7jr8OtwXz5+ayoe+nAZwJ7Bgvk6RODcJVgpfurUBGKPKV/Iw
         e+NGzXR3tHBP7rK9IKeo7PhrYC+fj4IT4Xzq5EnVPjsivpzboCuwYskharbSeEjmmC77
         Ng8iSAO1mOC8GtfLArjlWSTK94t3LyvhkOViyTxVE4bOBuKDzwp67FodbzEg7yBrj1T7
         25UXpad6V1gsjy7P36rh8oUEfj44Ge4ROEXoMpdq6FfQbqjoUJwdGwp5EqzT7r2uwYlF
         iPgSzJVj/RmRpj2Bz9/3tEfJeoPRpUbep/PE2WjAUIvxOMGWn0MPzJ1lCbjzAt7fRN2M
         KP+g==
X-Gm-Message-State: AOJu0YzPDpd32Iz71sGER0FoEazMpW9wexWALUpyZ9n+LoTWXNu1Wqrq
	W5M7Frvuor9eW5chCox57VDOiA==
X-Google-Smtp-Source: AGHT+IG9gxOA4nD09dUm9a8mKZ++Oynr0aMFBrRI4R7rg4AWkBMr5Cz3hYVKfYWan2oKPYH73FN18g==
X-Received: by 2002:a05:600c:3513:b0:405:82c0:d9f3 with SMTP id h19-20020a05600c351300b0040582c0d9f3mr4018331wmq.30.1699520685274;
        Thu, 09 Nov 2023 01:04:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8f4c:8054:506f:f04b? ([2a01:e0a:982:cbb0:8f4c:8054:506f:f04b])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c229100b003fe1fe56202sm1409881wmf.33.2023.11.09.01.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 01:04:44 -0800 (PST)
Message-ID: <1468df75-3094-425b-b940-5c8297bd4067@linaro.org>
Date: Thu, 9 Nov 2023 10:04:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH V3 3/3] arm64: dts: Add watchdog node for Amlogic S4 SoCs
Content-Language: en-US, fr
To: Huqiang Qin <huqiang.qin@amlogic.com>, wim@linux-watchdog.org,
 linux@roeck-us.net, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231027104358.342861-1-huqiang.qin@amlogic.com>
 <20231027104358.342861-4-huqiang.qin@amlogic.com>
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
In-Reply-To: <20231027104358.342861-4-huqiang.qin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_010446_855066_F58FA8B9 
X-CRM114-Status: GOOD (  10.05  )
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
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index e0cfc54ebccb..2344b2d741c3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -92,6 +92,12 @@ apb4: bus@fe000000 {
>   			#size-cells = <2>;
>   			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
>   
> +			watchdog@2100 {
> +				compatible = "amlogic,s4-wdt", "amlogic,t7-wdt";
> +				reg = <0x0 0x2100 0x0 0x10>;
> +				clocks = <&xtal>;
> +			};
> +
>   			periphs_pinctrl: pinctrl@4000 {
>   				compatible = "amlogic,meson-s4-periphs-pinctrl";
>   				#address-cells = <2>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
