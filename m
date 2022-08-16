Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A481C25B0E
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Aug 2022 13:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lphx+tccsizgwquez5Er1dRI+DG2rfJBVBTzAgCyrWY=; b=37rmeD+8iFbdMI
	D4S3gO8eYylvbmgoekMbOUogU2dRqvHOZli/+7E5BNtCEyPV2q4ZIeWJ7b2GoeAxETU6hgkDULDRp
	EfkPXgGgY9VXaoyHKmD5tuhqOS6TBNRVSrVSJ9umqUjfDVl0hHTKVsmqYPRh3dVQt0HSNm7rRWyvv
	sju6+Q9c6Y8y7TCxkKqPg33o+rubfXZ6YX1G5vA9xNBAmrA8cBp47DeKVaD2jeWP0WLyvU7OUOeWv
	q+X1K+xKc49hX6BDq9dLbigM8WujRet8LfbvVlq8VQrN9GQ673ekdQbnpXdMkFxZpTe42pH2BU/Ni
	/pmcH2iXI05JdRKn48Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNwmY-002wtX-Kk; Tue, 16 Aug 2022 13:38:58 +0000
Received: from mail-qv1-f52.google.com ([209.85.219.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNwk7-002vAA-JS; Tue, 16 Aug 2022 13:36:29 +0000
Received: by mail-qv1-f52.google.com with SMTP id l18so7816315qvt.13;
        Tue, 16 Aug 2022 06:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=hdhYrvwFVCJ/wIIa+DKIK8qp10gL+xmn48+Cm6GZTzY=;
        b=75PrkhyMrRbvtYKJ/MTWpyx2UjzOBVZlcebTzvrRqSndVOHGtoG2fZqDeDDabTYQEb
         LPDDqHIIGeAhg4oUNL8YQ12IU0czqOFPvyeTBhD7Ce5mlW6sL/Bz6B8unmSW/HksyXd/
         2oWF07yfZBMUwsu9zd1jM1/7Yr1U+QJ8ffKWatoqNbS9wPJHrEjm/YDxZUgl1Wa91MtZ
         Hgh8R4eK02VxnJBjke96d75ZUBEuy9HGKdbQBUYhSOoW0GG2d3LHvEU2QA/YsnfZRRXg
         na8hnSbMhRmKQ2ISmm0rh0mTjyKedDX6xfb9KPL9PLHwCqhgvB443p3IREPIlArrN1P6
         VbEg==
X-Gm-Message-State: ACgBeo05O/6ju4wqR4FqztD5X6dJMip+UQ47OJ8SXRX3I13wvyGEzwW0
	ogylNOGHBtZS40JhXOisdnvEnbp9U7JM5w==
X-Google-Smtp-Source: AA6agR7JRFlpSJiCV4nZG6gcA6azO6oC8bJ1vjvW1Vqw/mB/iZiB0PJ7iLLIKZqPCw7+0eKrTir9Bw==
X-Received: by 2002:a0c:b3cc:0:b0:487:4ff7:407d with SMTP id b12-20020a0cb3cc000000b004874ff7407dmr16298770qvf.95.1660656985224;
        Tue, 16 Aug 2022 06:36:25 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id c3-20020a05620a268300b006b5d9a1d326sm11535757qkp.83.2022.08.16.06.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 06:36:25 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-32fd97c199fso126405217b3.6;
        Tue, 16 Aug 2022 06:36:25 -0700 (PDT)
X-Received: by 2002:a81:502:0:b0:32f:dcc4:146e with SMTP id
 2-20020a810502000000b0032fdcc4146emr10322596ywf.316.1660656559751; Tue, 16
 Aug 2022 06:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <CAMuHMdWYo7M44uLNhTmJenGDreGALBZ9E48oyBDEeAuL=0h=dw@mail.gmail.com> <20220816132040.uwirtjm5yr6rdd3q@houat>
In-Reply-To: <20220816132040.uwirtjm5yr6rdd3q@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Aug 2022 15:29:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWevP=3af=NneAJEDfOR+sz1thrQEhAQPNGrgitBtLjGA@mail.gmail.com>
Message-ID: <CAMuHMdWevP=3af=NneAJEDfOR+sz1thrQEhAQPNGrgitBtLjGA@mail.gmail.com>
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
To: Maxime Ripard <maxime@cerno.tech>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>, 
	Samuel Holland <samuel@sholland.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
	Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	linux-sunxi@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Phil Elwell <phil@raspberrypi.com>, 
	Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, Dom Cobley <dom@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_063627_669252_A8D13530 
X-CRM114-Status: GOOD (  37.45  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Maxime,

On Tue, Aug 16, 2022 at 3:20 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Fri, Aug 12, 2022 at 03:25:18PM +0200, Geert Uytterhoeven wrote:
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -1649,11 +1650,40 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);
> > >   * 0 on success or a negative error code on failure.
> > >   */
> > >  int drm_mode_create_tv_properties(struct drm_device *dev,
> > > +                                 unsigned int supported_tv_norms,
> > >                                   unsigned int num_modes,
> > >                                   const char * const modes[])
> > >  {
> > > +       static const struct drm_prop_enum_list tv_norm_values[] = {
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_NTSC_443) - 1, "NTSC-443" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_NTSC_J) - 1, "NTSC-J" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_NTSC_M) - 1, "NTSC-M" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_60) - 1, "PAL-60" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_B) - 1, "PAL-B" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_D) - 1, "PAL-D" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_G) - 1, "PAL-G" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_H) - 1, "PAL-H" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_I) - 1, "PAL-I" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_M) - 1, "PAL-M" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_N) - 1, "PAL-N" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_NC) - 1, "PAL-Nc" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_60) - 1, "SECAM-60" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_B) - 1, "SECAM-B" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_D) - 1, "SECAM-D" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_G) - 1, "SECAM-G" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_K) - 1, "SECAM-K" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_K1) - 1, "SECAM-K1" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_L) - 1, "SECAM-L" },
> >
> > The above are analog standards, with a variable horizontal resolution.
> >
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD480I) - 1, "hd480i" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD480P) - 1, "hd480p" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD576I) - 1, "hd576i" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD576P) - 1, "hd576p" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD720P) - 1, "hd720p" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD1080I) - 1, "hd1080i" },
> >
> > The above are digital standards, with a fixed resolution.
>
> Are they?
>
> It's not clear to me from looking at nouveau, but I was under the
> impression that they were modes for a component output, so CEA 770.3. I
> don't have the spec though, so I can't check.

Oh right, I forgot about analog HD over component, where you can use
other pixel clocks than in the digital standard.

> > You seem to have missed "hd1080p"?
>
> Nobody is using it. If we ever have a driver that uses it I think we can
> add it.

The PS3 supports 1080p over component
https://manuals.playstation.net/document/en/ps3/current/settings/videooutput.html

> > In addition, "hd720p", "hd080i", and "hd1080p" are available in both 50
> > and 60 (actually 59.94) Hz, while "hd1080p" can also use 24 or 25 Hz.
>
> It looks like nouveau only exposes modes for 480p at 59.94Hz, 576p at
> 50Hz, 720p at 60Hz, 1080i at 30Hz.

PS3 supports both 50 and 60 Hz (same link above).

> > Either you have to add them here (e.g. "hd720p50" and "hd720p60"), or
> > handle them through "@<refresh>".  The latter would impact "[PATCH v1
> > 09/35] drm/modes: Move named modes parsing to a separate function", as
> > currently a named mode and a refresh rate can't be specified both.
>
> I think the former would make more sense. It simplifies a bit the
> parser, and we're going to use a named mode anyway.
>
> > As "[PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
> > command-line option" uses a separate "tv_mode" option, and not the main
> > mode name, I think you want to add them here.
>
> It's a separate story I think, we could have a named mode hd720p50,
> which would be equivalent to 1280x720,tv_mode=hd720p

So where's the field rate in "1280x720,tv_mode=hd720p"?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
