Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D25BC25B08
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Aug 2022 07:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m0siU4w94/vnlCjd/FFLt9qolZAYYoDH5BKMqDuasE4=; b=OVYqLgnyLC5skN
	ATM+J49ae4PbmUh4pwq4xEX5O/tHE4SmPINDkDnPt8dMC6eRyYakOQDzoC0t37uWmofgzp8r6vK9c
	8P6pxLEAWZtIHgSxazRdISkEcraiz1p4jS/mwh3BgncIUUJZcOnNVbGy5M4y1Omzk9+F3uQL94sQn
	fRAgxm7unY7nvz+gAm0Hs+b14ewYrbOJZ/bjGma9ErAEl+7uOsY1KhgvHg+qoTuYGneLeBHW7URlI
	vd9+Lz7BvTw3Bs8H3oZ4qQDelhe7Uj2vxgO9+d/BfRfQzz0cXS9uayMxn7MkH4y3hPbbwaXrj50V8
	KwQjcFaMWU5T41GWmMNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oODe4-00DZXd-5p; Wed, 17 Aug 2022 07:39:20 +0000
Received: from mail-qv1-f45.google.com ([209.85.219.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oODdo-00DYzl-Mz; Wed, 17 Aug 2022 07:39:06 +0000
Received: by mail-qv1-f45.google.com with SMTP id m17so441862qvv.7;
        Wed, 17 Aug 2022 00:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=MoCGxpdBSZqOnL0zHKYLDEdga6g996l84p2nV9SRtCY=;
        b=rDxnmrgL/XQqQ+uCjVNx0DIjny2ZiBvoa/qyXg35mkG31xH9U8P3FKGwE24rHStJx+
         BgtXi9TURPzvEItW0JAvJnkGkVhc4YkG8wKVlH68ZyeV/lzjknWGcEB2UxYVeM4vz9nD
         0iZqQnvri/U52++HqrUEWtSRxkrOd47zdkf2SVL2A7xOMNJC1LhGAWQpxHcQvFPu5niG
         6JL+ZWbeo3oRoRIXNRx4MfUphGB7td/NJtmLUj0UlY8fCsmsp+Cu3PgoKDajTqsNezpH
         CU9jeohexhtWn8w2q2bs86APgsF2AEBwo41+8N+FKZDKQECos9J/EwJPKT93Wxv2Zxxj
         BjYQ==
X-Gm-Message-State: ACgBeo1ZAKGbvEDaVSy8KtLg/d2ayUoPqo0RyPL05exui2s08jeasldD
	h6VKHxH52CZNOgFHMMJQ14oIki8fzIXUHQ==
X-Google-Smtp-Source: AA6agR4LwCKsWwMyzBcDEtUapHKKxSiuzNTRwoWkNqT2fXWjTg4OAHmogF43cJV3Ft6SxmXXySft2w==
X-Received: by 2002:a0c:b253:0:b0:495:ee4f:ba4e with SMTP id k19-20020a0cb253000000b00495ee4fba4emr4117372qve.5.1660721939476;
        Wed, 17 Aug 2022 00:38:59 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id b6-20020a05620a0f8600b006a6d7c3a82esm12645863qkn.15.2022.08.17.00.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 00:38:59 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-32fd97c199fso185705757b3.6;
        Wed, 17 Aug 2022 00:38:59 -0700 (PDT)
X-Received: by 2002:a25:f06:0:b0:670:1685:d31d with SMTP id
 6-20020a250f06000000b006701685d31dmr17606473ybp.380.1660721490548; Wed, 17
 Aug 2022 00:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <CAMuHMdWYo7M44uLNhTmJenGDreGALBZ9E48oyBDEeAuL=0h=dw@mail.gmail.com>
 <20220816132040.uwirtjm5yr6rdd3q@houat> <CAMuHMdWevP=3af=NneAJEDfOR+sz1thrQEhAQPNGrgitBtLjGA@mail.gmail.com>
 <20220816141116.5nuszmilqv2exdb3@houat> <CAMuHMdXq_xGPx46bdnUFGDiG4kcgdxtXaRGTucFd3TRq8353dg@mail.gmail.com>
 <20220816154956.pkdpxmmw27mia5ix@houat>
In-Reply-To: <20220816154956.pkdpxmmw27mia5ix@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Aug 2022 09:31:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX0L6cO_jYXKZTv0sm9V39Eiy_STiknSkdRQG4k-9GJeg@mail.gmail.com>
Message-ID: <CAMuHMdX0L6cO_jYXKZTv0sm9V39Eiy_STiknSkdRQG4k-9GJeg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220817_003904_793804_C3FAF3EF 
X-CRM114-Status: GOOD (  27.69  )
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

On Tue, Aug 16, 2022 at 5:50 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Tue, Aug 16, 2022 at 04:43:44PM +0200, Geert Uytterhoeven wrote:
> > > > > > Either you have to add them here (e.g. "hd720p50" and "hd720p60"), or
> > > > > > handle them through "@<refresh>".  The latter would impact "[PATCH v1
> > > > > > 09/35] drm/modes: Move named modes parsing to a separate function", as
> > > > > > currently a named mode and a refresh rate can't be specified both.
> > > > >
> > > > > I think the former would make more sense. It simplifies a bit the
> > > > > parser, and we're going to use a named mode anyway.
> > > > >
> > > > > > As "[PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
> > > > > > command-line option" uses a separate "tv_mode" option, and not the main
> > > > > > mode name, I think you want to add them here.
> > > > >
> > > > > It's a separate story I think, we could have a named mode hd720p50,
> > > > > which would be equivalent to 1280x720,tv_mode=hd720p
> > > >
> > > > So where's the field rate in "1280x720,tv_mode=hd720p"?
> > >
> > > Yeah, sorry I meant 1280x720@50,tv_mode=hd720p
> >
> > Above you said "I think the former would make more sense", so that
> > should be "1280x720,tv_mode=hd720p50"?
>
> No, 720p at 50Hz would be either hd720p50 or 1280x720@50,tv_mode=hd720p
> and 60Hz would be hd720p60 or 1280x720@60,tv_mode=hd720p

I disagree: hd720p50 and hd720p60 are different TV modes.
Treating them the same would be similar to treating unmodulated (e.g.
component) PAL-N (25 frames/s) and PAL-M (30 frames/s) the same.

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
