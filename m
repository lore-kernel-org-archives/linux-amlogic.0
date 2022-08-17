Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAC1C25B08
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Aug 2022 13:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sia7qeVVVHBXHL5e07Ww4reWbHtOI92+A11MydbolqE=; b=jiDt6ldQMipof0
	3pdtZ06y2ZoIgChZNU1Tn0Fnj4zf3Be5IKW8DrqEtRbdMw1bS31xwfi4VxlQLwFB6eycLPDjdGn5z
	D7y2dFZo6/7yk1Gbq/vo8TcJvpaxxWoRpyRm/9UXWQqH7khj+dOnwpuJZV91Q8c9x36TPQnQ+6TrU
	3U6sOsS+YnAispeWfRcIyt+wl9x+09WrpWVY2RfmH/dNBiM5GjV3zWLfxVvku7ZVBIlAFPG+orKU5
	zEwiLR8lt+u8M1X/c0Z5NCKl0hW0NiEqFqiOVlIjbitebpInfVQQ4hdKodsALm3VhAKcduly8L9yN
	iV5/RiTfMGsrDkJZL2cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOIkY-002Cyu-Bx; Wed, 17 Aug 2022 13:06:22 +0000
Received: from mail-qk1-f177.google.com ([209.85.222.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOIkL-002Csv-8s; Wed, 17 Aug 2022 13:06:11 +0000
Received: by mail-qk1-f177.google.com with SMTP id f14so10292827qkm.0;
        Wed, 17 Aug 2022 06:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=wT+w/e1pir6od65k8fW73wcIBpWHrOcKqnuAFp6tc4E=;
        b=phnvlZOhM9mxlIiL/7PiWOucSj9FwfsdJmT+MCwEWCoSHwcDqd9/jKSgRovyrG84p1
         Jsyv+nYsQYDxguAEEFXD+1oTVx0iHgm7JPwXbX/Ay3PTuGBCqb6A4IuKxPM32pzKIFAB
         3yPDUZv/8x7+Od5/gTOHCoRQb424j4twET6jHwCNgV29hHC3aasD8E96tv7JX56AMdBN
         D+umrxFjsNARYNhQvAACClU5m5dUzEnBOU6cUmFmES4LgP6rMfVWR6NQrO8Wx/f7qvX5
         Vw6q2mhe//fto41AK9XRO4MREQW26PvHFJRDDPoLFNEqBk9iroh2LaORrmwkH6zCcvaM
         pWqQ==
X-Gm-Message-State: ACgBeo0hCEbnTLMR8cfPdhsU2b3ozYga6lzMqWQV3QmwqLRkWtPMdv4z
	RgyzZO09bGOxqSECsv3FU7WCCSDep63MXw==
X-Google-Smtp-Source: AA6agR6N9zSJY4Hbl57pc9gOGMhhAXQR/i3A3FQWISpc3GXRz5mrdAOU+w1Hy8ul/hM8zbh4Lx8/iQ==
X-Received: by 2002:a05:620a:40cf:b0:6b1:41dd:9710 with SMTP id g15-20020a05620a40cf00b006b141dd9710mr17770529qko.727.1660741566504;
        Wed, 17 Aug 2022 06:06:06 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id r19-20020a05620a299300b006b555509398sm3659240qkp.136.2022.08.17.06.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 06:06:05 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-33387bf0c4aso124059667b3.11;
        Wed, 17 Aug 2022 06:06:04 -0700 (PDT)
X-Received: by 2002:a81:502:0:b0:32f:dcc4:146e with SMTP id
 2-20020a810502000000b0032fdcc4146emr14565309ywf.316.1660741564697; Wed, 17
 Aug 2022 06:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <CAMuHMdWYo7M44uLNhTmJenGDreGALBZ9E48oyBDEeAuL=0h=dw@mail.gmail.com>
 <20220816132040.uwirtjm5yr6rdd3q@houat> <CAMuHMdWevP=3af=NneAJEDfOR+sz1thrQEhAQPNGrgitBtLjGA@mail.gmail.com>
 <20220816141116.5nuszmilqv2exdb3@houat> <CAMuHMdXq_xGPx46bdnUFGDiG4kcgdxtXaRGTucFd3TRq8353dg@mail.gmail.com>
 <20220816154956.pkdpxmmw27mia5ix@houat> <CAMuHMdX0L6cO_jYXKZTv0sm9V39Eiy_STiknSkdRQG4k-9GJeg@mail.gmail.com>
 <20220817074710.w4c4xwj7edly2b5p@houat> <CAMuHMdXeBakWr6geOWGxnjQYaU9Pi4tRvVFFtubyMJZTT2nPnw@mail.gmail.com>
 <20220817111454.pn2iltvyo2drebq7@houat>
In-Reply-To: <20220817111454.pn2iltvyo2drebq7@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Aug 2022 15:05:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU57g1rNoLo65jhLK8mk4YkNEbMz1E7XKWk2dnCxTr=gg@mail.gmail.com>
Message-ID: <CAMuHMdU57g1rNoLo65jhLK8mk4YkNEbMz1E7XKWk2dnCxTr=gg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220817_060609_333080_5104B616 
X-CRM114-Status: GOOD (  37.54  )
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

On Wed, Aug 17, 2022 at 1:15 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Wed, Aug 17, 2022 at 10:35:07AM +0200, Geert Uytterhoeven wrote:
> > On Wed, Aug 17, 2022 at 9:47 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > On Wed, Aug 17, 2022 at 09:31:18AM +0200, Geert Uytterhoeven wrote:
> > > > On Tue, Aug 16, 2022 at 5:50 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > On Tue, Aug 16, 2022 at 04:43:44PM +0200, Geert Uytterhoeven wrote:
> > > > > > > > > > Either you have to add them here (e.g. "hd720p50" and "hd720p60"), or
> > > > > > > > > > handle them through "@<refresh>".  The latter would impact "[PATCH v1
> > > > > > > > > > 09/35] drm/modes: Move named modes parsing to a separate function", as
> > > > > > > > > > currently a named mode and a refresh rate can't be specified both.
> > > > > > > > >
> > > > > > > > > I think the former would make more sense. It simplifies a bit the
> > > > > > > > > parser, and we're going to use a named mode anyway.
> > > > > > > > >
> > > > > > > > > > As "[PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
> > > > > > > > > > command-line option" uses a separate "tv_mode" option, and not the main
> > > > > > > > > > mode name, I think you want to add them here.
> > > > > > > > >
> > > > > > > > > It's a separate story I think, we could have a named mode hd720p50,
> > > > > > > > > which would be equivalent to 1280x720,tv_mode=hd720p
> > > > > > > >
> > > > > > > > So where's the field rate in "1280x720,tv_mode=hd720p"?
> > > > > > >
> > > > > > > Yeah, sorry I meant 1280x720@50,tv_mode=hd720p
> > > > > >
> > > > > > Above you said "I think the former would make more sense", so that
> > > > > > should be "1280x720,tv_mode=hd720p50"?
> > > > >
> > > > > No, 720p at 50Hz would be either hd720p50 or 1280x720@50,tv_mode=hd720p
> > > > > and 60Hz would be hd720p60 or 1280x720@60,tv_mode=hd720p
> > > >
> > > > I disagree: hd720p50 and hd720p60 are different TV modes.
> > >
> > > I agree, and I don't see how that command-line doesn't express that?
> >
> > Oh, I see what you mean: yes, it expresses that.
> > But it is inconsistent with the NTSC/PAL/SECAM/hd{480,576}[ip] modes,
> > where the TV mode specifies both number of lines and frame rate.
>
> Only if we're using a named mode, and naming is hard :)

That's not true: "640x480,tv_mode=PAL-N" would give me a mode with
625 lines and 25 frames/s, "640x480,tv_mode=PAL-M" would give me a
mode with 525 lines and 30 frames/s.

> Honestly, I'd be inclined to drop the hd* for now from this series. I
> don't have a hardware to test it with, for some we don't even have
> drivers that could implement these modes, we don't have a spec to work
> from, it looks like a recipe for failure :)

OK.

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
