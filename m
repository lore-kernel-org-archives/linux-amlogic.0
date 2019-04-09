Return-Path: <SRS0=8EGG=SL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E868C282CE
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2019 08:43:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E5A520663
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2019 08:43:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JpUHEkdC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="n/RO6lKS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E5A520663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aqd2ujwu6oCV4dduL45Y+WiM19G8ZCG+IRSrySS5vOA=; b=JpUHEkdCYYdvtB
	TSttIldlgD1rynyHqrWPWfwif9qMuYJf/O+IfrwWjMi1whz238SMiuU49UFvAxdZzrrePL5fbeDgh
	+Nd5L6kG2nnxhRFF7DSbfsLTxecXCahWNxkBnumjXnAFf7Cr8qlabbeq1MEJUaWO3+4J2HLPQKCX0
	0ogGQ7H3kk1P+lNrAC8vx3Uq5UrFdWJP2kUL5ATtceJryOawIChD1SV+66j30b+V3Em/EjsYs9nkI
	vgAjTAR/uJzQ0Bw2SB+VSQ3hUox8RGv8qe+BQDOX2cj/NE3L6Zj1QwZUuKyjvbvxmdYuhy/54jeb6
	wFv1WKKzPNOajR9HLoOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDmLo-0007I7-AQ; Tue, 09 Apr 2019 08:43:28 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDmLk-0007HW-GA
 for linux-amlogic@lists.infradead.org; Tue, 09 Apr 2019 08:43:26 +0000
Received: by mail-wm1-x343.google.com with SMTP id z11so2460956wmi.0
 for <linux-amlogic@lists.infradead.org>; Tue, 09 Apr 2019 01:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=6yU1beVTiZA5Y8E6RSvLWzVxPUhIRK2bpkl1ZM5/TbQ=;
 b=n/RO6lKSQz7gNw/MRpM2eEf4VyuUZYoTxgmC6Hd/YbcMR9B7srAcW3Z37t4IqeHJWx
 kX7QaBVsYkcaPgmG0KGPdYXHm9ksp4R60Zk1ZULcLFglGNvBNpHWSgVbg+4GMKVNqitv
 dcYntqyEvA8PBzj0x0p9bOjKgF7rfqkpS0qM6rWU1m0GAXsHptiCvcCMPx4mhWZCIE1J
 uxrRqw5lgmfUvvqi/C4DBL6kgrd/V5ACVPYFwz2Gz4FZBZBV/PimW5Crq663elh+Cis/
 Xl+ZQz3iy6Vp+1y6KI5UF2VWRArTx0l1f8wnsOWkObzVMCU/HRGjAgDEMUEmyZTFCWF3
 ZTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=6yU1beVTiZA5Y8E6RSvLWzVxPUhIRK2bpkl1ZM5/TbQ=;
 b=OdFJjCEo9WVLYrXOFhw384wVbQWDYvp6calAsfpwt8530wrnlF9fOFAAL89AH6n4cJ
 qJWM9fCHVPoTOZ9MbsoQQDnOOFGS+HtYyRyCF56RdPbGTn6+CrceyYJfaSv0tqfyvMLj
 Pds3XjrciM+izlSJ+JfKFBTgxvN8xfhSgaqB5fg1vDxwaT5xfvtpiQ+h6wvMTOmyR9iI
 Ha0DTz1nezPwRzcEKyylljo+fI594ICle4lUYHi5D8UE0lKNl+WSCFlqj461LWH1Syvc
 0JzPKUT2z8XweyFwQuwwwQkk9PwbeUT+2Hu9QF4QAFelCW5wYezskFgFPqhKQsh6tJZZ
 eYyA==
X-Gm-Message-State: APjAAAXmHRyxiNxqWmgr3Oneli2TjK1UERFsKNQ2StjlPve3jQYFzjKX
 3LY6r9FM+9e6n10QmngoqXlz4w==
X-Google-Smtp-Source: APXvYqx33KMuxHjq0fK4iPHcfwypIb/WLOfT0tYFIBp7dkmGayeQwGecEux9MV7WOFQLUYQnoZysqg==
X-Received: by 2002:a1c:2b41:: with SMTP id r62mr21681999wmr.94.1554799402717; 
 Tue, 09 Apr 2019 01:43:22 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 z140sm22267423wmc.27.2019.04.09.01.43.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Apr 2019 01:43:21 -0700 (PDT)
Message-ID: <783a13d05378fb29738933572b80ca15b375c565.camel@baylibre.com>
Subject: Re: [PATCH 07/11] drm/meson: Add G12A support for plane handling in
 CRTC driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Date: Tue, 09 Apr 2019 10:43:20 +0200
In-Reply-To: <20190325141824.21259-8-narmstrong@baylibre.com>
References: <20190325141824.21259-1-narmstrong@baylibre.com>
 <20190325141824.21259-8-narmstrong@baylibre.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_014324_540456_E4C39CA7 
X-CRM114-Status: GOOD (  20.45  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 2019-03-25 at 15:18 +0100, Neil Armstrong wrote:
> This patch adds support for the new OSD+VD Plane blending module
> in the CRTC code by adding the G12A code to manage the blending
> module and setting the right OSD1 & VD1 plane registers.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/meson_crtc.c | 269 +++++++++++++++++++++++------
>  drivers/gpu/drm/meson/meson_drv.h  |   4 +
>  2 files changed, 221 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
> index 6d9311e254ef..5579f8ac3e3f 100644
> --- a/drivers/gpu/drm/meson/meson_crtc.c
> +++ b/drivers/gpu/drm/meson/meson_crtc.c
> @@ -39,12 +39,17 @@
>  #include "meson_viu.h"
>  #include "meson_registers.h"
>  
> +#define MESON_G12A_VIU_OFFSET	0x5ec0
> +
>  /* CRTC definition */
>  
>  struct meson_crtc {
>  	struct drm_crtc base;
>  	struct drm_pending_vblank_event *event;
>  	struct meson_drm *priv;
> +	void (*enable_osd1)(struct meson_drm *priv);
> +	void (*enable_vd1)(struct meson_drm *priv);
> +	unsigned int viu_offset;
>  };
>  #define to_meson_crtc(x) container_of(x, struct meson_crtc, base)
>  
> @@ -80,6 +85,44 @@ static const struct drm_crtc_funcs meson_crtc_funcs = {
>  
>  };
>  
> +static void meson_g12a_crtc_atomic_enable(struct drm_crtc *crtc,
> +					  struct drm_crtc_state *old_state)
> +{
> +	struct meson_crtc *meson_crtc = to_meson_crtc(crtc);
> +	struct drm_crtc_state *crtc_state = crtc->state;
> +	struct meson_drm *priv = meson_crtc->priv;
> +
> +	DRM_DEBUG_DRIVER("\n");
> +
> +	if (!crtc_state) {
> +		DRM_ERROR("Invalid crtc_state\n");
> +		return;
> +	}
> +
> +	/* VD1 Preblend vertical start/end */
> +	writel(FIELD_PREP(GENMASK(11, 0), 2303),

Could could define this mask somewhere
I don't know if the 2303 can be explained. I'd nice if it could

> +	       priv->io_base + _REG(VPP_PREBLEND_VD1_V_START_END));
> +
> +	/* Setup Blender */
> +	writel(crtc_state->mode.hdisplay |
> +	       crtc_state->mode.vdisplay << 16,
> +	       priv->io_base + _REG(VPP_POSTBLEND_H_SIZE));
> +
> +	writel_relaxed(0 << 16 |

this 16 shift seems to be used for hdisplay or something. Could
define/document it a bit

> +			(crtc_state->mode.hdisplay - 1),
> +			priv->io_base + _REG(VPP_OSD1_BLD_H_SCOPE));
> +	writel_relaxed(0 << 16 |
> +			(crtc_state->mode.vdisplay - 1),
> +			priv->io_base + _REG(VPP_OSD1_BLD_V_SCOPE));
> +	writel_relaxed(crtc_state->mode.hdisplay << 16 |
> +			crtc_state->mode.vdisplay,
> +			priv->io_base + _REG(VPP_OUT_H_V_SIZE));
> +
> +	drm_crtc_vblank_on(crtc);
> +
> +	priv->viu.osd1_enabled = true;
> +}
> +
>  static void meson_crtc_atomic_enable(struct drm_crtc *crtc,
>  				     struct drm_crtc_state *old_state)
>  {
> @@ -110,6 +153,31 @@ static void meson_crtc_atomic_enable(struct drm_crtc *crtc,
>  	priv->viu.osd1_enabled = true;
>  }
>  
> +static void meson_g12a_crtc_atomic_disable(struct drm_crtc *crtc,
> +					   struct drm_crtc_state *old_state)
> +{
> +	struct meson_crtc *meson_crtc = to_meson_crtc(crtc);
> +	struct meson_drm *priv = meson_crtc->priv;
> +
> +	DRM_DEBUG_DRIVER("\n");
> +
> +	drm_crtc_vblank_off(crtc);
> +
> +	priv->viu.osd1_enabled = false;
> +	priv->viu.osd1_commit = false;
> +
> +	priv->viu.vd1_enabled = false;
> +	priv->viu.vd1_commit = false;
> +
> +	if (crtc->state->event && !crtc->state->active) {
> +		spin_lock_irq(&crtc->dev->event_lock);
> +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> +		spin_unlock_irq(&crtc->dev->event_lock);
> +
> +		crtc->state->event = NULL;
> +	}
> +}
> +
>  static void meson_crtc_atomic_disable(struct drm_crtc *crtc,
>  				      struct drm_crtc_state *old_state)
>  {
> @@ -173,6 +241,53 @@ static const struct drm_crtc_helper_funcs meson_crtc_helper_funcs = {
>  	.atomic_disable	= meson_crtc_atomic_disable,
>  };
>  
> +static const struct drm_crtc_helper_funcs meson_g12a_crtc_helper_funcs = {
> +	.atomic_begin	= meson_crtc_atomic_begin,
> +	.atomic_flush	= meson_crtc_atomic_flush,
> +	.atomic_enable	= meson_g12a_crtc_atomic_enable,
> +	.atomic_disable	= meson_g12a_crtc_atomic_disable,
> +};
> +
> +static void meson_crtc_enable_osd1(struct meson_drm *priv)
> +{
> +	writel_bits_relaxed(VPP_OSD1_POSTBLEND, VPP_OSD1_POSTBLEND,
> +			    priv->io_base + _REG(VPP_MISC));
> +}
> +
> +static void meson_g12a_crtc_enable_osd1(struct meson_drm *priv)
> +{
> +	writel_relaxed(priv->viu.osd_blend_din0_scope_h,
> +		       priv->io_base +
> +		       _REG(VIU_OSD_BLEND_DIN0_SCOPE_H));
> +	writel_relaxed(priv->viu.osd_blend_din0_scope_v,
> +		       priv->io_base +
> +		       _REG(VIU_OSD_BLEND_DIN0_SCOPE_V));
> +	writel_relaxed(priv->viu.osb_blend0_size,
> +		       priv->io_base +
> +		       _REG(VIU_OSD_BLEND_BLEND0_SIZE));
> +	writel_relaxed(priv->viu.osb_blend1_size,
> +		       priv->io_base +
> +		       _REG(VIU_OSD_BLEND_BLEND1_SIZE));
> +}
> +
> +static void meson_crtc_enable_vd1(struct meson_drm *priv)
> +{
> +	writel_bits_relaxed(VPP_VD1_PREBLEND | VPP_VD1_POSTBLEND |
> +			    VPP_COLOR_MNG_ENABLE,
> +			    VPP_VD1_PREBLEND | VPP_VD1_POSTBLEND |
> +			    VPP_COLOR_MNG_ENABLE,
> +			    priv->io_base + _REG(VPP_MISC));
> +}
> +
> +static void meson_g12a_crtc_enable_vd1(struct meson_drm *priv)
> +{
> +	writel_relaxed(((1 << 16) | /* post bld premult*/
> +			(1 << 8) | /* post src */
> +			(1 << 4) | /* pre bld premult*/
> +			(1 << 0)),

Could you use the BIT() macro here and possibly some defines ?

> +			priv->io_base + _REG(VD1_BLEND_SRC_CTRL));
> +}
> +
>  void meson_crtc_irq(struct meson_drm *priv)
>  {
>  	struct meson_crtc *meson_crtc = to_meson_crtc(priv->crtc);
> @@ -219,8 +334,8 @@ void meson_crtc_irq(struct meson_drm *priv)
>  				MESON_CANVAS_BLKMODE_LINEAR, 0);
>  
>  		/* Enable OSD1 */
> -		writel_bits_relaxed(VPP_OSD1_POSTBLEND, VPP_OSD1_POSTBLEND,
> -				    priv->io_base + _REG(VPP_MISC));
> +		if (meson_crtc->enable_osd1)
> +			meson_crtc->enable_osd1(priv);
>  
>  		priv->viu.osd1_commit = false;
>  	}
> @@ -261,89 +376,133 @@ void meson_crtc_irq(struct meson_drm *priv)
>  		};
>  
>  		writel_relaxed(priv->viu.vd1_if0_gen_reg,
> -				priv->io_base + _REG(VD1_IF0_GEN_REG));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD1_IF0_GEN_REG));

Could you make a local variable for priv->io_base + meson_crtc->viu_offset ?
It would be a little easier to read

>  		writel_relaxed(priv->viu.vd1_if0_gen_reg,
> -				priv->io_base + _REG(VD2_IF0_GEN_REG));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD2_IF0_GEN_REG));
>  		writel_relaxed(priv->viu.vd1_if0_gen_reg2,
> -				priv->io_base + _REG(VD1_IF0_GEN_REG2));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD1_IF0_GEN_REG2));
>  		writel_relaxed(priv->viu.viu_vd1_fmt_ctrl,
> -				priv->io_base + _REG(VIU_VD1_FMT_CTRL));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VIU_VD1_FMT_CTRL));
>  		writel_relaxed(priv->viu.viu_vd1_fmt_ctrl,
> -				priv->io_base + _REG(VIU_VD2_FMT_CTRL));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VIU_VD2_FMT_CTRL));
>  		writel_relaxed(priv->viu.viu_vd1_fmt_w,
> -				priv->io_base + _REG(VIU_VD1_FMT_W));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VIU_VD1_FMT_W));
>  		writel_relaxed(priv->viu.viu_vd1_fmt_w,
> -				priv->io_base + _REG(VIU_VD2_FMT_W));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VIU_VD2_FMT_W));
>  		writel_relaxed(priv->viu.vd1_if0_canvas0,
> -				priv->io_base + _REG(VD1_IF0_CANVAS0));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD1_IF0_CANVAS0));
>  		writel_relaxed(priv->viu.vd1_if0_canvas0,
> -				priv->io_base + _REG(VD1_IF0_CANVAS1));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD1_IF0_CANVAS1));
>  		writel_relaxed(priv->viu.vd1_if0_canvas0,
> -				priv->io_base + _REG(VD2_IF0_CANVAS0));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD2_IF0_CANVAS0));
>  		writel_relaxed(priv->viu.vd1_if0_canvas0,
> -				priv->io_base + _REG(VD2_IF0_CANVAS1));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD2_IF0_CANVAS1));
>  		writel_relaxed(priv->viu.vd1_if0_luma_x0,
> -				priv->io_base + _REG(VD1_IF0_LUMA_X0));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD1_IF0_LUMA_X0));
>  		writel_relaxed(priv->viu.vd1_if0_luma_x0,
> -				priv->io_base + _REG(VD1_IF0_LUMA_X1));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD1_IF0_LUMA_X1));
>  		writel_relaxed(priv->viu.vd1_if0_luma_x0,
> -				priv->io_base + _REG(VD2_IF0_LUMA_X0));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD2_IF0_LUMA_X0));
>  		writel_relaxed(priv->viu.vd1_if0_luma_x0,
> -				priv->io_base + _REG(VD2_IF0_LUMA_X1));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD2_IF0_LUMA_X1));
>  		writel_relaxed(priv->viu.vd1_if0_luma_y0,
> -				priv->io_base + _REG(VD1_IF0_LUMA_Y0));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD1_IF0_LUMA_Y0));
>  		writel_relaxed(priv->viu.vd1_if0_luma_y0,
> -				priv->io_base + _REG(VD1_IF0_LUMA_Y1));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD1_IF0_LUMA_Y1));
>  		writel_relaxed(priv->viu.vd1_if0_luma_y0,
> -				priv->io_base + _REG(VD2_IF0_LUMA_Y0));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD2_IF0_LUMA_Y0));
>  		writel_relaxed(priv->viu.vd1_if0_luma_y0,
> -				priv->io_base + _REG(VD2_IF0_LUMA_Y1));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD2_IF0_LUMA_Y1));
>  		writel_relaxed(priv->viu.vd1_if0_chroma_x0,
> -				priv->io_base + _REG(VD1_IF0_CHROMA_X0));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD1_IF0_CHROMA_X0));
>  		writel_relaxed(priv->viu.vd1_if0_chroma_x0,
> -				priv->io_base + _REG(VD1_IF0_CHROMA_X1));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD1_IF0_CHROMA_X1));
>  		writel_relaxed(priv->viu.vd1_if0_chroma_x0,
> -				priv->io_base + _REG(VD2_IF0_CHROMA_X0));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD2_IF0_CHROMA_X0));
>  		writel_relaxed(priv->viu.vd1_if0_chroma_x0,
> -				priv->io_base + _REG(VD2_IF0_CHROMA_X1));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD2_IF0_CHROMA_X1));
>  		writel_relaxed(priv->viu.vd1_if0_chroma_y0,
> -				priv->io_base + _REG(VD1_IF0_CHROMA_Y0));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD1_IF0_CHROMA_Y0));
>  		writel_relaxed(priv->viu.vd1_if0_chroma_y0,
> -				priv->io_base + _REG(VD1_IF0_CHROMA_Y1));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD1_IF0_CHROMA_Y1));
>  		writel_relaxed(priv->viu.vd1_if0_chroma_y0,
> -				priv->io_base + _REG(VD2_IF0_CHROMA_Y0));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD2_IF0_CHROMA_Y0));
>  		writel_relaxed(priv->viu.vd1_if0_chroma_y0,
> -				priv->io_base + _REG(VD2_IF0_CHROMA_Y1));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD2_IF0_CHROMA_Y1));
>  		writel_relaxed(priv->viu.vd1_if0_repeat_loop,
> -				priv->io_base + _REG(VD1_IF0_RPT_LOOP));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD1_IF0_RPT_LOOP));
>  		writel_relaxed(priv->viu.vd1_if0_repeat_loop,
> -				priv->io_base + _REG(VD2_IF0_RPT_LOOP));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD2_IF0_RPT_LOOP));
>  		writel_relaxed(priv->viu.vd1_if0_luma0_rpt_pat,
> -				priv->io_base + _REG(VD1_IF0_LUMA0_RPT_PAT));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD1_IF0_LUMA0_RPT_PAT));
>  		writel_relaxed(priv->viu.vd1_if0_luma0_rpt_pat,
> -				priv->io_base + _REG(VD2_IF0_LUMA0_RPT_PAT));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD2_IF0_LUMA0_RPT_PAT));
>  		writel_relaxed(priv->viu.vd1_if0_luma0_rpt_pat,
> -				priv->io_base + _REG(VD1_IF0_LUMA1_RPT_PAT));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD1_IF0_LUMA1_RPT_PAT));
>  		writel_relaxed(priv->viu.vd1_if0_luma0_rpt_pat,
> -				priv->io_base + _REG(VD2_IF0_LUMA1_RPT_PAT));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD2_IF0_LUMA1_RPT_PAT));
>  		writel_relaxed(priv->viu.vd1_if0_chroma0_rpt_pat,
> -				priv->io_base + _REG(VD1_IF0_CHROMA0_RPT_PAT));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD1_IF0_CHROMA0_RPT_PAT));
>  		writel_relaxed(priv->viu.vd1_if0_chroma0_rpt_pat,
> -				priv->io_base + _REG(VD2_IF0_CHROMA0_RPT_PAT));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD2_IF0_CHROMA0_RPT_PAT));
>  		writel_relaxed(priv->viu.vd1_if0_chroma0_rpt_pat,
> -				priv->io_base + _REG(VD1_IF0_CHROMA1_RPT_PAT));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD1_IF0_CHROMA1_RPT_PAT));
>  		writel_relaxed(priv->viu.vd1_if0_chroma0_rpt_pat,
> -				priv->io_base + _REG(VD2_IF0_CHROMA1_RPT_PAT));
> -		writel_relaxed(0, priv->io_base + _REG(VD1_IF0_LUMA_PSEL));
> -		writel_relaxed(0, priv->io_base + _REG(VD1_IF0_CHROMA_PSEL));
> -		writel_relaxed(0, priv->io_base + _REG(VD2_IF0_LUMA_PSEL));
> -		writel_relaxed(0, priv->io_base + _REG(VD2_IF0_CHROMA_PSEL));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD2_IF0_CHROMA1_RPT_PAT));
> +		writel_relaxed(0, priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD1_IF0_LUMA_PSEL));
> +		writel_relaxed(0, priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD1_IF0_CHROMA_PSEL));
> +		writel_relaxed(0, priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD2_IF0_LUMA_PSEL));
> +		writel_relaxed(0, priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD2_IF0_CHROMA_PSEL));
>  		writel_relaxed(priv->viu.vd1_range_map_y,
> -				priv->io_base + _REG(VD1_IF0_RANGE_MAP_Y));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD1_IF0_RANGE_MAP_Y));
>  		writel_relaxed(priv->viu.vd1_range_map_cb,
> -				priv->io_base + _REG(VD1_IF0_RANGE_MAP_CB));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD1_IF0_RANGE_MAP_CB));
>  		writel_relaxed(priv->viu.vd1_range_map_cr,
> -				priv->io_base + _REG(VD1_IF0_RANGE_MAP_CR));
> +				priv->io_base + meson_crtc->viu_offset +
> +				_REG(VD1_IF0_RANGE_MAP_CR));
>  		writel_relaxed(0x78404,
>  				priv->io_base + _REG(VPP_SC_MISC));
>  		writel_relaxed(priv->viu.vpp_pic_in_height,
> @@ -389,11 +548,8 @@ void meson_crtc_irq(struct meson_drm *priv)
>  		writel_relaxed(0x42, priv->io_base + _REG(VPP_SCALE_COEF_IDX));
>  
>  		/* Enable VD1 */
> -		writel_bits_relaxed(VPP_VD1_PREBLEND | VPP_VD1_POSTBLEND |
> -				    VPP_COLOR_MNG_ENABLE,
> -				    VPP_VD1_PREBLEND | VPP_VD1_POSTBLEND |
> -				    VPP_COLOR_MNG_ENABLE,
> -				    priv->io_base + _REG(VPP_MISC));
> +		if (meson_crtc->enable_vd1)
> +			meson_crtc->enable_vd1(priv);
>  
>  		priv->viu.vd1_commit = false;
>  	}
> @@ -430,7 +586,16 @@ int meson_crtc_create(struct meson_drm *priv)
>  		return ret;
>  	}
>  
> -	drm_crtc_helper_add(crtc, &meson_crtc_helper_funcs);
> +	if (meson_vpu_is_compatible(priv, "amlogic,meson-g12a-vpu")) {
> +		meson_crtc->enable_osd1 = meson_g12a_crtc_enable_osd1;
> +		meson_crtc->enable_vd1 = meson_g12a_crtc_enable_vd1;
> +		meson_crtc->viu_offset = MESON_G12A_VIU_OFFSET;
> +		drm_crtc_helper_add(crtc, &meson_g12a_crtc_helper_funcs);
> +	} else {
> +		meson_crtc->enable_osd1 = meson_crtc_enable_osd1;
> +		meson_crtc->enable_vd1 = meson_crtc_enable_vd1;
> +		drm_crtc_helper_add(crtc, &meson_crtc_helper_funcs);
> +	}
>  
>  	priv->crtc = crtc;
>  
> diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
> index 214a7cb18ce2..9614baa836b9 100644
> --- a/drivers/gpu/drm/meson/meson_drv.h
> +++ b/drivers/gpu/drm/meson/meson_drv.h
> @@ -62,6 +62,10 @@ struct meson_drm {
>  		uint32_t osd_sc_h_phase_step;
>  		uint32_t osd_sc_h_ctrl0;
>  		uint32_t osd_sc_v_ctrl0;
> +		uint32_t osd_blend_din0_scope_h;
> +		uint32_t osd_blend_din0_scope_v;
> +		uint32_t osb_blend0_size;
> +		uint32_t osb_blend1_size;
>  
>  		bool vd1_enabled;
>  		bool vd1_commit;



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
