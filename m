Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD105C4829C
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Feb 2024 17:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74584Li861rAQqGhYLWHYiX8hPltNY+y2fBMgdAZgoA=; b=tldG6tUuVDnwq9eWiZmd9O9dvl
	xmWany0CcAwk5zdCdhGz099cOjiHIrxF5NCpyaSIAi/yz7KoE6cnyex2sGwiK/Sqx/1Plp+Y/J7p/
	q6BfHW7xCRak42pAh7UnP4Noj0cUf0SdhZPWoCCiPV3e78ag07rn06UmVjhjmdle7iu0q6ZYb5Vd/
	qRRBoCVm7lvVr8uNg1+r9JJ1QhW+VOMNtJYczHG24h/plfNl8dDNAtUYM8E33vJdvIOL5gSNo4bng
	o1TX4dq/fQusFzT9vKZQosf49qDtjwzLGnqe50emAOg+PLYYYbuzcbe4itOkrXgpv4VXVj0HdTiY3
	YAUiElcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZuH-00000006OQa-2vKn;
	Mon, 12 Feb 2024 17:15:49 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZuD-00000006OOZ-4BpD
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Feb 2024 17:15:47 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-33b18099411so2042684f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Feb 2024 09:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707758144; x=1708362944; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TCXHNKWb/+6WoCF9TfRpEBDgQbEjGvXi9Ab6Kdl3ZDQ=;
        b=ocT5tgS8rsLLuTp1YrWEuvCiziyHUT1mxBWJMtnDoFjm1eSqUwFsPoF5oTaQm+8WZf
         d3YmvQE12bjUi0/e0zPo3xhtP5vDVCfBmFfJNt3zuXArRYV0puFGF9oMXCmM2/Cz5ti4
         97qlyLTBsRBGACvx3AsOQBhVur4Pbnm++S6WRgOIf3vvhTuyjmwu0MW4BZpsSynn+zXU
         Rv1iXb3D6EOxVY4gbqSa5BUPU6ibMRjvJqQ4q787uhyLAhCCTu1c237l0qEj5T2i3TTm
         WooAPfS+LnmB2IMe1kd1OE4FUF30cXcEoyppWqNSCd0yi8KtlRt5zs7MBml32tdYq62F
         GBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707758144; x=1708362944;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TCXHNKWb/+6WoCF9TfRpEBDgQbEjGvXi9Ab6Kdl3ZDQ=;
        b=D4qVnS9n3Ji1DvfDx+4h9tOoawb0H104qgzwRPRjaMx8uEsZlJXGP2yYy00YXX8/zn
         bGRH2BQ3wPFIeW9Mpx71t45VM7TyYZDF1vxoaTRnkh0ruuOhO7VYmK3gcY2Zg3GjH9wc
         YK1EhtKpSDftirBqbhOqtK7qEztxIaPoxhVHLxf1Dc9ZzVQ0xYCcL6OvnMZwe+eZnZWQ
         SN1UV4TZjmsi/rzsvSCjHdOPy8NBC/fsHMXE/YkLxy1DBBWepsvpPsz/yHWA4jmX94OJ
         Hz5q1GMWwF7Hn49K7dg3ge8pO3uekYpRzNhpd/SAPb77oXwokoyve1zLQoQe6yrAXBmk
         K+BQ==
X-Gm-Message-State: AOJu0Yz9Xdd/9+wUJanSFc3M4QXpHMnk+OSUeUNhzYLPMetoFJDYr78s
	PrG7Kt9SNGaTUQ3PLf8VcofBJwpwSGjkWtSuriHObhpc/r00FQyPDYcAgafmAXE=
X-Google-Smtp-Source: AGHT+IHzQ9zTdthpvCnOzgP62HW4KxrLxqq1RILsJAdLbNvnSUyVf50VHm1rR0AuunzqPoBvZq7Ytg==
X-Received: by 2002:a5d:69ce:0:b0:33b:7134:a3b0 with SMTP id s14-20020a5d69ce000000b0033b7134a3b0mr4505799wrw.13.1707758144612;
        Mon, 12 Feb 2024 09:15:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW6Zt5xGHtn0aO0cbHV0aGF7RNvEVbzEGaAXJX2mSHAmtpL9hz+vYfmtFNGqStaC22mv44bRhjSbpubmpfEiwscyp+W0HRi+WuwjTT/6aIBB93yZ5bMowJx8fcGSRA0GpHRiQtc4c08Kcw7iaZa3dkdD9H2q7yqy5YM3/kAEekeWtWDAZYv5Mi8EiOfni97ZiHcXbiGYWUlRfy4AQTOxDplW+FWknAK9+iOGtudd9+QD/RCgHdjFyZGT1yr70wL9cNtNz5nLXyXqx9C7gGU9C0HszM7fKQJ85nV6lydm9YAGKZE0QfcbXbA5AYkOOFwb2ZMZCEUl0xsgqyQrL9ReE8F3ERezd2JdTcQb49LeoV9wyWitrifkruKzfZLzLykebYmF1kvIUwq4vtbrmTzHQO55VfHqn/Si9d6iiVf8vTHrIsgkF6iVMKJGq9o/PBgq9sh4wdYn9Si0LIc2t3peHgjyjhlPzlDwGDqKGqKVfl2jEzp42Cc4B8fLTxuekT52VDeO1Gc+UAHcRnDuskNaSsqFqjl4MAkPXFcuzH0RHWdAx0793JpK7QOGf2zCQfZhPdze19pBPfMsBOmpRf9hCLWQbGrCNrC84bl
Received: from ?IPV6:2a01:e0a:982:cbb0:fcee:f026:296d:135f? ([2a01:e0a:982:cbb0:fcee:f026:296d:135f])
        by smtp.gmail.com with ESMTPSA id e9-20020a056000120900b0033ae54cdd97sm7275866wrx.100.2024.02.12.09.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 09:15:43 -0800 (PST)
Message-ID: <92397728-d763-402d-b3e6-f4edd6f71740@linaro.org>
Date: Mon, 12 Feb 2024 18:15:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 10/20] drivers: crypto: meson: avoid kzalloc in engine
 thread
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
 <20240212135108.549755-11-avromanov@salutedevices.com>
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
In-Reply-To: <20240212135108.549755-11-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_091546_111254_02583902 
X-CRM114-Status: GOOD (  19.67  )
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
> It makes no sense to allocate memory via kzalloc, we
> can use static buffer, speedup data processing and
> don't think about kfree() calls.
> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>   drivers/crypto/amlogic/amlogic-gxl-cipher.c | 26 ++++++++-------------
>   drivers/crypto/amlogic/amlogic-gxl.h        |  6 ++---
>   2 files changed, 13 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> index c1b3569a614a..3f42b2cc568d 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> @@ -91,7 +91,6 @@ struct cipher_ctx {
>   	struct skcipher_request *areq;
>   	struct scatterlist *src_sg;
>   	struct scatterlist *dst_sg;
> -	void *bkeyiv;
>   
>   	unsigned int src_offset;
>   	unsigned int dst_offset;
> @@ -156,8 +155,7 @@ static void meson_setup_keyiv_descs(struct cipher_ctx *ctx)
>   		return;
>   
>   	if (blockmode == DESC_OPMODE_CBC) {
> -		memcpy(ctx->bkeyiv + AES_MAX_KEY_SIZE, ctx->areq->iv, ivsize);
> -		ctx->keyiv.len = AES_MAX_KEY_SIZE + ivsize;
> +		memcpy(op->keyiv + AES_MAX_KEY_SIZE, ctx->areq->iv, ivsize);
>   		dma_sync_single_for_device(mc->dev, ctx->keyiv.addr,
>   					   ctx->keyiv.len, DMA_TO_DEVICE);
>   	}
> @@ -304,6 +302,7 @@ static int meson_cipher(struct skcipher_request *areq)
>   		.dst_sg = areq->dst,
>   		.cryptlen = areq->cryptlen,
>   	};
> +	unsigned int ivsize = crypto_skcipher_ivsize(tfm);
>   	int err;
>   
>   	dev_dbg(mc->dev, "%s %s %u %x IV(%u) key=%u ctx.flow=%d\n", __func__,
> @@ -319,16 +318,16 @@ static int meson_cipher(struct skcipher_request *areq)
>   	mc->chanlist[rctx->flow].stat_req++;
>   #endif
>   
> -	ctx.bkeyiv = kzalloc(48, GFP_KERNEL | GFP_DMA);
> -	if (!ctx.bkeyiv)
> -		return -ENOMEM;
> -
> -	memcpy(ctx.bkeyiv, op->key, op->keylen);
>   	ctx.keyiv.len = op->keylen;
>   	if (ctx.keyiv.len == AES_KEYSIZE_192)
>   		ctx.keyiv.len = AES_MAX_KEY_SIZE;
>   
> -	ctx.keyiv.addr = dma_map_single(mc->dev, ctx.bkeyiv, ctx.keyiv.len,
> +	if (algt->blockmode == DESC_OPMODE_CBC) {
> +		memcpy(op->keyiv + AES_MAX_KEY_SIZE, areq->iv, ivsize);
> +		ctx.keyiv.len = AES_MAX_KEY_SIZE + ivsize;
> +	}
> +
> +	ctx.keyiv.addr = dma_map_single(mc->dev, op->keyiv, ctx.keyiv.len,
>   				  DMA_TO_DEVICE);
>   	err = dma_mapping_error(mc->dev, ctx.keyiv.addr);
>   	if (err) {
> @@ -366,8 +365,6 @@ static int meson_cipher(struct skcipher_request *areq)
>   	meson_unmap_scatterlist(areq, mc);
>   
>   theend:
> -	kfree_sensitive(ctx.bkeyiv);
> -
>   	return err;
>   }
>   
> @@ -450,7 +447,6 @@ static void meson_cipher_exit(struct crypto_tfm *tfm)
>   {
>   	struct meson_cipher_tfm_ctx *op = crypto_tfm_ctx(tfm);
>   
> -	kfree_sensitive(op->key);
>   	crypto_free_skcipher(op->fallback_tfm);
>   }
>   
> @@ -474,11 +470,9 @@ static int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
>   		dev_dbg(mc->dev, "ERROR: Invalid keylen %u\n", keylen);
>   		return -EINVAL;
>   	}
> -	kfree_sensitive(op->key);
> +
> +	memcpy(op->keyiv, key, keylen);
>   	op->keylen = keylen;
> -	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
> -	if (!op->key)
> -		return -ENOMEM;
>   
>   	return crypto_skcipher_setkey(op->fallback_tfm, key, keylen);
>   }
> diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
> index eb2f8cd72b65..e1453dd2e9f4 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl.h
> +++ b/drivers/crypto/amlogic/amlogic-gxl.h
> @@ -129,15 +129,15 @@ struct meson_cipher_req_ctx {
>   
>   /*
>    * struct meson_cipher_tfm_ctx - context for a skcipher TFM
> - * @key:		pointer to key data
> + * @keyiv:		key data
>    * @keylen:		len of the key
>    * @keymode:		The keymode(type and size of key) associated with this TFM
>    * @mc:			pointer to the private data of driver handling this TFM
>    * @fallback_tfm:	pointer to the fallback TFM
>    */
>   struct meson_cipher_tfm_ctx {
> -	u32 *key;
> -	u32 keylen;
> +	u8 keyiv[AES_MAX_KEY_SIZE + AES_BLOCK_SIZE] ____cacheline_aligned;
> +	u32 keylen ____cacheline_aligned;
>   	u32 keymode;
>   	struct meson_dev *mc;
>   	struct crypto_skcipher *fallback_tfm;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
