Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B75D29DE6
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jan 2026 07:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXmUDG+v9pPdxfKZsBDmoreKA7gOZhpex+g5i0GF2Lc=; b=iCL2iKTIspcbn3ZjEC/hICtDPM
	EYDnwuVZol9zDLdNUb2YArWgwgV1+cSaQP4Gv7xz2tagq5i4Olz6y5PLqE72lthqcqFOPrO60hg2N
	suiErQNIw55Hn1mOjDoz7K5uJ6HUsxOcy1Qaqix1jcP+uNEJH1gBuiLpFkT4pSP/3uq50ZSqAp+36
	XLRhrueXTToBuu8CH1mXpOs15kKOo0eQDKPPv8x3LPAZgVdeN5AYfa/QCjbvJGJ9Zvoki6tYqpQvU
	+BJvQUaW88yf56bZ69etcS2nZBHEisJJWByCJGqvMoYy1YDumTOlyp5GLkQbeglPfHou5Ss1KQqsc
	zRLkWgZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZF5-00000006ggL-15xi;
	Tue, 13 Jan 2026 07:55:07 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZF3-00000006gfO-1emD
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Jan 2026 07:55:06 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so60411885e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Jan 2026 23:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768290903; x=1768895703; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eijFqczmsPk9MPlDfVNySSvCNlkASVVdL2mGEYA75kE=;
        b=ustXma9EGM6dykqfFQ835b52+Q8T55UCHcQfgf5Tl9zUgXa6cYSVh4nT1Q5+5FLvHf
         LGAtKXwR+kt9Rf5FqI9Eo03Nz98qveSwTnW4Nfu4zcmQ/kLgP7N2wcrp4f0hZxq5uwN3
         bwOz1xmi34C75TqpcLt7J83Iegtw5HVQPc/2gYEI7noCRxS9sRIXxz7le55a44SsgeYb
         2j93A40BhxKZJway+ZT+cahW9Exe+efawHBHXihqcUASS5lajmZEw77/ttgd9f93W0oS
         FpNvo68yrZKvuOmpdvhzv7Y4tSREurIrhxGb/u4wWRjcaERDEal6hKKr/UEGz4WeUP9a
         hweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768290903; x=1768895703;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eijFqczmsPk9MPlDfVNySSvCNlkASVVdL2mGEYA75kE=;
        b=X7XQXW/W2xULzgvmJ+ksDE7DukDzJyMN6DqtUlJcWiBSGumruWpquBYYWpOfE38GOI
         Q9MBLNdXHOb87zJYL0uzNR7WdqagwDYOFjgw5XBadIHTjngmlS2gH1EKT1ZK5NyZwfS9
         VcG8VfP8/hFy+WnSQbYSG3qxo57LbMMX50ipOEZvsnMNNf29i2whayRCSDhgcFkvJLNQ
         7x1VP5KHw0sBmVa4UrE361YepjnWz85LKvpBi48Z1FEy+iQdctbDqhj1JQVysV99bsEF
         cmzTetq26WNG6CA3Vs/WK/llc8kAP7j+NXl4ZgMD4ewR7XJ+dVJd0BzDjzdG9vtSMCPk
         Hdxg==
X-Forwarded-Encrypted: i=1; AJvYcCXicas6fX7HYVblMh1W+7a+H+bIwOjecGRssbuNFpAV4mwpR/a2+NxRvbEyDn2U5D+Mch2jTy5B5Cdn5IhR@lists.infradead.org
X-Gm-Message-State: AOJu0YzXVxkS4Y8aRugNpQXKp2d1w8qNaaojiLMvHF12N1zPEiZnbdHw
	M/GEPT9JyjJGNV7wmppp+ITBFIV1RFKxj7igJY0ZoB6JaCd/+7j9rUtt6ld/Jok5s0w=
X-Gm-Gg: AY/fxX7qyt7q/RhU1UfKju9Q6o8fT2ht8nC1/RcSKAjNNk8vfO6gPZOdrt8Ioi0Cr6i
	FqSrPqrH1h/qivhy8bge0ztEkveWRUklFix5hKDFxaohQK83tvHfQsrTV9bG2CuAqfYFZSQx9fM
	d6+algvBhCluX+rpccJ5PLDPdd+ejR6u03P814bavkuX7X0dEMfE9bP+ubRckoIFlKF8R0St7vl
	x2upp+hY7QFSJsbUF2u3ld7naQWA0rMkSXEqof1WXqLClBOxJQadepSbMe9z0CiXCbnx4WVYca/
	pDbzzLfgbxQPlF0XRIZw043gsjZ9oDjOs4afZwozkGNnQKZgreoTvKI9f4WwcnUhViIatMG4WCV
	MMkPwCf2XvhX2w5z+0/t83Z7KAEfbtP+F8YTgHcfETNPJpXpwid6ZopoM0LFd3aC5eR1UaPItWx
	TAftpfT1mpsQdecdiJJCZx1xSs2OpvNUc6x1zvI6o=
X-Google-Smtp-Source: AGHT+IFN74bWtZPOCScSbBi7PnxGhyLfB4NvuJZ3+q3kqOYASMddRBG60d2lYlI5dJlRurbQy8o5Sg==
X-Received: by 2002:a05:6000:186b:b0:42f:ba58:6599 with SMTP id ffacd0b85a97d-432c37c8efcmr26087165f8f.35.1768290903340;
        Mon, 12 Jan 2026 23:55:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080::fa42:7768? ([2a01:e0a:3d9:2080::fa42:7768])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5dfa07sm42626768f8f.25.2026.01.12.23.55.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 23:55:03 -0800 (PST)
Message-ID: <841b9304-c905-4201-8852-e372d9813934@linaro.org>
Date: Tue, 13 Jan 2026 08:55:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] soc: amlogic: meson-gx-socinfo: add new SoC id for S905Y4
To: Nick Xie <xieqinick@gmail.com>, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: nick@khadas.com
References: <20260113012527.40725-1-nick@khadas.com>
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
In-Reply-To: <20260113012527.40725-1-nick@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_235505_467338_8A2BAB7C 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

On 1/13/26 02:25, Nick Xie wrote:
> Add new definition for Amlogic S4 S905Y4.
> 
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
>   drivers/soc/amlogic/meson-gx-socinfo.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
> index 2a54ca43cd13e..dcb75baaff247 100644
> --- a/drivers/soc/amlogic/meson-gx-socinfo.c
> +++ b/drivers/soc/amlogic/meson-gx-socinfo.c
> @@ -85,6 +85,7 @@ static const struct meson_gx_package_id {
>   	{ "S905D3", 0x2b, 0x30, 0x3f },
>   	{ "A113L", 0x2c, 0x0, 0xf8 },
>   	{ "S805X2", 0x37, 0x2, 0xf },
> +	{ "S905Y4", 0x37, 0x3, 0xf },
>   	{ "C308L", 0x3d, 0x1, 0xf },
>   	{ "A311D2", 0x36, 0x1, 0xf },
>   	{ "A113X2", 0x3c, 0x1, 0xf },

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
