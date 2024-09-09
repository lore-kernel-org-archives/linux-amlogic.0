Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226A0ECE579
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2024 09:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7LFAMLlUtkIKDL0XUGXFhYOcrYCX6QA6j1ylcFoXBA=; b=pCaHCU2HA471Xzw52Yz6yJeSkR
	9Z0LYBuALbuWy+xl0FE0jhv3aVaXF/dd0Rr2FPLdzQ4Klj/GpLrRT9ToHpxl4zo2XWWl3WaxegOFD
	L6/kNZIleHQcr9YEWyol09cW0KpzlNcIbcW8UcXdM4vua2lAfErOgBRkDniiCgAH3g5xVWEdqPqbA
	UtfCH4Sqj+PaUIz7GK43ajZ/U5GCeh1PPW5drMnVWLGHJ9rWvP+u1OGCgLYiYwMaMDVU1bJGigUgE
	kMNfKnPh2xwESzAOROIrCZ6aLAr+CbsqazW1+B+42IKwXPE7IK2JQily56ehQbfjqj7snSdltK2v5
	CQCLtKLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snaNB-00000001EWJ-2zRL;
	Mon, 09 Sep 2024 09:07:49 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snaKM-00000001E7a-25B8
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Sep 2024 09:04:57 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-374c6187b6eso2464093f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Sep 2024 02:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725872692; x=1726477492; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p3dhfZNbro0Q8a0edsgm4VI2lp9WiWYPxhOHG+Trz+Y=;
        b=B7iF6LlVZRQS2L9mB7nNh14dEYm0B48kxTRLxD3TiX6Nz5agDCU2cgOy+ZpOUydPGo
         FzD56zuQMx+jawVJUDLs6B0n7gqlhiUn7mEApJW/7ysOYWnU+J4eApStxh9mjo8ZljOX
         3/lI+g9u3K05X3oGewhHo6QY/YFhqu3/iczxtTfJOO8QczDKL3Fh4CLS9c7NNOVptXr/
         c5jEyvfoiu4QRjEOLz7vmI/vW6bhrGx4qx31QJZiGsJiNeQyHRekVErzpVtS4VML37AU
         FCX34hA18niNJd2Xl7KdWKH39L+/PDvi6AfCqwpq3WU2AhFdOW8x3ZSqo+qZFahWaUyX
         hMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725872692; x=1726477492;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p3dhfZNbro0Q8a0edsgm4VI2lp9WiWYPxhOHG+Trz+Y=;
        b=I0kj0mB5ocUa11vxuJF/WGuz8lkl/tumPmJxD17B4906uYAx8Pwt3+L1RyZ8po5GXB
         ejS+92uL44O5Ss2ecwu0O6sMYE+01IlU9zBG87lpwaBEooAyET9XbFyplU93ULEst2OQ
         pMvTDbeEWALFHchAvxdEmetbdbvcq00pr4iWrDBe9cV/2L1k87+GjoitnKZ53m4ic91u
         XXC7r/8OeRc/5jGzlQi7OKgSCCB/rrOMYJeleyptyoEheIsJhRcG5U57Fqslx/i9BZM5
         /O1WKiwUK/C8m8eMO+yjOuhGwBnY6Ry/OrDjAPpu/I9ofOCa8mF8dv8bHolCPORaDfbz
         IA0w==
X-Forwarded-Encrypted: i=1; AJvYcCXUTamETEqa+kyMor3rIpBsgdklf3Xl8VKAxdK6Srb6oSL2eaTgqbrkng5ij+25hQ+i7wYf+y3V4E4QpY9o@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg1zU33BwmNkUG0+DpdugEKmSGXFqNIKP1pxbpYuOp9lYK4aWE
	YmNT8agIKZD2HVPWuxZUqxAuCJSaOFOVeg+2MhDeaATsHLOZ0BmVNtv/5C9WrFI=
X-Google-Smtp-Source: AGHT+IFVcYzwIVmzAqMmvKKM3ciORGaJKpx4XVnUJN5ODieQEuio3vvRs+LhSli5Ag9nEDPTPH5piw==
X-Received: by 2002:adf:cf09:0:b0:374:c651:4abf with SMTP id ffacd0b85a97d-3788969feb9mr6129034f8f.52.1725872691962;
        Mon, 09 Sep 2024 02:04:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:63a3:6883:a358:b850? ([2a01:e0a:982:cbb0:63a3:6883:a358:b850])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956de3d4sm5457312f8f.108.2024.09.09.02.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 02:04:51 -0700 (PDT)
Message-ID: <81392013-5dda-424f-b185-c350b163c82d@linaro.org>
Date: Mon, 9 Sep 2024 11:04:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/5] drm/meson: constify regmap_config
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
 <20240908-regmap-config-const-v1-2-28f349004811@linaro.org>
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
In-Reply-To: <20240908-regmap-config-const-v1-2-28f349004811@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_020454_626235_D713A926 
X-CRM114-Status: GOOD (  12.45  )
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

On 08/09/2024 16:21, Krzysztof Kozlowski wrote:
> Mark local static 'struct regmap_config' as const for safer and more
> obvious code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/gpu/drm/meson/meson_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 4bd0baa2a4f5..6c8677d1f562 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -126,7 +126,7 @@ static bool meson_vpu_has_available_connectors(struct device *dev)
>   	return false;
>   }
>   
> -static struct regmap_config meson_regmap_config = {
> +static const struct regmap_config meson_regmap_config = {
>   	.reg_bits       = 32,
>   	.val_bits       = 32,
>   	.reg_stride     = 4,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
