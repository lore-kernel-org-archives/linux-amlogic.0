Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A21C25B08
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Aug 2022 14:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eXyVT/4PBUTwJ7ykXzEVBoIeWFfp347wTmH4miXRtss=; b=0fCyAkbd9cK+eM
	CXFjomnDJVn3QLjap99ggACK0+XffBKJ7Bhvezy5WA5nP11rN1Ki775lacmh58Oxe+DvWXJovB1L0
	0XWRJjjnjOgSv+COntXFHyLePRDYsBRB0utTqpP4xDde6AnQIAjksKLDs/MsKDmq/NQhnjQmOtyZP
	EQPFs7SCj2zTNTLPxHTS28Yi4CwEU2dp79uc3Yor4x6BzKdNaUxRxMij6tMeCUvtNndDK+an7hNwE
	CZvwXiz8kLALmEHmU3ZnBu1w/lbWg+jXm+o8Q8/Ofeo0wRn3aSSq6YP445XN32rlSjnMJLTI9w+dD
	O5Ect+HlPjBSatHL59fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOJf9-002edE-JM; Wed, 17 Aug 2022 14:04:51 +0000
Received: from mail-qt1-f178.google.com ([209.85.160.178])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOJey-002eW1-16; Wed, 17 Aug 2022 14:04:41 +0000
Received: by mail-qt1-f178.google.com with SMTP id w28so10402307qtc.7;
        Wed, 17 Aug 2022 07:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=4dcyblUn3bURjZBjn5VOr+f2Wy5bXXXMGqJEHlnVqeg=;
        b=ioXX238DExrX7iigzcE5gPTTVjW0pKOw7pCNitMYBKfHXJwlvFyHyqFVtOvN4eAwUE
         RmEGFzC0twBYcT0Jtre/FcOPXvECIAhN63jP+Cs+ImCdv4LzjzeqtX1mHgwW0QqlysxK
         C7rfvCu3Jtdd43RO/x4hzUijdXy7Gs+M2iGqwWWYpR2CYoIlEB0A35zJJpTvd/zJOC5l
         mD11H+dtjDJ4Eo9qIw8l6yUbS0tQqW+oJlLCUCxyKzc/cvLugwVOfnEB+TO4dcnz1NTR
         VmzNLBGawPvgOcvQANT2gNwJhnei39nRixAjrn1L7dCVXM+U+c3DokXcOoVGlZ4s3h4K
         Q2Zg==
X-Gm-Message-State: ACgBeo1QCGEgupS1z95MkxTOQSS+FDblOfXhnHtM85YWYvudGp6XY+cI
	zgbZ4oQxoj3zFBQLqoWws9u5w1tCE9I2Cw==
X-Google-Smtp-Source: AA6agR5dzb85FfsVELdguYCwZ0YGm85wpWoTem6atb++KoPp1zU5BePxL43mHyI86JG8qcKTIhLkkw==
X-Received: by 2002:a05:622a:388:b0:343:7a6d:fcdf with SMTP id j8-20020a05622a038800b003437a6dfcdfmr20120876qtx.433.1660745077845;
        Wed, 17 Aug 2022 07:04:37 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id h4-20020a05620a244400b006b5a12eb838sm9502523qkn.31.2022.08.17.07.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 07:04:37 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-324ec5a9e97so233509537b3.7;
        Wed, 17 Aug 2022 07:04:37 -0700 (PDT)
X-Received: by 2002:a81:f47:0:b0:31f:434b:5ee with SMTP id 68-20020a810f47000000b0031f434b05eemr21824312ywp.383.1660745076963;
 Wed, 17 Aug 2022 07:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220816132040.uwirtjm5yr6rdd3q@houat> <CAMuHMdWevP=3af=NneAJEDfOR+sz1thrQEhAQPNGrgitBtLjGA@mail.gmail.com>
 <20220816141116.5nuszmilqv2exdb3@houat> <CAMuHMdXq_xGPx46bdnUFGDiG4kcgdxtXaRGTucFd3TRq8353dg@mail.gmail.com>
 <20220816154956.pkdpxmmw27mia5ix@houat> <CAMuHMdX0L6cO_jYXKZTv0sm9V39Eiy_STiknSkdRQG4k-9GJeg@mail.gmail.com>
 <20220817074710.w4c4xwj7edly2b5p@houat> <CAMuHMdXeBakWr6geOWGxnjQYaU9Pi4tRvVFFtubyMJZTT2nPnw@mail.gmail.com>
 <20220817111454.pn2iltvyo2drebq7@houat> <CAMuHMdU57g1rNoLo65jhLK8mk4YkNEbMz1E7XKWk2dnCxTr=gg@mail.gmail.com>
 <20220817131854.jwmhqvhfhp77bbr3@houat>
In-Reply-To: <20220817131854.jwmhqvhfhp77bbr3@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Aug 2022 16:04:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXrfH9MArXesfNCvqayiq17u7XaqtSvXTNt4V10=obSHQ@mail.gmail.com>
Message-ID: <CAMuHMdXrfH9MArXesfNCvqayiq17u7XaqtSvXTNt4V10=obSHQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220817_070440_113489_E7A4CBCB 
X-CRM114-Status: GOOD (  35.92  )
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

On Wed, Aug 17, 2022 at 3:19 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Wed, Aug 17, 2022 at 03:05:52PM +0200, Geert Uytterhoeven wrote:
> > On Wed, Aug 17, 2022 at 1:15 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > On Wed, Aug 17, 2022 at 10:35:07AM +0200, Geert Uytterhoeven wrote:
> > > > On Wed, Aug 17, 2022 at 9:47 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > On Wed, Aug 17, 2022 at 09:31:18AM +0200, Geert Uytterhoeven wrote:
> > > > > > On Tue, Aug 16, 2022 at 5:50 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > > > On Tue, Aug 16, 2022 at 04:43:44PM +0200, Geert Uytterhoeven wrote:
> > > > > > > > > > > > Either you have to add them here (e.g. "hd720p50" and "hd720p60"), or
> > > > > > > > > > > > handle them through "@<refresh>".  The latter would impact "[PATCH v1
> > > > > > > > > > > > 09/35] drm/modes: Move named modes parsing to a separate function", as
> > > > > > > > > > > > currently a named mode and a refresh rate can't be specified both.
> > > > > > > > > > >
> > > > > > > > > > > I think the former would make more sense. It simplifies a bit the
> > > > > > > > > > > parser, and we're going to use a named mode anyway.
> > > > > > > > > > >
> > > > > > > > > > > > As "[PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
> > > > > > > > > > > > command-line option" uses a separate "tv_mode" option, and not the main
> > > > > > > > > > > > mode name, I think you want to add them here.
> > > > > > > > > > >
> > > > > > > > > > > It's a separate story I think, we could have a named mode hd720p50,
> > > > > > > > > > > which would be equivalent to 1280x720,tv_mode=hd720p
> > > > > > > > > >
> > > > > > > > > > So where's the field rate in "1280x720,tv_mode=hd720p"?
> > > > > > > > >
> > > > > > > > > Yeah, sorry I meant 1280x720@50,tv_mode=hd720p
> > > > > > > >
> > > > > > > > Above you said "I think the former would make more sense", so that
> > > > > > > > should be "1280x720,tv_mode=hd720p50"?
> > > > > > >
> > > > > > > No, 720p at 50Hz would be either hd720p50 or 1280x720@50,tv_mode=hd720p
> > > > > > > and 60Hz would be hd720p60 or 1280x720@60,tv_mode=hd720p
> > > > > >
> > > > > > I disagree: hd720p50 and hd720p60 are different TV modes.
> > > > >
> > > > > I agree, and I don't see how that command-line doesn't express that?
> > > >
> > > > Oh, I see what you mean: yes, it expresses that.
> > > > But it is inconsistent with the NTSC/PAL/SECAM/hd{480,576}[ip] modes,
> > > > where the TV mode specifies both number of lines and frame rate.
> > >
> > > Only if we're using a named mode, and naming is hard :)
> >
> > That's not true: "640x480,tv_mode=PAL-N" would give me a mode with
> > 625 lines and 25 frames/s, "640x480,tv_mode=PAL-M" would give me a
> > mode with 525 lines and 30 frames/s.
>
> In that series, "640x480,tv_mode=PAL-N" would be rejected as invalid:
>
> https://lore.kernel.org/dri-devel/20220728-rpi-analog-tv-properties-v1-14-3d53ae722097@cerno.tech/

It would become supported once the ideas from thread "[PATCH v1 04/35]
drm/modes: Introduce 480i and 576i modes" are implemented...

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
