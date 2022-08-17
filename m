Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FE1C25B08
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Aug 2022 08:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEF9or/iT0IT6eTEmnupX0N9VApt9zZ6JQ6Sv5C4UfA=; b=PwUP63G0HxyUaF
	HHUvF35mQNLOKxjCVMQNHhMA5qR71U/PRTz3/3rcZPNzHnJQyvZwKpO5lavncF+5UlwL1LIvTQLy6
	6XVquZPxa1JwrbFDVEg2khs526MYooyGeZgMy4Axp+97itvEDfN/Ki9NSbPkYugRK0fG97LdPLurK
	Nu/+yCD2TBbajL0M/GQOrc+sbxSoGMQQn8QDL5EqNwG4kVOhL0XswWGq/pfE03d38qE2Jdwvxhyqj
	Y08JHTOScGQfAOYSlpcZmPVg7QeHjHvP+IZcMtOzYzRpcR/AqXsJevzkj7rfmC9hihToyzBSaesS8
	X/fIQw3Yn15M3hShRxpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOEeX-00FZoZ-1C; Wed, 17 Aug 2022 08:43:53 +0000
Received: from mail-qk1-f173.google.com ([209.85.222.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOEeH-00FZRo-5a; Wed, 17 Aug 2022 08:43:38 +0000
Received: by mail-qk1-f173.google.com with SMTP id t11so9887615qkt.6;
        Wed, 17 Aug 2022 01:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=oGUO+aRsBeoQZf7v2A5uqTblY/HRl0z6pHKiV+qcGIw=;
        b=Df+A+sT9FR+AUvjbp5yOj+XOZCHDJTJGiigE6DRQK2NBNw1IfUnJFGAg2cCoko7R19
         plE9Do6jxilWtgXuE8/Rkr30z+Ddg8G1AKZ4K2u/mkIdRJ0x13MHWgHp8kjdKWI2BQbR
         8i9tt8CgFISa90J0H7x6YmeeV0jGtLmFXAWZV6EfbM2O2ML7u8kG/kz95yng+qeN+eJv
         9jgCYNdkqaPsMPvPCjK5icj9P1TK2lmL/QGEjh3/3s1SoQlVo5XHvdteGRJ0j2niitVl
         7PwaxS6EzpqHLJAUwcJdLeoW00b9wijqroE/TxG6gH6VmTv4ah0PN12Uhlgli6y6KUeT
         oRGw==
X-Gm-Message-State: ACgBeo0BOAU2+OPINJIJL+1osqVp1dgXf2hCb+n2Arz13k7Yxe4qlQ8A
	s5hbuNwUcuUOogCKyNeZi79gSxpRyf9fDQ==
X-Google-Smtp-Source: AA6agR7zetqEyexSSS0vptk1zBUiOdvReDsTuysXWz5kIXXAhCtNn8fo+EDk2yqneAUboGPCRu4a9Q==
X-Received: by 2002:a37:60a:0:b0:6bb:1698:277f with SMTP id 10-20020a37060a000000b006bb1698277fmr10880345qkg.454.1660725814824;
        Wed, 17 Aug 2022 01:43:34 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id bw11-20020a05622a098b00b0034306f519ddsm12248502qtb.65.2022.08.17.01.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 01:43:34 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-324ec5a9e97so213733727b3.7;
        Wed, 17 Aug 2022 01:43:34 -0700 (PDT)
X-Received: by 2002:a05:6902:100a:b0:676:ed53:25b0 with SMTP id
 w10-20020a056902100a00b00676ed5325b0mr17391450ybt.365.1660725320216; Wed, 17
 Aug 2022 01:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <CAMuHMdWYo7M44uLNhTmJenGDreGALBZ9E48oyBDEeAuL=0h=dw@mail.gmail.com>
 <20220816132040.uwirtjm5yr6rdd3q@houat> <CAMuHMdWevP=3af=NneAJEDfOR+sz1thrQEhAQPNGrgitBtLjGA@mail.gmail.com>
 <20220816141116.5nuszmilqv2exdb3@houat> <CAMuHMdXq_xGPx46bdnUFGDiG4kcgdxtXaRGTucFd3TRq8353dg@mail.gmail.com>
 <20220816154956.pkdpxmmw27mia5ix@houat> <CAMuHMdX0L6cO_jYXKZTv0sm9V39Eiy_STiknSkdRQG4k-9GJeg@mail.gmail.com>
 <20220817074710.w4c4xwj7edly2b5p@houat>
In-Reply-To: <20220817074710.w4c4xwj7edly2b5p@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Aug 2022 10:35:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXeBakWr6geOWGxnjQYaU9Pi4tRvVFFtubyMJZTT2nPnw@mail.gmail.com>
Message-ID: <CAMuHMdXeBakWr6geOWGxnjQYaU9Pi4tRvVFFtubyMJZTT2nPnw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220817_014337_241466_671EB106 
X-CRM114-Status: GOOD (  30.62  )
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

On Wed, Aug 17, 2022 at 9:47 AM Maxime Ripard <maxime@cerno.tech> wrote:
> On Wed, Aug 17, 2022 at 09:31:18AM +0200, Geert Uytterhoeven wrote:
> > On Tue, Aug 16, 2022 at 5:50 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > On Tue, Aug 16, 2022 at 04:43:44PM +0200, Geert Uytterhoeven wrote:
> > > > > > > > Either you have to add them here (e.g. "hd720p50" and "hd720p60"), or
> > > > > > > > handle them through "@<refresh>".  The latter would impact "[PATCH v1
> > > > > > > > 09/35] drm/modes: Move named modes parsing to a separate function", as
> > > > > > > > currently a named mode and a refresh rate can't be specified both.
> > > > > > >
> > > > > > > I think the former would make more sense. It simplifies a bit the
> > > > > > > parser, and we're going to use a named mode anyway.
> > > > > > >
> > > > > > > > As "[PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
> > > > > > > > command-line option" uses a separate "tv_mode" option, and not the main
> > > > > > > > mode name, I think you want to add them here.
> > > > > > >
> > > > > > > It's a separate story I think, we could have a named mode hd720p50,
> > > > > > > which would be equivalent to 1280x720,tv_mode=hd720p
> > > > > >
> > > > > > So where's the field rate in "1280x720,tv_mode=hd720p"?
> > > > >
> > > > > Yeah, sorry I meant 1280x720@50,tv_mode=hd720p
> > > >
> > > > Above you said "I think the former would make more sense", so that
> > > > should be "1280x720,tv_mode=hd720p50"?
> > >
> > > No, 720p at 50Hz would be either hd720p50 or 1280x720@50,tv_mode=hd720p
> > > and 60Hz would be hd720p60 or 1280x720@60,tv_mode=hd720p
> >
> > I disagree: hd720p50 and hd720p60 are different TV modes.
>
> I agree, and I don't see how that command-line doesn't express that?

Oh, I see what you mean: yes, it expresses that.
But it is inconsistent with the NTSC/PAL/SECAM/hd{480,576}[ip] modes,
where the TV mode specifies both number of lines and frame rate.

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
