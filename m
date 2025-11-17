Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5805ECEACEF
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Nov 2025 09:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTtAXQpcN+XHJdJ5S2IoomDdXxeRuN7f1xjgnI6oZzA=; b=ZYj/89UhlS/rkyw3fiOQc8fZgu
	TSgW+aDtqsnuRogXL1n5Yco6wjd0agbIFJSEG+lTTI4rAPSR9iXAMACydyc1OFd+R6VZ1w+MYE8tu
	gn33CdlQoC/IeUHD8zyIpMM1jqkZ/3kq4FrfDyoEjtMEyqDvipBmTC8jDVfUbtazvAGSMrEZNKqzm
	MFILDXraBfvd4IXrSEz0hoW0AhpyC3c951zxf1xvV4VuN3xp352owJRTppPxQZ+GpFMzCLxO9NwwY
	p63wl7AE98BhxpmdYTvVNjXkr5yuHfLiZXZFMwyVwRe3fGnOw5nyLeOl7u51kr1oXHdoHGzFCHdM9
	UXziGGSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvEn-0000000Fkqj-1SEr;
	Mon, 17 Nov 2025 09:09:29 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvEk-0000000FkpR-1l0k
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Nov 2025 09:09:27 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47778b23f64so27340585e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Nov 2025 01:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763370564; x=1763975364; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hNklcNl/h84G0BAPSH5Ap/sAnFYDzlujPx7lPybvZNg=;
        b=cGUHvGqkaVKZpFfX21Lw3hQ3REodJzmHirSvMgJduDhrK1DoUf+2i1owg7Q1E5IuC4
         KFMYVlYCy+J7VCovhRLsXw0v8GsD0x1JmrRWgkyNaYMhxCuPhlwE8D99gb+WU07C3dGf
         vQbvXDOsxCJtcCFWXGd0C+nbcXkwPjVY84IuCUL1GWVgOS+M+VRg2lO/L76P+/doapzY
         KbzuQjDsIKAMukSyAWD3S4E1kJEimcatbYXvGmejqx44R71bZQp0gJX8d2eYjJrCLbru
         Od+I6c4mYTrr1U1GVMpf4NogBQmIy5xyhLHt6MoGXTr3eVwpfLLjuxFj4tQsvlwhtaqX
         Qc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370564; x=1763975364;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNklcNl/h84G0BAPSH5Ap/sAnFYDzlujPx7lPybvZNg=;
        b=wiC7kkJ6UUQRiJwiJYDh4UjDpIXHgclUXnBWbIMwfrwibwcXz/cRJiE9SWvAtd9ldV
         jGmr66MkW7dXt75VD79+9ZS9AoDjGIPlYBPlz9R8PoRsUm5p1TpD7NAfPc5hyOoU4t92
         MYlLy4q0B4/02dLiFIvamviCuAuo8WzWcQjV5XVwnNwnkWM0OFq+ubwCxnsQkIO22Bdd
         1zWNVqeeoRigHcFnFt5JbMXTRSrQAceIUWcKulNZWa6GNYvJ0cuNdF0C537YPE23t8u+
         O4YZtkIyOula0LFvwGRvX8FcJkt2u4yuOixhf0VzBvhLmXUp4v3u9Nq0EBlvWZG3rWDK
         5zFw==
X-Forwarded-Encrypted: i=1; AJvYcCUkbYaE1blKMrB2eP93wJsqhSFhVjgEljzuKcjXR/oZu/E6xk8QACxBH10vtct9I9bT19paSI+rMHc7GaMR@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/+HxdFesK5/7MBtmkxn70jGmXMKNInOrMURKv5P/8saTlNHaK
	8UO5fTMuT1TH95CqdvKh8bge7ndPsdOfipUHDBtxo+zfxGFmeVIN6P3EHack2sZyJJg=
X-Gm-Gg: ASbGnctnxn5wWgX/qa7Ooe2ekE+cKmnxiVQ/GtBJZ8PqXQKgdEliOH+3sNtZoSwQ3kT
	xEuD0P5ZvqTkDWCWVx3LEk4uqWO29voXGRWzzDucjAR+JsXAQK28+p89t5cE6xbRYD92O+jMQuP
	VqDs6V2yeknChjHWCKih6Lj+Q0j3f6hK97wCgub36M6bRAqL/8m7FM06DUUk3D19MeejSdLn3dA
	msFdleoEnL34WbYCNHt3e5UQRjFWOskweLXXnwk3K7p6y17Y/eq8DzUmLj2S7S2/8HpMCkmlxw7
	8K/Yhv30qCiU+wVU/Gf1xQWvG/tc1fbhh8xy6TppLNwTLCrifzl6dZNZ07/1v28wm1zB5l94uxi
	UUaKonPKFnIp1VVEBtUmc8oBGoal3dROARj7cav30Nl+5Ax6hsUUMG4YfPBdzQ88MpZxwTbFSus
	9h8eGD3RAmAVBmKCPd3j+/J838qbQ9J4Tqs3RfS3TcWmi9oVsbNndT74YTm3LE1Rk=
X-Google-Smtp-Source: AGHT+IFEqkwxSjllnBhN7jZwXn9JEstugFlfcv/0lGieX2lTDkq55U3llo5HzCc4RWdNNcS783EXgg==
X-Received: by 2002:a05:600c:4712:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-4778fe9b36emr102254505e9.24.1763370564404;
        Mon, 17 Nov 2025 01:09:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d631:aa74:9313:e9f3? ([2a01:e0a:3d9:2080:d631:aa74:9313:e9f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787daab3fsm322893365e9.0.2025.11.17.01.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 01:09:24 -0800 (PST)
Message-ID: <5d6d8e57-a660-4b9e-9fc1-f074551f1d89@linaro.org>
Date: Mon, 17 Nov 2025 10:09:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 2/7] mmc: meson-mx-sdio: Use devm_clk_get_enabled()
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ulf.hansson@linaro.org
References: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
 <20251108231253.1641927-3-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20251108231253.1641927-3-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_010926_496030_324393F3 
X-CRM114-Status: GOOD (  15.41  )
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
> This simplifies the code. No functional changes intended.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/mmc/host/meson-mx-sdio.c | 23 +++++++----------------
>   1 file changed, 7 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
> index 2448f21bd683..1159cc911359 100644
> --- a/drivers/mmc/host/meson-mx-sdio.c
> +++ b/drivers/mmc/host/meson-mx-sdio.c
> @@ -103,7 +103,6 @@ struct meson_mx_mmc_host {
>   	struct device			*controller_dev;
>   
>   	struct clk			*parent_clk;
> -	struct clk			*core_clk;
>   	struct clk_divider		cfg_div;
>   	struct clk			*cfg_div_clk;
>   	struct clk_fixed_factor		fixed_factor;
> @@ -627,6 +626,7 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
>   	struct platform_device *slot_pdev;
>   	struct mmc_host *mmc;
>   	struct meson_mx_mmc_host *host;
> +	struct clk *core_clk;
>   	void __iomem *base;
>   	int ret, irq;
>   	u32 conf;
> @@ -676,9 +676,9 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto error_free_mmc;
>   
> -	host->core_clk = devm_clk_get(host->controller_dev, "core");
> -	if (IS_ERR(host->core_clk)) {
> -		ret = PTR_ERR(host->core_clk);
> +	core_clk = devm_clk_get_enabled(host->controller_dev, "core");
> +	if (IS_ERR(core_clk)) {
> +		ret = PTR_ERR(core_clk);
>   		goto error_free_mmc;
>   	}
>   
> @@ -692,16 +692,10 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto error_free_mmc;
>   
> -	ret = clk_prepare_enable(host->core_clk);
> -	if (ret) {
> -		dev_err(host->controller_dev, "Failed to enable core clock\n");
> -		goto error_free_mmc;
> -	}
> -
>   	ret = clk_prepare_enable(host->cfg_div_clk);
>   	if (ret) {
>   		dev_err(host->controller_dev, "Failed to enable MMC clock\n");
> -		goto error_disable_core_clk;
> +		goto error_free_mmc;
>   	}
>   
>   	conf = 0;
> @@ -715,14 +709,12 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
>   
>   	ret = meson_mx_mmc_add_host(host);
>   	if (ret)
> -		goto error_disable_clks;
> +		goto error_disable_div_clk;
>   
>   	return 0;
>   
> -error_disable_clks:
> +error_disable_div_clk:
>   	clk_disable_unprepare(host->cfg_div_clk);
> -error_disable_core_clk:
> -	clk_disable_unprepare(host->core_clk);
>   error_free_mmc:
>   	mmc_free_host(mmc);
>   error_unregister_slot_pdev:
> @@ -742,7 +734,6 @@ static void meson_mx_mmc_remove(struct platform_device *pdev)
>   	of_platform_device_destroy(slot_dev, NULL);
>   
>   	clk_disable_unprepare(host->cfg_div_clk);
> -	clk_disable_unprepare(host->core_clk);
>   
>   	mmc_free_host(host->mmc);
>   }

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
