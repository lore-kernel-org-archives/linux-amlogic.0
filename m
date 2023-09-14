Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2B2EDE98F
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Sep 2023 08:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2zrlln6JSHVewURMhcbydVxPDIazCF370983f/SVow=; b=Yq9VF+lKjwT8utjKyEhnwjQBS5
	iaYGnBTZbkB90FmoKI4boOXPYj0RcRrA6lju7Z7UYTImSvWQ2xdIyDEpPY0tnK4Jlu27i3xrMih9n
	/Ovdzls+Zsih20fz6yR3X4tdR+hU5H/G+eXCRkHm2//zqn9qXrNkxKzScHM3G77tqLM/8wNY/i5lz
	uN4BkfHD8vPVmbpc/Fkv7ROl331xH7la7OJktPrxMzi0gAU3oVy6imBOwt4ntDSmoeQuilqvg8r46
	JcvBeBoEBL4r8JVkyYkIihdu7ZgNHge4eoXsdbmxmKPt9O7MnNR/PMnRVWnVDkQkmVMHeFecvA6p/
	AXMTPPdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qghgi-007hKQ-13;
	Thu, 14 Sep 2023 08:27:00 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qghgg-007hJi-0X
	for linux-amlogic@lists.infradead.org;
	Thu, 14 Sep 2023 08:26:59 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31c8321c48fso1159246f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 14 Sep 2023 01:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694680016; x=1695284816; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xG6M6y8Pw7X9V4XyilW5IhSYyMQL3ODzvTuhgeyn1Zk=;
        b=FboRM16qD1sJ0auVBeq2FBTjQGWqxJ4ZDZtr+qFZrr9aY7Vkcv18d2paAlhyAYOKH6
         iD/UFjtZOisAtq6wyfCFF5/mN8jyXchqB9H99air/8GOn9/8p/AKa7p54jExETglWf2c
         pAQLErNaG8NP2qY0P5Ogbg3ktUrVK2gm9olWUD0pECzyI8xV+uuZdFbQH/g176K9iifu
         pr1roPIIqZCtTpKal8fWV0hGATQeC3juD8skufOdVHxZk9UbW08YzeHr0wdwRCZqKQWR
         GsNhcAVlo2iGXUdKwqvJohJhl1kMeKCYzLU1eSgMtQkHxS04sqY8AbjfHjVZTX0YXXks
         aXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694680016; x=1695284816;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xG6M6y8Pw7X9V4XyilW5IhSYyMQL3ODzvTuhgeyn1Zk=;
        b=fyqmnZsYMtSERvtUY3xPdWcA0cyJly7yf3iRAiOLhfPKrOrOLw4OV7LZNNHeXkklsa
         KuyNPy8dcK+IdOxO4wwyUmqg9pdyCHIxQdYRziJZKjK/pwsKkUa9rf23AsuTSpOzmwFn
         13VsD+OzueAAePfosGzHEzn7S2gwKrPfxTGdu6MKev+ix89SaPkn+aia91zeKIPqrX7F
         r/Xvz5VL1iCQsVLxJ9PIAsbHOnTDmWmg4RWrVO65D9ZG504t+92/2v7QdcMAWyKRDs/0
         cuZY8jb3MKJxHTIOj+oXjbgplEZjMCEMnAxIbL17x9BFY5JxryspFbtbeuQ0VougUKYu
         BHYw==
X-Gm-Message-State: AOJu0YyD1wbg0W/4DruObUYBXAJiBR+7LZ15sCRyxug/EcaaRUli/t5B
	23uyvlELOWLAgZLIYaRW6UV9Ug==
X-Google-Smtp-Source: AGHT+IFXh1He09xY9piFkgjFF4M1NajNlBCuQYWyy34YTNkgEUY34Mxl3ZDxCwoN7B2QiWTF6RHtWA==
X-Received: by 2002:a05:6000:4013:b0:319:735f:92c5 with SMTP id cp19-20020a056000401300b00319735f92c5mr913680wrb.32.1694680016672;
        Thu, 14 Sep 2023 01:26:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c61:ffb9:3ed9:c494? ([2a01:e0a:982:cbb0:c61:ffb9:3ed9:c494])
        by smtp.gmail.com with ESMTPSA id w16-20020adfec50000000b003141a3c4353sm1091493wrn.30.2023.09.14.01.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 01:26:56 -0700 (PDT)
Message-ID: <4c1566e0-a502-4379-b360-9e6ef374af04@linaro.org>
Date: Thu, 14 Sep 2023 10:26:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/3] arm64: dts: Add gpio_intc node for Amlogic-T7 SoCs
Content-Language: en-US, fr
To: Huqiang Qin <huqiang.qin@amlogic.com>, tglx@linutronix.de,
 maz@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, hkallweit1@gmail.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20230913080924.3336391-1-huqiang.qin@amlogic.com>
 <20230913080924.3336391-4-huqiang.qin@amlogic.com>
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
In-Reply-To: <20230913080924.3336391-4-huqiang.qin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_012658_205962_5BCDCD9D 
X-CRM114-Status: GOOD (  10.94  )
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

On 13/09/2023 10:09, Huqiang Qin wrote:
> Add GPIO interrupt controller device.
> 
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index dae3465bd39b..21b2436c47e2 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -155,6 +155,16 @@ watchdog@2100 {
>   				clocks = <&xtal>;
>   			};
>   
> +			gpio_intc: interrupt-controller@4080 {
> +				compatible = "amlogic,t7-gpio-intc",
> +					     "amlogic,meson-gpio-intc";
> +				reg = <0x0 0x4080 0x0 0x20>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				amlogic,channel-interrupts =
> +					<10 11 12 13 14 15 16 17 18 19 20 21>;
> +			};
> +
>   			uart_a: serial@78000 {
>   				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
>   				reg = <0x0 0x78000 0x0 0x18>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
