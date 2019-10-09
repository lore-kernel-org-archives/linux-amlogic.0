Return-Path: <SRS0=pqGQ=YC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094C0C47404
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Oct 2019 10:47:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC5E920B7C
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Oct 2019 10:47:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LOkHfPvu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="fXBFCO32"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC5E920B7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3qWvNF6AsOhUDNlP+FxvpCRw6T6fVb8PxK0dUn2JG9Q=; b=LOkHfPvuwTid42
	mH+Ke1MKvaKkvdZ8A4aCEHgE4tCWtNFwvQusArSSuAPRpGkRxes625egdwpR52HnNLbvbIG18doIH
	/86wCiTq9KqMUK2zumSe4AHUSodRpu953r0TKpETotDn4RubuzeZ5I7dH0d3DIMN6d706RgHCZtgx
	U6REzVqs43M2pRYQFSTg0Hoj8kBp5w20t10QA8nbpTslgDEn+6EqgiUYpVSoNd17hUM7qz+2FiYcE
	FzLcTEFRD1QKr6/mL5GbVOHxHyloPc8jdh1VnalYRk5IgI++9HCHxyAHMoQFddUkg6LU4+YR6IYOs
	DmbhqYnGUgcwY/Jlz/Sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iI9VG-0002pg-S1; Wed, 09 Oct 2019 10:47:34 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iI9VE-0002p6-78
 for linux-amlogic@lists.infradead.org; Wed, 09 Oct 2019 10:47:34 +0000
Received: by mail-ed1-x544.google.com with SMTP id c4so1604261edl.0
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Oct 2019 03:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=C/f6/fe6l9qpOq8K1lx4cS1L0t1Hq00anJTRcpjdZaY=;
 b=fXBFCO323Bm+FQBU/+LL08XySBNen3E6T9qKA4aIio7ZnVTc1qrmiXWPHfafjaF5OM
 5+mK5egfmwUECqbtv1EY9REiXUiGHZdUls0/dxznEkib+Mj3bSSpPBFsRkZrfsTEJLTB
 MelIIKF4vIGWv96w8TwbvIWb5b5NsUUnkfhjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=C/f6/fe6l9qpOq8K1lx4cS1L0t1Hq00anJTRcpjdZaY=;
 b=o0KHAfZiy8WLIG1hEX/8H3Bx7MmPxfpc5R2L1IvYRvcbHC12wSNsW01l+a6izG3OJM
 CrNvuL6120vV4VPoA4/W08myOVf0/rixfOCWeFOEVxOVkJCPevczefStxO0CdBlDEMo5
 tLCzPE3oz/PeZz0oesN+BS9m9WQ/4uCPH/072a2hrCXHDjwQ2pWErr4n1f9V/hdSvRON
 ECeQiE7Y09oOwFBCyMRhpTVKzcMhzkg0ZyxxlmfxR+9RL7o9BW6NUQhrOoAEFekjGGEF
 ZFDhIRB+VPTBEnYl97EQmNYdNYaBBWrV+l+dXhGXDdieYtMh6yXW4iVXWo+d+SfSLsaU
 z0sQ==
X-Gm-Message-State: APjAAAUzQfQO6N0gD3DsdKaLFfKhqQIdqnOX0M+NgYir/NIWKbviZUxd
 mjR/6UIFjYgSi3NHJif0jTeKcw==
X-Google-Smtp-Source: APXvYqwFKxcsVszGn80rMYG6TMaGo4tkWTwu1HVt5uwb1ZbnJ6lXbxPzQggnmUgneVU6eJIaIg8Pmw==
X-Received: by 2002:a50:f10a:: with SMTP id w10mr2253640edl.247.1570618050207; 
 Wed, 09 Oct 2019 03:47:30 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id dv15sm208287ejb.49.2019.10.09.03.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 03:47:29 -0700 (PDT)
Date: Wed, 9 Oct 2019 12:47:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jeykumar Sankaran <jsanka@codeaurora.org>
Subject: Re: [PATCH] drm/meson: fix max mode_config height/width
Message-ID: <20191009104727.GX16989@phenom.ffwll.local>
Mail-Followup-To: Jeykumar Sankaran <jsanka@codeaurora.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <1538642563-22465-1-git-send-email-narmstrong@baylibre.com>
 <20181004100958.GI31561@phenom.ffwll.local>
 <0ef7fa13-ce77-f8a5-f5f3-6568be3d6145@baylibre.com>
 <CAKMK7uHxiDF3z19cMBb0o2o4Ev0DFJkhMR7Ny6U2776Ry4oc=A@mail.gmail.com>
 <8e980de4-5a52-8f3d-fba2-734617e40d1b@baylibre.com>
 <CAKMK7uE71OeOdDPb+5-cs9bByD-unYPxBV_R1t+4A0Nb4H6CAw@mail.gmail.com>
 <5dbd6337-7e08-f3f7-6d4a-d6bcaddfd3be@baylibre.com>
 <91cd8a2aebefd4ea3e9bcee5a4ef796a@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <91cd8a2aebefd4ea3e9bcee5a4ef796a@codeaurora.org>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191009_034732_256252_A7232799 
X-CRM114-Status: GOOD (  30.21  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-amlogic@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Sep 24, 2019 at 10:28:48AM -0700, Jeykumar Sankaran wrote:
> Reviving this thread from the context of the below conversion:
> 
> https://lore.kernel.org/linux-arm-msm/db26145b-3f64-a334-f698-76f972332881@baylibre.com/T/#u
> 
> On 2018-10-05 01:19, Neil Armstrong wrote:
> > On 05/10/2018 09:58, Daniel Vetter wrote:
> > > On Fri, Oct 5, 2018 at 9:39 AM Neil Armstrong
> > > <narmstrong@baylibre.com> wrote:
> > > > 
> > 
> > [...]
> > 
> > > > OK, won't this be enough ?
> > > > --- a/include/drm/drm_mode_config.h
> > > > +++ b/include/drm/drm_mode_config.h
> > > > @@ -333,6 +333,8 @@ struct drm_mode_config_funcs {
> > > >   * @min_height: minimum fb pixel height on this device
> > > >   * @max_width: maximum fb pixel width on this device
> > > >   * @max_height: maximum fb pixel height on this device
> > > > + * @max_fb_width: maximum fb buffer width if differs from max_width
> > > > + * @max_fb_height: maximum fb buffer height if differs from
> > > > max_height
> > > >   * @funcs: core driver provided mode setting functions
> > > >   * @fb_base: base address of the framebuffer
> > > >   * @poll_enabled: track polling support for this device
> > > > @@ -508,6 +510,7 @@ struct drm_mode_config {
> > > > 
> > > >         int min_width, min_height;
> > > >         int max_width, max_height;
> > > > +       int max_fb_width, max_fb_height;
> > > >         const struct drm_mode_config_funcs *funcs;
> > > >         resource_size_t fb_base;
> > > > 
> > > > --- a/drivers/gpu/drm/drm_framebuffer.c
> > > > +++ b/drivers/gpu/drm/drm_framebuffer.c
> > > > @@ -283,14 +283,20 @@ drm_internal_framebuffer_create(struct
> > > > drm_device *dev,
> > > >                 return ERR_PTR(-EINVAL);
> > > >         }
> > > > 
> > > > -       if ((config->min_width > r->width) || (r->width >
> > > > config->max_width)) {
> > > > +       if ((config->min_width > r->width) ||
> > > > +           (!config->max_fb_width && r->width >
> > > > config->max_width) ||
> > > > +           (config->max_fb_width && r->width >
> > > > config->max_fb_width)) {
> > > >                 DRM_DEBUG_KMS("bad framebuffer width %d, should
> > > > be >= %d && <= %d\n",
> > > > -                         r->width, config->min_width,
> > > > config->max_width);
> > > > +                         r->width, config->min_width,
> > > > config->max_fb_width ?
> > > > +                         config->max_fb_width : config->max_width);
> > > >                 return ERR_PTR(-EINVAL);
> > > >         }
> > > > -       if ((config->min_height > r->height) || (r->height >
> > > > config->max_height)) {
> > > > +       if ((config->min_height > r->height) ||
> > > > +           (!config->max_fb_height && r->height >
> > > > config->max_height) ||
> > > > +           (config->max_fb_height && r->height >
> > > > config->max_fb_height)) {
> > > >                 DRM_DEBUG_KMS("bad framebuffer height %d, should
> > > > be >= %d && <= %d\n",
> > > > -                         r->height, config->min_height,
> > > > config->max_height);
> > > > +                         r->height, config->min_height,
> > > > config->max_fb_height ?
> > > > +                         config->max_fb_height :
> > > > config->max_height);
> > > >                 return ERR_PTR(-EINVAL);
> > > >         }
> > > > 
> > > > and in the driver :
> > > > 
> > > > +       drm->mode_config.max_width = 4096;
> > > > +       drm->mode_config.max_height = 3840;
> > > > +       drm->mode_config.max_fb_width = 16384;
> > > > +       drm->mode_config.max_fb_height = 8192;
> > > > 
> > > > With this I leave the mode filtering intact.
> > > 
> > > Not enough. See
> > > https://dri.freedesktop.org/docs/drm/gpu/drm-kms-helpers.html#c.drm_connector_helper_funcs
> > > and scroll down to mode_valid. You need to filter modes both in the
> > > detect paths, and the atomic_check paths.
> > > 
> > > Detect is explicitly filtered out, but atomic_check was only
> > > implicitly filtered, through the max fb size checks. Ok, you could
> > > light up a mode that's bigger than max fb, but in practice, no
> > > userspace ever did that.
> 
> Daniel, MSM and few other vendor hardware have upscale blocks where the
> driver can expose fb sizes smaller than
> the mode resolution and use h/w upscaling to fill the screen. This would
> optimize the fetch bandwidth.
> 
> But with your code we're missing crucial
> > > validation now, and userspace could fall over that. What I think we
> > > need is to add mode filter against mode_config.max_width/height in
> > > drm_atomic_helper_check_modeset(). Probably best to stuff that into
> > > the mode_valid() function.
> > 
> Agreed! Since the above patch from Niel is taking care of cases where
> max/min fb values
> are not set, by checking against the original max/min values, can we
> separate out this
> core change from the driver level mode_valid changes? If Niel couldn't find
> the time, I can
> repost the above change.

Sure, I think Neil wouldn't mind if you take this over and get it ready
for merging. Just need to make sure we're not leaving any validation gaps
in core/helper code.
-Daniel

> 
> Thanks and Regards,
> Jeykumar S.
> 
> > Ok I understood now, thanks for pointer, I'll try to add this.
> > 
> > Neil
> > 
> > > 
> > > Cheers, Daniel
> > > > 
> > > > Neil
> > > > 
> > > > 
> > > > > -Daniel
> > > > > 
> > > > > > 
> > > > > > Neil
> > > > > > 
> > > > > > > 
> > > > > > > Bunch of igt to make sure we're not missing anything
> > > > > > > would be sweet on
> > > > > > > top, e.g. e.g. trying to set a mode over the limit
> > > > > > > and making sure it
> > > > > > > fails.
> > > > > > > 
> > > > > > > Cheers, Daniel
> > > > > > > 
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/meson/meson_drv.c | 4 ++--
> > > > > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/meson/meson_drv.c
> > > > > > > > b/drivers/gpu/drm/meson/meson_drv.c
> > > > > > > > index d344312..2e29968 100644
> > > > > > > > --- a/drivers/gpu/drm/meson/meson_drv.c
> > > > > > > > +++ b/drivers/gpu/drm/meson/meson_drv.c
> > > > > > > > @@ -243,8 +243,8 @@ static int
> > > > > > > > meson_drv_bind_master(struct device *dev, bool
> > > > > > > > has_components)
> > > > > > > >              goto free_drm;
> > > > > > > > 
> > > > > > > >      drm_mode_config_init(drm);
> > > > > > > > -    drm->mode_config.max_width = 3840;
> > > > > > > > -    drm->mode_config.max_height = 2160;
> > > > > > > > +    drm->mode_config.max_width = 16384;
> > > > > > > > +    drm->mode_config.max_height = 8192;
> > > > > > > >      drm->mode_config.funcs = &meson_mode_config_funcs;
> > > > > > > > 
> > > > > > > >      /* Hardware Initialization */
> > > > > > > > --
> > > > > > > > 2.7.4
> > > > > > > > 
> > > > > > > > _______________________________________________
> > > > > > > > dri-devel mailing list
> > > > > > > > dri-devel@lists.freedesktop.org
> > > > > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > > > > > 
> > > > > > 
> > > > > > _______________________________________________
> > > > > > dri-devel mailing list
> > > > > > dri-devel@lists.freedesktop.org
> > > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > > > 
> > > > > 
> > > > > 
> > > > 
> > > 
> > > 
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> -- 
> Jeykumar S

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
