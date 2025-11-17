Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D6FCEACEF
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Nov 2025 09:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2N34xnBVT1fHbL+IID5cZspeWNyU6RVacgHhffl6UQ=; b=bh20WBs9Ix97bZe8YI4kV8cliN
	egQv7YDxMuJAhz728ZUWid6mAYGwGjkzO6/xGm7B1vP9BwQU1mskK4WzFB6bVanajoInOEHrJCm2T
	Wo3JIeboxdS6nMfEouQqLT0yifJCNpzalOqXIohf5VK8BcraD7UzAAf8/QGIPVh4mH7ClfUlq1iUE
	xmlkdHacQuNf3GrBFBmmkDa1nVSItRnFNeUeiTT+bpJ3w7eM1cL+A7UoNhhn01A7PBq8iinSKR2+G
	51+98JtJ1VlosNoTUKS9MavYUetMC6VH+2u3Nag0+iqyMVZgNz+yCM6ay+tLCGTVlWiGcRE74rxPN
	3pYRSgGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvGR-0000000FlLI-0ITd;
	Mon, 17 Nov 2025 09:11:11 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvGM-0000000FlJ4-1UDz
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Nov 2025 09:11:09 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-429c4c65485so3355886f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Nov 2025 01:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763370664; x=1763975464; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qWXKv6dzpM2CS8QuqpR6KyDTLS4NLIuX56g7jGiE3Rc=;
        b=WgJhdJJpJ5sWS1cH42oSLhTtX6azF7q7MtqFVqEFfJWFKR/bkxtGTMwwZ7dfXg6pJ5
         ZQozvCkh1OeO971OJnMFfWRi1fKI+1CvrOn5FfNo54eG3Up5+zZlXByKdsm2j6n3Fwnp
         HebTb++WCKmSehbh45/mFXSavdJcyAgZ6w+7fVx9mR37BLmJi7diLI+nv/WcbAQV8Hlf
         l9adniy+lcz7eKVOcUZDyVENlPJjHKHrmqw3ux5XrigA0TvPcXzmgCQiSc6BnrLKmsLW
         js6S3nJglwotbN9d6iOFfL04+IIsZDSngOto5W3BT3CYyvvZrlv9LZpOYlVCztRPKihF
         3GrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370664; x=1763975464;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWXKv6dzpM2CS8QuqpR6KyDTLS4NLIuX56g7jGiE3Rc=;
        b=xTKU9olKP7AwLapwjng2H6Mhn0m8cYCC++nlFHR/mCZ5wq4PYtiQwIaGod5Kr2IhiD
         Xzz5kJFzz7PK+VgD7jmxM1WTw36JO7PiI77p95Qe6nvCkoy2aD0O3pPP/IXl01kjvITd
         HLq+5ippF2AqeDZoQQHKzicm0yfAqYzoMssypnXS4S457u5bb+TM1Nv0XMU8m6PWzi8r
         JIcp3laM3OESENcDN2DBqD2CbGBPOlka7plozZWEvFONjZLygE/UjOxNFy6KaIORDAoz
         wbP+lZRMwK6xfIDSTd5pJj3TskXoxd1MDp8SeCP5pHk804UOjM3enZ248PQTkrO7E3Oz
         giHg==
X-Forwarded-Encrypted: i=1; AJvYcCX+jxbtUJX6UhSRzJVEJ2QpBw/XVE5CflCxuV0Scx5vQywEPRE7gfTBD924qMM7tYrQi3iAEveQElcvMeGc@lists.infradead.org
X-Gm-Message-State: AOJu0YyYDJL2NcsxfVzwVQfD161ssgIDJUK2z2yRUEOMj3n6ELpsg998
	ZegYkX3OJeq5ynDP+X+tD68vRLTtuqMv+z400THiXRRZcjGPlnk+clyFl4cv3DtDWMA=
X-Gm-Gg: ASbGncvFyTWceIRGhZWzlgQ91XirXAltq8tplhZul+vCm+BVeKJptKVPjyyV7rAVayy
	BQcyWkcpLS9gEhQD8vSOmB68/maH8UWh0n34RC9gY1YQHPpfNssXFF/kZkpHqlwyV12t1v6bWaY
	Mj8hp8NRD5S7nxWI0153wAJeW/adO1CqVJkE28GZc85T/4XBnOHPq7vW4ilXFLd9t0+vgW6GNHa
	tbVtPC8Fz9fXJtMxQg6j9gU/bAgn52p9uMNmYd8UcKn2wFSVQ0NouZX/1o+OJQBKoHPWkLTwD8o
	qdAhAjxLg8b+RfMG6/FKNhKTd0v6QlizZtwsRwB82YrB1oRs3fzUa4yLhSNJVXNrJWVvW7ISxj0
	qs62psrbSMOTmvcXT657js5D6fbhdfvyVmKTkngVcf1KwM59Zcltdl8jKK+L8upWRBmEjN4bZiR
	nDPcqBLxTNOwoA2ENiqlO7hSac1zlWh3jTeVI9YxZOSgenIJfq0YQxRSpXJezy5QA=
X-Google-Smtp-Source: AGHT+IHyuINLK5MdbEyCE84WDmNGgCERjzRvEgCe7ErPY+YmW9fdaWeR1WnnEstHTpOfhgyPahtbCg==
X-Received: by 2002:a05:6000:657:b0:42b:2a09:2e55 with SMTP id ffacd0b85a97d-42b592d106dmr9359114f8f.0.1763370664318;
        Mon, 17 Nov 2025 01:11:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d631:aa74:9313:e9f3? ([2a01:e0a:3d9:2080:d631:aa74:9313:e9f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b622sm24597140f8f.29.2025.11.17.01.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 01:11:02 -0800 (PST)
Message-ID: <9df2dd4c-9283-4f3c-859e-586e1b397a96@linaro.org>
Date: Mon, 17 Nov 2025 10:11:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 5/7] mmc: meson-mx-sdio: Use dev_err_probe() where
 appropriate
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ulf.hansson@linaro.org
References: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
 <20251108231253.1641927-6-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20251108231253.1641927-6-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_011106_432701_5CC0B8EA 
X-CRM114-Status: GOOD (  16.09  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 11/9/25 00:12, Martin Blumenstingl wrote:
> This streamlines probe error handling / logging with other drivers.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/mmc/host/meson-mx-sdio.c | 30 +++++++++++++++++-------------
>   1 file changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
> index 214ce84f1ddd..052bcf8f32df 100644
> --- a/drivers/mmc/host/meson-mx-sdio.c
> +++ b/drivers/mmc/host/meson-mx-sdio.c
> @@ -520,16 +520,14 @@ static int meson_mx_mmc_add_host(struct meson_mx_mmc_host *host)
>   	struct device *slot_dev = mmc_dev(mmc);
>   	int ret;
>   
> -	if (of_property_read_u32(slot_dev->of_node, "reg", &host->slot_id)) {
> -		dev_err(slot_dev, "missing 'reg' property\n");
> -		return -EINVAL;
> -	}
> +	if (of_property_read_u32(slot_dev->of_node, "reg", &host->slot_id))
> +		return dev_err_probe(slot_dev, -EINVAL,
> +				     "missing 'reg' property\n");
>   
> -	if (host->slot_id >= MESON_MX_SDIO_MAX_SLOTS) {
> -		dev_err(slot_dev, "invalid 'reg' property value %d\n",
> -			host->slot_id);
> -		return -EINVAL;
> -	}
> +	if (host->slot_id >= MESON_MX_SDIO_MAX_SLOTS)
> +		return dev_err_probe(slot_dev, -EINVAL,
> +				     "invalid 'reg' property value %d\n",
> +				     host->slot_id);
>   
>   	/* Get regulators and the supported OCR mask */
>   	ret = mmc_regulator_get_supply(mmc);
> @@ -666,7 +664,8 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
>   	host->regmap = devm_regmap_init_mmio(&pdev->dev, base,
>   					     &meson_mx_sdio_regmap_config);
>   	if (IS_ERR(host->regmap)) {
> -		ret = PTR_ERR(host->regmap);
> +		ret = dev_err_probe(host->controller_dev, PTR_ERR(host->regmap),
> +				    "Failed to initialize regmap\n");
>   		goto error_unregister_slot_pdev;
>   	}
>   
> @@ -680,12 +679,16 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
>   					meson_mx_mmc_irq,
>   					meson_mx_mmc_irq_thread, IRQF_ONESHOT,
>   					NULL, host);
> -	if (ret)
> +	if (ret) {
> +		dev_err_probe(host->controller_dev, ret,
> +			      "Failed to request IRQ\n");
>   		goto error_unregister_slot_pdev;
> +	}
>   
>   	core_clk = devm_clk_get_enabled(host->controller_dev, "core");
>   	if (IS_ERR(core_clk)) {
> -		ret = PTR_ERR(core_clk);
> +		ret = dev_err_probe(host->controller_dev, PTR_ERR(core_clk),
> +				    "Failed to get and enable 'core' clock\n");
>   		goto error_unregister_slot_pdev;
>   	}
>   
> @@ -697,7 +700,8 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
>   
>   	ret = clk_prepare_enable(host->cfg_div_clk);
>   	if (ret) {
> -		dev_err(host->controller_dev, "Failed to enable MMC clock\n");
> +		dev_err_probe(host->controller_dev, ret,
> +			      "Failed to enable MMC (cfg div) clock\n");
>   		goto error_unregister_slot_pdev;
>   	}
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
