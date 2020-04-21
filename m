Return-Path: <SRS0=oV4S=6F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44EFFC54FCC
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2020 13:59:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B87720679
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2020 13:59:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rZ7M2nMH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Cje0RUyU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B87720679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GPlzuNMlpAf5eFLeaSTpO6sCw1nvjkZjCXA+fkkdTQY=; b=rZ7M2nMHJsaIy+
	g4/Tj6vkdmNo1r43owgFPzKQVUAC5EG1HaDACu0uRgoIRYmGFa7Jy4pJN4iY/tQsrFx2extBJ+39z
	8kCU5eoBAqBQY4GM9/28Vyo3IzbJiRi5xahDj4WTpZl6SiIgqd8lzOF2ycOdDiyJtn8rLoXc6m8/o
	clA1/bl3iogWRQdqGDZKQDT0LPGZRQp6Ce5GffyQazArj93E77kDohLngjGeqFgculIB5HKkuRLcv
	qmdE6vaMUZPQyOsg4LdQyuuJP3ouM7W5i6vLA3N2l7awxZhAQow+jwXcB25xsCxlWRl6wGbA53s3O
	jwrAptQTv05vb7UG4uTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQtQk-0001UR-Cg; Tue, 21 Apr 2020 13:59:18 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQtQg-0001SN-Vs
 for linux-amlogic@lists.infradead.org; Tue, 21 Apr 2020 13:59:16 +0000
Received: by mail-wm1-x342.google.com with SMTP id t63so3669714wmt.3
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Apr 2020 06:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=GFhVcwNkH19cbR+cE1ypfH56nXaAVZCLec2xJqB4kFg=;
 b=Cje0RUyUW8yZe79iZsor+8dzm23NXNZJ6S9VH8UVO9QRfVvhQ3rggw5tCYa3jMeE7p
 3qJjIF8mqBY9qgK1Htwamf5L8vvpm7FUqIK8p1ZB11DdtpdZ3YeJxD5P999SiexzhLNA
 P3E77WgVZvTJGej9UVAmIT7dFemOmy5x3SZ20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=GFhVcwNkH19cbR+cE1ypfH56nXaAVZCLec2xJqB4kFg=;
 b=FCv73h0t2KUl/ruRrH5MBw6byDVCPycU9swM/eBigBcLqWlpgYji//6iAuCCDNf5Gm
 dQxrPaIZqG4QBokSrjCpViy33zXCLj88DRtfOfkdn0zBeM+dTufvV+BNpU0/5Rwl6Az6
 COam7vVWmTgGUwVsI1NJOMp0la7oEYN2YMEmjcC4E1GPudoMyLIRhA3OnVYuOp3cvhLS
 esJbixBphYbq7LhVQ5P0ghX4LKIXZ9jhtjCXH+nJDCuKZjw2XA1sfRrsff1lfBrb6zBM
 fCSfLjbNgbQFOxZXRxMauOUKaN1o+Hebkx8lGGMePYrOE5TTkeWH2ixNCac9CezIeFBc
 x7ew==
X-Gm-Message-State: AGi0PuYVFFXHwsBrn/3a2itswhTLJp5pKv90HgwcNoB46N/2D5lcyVN2
 bsqgglRneGK/20Q3UqwEYv3Rlw==
X-Google-Smtp-Source: APiQypIThebpIsiA00RlINe3F/bJOmBXZSBWSdmsF3bQaYRTVrY4O3DozqrT76sEJG1Uw2UhgdLnBA==
X-Received: by 2002:a7b:cdfa:: with SMTP id p26mr5000192wmj.186.1587477550341; 
 Tue, 21 Apr 2020 06:59:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d5sm3863822wrp.44.2020.04.21.06.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:59:09 -0700 (PDT)
Date: Tue, 21 Apr 2020 15:59:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] drm/meson: add mode selection limits against specific
 SoC revisions
Message-ID: <20200421135907.GC3456981@phenom.ffwll.local>
Mail-Followup-To: Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20200421134410.30603-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421134410.30603-1-narmstrong@baylibre.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_065915_032958_E8951FF9 
X-CRM114-Status: GOOD (  23.51  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Apr 21, 2020 at 03:44:10PM +0200, Neil Armstrong wrote:
> The Amlogic S805X/Y uses the same die as the S905X, but with more
> limited graphics capabilities.
> 
> This adds a soc version detection adding specific limitations on the HDMI
> mode selections.
> 
> Here, we limit to HDMI 1.3a max HDMI PHY clock frequency.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Just a drive-by, but the code organization between the dw-hdmi bridge and
the driver looks pretty terribly and really leaky. Can't we do better?
Either by fixing the dw-hdmi bridge abstraction to actually abstract
something, or by givin up the dw-hdmi is a bridge and convert it to some
helper to implement a drm_encoder. Current status just doesn't make too
much sense to me.
-Daniel

> ---
>  drivers/gpu/drm/meson/meson_drv.c     | 29 ++++++++++++++++++++++++++-
>  drivers/gpu/drm/meson/meson_drv.h     |  6 ++++++
>  drivers/gpu/drm/meson/meson_dw_hdmi.c |  7 +++++++
>  3 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 6f29fab79952..621f6de0f076 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -11,6 +11,7 @@
>  #include <linux/component.h>
>  #include <linux/module.h>
>  #include <linux/of_graph.h>
> +#include <linux/sys_soc.h>
>  #include <linux/platform_device.h>
>  #include <linux/soc/amlogic/meson-canvas.h>
>  
> @@ -183,6 +184,24 @@ static void meson_remove_framebuffers(void)
>  	kfree(ap);
>  }
>  
> +struct meson_drm_soc_attr {
> +	struct meson_drm_soc_limits limits;
> +	const struct soc_device_attribute *attrs;
> +};
> +
> +static const struct meson_drm_soc_attr meson_drm_soc_attrs[] = {
> +	/* S805X/S805Y HDMI PLL won't lock for HDMI PHY freq > 1,65GHz */
> +	{
> +		.limits = {
> +			.max_hdmi_phy_freq = 1650000,
> +		},
> +		.attrs = (const struct soc_device_attribute []) {
> +			{ .soc_id = "GXL (S805*)", },
> +			{ /* sentinel */ },
> +		}
> +	},
> +};
> +
>  static int meson_drv_bind_master(struct device *dev, bool has_components)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
> @@ -191,7 +210,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  	struct drm_device *drm;
>  	struct resource *res;
>  	void __iomem *regs;
> -	int ret;
> +	int ret, i;
>  
>  	/* Checks if an output connector is available */
>  	if (!meson_vpu_has_available_connectors(dev)) {
> @@ -281,6 +300,14 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  	if (ret)
>  		goto free_drm;
>  
> +	/* Assign limits per soc revision/package */
> +	for (i = 0 ; i < ARRAY_SIZE(meson_drm_soc_attrs) ; ++i) {
> +		if (soc_device_match(meson_drm_soc_attrs[i].attrs)) {
> +			priv->limits = &meson_drm_soc_attrs[i].limits;
> +			break;
> +		}
> +	}
> +
>  	/* Remove early framebuffers (ie. simplefb) */
>  	meson_remove_framebuffers();
>  
> diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
> index 04fdf3826643..5b23704a80d6 100644
> --- a/drivers/gpu/drm/meson/meson_drv.h
> +++ b/drivers/gpu/drm/meson/meson_drv.h
> @@ -30,6 +30,10 @@ struct meson_drm_match_data {
>  	struct meson_afbcd_ops *afbcd_ops;
>  };
>  
> +struct meson_drm_soc_limits {
> +	unsigned int max_hdmi_phy_freq;
> +};
> +
>  struct meson_drm {
>  	struct device *dev;
>  	enum vpu_compatible compat;
> @@ -48,6 +52,8 @@ struct meson_drm {
>  	struct drm_plane *primary_plane;
>  	struct drm_plane *overlay_plane;
>  
> +	const struct meson_drm_soc_limits *limits;
> +
>  	/* Components Data */
>  	struct {
>  		bool osd1_enabled;
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index e8c94915a4fc..dc3d5122475a 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -695,6 +695,13 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
>  	dev_dbg(connector->dev->dev, "%s: vclk:%d phy=%d venc=%d hdmi=%d\n",
>  		__func__, phy_freq, vclk_freq, venc_freq, hdmi_freq);
>  
> +	/* Check against soc revision/package limits */
> +	if (priv->limits) {
> +		if (priv->limits->max_hdmi_phy_freq &&
> +		    phy_freq > priv->limits->max_hdmi_phy_freq)
> +			return MODE_CLOCK_HIGH;
> +	}
> +
>  	return meson_vclk_vic_supported_freq(phy_freq, vclk_freq);
>  }
>  
> -- 
> 2.22.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
