Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CC4C32771
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Aug 2022 09:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H7HPb8ku1NFixnxUepAwpRWrivAHBtJu3CNoe6K1vy8=; b=pV1FplgurLhE7i
	PMWette6OF0CRXtuxXspmoxvOxd6qGvLBptnqF5Piu7XRuOlNevbbMHgnDM2kjTtn74ETRHY5xWzA
	XZ+GQ9WH/HTCPrdnuOyoQjOm2oNDUxNr8Zo0h9mqwwclzFdKxV+pTWGEYS2oM4c52Vt9TekJNlks/
	MVK9ji1B/3UD4y+eSTEyfEy2WH3bhUeT9ZORJ3GwhrMsl7VTz09qqog38K6OH54dAddKYr6iOYs0g
	sPT+JzB6WpND0VW21z+xxqEcN/E+NiBJMr/Tm3NiLUsV73UPV/B8Oet6ZaoiNhp66WBrPNyrSxWM2
	qsYu5G8Cm5rSrmbv7DYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOyQF-0052Vg-5b; Fri, 19 Aug 2022 09:36:11 +0000
Received: from mail-qt1-f179.google.com ([209.85.160.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOyQ1-0052Hg-AI; Fri, 19 Aug 2022 09:35:59 +0000
Received: by mail-qt1-f179.google.com with SMTP id e28so2932600qts.1;
        Fri, 19 Aug 2022 02:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=oXk24pt8yzz//H9K/Ms8QIvLemhYFXzzYPTlQRFRJUQ=;
        b=clql8RaoAbcOIg4Mmo/p61g42bw9ed5SpsG2127w+YeNbUd/hyUyWEfBi4E8wzwcc+
         bjfd13pDx5fZI4uP18yo0HkmSWMb5Zjf5hkFuwDOBqe6gkRyL5uwaZlHoNdHZqewlui0
         Np7iehw0DF4ZgKFKmmArCn88tt2jvcNHhAPyLwsEI4QS6qlXSpjBji8NRaneTCZBrK0s
         uyoifz0uE/yXY7dJ6yxp8lJTQzUXxNoIfCazc/BKZRLK8fA2lwuISPbfS6mVvEshboHh
         4Iz1ig6/cb6GZjl4J3TFce5NuI32O6db4QiLbaC3gEsxwSrEAn4yj0/cgNS2TcQ/LfK+
         pUqA==
X-Gm-Message-State: ACgBeo36zwihw0TsnxaHpsBBt8SQlUIeSyf9SMbixO/WVVSMjPuACXk7
	LEk5kQ0IDMf9Zqh+VhcpoaLTV6dg7uJCaw==
X-Google-Smtp-Source: AA6agR4eRu27XYUmI40lKrt+TGsaAzmKcijAEan+oIHnq+jcHAb7GIIjF2vFyYkYUb5OiVBLCj8utg==
X-Received: by 2002:ac8:5e0a:0:b0:344:9b69:eef0 with SMTP id h10-20020ac85e0a000000b003449b69eef0mr3086505qtx.666.1660901754632;
        Fri, 19 Aug 2022 02:35:54 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id bs43-20020a05620a472b00b006b9b7879964sm3423940qkb.28.2022.08.19.02.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 02:35:53 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-3246910dac3so106554987b3.12;
        Fri, 19 Aug 2022 02:35:53 -0700 (PDT)
X-Received: by 2002:a81:b812:0:b0:328:68e4:c886 with SMTP id
 v18-20020a81b812000000b0032868e4c886mr6398447ywe.502.1660901753206; Fri, 19
 Aug 2022 02:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220816154956.pkdpxmmw27mia5ix@houat> <CAMuHMdX0L6cO_jYXKZTv0sm9V39Eiy_STiknSkdRQG4k-9GJeg@mail.gmail.com>
 <20220817074710.w4c4xwj7edly2b5p@houat> <CAMuHMdXeBakWr6geOWGxnjQYaU9Pi4tRvVFFtubyMJZTT2nPnw@mail.gmail.com>
 <20220817111454.pn2iltvyo2drebq7@houat> <CAMuHMdU57g1rNoLo65jhLK8mk4YkNEbMz1E7XKWk2dnCxTr=gg@mail.gmail.com>
 <20220817131854.jwmhqvhfhp77bbr3@houat> <CAMuHMdXrfH9MArXesfNCvqayiq17u7XaqtSvXTNt4V10=obSHQ@mail.gmail.com>
 <20220818145436.vqojnhmvhjxdzooe@houat> <CAMuHMdW5kTUeg59fym7QxfN5oisTZHWbiAPeSYKJVShZWduJcA@mail.gmail.com>
 <20220818153442.u4knumkfbe7j6zj3@houat>
In-Reply-To: <20220818153442.u4knumkfbe7j6zj3@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Aug 2022 11:35:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUNYErf4PJLbSFFdB1EhvzbscqxHE74FnsjYQXLy8DLZA@mail.gmail.com>
Message-ID: <CAMuHMdUNYErf4PJLbSFFdB1EhvzbscqxHE74FnsjYQXLy8DLZA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220819_023557_436956_EAE1575C 
X-CRM114-Status: GOOD (  47.02  )
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

On Thu, Aug 18, 2022 at 5:34 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Thu, Aug 18, 2022 at 05:20:42PM +0200, Geert Uytterhoeven wrote:
> > On Thu, Aug 18, 2022 at 4:54 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > On Wed, Aug 17, 2022 at 04:04:24PM +0200, Geert Uytterhoeven wrote:
> > > > On Wed, Aug 17, 2022 at 3:19 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > On Wed, Aug 17, 2022 at 03:05:52PM +0200, Geert Uytterhoeven wrote:
> > > > > > On Wed, Aug 17, 2022 at 1:15 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > > > On Wed, Aug 17, 2022 at 10:35:07AM +0200, Geert Uytterhoeven wrote:
> > > > > > > > On Wed, Aug 17, 2022 at 9:47 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > > > > > On Wed, Aug 17, 2022 at 09:31:18AM +0200, Geert Uytterhoeven wrote:
> > > > > > > > > > On Tue, Aug 16, 2022 at 5:50 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > > > > > > > On Tue, Aug 16, 2022 at 04:43:44PM +0200, Geert Uytterhoeven wrote:
> > > > > > > > > > > > > > > > Either you have to add them here (e.g. "hd720p50" and "hd720p60"), or
> > > > > > > > > > > > > > > > handle them through "@<refresh>".  The latter would impact "[PATCH v1
> > > > > > > > > > > > > > > > 09/35] drm/modes: Move named modes parsing to a separate function", as
> > > > > > > > > > > > > > > > currently a named mode and a refresh rate can't be specified both.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > I think the former would make more sense. It simplifies a bit the
> > > > > > > > > > > > > > > parser, and we're going to use a named mode anyway.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > As "[PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
> > > > > > > > > > > > > > > > command-line option" uses a separate "tv_mode" option, and not the main
> > > > > > > > > > > > > > > > mode name, I think you want to add them here.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > It's a separate story I think, we could have a named mode hd720p50,
> > > > > > > > > > > > > > > which would be equivalent to 1280x720,tv_mode=hd720p
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > So where's the field rate in "1280x720,tv_mode=hd720p"?
> > > > > > > > > > > > >
> > > > > > > > > > > > > Yeah, sorry I meant 1280x720@50,tv_mode=hd720p
> > > > > > > > > > > >
> > > > > > > > > > > > Above you said "I think the former would make more sense", so that
> > > > > > > > > > > > should be "1280x720,tv_mode=hd720p50"?
> > > > > > > > > > >
> > > > > > > > > > > No, 720p at 50Hz would be either hd720p50 or 1280x720@50,tv_mode=hd720p
> > > > > > > > > > > and 60Hz would be hd720p60 or 1280x720@60,tv_mode=hd720p
> > > > > > > > > >
> > > > > > > > > > I disagree: hd720p50 and hd720p60 are different TV modes.
> > > > > > > > >
> > > > > > > > > I agree, and I don't see how that command-line doesn't express that?
> > > > > > > >
> > > > > > > > Oh, I see what you mean: yes, it expresses that.
> > > > > > > > But it is inconsistent with the NTSC/PAL/SECAM/hd{480,576}[ip] modes,
> > > > > > > > where the TV mode specifies both number of lines and frame rate.
> > > > > > >
> > > > > > > Only if we're using a named mode, and naming is hard :)
> > > > > >
> > > > > > That's not true: "640x480,tv_mode=PAL-N" would give me a mode with
> > > > > > 625 lines and 25 frames/s, "640x480,tv_mode=PAL-M" would give me a
> > > > > > mode with 525 lines and 30 frames/s.
> > > > >
> > > > > In that series, "640x480,tv_mode=PAL-N" would be rejected as invalid:
> > > > >
> > > > > https://lore.kernel.org/dri-devel/20220728-rpi-analog-tv-properties-v1-14-3d53ae722097@cerno.tech/
> > > >
> > > > It would become supported once the ideas from thread "[PATCH v1 04/35]
> > > > drm/modes: Introduce 480i and 576i modes" are implemented...
> > >
> > > Indeed, but I'm still not sure what your concern is here.
> > > "640x480,tv_mode=PAL-N" and "640x480,tv_mode=PAL-M" are both fairly
> > > obvious.
> > >
> > > You were initially saying that you had concern over the inconsistency of
> > > NTSC/PAL/SECAM where the TV mode would specify a number of lines and
> > > frame rate, but hd720p50 also specifies a number of line and frame rate?
> >
> > My concern is that you want to call the TV mode "hd720p", which
> > does not dictate the frame rate.
> > I would like to have both "720p50" and "720p60", as they do dictate
> > the frame rate, like all the non-hd modes.
>
> But they don't?
>
> The refresh rate is part of the drm_display_mode, whereas that property
> is metadata and entirely separate from the display mode.
>
> You can even change it without changing the mode at all

Yes, the refresh rate is part of drm_display_mode.  Vdisplay also
is, but that doesn't mean you can set it to e.g. 700 when using
"tv_mode=PAL-B". Some (combination of) parameters in drm_display_mode
are dictated by the tv_mode.

Perhaps the meaning of "tv_mode" should be clarified? What does it
really mean, and what parameters does it (not) constrain?

For e.g. "PAL-B", I know it's a mode with 625 lines and 30 frames/s
(60 fields/s).
For "hd720p" I know it is an analog mode with 750 lines, but it's still
ambiguous, as I don't know if it is the variant with 60 or 50 frames/s.

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
