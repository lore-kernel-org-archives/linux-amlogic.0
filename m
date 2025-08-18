Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76500CA0EEB
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Aug 2025 13:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Iqh/BaBhndv/OpXUOZ0JNarr8CiD3UY15HUvc7o4us=; b=pkE+vWHPv32vkNlFmg7eg79wDd
	HaFz51DKvwXdhM1rYcQQydoxevDY8HGIRgsQUNOiYussQqVDFxb/RcPWTz8mnB+Vyb31T8rH67ND4
	VbWbnL6lK7Ua7BRRVDvapDsX2t6bfcWWwYbt6qCGN/n/HuStt2S0Xjk8dkYFoN7QcYw4Uu5NU69uU
	vLXxsQEK5VY4VsCgfdrNSTIMYp7McrK4QwqHDTZKDTe0zPw2HUjH5g4XxdUxiH4xbfxxCajk8UXHO
	+gbQfuypDwfpoc12GWpKsxdw0NKa9Z1NtVHHzr0EiKnMaLE+tk9JRpqW8cBSkb657Sbrhnn7exqEZ
	51sDv1WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo03G-00000007Ty2-2tOG;
	Mon, 18 Aug 2025 13:37:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unuuh-00000006udl-3iW3
	for linux-amlogic@bombadil.infradead.org;
	Mon, 18 Aug 2025 08:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=rUNGkpO4Bj6949FkP0Yja1jszmdmG380tow+zHeqATc=; b=OnXijxx2AB8rkDTWpS3aFRgKkf
	GAuae3yWJsUNLx2eBp4J3/XxOaHV8DtZg+rmkmoBrEP9mMuMpqPQ3LvKcPAu5xhi3xqoH3feP32PP
	v87WoGxLt7v2pdp6MnR41MHltPXtL5ZVfFF/fy8B5DuVclUIT3jdjIahSYiyyIMhwJq4azgt42ilR
	iQT3t454UH1bF0x9Qg+yrvIqKodpP7Qyh8gPJxdgByBktqpUCRIWhxd74VtgpnbvA86Moa6ioJbvL
	k+bJ7qVsyFeVMcVqI3dZI3lhlP4LPvC980WvSdtF6t2hfz5n4WSNd5FEtxqARQzA2TfzY8vGNebP2
	wRIme3Zg==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unuud-0000000HJbr-2ihv
	for linux-amlogic@lists.infradead.org;
	Mon, 18 Aug 2025 08:08:18 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45a1b0d224dso18761135e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 18 Aug 2025 01:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755504494; x=1756109294; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUNGkpO4Bj6949FkP0Yja1jszmdmG380tow+zHeqATc=;
        b=uX5Hdq9MFVzemisUSnsbMGLrgWX4wCqxXkHP8nShiwpvvjeHdTw0xPHJGMKItuPSOM
         MSfVLFecFUWMitfZWB7yNL55ohMezWhYkihYK5xovGmIXDbHZQv5I8MrUhDHxzequvnf
         3u549o8JiJhSHX+DHWMeJDk9S/d9I6plPaY40fzX/5lay+3kEX5r/Bvp1nKU5oZqScz+
         n1Hng0eEI/um1fxsMPTL3KnQNd5l2uCWN482fsL1df72MdaJLp/gqCLutCdkrbrMpgKU
         WTneKKUotcGZguFsMMnllbv1l2S3tYrEcaRCiYLmA9z3/XyW5EYLmKdMVXBIkDUdn7EN
         t/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755504494; x=1756109294;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rUNGkpO4Bj6949FkP0Yja1jszmdmG380tow+zHeqATc=;
        b=UY4AHxepmnpjf6ur92SK1K8sOq7YyOZTPNqofKfQ73NWP7m7SBExSVydadfbE9xJdV
         P8cGnw8MKq4lnG31yE1Sf9n1IA82Kzic2M3QMbL29mHfkVXU6cHmMnzciESaf3GOIZNH
         TS1HJuN7qedlwPLh6LvbkH8gOWa6mNS/rMUU/dT9B1IWyUxce7YRfPWAXZ+l76a7Tued
         yqZOlZsd2FXArnEp6HTzVWHAnqvzQ1KaLPyexFVIVeqS+fUVl86gs3xV4foKqGTnRfEh
         fpRgI5bXrOOzeYOVKfEtOR37opbaIOCwFLN+3IgVTX6io3Yr0Y/neUQsDtKuZQrhMCZo
         Ns6A==
X-Forwarded-Encrypted: i=1; AJvYcCXsN6FcgxwNyD4pSFhWk1mCLr5ITCoa0x+/eWaSLsHP4sK9+EIih0h8whP6oXSjeHFjBdPCs8/e2V2ZTsJ0@lists.infradead.org
X-Gm-Message-State: AOJu0YzMe1fljZZ+I7d1So+o7khvetFrWNhq65kFq3dJ9qY5rK0OnfDn
	WS/CJN8X0oC0PztDpqx3RM0VFkGSOVIe9eWPfiiBOoqbKVflfVhJw6bmX+q58ctxNQU=
X-Gm-Gg: ASbGncs4Z1cTDCYQmGu62SymS3ME0PuUX1tUzXRIzZYJU7S7dSbm9gT/T9mKOG/9BPl
	p8mT5tj0VoEhz6pckRvEzg9p5fSWQeEqqU9oocSrL2RkBZvLAqOFVUH7Do9YwcBgE7sJ/awDVhw
	kM01o3e+/NfzEAgvwHdi+K9p3j5TyJHzDFiwtgd7WX5+jQYYs3APmCR99Uqfekj8PCoxDaVBkpT
	xHSFmfJDjpEa4H8ICwrSuu0KnVcpvmmuTCaqG75sS6rY3411HWJ2OgXU546gSb5jUSBlQAbcdjm
	rrEsD8w5zmcnqxRzdRnVeyURy8NhSObc7TpnleQd7hu+C7JY0MzEjqanHio9gg3eBqOet9F+QOG
	exHgOwQKUVxIKpA4TI/KHiRBLzB5sYwUP1fdhrjyFtcpzliuwidpkmu1yXilYonyRBJqC7sjw
X-Google-Smtp-Source: AGHT+IHEM62e9pbBVitK2clt1VV7OlbcJpPegVTu73FKhD1duGOlewFnegIrBDPdbp9Z/MC7kDWGMA==
X-Received: by 2002:a05:600c:4e86:b0:456:1514:5b04 with SMTP id 5b1f17b1804b1-45a2183a7f1mr82250165e9.21.1755504493826;
        Mon, 18 Aug 2025 01:08:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:70d:8646:e014:cc6e? ([2a01:e0a:3d9:2080:70d:8646:e014:cc6e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a221bbadfsm121465845e9.0.2025.08.18.01.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 01:08:12 -0700 (PDT)
Message-ID: <744209a8-7a7e-4909-b608-8bfc70a8727b@linaro.org>
Date: Mon, 18 Aug 2025 10:08:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND 1/2] drm/bridge: add connector argument to
 .hpd_notify callback
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
 <20250803-lt9611uxc-hdmi-v1-1-cb9ce1793acf@oss.qualcomm.com>
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
In-Reply-To: <20250803-lt9611uxc-hdmi-v1-1-cb9ce1793acf@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_090815_915828_28AA2E37 
X-CRM114-Status: GOOD (  18.11  )
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

On 03/08/2025 13:53, Dmitry Baryshkov wrote:
> Drivers might need to update DRM connector in the
> drm_bridge_funcs.hpd_notify callback (e.g. it might be necessary to
> update EDID before setting ELD). Add corresponding argument to the
> callback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/display/drm_bridge_connector.c | 2 +-
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c     | 1 +
>   drivers/gpu/drm/msm/dp/dp_display.c            | 3 ++-
>   drivers/gpu/drm/msm/dp/dp_drm.h                | 3 ++-
>   drivers/gpu/drm/omapdrm/dss/hdmi4.c            | 1 +
>   include/drm/drm_bridge.h                       | 1 +
>   6 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 5eb7e9bfe36116c9618cd3773f1c01e7ebb573be..f2fd277d694b8c959f913517ff5861b777d8a9dd 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -141,7 +141,7 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
>   	/* Notify all bridges in the pipeline of hotplug events. */
>   	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
>   		if (bridge->funcs->hpd_notify)
> -			bridge->funcs->hpd_notify(bridge, status);
> +			bridge->funcs->hpd_notify(bridge, connector, status);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 8205ee56a691ee7d166b16cfce6932d0308fe6c4..a665c9036878c1e879b7bd88df1d523658fe8849 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -323,6 +323,7 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
>   }
>   
>   static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
> +					  struct drm_connector *connector,
>   					  enum drm_connector_status status)
>   {
>   	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d87d47cc7ec3eb757ac192c411000bc50b824c59..0676b3423abcb31ac3ea6e6269473764786133ed 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1774,7 +1774,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
>   }
>   
>   void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
> -			  enum drm_connector_status status)
> +			      struct drm_connector *connector,
> +			      enum drm_connector_status status)
>   {
>   	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
>   	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
> index d8c9b905f8bfb5abe47c1cb26d17bc605e3e1ba6..9eb3431dd93adf096f45b6d981967734bc8a2b0c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.h
> @@ -40,6 +40,7 @@ void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
>   void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
>   void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
>   void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
> -			  enum drm_connector_status status);
> +			      struct drm_connector *connector,
> +			      enum drm_connector_status status);
>   
>   #endif /* _DP_DRM_H_ */
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> index 3cd612af24498b057c33eaecb3d43c8df76cd23e..29b2dfb90b5fa3b137d05725d65a1cccb9cd1345 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> @@ -428,6 +428,7 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
>   }
>   
>   static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
> +				    struct drm_connector *connector,
>   				    enum drm_connector_status status)
>   {
>   	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 8ed80cad77ec4b40d0aa6159e802a2839d5b8792..1e73d72c55426ec21905070a13b44aa36b02e023 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -730,6 +730,7 @@ struct drm_bridge_funcs {
>   	 * controllers for HDMI bridges.
>   	 */
>   	void (*hpd_notify)(struct drm_bridge *bridge,
> +			   struct drm_connector *connector,
>   			   enum drm_connector_status status);
>   
>   	/**
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
