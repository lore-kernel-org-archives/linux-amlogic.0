Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289F7EDE98F
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Sep 2023 08:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47izQLIrCIzhUwbVXYnqDIN54enmDu+UNYamQMar0OI=; b=faYkLEHVhM5m7YJ1OUmH6tqIv4
	y3V05O1fwmiZvfkkDCpXCcIA/5aDZDayLksK8blgvYbc34nCuhxoffcNALISTug6ob3n5ctUpsYz6
	z98QC4DxLexlv+UPSzsGswA599lnK0hMj5h97UdJOCgJLInQbKSGS/cYf/pCXJ6kCcB0/FrJpnMbn
	iIPFjn9WPSlU9ILlOBkgtcqLeR3MNao4zJ23VzgUn+P/ZIJfydlj0aumio3cWXICH0Hty/j7tXWhe
	tiBU+Rzc3zH9EoTAPdXd+g8HbtyoBGQyXNbQTDOJ/M4bHyehpXP8aC+IgR8Ege3YzFb9JxLfSTAoN
	2apz4bjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qghi1-007hgv-2s;
	Thu, 14 Sep 2023 08:28:21 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qghhz-007hf8-0o
	for linux-amlogic@lists.infradead.org;
	Thu, 14 Sep 2023 08:28:20 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31c5c06e8bbso614860f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 14 Sep 2023 01:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694680096; x=1695284896; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHW5r8LR+WAyIi5BD2PrwXnZMmsz7ZEjh1uFnYSDxlE=;
        b=kqYXB8593/PxvKHnMzZPUZdpMsrERON7OHfCBcbxu2W/OGjTwj3yzMn6k3BEnZN80z
         B3n4eOY8UZlYyLbiSQUfPG0FKauIR4oo1JVeZ4k14frp47ZGUHiejUi5kzmlit2AhelZ
         59Wr9aTXbMguTRjzvZevAvPhBmCbMRSyY9P7wTLfcpeN5jYS17dkAqwfXEEyh91287nX
         I1eg55zKPP9wak+9YiRuJdiN5uvqhOxj2XdiDu+uniTh6LdabU+w7daoERRtHLG2XiKM
         yjohcsw+0Fev4Yj4JxB/YtI+pJPDXjcCACgnii1xBczPP+mk6e4sqnEJXVuDTNRx1oZZ
         4CVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694680096; x=1695284896;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sHW5r8LR+WAyIi5BD2PrwXnZMmsz7ZEjh1uFnYSDxlE=;
        b=T9X/xyigPf19yAW6od54m/1fWbK1qULr/UgtBUy10a2MjyGcNPnEayM3TVbhXf380o
         d32AOmMl0G2tLlfxH//1e9MdHyjjYN4epRK9za8jQAW5TBHRoHYfoDIyfKp4o+xhKFkA
         884K8QKTCiV5UsP9g6m28EwJizK/FpYnel0MzGYhwdDsn5sPXGpJP2DHSNebX+KxRtAB
         x7rYuzzTYkLyE5ryj//6mS9gK6kA/WukMZNqZ/ad244HAxdyc2+ENU8HfsK3WfYtEVkF
         PNHsmVg0zZhvU2rVX1bpcEFKBcqPSJeVXrzsd2YS2D1VGRCPEIYCvdEX6MFRumBLQ4NP
         YjCA==
X-Gm-Message-State: AOJu0YwVg35cGpaF0WHl7zpnZwvkbwpbK50gCR/NP4Q/TpemNUxPe2ms
	tFRCf6BVBIDqCl7nVdWdnaYAYA==
X-Google-Smtp-Source: AGHT+IE4GF+ezJ4C5tBv6gDdM3b8UUoEbEk298f97Goesf+jrwKSkQe1atXr0Y20EjzVrjz/XkE62Q==
X-Received: by 2002:a5d:5610:0:b0:315:a043:5e0a with SMTP id l16-20020a5d5610000000b00315a0435e0amr3811773wrv.56.1694680096456;
        Thu, 14 Sep 2023 01:28:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c61:ffb9:3ed9:c494? ([2a01:e0a:982:cbb0:c61:ffb9:3ed9:c494])
        by smtp.gmail.com with ESMTPSA id w16-20020adfec50000000b003141a3c4353sm1091493wrn.30.2023.09.14.01.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 01:28:15 -0700 (PDT)
Message-ID: <96f5caac-c717-4cbc-a9c4-8708eb4327e5@linaro.org>
Date: Thu, 14 Sep 2023 10:28:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 3/3] arm64: dts: amlogic: add reset controller for
 Amlogic C3 SoC
Content-Language: en-US, fr
To: zelong dong <zelong.dong@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 yonghui.yu@amlogic.com, kelvin.zhang@amlogic.com,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>
References: <20230914064018.18790-1-zelong.dong@amlogic.com>
 <20230914064018.18790-4-zelong.dong@amlogic.com>
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
In-Reply-To: <20230914064018.18790-4-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_012819_296226_8C240191 
X-CRM114-Status: GOOD (  12.00  )
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

On 14/09/2023 08:40, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add the reset controller device of Amlogic C3 SoC family
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> Reviewed-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> index 998f5050795c..d086bfab3228 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> @@ -6,6 +6,7 @@
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/reset/amlogic,c3-reset.h>
>   
>   / {
>   	cpus {
> @@ -81,6 +82,12 @@ apb4: bus@fe000000 {
>   			#size-cells = <2>;
>   			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
>   
> +			reset: reset-controller@2000 {
> +				compatible = "amlogic,c3-reset";
> +				reg = <0x0 0x2000 0x0 0x98>;
> +				#reset-cells = <1>;
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
