Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E08C2BD09
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jul 2024 09:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/lCJ7H9vxRhnHEG80Cz7hi78lW6l/4w4rSyzaCnb90=; b=DVTH21wjMSXZdhlN5YlVzfFNnt
	3fVLTWKUOxHZXh+n/H3AvIqXo13cg01orcvdAHGi69KQfMQWqeWAlgbIIe82wzW1zOzbh9SnRWSRW
	URTxjtBe3FEWthOR4jrnbnDyRugLexn8TjZ15BrwRd3mtRjJbCCvF6RaUj4MCBpJqJUrnxYD8G+HF
	0FCmkBRFBi+FOXQDn2PZyAGO7JzGw8bmvYBtm54OyVcd+WScx8KhBY8J18STHuH2tqWfQLz6mqYo5
	wZYgAfyltaXkTgitatSB4pSk0BlTR5lIUCdBfRQycWoLOuYV9W810IJUxFQysJunTWE3ZMidTN16a
	BUdfZ+AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR6o6-00000006XQZ-2qGp;
	Tue, 09 Jul 2024 09:06:42 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR6nc-00000006XG6-2kET
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Jul 2024 09:06:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4266fcb311cso5614365e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 09 Jul 2024 02:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720515971; x=1721120771; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ogVyAEL2M7qNO4z7J1sOc6hAQrvMRSpw0p21RysLKwM=;
        b=ty4j534s6au65b8hE7KIV7yy8E5Fqx1eDgyNN08Jj9hhux/WnbVzpqq9h/6QlcCXow
         FeK3eh5VTWkUSPIlO7M8eaTTwiTtYwNLCPig+gwplXWbxZ+VGZ+cDxL3jwheHEW7fB/n
         /So4aiYRy2tqnkVukMbJNxPK698JyzYzdZxxqujpSz3jSTimJuvJkMCISpq9vhjeTMy1
         w1PRtkeQO14m16DXkJDoLR3P/Nw03xiQLLgOJG9UINbvvkglgovnAaE1cbM76eg64uI5
         ktXSAMLRBHTE2YNyYtLgocVpMdDXiPnLdNcI8771cBbwBUO6iP/CEBfXTIRXhoVd/GUt
         45WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720515971; x=1721120771;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ogVyAEL2M7qNO4z7J1sOc6hAQrvMRSpw0p21RysLKwM=;
        b=Y7hcjdupWrqoEqVnD+xUf+Hy653CK/RwuH1FFflrfdXwWNxRBwKJ6ygkHK+PkskgbN
         AhRiKVl4WV+prFS47xovDmDyRyJzhbN/5FGlwLU6tGJAP56IgiwEVNHORxEDUIaHSVNy
         UQff6mtLeLua86N3e23iq8C3VjAnXx3Qj3CESmxRiAyc4DV68TFDJFE2QyTN7oB6U8a+
         O7O7NE43BOh9szd3kEyFZlQrvHahq2iCpPhXAcamHSh+jahmg/v8AWuTcYmeoDwuCNzQ
         gWjUEjXZdOvwc2tbCLJIWtPufc8JTA64CkoGCL49eJz345PkksGAU1ogWrv/oL8WKJq2
         mesQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN05RRkNKpD1cFtcDPo0exMb7raI22vDeuuOPwp7eqS2inSXwyW/RQdGS6K4TiHdWKoNofZjuNEA5UL6aq3hkLxFZKY43IomFvjlD1/02SVQI=
X-Gm-Message-State: AOJu0Yx1tooOjvwnuSsgqX9FpuX0IoKk4avAdj/VffqjVVZBg72MMTW7
	EMwou0TVZIONM2MN5U9PYXU8eMujxmIHcGnUQ1zI4PI2thCDcgB0ENHRHmsngrc=
X-Google-Smtp-Source: AGHT+IELZi7jgatav2Id3lIgfAyc3Rzsc/KAgDHVke/qVTBlLbN2DDJ60OTJQsnSr7D68SFLsEWQlg==
X-Received: by 2002:a05:600c:2e04:b0:426:59ad:bbb3 with SMTP id 5b1f17b1804b1-426708f1f54mr11303105e9.32.1720515970731;
        Tue, 09 Jul 2024 02:06:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:b12a:8461:5e2a:dfe? ([2a01:e0a:cad:2140:b12a:8461:5e2a:dfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfa079asm1926309f8f.68.2024.07.09.02.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 02:06:10 -0700 (PDT)
Message-ID: <15016b7c-f333-4a38-8780-79bbc9ed1b0f@linaro.org>
Date: Tue, 9 Jul 2024 11:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: fix canvas release in bind function
To: Yao Zi <ziyao@disroot.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Jourdan <mjourdan@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240703155826.10385-2-ziyao@disroot.org>
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
In-Reply-To: <20240703155826.10385-2-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_020612_901639_9952125A 
X-CRM114-Status: GOOD (  15.04  )
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

On 03/07/2024 17:58, Yao Zi wrote:
> Allocated canvases may not be released on the error exit path of
> meson_drv_bind_master(), leading to resource leaking. Rewrite exit path
> to release canvases on error.
> 
> Fixes: 2bf6b5b0e374 ("drm/meson: exclusively use the canvas provider module")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>   drivers/gpu/drm/meson/meson_drv.c | 37 +++++++++++++++----------------
>   1 file changed, 18 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 17a5cca007e2..4bd0baa2a4f5 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -250,29 +250,20 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   	if (ret)
>   		goto free_drm;
>   	ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_vd1_0);
> -	if (ret) {
> -		meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
> -		goto free_drm;
> -	}
> +	if (ret)
> +		goto free_canvas_osd1;
>   	ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_vd1_1);
> -	if (ret) {
> -		meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
> -		meson_canvas_free(priv->canvas, priv->canvas_id_vd1_0);
> -		goto free_drm;
> -	}
> +	if (ret)
> +		goto free_canvas_vd1_0;
>   	ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_vd1_2);
> -	if (ret) {
> -		meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
> -		meson_canvas_free(priv->canvas, priv->canvas_id_vd1_0);
> -		meson_canvas_free(priv->canvas, priv->canvas_id_vd1_1);
> -		goto free_drm;
> -	}
> +	if (ret)
> +		goto free_canvas_vd1_1;
>   
>   	priv->vsync_irq = platform_get_irq(pdev, 0);
>   
>   	ret = drm_vblank_init(drm, 1);
>   	if (ret)
> -		goto free_drm;
> +		goto free_canvas_vd1_2;
>   
>   	/* Assign limits per soc revision/package */
>   	for (i = 0 ; i < ARRAY_SIZE(meson_drm_soc_attrs) ; ++i) {
> @@ -288,11 +279,11 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   	 */
>   	ret = drm_aperture_remove_framebuffers(&meson_driver);
>   	if (ret)
> -		goto free_drm;
> +		goto free_canvas_vd1_2;
>   
>   	ret = drmm_mode_config_init(drm);
>   	if (ret)
> -		goto free_drm;
> +		goto free_canvas_vd1_2;
>   	drm->mode_config.max_width = 3840;
>   	drm->mode_config.max_height = 2160;
>   	drm->mode_config.funcs = &meson_mode_config_funcs;
> @@ -307,7 +298,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   	if (priv->afbcd.ops) {
>   		ret = priv->afbcd.ops->init(priv);
>   		if (ret)
> -			goto free_drm;
> +			goto free_canvas_vd1_2;
>   	}
>   
>   	/* Encoder Initialization */
> @@ -371,6 +362,14 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   exit_afbcd:
>   	if (priv->afbcd.ops)
>   		priv->afbcd.ops->exit(priv);
> +free_canvas_vd1_2:
> +	meson_canvas_free(priv->canvas, priv->canvas_id_vd1_2);
> +free_canvas_vd1_1:
> +	meson_canvas_free(priv->canvas, priv->canvas_id_vd1_1);
> +free_canvas_vd1_0:
> +	meson_canvas_free(priv->canvas, priv->canvas_id_vd1_0);
> +free_canvas_osd1:
> +	meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
>   free_drm:
>   	drm_dev_put(drm);
>   

This would deserve a devm_meson_canvas_alloc(), but as-is:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
