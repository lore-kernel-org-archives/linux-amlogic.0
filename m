Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88195C00140
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Aug 2022 15:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q8Kpk8bL5onLM2n2CycqqqSJDXtAjXQmNhzWa6Rzu04=; b=mI6reRzkMA2y0T
	T5nxFbg9Ah0Rf3LeO13EPt2E9F8H7ybXQyFKogp8A5MWEpVinosyDPm52q4sdmqlbjOXElm5w3itH
	tQbY6wv46tc2lHZfuJtJ/oij+g2463lDMZrt4LZYME4cTxmodeylgmgzQnxZxLuiUKrBr7EDeNrpc
	vu9Z8sKIQFBAkHateRpoenKP5kIU1BfpESWcWeR7xNQWLd5ad/ikjge4s9Mf1GZTdBYDVjOA/hd1V
	WTFl8jnTINfjx7l+4mf3baLfpDAbzMb7sT7g3HZs7MtjdXUswcxIb64BObFpj2xg+LD1OBt7vQ/HL
	De+O1J+/EvnBGU4urjQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOhtI-006rXq-Es; Thu, 18 Aug 2022 15:57:04 +0000
Received: from mail-qk1-f172.google.com ([209.85.222.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOht7-006rUi-I3; Thu, 18 Aug 2022 15:56:55 +0000
Received: by mail-qk1-f172.google.com with SMTP id f14so1445483qkm.0;
        Thu, 18 Aug 2022 08:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Bxc+m3Zk+4Bct+cVi+3Jt/UsQ5UzvU/3z9/2O8qvP0c=;
        b=4dOvIJXYtPCqlXx3LM73Eb5PNg85gjiC/M3qLAPUAYoie+asZ6ercVLAo/PYStPrCy
         i6v4TdcSu4xJUpMVwT7fLQTTI5bPlSaCJzq9rxJkds5SptZXzQyKiD3rQ6sX0Ume8g36
         lGzPH4fN0svMqwFm0SgTlan4dJhQ2AYTaYe2OFhcwFaUwLhnCLYuoQkO9MHajLpr3wxI
         Ud2DTXdjX8DjE4n5CRh2snSO8W4LhmlT6l8svtefpsuZdpztsN3HqfzSZu6dCt1VaXou
         M3m1T6d21BhlzrJjO79XovFmoiHU51lt9FV+Plxdda+L3RgZ7QaPowFNVoZEv6+cTx8/
         q0sA==
X-Gm-Message-State: ACgBeo20DIaLBb5DMfYuW4TR03C3YeELlSqnDPR9vscutZD4EJvgnLWT
	kMU05tagIUP0IgnGqQWeEhgJjFuwyXu2zg==
X-Google-Smtp-Source: AA6agR66DqYayPwaSPXv+IifE+rYAfb9ZG7Mt6D5r/ts5G3R776x5syEppHupJsAU44rtfYwxEHMRQ==
X-Received: by 2002:a05:620a:4886:b0:6bb:238f:6ec with SMTP id ea6-20020a05620a488600b006bb238f06ecmr2517480qkb.740.1660838209874;
        Thu, 18 Aug 2022 08:56:49 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id x8-20020a05620a258800b006b9a89d408csm1736503qko.100.2022.08.18.08.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 08:56:48 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-3321c2a8d4cso52663747b3.5;
        Thu, 18 Aug 2022 08:56:48 -0700 (PDT)
X-Received: by 2002:a25:250b:0:b0:68f:425b:3ee0 with SMTP id
 l11-20020a25250b000000b0068f425b3ee0mr3505302ybl.89.1660838207734; Thu, 18
 Aug 2022 08:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220816132636.3tmwqmrox64pu3lt@houat> <CAMuHMdUNLPbjs=usYQBim5FxsrC1oJLuF+3JB7auzHHRoOqavQ@mail.gmail.com>
 <20220817075351.4xpsqdngjgtiqvob@houat> <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
 <20220817131454.qcuywcuc4ts4hswm@houat> <CAMuHMdVPEgnnsY-4uuf=FDJ0YxWpch-0kZWFT_TZfcDvXLtwWQ@mail.gmail.com>
 <20220818123934.eim2bfrgbxsmviqx@houat> <CAMuHMdWXbHkrBZgsmUnU=q52+q7UZZNO3tgQW7Men+msQ1JDwQ@mail.gmail.com>
 <20220818134200.cr22bftmjn226ehn@houat> <CAMuHMdX6dyQaB34oeXwiCa2rDkxks0qNh=ekqh7Wd2kSNED9TA@mail.gmail.com>
 <20220818154641.ouvrar5s74qu74zn@houat>
In-Reply-To: <20220818154641.ouvrar5s74qu74zn@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Aug 2022 17:56:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUjE0mwu8z5AksW4h1OwzDCQ5h1ZoCWDi+rC4p2Pu5O4g@mail.gmail.com>
Message-ID: <CAMuHMdUjE0mwu8z5AksW4h1OwzDCQ5h1ZoCWDi+rC4p2Pu5O4g@mail.gmail.com>
Subject: Re: [PATCH v1 04/35] drm/modes: Introduce 480i and 576i modes
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
X-CRM114-CacheID: sfid-20220818_085653_642556_9618896F 
X-CRM114-Status: GOOD (  36.47  )
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

On Thu, Aug 18, 2022 at 5:46 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Thu, Aug 18, 2022 at 05:34:30PM +0200, Geert Uytterhoeven wrote:
> > On Thu, Aug 18, 2022 at 3:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > I started adding more sanity checks to my code, and I just realised I
> > > don't seem to be able to reach 720 pixels over a single line though. If
> > > I understood it properly, and according to [1] the active part of a line
> > > is supposed to be 51.95us, and the blanking period taking 12.05us. [2]
> > > in the timing section has pretty much the same numbers, so it looks
> > > sane.
> > >
> > > At 13.5Mhz, a pixel is going to take roughly 74ns, and 51950 / 74 = 702
> > > pixels
> > >
> > > It seems we can go push it to 52350 ns, but that still gives us only 706
> > > pixels.
> > >
> > > Similarly, if I just choose to ignore that limit and just take the
> > > active time I need, 720 * 74 = 53280ns
> > >
> > > That leaves us 10720ns for the blanking period, and that's not enough to
> > > fit even the minimum of the front porch, hsync and back porch (1.55 +
> > > 4.5 + 5.5 = 11.55us).
> > >
> > > Are those constraints merely recommendations, or am I missing something?
> >
> > You are missing that the parts near the borders of the full image are
> > part of the overscan range, and may or may not be visible, depending
> > on your actual display.
> > The full 768x576 image size from BT.656 is not visible on a typical PAL display,
> > and is more of an "absolute maximum rating", guaranteed to cover more
> > than analog PAL.
>
> So the overscan range is not part of the active area, unlike what HDMI
> is doing for example?

Indeed. DVI-D and HDMI etc. are pure digital (let's ignore they are a
digitized variant of old analog VGA ;-), hence there is a one-to-one
match between pixels in the image and pixels on the screen (ignoring
scaling).  But even when using an analog VGA input on a modern
digital display, you have controls to e.g. move the image.

> Is there some minimal timings available somewhere to fit those absolute
> maximum ratings?

I guess they can be found on the Internet...

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
