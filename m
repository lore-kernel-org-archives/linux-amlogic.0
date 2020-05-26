Return-Path: <SRS0=ok2G=7I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82BF7C433E0
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2020 09:46:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C5332070A
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2020 09:46:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D6pFMQNg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rP/gLZ0I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C5332070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hc0BjRF4ruB+d2wk5YGz70c81MJcDqnvEHOXg4671Gc=; b=D6pFMQNgpqMZLS
	DH+hhy1RsN0UQVKRS7rrgO+xBzUOpV0ZRnPA8pjpW89gDdCYuLgV+jmvZ1c0m9adx0Ci9Id1I1UyT
	KQ3ybUz2qlnIJXayrgWcBZ3W2cU7G8YaObieMB7FFDhhIJGy4J4GykMXgTY1zItT8uKqelkWGhX8z
	6HGd3EBkiEy0uyKsjHEtIEaUpPjuhiahdtQYLuxMNps8Guq3B1aaHFA5IH6/CE6GamdLMmProqbeX
	hqBFmFNgGbwj7D/UYSkoHTeNJapkoZnETYn5AfNMTHcF6vDpqdD+zbwr1ZK3w52IpFuwn9PrZC9xT
	x1av8tNV+PpYR+AS98gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdWA0-0004Qj-Sw; Tue, 26 May 2020 09:46:12 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdW9x-0004QB-Dj
 for linux-amlogic@lists.infradead.org; Tue, 26 May 2020 09:46:11 +0000
Received: by mail-wm1-x343.google.com with SMTP id l26so2497615wme.3
 for <linux-amlogic@lists.infradead.org>; Tue, 26 May 2020 02:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JE7M/DOG5eNe02S3a9tw/mFppwNKRKAhsNHOS9L0a5w=;
 b=rP/gLZ0IEOPI8YWUQL3+5g8Deoc9fiGTQcB/wqafxLZpkeq0ao8ix87CTOot1yUGnY
 31yU4zgi+R4X2of/tuevgjqkkI4wT9k7C23L6wwtCncp+pgYtSUQSPfRjwZV9JpxZC/H
 kYbKNf1YjF3CKAulK0Zwa8jH8D/GknuciePmU9zYh70qs/95LFjGCFTIFIDN6oik/+Sg
 LZYGNgCCXQafBlfVIK+zwPG/+LJiOA7pkh2MrPduGiN7HcZeSa1zE8xIaMvBcZ1lRSkC
 fF1EGZpo82pe++vXGR+yQAi/lEEZ+jbxMCRJnq+efXQ3fN6DVbj2K9CRa9BLd881YWnf
 DpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=JE7M/DOG5eNe02S3a9tw/mFppwNKRKAhsNHOS9L0a5w=;
 b=iz2RRyqwIDkXyUtwmyOh5JwjtYyJtBpjAC1PUECYtOb6vSXkKQAw3hRHP+ROzLu2ro
 8jXyIl1t5/Xlt15JsgTkKdfO9aHK307vkafD2CVbkw2jvmbrWhxgrgAz6FGDFCQP89vR
 UGqUTdNSuNXdrRb0zxTaJxjOFkqwKbxwIOdICNub5fygqzwf0Qhwfranpkvcjo8J7yDN
 lywOnq4DVGqKZyQ4S9RERyGXXw7fxK+v2h+45kdQFwqYzgvZNAzcGxTgBT0pp+2uor7r
 PVHPjQK+QzwOcvb7ObNYtCYhgKbUmuvsbIP8GkHeX/SYXlbfgJL7QSxVmetAZEaV5nKN
 75+Q==
X-Gm-Message-State: AOAM533o9zu3tK+Uq8DoVBAXYYcBAuumHhoJAam3AXNeqNjvDO0G1Zf+
 EF4AH8f/osIGcn4WCwCgYTbTwSE3ORrArQ==
X-Google-Smtp-Source: ABdhPJxprWulAggCfDZ49kTpc9LOqq1dcw6R6a0YoB8HatCl0/pdi3cR5MuCmujxhdja3UKsH7j3eA==
X-Received: by 2002:a1c:acc8:: with SMTP id v191mr628336wme.154.1590486366684; 
 Tue, 26 May 2020 02:46:06 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b?
 ([2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b])
 by smtp.gmail.com with ESMTPSA id r2sm7660546wrg.68.2020.05.26.02.46.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2020 02:46:05 -0700 (PDT)
Subject: Re: [PATCH 15/27] drm: bridge: dw-hdmi: Pass drm_display_info to
 .mode_valid()
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-16-laurent.pinchart+renesas@ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <2c592eca-fd39-213f-6c4e-41f0e791aa05@baylibre.com>
Date: Tue, 26 May 2020 11:46:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200526011505.31884-16-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_024609_469004_0A826E7C 
X-CRM114-Status: GOOD (  19.82  )
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
> Replace the drm_connector pointer passed to the .mode_valid() function
> with a const drm_display_info pointer, as that's all the function should
> need. Use the display info passed to the bridge .mode_valid() operation
> instead of retrieving it from the connector, to prepare for make
> connector creation optional.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   |  5 ++---
>  drivers/gpu/drm/imx/dw_hdmi-imx.c           |  4 ++--
>  drivers/gpu/drm/meson/meson_dw_hdmi.c       | 20 ++++++++++----------
>  drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c      |  2 +-
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c |  2 +-
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c       |  4 ++--
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h       |  2 +-
>  include/drm/bridge/dw_hdmi.h                |  4 ++--
>  8 files changed, 21 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index adc5a95a06e9..23650e69604c 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2769,7 +2769,6 @@ dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
>  {
>  	struct dw_hdmi *hdmi = bridge->driver_private;
>  	const struct dw_hdmi_plat_data *pdata = hdmi->plat_data;
> -	struct drm_connector *connector = &hdmi->connector;
>  	enum drm_mode_status mode_status = MODE_OK;
>  
>  	/* We don't support double-clocked modes */
> @@ -2777,8 +2776,8 @@ dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
>  		return MODE_BAD;
>  
>  	if (pdata->mode_valid)
> -		mode_status = pdata->mode_valid(hdmi, pdata->priv_data,
> -						connector, mode);
> +		mode_status = pdata->mode_valid(hdmi, pdata->priv_data, info,
> +						mode);
>  
>  	return mode_status;
>  }
> diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
> index 95aed4666c95..2dc93fa6ecb6 100644
> --- a/drivers/gpu/drm/imx/dw_hdmi-imx.c
> +++ b/drivers/gpu/drm/imx/dw_hdmi-imx.c
> @@ -146,7 +146,7 @@ static const struct drm_encoder_helper_funcs dw_hdmi_imx_encoder_helper_funcs =
>  
>  static enum drm_mode_status
>  imx6q_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
> -		      struct drm_connector *con,
> +		      const struct drm_display_info *info,
>  		      const struct drm_display_mode *mode)
>  {
>  	if (mode->clock < 13500)
> @@ -160,7 +160,7 @@ imx6q_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
>  
>  static enum drm_mode_status
>  imx6dl_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
> -		       struct drm_connector *con,
> +		       const struct drm_display_info *info,
>  		       const struct drm_display_mode *mode)
>  {
>  	if (mode->clock < 13500)
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 34ba94922605..71d599970ec7 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -631,12 +631,12 @@ static irqreturn_t dw_hdmi_top_thread_irq(int irq, void *dev_id)
>  
>  static enum drm_mode_status
>  dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
> -		   struct drm_connector *connector,
> +		   const struct drm_display_info *display_info,
>  		   const struct drm_display_mode *mode)
>  {
>  	struct meson_dw_hdmi *dw_hdmi = data;
>  	struct meson_drm *priv = dw_hdmi->priv;
> -	bool is_hdmi2_sink = connector->display_info.hdmi.scdc.supported;
> +	bool is_hdmi2_sink = display_info->hdmi.scdc.supported;
>  	unsigned int phy_freq;
>  	unsigned int vclk_freq;
>  	unsigned int venc_freq;
> @@ -647,10 +647,10 @@ dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
>  	DRM_DEBUG_DRIVER("Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
>  
>  	/* If sink does not support 540MHz, reject the non-420 HDMI2 modes */
> -	if (connector->display_info.max_tmds_clock &&
> -	    mode->clock > connector->display_info.max_tmds_clock &&
> -	    !drm_mode_is_420_only(&connector->display_info, mode) &&
> -	    !drm_mode_is_420_also(&connector->display_info, mode))
> +	if (display_info->max_tmds_clock &&
> +	    mode->clock > display_info->max_tmds_clock &&
> +	    !drm_mode_is_420_only(display_info, mode) &&
> +	    !drm_mode_is_420_also(display_info, mode))
>  		return MODE_BAD;
>  
>  	/* Check against non-VIC supported modes */
> @@ -667,9 +667,9 @@ dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
>  	vclk_freq = mode->clock;
>  
>  	/* For 420, pixel clock is half unlike venc clock */
> -	if (drm_mode_is_420_only(&connector->display_info, mode) ||
> +	if (drm_mode_is_420_only(display_info, mode) ||
>  	    (!is_hdmi2_sink &&
> -	     drm_mode_is_420_also(&connector->display_info, mode)))
> +	     drm_mode_is_420_also(display_info, mode)))
>  		vclk_freq /= 2;
>  
>  	/* TMDS clock is pixel_clock * 10 */
> @@ -684,9 +684,9 @@ dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
>  
>  	/* VENC double pixels for 1080i, 720p and YUV420 modes */
>  	if (meson_venc_hdmi_venc_repeat(vic) ||
> -	    drm_mode_is_420_only(&connector->display_info, mode) ||
> +	    drm_mode_is_420_only(display_info, mode) ||
>  	    (!is_hdmi2_sink &&
> -	     drm_mode_is_420_also(&connector->display_info, mode)))
> +	     drm_mode_is_420_also(display_info, mode)))
>  		venc_freq *= 2;
>  
>  	vclk_freq = max(venc_freq, hdmi_freq);
> diff --git a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
> index d0dffe55a7cb..7b8ec8310699 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
> @@ -39,7 +39,7 @@ static const struct rcar_hdmi_phy_params rcar_hdmi_phy_params[] = {
>  
>  static enum drm_mode_status
>  rcar_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
> -		     struct drm_connector *connector,
> +		     const struct drm_display_info *info,
>  		     const struct drm_display_mode *mode)
>  {
>  	/*
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> index d08f86783a28..d286751bb333 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> @@ -221,7 +221,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
>  
>  static enum drm_mode_status
>  dw_hdmi_rockchip_mode_valid(struct dw_hdmi *hdmi, void *data,
> -			    struct drm_connector *connector,
> +			    const struct drm_display_info *info,
>  			    const struct drm_display_mode *mode)
>  {
>  	const struct dw_hdmi_mpll_config *mpll_cfg = rockchip_mpll_cfg;
> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> index 0a3637442ba6..d4c08043dd81 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> @@ -32,7 +32,7 @@ sun8i_dw_hdmi_encoder_helper_funcs = {
>  
>  static enum drm_mode_status
>  sun8i_dw_hdmi_mode_valid_a83t(struct dw_hdmi *hdmi, void *data,
> -			      struct drm_connector *connector,
> +			      const struct drm_display_info *info,
>  			      const struct drm_display_mode *mode)
>  {
>  	if (mode->clock > 297000)
> @@ -43,7 +43,7 @@ sun8i_dw_hdmi_mode_valid_a83t(struct dw_hdmi *hdmi, void *data,
>  
>  static enum drm_mode_status
>  sun8i_dw_hdmi_mode_valid_h6(struct dw_hdmi *hdmi, void *data,
> -			    struct drm_connector *connector,
> +			    const struct drm_display_info *info,
>  			    const struct drm_display_mode *mode)
>  {
>  	/*
> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> index 8587b8d2590e..d983746fa194 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> @@ -177,7 +177,7 @@ struct sun8i_hdmi_phy {
>  
>  struct sun8i_dw_hdmi_quirks {
>  	enum drm_mode_status (*mode_valid)(struct dw_hdmi *hdmi, void *data,
> -					   struct drm_connector *connector,
> +					   const struct drm_display_info *info,
>  					   const struct drm_display_mode *mode);
>  	unsigned int set_rate : 1;
>  	unsigned int use_drm_infoframe : 1;
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 5dfa9d83e2d3..fec293b21c2e 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -8,7 +8,7 @@
>  
>  #include <sound/hdmi-codec.h>
>  
> -struct drm_connector;
> +struct drm_display_info;
>  struct drm_display_mode;
>  struct drm_encoder;
>  struct dw_hdmi;
> @@ -137,7 +137,7 @@ struct dw_hdmi_plat_data {
>  
>  	/* Platform-specific mode validation (optional). */
>  	enum drm_mode_status (*mode_valid)(struct dw_hdmi *hdmi, void *data,
> -					   struct drm_connector *connector,
> +					   const struct drm_display_info *info,
>  					   const struct drm_display_mode *mode);
>  
>  	/* Vendor PHY support */
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
