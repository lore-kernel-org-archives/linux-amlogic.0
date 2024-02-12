Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474AAC4829C
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Feb 2024 17:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DBYWPeCPZ3dQwUxzBRRUVEluk3IGzqWgcgkP3a8/hM=; b=H4g97hajdtkOz39XfLSFznoJAq
	zbqbLF18EPY5TqD5RT3owMF1WkDYN+ISt4c1h6wK6vik7TTDIy9zYcmv+RmTkzpKSNv6L1CK4bhqc
	z4HwzKEdzb+8vq805EvTciQn81UfgO3N7BmEC7Nf+vRrxDP8cozOMSE9r2223x2CpyTCCxV06q7vL
	RGfGwUDbSLs/PHrxiAtSr4JCDgFC1HMdreHWrucE+wWZ35DXQAIDqfzk4IqG0HBu7PDjVKNuoHZrl
	gcOPVhete4BcdBCHmwPk4KnHi3KZMHQNPZerotMWGk7qlAv79LeiqWgzxRTNhif4iQIT6vIjQfL/t
	6Ni418bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZqi-00000006NAk-0uAj;
	Mon, 12 Feb 2024 17:12:08 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZqf-00000006N8O-2WVd
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Feb 2024 17:12:07 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-41166710058so4442555e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Feb 2024 09:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707757924; x=1708362724; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CIw0R7nsSvKK8fOD6O78NCUKigSi0poWhSyBj8iQ8hQ=;
        b=aNS/cHU/1Zo12J0b4jnv/O75fU9ZlQ+7g5v75mpM7PmmhJ7HTMJlJvv+XJr3zpBEVN
         OXkF8OUJjcx8EjCj265uhTwwJYXKwepr1QmcxgD5E6c3O80P85hZopM0oxrI1PmrWCFx
         QqElvYjIRArFnrkRkQ7Ce3uH2LleNEwWLnSGRMs9/BOIRHPh1C7u/aR1c/4YpTZEWoU2
         H/fZD4+9WAMPg5ILSiUF/8Eo4FNs3QAaNT7w+Lc0Su+DSXloZLu3y10JgukOKDLHf0P0
         myvC/IBNczJcLoNE541a+/PGO9vBKAwlMQ/u0ZlP5QwzsPBRMfiNJDOzoak0z0sKAozI
         FKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757924; x=1708362724;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CIw0R7nsSvKK8fOD6O78NCUKigSi0poWhSyBj8iQ8hQ=;
        b=aeSGwdwB4w3iPbdD8/3lvvYGdDSKPEHDjBkhCGtKAX87xb/HxdH2bjXeYSKIeUCHuc
         4X+DdBeMqWI3So4Isg+jXpU/MgqKTLEZdnDHBlYZ9IKNcRJUlkhSLX58cgiG7w5hSKZ0
         s4jG3h4Sf0VpgorTmh6uH4A3Fpa0KBJCZqAN+oeLR3ALfaBGjIyLyPVTwlkNfbZ4ROfP
         GAM4ifVU5SZtLYswlAuJ1Yzig9yyOi0QkKfVDj6Tk87JoMHtMpd6eBSud7RcXfDkycrE
         MgWTpxcvdYWjnTwbDjVtV/EJ8UZFrGTEvK5LmqdmGsM7cde0SPhTBlaQ60d6K0E6g1t4
         qwVA==
X-Forwarded-Encrypted: i=1; AJvYcCV1drbBKIi34M4hvM5Lw6/9VEbkr0L6r9u+Ib+pqdV5QA9nIWc7CugtsgbhT8oK+XXiR4lL2LRQ7ArTqQZNCB7Eq7yPgg4HZ/wg0Ro2RgLKrsk=
X-Gm-Message-State: AOJu0YyA6Lb8HbM0avEiSvuq0uz7c6yLBnUKrhwvj/3+7quu8vKMvJG/
	DMxsP47+wehAkVGCyq6NJTiAlZE0iVCudKy22Ms4OT2Em0Lbn0lweyAcrJ5/OQA=
X-Google-Smtp-Source: AGHT+IGG0gvC8xdOVFXyoqKOjK7KF6KAFOvp0BE030yTwmcKUhHcYQ3Qv0oP3y688dKM5aOms1BUvg==
X-Received: by 2002:a5d:4589:0:b0:33a:f798:bfa with SMTP id p9-20020a5d4589000000b0033af7980bfamr5537587wrq.64.1707757924302;
        Mon, 12 Feb 2024 09:12:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUx2T3llGMN6IWpDztHmG0RqS2HbgLZscF1BXAdMlQj3uB4OacuwdQh3FbxCqZ1uZw/tSFYTX9iTkJjYwvXv7oCxmEY3Tx5QgId05p2FtB9WduXI7P2S+G4kXhob4ZRqlNO6crw7MmUFl2y9GN55MjZqF193H7HryTRpc8P6KxDd3U3FxU3LFnbALdsNWrF9WErn7by9pAph7PxJqwb7RqylPiSWoIBoap+twrOwPZ03cgPYCPIYmMNlgdYEtjH7+BwTOO4UyQjFZOiYFmDYhg+lWUch7f5zcQq6iXRt9R8kY81hn9Z5d8+Fcg+9kTmf3RWxYHZC5OZHso6w98iopX5hHqJqZ+yO7u0agQqEzITo+W2ryKrrjnaKur0Z9hSUa2SXciub8aBD0W8eKjmCiuj9Ce2DnnrtFsB+vDKdzs9qCxHtcxzfhNNjxrzb8X89IqC62KkBWmHY+nNPSHEdFxxgmAaBggO6YvJVN9rXeABGYx/M8B77k8pKV7ibEnX2X1PKwNpSZa2DA69kMbWM7XH2FeTV3wlvGIlAMN42b/tLa3FbMz1WyiJIFUTggWU6x6YzGojrTlad1S+Z9ApE3hXBwKIMIl0ajKs
Received: from ?IPV6:2a01:e0a:982:cbb0:fcee:f026:296d:135f? ([2a01:e0a:982:cbb0:fcee:f026:296d:135f])
        by smtp.gmail.com with ESMTPSA id ck13-20020a5d5e8d000000b0033b684d6d5csm7440536wrb.20.2024.02.12.09.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 09:12:03 -0800 (PST)
Message-ID: <e4f025d1-267d-4c80-b211-bdadfc31d2b1@linaro.org>
Date: Mon, 12 Feb 2024 18:12:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 06/20] drivers: crypto: meson: drop status field from
 meson_flow
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
 <20240212135108.549755-7-avromanov@salutedevices.com>
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
In-Reply-To: <20240212135108.549755-7-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_091205_700047_619F9487 
X-CRM114-Status: GOOD (  21.12  )
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
> This field is used only to check for timeout. But there is more
> convenient way to achive the same goal.
> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>   drivers/crypto/amlogic/amlogic-gxl-cipher.c | 13 +++++++++----
>   drivers/crypto/amlogic/amlogic-gxl-core.c   |  1 -
>   drivers/crypto/amlogic/amlogic-gxl.h        |  2 --
>   3 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> index 18e9e2d39b1f..dc0b100c5de2 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> @@ -219,13 +219,18 @@ static int meson_cipher(struct skcipher_request *areq)
>   	}
>   
>   	reinit_completion(&mc->chanlist[flow].complete);
> -	mc->chanlist[flow].status = 0;
>   	meson_dma_start(mc, flow);
> -	wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
> -						  msecs_to_jiffies(500));
> -	if (mc->chanlist[flow].status == 0) {
> +
> +	err = wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
> +							msecs_to_jiffies(500));
> +	if (err == 0) {
>   		dev_err(mc->dev, "DMA timeout for flow %d\n", flow);
>   		err = -EINVAL;
> +	} else if (err < 0) {
> +		dev_err(mc->dev, "Waiting for DMA completion is failed (%d)\n", err);
> +	} else {
> +		/* No error */
> +		err = 0;
>   	}
>   
>   	dma_unmap_single(mc->dev, phykeyiv, keyivlen, DMA_TO_DEVICE);
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
> index 51291fdcf8b6..f7c60ebffbc3 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-core.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
> @@ -54,7 +54,6 @@ static irqreturn_t meson_irq_handler(int irq, void *data)
>   	for (flow = 0; flow < mc->flow_cnt; flow++) {
>   		if (mc->chanlist[flow].irq == irq) {
>   			if (meson_dma_ready(mc, flow)) {
> -				mc->chanlist[flow].status = 1;
>   				complete(&mc->chanlist[flow].complete);
>   				return IRQ_HANDLED;
>   			}
> diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
> index 5f5e3115fcdf..e27908992ae3 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl.h
> +++ b/drivers/crypto/amlogic/amlogic-gxl.h
> @@ -59,7 +59,6 @@ struct meson_desc {
>    * @engine:	ptr to the crypto_engine for this flow
>    * @keylen:	keylen for this flow operation
>    * @complete:	completion for the current task on this flow
> - * @status:	set to 1 by interrupt if task is done
>    * @irq:	IRQ number for amlogic-crypto
>    * @t_phy:	Physical address of task
>    * @tl:		pointer to the current ce_task for this flow
> @@ -68,7 +67,6 @@ struct meson_desc {
>   struct meson_flow {
>   	struct crypto_engine *engine;
>   	struct completion complete;
> -	int status;
>   	int irq;
>   	unsigned int keylen;
>   	dma_addr_t t_phy;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
