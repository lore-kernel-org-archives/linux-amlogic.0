Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E03C25B0E
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Aug 2022 15:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NzMap/gJrZvTaB04uM9OWSHoWCAEMnQkWR1h45UE+hI=; b=GbZi0py8hvoTTf
	5xXCjUTt2fGk9Gxf7/bHyx2DLWViVwR5nKv2v1ZnaNAf1QJBIGy0+LVqLhD88maJUre7hOgxIroqA
	aZLQDTOPsWl5i05wW0RyjPwBMMVZ3uZxaYOP/0HLKhvu2kcMvZUpOuCfKSlS18G8aW4t5lBEL6kDe
	KKvFSpCR9+devJDK2F4Qf6kdgtXfeyLtTm64Xg9EsZ0g8XCnOJoGTPCnNDwmvD4yLd8GbkckYkG7A
	3GQPOK8WJvQbJbl3XGlHIrQv8W9jskDp5tlhTaI0nzsiK/Bbvb0qBrnKxN3eYqSr29vGavzSwOtzO
	Ccq+IxWYbfUNm8II3G8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNy41-003fZS-Uw; Tue, 16 Aug 2022 15:01:05 +0000
Received: from mail-qt1-f171.google.com ([209.85.160.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNy3p-003fUM-RF; Tue, 16 Aug 2022 15:00:55 +0000
Received: by mail-qt1-f171.google.com with SMTP id h22so8296224qtu.2;
        Tue, 16 Aug 2022 08:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=5LUM7nzor1/XqC5vXK/cNLgsMpFS8BfigyHBrmKtMuQ=;
        b=pRkC73IZNg5x0/O/5l1c/AsV8OunJJp4U2zdETZBUlMwMQX1pznJbRBRg74KQwv+N1
         uIBmkDrXc8nG7AG7AD4P5/HNab0vxroxFsBjIyppsXjyDL+9lh5h/VytHjMWUqbaxTyK
         z7hiLdPCDPe86k+/I8RWmW/+ih9XeavWRX7vrAw0+6rBt9VItenkZ65cMmMpObsEApmR
         op/0sUQNrMDi0FJS16mSUvHNUPZI3dmLnZuCsOyBNSaFw8rgSk9CO0pbaJnFxR+mwglb
         9AT/tZAOPrUTFCS036vDlMakmXoJ0p52k/P+5mXV5bLYLsOhO6C//icKw12BjIqtmX+v
         Z2JQ==
X-Gm-Message-State: ACgBeo2GM3npa3rpnb3wOY52Wah2n8tsjCuCoayuU+x5t1lAwvA5zHNp
	EH+dEhbTwY85SZT6A05+YjncOEnyNhMVnA==
X-Google-Smtp-Source: AA6agR6ZSTDKdn2Ds7HSppDcibWUjnadZWG0pYUl1vPhqjmme6w/tXtLSmlFnYi4CO1zeAMGVgU9GA==
X-Received: by 2002:a05:622a:1c3:b0:344:56b5:f14b with SMTP id t3-20020a05622a01c300b0034456b5f14bmr10238842qtw.152.1660662051407;
        Tue, 16 Aug 2022 08:00:51 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id m18-20020a05620a24d200b006bacf4703c5sm11216255qkn.111.2022.08.16.08.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 08:00:50 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-333a4a5d495so48169787b3.10;
        Tue, 16 Aug 2022 08:00:50 -0700 (PDT)
X-Received: by 2002:a5b:bcd:0:b0:68f:b4c0:7eca with SMTP id
 c13-20020a5b0bcd000000b0068fb4c07ecamr130640ybr.202.1660662049765; Tue, 16
 Aug 2022 08:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
 <CAMuHMdUrwzPYjA0wdR7ADj5Ov6+m03JbnY8fBYzRYyWDuNm5=g@mail.gmail.com> <20220816132636.3tmwqmrox64pu3lt@houat>
In-Reply-To: <20220816132636.3tmwqmrox64pu3lt@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Aug 2022 17:00:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUNLPbjs=usYQBim5FxsrC1oJLuF+3JB7auzHHRoOqavQ@mail.gmail.com>
Message-ID: <CAMuHMdUNLPbjs=usYQBim5FxsrC1oJLuF+3JB7auzHHRoOqavQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220816_080053_918786_DFD764A3 
X-CRM114-Status: GOOD (  37.15  )
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

On Tue, Aug 16, 2022 at 3:26 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Fri, Aug 12, 2022 at 03:18:58PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Jul 29, 2022 at 6:35 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > Multiple drivers (meson, vc4) define the analog TV 525-lines and 625-lines
> > > modes in the drivers.
> >
> > Nit: strictly speaking these are not analog modes, but the digital
> > variants (ITU-R BT.656 and DVD-Video D1) of NTSC and PAL, using a
> > 13.5 MHz sampling frequency for pixels.
> >
> > In analog modes, the only discrete values are the number of lines, and
> > the frame/field rate (fixing the horizontal sync rate when combined).
> >
> > The number of (in)visible pixels per line depends on the available
> > bandwidth.  In a digital variant (which is anything generated by a
> > digital computer system), the latter depends on the pixel clock, which
> > can wildly differ from the 13.5 MHz used in the BT.656 standard. (e.g.
> > Amiga uses 7.09/14.19/28.38 MHz (PAL) or 7.16/14.32/28.64 MHz (NTSC)).
> >
> > So I think we probably need some way to generate a PAL/NTSC-compatible
> > mode based not only on resolution, but also on pixel clock.
>
> This would also fix the comments made by Jani and Thomas, so I quite
> like the idea of it.
>
> I'm struggling a bit to find how would could implement this though.
>
> From what you were saying, I guess the prototype would be something like
>
> struct drm_display_mode *drm_create_analog_mode(unsigned int pixel_clock,
>                                                 unsigned int lines,
>                                                 unsigned int frame_rate)
>
> But I have zero idea on what the implementation would be. Do you have
> some resources for this you could point me to?

Horizontally, I think you should calculate left/right margins and
hsync length to yield timings that match those for the BT.656 PAL/NTSC
modes.  I.e. when a 640x512 mode with a pixel clock of 14 MHz is
requested, you want to calculate left', right', and hslen' for

| <---- left' ---> | <- 640 pixels -> | <---- right' ---> | <--- hslen' --> |
                        @ 14 MHz

so they match the timings for left, right, and hslen for

| <--- left ---> | <--- 720 pixels ---> | <--- right ---> | <--- hslen ---> |
                        @ 13.5 MHz

As 640 pixels @ 14 MHz are less wide than 720 pixels @ 13.5 MHz,
you want to make sure to align the center of the visible part.

Vertically, it's simpler, as the number of lines is discrete.
You do have to take into account interlace and doublescan, and
progressive modes with 262/312 lines.

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
