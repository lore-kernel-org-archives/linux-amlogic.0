Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98732C3DA59
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Jul 2024 09:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmxORae/L4Zhekb2d28Ae8PE3mRA3vqXL+gVyqE/h1M=; b=krfKxHx5pRq/1+8m+FHHuHKYsP
	Xi00RaJu3iOOzKJVF6j0OF4TJwdsRy6BZzIkYlitD+jTVe787QcDMuPh7z7tXnPtk+iX6lptuYm9w
	qZf55wnWi4v99gUVpwJ3W+aIB4w4KFUMa+ttxxAqThfJcLKpXWjE1E5Dl0u6+3RkSe9DDpVs+Er9c
	+V+9sVeVtzMY5U3ArU3Bsa+rAsDh8Vj+Xmo42d/x2TGXaKGDMJSTBS4/HZRq3x0SAOL5b0xu7nSIl
	mVZDCpZ16lyI0qTDzYDKMv2LgYZ5dQb8QOncVfuQtXhKYw6SaGIYxbkacIWCAvXd7Hi35ylaTObbB
	zHEt/1TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTeX1-00000009tML-40og;
	Tue, 16 Jul 2024 09:31:35 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTeWi-00000009tGv-28Xp
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Jul 2024 09:31:18 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3679f806223so3679649f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 16 Jul 2024 02:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721122274; x=1721727074; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/3XPgAt48srnAztLIzuoC1J0XiQCx/jCefxsjT5J7rg=;
        b=o/Dh4rijKH8chKgzlSGhUyxm8/u1NFd7qilCrMbx0S7oTn8rDM0VSDwdDpla0mxEof
         JjqQVJQu8JB+DyumEJW9P+A6hc0R0ivOc/NArJ/xQxsofvro3QjxmYYR2sz2zIZ2X01w
         33PEbiZa2RvKSYaflGPHCQl8oHxCGBchm8beHAZ6pdLXTdZTDzewLqg3UvSsgukFMXwv
         Dq9Bd4cB+1Hf4wq1u2acFmrSR03LgmO2QTeNMD4CCL2DpD/8Nap2gL0P279Mq0usqm1Y
         Ktz/dX9FYnyWvi8nRkfZqnwahxgirA1T0ZYGOY66w1i8D3Ex24304dTBhgyKT7FvlHWb
         C0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721122274; x=1721727074;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/3XPgAt48srnAztLIzuoC1J0XiQCx/jCefxsjT5J7rg=;
        b=VsecrPkvqjgviGy3K9iHHo8UIWERtxRtRkYpyR6062mT5zIfe+WCZNEt6E96i18+IO
         nvpZ4JvmLxA0dkUWRk2tUCtPUMBIVGO3iQJzVURJDdI1IlBJeAneVcKTQvmg9KTAKAzB
         9MjT5mAEsAj6CNXDDCT4cT1TudGIx+GJBYpF8bjhVCXxEiq8zstAhIx7vTCTyCY1mYod
         QN3KWyuyHCdyZXP5FVEu3hZNCJN4LAQ+4bBLWVuDbFv4mlOYqy3YoRNTFL2mbjWs+iax
         qXcuMUbNOlyvOLEN1kGK3UuT5nAUIH/DQpWovJ8R3OgSpzAJp04JIoOHQw0SzXGASttX
         e7sg==
X-Forwarded-Encrypted: i=1; AJvYcCUjmGtO5xd8KUhdR7w9ZF9E0O3wPPAeuNDnZhQsfD4oRrFSQYBktmxMDGBHNVT7V3Ob3mwmJrk5yvHecIguXj4lE5j5S71DBZ6GTkLF1SYzJEg=
X-Gm-Message-State: AOJu0YxYoXX9BAtoCeIHcgdNt52usDnNnUDuWxfKWjHjW0gUHg8LC57z
	hFb3eLTUMCAmRgtGrW1QUslVNUUw/cA1jjTMUSmves9981VmFBJRLhbtIOsiCto=
X-Google-Smtp-Source: AGHT+IEsoVQDst/Kjz0dNTZ+V2Ucj1q0C8sc7k04Z3Nnr89m+A/TxT974j0Xb0GNVhMDpxtbmTVxlQ==
X-Received: by 2002:a05:6000:1c3:b0:367:42ce:f004 with SMTP id ffacd0b85a97d-3682753bc1bmr957383f8f.23.1721122273957;
        Tue, 16 Jul 2024 02:31:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f5ba:a94c:e43a:d197? ([2a01:e0a:982:cbb0:f5ba:a94c:e43a:d197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dab3e27sm8484413f8f.15.2024.07.16.02.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 02:31:13 -0700 (PDT)
Message-ID: <56a90ea2-6bba-42ef-b615-61f8c797e09c@linaro.org>
Date: Tue, 16 Jul 2024 11:31:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] spi: meson-spicc: convert comma to semicolon
To: Chen Ni <nichen@iscas.ac.cn>, broonie@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 yixun.lan@amlogic.com, sunny.luo@amlogic.com
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240716091151.1434450-1-nichen@iscas.ac.cn>
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
In-Reply-To: <20240716091151.1434450-1-nichen@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_023116_588144_53AB5F96 
X-CRM114-Status: GOOD (  11.03  )
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

On 16/07/2024 11:11, Chen Ni wrote:
> Replace a comma between expression statements by a semicolon.
> 
> Fixes: 3e0cf4d3fc29 ("spi: meson-spicc: add a linear clock divider support")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>   drivers/spi/spi-meson-spicc.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
> index 8838a98b04c2..1d05590a7434 100644
> --- a/drivers/spi/spi-meson-spicc.c
> +++ b/drivers/spi/spi-meson-spicc.c
> @@ -655,8 +655,8 @@ static int meson_spicc_pow2_clk_init(struct meson_spicc_device *spicc)
>   	}
>   	init.num_parents = 1;
>   
> -	pow2_fixed_div->mult = 1,
> -	pow2_fixed_div->div = 4,
> +	pow2_fixed_div->mult = 1;
> +	pow2_fixed_div->div = 4;
>   	pow2_fixed_div->hw.init = &init;
>   
>   	clk = devm_clk_register(dev, &pow2_fixed_div->hw);
> @@ -674,9 +674,9 @@ static int meson_spicc_pow2_clk_init(struct meson_spicc_device *spicc)
>   	parent_data[0].hw = &pow2_fixed_div->hw;
>   	init.num_parents = 1;
>   
> -	spicc->pow2_div.shift = 16,
> -	spicc->pow2_div.width = 3,
> -	spicc->pow2_div.flags = CLK_DIVIDER_POWER_OF_TWO,
> +	spicc->pow2_div.shift = 16;
> +	spicc->pow2_div.width = 3;
> +	spicc->pow2_div.flags = CLK_DIVIDER_POWER_OF_TWO;
>   	spicc->pow2_div.reg = spicc->base + SPICC_CONREG;
>   	spicc->pow2_div.hw.init = &init;
>   
> @@ -721,8 +721,8 @@ static int meson_spicc_enh_clk_init(struct meson_spicc_device *spicc)
>   	}
>   	init.num_parents = 1;
>   
> -	enh_fixed_div->mult = 1,
> -	enh_fixed_div->div = 2,
> +	enh_fixed_div->mult = 1;
> +	enh_fixed_div->div = 2;
>   	enh_fixed_div->hw.init = &init;
>   
>   	clk = devm_clk_register(dev, &enh_fixed_div->hw);
> @@ -740,8 +740,8 @@ static int meson_spicc_enh_clk_init(struct meson_spicc_device *spicc)
>   	parent_data[0].hw = &enh_fixed_div->hw;
>   	init.num_parents = 1;
>   
> -	enh_div->shift	= 16,
> -	enh_div->width	= 8,
> +	enh_div->shift	= 16;
> +	enh_div->width	= 8;
>   	enh_div->reg = spicc->base + SPICC_ENH_CTL0;
>   	enh_div->hw.init = &init;
>   
> @@ -761,8 +761,8 @@ static int meson_spicc_enh_clk_init(struct meson_spicc_device *spicc)
>   	init.num_parents = 2;
>   	init.flags = CLK_SET_RATE_PARENT;
>   
> -	mux->mask = 0x1,
> -	mux->shift = 24,
> +	mux->mask = 0x1;
> +	mux->shift = 24;
>   	mux->reg = spicc->base + SPICC_ENH_CTL0;
>   	mux->hw.init = &init;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
