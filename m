Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF61C43387
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 12:06:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3912F20657
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 12:06:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HSaBWuJE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="CpJk+rx9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3912F20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DPxowh93W/dM+TqX8P+oI7B0QYZvUZ8p5D2sHljtzIY=; b=HSaBWuJEzsXdKS
	Mw90fS9uFbRRf69IZgwsfCGc+iy8U3mWEkvwyOXPwn5MQoeqp8RJOPy3QHmBpZOWfxPPQfn62NMoU
	wFkZg78KnTs3PJFF0+++MCQvN66hP5RVVyyiITSGvRUOzqitrFiZh+T7mYjOEleMB8dfipG1FdTvW
	8YCN6rakBBOohGnzZmqxp22ZKWHjxfZ1DYNHL+bf4DKTq+nEi7LEcK7M5wWixCjE49JdnXERYcyhF
	LbcdtMeByGRsB0OwvmbEvie8ZPoaECztS3blgvoCfOHYy1XgZcy7QvIFyU73g3FA6UH7RUAPdrWsa
	cjTALJ/KI1oUhqUhSoGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjNUN-0005hK-IH; Tue, 15 Jan 2019 12:06:39 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjNU8-0005Vk-2o
 for linux-amlogic@lists.infradead.org; Tue, 15 Jan 2019 12:06:37 +0000
Received: by mail-ed1-x543.google.com with SMTP id f23so2356093edb.3
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Jan 2019 04:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=D7vlcoyUllA9eQct930F/KkGGFJ9+BIhtUvTMKgo/sE=;
 b=CpJk+rx94mRjufv/Ma/whdLZEya+BR6is3bhPJwROLhksCVE7UA/w89cON96mmPuCM
 JL2ofrrhbukgdOcRcsC/EEjcMfTAvV4CLeldgTaa7sHPYjaisOYiQ0uoIjMpnCb9NdxU
 3i3WeQs8YzdUOHK+qyn27oPQqcOlyDzfamnWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=D7vlcoyUllA9eQct930F/KkGGFJ9+BIhtUvTMKgo/sE=;
 b=hHgk+wIuzdNXBzck4FlsYW6539+jVQn2xINKH5p3qGvyOmlPmwQqd5T3ZCx7WimPBi
 0Xt+VHy+dF5fgWvn+XM7H7AEyQkP0EM1MHp7awWwY8ngkReApMnqQw+5iXKewLLQ1Y6q
 3SKqRhLG9uYhV4zavpmeuYUjb3tPhNxjq6lrsFX8LjaQ91u/HrXQt8BcH4wEZYcKXZtQ
 r2SD2KcMQ2Qfv4VvkBO1z+Z5/X97Rs8dTLOKXjlzB4opMKpSgIDmmThB4w9tcTKq1yXw
 +uBqtePykHE95PhUOV7RDLlS7INvi5AJgBPX7A1pN4Qxd+AGB+CH+PNScLuG7CKrgtE3
 YDyQ==
X-Gm-Message-State: AJcUukdkRVXdwKyXvmCv1CqESiKFjDmUV4BfnalMKoaN1DCpN9uDoGj6
 pRng0iaQKziw93trbr6rNLM3Hg==
X-Google-Smtp-Source: ALg8bN4ejPU8lMEYgxVh7LnxB9yjcS0RZt76rfn7YQpjt4uxuS9P6Q6j74WWqBHEfK31oQ+pWaLmFg==
X-Received: by 2002:a17:906:2cd3:: with SMTP id
 r19-v6mr2912773ejr.38.1547553981673; 
 Tue, 15 Jan 2019 04:06:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id r7-v6sm2676274ejs.36.2019.01.15.04.06.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 15 Jan 2019 04:06:20 -0800 (PST)
Date: Tue, 15 Jan 2019 13:06:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2] drm/meson: Fix atomic mode switching regression
Message-ID: <20190115120618.GM10517@phenom.ffwll.local>
Mail-Followup-To: Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tony McKahan <tonymckahan@gmail.com>
References: <20190114153118.8024-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190114153118.8024-1-narmstrong@baylibre.com>
X-Operating-System: Linux phenom 4.19.0-1-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_040624_669598_7BB22D50 
X-CRM114-Status: GOOD (  17.87  )
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
Cc: linux-amlogic@lists.infradead.org, Tony McKahan <tonymckahan@gmail.com>,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jan 14, 2019 at 04:31:18PM +0100, Neil Armstrong wrote:
> Since commit 2bcd3ecab773 when switching mode from X11 (ubuntu mate for
> example) the display gets blurry, looking like an invalid framebuffer width.
> 
> This commit fixed atomic crtc modesetting in a totally wrong way and
> introduced a local unnecessary ->enabled crtc state.
> 
> This commit reverts the crctc _begin() and _enable() changes and simply
> adds drm_atomic_helper_commit_tail_rpm as helper.
> 
> Reported-by: Tony McKahan <tonymckahan@gmail.com>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Fixes: 2bcd3ecab773 ("drm/meson: Fixes for drm_crtc_vblank_on/off support")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

For the record (I already acked this on irc):

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/meson/meson_crtc.c | 23 ++---------------------
>  drivers/gpu/drm/meson/meson_drv.c  |  6 ++++++
>  2 files changed, 8 insertions(+), 21 deletions(-)
> 
> Changes since v1:
> - drop the unecessary local ->enabled logic
> - use drm_atomic_helper_commit_tail_rpm as atomic_commit_tail helper
> 
> diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
> index 75d97f1b2e8f..4f5c67f70c4d 100644
> --- a/drivers/gpu/drm/meson/meson_crtc.c
> +++ b/drivers/gpu/drm/meson/meson_crtc.c
> @@ -46,7 +46,6 @@ struct meson_crtc {
>  	struct drm_crtc base;
>  	struct drm_pending_vblank_event *event;
>  	struct meson_drm *priv;
> -	bool enabled;
>  };
>  #define to_meson_crtc(x) container_of(x, struct meson_crtc, base)
>  
> @@ -82,7 +81,8 @@ static const struct drm_crtc_funcs meson_crtc_funcs = {
>  
>  };
>  
> -static void meson_crtc_enable(struct drm_crtc *crtc)
> +static void meson_crtc_atomic_enable(struct drm_crtc *crtc,
> +				     struct drm_crtc_state *old_state)
>  {
>  	struct meson_crtc *meson_crtc = to_meson_crtc(crtc);
>  	struct drm_crtc_state *crtc_state = crtc->state;
> @@ -108,20 +108,6 @@ static void meson_crtc_enable(struct drm_crtc *crtc)
>  
>  	drm_crtc_vblank_on(crtc);
>  
> -	meson_crtc->enabled = true;
> -}
> -
> -static void meson_crtc_atomic_enable(struct drm_crtc *crtc,
> -				     struct drm_crtc_state *old_state)
> -{
> -	struct meson_crtc *meson_crtc = to_meson_crtc(crtc);
> -	struct meson_drm *priv = meson_crtc->priv;
> -
> -	DRM_DEBUG_DRIVER("\n");
> -
> -	if (!meson_crtc->enabled)
> -		meson_crtc_enable(crtc);
> -
>  	priv->viu.osd1_enabled = true;
>  }
>  
> @@ -153,8 +139,6 @@ static void meson_crtc_atomic_disable(struct drm_crtc *crtc,
>  
>  		crtc->state->event = NULL;
>  	}
> -
> -	meson_crtc->enabled = false;
>  }
>  
>  static void meson_crtc_atomic_begin(struct drm_crtc *crtc,
> @@ -163,9 +147,6 @@ static void meson_crtc_atomic_begin(struct drm_crtc *crtc,
>  	struct meson_crtc *meson_crtc = to_meson_crtc(crtc);
>  	unsigned long flags;
>  
> -	if (crtc->state->enable && !meson_crtc->enabled)
> -		meson_crtc_enable(crtc);
> -
>  	if (crtc->state->event) {
>  		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
>  
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 3ee4d4a4ecba..a74d861ddceb 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -75,6 +75,11 @@ static const struct drm_mode_config_funcs meson_mode_config_funcs = {
>  	.fb_create           = drm_gem_fb_create,
>  };
>  
> +
> +static const struct drm_mode_config_helper_funcs meson_mode_config_helpers = {
> +	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
> +};
> +
>  static irqreturn_t meson_irq(int irq, void *arg)
>  {
>  	struct drm_device *dev = arg;
> @@ -266,6 +271,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  	drm->mode_config.max_width = 3840;
>  	drm->mode_config.max_height = 2160;
>  	drm->mode_config.funcs = &meson_mode_config_funcs;
> +	drm->mode_config.helper_private	= &meson_mode_config_helpers;
>  
>  	/* Hardware Initialization */
>  
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
