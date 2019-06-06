Return-Path: <SRS0=ULSD=UF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C394C04AB5
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 17:11:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61ED320693
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 17:11:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DqmcZWBM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RQX9Zmd7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61ED320693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QLobLzKc0N5/KgYiXT3l+9b8MkX7vtriyEwy7tyd3CU=; b=DqmcZWBMwtkppB
	jt/5RJs6l4sBLoRJPqNraiNyTI5M2KRVc61GTuMdc8rfAX/4OjZ706fn6VTaKjdzl2ovzsNaacOK3
	UaOVgXgRag+jf1c+2BESObbKxI3uCiA7axQgQ1VkJfnzRZpEmpI9oS3unDoc5RSvpJdvjKm/8RnWJ
	sXwDdb36G9XjTbz0dmrJxZBJ8oYxqUV/WAGySS4L5+ndgyw20y+J3A5WPRwy4MUOxQOWHcYdkYpiF
	YA3CSXWLGg/YTIGIKtIRKrK6QVRa2xlgUzy35Qp+SqlshRc6kVKHQq9tSdyoU4mKq9TXVPK3Q+e8n
	rI7a1tMk7uQsO2u9JATw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYvvH-000511-Sx; Thu, 06 Jun 2019 17:11:31 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYvvF-00050Y-77
 for linux-amlogic@lists.infradead.org; Thu, 06 Jun 2019 17:11:31 +0000
Received: by mail-pf1-x441.google.com with SMTP id q10so1886545pff.9
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2019 10:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=RCCjbZWfEuhDbIeAIpWgax0k0rY3XOyq9KErPV874w4=;
 b=RQX9Zmd7Ya0CO1A5hU/4D9dIT22w59V6XzJvApJdP+FGeMxmEJEUajaDdYMScR+7FO
 6LP+oX4K23otZ8pw7ZaTgHfdUR/5SJHAozY5T+vMbVjGkMDHyPA2AnInUTrZZUf2ZB6H
 cupN8da+xYoz7g+x6dd59J0XIsHg+n3XBqTaR4V0kdiiCWY1OXga6TBK3BXtYEuhU8Pv
 O9GZIp4WYP5U4nde+l06o1BLj3ygXyrVUai2+/y5FQajV4RbYQsu59UNEujIuLRUy5tB
 ss+g1KXATzztltf/6Iv8K3PUVFnDFu9bf/as33ism4ujknnqKSLf0DWR8qe8nPPMVx6C
 0Jng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=RCCjbZWfEuhDbIeAIpWgax0k0rY3XOyq9KErPV874w4=;
 b=ktL+djFk9ax+mrqTJWmn6Rgvsp/YZpLrstCYgWoDuZ4yF7TblEZ6STg14MYPsuVhKT
 MEZUu3SyKkN++M7KySgjfzNJ6sAObnP0ewzNckFt+CqHRrDsq2ZNh+S0UDPrMsta19Hu
 g1DAtpgx7VWs1l9rH3Nf8YyOKnoX81EGgq0moZDLG5ttooSHBhCXlWijEda+gCL12dah
 +/44jnkG+FrKIwQmOvR/b29ZzP8yR93HAvXGCv67IyrpC1Oc9h1gfVzPerJLr1rDww8K
 HRowEYY9c/ZIh1pKIm2imMq6Euq8VGeWCTb5PRRXL2uoLhrMu7Zf34Hzgr/C59G2IzhV
 WQ4g==
X-Gm-Message-State: APjAAAUS6CTJQbFZbPJhHgBypvStdIMJlDQ8qYAHZTlrXR2piMBY5wZQ
 af5HPr+QGGgvP2DwPT8mzrOriQ==
X-Google-Smtp-Source: APXvYqzDEcNItKsI90UQVxfUSnXTWlpL13u+ek16QryxLZB/K5zFkxlS5RhK+PwwS6ep3GViFH4ZCA==
X-Received: by 2002:a63:f10e:: with SMTP id f14mr4221110pgi.226.1559841088435; 
 Thu, 06 Jun 2019 10:11:28 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id 16sm2415912pfo.65.2019.06.06.10.11.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 10:11:27 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 4/5] drm/meson: Add YUV420 output support
In-Reply-To: <20190520133753.23871-5-narmstrong@baylibre.com>
References: <20190520133753.23871-1-narmstrong@baylibre.com>
 <20190520133753.23871-5-narmstrong@baylibre.com>
Date: Thu, 06 Jun 2019 10:11:26 -0700
Message-ID: <7hmuiuej0h.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_101129_303434_B145162C 
X-CRM114-Status: GOOD (  20.74  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, maxime.ripard@bootlin.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> This patch adds support for the YUV420 output from the Amlogic Meson SoCs
> Video Processing Unit to the HDMI Controller.
>
> The YUV420 is obtained by generating a YUV444 pixel stream like
> the classic HDMI display modes, but then the Video Encoder output
> can be configured to down-sample the YUV444 pixel stream to a YUV420
> stream.
> In addition if pixel stream down-sampling, the Y Cb Cr components must
> also be mapped differently to align with the HDMI2.0 specifications.
>
> This mode needs a different clock generation scheme since the TMDS PHY
> clock must match the 10x ration with the YUV420 pixel clock, but

s/ration/ratio/

> the video encoder must run at 2x the pixel clock.
>
> This patch adds the TMDS PHY clock value in all the video clock setup
> in order to better support these specific uses cases and switch
> to the Common Clock framework for clocks handling in the future.
>
> When 420 is needed, it calls drm_bridge_format_set() for notify the
> bridge the input format has changed to YUV420.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

with a couple very minor nits to cleanup below...

> ---
>  drivers/gpu/drm/meson/meson_dw_hdmi.c   | 100 +++++++++++++++++++-----
>  drivers/gpu/drm/meson/meson_vclk.c      |  93 ++++++++++++++++------
>  drivers/gpu/drm/meson/meson_vclk.h      |   7 +-
>  drivers/gpu/drm/meson/meson_venc.c      |   6 +-
>  drivers/gpu/drm/meson/meson_venc.h      |  11 +++
>  drivers/gpu/drm/meson/meson_venc_cvbs.c |   3 +-
>  6 files changed, 174 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 779da21143b9..5d67e2beba58 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -159,6 +159,7 @@ struct meson_dw_hdmi {
>  	struct regulator *hdmi_supply;
>  	u32 irq_stat;
>  	struct dw_hdmi *hdmi;
> +	unsigned long input_bus_format;
>  };
>  #define encoder_to_meson_dw_hdmi(x) \
>  	container_of(x, struct meson_dw_hdmi, encoder)
> @@ -308,6 +309,10 @@ static void meson_hdmi_phy_setup_mode(struct meson_dw_hdmi *dw_hdmi,
>  	struct meson_drm *priv = dw_hdmi->priv;
>  	unsigned int pixel_clock = mode->clock;
>  
> +	/* For 420, pixel clock is half unlike venc clock */
> +	if (dw_hdmi->input_bus_format == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
> +		pixel_clock /= 2;
> +
>  	if (dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
>  	    dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxm-dw-hdmi")) {
>  		if (pixel_clock >= 371250) {
> @@ -383,25 +388,36 @@ static void dw_hdmi_set_vclk(struct meson_dw_hdmi *dw_hdmi,
>  {
>  	struct meson_drm *priv = dw_hdmi->priv;
>  	int vic = drm_match_cea_mode(mode);
> +	unsigned int phy_freq;
>  	unsigned int vclk_freq;
>  	unsigned int venc_freq;
>  	unsigned int hdmi_freq;
>  
>  	vclk_freq = mode->clock;
>  
> +	/* For 420, pixel clock is half unlike venc clock */

minor grammar nit: put a comma after "half" (here and several other
places in the patch)

[...]

> @@ -722,17 +773,29 @@ static void meson_venc_hdmi_encoder_mode_set(struct drm_encoder *encoder,
>  	struct meson_dw_hdmi *dw_hdmi = encoder_to_meson_dw_hdmi(encoder);
>  	struct meson_drm *priv = dw_hdmi->priv;
>  	int vic = drm_match_cea_mode(mode);
> +	unsigned int ycrcb_map = MESON_VENC_MAP_CB_Y_CR;
> +	bool yuv420_mode = false;
>  
>  	DRM_DEBUG_DRIVER("\"%s\" vic %d\n", mode->name, vic);
>  
> +	if (dw_hdmi->input_bus_format == MEDIA_BUS_FMT_UYYVYY8_0_5X24) {
> +		ycrcb_map = MESON_VENC_MAP_CR_Y_CB;
> +		yuv420_mode = true;
> +	}
> +
>  	/* VENC + VENC-DVI Mode setup */
> -	meson_venc_hdmi_mode_set(priv, vic, mode);
> +	meson_venc_hdmi_mode_set(priv, vic, ycrcb_map, yuv420_mode, mode);
>  
>  	/* VCLK Set clock */
>  	dw_hdmi_set_vclk(dw_hdmi, mode);
>  
> -	/* Setup YUV444 to HDMI-TX, no 10bit diphering */
> -	writel_relaxed(0, priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
> +	if (dw_hdmi->input_bus_format == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
> +		/* Setup YUV420 to HDMI-TX, no 10bit diphering */
> +		writel_relaxed(2 | (2 << 2),

nit: #define'd bitfields would be better, IIUC, I see these named as
"use average" and "Convert to 420" in the datasheet.

[...]

> @@ -1508,8 +1510,8 @@ void meson_venc_hdmi_mode_set(struct meson_drm *priv, int vic,
>  	writel_relaxed((use_enci ? 1 : 2) |
>  		       (mode->flags & DRM_MODE_FLAG_PHSYNC ? 1 << 2 : 0) |
>  		       (mode->flags & DRM_MODE_FLAG_PVSYNC ? 1 << 3 : 0) |
> -		       4 << 5 |
> -		       (venc_repeat ? 1 << 8 : 0) |
> +		       (ycrcb_map << 5) |
> +		       (venc_repeat || yuv420_mode ? 1 << 8 : 0) |

Lots of magic constants here, but I guess there's no new ones, so it's
just a(nother) reminder for a future readability cleanup.

>  		       (hdmi_repeat ? 1 << 12 : 0),
>  		       priv->io_base + _REG(VPU_HDMI_SETTING));
>  

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
