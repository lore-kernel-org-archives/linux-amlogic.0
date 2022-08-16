Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F2CC25B0E
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Aug 2022 14:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xs4VyjRzIDD2OvI/2tzZFe341bUuteM60ovz+f+9ZmM=; b=EAWBgnEiqZL+Oy
	llxtNmQKNhyfFmLyIAR4HDvdTMG1jCrGVgzaRbFm71DH9T5ujNN+i8i5ZgwlSyOS1COb8X7l1HsDl
	+tuaWG8/78/la+TQ4ETyvk3VHWmy/3/rH6Lm7lwidBcmdIoSNEp0GqiUFNzeUaN+8DPoJgIPdj3jD
	tjSeTqUb9H5O4L1jqF7wzgYEWhEXEkLW2/BUe4bzLRXsQRut87HuuOhKEtNIsw5amDuNP5kqJkXa9
	3pEZ83hEvAZii3zghU7EUKgciCtXJ08KDSg9OCePbvbd8cxdf5Lr9cmJBNdQqeE+XKz8OFbnUXgS/
	tSbOSHpT459kTvYffWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNxoR-003Z8z-SY; Tue, 16 Aug 2022 14:44:59 +0000
Received: from mail-qk1-f176.google.com ([209.85.222.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNxoE-003Yzx-CQ; Tue, 16 Aug 2022 14:44:48 +0000
Received: by mail-qk1-f176.google.com with SMTP id n21so8257384qkk.3;
        Tue, 16 Aug 2022 07:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=tf29XLGj+1bd58LVE065Hm1nPqeAKMph377e+8mce68=;
        b=7cf2j0/rgVEgfgOqs/TZfTGOIJuCm4Ehax8VVbjOCkF4jAIQ/sBHkmuLvEJtoCPpgu
         LbqUchXSlV03q0zfyYHVJzRG6rOJtwhD1cMWf0ZGA5//l3jk6EJhT2rbMzZe8bCzUuJ5
         usSdfdPk+QLiQ88HRNzXUkH7pOjh9FFJCxtCeDlagwOMHntgU5oAUk1099E7tNsFKAzy
         Zs7lIFhIHoDwJ24YelJOoGQ+bhzUuI9P0olWwbfx0aArDD17GGshNpkAiC/p6uYc3psZ
         21DEeHo6Eu94NcC6kNg79G2Toit+yI8AKkb1w3RnDMUYrIiA4ABBf7m279V5vBU/s84J
         x50A==
X-Gm-Message-State: ACgBeo3xKTM2uDg7s7A5DoMAkD11Kgc8PZDlSjq3m9Mi43lamVjCN7p1
	yrxAjMiTiM1ymgXsHIKhYkyt+80ZJe2FMg==
X-Google-Smtp-Source: AA6agR7n1GCjJKxEgr+Ue+kUgqsVG40khVhFeoTfUxd/dMTCY7F+PqJzhJ3MhDQ/yyc824Q7Pr9ZLw==
X-Received: by 2002:a05:620a:21c1:b0:6bb:7ccf:6833 with SMTP id h1-20020a05620a21c100b006bb7ccf6833mr1038051qka.541.1660661083567;
        Tue, 16 Aug 2022 07:44:43 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id t6-20020a05620a450600b006bb366779a4sm5477675qkp.6.2022.08.16.07.44.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 07:44:42 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-32194238c77so157062867b3.4;
        Tue, 16 Aug 2022 07:44:42 -0700 (PDT)
X-Received: by 2002:a81:b812:0:b0:328:68e4:c886 with SMTP id
 v18-20020a81b812000000b0032868e4c886mr16448315ywe.502.1660661082059; Tue, 16
 Aug 2022 07:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-9-3d53ae722097@cerno.tech>
 <CAMuHMdUiMEybnhgxgBXh1Cbv6syVe9iVU=sb17zHM72R8A2Dew@mail.gmail.com> <20220816134624.cmb5s6i6pkdhu3qj@houat>
In-Reply-To: <20220816134624.cmb5s6i6pkdhu3qj@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Aug 2022 16:44:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMMaGS_pEZ4OTdXn8jvFnx-Rx81qPseGUeGUcSBqys8A@mail.gmail.com>
Message-ID: <CAMuHMdWMMaGS_pEZ4OTdXn8jvFnx-Rx81qPseGUeGUcSBqys8A@mail.gmail.com>
Subject: Re: [PATCH v1 09/35] drm/modes: Move named modes parsing to a
 separate function
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
X-CRM114-CacheID: sfid-20220816_074446_529436_AE94B6C0 
X-CRM114-Status: GOOD (  36.30  )
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

On Tue, Aug 16, 2022 at 3:46 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Fri, Aug 12, 2022 at 03:27:17PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Jul 29, 2022 at 6:36 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > The current construction of the named mode parsing doesn't allow to extend
> > > it easily. Let's move it to a separate function so we can add more
> > > parameters and modes.
> > >
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >
> > Thanks for your patch, which looks similar to my "[PATCH v2 2/5]
> > drm/modes: Extract drm_mode_parse_cmdline_named_mode()"
> > (https://lore.kernel.org/dri-devel/1371554419ae63cb54c2a377db0c1016fcf200bb.1657788997.git.geert@linux-m68k.org
> > ;-)
>
> Indeed, I forgot about that one, sorry :/
>
> I think I'd still prefer to have the check for refresh + named mode
> outside of the function, since I see them as an "integration" issue, not
> a parsing one.
>
> It's not the named mode parsing that fails, but the fact that we both
> have a valid refresh and a valid named mode.
>
> >
> > > --- a/drivers/gpu/drm/drm_modes.c
> > > +++ b/drivers/gpu/drm/drm_modes.c
> > > @@ -1773,6 +1773,28 @@ static const char * const drm_named_modes_whitelist[] = {
> > >         "PAL",
> > >  };
> > >
> > > +static bool drm_mode_parse_cmdline_named_mode(const char *name,
> > > +                                             unsigned int name_end,
> > > +                                             struct drm_cmdline_mode *cmdline_mode)
> > > +{
> > > +       unsigned int i;
> > > +
> > > +       for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
> > > +               int ret;
> > > +
> > > +               ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
> > > +               if (ret != name_end)
> > > +                       continue;
> > > +
> > > +               strcpy(cmdline_mode->name, drm_named_modes_whitelist[i]);
> > > +               cmdline_mode->specified = true;
> > > +
> > > +               return true;
> > > +       }
> > > +
> > > +       return false;
> >
> > What's the point in returning a value, if it is never checked?
> > Just make this function return void?
>
> Yeah, it's something I went back and forth to between the dev, and it's
> an artifact.
>
> I'll drop that patch, take your version and move the refresh check to
> drm_mode_parse_command_line_for_connector if that's alright for you?

Fine for me.

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
