Return-Path: <SRS0=ULSD=UF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A26C04AB5
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 17:16:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BC1F2083E
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 17:16:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xw/GJHfP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JvFJGBll"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BC1F2083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c7PGaQRCFAib6HOiGXz27ormqY3PE8GsSHbrAX4KHFw=; b=Xw/GJHfPP8FXea
	rvlLvLAnKmbzvd5gHb8wPL33h6Pm7mBhIrGNn8+5VG5wt2iQr8tmX0oe/JetQumSPxl6OHy6/93Ie
	OqGJ1I0EvgmzMJiSitXqcTM1zKUcx1n67LcRprfYzk5i6veDGmQU2lL+vJBMx97nTFCUXr8bnRbBF
	fOar9jDV4yeJQlmQkn0eCHX0BFwM5VBbD1w5NdTZLVK5Lh32tYCInWJHw3Bfaptas92AnarjZIfjm
	7bfBh16NhmSp+/wP/3ymSQ3boF4A70kUVOuCQ11IlV1dyrBeRcNUkHwXMKXYXRSngl8YzYiWLqUdw
	ND5jnlURksmmrjP0f7aw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYw02-0006f0-O3; Thu, 06 Jun 2019 17:16:26 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYvzz-0006e7-EK
 for linux-amlogic@lists.infradead.org; Thu, 06 Jun 2019 17:16:25 +0000
Received: by mail-pg1-x541.google.com with SMTP id 83so1710445pgg.8
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2019 10:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=xnaB2870GZB3eebBLaFXdIrfqP4QtLP9AtgtNluS/2w=;
 b=JvFJGBllEIiVn10M5nTs1mgkkLBPu51n9nLenLTex4m91pcKEXxMcR8HgL38rDgxpt
 /7kpJqIJXpaRYIMqyI/IJUvNaDNLcGVNfYJUuuGPPdSPKPzZzAngwCjjezS7DWKqlvjG
 xfz6nAZrcalJOVS8eO8PMqMLkVwGjHE2VrZosDZ7wDGAb8ILHFHz6Oz5JEmqJtKBGssG
 pe0DO2MFLSTWPVGrQmVJZi1gOy0zRxzO//aBA2BLR80LRx4g6pss0bcRUjIE3B7eCI5e
 Q8YqCc7E9uk25MyirLfO3B3kl6rrVlQwLHZ67vz/C+iv0QEGnUYhzz0f0K2jdwGyFpST
 qutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=xnaB2870GZB3eebBLaFXdIrfqP4QtLP9AtgtNluS/2w=;
 b=RfQqE7FF+rB+uR+WIjJ0Yj89FsNiJiWfGWHTPpIVPb2Kn3G6RFJNyLYZAbWvabuvqr
 fuC3Nmk3w1cmz5/xfyLBHcKA69dnnQCLuHAanXCDFgQimFBgv5EPFyxnamPXMhArAWYb
 fHGN87olmhbSvpXpUmAykOa0W/eskwW28u+nLWGZHMII44q0NnuHTG4Wwrr+o6mbKAMy
 v5LX6vX7vhcmae6GmyK0U7z5Xo5o8EaQgD0wGZ5jnrR6Tkn3XFf8dcWsvu5ilcIIh5AX
 4kQYYm68D1aTYDV1SY2xqLqrluKI+Squ0KFCDbK1ZAiyxFQLossMqa2nrdgKlZvIZsuP
 iyVQ==
X-Gm-Message-State: APjAAAUndRuY2wTkfFnsOh/Fn3MqPVbFVk5aR+vrBdgLuZ0GtYH+CCcI
 iM+7KQd+0tCFGM3/m7xWhVx2KA==
X-Google-Smtp-Source: APXvYqyxt+I5fwIWa+rOJ3CMdaB+VSpYPzAApL3FPlNe9rZ6tKjDn2zuvoTOimphMtLb3sU0PFMQXQ==
X-Received: by 2002:aa7:82cd:: with SMTP id f13mr55621104pfn.203.1559841382186; 
 Thu, 06 Jun 2019 10:16:22 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id o66sm2377363pje.8.2019.06.06.10.16.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 10:16:21 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 5/5] drm/meson: Output in YUV444 if sink supports it
In-Reply-To: <20190520133753.23871-6-narmstrong@baylibre.com>
References: <20190520133753.23871-1-narmstrong@baylibre.com>
 <20190520133753.23871-6-narmstrong@baylibre.com>
Date: Thu, 06 Jun 2019 10:16:20 -0700
Message-ID: <7hblzaeisb.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_101623_480723_0F437FC7 
X-CRM114-Status: GOOD (  15.02  )
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

> With the YUV420 handling, we can dynamically setup the HDMI output
> pixel format depending on the mode and connector info.
> So now, we can output in YUV444, which is the native video pipeline
> format, directly to the HDMI Sink if it's supported without
> necessarily involving the HDMI Controller CSC.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 5d67e2beba58..8bf9db7f39a4 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -723,12 +723,23 @@ static int meson_venc_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
>  	struct drm_display_mode *mode = &crtc_state->mode;
>  	bool is_hdmi2_sink =
>  		conn_state->connector->display_info.hdmi.scdc.supported;
> +	bool specify_out_format = false;
> +	u32 out_format;
>  
>  	if (drm_mode_is_420_only(info, mode) ||
>  	    (!is_hdmi2_sink && drm_mode_is_420_also(info, mode)))
>  		dw_hdmi->input_bus_format = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
> -	else
> +	else {

nit: if the else has {} you should add to the 'if' (even if the if side
is a single statement): c.f. end of this section of CodingStyle:
https://www.kernel.org/doc/html/latest/process/coding-style.html#placing-braces-and-spaces

>  		dw_hdmi->input_bus_format = MEDIA_BUS_FMT_YUV8_1X24;
> +		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444) {
> +			out_format = MEDIA_BUS_FMT_YUV8_1X24;
> +			specify_out_format = true;
> +		}
> +	}
> +
> +	/* Set a connector bus format if required */
> +	drm_display_info_set_bus_formats(info, &out_format,
> +					 (specify_out_format ? 1 : 0));
>  

Otherwise,

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
