Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24245C4707B
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jan 2024 08:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLt9zEtMk1h2whYKTiriAoTzkpSEH0kEdFJIbUqchR8=; b=KanZQDAZ8iyysiqUr7u81iOL0L
	5hgrulmcsn7RJtp6kyCuy+BG0xfW5neFeHuJgiRk/oosvCeiBFVTf/LZbSafllCSH5r3STWYYdDcO
	ERzxJf/azgzL0/3eKCMUYo9HuTzaBtnmS8wKteNTCP2eeaaQvOx8D+dbIEQ2lFxpCpPYqL1056zUA
	+ExX6R0dHT1dqpcsyWUfwt7zKofZoVWlKvd2J8v+iiDjowtelip6DTAtkorbOddAkUG+rszXgrJh9
	aRGoJv/uVpjcTFDQ/QdMv6MuEyBCz53kg/248hzNHY/v6Ww7iwF3RJHU3MYch1x7eVC6u1uFrjoby
	gHfl/jbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNqJB-00GU2q-1T;
	Thu, 11 Jan 2024 08:21:01 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNqJ8-00GTyx-27
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jan 2024 08:21:00 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2cca8eb0509so60092281fa.3
        for <linux-amlogic@lists.infradead.org>; Thu, 11 Jan 2024 00:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704961255; x=1705566055; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8H8nLABIrRnbxfnMrbAUP0DbCSuPWhYrIfqcQ3RIvA=;
        b=EqBY07mN+8A0fCfTABrl3vxntjxT9zaRbv6rpVnxkBn4V1W+torp905e+EkITdZePf
         SQ3FCNpsJIe1UEXFT9NOkIyzmlLz5SlnEn8suFdDPCKYmUvtS/hRjVdmTuVCvUyIUA9p
         iZt/wzkGHWjJRRE2WGL6A4SUHAfDnemhnuBHZEO05Apnrk7sG/Gw/y1YJxOUhHHM4J44
         J62EjLIXk3e0QyiHFZHjoMAk5MiTgSZOmd7vWbad3ItZBxe3wM2CEM4uDUss0Xz6rJol
         WtPe1A7OvKsqnIa4ph+t1OIxYb59dQUJeGewjQYOGiGty7vCh/5gVsCuog2vIiVU4hdK
         4LuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704961255; x=1705566055;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d8H8nLABIrRnbxfnMrbAUP0DbCSuPWhYrIfqcQ3RIvA=;
        b=M3Z0PfuIdiWUGYDXobuw6rpbkYXBwjSSyfQzbwBeryAnN1v9mm5iOSQ0uIy1NY4ZLP
         hdvwNk7nK3q+lt0ghXHE1pxksL9HvXygXn92gO5kOYEISL3L/9mHmG8x5oBeAEroZBKu
         cc/AOynDy3cdK65JRqOERrvV3JEiP/y6rvu6b1IQoV185JQ+HKZAZqQ+reV9lKN2G2/C
         1vsbaxk3phHIL3gJ0obGa4T+SYS2qwCQfbndzWsfnCpAzFQO2duuA+zbiHQaytrbwNkA
         vTEVdu6FvU1HSzpLllPWL/MgaaSjTotBhV5n931qLUMPUbdHntfEuPlV8mchS9uEbDL1
         duNg==
X-Gm-Message-State: AOJu0YyBv7YtmNv8U/+hk9C3LWKOJP9ceJH6yYuyOJmoUf3mRkfhqrwK
	lYiD9XLBopYkFSRjeZiOC8r0i/9yS0tysA==
X-Google-Smtp-Source: AGHT+IHFIdzzA8pDHnJscKixDdClY522jcwFHATS2Aupj39MBfjX5t+c8qexSW8CJXjpE5qrRmvjLw==
X-Received: by 2002:a2e:9209:0:b0:2cc:daca:2e81 with SMTP id k9-20020a2e9209000000b002ccdaca2e81mr138241ljg.15.1704961255185;
        Thu, 11 Jan 2024 00:20:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:a5aa:e466:ae57:5a26? ([2a01:e0a:982:cbb0:a5aa:e466:ae57:5a26])
        by smtp.gmail.com with ESMTPSA id j27-20020adfb31b000000b00336e32338f3sm550474wrd.70.2024.01.11.00.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 00:20:54 -0800 (PST)
Message-ID: <8bc3b9e3-3623-41fa-a269-c0f439aee1b5@linaro.org>
Date: Thu, 11 Jan 2024 09:20:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 02/24] drivers: crypto: meson: make CLK controller
 optional
Content-Language: en-US, fr
To: Alexey Romanov <avromanov@salutedevices.com>, narmstrong@baylibre.com,
 clabbe@baylibre.com, herbert@gondor.apana.org.au, davem@davemloft.net,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com, artin.blumenstingl@googlemail.com
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com,
 Jan Dakinevich <yvdakinevich@salutedevices.com>
References: <20240110201216.18016-1-avromanov@salutedevices.com>
 <20240110201216.18016-3-avromanov@salutedevices.com>
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
In-Reply-To: <20240110201216.18016-3-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_002058_694646_1E4C94E5 
X-CRM114-Status: GOOD (  13.16  )
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
> Not all Amlogic SoC's uses CLK controller.

In this case you must make clocks not required for the new platforms in the bindings.

Neil

> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> Signed-off-by: Jan Dakinevich <yvdakinevich@salutedevices.com>
> ---
>   drivers/crypto/amlogic/amlogic-gxl-core.c | 12 ++----------
>   1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
> index a5df061f9890..e5f504fb477e 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-core.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
> @@ -248,16 +248,10 @@ static int meson_crypto_probe(struct platform_device *pdev)
>   		dev_err(&pdev->dev, "Cannot request MMIO err=%d\n", err);
>   		return err;
>   	}
> -	mc->busclk = devm_clk_get(&pdev->dev, "blkmv");
> +	mc->busclk = devm_clk_get_optional_enabled(&pdev->dev, "blkmv");
>   	if (IS_ERR(mc->busclk)) {
>   		err = PTR_ERR(mc->busclk);
> -		dev_err(&pdev->dev, "Cannot get core clock err=%d\n", err);
> -		return err;
> -	}
> -
> -	err = clk_prepare_enable(mc->busclk);
> -	if (err != 0) {
> -		dev_err(&pdev->dev, "Cannot prepare_enable busclk\n");
> +		dev_err(&pdev->dev, "Cannot get and enable core clock err=%d\n", err);
>   		return err;
>   	}
>   
> @@ -279,7 +273,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
>   	meson_unregister_algs(mc);
>   error_flow:
>   	meson_free_chanlist(mc, mc->flow_cnt - 1);
> -	clk_disable_unprepare(mc->busclk);
>   	return err;
>   }
>   
> @@ -295,7 +288,6 @@ static int meson_crypto_remove(struct platform_device *pdev)
>   
>   	meson_free_chanlist(mc, mc->flow_cnt - 1);
>   
> -	clk_disable_unprepare(mc->busclk);
>   	return 0;
>   }
>   


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
