Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5263C369AB
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Apr 2025 10:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5p5ElDh59j9kFa5LFzXTe2whsaLQg16Ro8adncCOGQ=; b=qfZxrCB8067wYrqp+R6NaUYuTq
	umRRssxbg/CDV/9w27xK5/6vxIcsjXDXy91W9pLjqtoF5pRENix8+EWuBPInrTGK21HpsuXPwtM6u
	zWFFCkEdGkKbdORJnMRytKSzoiotic1W8Qvi58rczSGmIjNuIz8BI9NKecIbqHW1tEa063GnMoesl
	BaSxD4PuG4hEr0BPjbEoUhH9JdSLcuI/WGuikX/gZ/C6D72NaRu7wHLOmCKtBaSzyFoFqqNfUZX/N
	yKrXn3lA7+ga3kjkAeDk6Cai1JLp2r3kIX8h1ZfjPsKG3FavqtSkuan0wyzVwztX9/UCgbheRSCtu
	3UsmzgtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ttL-0000000Dh4B-02Gj;
	Thu, 24 Apr 2025 10:33:15 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7t33-0000000DXTV-2cj7
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Apr 2025 09:39:14 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so6335995e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 24 Apr 2025 02:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745487551; x=1746092351; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNx1WPqtWYJcrBW98RXW8ncyOy163qc9hiiFTZ6Ipn8=;
        b=REYc32HAp5bePStoZQLIh3BUX4RqKScKaVLfLBWsUb7a9sB73cFx+TfmGPXgiT9yfr
         9EPsjEg+F+a+74Pur8gWpm15L4C7dGiWnewzovNN0SEHOfTyv6qRsg46LPKRs8vE0wRZ
         heTQPtjRwipZ1qnEdFMzNSwPrpvv316/3Ncn7w14x7pk/BTzXGGTEFtXgKOz/uRqU8Ld
         nU2R0Y7Pe1cwXv2eEO9xA5W9cki4+ci0nty4T8m842LP5JovfI6Lg1Etqz01h2kIi3H7
         UR92Zw5HMXEXFo1QuYd73xf1/XRIfn9b70rNFXPV7Zw56m6ErtHySgU8UD3BxaEU1QWm
         US5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487551; x=1746092351;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xNx1WPqtWYJcrBW98RXW8ncyOy163qc9hiiFTZ6Ipn8=;
        b=tV26xxBdN8qSY2OGf19cDVIxQj42LpbFfdrT1GJZ5t3mKhR6CfmTAGncCJ7beRUelg
         Ny8iO2JaAh8s7C8axpKApBn0fZY3QexGlqfFT9XYfjydMRKFqPYF8misFlGYcmI/BOmM
         F1rLLkVG5wjNHBwhbUaqwMvw86uB7kz3WWAdcm/qYSupdKi+hAZP5VHC4Qa9kpYHE3MA
         jY4XgM5OtvqLBwl1uk+88Hj662otVbePjb23/A2hm6oHGhTINLaoqa4BBBxzjE1NQWZb
         tIrMuEVVZH/vVFzgdNLrxf6mhRrABqS3AUON+Tiqbr0ZDXU3kZE1We+Au2q38FFAYXLA
         +w6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVk3WTiU6Geu38upYVOAoBUGuBnSLdJWtO51/MOizq1PDUMshM9j6aATzZJVJDRdL4blp3dq8EGrO8Ji/V0@lists.infradead.org
X-Gm-Message-State: AOJu0YzV+zTywsNHNqBDoXrzrbtQf6TOeo46Kel1+yFp0uQTOwYLEpl5
	bAN2lHFRZO79OGDbHvJBjwsiCOLhEUzkhBwqx0CS5/He7826cGlYrY3jVlArhLY=
X-Gm-Gg: ASbGncvt6Iaifw1AjUqhw5cx7+eXuu6pCu6cclbR/eoMQgouF350ImEp0cO6EWB3a6L
	mKglAK6MVXCPHCJyOFMg7tWXf8aXOYpqxbwS9dufDehlQhCc9HxmDsKYMEA/1AVs66MiOLNnBuX
	pxXForNhcviCAe4+t1ggB0LHF9248wOHDEWPHVA5ZuZMl4lj0RY2lwlEkG8lfLPsx8M0B1JbPZQ
	AqpvQrrhjOxNP86Zxfmt7GTpLlIB/8MOd+CsWcIb8Q9m3zkcmh7G3PH7kidV9iuM4yAKlXslji1
	VbGT6f3KV6a5fmMngw4NyOu+a2MH1K2BUjLPwXzsPl44nNVu42+VOS2lXXERw8fKa8ngj582WCD
	WUJdZlSqxWTbYL7FNCw==
X-Google-Smtp-Source: AGHT+IGtCxdUC1xTXeKfOpcQHvdI3o0HG4SnS9XsPqaKHix8/5R2mY47yF7JotIiZRIK89NFdpuEbQ==
X-Received: by 2002:a05:600c:4fc8:b0:43d:7413:cb3e with SMTP id 5b1f17b1804b1-4409bd0a445mr15832535e9.1.1745487551324;
        Thu, 24 Apr 2025 02:39:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a24a:bfda:f031:720d? ([2a01:e0a:3d9:2080:a24a:bfda:f031:720d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a01cdf59sm2453785e9.33.2025.04.24.02.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 02:39:11 -0700 (PDT)
Message-ID: <3c3c3652-be5f-4f54-a0b8-4829f9549116@linaro.org>
Date: Thu, 24 Apr 2025 11:39:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: Align wifi node name with bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250424084721.105113-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250424084721.105113-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_023913_683453_521B3AD6 
X-CRM114-Status: GOOD (  11.21  )
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

On 24/04/2025 10:47, Krzysztof Kozlowski wrote:
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
> 
>    meson-gxm-rbox-pro.dtb: brcmf@1: $nodename:0: 'brcmf@1' does not match '^wifi(@.*)?$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
> index ecaf678b23dd..9d5a481b309f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
> @@ -217,7 +217,7 @@ &sd_emmc_a {
>   	vmmc-supply = <&vddao_3v3>;
>   	vqmmc-supply = <&vddio_boot>;
>   
> -	brcmf: brcmf@1 {
> +	brcmf: wifi@1 {
>   		reg = <1>;
>   		compatible = "brcm,bcm4329-fmac";
>   	};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
