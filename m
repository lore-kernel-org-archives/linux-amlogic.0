Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A83C48297
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Feb 2024 17:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMzSK7KyWM0t2zFt7w0aYnohGXpAdw+t0+qKg4YOtu4=; b=y5bT+hYsXYLYWVLBYgdOfzf4hH
	6p9DFR3SyqYlxMAwmKk9mtq5FWTHP9hRqXFlBgVn5jEkRjxJCZNDUKJHG0KQVXCKJklGAvMFneG6F
	30pXsTtQTJS5Id17BDLKJ+MeF+zH8pibd7ncowZZAKOjR6kjmXiH19WdqI6xSsog3jdH5KPCMTsID
	tKXN0PdnM4rhKBgCl01LpR+ZrJ3T/oPYMvgK6xO4TZ7QsMgNT7xn9cTfYgNrAGjVSg8ktFhG6WI3X
	LCMOyuHMW4KbKAytPvS0UYuXVZakyoJr7RGhI1AEqv6/7RBud/HjsbKO6aI41wZuqZBhiqS/pUgFw
	EmBi3o5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZqS-00000006N2I-1x5p;
	Mon, 12 Feb 2024 17:11:52 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZqP-00000006Mz9-2HxJ
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Feb 2024 17:11:50 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-33b28aadb28so2206744f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Feb 2024 09:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707757906; x=1708362706; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVnKk/5FnfiICNJz+devKSEGOObsIesF/dGQJ+bTx3c=;
        b=gViD0RKqT+pCWPG3E+oJ7PL4DjaSxufIrUypT3YZA+HyYGx1y7hjz2xuymvezGCXYb
         uVFdKKHAudyOEinvKbIkxpnvnG4zsL8gNWtkuM7VqMKqiIxmQ039UZcoPcRDWhQcaHZF
         IFl1n/Oixz+BrwDpqoHpeqQs/q7tz74h2ArcY5Ih8BMrvvjdo/SsBvcR7vwd+GfARFII
         1tSUfj8KhZDfsS2yMyHn6iiQ8O200NYBBjuG5UR0GAu6qpH69J6j/p6fQhUPUpQyK6F/
         /AduP1sGxUZwLH47MDXAopmekQosEpHQxJUNihmINuiF5uadsiZSkm8bl2eDolQ63OmL
         WsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757906; x=1708362706;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eVnKk/5FnfiICNJz+devKSEGOObsIesF/dGQJ+bTx3c=;
        b=raFOmX8ONJcY4PJp5IJ12WGYJZ8p6I44Wsi7z5v5bjjp9Z9zj1DRWwZBaTKwQ5Ljwt
         0i2BeUIYwFFTHuqsy9kV/2eEjCyicPKXQ6Unq5nu5ew2fhfFBfX+cChG28dMcicLW2bo
         bt3w1P9YAT7RMGV6GedwqI9VWrk7qFANAdSgME9eX/+hNzOYa/M3VwB2gAAatfb4CTLc
         LcbCzS8g8XMYl7mPCvwprgIDjcPZS8CdsBO5tZOW66M509mTnf/stV1tQ1AvkhP+vXGa
         XnSGxgeFbi5PHQr+wQlKLuK7Gqp06X7J1a8uKCR/Gl09/3JJQNZlLMCNyuTJLHiBhi6n
         +nLg==
X-Gm-Message-State: AOJu0YzKpWHDJrHsUGnpZm/Nuwdi6Rw5Dz38977gz9mA++YTs7QkpPW8
	FJwDPlFaNIRzLyNW5/Mh13z7tlXxLT1ZfKdy186Kvvjo/0yj5rpXD5vFAhdB7yY=
X-Google-Smtp-Source: AGHT+IFDyA3iUozb7O4U2GHtBdZnEM2GYv8Nn3cefwc2OPHBrLiZEfC59GkTOu5wa+sUrLRTx1u+SQ==
X-Received: by 2002:a05:6000:120a:b0:33b:6369:6485 with SMTP id e10-20020a056000120a00b0033b63696485mr4649346wrx.24.1707757906192;
        Mon, 12 Feb 2024 09:11:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWcj4BaboNfVdwv9LDtaSrk5oLkki+VTqOdnwarKJmJHX1HpzGqW0aLPCEIggG9gFU1C1SnlCQYPQloRYRJMJLicBFHps1J/ZI2ZYpEm/AVnK7qYVPWzXlbjO4FHjOAs/50IHWvYq1Vkz4nk0JzhMoUbRzJnGCaNT5OQQU3iJEmaN9+8tvPuYwqyTrwXJr1Pc18saQOFL3JMYBWasIUoTI7g9vSuoTBzNjy61dlYEdWmITF2nQ15NuYXH4lrKM7b/Vy7f/WPIZqngAjZm/Xd6Pw/k1Tifbr9U0b+9ka2n62HKz0AgpTyRwJVTHeeyFxCDJaLO82gbygzxTHWj+FQyTwqN1Y50FdqWqlXPONyZmA2cpAmJGhWe/zdCjtFXRU8gLGRWIScfgQ1xGUQnAFP+dtVTqQkHSNE9tWVq0ciCHry4xx3cG5LXQYSk/ZA2BPO7NCLROsuQW1/yuywyGqgmmIHu9Qi5XsBUgU0fcKcluDcGhCn3udY+/4anqCKTXztN1lsqR9vInWo1IXj6W3dFwOsaZzQXDgn7vN/pT78gKsD1K+XcKb+gHdyHotkaIZeMyGBLuC7dWlrhW1TmRj/349Z1AUiZ7twtDG
Received: from ?IPV6:2a01:e0a:982:cbb0:fcee:f026:296d:135f? ([2a01:e0a:982:cbb0:fcee:f026:296d:135f])
        by smtp.gmail.com with ESMTPSA id ck13-20020a5d5e8d000000b0033b684d6d5csm7440536wrb.20.2024.02.12.09.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 09:11:45 -0800 (PST)
Message-ID: <3c0b7daf-29f9-4569-9aa3-fe8f381de821@linaro.org>
Date: Mon, 12 Feb 2024 18:11:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 05/20] drivers: crypto: meson: move get_engine_number()
Content-Language: en-US, fr
To: Alexey Romanov <avromanov@salutedevices.com>, clabbe@baylibre.com,
 herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, vadim.fedorenko@linux.dev
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com
References: <20240212135108.549755-1-avromanov@salutedevices.com>
 <20240212135108.549755-6-avromanov@salutedevices.com>
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
In-Reply-To: <20240212135108.549755-6-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_091149_617354_097C211D 
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

On 12/02/2024 14:50, Alexey Romanov wrote:
> Move get_engine_number() function from cipher.c to core.c
> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>   drivers/crypto/amlogic/amlogic-gxl-cipher.c | 9 ++-------
>   drivers/crypto/amlogic/amlogic-gxl-core.c   | 5 +++++
>   drivers/crypto/amlogic/amlogic-gxl.h        | 2 ++
>   3 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> index 1fe916b0a138..18e9e2d39b1f 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> @@ -17,11 +17,6 @@
>   #include <crypto/internal/skcipher.h>
>   #include "amlogic-gxl.h"
>   
> -static int get_engine_number(struct meson_dev *mc)
> -{
> -	return atomic_inc_return(&mc->flow) % mc->flow_cnt;
> -}
> -
>   static bool meson_cipher_need_fallback(struct skcipher_request *areq)
>   {
>   	struct scatterlist *src_sg = areq->src;
> @@ -282,7 +277,7 @@ int meson_skdecrypt(struct skcipher_request *areq)
>   	rctx->op_dir = MESON_DECRYPT;
>   	if (meson_cipher_need_fallback(areq))
>   		return meson_cipher_do_fallback(areq);
> -	e = get_engine_number(op->mc);
> +	e = meson_get_engine_number(op->mc);
>   	engine = op->mc->chanlist[e].engine;
>   	rctx->flow = e;
>   
> @@ -300,7 +295,7 @@ int meson_skencrypt(struct skcipher_request *areq)
>   	rctx->op_dir = MESON_ENCRYPT;
>   	if (meson_cipher_need_fallback(areq))
>   		return meson_cipher_do_fallback(areq);
> -	e = get_engine_number(op->mc);
> +	e = meson_get_engine_number(op->mc);
>   	engine = op->mc->chanlist[e].engine;
>   	rctx->flow = e;
>   
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
> index 372c30f72072..51291fdcf8b6 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-core.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
> @@ -23,6 +23,11 @@
>   
>   #include "amlogic-gxl.h"
>   
> +int meson_get_engine_number(struct meson_dev *mc)
> +{
> +	return atomic_inc_return(&mc->flow) % mc->flow_cnt;
> +}
> +
>   void meson_dma_start(struct meson_dev *mc, int flow)
>   {
>   	u32 offset = (mc->pdata->descs_reg + flow) << 2;
> diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
> index 59fc6a67e0a9..5f5e3115fcdf 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl.h
> +++ b/drivers/crypto/amlogic/amlogic-gxl.h
> @@ -163,6 +163,8 @@ struct meson_alg_template {
>   #endif
>   };
>   
> +int meson_get_engine_number(struct meson_dev *mc);
> +
>   void meson_dma_start(struct meson_dev *mc, int flow);
>   
>   int meson_enqueue(struct crypto_async_request *areq, u32 type);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
