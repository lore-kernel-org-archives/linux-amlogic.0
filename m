Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEF3C35FEB
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Sep 2024 07:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtQDRNQcXbRXRlvC0z6rCA5PnOb7r/ZpnklNmxQ/+sE=; b=E4xcLm/HpoQ+9uJDTd9sXZguuh
	tzlrkxMdhfXd8msf9d/rG+ff4hGdiLgkQVgdPRCKmQ4bu4tR7vDRX5RzJm817eWyAISepti19nszN
	9dmyPUoyEdNRQJJ/PzDahSSjhCayc3AxOy8B6ahHFR3xykHl6scWg//371UsHiom3K1BQ5w3Mck3b
	lAy9vG2B8MC5R29ycisWuVvy3/62scPgOr67Dw4jqzZpzHUgLYSTHtfsLzMTShg35JJd7ob51XuWx
	eC+zDCNf9CzXHktmd0xkdlGNVQWxGvjXMfOG6zOMuA9L6oYjaxMkZfMfEdVQKmouGnipAneNN/iaD
	zZCB7Ihw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqSIx-00000005YEy-3wCT;
	Tue, 17 Sep 2024 07:07:19 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqSIu-00000005YES-2QZP
	for linux-amlogic@lists.infradead.org;
	Tue, 17 Sep 2024 07:07:18 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42ca6ba750eso33583815e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 17 Sep 2024 00:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726556835; x=1727161635; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VY4E4/DEl384kvuzTo753KnhitPzMa2gduVjF4qXnHc=;
        b=ouCPawZOFt8vs+RjxdBGX/XZe0crISxGDgoG9xkiuKU0vDyln8tFF0Vq82AB1fo2Li
         YRINGXoBgZPHpq5ib7EyiOh/7siN4Nu29xwOmdCOYRUz3tTEKbFmMQXHfUug70QeP/vl
         9uGrPihBzKZ5TB8agz8Mi1RdhH/xAvuEpwNRY8m5dmVjy81aantX10D/vwWSm1R18NVa
         GC0tYvONRZ04VQNEAzvjPwWZztndOtMmveT/6CD7diMyU2Bt6rUpY8F1TSuxfqueSyLi
         3KVib5FcFrHx2Vwt8WrRkfPZTLSqHm/efgVe8ufjBJGUaH6J1wQQgiiIBQGrXXJFp0sz
         TeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726556835; x=1727161635;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VY4E4/DEl384kvuzTo753KnhitPzMa2gduVjF4qXnHc=;
        b=vdlAE5YD0d2Zi2Ssb05G5ef7MME/4HcRjgVHSjWambYpvcELx7ODPkvHlxD48t1/Xw
         2Ki0O9ftngHdfda6UR48L/rHsAWOI/VyeWlW+OntmtWm5LhGpA0CpH2MrFDE0MKCqu0D
         jfQLKmhNYUpdTfSK3dRkq3AgTpnweIiGbK2hZSShONI4GLu8LS9DRHn+DjqY06G12L2v
         jRhA3rsXNPQ98NGbipwH7eOFJ7E7LENCqFPtSx7eQxP+bTFN8x4eeshyKntjEkvuabv5
         j13J5XNvdmh7egPTOymYkDBI8nPPmduNZ1wQ302C1Y0xLAAPjVS/4u8UXsJDKofgwEfB
         +9KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNOoNuBejKGH846cJ8RGzdFEJHJQaQ+s/vkU2iPQ80nGZH2EBIQM5lTlyZ8XpHGDldAhz9rmGEChIuhzkX@lists.infradead.org
X-Gm-Message-State: AOJu0YyojHYRAEGcVWjA5bJZGBHwklBZC7TMoxMSsNfMOQF2O0B6xY24
	/RwilL5YDfXCht2+ZHlWH/oma5UraJkabW4AdHRFpNwZXPMmXcrKBdSAR51QZ6U=
X-Google-Smtp-Source: AGHT+IHEpjLNWGQ0pzXqaeJe2z+7R8eug2zNpfGaKG9J57ab/1XPJMLAi0k4IC6S/ydpsEP3380qVQ==
X-Received: by 2002:a05:600c:3c91:b0:42c:b2a2:af3a with SMTP id 5b1f17b1804b1-42cbdddf270mr165694235e9.9.1726556834770;
        Tue, 17 Sep 2024 00:07:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e5df:ee06:f22e:a8cf? ([2a01:e0a:982:cbb0:e5df:ee06:f22e:a8cf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b1948fasm128083635e9.43.2024.09.17.00.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2024 00:07:14 -0700 (PDT)
Message-ID: <1d668177-eafb-4c6f-9746-b62b74a5458e@linaro.org>
Date: Tue, 17 Sep 2024 09:07:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] drm/meson: disable line encoder before programming the
 gamma table
To: Theo Debrouwere <theo.debrouwere@gmail.com>,
 linux-amlogic@lists.infradead.org
Cc: Theo Debrouwere <theo.debrouwere@faytech.de>
References: <20240916133530.25498-1-theo.debrouwere@faytech.de>
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
In-Reply-To: <20240916133530.25498-1-theo.debrouwere@faytech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_000716_657100_F312D3BC 
X-CRM114-Status: GOOD (  18.55  )
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

On 16/09/2024 15:32, Theo Debrouwere wrote:
> There is a very rare bug, where the gamma table can't be written correctly.
> It is possible to write some entries into the gamma data port, after which
> the WR_RDY bit isn't set anymore. This causes a timeout in the code, and more
> entries will be written into the table. (each having their own timeout)
> There will be an image produced, but the colors will be completely off.
> The number of entries that can be written seems random.
> 
> The issue seems to be solved if the line encoder is disabled before the table
> is programmed.
> 
> Fixes: 42dcf15f901c ("drm/meson: add DSI encoder")
> Signed-off-by: Theo Debrouwere <theo.debrouwere@faytech.de>
> ---
> Added Fixes tag.
> 
>   drivers/gpu/drm/meson/meson_encoder_dsi.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> index 7816902f59075..15fd9df58ae4e 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> @@ -66,10 +66,11 @@ static void meson_encoder_dsi_atomic_enable(struct drm_bridge *bridge,
>   	/* ENCL clock setup is handled by CCF */
> 
>   	meson_venc_mipi_dsi_mode_set(priv, &crtc_state->adjusted_mode);
> -	meson_encl_load_gamma(priv);
> 
>   	writel_relaxed(0, priv->io_base + _REG(ENCL_VIDEO_EN));
> 
> +	meson_encl_load_gamma(priv);
> +
>   	writel_bits_relaxed(ENCL_VIDEO_MODE_ADV_VFIFO_EN, ENCL_VIDEO_MODE_ADV_VFIFO_EN,
>   			    priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
>   	writel_relaxed(0, priv->io_base + _REG(ENCL_TST_EN));
> --
> 2.45.2
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
