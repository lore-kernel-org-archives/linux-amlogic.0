Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C359FCD11DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2024 09:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHzXGeWP5UyWIZKwk9E0PHd5LFzEk6Yl3GFbMWfeUVQ=; b=iqUzTMeLpsDUDTR8/qqXkNJYEY
	+x3MPbyNHSzBcrs5g3ZHKt4548huVpNct4q0oGFj0m5SYrp00IvS5+1D4ye27zFnGirgvMg11+a4v
	r4JocCQwNnGrT4FeWgzK0FLwvaqFuvM3yHIUlyslqPnBPKkluIkpkmEGbpUfF9PkrVk734WnGDZG3
	ERxsUZvebKknNs1eHA0uhiKJFM3y8DtGbiAtKlcWiUjlCQdqU6ECLYmbM9mp2WJQ7rBhlcqQY9r17
	oBr5myASSAfKWnjGiwwSzy0ojqiCKM2UvU41mLl7UK7DVfVFwUQcxXR2J+lXR5ePAdUmGTCa1U2Ys
	UULhhRfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8Uq-0000000HTtA-0ETG;
	Fri, 29 Mar 2024 09:26:00 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8Ul-0000000HToo-4BX5
	for linux-amlogic@lists.infradead.org;
	Fri, 29 Mar 2024 09:25:57 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-33edbc5932bso1256414f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2024 02:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711704353; x=1712309153; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbqAjvcUfXjEMKsMx6DWt6hGRbZ/4fw+xrXlGf6rT+k=;
        b=RplReQsTOrz84ggKDOihIua/5TiYvSYtD57NYm36JbUAVImRu6yIDylpw6DzzXuLBa
         ALc+yJlsuSAmOn5iAZeU4xiwLOfK+Dyjw4yek9TP5oNAFTnv584DxcN7v+AuoWFfrhOH
         dgM1oNPTQOGBkCxNM4eSV1FInOvgWHCROMnYr7sDivYENA14a+lqxUxvKmm1KBSO8ES5
         29O+7OeqqmQlxN+C5nv0s55N4sIW9W7JboKd/PGIZVsWf5HL7TyU9M6NcLeYKwx9dXCQ
         hxal4LMeLpHKKEHd5xK2HyheO7drpvkhvy+cllS+EJrwjmDIFnWfFECNSRRhjSFnqM42
         pTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711704353; x=1712309153;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZbqAjvcUfXjEMKsMx6DWt6hGRbZ/4fw+xrXlGf6rT+k=;
        b=m+DyWD+wAMet4jpavRkqPtWngITF0aBq/C023yCsgt15cA4DFt1hU4IQExlxR3CFKq
         wP2gcQxpqwaY5HafDBmGD8tZUqL+pLmrsFCF6Ybcy0gL/3vYjGqbWe6mBtngsq7MHBo2
         LDYczc3G61xiul5euyhjvHGvdB3kPuXid6wfmVDm+RyZoJwfXCakJ31+bjqXCV6fbJTZ
         s7EOF2ys9r+OuG1Jvwc7h1rScGYL8ekz/Y7lLgjOLFI1ilHyUhXS6/JOAwBVCmPn1n5V
         NCkK7nPjfQTXw1N9XKCICYzyS6ploofMFuROaYCqziTkQx6NH32bnQT7nl8OU7WhmT2R
         tB+g==
X-Forwarded-Encrypted: i=1; AJvYcCUCl45XDk+SLHTkLsII3CIYgCu1SRFCLiK+UL5cfdh13tltyQActq+bD/bCRua+xduVLbobjG5KQ1e11p+W2H4XL0Q33VsrErMJrp1ZAEVKvnM=
X-Gm-Message-State: AOJu0Yxb4FmJKhkN9slbeWgsvm3oL0ZbgnpqiFcp5p8isOb9kem/cafG
	Fw9peHvjdi5iJpSbCO0G+d8D/I3Zf2bnGCbRCWILsFlDkNHulgfWyAQ9T0ukHl8hKRYdLqDm3vt
	CNeo=
X-Google-Smtp-Source: AGHT+IH50re5PV/7C69XBqtrNUv+0lTseoO19JlUo4rrIVUwOSr28cjIJZSndIqjgSoPac8lxMlu5g==
X-Received: by 2002:a05:6000:1b04:b0:341:a802:3d25 with SMTP id f4-20020a0560001b0400b00341a8023d25mr840814wrz.53.1711704352929;
        Fri, 29 Mar 2024 02:25:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3cd8:c97b:1468:c232? ([2a01:e0a:982:cbb0:3cd8:c97b:1468:c232])
        by smtp.gmail.com with ESMTPSA id bk5-20020a0560001d8500b003418364032asm3779716wrb.112.2024.03.29.02.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 02:25:52 -0700 (PDT)
Message-ID: <ab23d0fe-7c94-4170-9776-2d7696a02665@linaro.org>
Date: Fri, 29 Mar 2024 10:25:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: add reset controller for Amlogic
 T7 SoC
To: kelvin.zhang@amlogic.com, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zelong Dong <zelong.dong@amlogic.com>
References: <20240329-t7-reset-v1-0-4c6e2e68359e@amlogic.com>
 <20240329-t7-reset-v1-3-4c6e2e68359e@amlogic.com>
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
In-Reply-To: <20240329-t7-reset-v1-3-4c6e2e68359e@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_022556_193058_38198D84 
X-CRM114-Status: GOOD (  12.06  )
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

On 29/03/2024 10:17, Kelvin Zhang via B4 Relay wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add the reset controller device of Amlogic T7 SoC family
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 5248bdf824ea..e94bb85b5292 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -5,6 +5,7 @@
>   
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/power/amlogic,t7-pwrc.h>
> +#include <dt-bindings/reset/amlogic,t7-reset.h>
>   
>   / {
>   	interrupt-parent = <&gic>;
> @@ -149,6 +150,12 @@ apb4: bus@fe000000 {
>   			#size-cells = <2>;
>   			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
>   
> +			reset: reset-controller@2000 {
> +				compatible = "amlogic,t7-reset";
> +				reg = <0x0 0x2000 0x0 0x98>;
> +				#reset-cells = <1>;
> +			};
> +
>   			watchdog@2100 {
>   				compatible = "amlogic,t7-wdt";
>   				reg = <0x0 0x2100 0x0 0x10>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
