Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CB8CD342F
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 May 2026 21:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UzSGWfCXoaqb7eAX+PjrPyfBDCpob17nJrHoDursrI8=; b=Qqy49WqPfrHNHPPJ94uX5lK1tT
	QxB9f9EiV6Cl+jlhNzIUIeeugsMSZ/xWf4J5C/2gAv/tFIKEe9/Ga1RsabxKFSowvIyx1gnYL4FYS
	/gsUw0+3BrzaXWaiUKXdhoAemB7QeW66gfycNgZ3Zr54O76lKwUWSDv0ybxz6HJlDyAi9hGM/v7z8
	9wBxnbQIcqLNwDloqs3LSdG4tvZw8xrRcG6iq68FoPxHSkvWg2oG3A071hHtx1I9etwDCx8t9WqhB
	nWU6qpliIj3zgWFAOxpNcSiFhA6VPhO8rAbLQwOkE0mbFiLJ/hxsuvMJuyyduIDWsxBxqTRs0gLFa
	/ERAsCDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0js-0000000ENR2-1kIm;
	Mon, 04 May 2026 21:22:04 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0jo-0000000ENOc-1qOX
	for linux-amlogic@lists.infradead.org;
	Mon, 04 May 2026 21:22:02 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so66463335e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 04 May 2026 14:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777929718; x=1778534518; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nv307eZOcQfpf3d08YRaeg3RgbkORKK7jsD1l1EktYs=;
        b=U8B4UhKizbHXmNKINOb7GI2y1uNdL41oQC6QwJCxoXd57XZizlgRJ5d8925PGT9Ft6
         xh+Ry6B/sKN6FUUu04pkqxwrKoWMiYrVwQGGt1BrjTaGoCIV8QD9q9WdHhaJmy2fKDJR
         oDMfphWqMd0K/KhrSQgTF1vpXbgc1awbuIpG+3YT12iraNGOf3I6HvylWM1Vl37B9gPr
         QXpNYLp6ISPz+HUuAdBROfjd0cbkp5ZwW+eSVwHoGNW76v4DMMoYhHefH/t3yJ9JYomv
         Z7lm8hrbbOTPgO5rY9JruQ8kTsTiyII4AcIyrZRmvgWrEKaiGkDnERSYPfrrAjNeH0vx
         CcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777929718; x=1778534518;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nv307eZOcQfpf3d08YRaeg3RgbkORKK7jsD1l1EktYs=;
        b=qbLoWM/Af0bkUW1SS+vwg+j6aP29sDEmRv+OxuRu0VcML2+R+FdHFBrUocCVHu02ez
         +uHIkYZrh+kpk2lh8tsYgK57iwvccCOKbOpvzTmClGKw+iZba5YlUy9XLibJ8En2MrZC
         1SgzYgcnqPWxmbOQS0oRel0NRKU8fBdx6DGRLxoFMlUiHZpdsv+P014loQaZTGDS3KT6
         afUcqcVnr4dAZ/GO1aC7XNfFaiEa6lEeZh81T0u1ya1rATV0nzCD8DW/7W+ufv7sJrvI
         5JUTMULVkiM9sWzm3tOcmM5NaFh+r4ZpgHEs3MAnV71Xn/q3vh8f9B91y+nKja4wJV/J
         GWow==
X-Forwarded-Encrypted: i=1; AFNElJ8bvUmgwbZaCoKKMP5z6XKROf2S/T7EEwaEyH9nZz7AE3El0fQzYno9mOM0MYif9O4Z9rtpInOLuTJeJUqV@lists.infradead.org
X-Gm-Message-State: AOJu0YzvfJ26vxwPc/nEubBARNAxu4nsdE7DtO0O3Ekyq2gNJwneC5oJ
	1zmL2xN5plWNjicZUNdU4NAXhnm7lZFJW4ENBMNURFlH1G7hnWVygKtyXHzuT6yyt1n16WVDAPC
	zV95Pqoc=
X-Gm-Gg: AeBDietsP2r9npRw9/5BqrkRaTCurtNZdmV2dwVckIf3CdFHjBQoSTID+/wIcxr9gFC
	KPOFZrLQVE6PPYs6prWtFTI5axwtZwzUyTfatLvcg0ieD965GDGcfwwiPXd5NjxzEGPgRyBuvlt
	mNTV76cWo7RaThbeW3adnjKYU4f81H46zl6rieALLUtHQ1NI63HNCvLcZwFfC5+O8Kd9NV71hmv
	33fCboj6B+ptlUDcxosJd6kxCDw1BbLPGS1T4hrYosHxjOYY10iZpQHS//mxNoUxX14QxpQX8ph
	uImXQcLsuwt2ysq/tFzfyboHPhJvRIXbTxlszaMOGgY/XxhbIifyLiwZ/mjIkmAnLvFo8FWEfIr
	hgI75i36557rjyFHzP3LsCvkDNrEOIgh90teGIiWfEKX75npXOnV+lCTV2OGfwoZeA8mhbn4cHx
	xgvskbA9lLinrTAh0t+0mFfF6EVMnLCKZoWVWgoVoqvXlf8OAqChFD069RBaRX0XfPM1rtnIbhA
	sYIoyyHg8bu6FdydQ==
X-Received: by 2002:a05:600c:c16a:b0:489:1cda:bbb7 with SMTP id 5b1f17b1804b1-48d18ceb33dmr2855065e9.25.1777929717835;
        Mon, 04 May 2026 14:21:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:4086:6e90:21c8:1555? ([2a01:e0a:106d:1080:4086:6e90:21c8:1555])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d149de41asm5820225e9.2.2026.05.04.14.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 14:21:57 -0700 (PDT)
Message-ID: <80fb7a31-3a85-48d5-a971-4e7632778f0c@linaro.org>
Date: Mon, 4 May 2026 23:21:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 12/17] drm: bridge: dw_hdmi: Use generic CEC notifier
 helpers
To: Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20260504191059.275928-1-jonas@kwiboo.se>
 <20260504191059.275928-13-jonas@kwiboo.se>
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
In-Reply-To: <20260504191059.275928-13-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_142200_562123_AE807B74 
X-CRM114-Status: GOOD (  19.95  )
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, imx@lists.linux.dev, Liu Ying <victor.liu@nxp.com>, linux-kernel@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Diederik de Haas <diederik@cknow-tech.com>, linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@kernel.org>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 5/4/26 21:10, Jonas Karlman wrote:
> The commit 8b1a8f8b2002 ("drm/display: add CEC helpers code") added
> generic CEC helpers to be used by HDMI drivers.
> 
> Replace the open-coded CEC notifier handling with use of the generic CEC
> notifier helpers. Ensure DRM_DISPLAY_HDMI_CEC_NOTIFIER_HELPER is also
> selected when DRM_DW_HDMI_CEC is enabled so that the CEC helpers is
> available.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> v4: New patch
> ---
>   drivers/gpu/drm/bridge/synopsys/Kconfig   |  1 +
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 32 ++++-------------------
>   2 files changed, 6 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/Kconfig b/drivers/gpu/drm/bridge/synopsys/Kconfig
> index a46df7583bcf..e6723af03b43 100644
> --- a/drivers/gpu/drm/bridge/synopsys/Kconfig
> +++ b/drivers/gpu/drm/bridge/synopsys/Kconfig
> @@ -49,6 +49,7 @@ config DRM_DW_HDMI_CEC
>   	depends on DRM_DW_HDMI
>   	select CEC_CORE
>   	select CEC_NOTIFIER
> +	select DRM_DISPLAY_HDMI_CEC_NOTIFIER_HELPER
>   	help
>   	  Support the CE interface which is part of the Synopsys
>   	  Designware HDMI block.
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 4c712aa07a89..0aa29b92327e 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -23,12 +23,11 @@
>   #include <linux/dma-mapping.h>
>   #include <linux/spinlock.h>
>   
> -#include <media/cec-notifier.h>
> -
>   #include <linux/media-bus-format.h>
>   #include <linux/videodev2.h>
>   
>   #include <drm/bridge/dw_hdmi.h>
> +#include <drm/display/drm_hdmi_cec_helper.h>
>   #include <drm/display/drm_hdmi_helper.h>
>   #include <drm/display/drm_scdc_helper.h>
>   #include <drm/drm_atomic.h>
> @@ -183,8 +182,6 @@ struct dw_hdmi {
>   	void (*enable_audio)(struct dw_hdmi *hdmi);
>   	void (*disable_audio)(struct dw_hdmi *hdmi);
>   
> -	struct cec_notifier *cec_notifier;
> -
>   	hdmi_codec_plugged_cb plugged_cb;
>   	struct device *codec_dev;
>   	enum drm_connector_status last_connector_result;
> @@ -2453,7 +2450,7 @@ dw_hdmi_connector_status_update(struct drm_connector *connector,
>   
>   	if (status == connector_status_disconnected) {
>   		drm_edid_connector_update(connector, NULL);
> -		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
> +		drm_connector_cec_phys_addr_invalidate(connector);
>   		return;
>   	}
>   
> @@ -2462,8 +2459,7 @@ dw_hdmi_connector_status_update(struct drm_connector *connector,
>   	drm_edid_free(drm_edid);
>   
>   	if (status == connector_status_connected)
> -		cec_notifier_set_phys_addr(hdmi->cec_notifier,
> -				connector->display_info.source_physical_address);
> +		drm_connector_cec_phys_addr_set(connector);
>   }
>   
>   static enum drm_connector_status
> @@ -2539,8 +2535,6 @@ static const struct drm_connector_helper_funcs dw_hdmi_connector_helper_funcs =
>   static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
>   {
>   	struct drm_connector *connector = &hdmi->connector;
> -	struct cec_connector_info conn_info;
> -	struct cec_notifier *notifier;
>   
>   	if (hdmi->version >= 0x200a)
>   		connector->ycbcr_420_allowed =
> @@ -2571,15 +2565,8 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
>   
>   	drm_connector_attach_encoder(connector, hdmi->bridge.encoder);
>   
> -	cec_fill_conn_info_from_drm(&conn_info, connector);
> -
> -	notifier = cec_notifier_conn_register(hdmi->dev, NULL, &conn_info);
> -	if (!notifier)
> -		return -ENOMEM;
> -
> -	hdmi->cec_notifier = notifier;
> -
> -	return 0;
> +	return drmm_connector_hdmi_cec_notifier_register(connector, NULL,
> +							 hdmi->dev);
>   }
>   
>   /* -----------------------------------------------------------------------------
> @@ -2887,14 +2874,6 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
>   	return dw_hdmi_connector_create(hdmi);
>   }
>   
> -static void dw_hdmi_bridge_detach(struct drm_bridge *bridge)
> -{
> -	struct dw_hdmi *hdmi = bridge->driver_private;
> -
> -	cec_notifier_conn_unregister(hdmi->cec_notifier);
> -	hdmi->cec_notifier = NULL;
> -}
> -
>   static enum drm_mode_status
>   dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
>   			  const struct drm_display_info *info,
> @@ -2972,7 +2951,6 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
>   	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>   	.atomic_reset = drm_atomic_helper_bridge_reset,
>   	.attach = dw_hdmi_bridge_attach,
> -	.detach = dw_hdmi_bridge_detach,
>   	.atomic_check = dw_hdmi_bridge_atomic_check,
>   	.atomic_get_output_bus_fmts = dw_hdmi_bridge_atomic_get_output_bus_fmts,
>   	.atomic_get_input_bus_fmts = dw_hdmi_bridge_atomic_get_input_bus_fmts,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
