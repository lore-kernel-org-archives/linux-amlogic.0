Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5ADC48260
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Feb 2024 08:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sknPNSDtDxKazkleSELhV8pszl75uk51lA513lcE8gI=; b=vH61W5kS41qa3l2T8D8Btk3PHc
	OGJIXWwBiDEDMcfUnHbmorjfkRj1tvOq9ObT65Wyso22B2TyNVokVGECk2vBZpX/mKeEMRYn/u0hQ
	/NflUpx5lp1NFgWTEqDkfVc2ohDdP1tVgvIpzFYocIY0vfTraeny+yxtVlNeRPA1FA8kiWzqmOxP+
	e4jMmSn/S/ega/weT5HCs1lsFkHsYl1koY+jSzzmR3bvIkT5zzWHlyAIE2rEWs+dng9S2mmqNF+78
	MCkMAcr9gtSaCxCw5KcLFrP5UPSxuA0Io7WnM1fJL0+ycjZOiSCZginmEDZvJI+M37n1ynoDnv1qb
	mol83Nwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbz7c-00000009bbX-3sVP;
	Mon, 19 Feb 2024 08:35:32 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbz7a-00000009bak-2C9P
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Feb 2024 08:35:32 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5129cdae3c6so2298450e87.1
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Feb 2024 00:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708331728; x=1708936528; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zfx3ZEwTL6FBC4zykr6yONY+eAjewsuouiDmLMUTrYA=;
        b=K0rJUnE49ZITGl5fzbzCcyCkDsAxBIvK6Y7ytp6VI1RXdiMjqdJc1kJtMoAqJPZeGs
         BwlzsCIRmCS4UoJ9rJD53d1JLXmGXynMH66BpC0GlkQ3en0yo88AgtBylTrGyqvmKNMC
         L2kI1jbTh8yTVPutuIWXmeDM21+2dxPStB2qaY9YEIdxldG3hdbV68DHsePn9D1J84js
         iSzzp8My9zkml6k9DXvQbxNXI/3m0r0GSAnWwoDzuXGewk2daSzyAa5AqwNa7Tfp5sP7
         ot7gAV8GSXPrhhNRH+Glg9ogcr8+1my8jKllrj+PwG1zQWS1LSIRXiPN2MFofpK3Wp3R
         utug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708331728; x=1708936528;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zfx3ZEwTL6FBC4zykr6yONY+eAjewsuouiDmLMUTrYA=;
        b=QAADpxRRHKOUzuHW+RPw/2x+0XmS1H4A2nT/Z2RFDw28aJ2e6Qw5oIxaEeJTFI0vgz
         7uRULSu4mG632Oxie84J5l5zRdsH9jEp02UpW0lsKa587Keh2BI600Qme9+l+xfNJynJ
         4ZciGrmYARCa4t82Kj5v8VK+hGJfIphJrc9aYXpv+D5qM64XufMLlUTnw6DJWU5uKbaF
         vnWfnIJHWt2zr2smeDTcneFW5W+NNNb+m9uH9Q3BDR434X/3mM8jr2PWdDyLJ7q0YIgY
         mMEGtLZ2Xyw9XRtfjhRE9tRQVdKbMaT2sPJ0pLViyEH2RxuLVA6DmqTksu2JBPysKIt2
         pw0g==
X-Forwarded-Encrypted: i=1; AJvYcCUkKbET0ls0LEqcLrYgtFCU+vhFE363TNMx8z1UBMfJdiSl7BFM7PxHUExwQKMf0uYrz75dWwqhNBciOfR2n0B20e3CscBDiSSh+xCCxkZMI38=
X-Gm-Message-State: AOJu0Yzzkyr9F37P7QIsf873Grcf9cLhosguBZuQ7dOgbMeRZyJnubBI
	tNdDKK5kkDWIiGhi3Gg5PKdVTc4/HyNuf7ikkGx+DBR4i9b5BqAtUlfZ6pTDsoU=
X-Google-Smtp-Source: AGHT+IHAyjCKKOsQG0yPf8hX1IXJFzN7yXOpiya+w8YNkF07mLmOCTuQMvbFv0PBrJP8aIFB+GAJ0Q==
X-Received: by 2002:ac2:4433:0:b0:512:b915:3b18 with SMTP id w19-20020ac24433000000b00512b9153b18mr587309lfl.52.1708331728474;
        Mon, 19 Feb 2024 00:35:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9470:c6e0:c87a:fa9f? ([2a01:e0a:982:cbb0:9470:c6e0:c87a:fa9f])
        by smtp.gmail.com with ESMTPSA id g19-20020a7bc4d3000000b004126101915esm4868608wmk.4.2024.02.19.00.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 00:35:28 -0800 (PST)
Message-ID: <4cfb1b74-7941-45af-a60e-0661b1888b79@linaro.org>
Date: Mon, 19 Feb 2024 09:35:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1] drm/meson: improve encoder probe / initialization
 error handling
Content-Language: en-US, fr
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240218175035.1948165-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20240218175035.1948165-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_003530_636741_1B590C4D 
X-CRM114-Status: GOOD (  25.15  )
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

On 18/02/2024 18:50, Martin Blumenstingl wrote:
> Rename meson_encoder_{cvbs,dsi,hdmi}_init() to
> meson_encoder_{cvbs,dsi,hdmi}_probe() so it's clear that these functions
> are used at probe time during driver initialization. Also switch all
> error prints inside those functions to use dev_err_probe() for
> consistency.
> 
> This makes the code more straight forward to read and makes the error
> prints within those functions consistent (by logging all -EPROBE_DEFER
> with dev_dbg(), while actual errors are logged with dev_err() and get
> the error value printed).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> This is meant to be applied on top of my other patch called
> "drm/meson: Don't remove bridges which are created by other drivers" [0]
> 
> 
> [0] https://lore.kernel.org/dri-devel/20240215220442.1343152-1-martin.blumenstingl@googlemail.com/
> 
> 
>   drivers/gpu/drm/meson/meson_drv.c          |  6 +++---
>   drivers/gpu/drm/meson/meson_encoder_cvbs.c | 24 ++++++++++------------
>   drivers/gpu/drm/meson/meson_encoder_cvbs.h |  2 +-
>   drivers/gpu/drm/meson/meson_encoder_dsi.c  | 23 +++++++++------------
>   drivers/gpu/drm/meson/meson_encoder_dsi.h  |  2 +-
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 15 +++++++-------
>   drivers/gpu/drm/meson/meson_encoder_hdmi.h |  2 +-
>   7 files changed, 35 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index cb674966e9ac..17a5cca007e2 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -312,7 +312,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   
>   	/* Encoder Initialization */
>   
> -	ret = meson_encoder_cvbs_init(priv);
> +	ret = meson_encoder_cvbs_probe(priv);
>   	if (ret)
>   		goto exit_afbcd;
>   
> @@ -326,12 +326,12 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   		}
>   	}
>   
> -	ret = meson_encoder_hdmi_init(priv);
> +	ret = meson_encoder_hdmi_probe(priv);
>   	if (ret)
>   		goto exit_afbcd;
>   
>   	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
> -		ret = meson_encoder_dsi_init(priv);
> +		ret = meson_encoder_dsi_probe(priv);
>   		if (ret)
>   			goto exit_afbcd;
>   	}
> diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> index 3407450435e2..d1191de855d9 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> @@ -219,7 +219,7 @@ static const struct drm_bridge_funcs meson_encoder_cvbs_bridge_funcs = {
>   	.atomic_reset = drm_atomic_helper_bridge_reset,
>   };
>   
> -int meson_encoder_cvbs_init(struct meson_drm *priv)
> +int meson_encoder_cvbs_probe(struct meson_drm *priv)
>   {
>   	struct drm_device *drm = priv->drm;
>   	struct meson_encoder_cvbs *meson_encoder_cvbs;
> @@ -240,10 +240,9 @@ int meson_encoder_cvbs_init(struct meson_drm *priv)
>   
>   	meson_encoder_cvbs->next_bridge = of_drm_find_bridge(remote);
>   	of_node_put(remote);
> -	if (!meson_encoder_cvbs->next_bridge) {
> -		dev_err(priv->dev, "Failed to find CVBS Connector bridge\n");
> -		return -EPROBE_DEFER;
> -	}
> +	if (!meson_encoder_cvbs->next_bridge)
> +		return dev_err_probe(priv->dev, -EPROBE_DEFER,
> +				     "Failed to find CVBS Connector bridge\n");
>   
>   	/* CVBS Encoder Bridge */
>   	meson_encoder_cvbs->bridge.funcs = &meson_encoder_cvbs_bridge_funcs;
> @@ -259,10 +258,9 @@ int meson_encoder_cvbs_init(struct meson_drm *priv)
>   	/* Encoder */
>   	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_cvbs->encoder,
>   				      DRM_MODE_ENCODER_TVDAC);
> -	if (ret) {
> -		dev_err(priv->dev, "Failed to init CVBS encoder: %d\n", ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(priv->dev, ret,
> +				     "Failed to init CVBS encoder\n");
>   
>   	meson_encoder_cvbs->encoder.possible_crtcs = BIT(0);
>   
> @@ -276,10 +274,10 @@ int meson_encoder_cvbs_init(struct meson_drm *priv)
>   
>   	/* Initialize & attach Bridge Connector */
>   	connector = drm_bridge_connector_init(priv->drm, &meson_encoder_cvbs->encoder);
> -	if (IS_ERR(connector)) {
> -		dev_err(priv->dev, "Unable to create CVBS bridge connector\n");
> -		return PTR_ERR(connector);
> -	}
> +	if (IS_ERR(connector))
> +		return dev_err_probe(priv->dev, PTR_ERR(connector),
> +				     "Unable to create CVBS bridge connector\n");
> +
>   	drm_connector_attach_encoder(connector, &meson_encoder_cvbs->encoder);
>   
>   	priv->encoders[MESON_ENC_CVBS] = meson_encoder_cvbs;
> diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.h b/drivers/gpu/drm/meson/meson_encoder_cvbs.h
> index 09710fec3c66..7b7bc85c03f7 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.h
> +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.h
> @@ -24,7 +24,7 @@ struct meson_cvbs_mode {
>   /* Modes supported by the CVBS output */
>   extern struct meson_cvbs_mode meson_cvbs_modes[MESON_CVBS_MODES_COUNT];
>   
> -int meson_encoder_cvbs_init(struct meson_drm *priv);
> +int meson_encoder_cvbs_probe(struct meson_drm *priv);
>   void meson_encoder_cvbs_remove(struct meson_drm *priv);
>   
>   #endif /* __MESON_VENC_CVBS_H */
> diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> index 311b91630fbe..7816902f5907 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> @@ -100,7 +100,7 @@ static const struct drm_bridge_funcs meson_encoder_dsi_bridge_funcs = {
>   	.atomic_reset = drm_atomic_helper_bridge_reset,
>   };
>   
> -int meson_encoder_dsi_init(struct meson_drm *priv)
> +int meson_encoder_dsi_probe(struct meson_drm *priv)
>   {
>   	struct meson_encoder_dsi *meson_encoder_dsi;
>   	struct device_node *remote;
> @@ -118,10 +118,9 @@ int meson_encoder_dsi_init(struct meson_drm *priv)
>   	}
>   
>   	meson_encoder_dsi->next_bridge = of_drm_find_bridge(remote);
> -	if (!meson_encoder_dsi->next_bridge) {
> -		dev_dbg(priv->dev, "Failed to find DSI transceiver bridge\n");
> -		return -EPROBE_DEFER;
> -	}
> +	if (!meson_encoder_dsi->next_bridge)
> +		return dev_err_probe(priv->dev, -EPROBE_DEFER,
> +				     "Failed to find DSI transceiver bridge\n");
>   
>   	/* DSI Encoder Bridge */
>   	meson_encoder_dsi->bridge.funcs = &meson_encoder_dsi_bridge_funcs;
> @@ -135,19 +134,17 @@ int meson_encoder_dsi_init(struct meson_drm *priv)
>   	/* Encoder */
>   	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_dsi->encoder,
>   				      DRM_MODE_ENCODER_DSI);
> -	if (ret) {
> -		dev_err(priv->dev, "Failed to init DSI encoder: %d\n", ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(priv->dev, ret,
> +				     "Failed to init DSI encoder\n");
>   
>   	meson_encoder_dsi->encoder.possible_crtcs = BIT(0);
>   
>   	/* Attach DSI Encoder Bridge to Encoder */
>   	ret = drm_bridge_attach(&meson_encoder_dsi->encoder, &meson_encoder_dsi->bridge, NULL, 0);
> -	if (ret) {
> -		dev_err(priv->dev, "Failed to attach bridge: %d\n", ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(priv->dev, ret,
> +				     "Failed to attach bridge\n");
>   
>   	/*
>   	 * We should have now in place:
> diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.h b/drivers/gpu/drm/meson/meson_encoder_dsi.h
> index 9277d7015193..85d5b61805f2 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_dsi.h
> +++ b/drivers/gpu/drm/meson/meson_encoder_dsi.h
> @@ -7,7 +7,7 @@
>   #ifndef __MESON_ENCODER_DSI_H
>   #define __MESON_ENCODER_DSI_H
>   
> -int meson_encoder_dsi_init(struct meson_drm *priv);
> +int meson_encoder_dsi_probe(struct meson_drm *priv);
>   void meson_encoder_dsi_remove(struct meson_drm *priv);
>   
>   #endif /* __MESON_ENCODER_DSI_H */
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index c4686568c9ca..22e07847a9a7 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -354,7 +354,7 @@ static const struct drm_bridge_funcs meson_encoder_hdmi_bridge_funcs = {
>   	.atomic_reset = drm_atomic_helper_bridge_reset,
>   };
>   
> -int meson_encoder_hdmi_init(struct meson_drm *priv)
> +int meson_encoder_hdmi_probe(struct meson_drm *priv)
>   {
>   	struct meson_encoder_hdmi *meson_encoder_hdmi;
>   	struct platform_device *pdev;
> @@ -374,8 +374,8 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
>   
>   	meson_encoder_hdmi->next_bridge = of_drm_find_bridge(remote);
>   	if (!meson_encoder_hdmi->next_bridge) {
> -		dev_err(priv->dev, "Failed to find HDMI transceiver bridge\n");
> -		ret = -EPROBE_DEFER;
> +		ret = dev_err_probe(priv->dev, -EPROBE_DEFER,
> +				    "Failed to find HDMI transceiver bridge\n");
>   		goto err_put_node;
>   	}
>   
> @@ -393,7 +393,7 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
>   	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_hdmi->encoder,
>   				      DRM_MODE_ENCODER_TMDS);
>   	if (ret) {
> -		dev_err(priv->dev, "Failed to init HDMI encoder: %d\n", ret);
> +		dev_err_probe(priv->dev, ret, "Failed to init HDMI encoder\n");
>   		goto err_put_node;
>   	}
>   
> @@ -403,7 +403,7 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
>   	ret = drm_bridge_attach(&meson_encoder_hdmi->encoder, &meson_encoder_hdmi->bridge, NULL,
>   				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>   	if (ret) {
> -		dev_err(priv->dev, "Failed to attach bridge: %d\n", ret);
> +		dev_err_probe(priv->dev, ret, "Failed to attach bridge\n");
>   		goto err_put_node;
>   	}
>   
> @@ -411,8 +411,9 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
>   	meson_encoder_hdmi->connector = drm_bridge_connector_init(priv->drm,
>   							&meson_encoder_hdmi->encoder);
>   	if (IS_ERR(meson_encoder_hdmi->connector)) {
> -		dev_err(priv->dev, "Unable to create HDMI bridge connector\n");
> -		ret = PTR_ERR(meson_encoder_hdmi->connector);
> +		ret = dev_err_probe(priv->dev,
> +				    PTR_ERR(meson_encoder_hdmi->connector),
> +				    "Unable to create HDMI bridge connector\n");
>   		goto err_put_node;
>   	}
>   	drm_connector_attach_encoder(meson_encoder_hdmi->connector,
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.h b/drivers/gpu/drm/meson/meson_encoder_hdmi.h
> index a6cd38eb5f71..fd5485875db8 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.h
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.h
> @@ -7,7 +7,7 @@
>   #ifndef __MESON_ENCODER_HDMI_H
>   #define __MESON_ENCODER_HDMI_H
>   
> -int meson_encoder_hdmi_init(struct meson_drm *priv);
> +int meson_encoder_hdmi_probe(struct meson_drm *priv);
>   void meson_encoder_hdmi_remove(struct meson_drm *priv);
>   
>   #endif /* __MESON_ENCODER_HDMI_H */

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
