Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC840C32772
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Aug 2022 15:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ohlSiv+cJpzo/X/dQWniepORQ4F492Hir0A/0NsuniU=; b=wdC8qaHKOAVgOH
	m03UPjQ4cCE1tcJcOJ/4XN+aGdIkcKgds+zjvC2DlXDJtalUMrXpcXZ1a9tkKlp89hmYezXnTctSN
	9N5u53omnsXpnDNLWtdVeo1jKZ7C63McI6OcUN7nGJTJWPRLcN2JrkIVd9uuuZGZVuNO01LZOV6tj
	aK0dpQHKW0n5LmIxJpKTnS0WEJmrx+mfjZHOvI9Y3qyrXWLmY+7fitnvCIZU8v+ELmvROqQIMlefv
	WNDTRXBq01u69qzsrfNcE4aX6uppecANG94QPnGBnrv2cIX/oSQfwjm0zk20jvan6DUqyV8mabLCP
	fcW3pvDboKooOwLHO34w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOhV0-006ehI-Le; Thu, 18 Aug 2022 15:31:58 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOhRd-006cuv-7p; Thu, 18 Aug 2022 15:28:30 +0000
Received: by mail-ot1-f54.google.com with SMTP id y10-20020a9d634a000000b006167f7ce0c5so1338209otk.0;
        Thu, 18 Aug 2022 08:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=T9A28BLo2B0nLzuZtZ0Ejl0zLIHzqGciO6GeX7JAOrM=;
        b=uvoiYCIMdeG20he4sFjChp/qLNp5HAZTJzjwfyffOAZc1qr+/2xhI4W0r66JnEsf/5
         EzmkwzvsRikToWTv5IAOmidOlPvAa1T7LcXe6mXIoT08HPqSyhBgYRn4f77EDLFm3zBM
         zD8ONI6kBCwOCztf6mW2t8sj3cVNcbsxc/g11tIdCQx3nJhM8SVM9HB8MgPmW4Mvf11e
         hBOvE382qdAUzQKr6k3Kd5RVKkUGq81EVtay7rMRPkUTqRNXZPZm7XksiOm5d3+nFgmM
         UZ4UGsTZ4ytAvVgHXCcMJWHBSlSy2iQIx6wzwBty3mXWUbz0TMPfnW2RluUl3c0aw8iB
         xezw==
X-Gm-Message-State: ACgBeo0Yod8qnHXj3o6T3xNw/j+Lnsa4/nWpRpJzfC3Ta4I6eqfHUlA7
	FvgfiiBX+7osmvtSpKv2t5pO31+KgSwaKA==
X-Google-Smtp-Source: AA6agR6h8ABV530CS9S/Pv7gMEg2fAHD/0RsCHgk5ag0FP62YrwKbvaPyIi4NRQsAG9hL5b47MZmCw==
X-Received: by 2002:a05:6830:448a:b0:638:cd7d:6575 with SMTP id r10-20020a056830448a00b00638cd7d6575mr1312832otv.282.1660836507626;
        Thu, 18 Aug 2022 08:28:27 -0700 (PDT)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com. [209.85.161.53])
        by smtp.gmail.com with ESMTPSA id 15-20020a9d060f000000b00636cc9926dbsm481252otn.40.2022.08.18.08.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 08:28:27 -0700 (PDT)
Received: by mail-oo1-f53.google.com with SMTP id d12-20020a4aeb8c000000b004214e709b72so410982ooj.6;
        Thu, 18 Aug 2022 08:28:27 -0700 (PDT)
X-Received: by 2002:a25:250b:0:b0:68f:425b:3ee0 with SMTP id
 l11-20020a25250b000000b0068f425b3ee0mr3357401ybl.89.1660836055065; Thu, 18
 Aug 2022 08:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220816141116.5nuszmilqv2exdb3@houat> <CAMuHMdXq_xGPx46bdnUFGDiG4kcgdxtXaRGTucFd3TRq8353dg@mail.gmail.com>
 <20220816154956.pkdpxmmw27mia5ix@houat> <CAMuHMdX0L6cO_jYXKZTv0sm9V39Eiy_STiknSkdRQG4k-9GJeg@mail.gmail.com>
 <20220817074710.w4c4xwj7edly2b5p@houat> <CAMuHMdXeBakWr6geOWGxnjQYaU9Pi4tRvVFFtubyMJZTT2nPnw@mail.gmail.com>
 <20220817111454.pn2iltvyo2drebq7@houat> <CAMuHMdU57g1rNoLo65jhLK8mk4YkNEbMz1E7XKWk2dnCxTr=gg@mail.gmail.com>
 <20220817131854.jwmhqvhfhp77bbr3@houat> <CAMuHMdXrfH9MArXesfNCvqayiq17u7XaqtSvXTNt4V10=obSHQ@mail.gmail.com>
 <20220818145436.vqojnhmvhjxdzooe@houat>
In-Reply-To: <20220818145436.vqojnhmvhjxdzooe@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Aug 2022 17:20:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW5kTUeg59fym7QxfN5oisTZHWbiAPeSYKJVShZWduJcA@mail.gmail.com>
Message-ID: <CAMuHMdW5kTUeg59fym7QxfN5oisTZHWbiAPeSYKJVShZWduJcA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220818_082829_328468_5AB6A4DE 
X-CRM114-Status: GOOD (  40.94  )
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

On Thu, Aug 18, 2022 at 4:54 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Wed, Aug 17, 2022 at 04:04:24PM +0200, Geert Uytterhoeven wrote:
> > On Wed, Aug 17, 2022 at 3:19 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > On Wed, Aug 17, 2022 at 03:05:52PM +0200, Geert Uytterhoeven wrote:
> > > > On Wed, Aug 17, 2022 at 1:15 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > On Wed, Aug 17, 2022 at 10:35:07AM +0200, Geert Uytterhoeven wrote:
> > > > > > On Wed, Aug 17, 2022 at 9:47 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > > > On Wed, Aug 17, 2022 at 09:31:18AM +0200, Geert Uytterhoeven wrote:
> > > > > > > > On Tue, Aug 16, 2022 at 5:50 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > > > > > On Tue, Aug 16, 2022 at 04:43:44PM +0200, Geert Uytterhoeven wrote:
> > > > > > > > > > > > > > Either you have to add them here (e.g. "hd720p50" and "hd720p60"), or
> > > > > > > > > > > > > > handle them through "@<refresh>".  The latter would impact "[PATCH v1
> > > > > > > > > > > > > > 09/35] drm/modes: Move named modes parsing to a separate function", as
> > > > > > > > > > > > > > currently a named mode and a refresh rate can't be specified both.
> > > > > > > > > > > > >
> > > > > > > > > > > > > I think the former would make more sense. It simplifies a bit the
> > > > > > > > > > > > > parser, and we're going to use a named mode anyway.
> > > > > > > > > > > > >
> > > > > > > > > > > > > > As "[PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
> > > > > > > > > > > > > > command-line option" uses a separate "tv_mode" option, and not the main
> > > > > > > > > > > > > > mode name, I think you want to add them here.
> > > > > > > > > > > > >
> > > > > > > > > > > > > It's a separate story I think, we could have a named mode hd720p50,
> > > > > > > > > > > > > which would be equivalent to 1280x720,tv_mode=hd720p
> > > > > > > > > > > >
> > > > > > > > > > > > So where's the field rate in "1280x720,tv_mode=hd720p"?
> > > > > > > > > > >
> > > > > > > > > > > Yeah, sorry I meant 1280x720@50,tv_mode=hd720p
> > > > > > > > > >
> > > > > > > > > > Above you said "I think the former would make more sense", so that
> > > > > > > > > > should be "1280x720,tv_mode=hd720p50"?
> > > > > > > > >
> > > > > > > > > No, 720p at 50Hz would be either hd720p50 or 1280x720@50,tv_mode=hd720p
> > > > > > > > > and 60Hz would be hd720p60 or 1280x720@60,tv_mode=hd720p
> > > > > > > >
> > > > > > > > I disagree: hd720p50 and hd720p60 are different TV modes.
> > > > > > >
> > > > > > > I agree, and I don't see how that command-line doesn't express that?
> > > > > >
> > > > > > Oh, I see what you mean: yes, it expresses that.
> > > > > > But it is inconsistent with the NTSC/PAL/SECAM/hd{480,576}[ip] modes,
> > > > > > where the TV mode specifies both number of lines and frame rate.
> > > > >
> > > > > Only if we're using a named mode, and naming is hard :)
> > > >
> > > > That's not true: "640x480,tv_mode=PAL-N" would give me a mode with
> > > > 625 lines and 25 frames/s, "640x480,tv_mode=PAL-M" would give me a
> > > > mode with 525 lines and 30 frames/s.
> > >
> > > In that series, "640x480,tv_mode=PAL-N" would be rejected as invalid:
> > >
> > > https://lore.kernel.org/dri-devel/20220728-rpi-analog-tv-properties-v1-14-3d53ae722097@cerno.tech/
> >
> > It would become supported once the ideas from thread "[PATCH v1 04/35]
> > drm/modes: Introduce 480i and 576i modes" are implemented...
>
> Indeed, but I'm still not sure what your concern is here.
> "640x480,tv_mode=PAL-N" and "640x480,tv_mode=PAL-M" are both fairly
> obvious.
>
> You were initially saying that you had concern over the inconsistency of
> NTSC/PAL/SECAM where the TV mode would specify a number of lines and
> frame rate, but hd720p50 also specifies a number of line and frame rate?

My concern is that you want to call the TV mode "hd720p", which
does not dictate the frame rate.
I would like to have both "720p50" and "720p60", as they do dictate
the frame rate, like all the non-hd modes.

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
