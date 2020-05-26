Return-Path: <SRS0=ok2G=7I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A424C433E0
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2020 09:45:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3BDB2070A
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2020 09:45:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qy2AZpYA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dfCNIkuL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3BDB2070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qIX8dpRmv71GdnoyfzsAjqb22ffmR6LXlPy1GN22Zbk=; b=Qy2AZpYAnQv/Gy
	gQboRSzJDHHL8R591yQ9O2r3KZ8FVPY1Dn5+E99mZ3cqnQJqKZJcsyul/ln7VG8860zM3T+Ass5QV
	FcYs5aelXY/hoREpJJuZxpqhYD+EFtnJxn0BZuXEym2bdlTtdjhSj3Jil/cswxs14pgn1kqOTiV7+
	ClJoD1l337hNXWKwhXrr+eW0VHjUbJS5T1IWDv8mfE9ogGPU6WzZhy7ZiyBfswU7jypx9oTQ1MX7X
	Q9OZZpmp6goRL2fDZnjEnQPQ7x33A+YF9bGllxPYBXEWz25we/mGKtbnYBybbZsvJNorLATNBInFl
	XSOoE66ieh6veV/kKpSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdW8g-0001vG-5L; Tue, 26 May 2020 09:44:50 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdW8a-0001ud-6i
 for linux-amlogic@lists.infradead.org; Tue, 26 May 2020 09:44:46 +0000
Received: by mail-wr1-x444.google.com with SMTP id i15so19686467wrx.10
 for <linux-amlogic@lists.infradead.org>; Tue, 26 May 2020 02:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jvd/Msx8XNS3IhYCMjYxLkOMwT8rs711vu+5COC05iE=;
 b=dfCNIkuLZc6q+ICvWvlN1oqSool5yufNj55YFOXluYiVqF6uW6v4YUWzEWYZXGg0S7
 UJlFxfeTR6d/nz/XOXzfTRju1/ABeDRyFlgbkACsMGg5MATmTxXCCwrXuX5Tl1UNlyYF
 QSUchN09cwE7ddf3ehZSjcgK9MynOrQD35rKRezHL4ntTd+qSbQvfldY/xmBreK1RjJM
 VA20UZ0GvRNFs7xp8/F1uPRwSqHB0c4qNlWWWSQXci+hurGg+KzFyUvrWRmXI9K6xhGw
 EJsJX3AF9BH/nh8PAXJnKCQHPs1P6DlvviLhZ/2fAVt84XkyD/xTGZ2+2zj27Vn5Gz5B
 QGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Jvd/Msx8XNS3IhYCMjYxLkOMwT8rs711vu+5COC05iE=;
 b=ike8RbLk1C3aNpqAzyEBA5cNRMI6aJLo4MkWo7hQaUA81EPi6dqOWvrGQbxJiyeD++
 6Ngggr3wK5wr/LM9RSGO7nXVRM5C05W5J1BfOZL4NXDMOfc3SVIR5gEGShJ4jnjgByva
 yKe/WHqulAwJu6obL4SpHZvn+vb/U+XgwJO9I7YHaGzfTOxQLwWxQei+BBi/6H6lRFRO
 is2/YfKzMSCrj0PdnzYeppfeYXKckcl7LHWnh0HABZtXf4xjl8XurwAxhmRI/3+/Kihx
 RKAhuX64r/co33jKhLBrj3/UAAt8KgMNXgQhtdvb6g3Gx9IIj+LLu7Z8K7eN/J4eeYrL
 y51g==
X-Gm-Message-State: AOAM532ZKVUvhKKazKJzaUZeYWBYvVG3YGX42sGUD6b2PT8LORB4VWzB
 plt07DLoW5/omWDctXkpVDVScAmGPN642w==
X-Google-Smtp-Source: ABdhPJx9hX1YOOhpgnYpQo8zIRJ9IUJvRteEGrUyvwf81IpsiXWjZQt1WTAdMPocBRbSLrzCIccyGw==
X-Received: by 2002:adf:fe45:: with SMTP id m5mr18748501wrs.257.1590486279999; 
 Tue, 26 May 2020 02:44:39 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b?
 ([2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b])
 by smtp.gmail.com with ESMTPSA id x186sm13039144wmg.8.2020.05.26.02.44.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2020 02:44:39 -0700 (PDT)
Subject: Re: [PATCH 11/27] drm: bridge: dw-hdmi: Pass private data pointer to
 .mode_valid()
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-12-laurent.pinchart+renesas@ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <ba4aff85-56f1-42b0-8049-ed3ab5eb5559@baylibre.com>
Date: Tue, 26 May 2020 11:44:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200526011505.31884-12-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_024444_307996_C907367B 
X-CRM114-Status: GOOD (  21.10  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-amlogic@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 26/05/2020 03:14, Laurent Pinchart wrote:
> Platform glue drivers for dw_hdmi may need to access device-specific
> data from their .mode_valid() implementation. They currently have no
> clean way to do so, and one driver hacks around it by accessing the
> dev_private data of the drm_device retrieved from the connector.
> 
> Add a priv_data void pointer to the dw_hdmi_plat_data structure, and
> pass it to the .mode_valid() function.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   |  6 ++++--
>  drivers/gpu/drm/imx/dw_hdmi-imx.c           |  6 ++++--
>  drivers/gpu/drm/meson/meson_dw_hdmi.c       |  3 ++-
>  drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c      |  3 ++-
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c |  3 ++-
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c       |  6 ++++--
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h       |  3 ++-
>  include/drm/bridge/dw_hdmi.h                | 14 ++++++++++++--
>  8 files changed, 32 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index b535354150db..2b3f203cf467 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2771,6 +2771,7 @@ dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
>  			  const struct drm_display_mode *mode)
>  {
>  	struct dw_hdmi *hdmi = bridge->driver_private;
> +	const struct dw_hdmi_plat_data *pdata = hdmi->plat_data;
>  	struct drm_connector *connector = &hdmi->connector;
>  	enum drm_mode_status mode_status = MODE_OK;
>  
> @@ -2778,8 +2779,9 @@ dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
>  	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
>  		return MODE_BAD;
>  
> -	if (hdmi->plat_data->mode_valid)
> -		mode_status = hdmi->plat_data->mode_valid(connector, mode);
> +	if (pdata->mode_valid)
> +		mode_status = pdata->mode_valid(hdmi, pdata->priv_data,
> +						connector, mode);
>  
>  	return mode_status;
>  }
> diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
> index ba4ca17fd4d8..95aed4666c95 100644
> --- a/drivers/gpu/drm/imx/dw_hdmi-imx.c
> +++ b/drivers/gpu/drm/imx/dw_hdmi-imx.c
> @@ -145,7 +145,8 @@ static const struct drm_encoder_helper_funcs dw_hdmi_imx_encoder_helper_funcs =
>  };
>  
>  static enum drm_mode_status
> -imx6q_hdmi_mode_valid(struct drm_connector *con,
> +imx6q_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
> +		      struct drm_connector *con,
>  		      const struct drm_display_mode *mode)
>  {
>  	if (mode->clock < 13500)
> @@ -158,7 +159,8 @@ imx6q_hdmi_mode_valid(struct drm_connector *con,
>  }
>  
>  static enum drm_mode_status
> -imx6dl_hdmi_mode_valid(struct drm_connector *con,
> +imx6dl_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
> +		       struct drm_connector *con,
>  		       const struct drm_display_mode *mode)
>  {
>  	if (mode->clock < 13500)
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 5be963e9db05..5cc311c1b8e0 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -630,7 +630,8 @@ static irqreturn_t dw_hdmi_top_thread_irq(int irq, void *dev_id)
>  }
>  
>  static enum drm_mode_status
> -dw_hdmi_mode_valid(struct drm_connector *connector,
> +dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
> +		   struct drm_connector *connector,
>  		   const struct drm_display_mode *mode)
>  {
>  	struct meson_drm *priv = connector->dev->dev_private;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
> index 452461dc96f2..4d837a4d302d 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
> @@ -38,7 +38,8 @@ static const struct rcar_hdmi_phy_params rcar_hdmi_phy_params[] = {
>  };
>  
>  static enum drm_mode_status
> -rcar_hdmi_mode_valid(struct drm_connector *connector,
> +rcar_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
> +		     struct drm_connector *connector,
>  		     const struct drm_display_mode *mode)
>  {
>  	/*
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> index 121aa8a63a76..d08f86783a28 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> @@ -220,7 +220,8 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
>  }
>  
>  static enum drm_mode_status
> -dw_hdmi_rockchip_mode_valid(struct drm_connector *connector,
> +dw_hdmi_rockchip_mode_valid(struct dw_hdmi *hdmi, void *data,
> +			    struct drm_connector *connector,
>  			    const struct drm_display_mode *mode)
>  {
>  	const struct dw_hdmi_mpll_config *mpll_cfg = rockchip_mpll_cfg;
> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> index 972682bb8000..0a3637442ba6 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> @@ -31,7 +31,8 @@ sun8i_dw_hdmi_encoder_helper_funcs = {
>  };
>  
>  static enum drm_mode_status
> -sun8i_dw_hdmi_mode_valid_a83t(struct drm_connector *connector,
> +sun8i_dw_hdmi_mode_valid_a83t(struct dw_hdmi *hdmi, void *data,
> +			      struct drm_connector *connector,
>  			      const struct drm_display_mode *mode)
>  {
>  	if (mode->clock > 297000)
> @@ -41,7 +42,8 @@ sun8i_dw_hdmi_mode_valid_a83t(struct drm_connector *connector,
>  }
>  
>  static enum drm_mode_status
> -sun8i_dw_hdmi_mode_valid_h6(struct drm_connector *connector,
> +sun8i_dw_hdmi_mode_valid_h6(struct dw_hdmi *hdmi, void *data,
> +			    struct drm_connector *connector,
>  			    const struct drm_display_mode *mode)
>  {
>  	/*
> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> index 8e64945167e9..8587b8d2590e 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> @@ -176,7 +176,8 @@ struct sun8i_hdmi_phy {
>  };
>  
>  struct sun8i_dw_hdmi_quirks {
> -	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
> +	enum drm_mode_status (*mode_valid)(struct dw_hdmi *hdmi, void *data,
> +					   struct drm_connector *connector,
>  					   const struct drm_display_mode *mode);
>  	unsigned int set_rate : 1;
>  	unsigned int use_drm_infoframe : 1;
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 0b34a12c4a1c..66a811f75b91 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -124,13 +124,23 @@ struct dw_hdmi_phy_ops {
>  
>  struct dw_hdmi_plat_data {
>  	struct regmap *regm;
> -	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
> -					   const struct drm_display_mode *mode);
> +
>  	unsigned long input_bus_format;
>  	unsigned long input_bus_encoding;
>  	bool use_drm_infoframe;
>  	bool ycbcr_420_allowed;
>  
> +	/*
> +	 * Private data passed to all the .mode_valid() and .configure_phy()
> +	 * callback functions.
> +	 */
> +	void *priv_data;
> +
> +	/* Platform-specific mode validation (optional). */
> +	enum drm_mode_status (*mode_valid)(struct dw_hdmi *hdmi, void *data,
> +					   struct drm_connector *connector,
> +					   const struct drm_display_mode *mode);
> +
>  	/* Vendor PHY support */
>  	const struct dw_hdmi_phy_ops *phy_ops;
>  	const char *phy_name;
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
