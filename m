Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C509C25B08
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Aug 2022 07:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rhAvlPhiu3GUpNPCznu52twIaMg9PwQLzt2Euq2Gj6g=; b=AQllGuS/hwTb3R
	heHsrvsGHXL891hD65WYYIG38fGzjSV8OvwM9qHVB9VPRgOr1/YboeGsG3r3KrEXg6Xj41+wJ++md
	uL4QXw+g9p9LwDiWmmAJmc9s4t/uTH/lOYdw+9nKhDilb8FwSRhR6rb0NAKXmFuYzZjyu8gsEqNLN
	lu3+cPe1d6lsU1/j913aC068XYtoX04CGvZpOgQ7YaK2HneoSmEYcwkqCLDk3uJQlkJS2+Zu+y0wy
	ySNvR23Z2LARRwostmtrQqbklGH2cBzJ5jW82w3vMpKC8lC3FcyLQxT0EoN/j2xDG8tekgkLVMJkA
	iWgGdh++FxVA42vh7TMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oODXr-00DMP7-AK; Wed, 17 Aug 2022 07:32:55 +0000
Received: from mail-qk1-f175.google.com ([209.85.222.175])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oODXc-00DLll-Ld; Wed, 17 Aug 2022 07:32:42 +0000
Received: by mail-qk1-f175.google.com with SMTP id w18so4833667qki.8;
        Wed, 17 Aug 2022 00:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=EmmYkaITTcx08DyrSAVVZyC+XHKGDlOn1xahJdmIIc4=;
        b=GuoC+IFKP7Vay7o9q/u5hheQEydAjnc0tLytqJIc2dlHQn7r3OrJ8DrUGO+JkofuB8
         cqR6vHEeFrwLhIfBguqrFUsWstOIRvOqx+ZIyL6HOmzLUyod28E0iCPEOkxLtzf3172N
         G1btXRoxplxEteDfuwQzohcpDr99yvXrRGhs0ts1WiMCHgencNuuW+zS+USwuLXLya1e
         roTT7WdGnRHCPqlKx6/VZ7Eyva1b4yt/dCwtAisz3H8Kd6XHcF5OqIcmgbPY+KdVjct7
         2Vvy8wwM1tmG1sIZuTSh2+nBzlaehSMbry5sSRTu/Cxb6YHiA5jgeQ3hdp5if5rQTa1S
         KJ7g==
X-Gm-Message-State: ACgBeo3xq6WDUMVnWDppt5GA9aGc+5wkPwfVJoLRtn4QvZnk1P5vrT2I
	kCYlWBohLYhyz8eU3vQo+nCINDTzeLQlpg==
X-Google-Smtp-Source: AA6agR4dToz4YTe2TuarAlS+5WdRD8gxfdTcSdSd1GERJXbYE/eTBj/VdsjNBRy0/EaF6vGObWL1ew==
X-Received: by 2002:a37:755:0:b0:6ba:fcb7:1949 with SMTP id 82-20020a370755000000b006bafcb71949mr12411769qkh.590.1660721553734;
        Wed, 17 Aug 2022 00:32:33 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id b21-20020ae9eb15000000b006bb6c63114fsm2854479qkg.110.2022.08.17.00.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 00:32:33 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-335624d1e26so11173167b3.4;
        Wed, 17 Aug 2022 00:32:32 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr18128602ybq.543.1660721552542; Wed, 17
 Aug 2022 00:32:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <CAMuHMdWYo7M44uLNhTmJenGDreGALBZ9E48oyBDEeAuL=0h=dw@mail.gmail.com>
 <20220816132040.uwirtjm5yr6rdd3q@houat> <CAMuHMdWevP=3af=NneAJEDfOR+sz1thrQEhAQPNGrgitBtLjGA@mail.gmail.com>
 <20220816141116.5nuszmilqv2exdb3@houat> <CAMuHMdXq_xGPx46bdnUFGDiG4kcgdxtXaRGTucFd3TRq8353dg@mail.gmail.com>
 <20220816154956.pkdpxmmw27mia5ix@houat> <CAMuHMdX0L6cO_jYXKZTv0sm9V39Eiy_STiknSkdRQG4k-9GJeg@mail.gmail.com>
In-Reply-To: <CAMuHMdX0L6cO_jYXKZTv0sm9V39Eiy_STiknSkdRQG4k-9GJeg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Aug 2022 09:32:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGwPjpsNZhcNwtCgjt9qYfPUb6eaX2q3fE2n0n8uYwhg@mail.gmail.com>
Message-ID: <CAMuHMdWGwPjpsNZhcNwtCgjt9qYfPUb6eaX2q3fE2n0n8uYwhg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220817_003240_745677_8AFD2B41 
X-CRM114-Status: GOOD (  28.98  )
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

On Wed, Aug 17, 2022 at 9:31 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Aug 16, 2022 at 5:50 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > On Tue, Aug 16, 2022 at 04:43:44PM +0200, Geert Uytterhoeven wrote:
> > > > > > > Either you have to add them here (e.g. "hd720p50" and "hd720p60"), or
> > > > > > > handle them through "@<refresh>".  The latter would impact "[PATCH v1
> > > > > > > 09/35] drm/modes: Move named modes parsing to a separate function", as
> > > > > > > currently a named mode and a refresh rate can't be specified both.
> > > > > >
> > > > > > I think the former would make more sense. It simplifies a bit the
> > > > > > parser, and we're going to use a named mode anyway.
> > > > > >
> > > > > > > As "[PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
> > > > > > > command-line option" uses a separate "tv_mode" option, and not the main
> > > > > > > mode name, I think you want to add them here.
> > > > > >
> > > > > > It's a separate story I think, we could have a named mode hd720p50,
> > > > > > which would be equivalent to 1280x720,tv_mode=hd720p
> > > > >
> > > > > So where's the field rate in "1280x720,tv_mode=hd720p"?
> > > >
> > > > Yeah, sorry I meant 1280x720@50,tv_mode=hd720p
> > >
> > > Above you said "I think the former would make more sense", so that
> > > should be "1280x720,tv_mode=hd720p50"?
> >
> > No, 720p at 50Hz would be either hd720p50 or 1280x720@50,tv_mode=hd720p
> > and 60Hz would be hd720p60 or 1280x720@60,tv_mode=hd720p
>
> I disagree: hd720p50 and hd720p60 are different TV modes.
> Treating them the same would be similar to treating unmodulated (e.g.
> component) PAL-N (25 frames/s) and PAL-M (30 frames/s) the same.

IIRC from my PS3 -Linux days, not all HD(-Ready) TVs supported both
hd720p50 and hd720p60.

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
