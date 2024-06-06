Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A79FC25B75
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 08:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBMlreXIMBt/staBJbXoUszBR7+FnVIQh7iqex2slV4=; b=mOzB6oFvqnYKLaecR8OQrBLm+E
	w6yS/VqacTP50m+78HXqGXAVG2ZVnZZDxlYnLZJia4g0Nfm1EBK2dAubFC26E2ipGUI2Hw78dtfDP
	toYNQv7KZ+lnC7Kno1Z+ACxcNqlJqZOTOU4TDngCRAMOTOt4UOdR7sYXwrR5gOCH1/ZBFFUjzqIY8
	K3hso6jwe8/dbxCVM21F8S3fgCfepRPpfvicvA20Gjk4yXv6eJDZwuSbOBL6jFacpv/uuS8er4/MZ
	f+HTX5Byv/oPoDFrbVaHHMaoD9I0UbiOEoEGdRwszKAANRicHksyQQ433D9vj2RhA+gInUPjdlAvN
	WKQO+1eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8Rj-00000008p0X-0rLq;
	Thu, 06 Jun 2024 08:26:07 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8Re-00000008ozV-3Kqb
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 08:26:04 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4215b0c4b7dso8116425e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 01:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717662360; x=1718267160; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bIK7ZRurCp3VUMKrCmmBFEo7JzuHyJlxiXupFh9itNg=;
        b=YimceT6RZ2BrF5tfniRq2qO2zh1agSQIoUyxHz2t7LKZ6eqxEZKIDUqyF1VA1nFSNo
         dYP0qZys4qyJC0Gplnj9Bvlj55N00QkQ1kAjSPgFNeGm8dwXRwd2qbk5TJO7mgJ9cLE3
         u+CziPFOCB7hA3Y3f39gpB8jLmP2ak1FfDvAFWBnc0B1DLvB+FIqWTgdomZZtZzjXy9b
         hDujziwAEgJPJRJZQaN2/fznDR8HlXaZB223Anjh3admrrkixqfrsGUt0FbJ0m+zBDMu
         L5s5JEL+JSK9RTDyO95rCA4SYw73ZN6mtj+cVsxidshN8ja18Yd3z9rQPQgQ26lEZz30
         PWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717662360; x=1718267160;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bIK7ZRurCp3VUMKrCmmBFEo7JzuHyJlxiXupFh9itNg=;
        b=gVwijlEpU1q3/natnRX8lyqJ0L7LPTzKhPZ+LvjdnWyAtYn3JnfEt+rKJkadfL+Gm7
         5QwEBua+U0c41DOJGECNkKt5wHXSDC7hPwCDXxkQIt8beKYUvBd0tCi/tEArvzjYLjAT
         QbUmwEgA3i5rrNZ6tQvBDpj3DTIPq3i6htW0mRUgwWWz/jgQ3dQLdoBOy/aMmd4yhtvM
         g+0+a8H7O+O2/Z6DtltgJdDzTIjPuKn2/rbRlJTegWkpJHIE51md6WRQ1BzwK0D1+frQ
         6xJT5izvDHUYdDfTuNKT7+O7RR1Ol5U2e3IseUPuidrNY5jpcaMn36xYhB81TI7477M8
         BdzA==
X-Forwarded-Encrypted: i=1; AJvYcCWUwsfX6rxyhwz2wXDt0TVgDdzSSzR1yW/PMIk7GhZjOKenrRNYlB5Rkym2Rv0XT7rjB1vDEuJeeNKl++5fs/WJKgY/HWoRP5pAfBKEuDoAVQg=
X-Gm-Message-State: AOJu0YyA1eZGibmJPwGplt0CwDXoVZmu/xaFzMnoLIIc69e9V4Py4Z4U
	zCOyYZzR4QChzhThZq8UI1kfY6fOzLkrDYbJuQIM2eDCVWCUWX3Vrrotov54bf0=
X-Google-Smtp-Source: AGHT+IGD8CDRoGr7gLwFeA2KRHdkZI2ybG//UzckD4ZVgnplhUKkVBRsXPMX3dKrY8nsGsU9Tl8Vag==
X-Received: by 2002:a05:600c:4592:b0:41f:e10f:889a with SMTP id 5b1f17b1804b1-421562c6d2amr42212735e9.7.1717662360385;
        Thu, 06 Jun 2024 01:26:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:22fd:4ae6:287f:17f2? ([2a01:e0a:982:cbb0:22fd:4ae6:287f:17f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215814f64fsm47751845e9.47.2024.06.06.01.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 01:25:59 -0700 (PDT)
Message-ID: <52d8af51-1af1-400e-9793-2337bd1ff4ea@linaro.org>
Date: Thu, 6 Jun 2024 10:25:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] [drm/meson] meson_plane: Add error handling
 v2(re-aligned)
To: Haoran Liu <liuhaoran14@163.com>, maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231129113405.33057-1-liuhaoran14@163.com>
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
In-Reply-To: <20231129113405.33057-1-liuhaoran14@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_012602_954178_D4F068B5 
X-CRM114-Status: GOOD (  14.22  )
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

On 29/11/2023 12:34, Haoran Liu wrote:
> This patch adds robust error handling to the meson_plane_create
> function in drivers/gpu/drm/meson/meson_plane.c. The function
> previously lacked proper handling for potential failure scenarios
> of the drm_universal_plane_init call.
> 
> Signed-off-by: Haoran Liu <liuhaoran14@163.com>
> ---
>   drivers/gpu/drm/meson/meson_plane.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
> index 815dfe30492b..b43ac61201f3 100644
> --- a/drivers/gpu/drm/meson/meson_plane.c
> +++ b/drivers/gpu/drm/meson/meson_plane.c
> @@ -534,6 +534,7 @@ int meson_plane_create(struct meson_drm *priv)
>   	struct meson_plane *meson_plane;
>   	struct drm_plane *plane;
>   	const uint64_t *format_modifiers = format_modifiers_default;
> +	int ret;
>   
>   	meson_plane = devm_kzalloc(priv->drm->dev, sizeof(*meson_plane),
>   				   GFP_KERNEL);
> @@ -548,12 +549,16 @@ int meson_plane_create(struct meson_drm *priv)
>   	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
>   		format_modifiers = format_modifiers_afbc_g12a;
>   
> -	drm_universal_plane_init(priv->drm, plane, 0xFF,
> -				 &meson_plane_funcs,
> -				 supported_drm_formats,
> -				 ARRAY_SIZE(supported_drm_formats),
> -				 format_modifiers,
> -				 DRM_PLANE_TYPE_PRIMARY, "meson_primary_plane");
> +	ret = drm_universal_plane_init(priv->drm, plane, 0xFF,
> +					&meson_plane_funcs,
> +					supported_drm_formats,
> +					ARRAY_SIZE(supported_drm_formats),
> +					format_modifiers,
> +					DRM_PLANE_TYPE_PRIMARY, "meson_primary_plane");
> +	if (ret) {
> +		devm_kfree(priv->drm->dev, meson_plane);
> +		return ret;
> +	}
>   
>   	drm_plane_helper_add(plane, &meson_plane_helper_funcs);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
