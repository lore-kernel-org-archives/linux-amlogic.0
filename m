Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE401C00140
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Aug 2022 13:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=giT1CHQqmct24Rk0wPFllpN+N6gJyEH/VVHc7Bl+5Fk=; b=sN2dNNhdM2EXXh
	2KlKQaiZgDRrBbAXWVFX5PIzK0pmVCPMGQpbEw0SH8BtedYueByi6MppiqXu8DHLr+hZcMqwajOlo
	z0JVJmFWXq675AT0VGPT/Ko8r6B38U6a49ykyBCnq0Zo7VfJJNouBxQRZE0r0+8hnRMnjaDtTYNMq
	4w01huS63un/cjDk+uABM6uhLI2O2Wi4LPe6l52xm2GwI0ej7cz/+f73j+8cIVDf8p+B0DNy9GabO
	GD1UotZkvF+baxarGe47yT6mmqCDWInRAADUD/rV/Eh4OpdOEx0dZZFrhXH0tCuuNeIWuq8ovdjgK
	J1BpZ5W/HcWBs7LxrZ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOfcl-005RT3-8G; Thu, 18 Aug 2022 13:31:51 +0000
Received: from mail-qk1-f179.google.com ([209.85.222.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOf6G-004wCY-CC; Thu, 18 Aug 2022 12:58:18 +0000
Received: by mail-qk1-f179.google.com with SMTP id b2so987137qkh.12;
        Thu, 18 Aug 2022 05:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=JREs+R+hOdRL2M18w+Jk20r5RGbAGO+48abMsau2ww8=;
        b=gKbxNhl/E21Prrsu5/IP1kMyUdgxXr+lC42iSGciEuodNoP+ZSl0+U1aEn1zaj/nhA
         K5ccwg/BxWEwE9u9hyZBuJudbheWwmp1jHKd1XVb/fhgj1VgSYn7gmVuhNSeX3VG4nXL
         XDm1BQiK8IGYweqiZis2YGbMje/fqLRBi8O3e7EY8q5d1WzcHD1JsOtyAHiRWP7wRvnq
         S+++7e8F+QbsVNKcQg4jukmPBRuz2LQtifM+4RDiKJyXsxQuSTtEkjZLa2/uVMjK5BhE
         CI/Az/H+Oni5oTPZmK7OK4Yyr1qeIETJKfgEuc+a7cdU6lPDo38LkegGa3UIp1IKEfZz
         8/Pw==
X-Gm-Message-State: ACgBeo3ia06fpi/WejylwtxVlcrf151aliuMvK8FRtaET8M9s1ITHJa+
	GyCUnZbaom1ap6Yhc7cN8OOPCla1TyvYDQ==
X-Google-Smtp-Source: AA6agR6C7K00YiIbyLhXsF37xMz3YyW0w8gnvSz6e4z22A/rOkfHUoxq/iIGlX61J+6p0LidoxBrrA==
X-Received: by 2002:a05:620a:4587:b0:6bb:a6c6:14c5 with SMTP id bp7-20020a05620a458700b006bba6c614c5mr1828538qkb.362.1660827492314;
        Thu, 18 Aug 2022 05:58:12 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id x15-20020a05620a258f00b006baed8f3a2esm1442287qko.103.2022.08.18.05.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 05:58:10 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-33387bf0c4aso38157837b3.11;
        Thu, 18 Aug 2022 05:58:08 -0700 (PDT)
X-Received: by 2002:a25:cf83:0:b0:692:78ad:f44c with SMTP id
 f125-20020a25cf83000000b0069278adf44cmr2546178ybg.604.1660827488283; Thu, 18
 Aug 2022 05:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
 <CAMuHMdUrwzPYjA0wdR7ADj5Ov6+m03JbnY8fBYzRYyWDuNm5=g@mail.gmail.com>
 <20220816132636.3tmwqmrox64pu3lt@houat> <CAMuHMdUNLPbjs=usYQBim5FxsrC1oJLuF+3JB7auzHHRoOqavQ@mail.gmail.com>
 <20220817075351.4xpsqdngjgtiqvob@houat> <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
 <20220817131454.qcuywcuc4ts4hswm@houat> <CAMuHMdVPEgnnsY-4uuf=FDJ0YxWpch-0kZWFT_TZfcDvXLtwWQ@mail.gmail.com>
 <20220818123934.eim2bfrgbxsmviqx@houat>
In-Reply-To: <20220818123934.eim2bfrgbxsmviqx@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Aug 2022 14:57:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWXbHkrBZgsmUnU=q52+q7UZZNO3tgQW7Men+msQ1JDwQ@mail.gmail.com>
Message-ID: <CAMuHMdWXbHkrBZgsmUnU=q52+q7UZZNO3tgQW7Men+msQ1JDwQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220818_055816_466624_00801FAD 
X-CRM114-Status: GOOD (  40.09  )
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

On Thu, Aug 18, 2022 at 2:39 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Wed, Aug 17, 2022 at 04:01:48PM +0200, Geert Uytterhoeven wrote:
> > > I've looked around and it looks like the entire blanking area is
> > > supposed to be 40 pixels in interlaced, but I couldn't find anywhere how
> >
> > 625 lines - 575[*] visible lines = 50 lines.
> >
> > [*] BT.656 uses 576 visible lines as that's a multiple of 2, for splitting
> >      a frame in two fields of equal size.
> >
> > "visible" is relative, as it includes the overscan region.
> > Some PAL monitors used with computers had knobs to control width/height
> > and position of the screen, so you could make use of most or all of
> > the overscan region
>
> It brings back some memories :)
>
> > but on a real TV you're limited to ca. 640x512 (on PAL) which is what
> > an Amiga used by default (with a 14 MHz pixclock).
>
> > > it's supposed to be split between the upper and lower margins and the
> > > sync period.
> >
> > "Field Synchronization of PAL System" on
> > http://martin.hinner.info/vga/pal.html shows the split.
>
> Thanks, that's excellent as well.
>
> I'm mostly done with a function that creates a PAL mode, but I still
> have one question.
>
> If I understand well, the blanking period is made up (interlace) of 16
> pulses for the first field, 14 for the second, each pulse taking half a
> line. That amount to 30 pulses, so 15 lines.
>
> I first assumed that the pre-equalizing pulses would be the back porch,
> the long sync pulses the vsync, and the post-equalizing pulses the front
> porch. But... we're still missing 35 lines to amount to 625 lines, that
> seems to be counted in the field itself (305 lines == (575 + 35) / 2)
>
> So I guess my assumption was wrong to begin with.

The back porch is the number of lines between the last "visible" line
and the start of the synchronization pulse, i.e. "l" in the "Field
Synchronization of PAL System" drawing.
Virtual sync length is "m".
The front porch is the number of lines between the end of
the synchronization pulse, and the first "visible" line, i.e.
"j - l - m" (I think you used "n", thus missing lines 6-23 and 319-335).

> You seem to have used a fixed vsync in amifb to 4 lines, and I don't

Actually "m" is 2.5 lines in the first field, and 3 lines in the second field,
so "4" is not that much off of 2.5 + 3.

> understand how you come up with the upper and lower margins (or rather,
> how they are linked to what's described in that page)

These margins probably came from the Amiga hardware reference manual,
for the default 640x512 (PAL) and 640x400 (NTSC) modes.

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
