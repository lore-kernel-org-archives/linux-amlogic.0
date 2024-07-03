Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8333C31D97
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2024 10:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCWwkIlgiFq0OUXHUtJo7GtwuFiNzxflQOG760MnML4=; b=nXAM9XI4tdUmeqPG2FpKhAw+IE
	mFVlyT+vg+DgHPdNXYGcx+6JdwYiPNekz/gHaPPp8tPpizit9sYb9m5uuxIukZII80SW3Va4r0LSs
	R/ucPQYnad0eH/kYx8vrLqWkzhkOdIHDLyv5scOh5U08ZQJ2rdcJkUdYVfo4UBEag2fTEyirOYR7w
	+9+Dm/D60YIjzMI7mNTkijtygtsEphDvVEP/Pj7rOBE9uAJsm2v9IUn2xP/jadKi1R1KLjV+ZdHgD
	o2uL2t3O0VlsokKtmp4LE2mEFguxCa4AjJDEUfS2hHKVAnNx8LKgp+YKxeVDxGAfaQ5k84sNbgTIu
	hooC6Qew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxeF-00000009tvc-1Yoi;
	Wed, 03 Jul 2024 10:55:39 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxdd-00000009tZl-2IpL
	for linux-amlogic@lists.infradead.org;
	Wed, 03 Jul 2024 10:55:04 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-424ad289949so37893425e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 03 Jul 2024 03:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720004100; x=1720608900; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39lfOtZEVbcBoFS5FGsq6qRJkxvsQmXq431HRSu2z/o=;
        b=C7BKwMFG04vJp9AIrjjj4u+dtrXUEXNFxr/S2/gBYFooyOtTl4e6q6XX1hHmhcEFxC
         IhRFrjQ1KmY6V10oA2LjIagWKDhJTH1M4ZPxI56zNStidx7P/4SetP+1I6YbdpCd2zxY
         FLUuSXK/J5IFmcBhCzoIt2H6aJ5MXF6X3vjXrW+icsJCJsZbKmurNof8tLBvxT13UJkg
         vBav9DFgLlZJu2G+P/5oKcI3xstdvcVR2rv4WRV2Y5iYitxB6MSiA4TyMZ0QorKAyCTa
         frYFDd3vfRl8mngioXeXI+vjMwuOqTX7wTlJ0rhwjyqPsrVwT//5lWKsGdFCcldKt2uP
         rQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720004100; x=1720608900;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=39lfOtZEVbcBoFS5FGsq6qRJkxvsQmXq431HRSu2z/o=;
        b=OpnUX9Gpdv0i6nv7L/g3drMYQX5NsySRaavgreKXgvYzD/pGXZTTeaDNOS+9hvGUdg
         3XQPyUy28SgZQQSZlHPRaXp/a3juLzNUFGFRYadhYnzwiv0J6TjOW+flzUTShrmU+uJl
         JxtPqYvpATpf1m9PDc2t4R7ZdwwkrXOQaLdNVOhstmJzSHlY6NaLvaLqPLOguWjIwt30
         3o7m5CoW2ic3m6Jv+F2UX1mxDwRNluNfSlxNgPZAECOiE7OrAV/Rjb9fCCGclpCm7B+R
         XHuUqmbn80yXeo7UMX/P0YRvMWxjK7XHS6/r+bm9izCARBXwz2FkGsCkjxQc0BmJCnMF
         V//A==
X-Gm-Message-State: AOJu0Yx9/WtrlD5Cz/sp/msPMgK/P3abai2M0QwLqoXSTMWXsLxK1UmF
	CAq9uB20bDRuFx+70ocnXfcRguaJOFc8PqA2VmR8wQ+yxwxpxnarlXc4M5WShm0=
X-Google-Smtp-Source: AGHT+IEcN08kGTuo+p8lg5Oe+R73RxZm6SDE437gKhrh99xNbgW0DEafkie8T38BqJTZPAXiHtGA0g==
X-Received: by 2002:a05:6000:156c:b0:367:4dfe:3e8d with SMTP id ffacd0b85a97d-36775699ed0mr7406301f8f.13.1720004099586;
        Wed, 03 Jul 2024 03:54:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ef03:73b5:7503:ee71? ([2a01:e0a:982:cbb0:ef03:73b5:7503:ee71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fbbfesm15660302f8f.66.2024.07.03.03.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 03:54:59 -0700 (PDT)
Message-ID: <7227a1ff-8383-4250-8336-79e058efc583@linaro.org>
Date: Wed, 3 Jul 2024 12:54:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 06/10] clk: meson: s4: pll: Constify struct regmap_config
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
 <20240703-clk-const-regmap-v1-6-7d15a0671d6f@gmail.com>
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
In-Reply-To: <20240703-clk-const-regmap-v1-6-7d15a0671d6f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_035501_951057_9CCCE858 
X-CRM114-Status: GOOD (  13.20  )
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

On 03/07/2024 11:50, Javier Carrasco wrote:
> `clkc_regmap_config` is not modified and can be declared as const to
>   move its data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>   drivers/clk/meson/s4-pll.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
> index c2afade24f9f..27c10fc499be 100644
> --- a/drivers/clk/meson/s4-pll.c
> +++ b/drivers/clk/meson/s4-pll.c
> @@ -799,7 +799,7 @@ static const struct reg_sequence s4_init_regs[] = {
>   	{ .reg = ANACTRL_MPLL_CTRL0,	.def = 0x00000543 },
>   };
>   
> -static struct regmap_config clkc_regmap_config = {
> +static const struct regmap_config clkc_regmap_config = {
>   	.reg_bits       = 32,
>   	.val_bits       = 32,
>   	.reg_stride     = 4,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
